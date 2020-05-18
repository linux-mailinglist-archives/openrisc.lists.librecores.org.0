Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3C38A1E5051
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08B4020CD0;
	Wed, 27 May 2020 23:19:45 +0200 (CEST)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2092.outbound.protection.outlook.com [40.107.236.92])
 by mail.librecores.org (Postfix) with ESMTPS id 6E14320A46
 for <openrisc@lists.librecores.org>; Mon, 18 May 2020 23:39:11 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VM7oyBqSK8RwYLPoLbUCgdgREU450FWTuin4vgFVEVZIgUUAq1zV7PRGxAgKPyk4Ec8Wzz8zjduotEWqMWwPy5KQi7233A7hHdQSvOEDV7v4eB1yggROrBb8zrFIsUL9FPthYhnIgMF73PN9sCIux+X+RZn46ciFevLvVov2Ugr4NeLhX/BWsgOMpESRqcKsWs0lysnKuXBW61E+AXwoswfEIKK8KS6ZAjsPkDH21H0rbg07zSZS8SNF8Ix9p3IyQs0wFFIrIesRNZmcoQeFULATzqMb2q5GqeYnyBpf1Qlz0YlcgAjXwijTshhaJc8UiSBblhFdv+XQE3XhQCt7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzT8HcCmD0Xp9iJHM3Uy2tk2M3NOXSrnwHBwmtYoMrs=;
 b=Gh+Rk9h10nIbUuTt6cvFwhh63yAAM6kerO+lnvrS0+p0q3dHOk67SCYM6XWf8u4oetqjry8vswxgaWoQL8xeSVHH3vVU0J7KMgLElWUz4bFFB/DhzUpB4do8oYB4SckI9o/x4zRWO2iJbGzA7VHJyK/aWNAaeMnQuy0ggj4BGCg0ogDdKgWqbiltWaRn+A8gBpJi9rQ9GWDM05nbHIOeDyOff6hxL3Dkz56L5KLezLPZOjX6k5l8TkUrYMxlh99aZ1LMyWjtMwcjeWeM4ZO5iwwB42H39e6WOoZuqbp/F/nETq6Y4u8n0c2DFyb1RgxpjJ3e5FrSmTCaPRbQSez3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzT8HcCmD0Xp9iJHM3Uy2tk2M3NOXSrnwHBwmtYoMrs=;
 b=L1suG6yg2K9AQUSP1ddSpQ0hr7pkCmqAyZKF+0YTJd3OlXvU2IWb7Q4ARr4rz3hr59B9UJ6oshXxLkjz3k2yKN/MI+wV2Eoj9O7D5WKkoDpUi1lo0P/6aUmDe7+TwjYd8bqdMltkzILj1Efgeo/18zA8WgfYoERIVOGYbGxuD7M=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from BYAPR01MB5494.prod.exchangelabs.com (2603:10b6:a03:127::30) by
 BYAPR01MB5398.prod.exchangelabs.com (2603:10b6:a03:124::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24; Mon, 18 May 2020 21:39:08 +0000
Received: from BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::f5d6:2057:2508:fbd8]) by BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::f5d6:2057:2508:fbd8%3]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 21:39:07 +0000
To: Baoquan He <bhe@redhat.com>, Mike Rapoport <rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
 <20200423011312.GY4247@MiWiFi-R3L-srv>
From: Hoan Tran <hoan@os.amperecomputing.com>
Message-ID: <84f572b2-9e61-f9d1-008d-47ac978f5ccc@os.amperecomputing.com>
Date: Mon, 18 May 2020 14:38:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
In-Reply-To: <20200423011312.GY4247@MiWiFi-R3L-srv>
Content-Language: en-US
X-ClientProxiedBy: CY4PR22CA0095.namprd22.prod.outlook.com
 (2603:10b6:903:ad::33) To BYAPR01MB5494.prod.exchangelabs.com
 (2603:10b6:a03:127::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.138] (67.161.31.237) by
 CY4PR22CA0095.namprd22.prod.outlook.com (2603:10b6:903:ad::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Mon, 18 May 2020 21:38:54 +0000
X-Originating-IP: [67.161.31.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072a96ea-83bd-44ed-0900-08d7fb73e492
X-MS-TrafficTypeDiagnostic: BYAPR01MB5398:
X-Microsoft-Antispam-PRVS: <BYAPR01MB5398388EA4C80407F8CA1B2DF1B80@BYAPR01MB5398.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wW8KfoS04y9O4OsqvSRvqE4Q4hSURo2QRNkkFwyHcOGw++GpgkG/YjHI88b2lajNH/AYNklRRvBajYeoIVzd3TiR7aEntGuLRPjVMk5+IZEZVK+qQ+ANe7jbaf1cA3IbC59Y4GyrOM04zvVfGsYrFEdCq+hrR4/vHGpRZPgGON24obOS9qVdxGWy+Tb6BLRSnn/6wYI28mfU45tb5ZSP3tajByx2D3PD/om4bB34VG/U+aAsJtlfVu16KBJpPSjReLa6VcC4nGAxMBV9ve+3SkLkqJ36Xp+ewi+LId3cv3wmhOQbLtZqsrKqE5Qz89iCnHGlUZnFc7bGMz074+TuMgDD301BG8FuBtkDpEa6D87uUOATJ8aFG3Uj4MKjBwvgcmHD1AHCN+lkH7tQGD5NFjvlxyn6w/suhXCbLsVqNqTs1nOPPFhfcu6RARij/EPBUbr92wRtTauWE2Wv5d+mpBHYFcFHBl8HUJosFtENArXJoDX3UkZyg3ljT2dCeTPb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB5494.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39840400004)(136003)(376002)(346002)(366004)(396003)(54906003)(110136005)(478600001)(316002)(16576012)(86362001)(2906002)(7406005)(7416002)(16526019)(31696002)(7366002)(6666004)(6486002)(186003)(4326008)(66946007)(52116002)(8676002)(66476007)(66556008)(26005)(31686004)(8936002)(956004)(2616005)(53546011)(5660300002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: Cw1D1iWlSiM5bAzZp73gwYtfOFCq6lsvpjrtNXgLW2xN13EH2PZ/LpWpXtR8CfE042IzcSKhwZC3Hvst1BNnRanDssCmsWcFKh3wspWQaEOnJYkdBA6KVL4oTupOppKD0hX+ZOAzgzfkj/wWMq0DevpDdKb7cvUdzDb+58ka3W1KjCAXSZ05zsJvjwx0MQcAlt5QEjgboynrK2cDSz+hojyoCI03k+1G7s2NvFj70l2dupF0W4zEota6E+7SajSqJ7j8t0l9u17/ZnSgkpjMVA/IIz90IhlNvRGAl7dTTFdv9KbTk2zsIFO41fAbxOCBeY5wjjHPM0sNck8x8k9rZ0vbUQ0GLmNtlwhEalMq+t56zRptVlySNeDionROkg1WfkZRGVixhSBR9Sw/g4VlNCjEDqdEHJuqtR6B3DicGhA9uSEWMobycZWngRE+unIeamPutj+yrrAkSXlYKo74RyFlrrMCCLFXam8EMA5lfmI=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072a96ea-83bd-44ed-0900-08d7fb73e492
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 21:39:07.5548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfg3VUK+MC4HQYCJWhf2lM45ELIl1ue3+m68wQN+sOFb8JhTDnanF3Y5wMTvkJ0AwTKv7ZEjbWKz07uEqAtBdTgp8WO2XxN0XFduZ7oaOmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5398
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Discussion around the OpenRISC processor
 <openrisc.lists.librecores.org>
List-Unsubscribe: <https://lists.librecores.org/options/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=unsubscribe>
List-Archive: <http://lists.librecores.org/pipermail/openrisc/>
List-Post: <mailto:openrisc@lists.librecores.org>
List-Help: <mailto:openrisc-request@lists.librecores.org?subject=help>
List-Subscribe: <https://lists.librecores.org/listinfo/openrisc>,
 <mailto:openrisc-request@lists.librecores.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgTWlrZSBhbmQgQmFvcXVhbiwKCk9uIDQvMjIvMjAgNjoxMyBQTSwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwNC8xMi8yMCBhdCAxMDo0OHBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+PiBGcm9t
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4+Cj4+IFRoZSBjb21taXQgZjQ3
YWMwODhjNDA2ICgibW06IG1lbW1hcF9pbml0OiBpdGVyYXRlIG92ZXIgbWVtYmxvY2sgcmVnaW9u
cwo+IAo+IFRoaXMgY29tbWl0IGlkIHNob3VsZCBiZSBhIHRlbXBvcmFyeSBvbmUsIHdpbGwgYmUg
Y2hhbmdlZCB3aGVuIG1lcmdlZAo+IGludG8gbWFpbnRhaW5lcidzIHRyZWUgYW5kIGxpbnVzJ3Mg
dHJlZS4gT25seSBzYXlpbmcgbGFzdCBwYXRjaCBwbHVzIHRoZQo+IHBhdGNoIHN1YmplY3QgaXMg
T0s/Cj4gCj4+IHJhdGhlciB0aGF0IGNoZWNrIGVhY2ggUEZOIikgbWFkZSBlYXJseV9wZm5faW5f
bmlkKCkgb2Jzb2xldGUgYW5kIHNpbmNlCj4+IENPTkZJR19OT0RFU19TUEFOX09USEVSX05PREVT
IGlzIG9ubHkgdXNlZCB0byBwaWNrIGEgc3R1YiBvciBhIHJlYWwKPj4gaW1wbGVtZW50YXRpb24g
b2YgZWFybHlfcGZuX2luX25pZCgpIGl0IGlzIGFsc28gbm90IG5lZWRlZCBhbnltb3JlLgo+Pgo+
PiBSZW1vdmUgYm90aCBlYXJseV9wZm5faW5fbmlkKCkgYW5kIHRoZSBDT05GSUdfTk9ERVNfU1BB
Tl9PVEhFUl9OT0RFUy4KPj4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBIb2FuIFRyYW4gPEhvYW5Ab3Mu
YW1wZXJlY29tcHV0aW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSG9hbiBUcmFuIDxIb2FuQG9z
LmFtcGVyZWNvbXB1dGluZy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgfCAgOSAt
LS0tLS0tLS0KPj4gICBhcmNoL3NwYXJjL0tjb25maWcgICB8ICA5IC0tLS0tLS0tLQo+PiAgIGFy
Y2gveDg2L0tjb25maWcgICAgIHwgIDkgLS0tLS0tLS0tCj4+ICAgbW0vcGFnZV9hbGxvYy5jICAg
ICAgfCAyMCAtLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNDcgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gv
cG93ZXJwYy9LY29uZmlnCj4+IGluZGV4IDVmODZiMjJiN2QyYy4uNzRmMzE2ZGVlYWUxIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Bvd2VycGMvS2Nv
bmZpZwo+PiBAQCAtNjg1LDE1ICs2ODUsNiBAQCBjb25maWcgQVJDSF9NRU1PUllfUFJPQkUKPj4g
ICAJZGVmX2Jvb2wgeQo+PiAgIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCj4+ICAgCj4+IC0j
IFNvbWUgTlVNQSBub2RlcyBoYXZlIG1lbW9yeSByYW5nZXMgdGhhdCBzcGFuCj4+IC0jIG90aGVy
IG5vZGVzLiAgRXZlbiB0aG91Z2ggYSBwZm4gaXMgdmFsaWQgYW5kCj4+IC0jIGJldHdlZW4gYSBu
b2RlJ3Mgc3RhcnQgYW5kIGVuZCBwZm5zLCBpdCBtYXkgbm90Cj4+IC0jIHJlc2lkZSBvbiB0aGF0
IG5vZGUuICBTZWUgbWVtbWFwX2luaXRfem9uZSgpCj4+IC0jIGZvciBkZXRhaWxzLgo+PiAtY29u
ZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMKPj4gLQlkZWZfYm9vbCB5Cj4+IC0JZGVwZW5kcyBv
biBORUVEX01VTFRJUExFX05PREVTCj4+IC0KPj4gICBjb25maWcgU1REQklOVVRJTFMKPj4gICAJ
Ym9vbCAiVXNpbmcgc3RhbmRhcmQgYmludXRpbHMgc2V0dGluZ3MiCj4+ICAgCWRlcGVuZHMgb24g
NDR4Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL0tjb25maWcgYi9hcmNoL3NwYXJjL0tjb25m
aWcKPj4gaW5kZXggNzk1MjA2YjdiNTUyLi4wZTRmMzg5MWI5MDQgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvc3BhcmMvS2NvbmZpZwo+PiArKysgYi9hcmNoL3NwYXJjL0tjb25maWcKPj4gQEAgLTI4Niwx
NSArMjg2LDYgQEAgY29uZmlnIE5PREVTX1NISUZUCj4+ICAgCSAgU3BlY2lmeSB0aGUgbWF4aW11
bSBudW1iZXIgb2YgTlVNQSBOb2RlcyBhdmFpbGFibGUgb24gdGhlIHRhcmdldAo+PiAgIAkgIHN5
c3RlbS4gIEluY3JlYXNlcyBtZW1vcnkgcmVzZXJ2ZWQgdG8gYWNjb21tb2RhdGUgdmFyaW91cyB0
YWJsZXMuCj4+ICAgCj4+IC0jIFNvbWUgTlVNQSBub2RlcyBoYXZlIG1lbW9yeSByYW5nZXMgdGhh
dCBzcGFuCj4+IC0jIG90aGVyIG5vZGVzLiAgRXZlbiB0aG91Z2ggYSBwZm4gaXMgdmFsaWQgYW5k
Cj4+IC0jIGJldHdlZW4gYSBub2RlJ3Mgc3RhcnQgYW5kIGVuZCBwZm5zLCBpdCBtYXkgbm90Cj4+
IC0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBTZWUgbWVtbWFwX2luaXRfem9uZSgpCj4+IC0jIGZv
ciBkZXRhaWxzLgo+PiAtY29uZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMKPj4gLQlkZWZfYm9v
bCB5Cj4+IC0JZGVwZW5kcyBvbiBORUVEX01VTFRJUExFX05PREVTCj4+IC0KPj4gICBjb25maWcg
QVJDSF9TUEFSU0VNRU1fRU5BQkxFCj4+ICAgCWRlZl9ib29sIHkgaWYgU1BBUkM2NAo+PiAgIAlz
ZWxlY3QgU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxFCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9L
Y29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+PiBpbmRleCA5ZDNlOTViNGZiODUuLjM3ZGFjMDk1
NjU5ZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC94ODYvS2NvbmZpZwo+PiArKysgYi9hcmNoL3g4Ni9L
Y29uZmlnCj4+IEBAIC0xNTgxLDE1ICsxNTgxLDYgQEAgY29uZmlnIFg4Nl82NF9BQ1BJX05VTUEK
Pj4gICAJLS0taGVscC0tLQo+PiAgIAkgIEVuYWJsZSBBQ1BJIFNSQVQgYmFzZWQgbm9kZSB0b3Bv
bG9neSBkZXRlY3Rpb24uCj4+ICAgCj4+IC0jIFNvbWUgTlVNQSBub2RlcyBoYXZlIG1lbW9yeSBy
YW5nZXMgdGhhdCBzcGFuCj4+IC0jIG90aGVyIG5vZGVzLiAgRXZlbiB0aG91Z2ggYSBwZm4gaXMg
dmFsaWQgYW5kCj4+IC0jIGJldHdlZW4gYSBub2RlJ3Mgc3RhcnQgYW5kIGVuZCBwZm5zLCBpdCBt
YXkgbm90Cj4+IC0jIHJlc2lkZSBvbiB0aGF0IG5vZGUuICBTZWUgbWVtbWFwX2luaXRfem9uZSgp
Cj4+IC0jIGZvciBkZXRhaWxzLgo+PiAtY29uZmlnIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMKPj4g
LQlkZWZfYm9vbCB5Cj4+IC0JZGVwZW5kcyBvbiBYODZfNjRfQUNQSV9OVU1BCj4+IC0KPj4gICBj
b25maWcgTlVNQV9FTVUKPj4gICAJYm9vbCAiTlVNQSBlbXVsYXRpb24iCj4+ICAgCWRlcGVuZHMg
b24gTlVNQQo+PiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5j
Cj4+IGluZGV4IGM0M2NlODcwOTQ1Ny4uMzQzZDg3Yjg2OTdkIDEwMDY0NAo+PiAtLS0gYS9tbS9w
YWdlX2FsbG9jLmMKPj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4+IEBAIC0xNTQxLDI2ICsxNTQx
LDYgQEAgaW50IF9fbWVtaW5pdCBlYXJseV9wZm5fdG9fbmlkKHVuc2lnbmVkIGxvbmcgcGZuKQo+
PiAgIH0KPj4gICAjZW5kaWYgLyogQ09ORklHX05FRURfTVVMVElQTEVfTk9ERVMgKi8KPj4gICAK
Pj4gLSNpZmRlZiBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9OT0RFUwo+PiAtLyogT25seSBzYWZl
IHRvIHVzZSBlYXJseSBpbiBib290IHdoZW4gaW5pdGlhbGlzYXRpb24gaXMgc2luZ2xlLXRocmVh
ZGVkICovCj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgX19tZW1pbml0IGVhcmx5X3Bmbl9pbl9uaWQo
dW5zaWduZWQgbG9uZyBwZm4sIGludCBub2RlKQo+PiAtewo+PiAtCWludCBuaWQ7Cj4+IC0KPj4g
LQluaWQgPSBfX2Vhcmx5X3Bmbl90b19uaWQocGZuLCAmZWFybHlfcGZubmlkX2NhY2hlKTsKPj4g
LQlpZiAobmlkID49IDAgJiYgbmlkICE9IG5vZGUpCj4+IC0JCXJldHVybiBmYWxzZTsKPj4gLQly
ZXR1cm4gdHJ1ZTsKPj4gLX0KPj4gLQo+PiAtI2Vsc2UKPj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBf
X21lbWluaXQgZWFybHlfcGZuX2luX25pZCh1bnNpZ25lZCBsb25nIHBmbiwgaW50IG5vZGUpCj4+
IC17Cj4+IC0JcmV0dXJuIHRydWU7Cj4+IC19Cj4+IC0jZW5kaWYKPiAKPiBBbmQgbWFjcm8gZWFy
bHlfcGZuX3ZhbGlkKCkgaXMgbm90IG5lZWRlZCBlaXRoZXIsIHdlIG1heSBuZWVkIHJlbW92ZSBp
dAo+IHRvby4KPiAKPiBPdGhlcndpc2UsIHJlbW92aW5nIE5PREVTX1NQQU5fT1RIRVJfTk9ERVMg
aW4gdGhpcyBwYXRjaCBsb29rcyBnb29kLgo+IAo+IFJldmlld2VkLWJ5OiBCYW9xdWFuIEhlIDxi
aGVAcmVkaGF0LmNvbT4KCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBzZXQgb24gQXJtNjQsIGFu
ZCBpdCB3b3JrZWQgYXMgZXhwZWN0ZWQgd2l0aCAKdGhlIGNhc2Ugd2hlcmUgdGhlIG5vZGUgbWVt
b3J5IHNwYW5zIHRvIG90aGVyIG5vZGVzIG9yIHRoZSBvbGQgCk5PREVTX1NQQU5fT1RIRVJfTk9E
RVMgY29uZmlnLgoKSG9wZSB0byB0aGUgd2hvbGUgcGF0Y2ggc2V0IHdpbGwgYmUgdXBzdHJlYW0g
c29vbi4KClRoYW5rcyBhbmQgUmVnYXJkcwpIb2FuCgo+IAo+PiAtCj4+IC0KPj4gICB2b2lkIF9f
aW5pdCBtZW1ibG9ja19mcmVlX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25n
IHBmbiwKPj4gICAJCQkJCQkJdW5zaWduZWQgaW50IG9yZGVyKQo+PiAgIHsKPj4gLS0gCj4+IDIu
MjUuMQo+Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

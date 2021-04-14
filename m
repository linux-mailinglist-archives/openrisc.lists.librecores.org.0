Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 196D135FC9B
	for <lists+openrisc@lfdr.de>; Wed, 14 Apr 2021 22:25:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7B845202A8;
	Wed, 14 Apr 2021 22:25:47 +0200 (CEST)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by mail.librecores.org (Postfix) with ESMTPS id 9C2AC20D48
 for <openrisc@lists.librecores.org>; Wed, 14 Apr 2021 11:28:13 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWfcPYzyYgdp2Z9UdLYDGnFSjv631FQt9ZqJ7mCpdN+Yo7moSq618V2qZAr9L8XqipdN6LqxoCG+HWIM18iRDfa4RiVUlJD90e18r0hywZd0wWTvkY9J0FpgJZTGnik7+G71Wg6y/G8BbYZvHcQD3BvFvHnsXnRXbuDzRD3BZtQcXCZZeBcq8m8Ca8Dy6LSd+dlP4Jk5Ye1XjgDmzYTPAU1M6bygJQIwHMdITceenp6wExDAVlKwJqMuuIYX7nVez2pwkH8h8Y/u1jYi1oSVRbfQ7fLBCADfFIxAaJqXhUrAOV4ZB03kBXvbUIN3vrgc+kuJzkWNAszjaynUk7APyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=SLzQ7Wcpg7Yoe/g5QDjERPjuuj9daNLu1GQ2m+v9E/ptt0qU+/jxH0Y0D9g18eZTEWeALLOoYq8X8jVG4+L2+lTUiAGxQ9pPy1MT3HTZQzt2Q5MWLcgkuvnn4ZOR+FwqgAiSrp0u1VboVOQ9XfTuRHnzj8sOs+DnFbDcrlMOmo8035VcCfce1uWdpsjoM0mLXWKXpRd9VK6gYlpljZfPS7W1jHu1pJB9H6aJAq+T4OTYIpzDWeJEvNDoWMkV2Gpk0K6kHVMCVWyXDcfizZ5pU0CC36/lGwa1r2orWGqczA23qU6YJn0/fkQvV/90IvxVNdmw31G4uMu3tWuYLNdKkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGn6HpN6f+b3HanJnFxiW4e/ZPzZpDDHYpCx/0xUmrs=;
 b=gCK3WosoSkUVj9o0NyAZtww7Lm4CfCxWPidNUpYLeMu6Sx5UhkNxCg24QQa67fD0uHkCEMHNTnFVZcOjBaa2cCpUBa9PoaEBFqfxPsW/Vf07Wth9USxbPqE0dTb/45+WUEE7s4KKB8aP3OTsrqTP+9NQk8lspmbrQc12JcEMy0s=
Authentication-Results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB3622.namprd03.prod.outlook.com (2603:10b6:a02:b9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 09:28:10 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 09:28:10 +0000
Date: Wed, 14 Apr 2021 17:27:57 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20210414172757.3ebfaa4c@xhacker.debian>
In-Reply-To: <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
References: <20210414165808.458a3d11@xhacker.debian>
 <44bdf1f1-117d-0f10-fc59-9edd32d1ad61@csgroup.eu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR07CA0088.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::29) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BYAPR07CA0088.namprd07.prod.outlook.com (2603:10b6:a03:12b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 09:28:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-TrafficTypeDiagnostic: BYAPR03MB3622:
X-Microsoft-Antispam-PRVS: <BYAPR03MB36222C312A140D3F2A33A054ED4E9@BYAPR03MB3622.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BBoyky1dSeFRX0Ag+4ecLhEn/iqymRc0DygmvkAJG3qhX3BIAN+gpVB9ehyrxpTj5MK7V2fqC98QUaAKJlZMdsPp97mbd333mEaHQ06xvJ69BvHY7r8u5+tXHNuaxLXanEpftcMrJpg3RyQzLUNUYkD/+cGEy2SooAnCRWom7NRVDIkROqXPpJ9HXVWls63l27z9Q0jSLyakwF0dlu5mapmrbbVXVznyMqcj8wBXjQ6N0l4dETrBMZRqv7d9qixkbaWGZENrVAeCEKyAE8sw51HK0gqK8jhTXqVPuBBMs7vGDEN4G6ATNEwie6nGfBVKpih5ws45GL/BMD7hLHTuMVtMSL2PRW7HEdZ/F1Z9WijnNxPK5/Y6C8oXlqf+6EIR2B94+Q1QGLy5ASTmYack67TxVQEHXBRuJFYTb9p8dhmzzf1ExxyjWZMAsSo6O3pwL8zLWuDxaKOoaGQLC32NjIri66ndEgthYqub92SYWIs2bW3F4oH0xyQ6fnTJOhifKyBbNsp3/bqwtJMe/gZL5LBwAHdzyijp630WfUnMYwNHrefGq3UcJSoNm5A7DTTW3O4XSljjLtkbwtNq8JEIUbeDCnRiGTKaP5mV+/MQ0si9L7/L4HO2NUACU0JIf3ZEj9OZcQmnkJB8ukE0ooeAwl/l+SUPH0nxtUc5DUN0EzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(39850400004)(396003)(55016002)(66476007)(316002)(66574015)(66946007)(186003)(66556008)(2906002)(9686003)(4326008)(7416002)(16526019)(6506007)(26005)(478600001)(52116002)(38350700002)(5660300002)(8936002)(1076003)(38100700002)(7696005)(6666004)(8676002)(7406005)(83380400001)(54906003)(956004)(86362001)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjY4SzdaNDlMNVhRcjBnY2hJcHJrazRPY0tkN1Z6ckd4YUZYa2sxekI4YXRC?=
 =?utf-8?B?U01vdzYydTljc0tMenhnaHRpV28zZWhCcm5hWGZBNzkyV0UxZGh6ZE5QYVlv?=
 =?utf-8?B?ZDljb0xYb1VtaDRqNjg4eFhCVWNsODV4NzBPNHdYOURNTnEyWTFHN0FJejJq?=
 =?utf-8?B?RWRnSHZ4MFU2c2RMWExMWktqN1ZFbTVSZDY5NjluZHhxN3RuUlozVlprT3My?=
 =?utf-8?B?Vkp5UnNMZjc1U29SZ3MycC80VkhOT2d0OU5WMUg2N0NCajFqQUlwcTd0MXY1?=
 =?utf-8?B?djhvQWxJdUtpMWhxRURYSkZtNEs1a2F0MFVCK0RZVUJSL09FSmk3d0dyQUVr?=
 =?utf-8?B?STNEZTBGcWxyOC9wMU4yWDUyVEZTRldRVm5BcXZPdkY1QnQvRG9qWlNkQlls?=
 =?utf-8?B?OURyUkVueUNVSXhkcFFCWHJ1Z2FyaU5Xa0lNQWV5MXo4LzMvQVNVZ2JUQXY2?=
 =?utf-8?B?SnAvWU13Uk8yZ1RBUzBaUDNvY04yN0wwTDkydE01R2FWcjAzTHRSU3FrSm5T?=
 =?utf-8?B?ZWVsWGUxc2tZNU5jOUsrSmxGS1BqbkFVczM4Tnh6cStRS0xkZGpDQ013OGg3?=
 =?utf-8?B?NU9jcENFVmowV2REZGEzckgrbm1aNWxHVFhMSXB5aGhFcEdTdEFoN2U4Sk1y?=
 =?utf-8?B?ZUxjYWYxSnAvY05qa1JDanRweUdQUWRNb2MwQms5OXRQNGNoUTV1RkdVZlg5?=
 =?utf-8?B?ajJ6bC90b0ZSSnNVVGRlSk53aHNVQXpBNGc0ekhrTVY0K1ZKOFVPc3lyRndV?=
 =?utf-8?B?Z3RTNXlRMk8zT2g2ejZxZldobk5wRWxUMno3WWp0MkQyUzZ2UWswOHl4dVNE?=
 =?utf-8?B?bHJBSTBoYnlQa3VIVWsxVDhndVhxaGtzV1p5UTRsTTV3Z1IveUpiaDR5ak9a?=
 =?utf-8?B?RlJWbFk0R1RPMmFnNFNpTzV5T2ZnYktLUU5wdklQRVNkQXNHUHdJV0NubUFx?=
 =?utf-8?B?NlhTZzljVVljNTRwTkdaOE9EQjVVMEFIMDlWSGQrNzRudk5IR0kxQmF1ZDB1?=
 =?utf-8?B?L0NKS1BONzh4VW5USUlyZWU3WWtObEJXdzE0MGczTzlPcVBzc0FuNTMra21h?=
 =?utf-8?B?cDRtUFlVNDRIUkRXelloVWc5NEJiK1pZa0F4MFVqWU9KUGhwVlNXQk1hL2E1?=
 =?utf-8?B?TUtjS0krSEM4cHA1NjB3QVpxcUZMbC9CZjVQZVJockx1dXBZOUNDbkJ6UnAz?=
 =?utf-8?B?SUlJWTI0L3ZZVFlGZHZlT05HbTEwQk5PdnRuYktiMTQ2SEV0d2d4NkdWMjBL?=
 =?utf-8?B?TS9oTm9mMFVPMnZObUI1dVRWV3IwdCtZR1JQVzd4UWhINFFubjFtY2FVQXds?=
 =?utf-8?B?VUNBeFlIbzNudHM4VStoaHJ1OFB5enV1TEsvU250Z1hHRnF4UDNoUUI0Z1U2?=
 =?utf-8?B?UGZBb2xOVytveDNTc3d3bnN3OFNQOTd2UDJlNW5oRjlrUEc2OWtvbzF3TENz?=
 =?utf-8?B?R3poSllndHRESEI1N2F6NWNNK0NsdzFHZzFxNGV0ZGtUbmR2azBnYXd5Q1NB?=
 =?utf-8?B?K2p2Y2F0TEwyd1RnZDh3OEZsNHVOOWxJMWVENzdUV0xGRmZRd0tPRk9udUht?=
 =?utf-8?B?STd0VzBaQWdVREtDVUJLL09pMmp4TzM4TUhiU21TV09hWmJOUEJIK2dxM0xV?=
 =?utf-8?B?YmZnRTJlNDBSWjlFc2pVTHUycGl1NDNQVmJRY0FZQTY5Szl2TWJ6bHREaktK?=
 =?utf-8?B?Q3FxQUVWVjZoQWRKb0x6d2pSdnRJUVZCc0ZhTjhlWU90ck51VkRCeWgwdXFi?=
 =?utf-8?Q?D3GmPb0EMi3pdCwfFb4tp/A+lzyS75V5Z67/b0v?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5120a7f7-5623-41c8-77de-08d8ff279e49
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 09:28:09.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbSQwoe9+sk+OIeMD2fVJIdjwRYcFjMH/krNmyYNJFJsAtaRccxFVAkceNwNekPD/uStkHEqycl7udIev9Ns4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3622
X-Mailman-Approved-At: Wed, 14 Apr 2021 22:25:43 +0200
Subject: Re: [OpenRISC] [PATCH] init: consolidate trap_init()
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Anup Patel <anup@brainfault.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-parisc@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCAxNCBBcHIgMjAyMSAxMToxMDo0MiArMDIwMApDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgoKPiAKPiBMZSAxNC8wNC8yMDIxIMOgIDEw
OjU4LCBKaXNoZW5nIFpoYW5nIGEgw6ljcml0IDoKPiA+IE1hbnkgYXJjaGl0ZWN0dXJlcyBpbXBs
ZW1lbnQgdGhlIHRyYXBfaW5pdCgpIGFzIE5PUCwgc2luY2UgdGhlcmUgaXMKPiA+IG5vIHN1Y2gg
ZGVmYXVsdCBmb3IgdHJhcF9pbml0KCksIHRoaXMgZW1wdHkgc3R1YiBpcyBkdXBsaWNhdGVkIGFt
b25nCj4gPiB0aGVzZSBhcmNoaXRlY3R1cmVzLiBQcm92aWRlIGEgZ2VuZXJpYyBidXQgd2VhayBO
T1AgaW1wbGVtZW50YXRpb24KPiA+IHRvIGRyb3AgdGhlIGVtcHR5IHN0dWJzIG9mIHRyYXBfaW5p
dCgpIGluIHRoZXNlIGFyY2hpdGVjdHVyZXMuICAKPiAKPiBZb3UgZGVmaW5lIHRoZSB3ZWFrIGZ1
bmN0aW9uIGluIHRoZSBfX2luaXQgc2VjdGlvbi4KPiAKPiBNb3N0IGJ1dCBub3QgYWxsIGFyY2hp
dGVjdHVyZXMgaGFkIGl0IGluIF9faW5pdCBzZWN0aW9uLgo+IAo+IEFuZCB0aGUgcmVtYWluaW5n
IG9uZXMgbWF5IG5vdCBiZSBkZWZpbmVkIGluIF9faW5pdCBzZWN0aW9uLiBGb3IgaW5zdGFuY2Ug
bG9vayBhdCB0aGUgb25lIGluIGFscGhhCj4gYXJjaGl0ZWN0dXJlLgo+IAo+IEhhdmUgeW91IGNo
ZWNrZWQgdGhhdCBpdCBpcyBub3QgYSBwcm9ibGVtID8gSXQgd291bGQgYmUgZ29vZCB0byBzYXkg
c29tZXRoaW5nIGFib3V0IGl0IGluIHRoZSBjb21taXQKPiBkZXNjcmlwdGlvbi4KCkZvciB0aG9z
ZSBub24tbm9wIHBsYXRmb3JtcywgSSBjYW4gb25seSB0ZXN0IHg4Ni9hcm02NC8sIGJ1dCBib3Ro
IGhhcwpfX2luaXQgbWFyay4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBpcyBhIHByb2JsZW0g
Zm9yIGFscGhhIGV0Yy4gTWF5YmUKSSBjYW4gY2hlY2sgd2hpY2ggc2VjdGlvbiB0aGUgdHJhcF9p
bml0KCkgc2l0cy4gT3IgdG8gYXZvaWQgYW55IHBvc3NpYmxlCnJlZ3Jlc3Npb24sIEkgY2FuIGFk
ZCBfX2luaXQgbWFyayB0byB0aG9zZSByZW1haW5pbmcgb25lcyB3aXRob3V0IGl0IGluCnByZXBh
cmF0aW9uIHBhdGNoZXMuCgo+IAo+IAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhh
bmcgPEppc2hlbmcuWmhhbmdAc3luYXB0aWNzLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL2FyYy9r
ZXJuZWwvdHJhcHMuYyAgICAgIHwgIDUgLS0tLS0KPiA+ICAgYXJjaC9hcm0va2VybmVsL3RyYXBz
LmMgICAgICB8ICA1IC0tLS0tCj4gPiAgIGFyY2gvaDgzMDAva2VybmVsL3RyYXBzLmMgICAgfCAx
MyAtLS0tLS0tLS0tLS0tCj4gPiAgIGFyY2gvaGV4YWdvbi9rZXJuZWwvdHJhcHMuYyAgfCAgNCAt
LS0tCj4gPiAgIGFyY2gvbmRzMzIva2VybmVsL3RyYXBzLmMgICAgfCAgNSAtLS0tLQo+ID4gICBh
cmNoL25pb3MyL2tlcm5lbC90cmFwcy5jICAgIHwgIDUgLS0tLS0KPiA+ICAgYXJjaC9vcGVucmlz
Yy9rZXJuZWwvdHJhcHMuYyB8ICA1IC0tLS0tCj4gPiAgIGFyY2gvcGFyaXNjL2tlcm5lbC90cmFw
cy5jICAgfCAgNCAtLS0tCj4gPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyAgfCAgNSAt
LS0tLQo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgIHwgIDUgLS0tLS0KPiA+ICAg
YXJjaC91bS9rZXJuZWwvdHJhcC5jICAgICAgICB8ICA0IC0tLS0KPiA+ICAgaW5pdC9tYWluLmMg
ICAgICAgICAgICAgICAgICB8ICAyICsrCj4gPiAgIDEyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNjAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luaXQvbWFpbi5j
IGIvaW5pdC9tYWluLmMKPiA+IGluZGV4IDUzYjI3ODg0NWI4OC4uNGJkYmUyOTI4NTMwIDEwMDY0
NAo+ID4gLS0tIGEvaW5pdC9tYWluLmMKPiA+ICsrKyBiL2luaXQvbWFpbi5jCj4gPiBAQCAtNzkw
LDYgKzc5MCw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbml0Y2FsbF9kZWJ1Z19lbmFibGUodm9p
ZCkKPiA+ICAgfQo+ID4gICAjZW5kaWYKPiA+Cj4gPiArdm9pZCBfX2luaXQgX193ZWFrIHRyYXBf
aW5pdCh2b2lkKSB7IH0KPiA+ICsgIAo+IAo+IEkgdGhpbmsgaW4gYSBDIGZpbGUgd2UgZG9uJ3Qg
dHJ5IHRvIHNhdmUgc3BhY2UgYXMgbXVjaCBhcyBpbiBhIGhlYWRlciBmaWxlLgo+IAoKVGhpcyBp
cyB0byBmb2xsb3cgbW9zdCB3ZWFrIE5PUCBpbXBsZW1lbnRhdGlvbnMgaW4gaW5pdC9tYWluLmMg
dG8gbWFrZQp0aGUgc3R5bGUgdW5pZmllZCBpbiB0aGUgc2FtZSBmaWxlLiBJJ20gbm90IHN1cmUg
d2hpY2ggaXMgYmV0dGVyLgoKPiBJIHdvdWxkIHByZWZlciBzb21ldGhpbmcgbGlrZToKPiAKPiAK
PiB2b2lkIF9faW5pdCBfX3dlYWsgdHJhcF9pbml0KHZvaWQpCj4gewo+IH0KPiAKPiAKPiA+ICAg
LyogUmVwb3J0IG1lbW9yeSBhdXRvLWluaXRpYWxpemF0aW9uIHN0YXRlcyBmb3IgdGhpcyBib290
LiAqLwo+ID4gICBzdGF0aWMgdm9pZCBfX2luaXQgcmVwb3J0X21lbWluaXQodm9pZCkKPiA+ICAg
ewo+ID4gIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

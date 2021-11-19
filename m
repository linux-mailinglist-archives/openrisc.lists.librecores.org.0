Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4F00F4580F2
	for <lists+openrisc@lfdr.de>; Sun, 21 Nov 2021 00:18:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D940324294;
	Sun, 21 Nov 2021 00:18:11 +0100 (CET)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2021.outbound.protection.outlook.com [40.92.40.21])
 by mail.librecores.org (Postfix) with ESMTPS id 9B95B2427C
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 11:27:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6EBg0XsD10jfiwe7E0G/iLwnmfCqaTIJ/u9dSmx3CdTTdCU2euxmPQ/fd58rSP2pyHRYM7XBxRQEZZHUsTq+JjSruZEqN5OfqGfRGi8fEF3NP8hcwWG1fkYA5j8qPyloorkAIwnEDsLqXyjWvzAubq3SDswzrCBTlIjjrFUpF137re5km3tYrpondrtRCGT3viw+A5qV7F7m4ZOrV2UDcDCXOEhZh0XIzG2p0NzxwL0GmAdvdX4pU0ez+hAqY6NCHm82c8MUbmqibaX9u1xmEX9sY3mCQacEuxu/gIFiSFnBw8MRwLzTOQRNvaOcl8bx3ynU9D9x6N3amQYYGGJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0IGN7BC/gYBbmMoOqL/FzEUtwX+nHsuXaIwwu/DyK4=;
 b=IgPyN+CoGtHefRfNucYkWwwhyDqrVxo2k9n35JdABMrjTYhJBpQPOLsazqQizurZ4G28ReJLTQAkYfqW3hFlcST7o55lELV2pXZvR8uaK8UXYCUKG9t/74GAm8XNqjoAkBy6mB7iOpw6tMN7L+2Qn/Ne1qqlHnrHN+R2JeoczzT2JPiuLpk1gbrAYaf/k2bolq2SYc1wVblqs+lCx4NYlRgdpqWLI6Ks+2+qmaAA3C8kGtTlYHwQu6vleH4ZxIyHaf8YZpYFE1HKnhF4lcXCPNmQ/xH8+zDUzB7aoWlcIRSMYFt+76SOMuZXKNEP83kllFU9NA0nG0yL9EaC430d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0IGN7BC/gYBbmMoOqL/FzEUtwX+nHsuXaIwwu/DyK4=;
 b=J1ySC3JQ9hOzMZxO3Y4awlMiAacolZtbSo8JLXxP2iZs4O+H2ZMSL4FELYsNk81OR/lELk/jYOTZ32fwIA++FQFfspcwgZnXbb+mucCWDdqrdq9ouDlKjpJ+sbUi2qZdRefucWj1ami9MaMmm4VNj8PJh6aEwaVgHGMx8DitMAmPrF+JHMHIdpl3kB6ekuBlwQVC1X+7P+DLIxPtK6x39Y4TxLMrSaA2buuLkZ96CygbFBz3KYqIRr7tdzs+oyDnAw/xo7BdqQPlcdghfaabimt1OsR587PfHQv6z9rG5RWfCa7j0eDBPcbWv7I5ljy+UWesWy5m9FX2cEoAX/ZbUA==
Received: from PH7PR20MB4266.namprd20.prod.outlook.com (2603:10b6:510:130::21)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 10:27:34 +0000
Received: from PH7PR20MB4266.namprd20.prod.outlook.com
 ([fe80::548d:a47:18bf:6b54]) by PH7PR20MB4266.namprd20.prod.outlook.com
 ([fe80::548d:a47:18bf:6b54%9]) with mapi id 15.20.4649.018; Fri, 19 Nov 2021
 10:27:34 +0000
Date: Fri, 19 Nov 2021 18:27:23 +0800
From: Calvin Zhang <calvinzhang.cool@outlook.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <PH7PR20MB42663BF6B2DB62EEA95012F8989C9@PH7PR20MB4266.namprd20.prod.outlook.com>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
 <YZd0uEWNH6Def3+8@smile.fi.intel.com>
Content-Disposition: inline
In-Reply-To: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
X-TMN: [4l5XR5jsTyaGhQdOKSGL1ZWW6tLviOvG]
X-ClientProxiedBy: HK2PR0302CA0020.apcprd03.prod.outlook.com
 (2603:1096:202::30) To PH7PR20MB4266.namprd20.prod.outlook.com
 (2603:10b6:510:130::21)
X-Microsoft-Original-Message-ID: <YZd8C9+NTZ+sLEjZ@debian>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (103.99.179.247) by
 HK2PR0302CA0020.apcprd03.prod.outlook.com (2603:1096:202::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.18 via Frontend Transport; Fri, 19 Nov 2021 10:27:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3effd0ad-1f25-4d82-64ba-08d9ab473339
X-MS-TrafficTypeDiagnostic: PH0PR20MB4352:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wvp9u67YY3EMxv2WF4Oprb5l3t07uoRMeoZPbORZLKbwH6OG1WM4zwKMfzyONQ+bXcdkP/ECL0oJF6iRBWVIuNZeqITnNk+rfwOu6qYK5NOlrgKk+0F/PVXY7Rrf/7jwyKbtgg7Ntfa6keDOJSbz4U8SZbmZzkMIdSaEh2lyjtaK/YFHOkFr45wsFDareZnixpY0sHduN72mVbbE3Fji7DMN7nL4y0VNXbIIsSZGvsSUBFKiNuRzL1slFNhSPt10pQA4izsQp4QH19o7ZT9ZFIJ7k/TYwbuLXTRLN0m7613fdEDIHCUBSW9p0MFzlQgPlFDuI7rrD7dz12Bt6ggqwhK7llNpPfxxezw8IUp0bIh5uhMT+DlgGo7RfUVbo3JFNz4Wgn6OvqDJkUHY7Uq8fJKKcxD/AXQhIBK5k8obZOO7v4IYlDOWNCN3xlCxR8z7rxxJCnN06mudUFOSwVFyMUxpz0K0cqX7aKKQJqmFXCvfBbd2EZoUt9glXv82GJXywMo0QMGIijOrHiP5kptlFV1e1CUVY2GE4DQQYMwLBYo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p4GealiK/Qw4Vf6g06c3lbieB8w0+KNvBHN8+jRdf+jK1eBBeng+eWrCwIwidKfgguvsvN7Q1pKb+a932cWQKTsL0Dt1WDc7e8uYGLm+VKO7HrSSAatkkdjPpEN3OtL21HdW3S9iBybwMisPQlp+gBMKOtv8zbhdOu/fgTfrwc+mNEFxMm0fi7k/wLhzIYaDFCrRv5UIGO7cetDjBTeDe6cFtTvVkwa7YrA1X7Z82UIzqKX6JK9ZkUeOm4fKquKKuGkFMFlyjt/1Wm9HW/2CoyswLwjZi6u3KYxtAn5DICaR7UfmjpbcmkAKXTDCwvxraDzW0CFjgBm7UFzm5mobbfmkduT7j80lM05PT4BzDcLRgibKhPx3zfGDyQhT0crN8Atoa44MYXsEOBFSGmguWaB+W3ci3P/Hbad6/mgdlXEKQkb8Qep2UERC1QfChCztK9I52StcNhd7xDPm8zSyvsJI8CJfVfkf/YK6jydQqomu+0rOCeUrhH8LFxFhb17H+TtYBbgSyBE6sHruIhXXzvgPF0YCTxkRZfcVRWP5SmkYmuxXDj32KMCUVMS+4Vd0X1oAWQnKjz8pPMGl792f8IopMuvMSh5yX2F+6b1MlmgU/QQ0f1ofL3fhR8OV+Fo2xi6BBbyLMfq8FT2AcbBSxHtCUFLPjnXOe22KfEScwcgK2ZKXAvHOc49EB6lHzdKcJeuktT6LeU67xUVqJpZuWg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3effd0ad-1f25-4d82-64ba-08d9ab473339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR20MB4266.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 10:27:34.5026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-Mailman-Approved-At: Sun, 21 Nov 2021 00:18:09 +0100
Subject: Re: [OpenRISC] [PATCH 2/2] of: reserved_mem: Remove reserved
 regions count restriction
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Rich Felker <dalias@libc.org>,
 Jinyang He <hejinyang@loongson.cn>, David Hildenbrand <david@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Max Filippov <jcmvbkbc@gmail.com>,
 Anup Patel <anup.patel@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>, Calvin Zhang <calvinzhang.cool@gmail.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Vladimir Isaev <isaev@synopsys.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>, linux-mips@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMTE6NTY6MDhBTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMDM6NTg6MTlQTSArMDgwMCwgQ2Fsdmlu
IFpoYW5nIHdyb3RlOgo+PiBDaGFuZ2UgdG8gYWxsb2NhdGUgcmVzZXJ2ZWRfbWVtcyBkeW5hbWlj
YWxseS4gU3RhdGljIHJlc2VydmVkIHJlZ2lvbnMKPj4gbXVzdCBiZSByZXNlcnZlZCBiZWZvcmUg
YW55IG1lbWJsb2NrIGFsbG9jYXRpb25zLiBUaGUgcmVzZXJ2ZWRfbWVtcwo+PiBhcnJheSBjb3Vs
ZG4ndCBiZSBhbGxvY2F0ZWQgdW50aWwgbWVtYmxvY2sgYW5kIGxpbmVhciBtYXBwaW5nIGFyZSBy
ZWFkeS4KPj4gCj4+IFNvIG1vdmUgdGhlIGFsbG9jYXRpb24gYW5kIGluaXRpYWxpemF0aW9uIG9m
IHJlY29yZHMgYW5kIHJlc2VydmVkIG1lbW9yeQo+PiBmcm9tIGVhcmx5X2luaXRfZmR0X3NjYW5f
cmVzZXJ2ZWRfbWVtKCkgdG8gb2ZfcmVzZXJ2ZWRfbWVtX2luaXQoKS4KPgo+PiAgYXJjaC9hcmMv
bW0vaW5pdC5jICAgICAgICAgICAgICAgICB8ICAzICsrCj4+ICBhcmNoL2FybS9rZXJuZWwvc2V0
dXAuYyAgICAgICAgICAgIHwgIDIgKwo+PiAgYXJjaC9hcm02NC9rZXJuZWwvc2V0dXAuYyAgICAg
ICAgICB8ICAzICsrCj4+ICBhcmNoL2Nza3kva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgIDMg
KysKPj4gIGFyY2gvaDgzMDAva2VybmVsL3NldHVwLmMgICAgICAgICAgfCAgMiArCj4+ICBhcmNo
L21pcHMva2VybmVsL3NldHVwLmMgICAgICAgICAgIHwgIDMgKysKPj4gIGFyY2gvbmRzMzIva2Vy
bmVsL3NldHVwLmMgICAgICAgICAgfCAgMyArKwo+PiAgYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAu
YyAgICAgICAgICB8ICAyICsKPj4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgICAgICAg
fCAgMyArKwo+PiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYyB8ICAzICsrCj4+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgIDIgKwo+PiAgYXJjaC9zaC9r
ZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICB8ICAzICsrCj4+ICBhcmNoL3h0ZW5zYS9rZXJuZWwv
c2V0dXAuYyAgICAgICAgIHwgIDIgKwo+Cj5Jc24ndCB4ODYgbWlzc2VkPyBJcyBpdCBvbiBwdXJw
b3NlPwo+V291bGQgYmUgbmljZSB0byBoYXZlIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIG9y
IGZpeGVkIGFjY29yZGluZ2x5LgpBRkFJSywgeDg2IGRvZXNuJ3QgcmVzZXJ2ZSBtZW1vcnkgdGhy
b3VnaCAiL3Jlc2VydmVkLW1lbW9yeSIgbm9kZSB1bnRpbCBub3cuCkFjdHVhbGx5LCBJIGdvdCB0
aGUgYXJjaCBsaXN0IGZyb20gY2FsbGVycyBvZgplYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVk
X21lbSgpLgo+Cj4tLSAKPldpdGggQmVzdCBSZWdhcmRzLAo+QW5keSBTaGV2Y2hlbmtvCj4KPgo+
CgpUaGFua3MsCkNhbHZpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

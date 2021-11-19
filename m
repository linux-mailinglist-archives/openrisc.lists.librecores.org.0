Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 046934580F1
	for <lists+openrisc@lfdr.de>; Sun, 21 Nov 2021 00:18:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6648A242B0;
	Sun, 21 Nov 2021 00:18:11 +0100 (CET)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mail.librecores.org (Postfix) with ESMTPS id C8D4B24286
 for <openrisc@lists.librecores.org>; Fri, 19 Nov 2021 10:58:49 +0100 (CET)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="234338418"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="234338418"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:58:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="568845492"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:58:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mo0cr-008Uqj-60; Fri, 19 Nov 2021 11:56:09 +0200
Date: Fri, 19 Nov 2021 11:56:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Calvin Zhang <calvinzhang.cool@gmail.com>
Message-ID: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
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
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
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

T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMDM6NTg6MTlQTSArMDgwMCwgQ2FsdmluIFpoYW5nIHdy
b3RlOgo+IENoYW5nZSB0byBhbGxvY2F0ZSByZXNlcnZlZF9tZW1zIGR5bmFtaWNhbGx5LiBTdGF0
aWMgcmVzZXJ2ZWQgcmVnaW9ucwo+IG11c3QgYmUgcmVzZXJ2ZWQgYmVmb3JlIGFueSBtZW1ibG9j
ayBhbGxvY2F0aW9ucy4gVGhlIHJlc2VydmVkX21lbXMKPiBhcnJheSBjb3VsZG4ndCBiZSBhbGxv
Y2F0ZWQgdW50aWwgbWVtYmxvY2sgYW5kIGxpbmVhciBtYXBwaW5nIGFyZSByZWFkeS4KPiAKPiBT
byBtb3ZlIHRoZSBhbGxvY2F0aW9uIGFuZCBpbml0aWFsaXphdGlvbiBvZiByZWNvcmRzIGFuZCBy
ZXNlcnZlZCBtZW1vcnkKPiBmcm9tIGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkg
dG8gb2ZfcmVzZXJ2ZWRfbWVtX2luaXQoKS4KCj4gIGFyY2gvYXJjL21tL2luaXQuYyAgICAgICAg
ICAgICAgICAgfCAgMyArKwo+ICBhcmNoL2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwg
IDIgKwo+ICBhcmNoL2FybTY0L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgIDMgKysKPiAgYXJj
aC9jc2t5L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8ICAzICsrCj4gIGFyY2gvaDgzMDAva2Vy
bmVsL3NldHVwLmMgICAgICAgICAgfCAgMiArCj4gIGFyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYyAg
ICAgICAgICAgfCAgMyArKwo+ICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwg
IDMgKysKPiAgYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICB8ICAyICsKPiAgYXJj
aC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICB8ICAzICsrCj4gIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvc2V0dXAtY29tbW9uLmMgfCAgMyArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgIHwgIDIgKwo+ICBhcmNoL3NoL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgIHwg
IDMgKysKPiAgYXJjaC94dGVuc2Eva2VybmVsL3NldHVwLmMgICAgICAgICB8ICAyICsKCklzbid0
IHg4NiBtaXNzZWQ/IElzIGl0IG9uIHB1cnBvc2U/CldvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aGlz
IGluIHRoZSBjb21taXQgbWVzc2FnZSBvciBmaXhlZCBhY2NvcmRpbmdseS4KCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

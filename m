Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A8D02463FAC
	for <lists+openrisc@lfdr.de>; Tue, 30 Nov 2021 22:08:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3F5DE2421D;
	Tue, 30 Nov 2021 22:08:16 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 0B46D21335
 for <openrisc@lists.librecores.org>; Tue, 30 Nov 2021 22:08:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D78AB81C4F;
 Tue, 30 Nov 2021 21:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78438C53FC7;
 Tue, 30 Nov 2021 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638306491;
 bh=CGQDQlRxlHpJq0xzSuKQi7AU9OYm37j7CJ7xfuMMlQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MQT0554slXBNgzV6dz6ATkc3EGBq02EcnyIjFHm4NC/TQW+Ti/5+ZwpYdUyXTQSX0
 FP/Mg9FHX1WkJdgEmvH+Sjh6chDp0qa4rdvwceLtLU4mrx9YqTjWtdVLiOuUAqqTr9
 JxBBF8wiCf2msoHxAESTMHrwoozuA53LUQYu0nChlx4mPkmdPvsjcuZz6ld/73Q1EP
 49cP1v8fZ5yU4pp+jiMhNoi6TZsD6QEaZ+s7211uBewrAF+q/t4jJF4C5l0VvizKZK
 UqaJcABTKX49+eBLI8ebfD/p5ZMIh9Z6ly7YavV63rHaytjZkBuc5OrtUPGVxLkKwd
 8IDw15RIkFr7Q==
Date: Tue, 30 Nov 2021 23:07:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YaaSnJ2Meo5mEKDN@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org> <YaVrahm+ysoQRGKe@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
Subject: Re: [OpenRISC] [PATCH 0/2] of: remove reserved regions count
 restriction
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
Cc: "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Rich Felker <dalias@libc.org>, Jinyang He <hejinyang@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Vladimir Isaev <isaev@synopsys.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, David Brazdil <dbrazdil@google.com>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thierry Reding <treding@nvidia.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-xtensa@linux-xtensa.org, Vineet Gupta <vgupta@kernel.org>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Nick Hu <nickhu@andestech.com>,
 Atish Patra <atish.patra@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Frank Rowand <frowand.list@gmail.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Dinh Nguyen <dinguyen@kernel.org>, Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, Souptick Joarder <jrdr.linux@gmail.com>,
 Marc Zyngier <maz@kernel.org>, Mauri Sandberg <sandberg@mailfence.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMDY6MDg6MTBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBOb3YgMjEsIDIwMjEgYXQgMDg6NDM6NDdBTSArMDIwMCwgTWlrZSBSYXBv
cG9ydCB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDE5LCAyMDIxIGF0IDAzOjU4OjE3UE0gKzA4MDAs
IENhbHZpbiBaaGFuZyB3cm90ZToKPiA+ID4gVGhlIGNvdW50IG9mIHJlc2VydmVkIHJlZ2lvbnMg
aW4gL3Jlc2VydmVkLW1lbW9yeSB3YXMgbGltaXRlZCBiZWNhdXNlCj4gPiA+IHRoZSBzdHJ1Y3Qg
cmVzZXJ2ZWRfbWVtIGFycmF5IHdhcyBkZWZpbmVkIHN0YXRpY2FsbHkuIFRoaXMgc2VyaWVzIHNv
cnRzCj4gPiA+IG91dCByZXNlcnZlZCBtZW1vcnkgY29kZSBhbmQgYWxsb2NhdGVzIHRoYXQgYXJy
YXkgZnJvbSBlYXJseSBhbGxvY2F0b3IuCj4gPiA+IAo+ID4gPiBOb3RlOiByZXNlcnZlZCByZWdp
b24gd2l0aCBmaXhlZCBsb2NhdGlvbiBtdXN0IGJlIHJlc2VydmVkIGJlZm9yZSBhbnkKPiA+ID4g
bWVtb3J5IGFsbG9jYXRpb24uIFdoaWxlIHN0cnVjdCByZXNlcnZlZF9tZW0gYXJyYXkgc2hvdWxk
IGJlIGFsbG9jYXRlZAo+ID4gPiBhZnRlciBhbGxvY2F0b3IgaXMgYWN0aXZhdGVkLiBXZSBtYWtl
IGVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkKPiA+ID4gZG8gcmVzZXJ2YXRpb24g
b25seSBhbmQgYWRkIGFub3RoZXIgY2FsbCB0byBpbml0aWFsaXplIHJlc2VydmVkIG1lbW9yeS4K
PiA+ID4gU28gYXJjaCBjb2RlIGhhdmUgdG8gY2hhbmdlIGZvciBpdC4KPiA+IAo+ID4gSSB0aGlu
ayBtdWNoIHNpbXBsZXIgd291bGQgYmUgdG8gdXNlIHRoZSBzYW1lIGNvbnN0YW50IGZvciBzaXpp
bmcKPiA+IG1lbWJsb2NrLnJlc2VydmVkIGFuZCByZXNlcnZlZF9tZW0gYXJyYXlzLgo+IAo+IERv
IHRob3NlIGFycmF5cyBnZXQgc2hydW5rPyBPciBkbyB3ZSB3YXN0ZSB0aGUgbWVtb3J5IGZvcmV2
ZXI/CgpNZW1ibG9jayBhcnJheXMgZG9uJ3QgZ2V0IHNocnVuaywgYnV0IHRoZXkgYXJlIF9faW5p
dCB1bmxlc3MgYW4gYXJjaGl0ZWN0dXJlCmNob3NlIHRvIGtlZXAgdGhlbSBhZnRlciBib290LCBi
dXQgbW9zdCBhcmNoaXRlY3R1cmVzIHRoYXQgdXNlIGRldmljZSB0cmVlCmFjdHVhbGx5IGtlZXAg
bWVtYmxvY2sgc3RydWN0dXJlcy4KIAo+IE1heWJlIHdlIGNhbiBjb3B5IGFuZCBzaHJpbmsgdGhl
IGluaXRpYWwgYXJyYXk/IFRob3VnaCBJIHN1c3BlY3Qgc3RydWN0IAo+IHJlc2VydmVkX21lbSBw
b2ludGVycyBoYXZlIGFscmVhZHkgYmVlbiBnaXZlbiBvdXQuCgpJJ20gbm90IHN1cmUuIEl0IHNl
ZW1zIHRoYXQgcmVzZXJ2ZWRfbWVtIHBvaW50ZXJzIGFyZSBnaXZlbiBvdXQgYXQgaW5pdGNhbGwK
dGltZSBhbmQgQUZBSVUgdGhlIHJlc2VydmVkX21lbSBhcnJheSBpcyBjcmVhdGVkIHNvbWV3aGVy
ZSBhcm91bmQKc2V0dXBfYXJjaCgpLiBTbyBtYXliZSBpdCdzIHBvc3NpYmxlIHRvIGNvcHkgYW5k
IHNocmluayB0aGUgaW5pdGlhbCBhcnJheS4KIAo+ID4gCj4gPiBJZiB0aGVyZSBpcyB0b28gbXVj
aCByZXNlcnZlZCByZWdpb25zIGluIHRoZSBkZXZpY2UgdHJlZSwgcmVzZXJ2aW5nIHRoZW0gaW4K
PiA+IG1lbWJsb2NrIHdpbGwgZmFpbCBhbnl3YXkgYmVjYXVzZSBtZW1ibG9jayBhbHNvIHN0YXJ0
cyB3aXRoIHN0YXRpYyBhcnJheQo+ID4gZm9yIG1lbWJsb2NrLnJlc2VydmVkLCBzbyBkb2luZyBv
bmUgcGFzcyB3aXRoIG1lbWJsb2NrX3Jlc2VydmUoKSBhbmQKPiA+IGFub3RoZXIgdG8gc2V0IHVw
IHJlc2VydmVkX21lbSB3b3VsZG4ndCBoZWxwIGFueXdheS4KPiA+IAo+ID4gPiBJJ20gb25seSBm
YW1pbGlhciB3aXRoIGFybSBhbmQgYXJtNjQgYXJjaGl0ZWN0dXJlcy4gQXBwcm92YWxzIGZyb20g
YXJjaAo+ID4gPiBtYWludGFpbmVycyBhcmUgcmVxdWlyZWQuIFRoYW5rIHlvdSBhbGwuCgotLSAK
U2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

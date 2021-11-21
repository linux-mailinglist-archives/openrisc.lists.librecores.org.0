Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A018C45826A
	for <lists+openrisc@lfdr.de>; Sun, 21 Nov 2021 07:44:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3D7222423C;
	Sun, 21 Nov 2021 07:44:22 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1F72D22B3E
 for <openrisc@lists.librecores.org>; Sun, 21 Nov 2021 07:44:20 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B98604AC;
 Sun, 21 Nov 2021 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637477055;
 bh=fF0qMHEWbaZWbEit/VvNjQKirKtWS4o0c8b9dFvtOFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o40YeyKWlss6qPqzIaBC1BRaoNsy8h4lRluMS6PA711BRFcqyhJOnzbksEMtKtJO/
 8jbTZZa3TfDTwFyR4bB+BvkwZH8B4Lq6zUtBDhL0B4WDBH9OrnY/ZIAuUCLySCed3G
 BY0pW/832nzdNqDcLtde/+ux9ozmIiM3YLALWMwekxe0nZCbZ8Eac9fyNJkYF8xblI
 zzUk/gDwJpgD0wAYRzlFYo+zhx5+msTuR9KF/8/1WOgKdEL1RlhcobAeHzb+LuS7g/
 jBCVo5DEsOze9uLZm95vmKlvgKfjbEPyxEhw1wZAFN+rxMTmDM0V/oXbaGrjJoZ0t1
 JqBkAezCYdBnA==
Date: Sun, 21 Nov 2021 08:43:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Calvin Zhang <calvinzhang.cool@gmail.com>
Message-ID: <YZnqo3oA7srQik4N@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
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
 linux-csky@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
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
 Rob Herring <robh+dt@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

T24gRnJpLCBOb3YgMTksIDIwMjEgYXQgMDM6NTg6MTdQTSArMDgwMCwgQ2FsdmluIFpoYW5nIHdy
b3RlOgo+IFRoZSBjb3VudCBvZiByZXNlcnZlZCByZWdpb25zIGluIC9yZXNlcnZlZC1tZW1vcnkg
d2FzIGxpbWl0ZWQgYmVjYXVzZQo+IHRoZSBzdHJ1Y3QgcmVzZXJ2ZWRfbWVtIGFycmF5IHdhcyBk
ZWZpbmVkIHN0YXRpY2FsbHkuIFRoaXMgc2VyaWVzIHNvcnRzCj4gb3V0IHJlc2VydmVkIG1lbW9y
eSBjb2RlIGFuZCBhbGxvY2F0ZXMgdGhhdCBhcnJheSBmcm9tIGVhcmx5IGFsbG9jYXRvci4KPiAK
PiBOb3RlOiByZXNlcnZlZCByZWdpb24gd2l0aCBmaXhlZCBsb2NhdGlvbiBtdXN0IGJlIHJlc2Vy
dmVkIGJlZm9yZSBhbnkKPiBtZW1vcnkgYWxsb2NhdGlvbi4gV2hpbGUgc3RydWN0IHJlc2VydmVk
X21lbSBhcnJheSBzaG91bGQgYmUgYWxsb2NhdGVkCj4gYWZ0ZXIgYWxsb2NhdG9yIGlzIGFjdGl2
YXRlZC4gV2UgbWFrZSBlYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpCj4gZG8gcmVz
ZXJ2YXRpb24gb25seSBhbmQgYWRkIGFub3RoZXIgY2FsbCB0byBpbml0aWFsaXplIHJlc2VydmVk
IG1lbW9yeS4KPiBTbyBhcmNoIGNvZGUgaGF2ZSB0byBjaGFuZ2UgZm9yIGl0LgoKSSB0aGluayBt
dWNoIHNpbXBsZXIgd291bGQgYmUgdG8gdXNlIHRoZSBzYW1lIGNvbnN0YW50IGZvciBzaXppbmcK
bWVtYmxvY2sucmVzZXJ2ZWQgYW5kIHJlc2VydmVkX21lbSBhcnJheXMuCgpJZiB0aGVyZSBpcyB0
b28gbXVjaCByZXNlcnZlZCByZWdpb25zIGluIHRoZSBkZXZpY2UgdHJlZSwgcmVzZXJ2aW5nIHRo
ZW0gaW4KbWVtYmxvY2sgd2lsbCBmYWlsIGFueXdheSBiZWNhdXNlIG1lbWJsb2NrIGFsc28gc3Rh
cnRzIHdpdGggc3RhdGljIGFycmF5CmZvciBtZW1ibG9jay5yZXNlcnZlZCwgc28gZG9pbmcgb25l
IHBhc3Mgd2l0aCBtZW1ibG9ja19yZXNlcnZlKCkgYW5kCmFub3RoZXIgdG8gc2V0IHVwIHJlc2Vy
dmVkX21lbSB3b3VsZG4ndCBoZWxwIGFueXdheS4KCj4gSSdtIG9ubHkgZmFtaWxpYXIgd2l0aCBh
cm0gYW5kIGFybTY0IGFyY2hpdGVjdHVyZXMuIEFwcHJvdmFscyBmcm9tIGFyY2gKPiBtYWludGFp
bmVycyBhcmUgcmVxdWlyZWQuIFRoYW5rIHlvdSBhbGwuCj4gCj4gQ2FsdmluIFpoYW5nICgyKToK
PiAgIG9mOiBTb3J0IHJlc2VydmVkX21lbSByZWxhdGVkIGNvZGUKPiAgIG9mOiByZXNlcnZlZF9t
ZW06IFJlbW92ZSByZXNlcnZlZCByZWdpb25zIGNvdW50IHJlc3RyaWN0aW9uCj4gCj4gIGFyY2gv
YXJjL21tL2luaXQuYyAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ICBhcmNoL2FybS9rZXJuZWwv
c2V0dXAuYyAgICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9hcm02NC9rZXJuZWwvc2V0dXAuYyAg
ICAgICAgICB8ICAgMyArCj4gIGFyY2gvY3NreS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgfCAg
IDMgKwo+ICBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAyICsKPiAgYXJj
aC9taXBzL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8ICAgMyArCj4gIGFyY2gvbmRzMzIva2Vy
bmVsL3NldHVwLmMgICAgICAgICAgfCAgIDMgKwo+ICBhcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICB8
ICAgMyArCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmMgfCAgIDMgKwo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgICAyICsKPiAgYXJjaC9zaC9rZXJu
ZWwvc2V0dXAuYyAgICAgICAgICAgICB8ICAgMyArCj4gIGFyY2gveHRlbnNhL2tlcm5lbC9zZXR1
cC5jICAgICAgICAgfCAgIDIgKwo+ICBkcml2ZXJzL29mL2ZkdC5jICAgICAgICAgICAgICAgICAg
IHwgMTA3ICstLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9vZi9vZl9wcml2YXRlLmggICAgICAg
ICAgICB8ICAxMiArLQo+ICBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jICAgICAgIHwgMTg5
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvbGludXgvb2ZfcmVzZXJ2
ZWRfbWVtLmggICAgfCAgIDQgKwo+ICAxNyBmaWxlcyBjaGFuZ2VkLCAyMDcgaW5zZXJ0aW9ucygr
KSwgMTM5IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuMzAuMgo+IAoKLS0gClNpbmNlcmVseSB5
b3VycywKTWlrZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A81584B6B79
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 12:48:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AFA7C24821;
	Tue, 15 Feb 2022 12:48:14 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 1A20C24817
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 11:39:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E1E13D5;
 Tue, 15 Feb 2022 02:39:17 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B7AE3F66F;
 Tue, 15 Feb 2022 02:39:10 -0800 (PST)
Date: Tue, 15 Feb 2022 10:39:06 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YguCysZGYYWUhAPk@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
 <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 15 Feb 2022 12:48:13 +0100
Subject: Re: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6Mzk6NDZBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAxMDoyMSBBTSBBcmQgQmllc2hldXZlbCA8
YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIFR1ZSwgMTUgRmViIDIwMjIgYXQgMTA6MTMs
IEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gYXJtNjQgYWxz
byBoYXMgdGhpcyBsZWFkaW5nIHVwIHRvIHRoZSByYW5nZSBjaGVjaywgYW5kIEkgdGhpbmsgd2Un
ZCBubwo+ID4gbG9uZ2VyIG5lZWQgaXQ6Cj4gPgo+ID4gICAgIGlmIChJU19FTkFCTEVEKENPTkZJ
R19BUk02NF9UQUdHRURfQUREUl9BQkkpICYmCj4gPiAgICAgICAgIChjdXJyZW50LT5mbGFncyAm
IFBGX0tUSFJFQUQgfHwgdGVzdF90aHJlYWRfZmxhZyhUSUZfVEFHR0VEX0FERFIpKSkKPiA+ICAg
ICAgICAgICAgIGFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOwo+IAo+IEkgc3VzcGVjdCB0aGUg
ZXhwZW5zaXZlIHBhcnQgaGVyZSBpcyBjaGVja2luZyB0aGUgdHdvIGZsYWdzLCBhcyB1bnRhZ2dl
ZF9hZGRyKCkKPiBzZWVtcyB0byBhbHdheXMganVzdCBhZGQgYSBzYmZ4IGluc3RydWN0aW9uLiBX
b3VsZCB0aGlzIHdvcms/Cj4gCj4gI2lmZGVmIENPTkZJR19BUk02NF9UQUdHRURfQUREUl9BQkkK
PiAjZGVmaW5lIGFjY2Vzc19vayhwdHIsIHNpemUpIF9fYWNjZXNzX29rKHVudGFnZ2VkX2FkZHIo
cHRyKSwgKHNpemUpKQo+ICNlbHNlIC8vIHRoZSBlbHNlIHBhdGggaXMgdGhlIGRlZmF1bHQsIHRo
aXMgY2FuIGJlIGxlZnQgb3V0Lgo+ICNkZWZpbmUgYWNjZXNzX29rKHB0ciwgc2l6ZSkgX19hY2Nl
c3Nfb2soKHB0ciksIChzaXplKSkKPiAjZW5kaWYKClRoaXMgd291bGQgYmUgYW4gQUJJIGNoYW5n
ZSwgZS5nLiBmb3IgdGFza3Mgd2l0aG91dCBUSUZfVEFHR0VEX0FERFIuCgpJIGRvbid0IHRoaW5r
IHdlIHNob3VsZCBjaGFuZ2UgdGhpcyBhcyBwYXJ0IG9mIHRoaXMgc2VyaWVzLgoKVGhhbmtzLApN
YXJrLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

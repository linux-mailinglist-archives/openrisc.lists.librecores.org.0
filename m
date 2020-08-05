Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 47F6B2460E2
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E45DD20E9B;
	Mon, 17 Aug 2020 10:46:49 +0200 (CEST)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id D209220DA3
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 13:01:46 +0200 (CEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1k3HAl-0001HW-01; Wed, 05 Aug 2020 13:01:27 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 899DDC0C25; Wed,  5 Aug 2020 13:00:35 +0200 (CEST)
Date: Wed, 5 Aug 2020 13:00:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200805110035.GB11658@alpha.franken.de>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-13-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-13-rppt@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 12/17] arch,
 drivers: replace for_each_membock() with for_each_mem_range()
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBdWcgMDIsIDIwMjAgYXQgMDc6MzU6NTZQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhl
cmUgYXJlIHNldmVyYWwgb2NjdXJyZW5jZXMgb2YgdGhlIGZvbGxvd2luZyBwYXR0ZXJuOgo+IAo+
IAlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewo+IAkJc3RhcnQgPSBfX3Bmbl90b19w
aHlzKG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4ocmVnKTsKPiAJCWVuZCA9IF9fcGZu
X3RvX3BoeXMobWVtYmxvY2tfcmVnaW9uX21lbW9yeV9lbmRfcGZuKHJlZykpOwo+IAo+IAkJLyog
ZG8gc29tZXRoaW5nIHdpdGggc3RhcnQgYW5kIGVuZCAqLwo+IAl9Cj4gCj4gVXNpbmcgZm9yX2Vh
Y2hfbWVtX3JhbmdlKCkgaXRlcmF0b3IgaXMgbW9yZSBhcHByb3ByaWF0ZSBpbiBzdWNoIGNhc2Vz
IGFuZAo+IGFsbG93cyBzaW1wbGVyIGFuZCBjbGVhbmVyIGNvZGUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0tLQo+ICBhcmNoL21pcHMv
Y2F2aXVtLW9jdGVvbi9kbWEtb2N0ZW9uLmMgICAgIHwgMTIgKysrLS0tCj4gIGFyY2gvbWlwcy9r
ZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICAgfCAzMSArKysrKysrLS0tLS0tLS0KCkFja2Vk
LWJ5OiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlPgoKVGhv
bWFzLgoKLS0gCkNyYXAgY2FuIHdvcmsuIEdpdmVuIGVub3VnaCB0aHJ1c3QgcGlncyB3aWxsIGZs
eSwgYnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGEKZ29vZCBpZGVhLiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTkyNSwgMi4zIF0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

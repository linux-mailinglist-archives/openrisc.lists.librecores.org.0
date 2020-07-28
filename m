Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 817C5246095
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4E9FE20CFB;
	Mon, 17 Aug 2020 10:45:40 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 7631220B0E
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 08:37:53 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EF4D868B05; Tue, 28 Jul 2020 08:37:49 +0200 (CEST)
Date: Tue, 28 Jul 2020 08:37:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200728063749.GA21221@lst.de>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-3-rppt@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 02/15] dma-contiguous: simplify
 cma_early_percent_memory()
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDg6MTE6NDBBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhl
IG1lbW9yeSBzaXplIGNhbGN1bGF0aW9uIGluIGNtYV9lYXJseV9wZXJjZW50X21lbW9yeSgpIHRy
YXZlcnNlcwo+IG1lbWJsb2NrLm1lbW9yeSByYXRoZXIgdGhhbiBzaW1wbHkgY2FsbCBtZW1ibG9j
a19waHlzX21lbV9zaXplKCkuIFRoZQo+IGNvbW1lbnQgaW4gdGhhdCBmdW5jdGlvbiBzdWdnZXN0
cyB0aGF0IGF0IHNvbWUgcG9pbnQgdGhlcmUgc2hvdWxkIGhhdmUgYmVlbgo+IGNhbGwgdG8gbWVt
YmxvY2tfYW5hbHl6ZSgpIGJlZm9yZSBtZW1ibG9ja19waHlzX21lbV9zaXplKCkgY291bGQgYmUg
dXNlZC4KPiBBcyBvZiBub3csIHRoZXJlIGlzIG5vIG1lbWJsb2NrX2FuYWx5emUoKSBhdCBhbGwg
YW5kCj4gbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpIGNhbiBiZSB1c2VkIGFzIHNvb24gYXMgY29s
ZC1wbHVnIG1lbW9yeSBpcwo+IHJlZ2lzdGVyZCB3aXRoIG1lbWJsb2NrLgo+IAo+IFJlcGxhY2Ug
bG9vcCBvdmVyIG1lbWJsb2NrLm1lbW9yeSB3aXRoIGEgY2FsbCB0byBtZW1ibG9ja19waHlzX21l
bV9zaXplKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgoKTG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 107872460E0
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9675820EA0;
	Mon, 17 Aug 2020 10:46:48 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8AD58202F7
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 07:59:25 +0200 (CEST)
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F6D52245C;
 Wed,  5 Aug 2020 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596607163;
 bh=98OyFugr4kZ7qKas+6tJmd32bt21nxcRSc+5tICHYwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bFmzYj+zADb5AKblo2g0DgWjvGdXklBuYzqYEb/bV7Yw5rUPqvopeaYYFO/WWTsRW
 gO4LMsnKLyGKpLkE+r1ZBLYgrpUqrQj3zGD/ZjUFqQD9wkQbnCH0InqIJvH59bfj/G
 n4Fa0+GKXLSBH7lRyh5REisKXEzk8RqmUTgZIFYg=
Date: Wed, 5 Aug 2020 08:59:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Message-ID: <20200805055909.GD8243@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-14-rppt@kernel.org>
 <20200805042024.GT10792@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805042024.GT10792@MiWiFi-R3L-srv>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: Re: [OpenRISC] [PATCH v2 13/17] x86/setup: simplify initrd
 relocation and reservation
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMTI6MjA6MjRQTSArMDgwMCwgQmFvcXVhbiBIZSB3cm90
ZToKPiBPbiAwOC8wMi8yMCBhdCAwNzozNXBtLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBDdXJyZW50bHks
IGluaXRyZCBpbWFnZSBpcyByZXNlcnZlZCB2ZXJ5IGVhcmx5IGR1cmluZyBzZXR1cCBhbmQgdGhl
biBpdAo+ID4gbWlnaHQgYmUgcmVsb2NhdGVkIGFuZCByZS1yZXNlcnZlZCBhZnRlciB0aGUgaW5p
dGlhbCBwaHlzaWNhbCBtZW1vcnkKPiA+IG1hcHBpbmcgaXMgY3JlYXRlZC4gVGhlICJsYXRlIiBy
ZXNlcnZhdGlvbiBvZiBtZW1ibG9jayB2ZXJpZmllcyB0aGF0IG1hcHBlZAo+ID4gbWVtb3J5IHNp
emUgZXhjZWVkcyB0aGUgc2l6ZSBvZiBpbml0cmQsIHRoZSBjaGVja3Mgd2hldGhlciB0aGUgcmVs
b2NhdGlvbgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH4gdGhl
bj8KClJpZ2h0LCB0aGFua3MhCgo+ID4gcmVxdWlyZWQgYW5kLCBpZiB5ZXMsIHJlbG9jYXRlcyBp
bmlydGQgdG8gYSBuZXcgbWVtb3J5IGFsbG9jYXRlZCBmcm9tCj4gPiBtZW1ibG9jayBhbmQgZnJl
ZXMgdGhlIG9sZCBsb2NhdGlvbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

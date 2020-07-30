Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 98A2D24609F
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7289020DAC;
	Mon, 17 Aug 2020 10:45:47 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 650C320CE1
 for <openrisc@lists.librecores.org>; Thu, 30 Jul 2020 14:04:00 +0200 (CEST)
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E80B20829;
 Thu, 30 Jul 2020 12:03:52 +0000 (UTC)
Date: Thu, 30 Jul 2020 13:03:50 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200730120349.GL25149@gaia>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-5-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 04/15] arm64: numa: simplify dummy_numa_init()
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

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMDg6MTE6NDJBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gZHVt
bXlfbnVtYV9pbml0KCkgbG9vcHMgb3ZlciBtZW1ibG9jay5tZW1vcnkgYW5kIHBhc3NlcyBuaWQ9
MCB0bwo+IG51bWFfYWRkX21lbWJsaygpIHdoaWNoIGVzc2VudGlhbGx5IHdyYXBzIG1lbWJsb2Nr
X3NldF9ub2RlKCkuIEhvd2V2ZXIsCj4gbWVtYmxvY2tfc2V0X25vZGUoKSBjYW4gY29wZSB3aXRo
IGVudGlyZSBtZW1vcnkgc3BhbiBpdHNlbGYsIHNvIHRoZSBsb29wCj4gb3ZlciBtZW1ibG9jay5t
ZW1vcnkgcmVnaW9ucyBpcyByZWR1bmRhbnQuCj4gCj4gUmVwbGFjZSB0aGUgbG9vcCB3aXRoIGEg
c2luZ2xlIGNhbGwgdG8gbWVtYmxvY2tfc2V0X25vZGUoKSB0byB0aGUgZW50aXJlCj4gbWVtb3J5
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
CkFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

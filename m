Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 530282460BF
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C420220DD4;
	Mon, 17 Aug 2020 10:46:24 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1EC3620B98
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 12:56:21 +0200 (CEST)
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F93A204EA;
 Tue, 28 Jul 2020 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595933779;
 bh=rNeOQgk8Ja8EnwwwD3eYzStK24lMrD6z0cTMgy9a9QQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GaqX56Rbj+N1Mz6UyTAyoeiV2UjmyQ1JRRE5tNv2GNU4C8YMxHr+kbNtL4JzJlsAy
 ScdjYPyI8moETB7oZ34zmIQmli78wpYsgkku4f7CIjv3woY2fEo2HxXSUsaNO4HEay
 kodVMJnUU7dTJtF+OWGSFGl3TO2fwrpo3QfCz2LQ=
Date: Tue, 28 Jul 2020 13:56:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Message-ID: <20200728105602.GB3655207@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-15-rppt@kernel.org>
 <20200728104440.GA222284@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728104440.GA222284@gmail.com>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH 14/15] x86/numa: remove redundant iteration
 over memblock.reserved
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

T24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMTI6NDQ6NDBQTSArMDIwMCwgSW5nbyBNb2xuYXIgd3Jv
dGU6Cj4gCj4gKiBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4g
RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+ID4gCj4gPiBudW1hX2Ns
ZWFyX2tlcm5lbF9ub2RlX2hvdHBsdWcoKSBmdW5jdGlvbiBmaXJzdCB0cmF2ZXJzZXMgbnVtYV9t
ZW1pbmZvCj4gPiByZWdpb25zIHRvIHNldCBub2RlIElEIGluIG1lbWJsb2NrLnJlc2VydmVkIGFu
ZCB0aGFuIHRyYXZlcnNlcwo+ID4gbWVtYmxvY2sucmVzZXJ2ZWQgdG8gdXBkYXRlIHJlc2VydmVk
X25vZGVtYXNrIHRvIGluY2x1ZGUgbm9kZSBJRHMgdGhhdCB3ZXJlCj4gPiBzZXQgaW4gdGhlIGZp
cnN0IGxvb3AuCj4gPiAKPiA+IFJlbW92ZSByZWR1bmRhbnQgdHJhdmVyc2FsIG92ZXIgbWVtYmxv
Y2sucmVzZXJ2ZWQgYW5kIHVwZGF0ZQo+ID4gcmVzZXJ2ZWRfbm9kZW1hc2sgd2hpbGUgaXRlcmF0
aW5nIG92ZXIgbnVtYV9tZW1pbmZvLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9w
b3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3g4Ni9tbS9udW1hLmMg
fCAyNiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBJIHN1c3BlY3QgeW91J2QgbGlrZSB0
byBjYXJyeSB0aGlzIGluIHRoZSAtbW0gdHJlZT8KClllcy4KIAo+IEFja2VkLWJ5OiBJbmdvIE1v
bG5hciA8bWluZ29Aa2VybmVsLm9yZz4KClRoYW5rcyEKCj4gVGhhbmtzLAo+IAo+IAlJbmdvCgot
LSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=

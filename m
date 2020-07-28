Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CDF162460B0
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CECEE204D4;
	Mon, 17 Aug 2020 10:46:08 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A681820CB4
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:12:34 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B6452070A;
 Tue, 28 Jul 2020 05:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913153;
 bh=4DNtFGpQ7uDaB3zOvxrPIrzPc60FGUwiPzAlH9TywcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m3WIeA90qkRvl2gsmAfQuDGwJAbJi5UUCCAg4LmaseT2GduhfCilwi3H3N+JLaGfy
 J6liV31fxMOs5Q3H2ZjqTO28omsPhlPG1oCTgC9Eu3s2MLIy3PimP/FPxYL28QvZkd
 olHKuwsJqS/tqZjOOqJgFqsJsJs1UbU0Wq3HadR8=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:40 +0300
Message-Id: <20200728051153.1590-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 02/15] dma-contiguous: simplify
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
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG1lbW9yeSBzaXpl
IGNhbGN1bGF0aW9uIGluIGNtYV9lYXJseV9wZXJjZW50X21lbW9yeSgpIHRyYXZlcnNlcwptZW1i
bG9jay5tZW1vcnkgcmF0aGVyIHRoYW4gc2ltcGx5IGNhbGwgbWVtYmxvY2tfcGh5c19tZW1fc2l6
ZSgpLiBUaGUKY29tbWVudCBpbiB0aGF0IGZ1bmN0aW9uIHN1Z2dlc3RzIHRoYXQgYXQgc29tZSBw
b2ludCB0aGVyZSBzaG91bGQgaGF2ZSBiZWVuCmNhbGwgdG8gbWVtYmxvY2tfYW5hbHl6ZSgpIGJl
Zm9yZSBtZW1ibG9ja19waHlzX21lbV9zaXplKCkgY291bGQgYmUgdXNlZC4KQXMgb2Ygbm93LCB0
aGVyZSBpcyBubyBtZW1ibG9ja19hbmFseXplKCkgYXQgYWxsIGFuZAptZW1ibG9ja19waHlzX21l
bV9zaXplKCkgY2FuIGJlIHVzZWQgYXMgc29vbiBhcyBjb2xkLXBsdWcgbWVtb3J5IGlzCnJlZ2lz
dGVyZCB3aXRoIG1lbWJsb2NrLgoKUmVwbGFjZSBsb29wIG92ZXIgbWVtYmxvY2subWVtb3J5IHdp
dGggYSBjYWxsIHRvIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKS4KClNpZ25lZC1vZmYtYnk6IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBrZXJuZWwvZG1hL2NvbnRpZ3Vv
dXMuYyB8IDExICstLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvY29udGlndW91cy5jIGIva2Vy
bmVsL2RtYS9jb250aWd1b3VzLmMKaW5kZXggMTViYzUwMjZjNDg1Li4xOTkyYWZkOGNhN2IgMTAw
NjQ0Ci0tLSBhL2tlcm5lbC9kbWEvY29udGlndW91cy5jCisrKyBiL2tlcm5lbC9kbWEvY29udGln
dW91cy5jCkBAIC03MywxNiArNzMsNyBAQCBlYXJseV9wYXJhbSgiY21hIiwgZWFybHlfY21hKTsK
IAogc3RhdGljIHBoeXNfYWRkcl90IF9faW5pdCBfX21heWJlX3VudXNlZCBjbWFfZWFybHlfcGVy
Y2VudF9tZW1vcnkodm9pZCkKIHsKLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7Ci0JdW5z
aWduZWQgbG9uZyB0b3RhbF9wYWdlcyA9IDA7Ci0KLQkvKgotCSAqIFdlIGNhbm5vdCB1c2UgbWVt
YmxvY2tfcGh5c19tZW1fc2l6ZSgpIGhlcmUsIGJlY2F1c2UKLQkgKiBtZW1ibG9ja19hbmFseXpl
KCkgaGFzIG5vdCBiZWVuIGNhbGxlZCB5ZXQuCi0JICovCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVt
b3J5LCByZWcpCi0JCXRvdGFsX3BhZ2VzICs9IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3Bm
bihyZWcpIC0KLQkJCSAgICAgICBtZW1ibG9ja19yZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHJlZyk7
CisJdW5zaWduZWQgbG9uZyB0b3RhbF9wYWdlcyA9IFBIWVNfUEZOKG1lbWJsb2NrX3BoeXNfbWVt
X3NpemUoKSk7CiAKIAlyZXR1cm4gKHRvdGFsX3BhZ2VzICogQ09ORklHX0NNQV9TSVpFX1BFUkNF
TlRBR0UgLyAxMDApIDw8IFBBR0VfU0hJRlQ7CiB9Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

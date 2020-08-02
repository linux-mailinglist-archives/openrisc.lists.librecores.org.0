Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4E2460C6
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3E82020DEF;
	Mon, 17 Aug 2020 10:46:31 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6176020D53
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:36:39 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A00E207BB;
 Sun,  2 Aug 2020 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386197;
 bh=xcGEWjGQ/q+Opr/28a2ZIyYFBp4V7lSmr/sGm/UAQ8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SOgVggGMxb05aldaV4gL3FEB6ytnfwQ2Hfm+aVpQEhS2YGYbhdfAH/QPMj7HPwMI5
 XeDdGGe8NG9Bu+bKWfKtRHFHzAo7hMYHFjPAEpwDsXjCnkv+BRSh91vwkb3pCHvFSs
 nw74lyhHI2uN7uS39+6+ts/f3izbiKTGZDfFdKRE=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:46 +0300
Message-Id: <20200802163601.8189-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH v2 02/17] dma-contiguous: simplify
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
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGtlcm5lbC9kbWEvY29udGlndW91cy5jIHwgMTEgKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9jb250aWd1b3VzLmMgYi9rZXJuZWwvZG1hL2NvbnRp
Z3VvdXMuYwppbmRleCAxNWJjNTAyNmM0ODUuLjE5OTJhZmQ4Y2E3YiAxMDA2NDQKLS0tIGEva2Vy
bmVsL2RtYS9jb250aWd1b3VzLmMKKysrIGIva2VybmVsL2RtYS9jb250aWd1b3VzLmMKQEAgLTcz
LDE2ICs3Myw3IEBAIGVhcmx5X3BhcmFtKCJjbWEiLCBlYXJseV9jbWEpOwogCiBzdGF0aWMgcGh5
c19hZGRyX3QgX19pbml0IF9fbWF5YmVfdW51c2VkIGNtYV9lYXJseV9wZXJjZW50X21lbW9yeSh2
b2lkKQogewotCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsKLQl1bnNpZ25lZCBsb25nIHRv
dGFsX3BhZ2VzID0gMDsKLQotCS8qCi0JICogV2UgY2Fubm90IHVzZSBtZW1ibG9ja19waHlzX21l
bV9zaXplKCkgaGVyZSwgYmVjYXVzZQotCSAqIG1lbWJsb2NrX2FuYWx5emUoKSBoYXMgbm90IGJl
ZW4gY2FsbGVkIHlldC4KLQkgKi8KLQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykKLQkJ
dG90YWxfcGFnZXMgKz0gbWVtYmxvY2tfcmVnaW9uX21lbW9yeV9lbmRfcGZuKHJlZykgLQotCQkJ
ICAgICAgIG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfYmFzZV9wZm4ocmVnKTsKKwl1bnNpZ25lZCBs
b25nIHRvdGFsX3BhZ2VzID0gUEhZU19QRk4obWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpKTsKIAog
CXJldHVybiAodG90YWxfcGFnZXMgKiBDT05GSUdfQ01BX1NJWkVfUEVSQ0VOVEFHRSAvIDEwMCkg
PDwgUEFHRV9TSElGVDsKIH0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

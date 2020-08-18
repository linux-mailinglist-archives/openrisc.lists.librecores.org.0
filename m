Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0DECF2499B4
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 01EC820CD9;
	Wed, 19 Aug 2020 11:55:44 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C0BF620AF7
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:17:11 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3188A2054F;
 Tue, 18 Aug 2020 15:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763830;
 bh=Tc7JOtILZvhmn/QZSq/rDuumFmni1KkgrRzI9vNcyIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LGeqCVGqnjrha4TWndZaE/VnVhphBLSJIhWexklI8V6bUgoTtQfgaa8M9GXlf/+XT
 WHUWAaZKTipeFUYBV6OLDTInvZP09FVWD6Y83cd7blmmE3C/RloP3ygxxjtDeRP+pl
 Lwv5+wEO4Xr3K0oZUXYD0eSo61PTTILdUD0cRgzU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:19 +0300
Message-Id: <20200818151634.14343-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 02/17] dma-contiguous: simplify
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
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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
ZWxsd2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5j
b20+Ci0tLQoga2VybmVsL2RtYS9jb250aWd1b3VzLmMgfCAxMSArLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9r
ZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYyBiL2tlcm5lbC9kbWEvY29udGlndW91cy5jCmluZGV4IGNm
ZjdlNjA5NjhiOS4uMDM2OWZkNWZkYThmIDEwMDY0NAotLS0gYS9rZXJuZWwvZG1hL2NvbnRpZ3Vv
dXMuYworKysgYi9rZXJuZWwvZG1hL2NvbnRpZ3VvdXMuYwpAQCAtNzMsMTYgKzczLDcgQEAgZWFy
bHlfcGFyYW0oImNtYSIsIGVhcmx5X2NtYSk7CiAKIHN0YXRpYyBwaHlzX2FkZHJfdCBfX2luaXQg
X19tYXliZV91bnVzZWQgY21hX2Vhcmx5X3BlcmNlbnRfbWVtb3J5KHZvaWQpCiB7Ci0Jc3RydWN0
IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOwotCXVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXMgPSAwOwot
Ci0JLyoKLQkgKiBXZSBjYW5ub3QgdXNlIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKSBoZXJlLCBi
ZWNhdXNlCi0JICogbWVtYmxvY2tfYW5hbHl6ZSgpIGhhcyBub3QgYmVlbiBjYWxsZWQgeWV0Lgot
CSAqLwotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKQotCQl0b3RhbF9wYWdlcyArPSBt
ZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9wZm4ocmVnKSAtCi0JCQkgICAgICAgbWVtYmxvY2tf
cmVnaW9uX21lbW9yeV9iYXNlX3BmbihyZWcpOworCXVuc2lnbmVkIGxvbmcgdG90YWxfcGFnZXMg
PSBQSFlTX1BGTihtZW1ibG9ja19waHlzX21lbV9zaXplKCkpOwogCiAJcmV0dXJuICh0b3RhbF9w
YWdlcyAqIENPTkZJR19DTUFfU0laRV9QRVJDRU5UQUdFIC8gMTAwKSA8PCBQQUdFX1NISUZUOwog
fQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

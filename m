Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 11BF42499B3
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9E4E820CBE;
	Wed, 19 Aug 2020 11:55:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 59B8120B64
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:17:01 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 263212076E;
 Tue, 18 Aug 2020 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763819;
 bh=ylWhwiFM7Obo+eRxZUr7GmKhaKz7f1+YPfRZdPbto5M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lVcTgt1q2F5hubs/cN48dtaOxOQJ9mV8AoapoK1n6LFrBWU+b0Sh8TD35ZAthEwP2
 0ZOR7+CZefQJ1OGqXIc4A7CboGZjsKb+tVzVnqXN6rXS5knGCLHn6PfJBBX68c5L5F
 CGQ5QOJJxEnTj567AbAKslG9FG0zccZ6gi7lSsdg=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:18 +0300
Message-Id: <20200818151634.14343-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 01/17] KVM: PPC: Book3S HV: simplify
 kvm_cma_reserve()
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
IGNhbGN1bGF0aW9uIGluIGt2bV9jbWFfcmVzZXJ2ZSgpIHRyYXZlcnNlcyBtZW1ibG9jay5tZW1v
cnkKcmF0aGVyIHRoYW4gc2ltcGx5IGNhbGwgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLiBUaGUg
Y29tbWVudCBpbiB0aGF0CmZ1bmN0aW9uIHN1Z2dlc3RzIHRoYXQgYXQgc29tZSBwb2ludCB0aGVy
ZSBzaG91bGQgaGF2ZSBiZWVuIGNhbGwgdG8KbWVtYmxvY2tfYW5hbHl6ZSgpIGJlZm9yZSBtZW1i
bG9ja19waHlzX21lbV9zaXplKCkgY291bGQgYmUgdXNlZC4KQXMgb2Ygbm93LCB0aGVyZSBpcyBu
byBtZW1ibG9ja19hbmFseXplKCkgYXQgYWxsIGFuZAptZW1ibG9ja19waHlzX21lbV9zaXplKCkg
Y2FuIGJlIHVzZWQgYXMgc29vbiBhcyBjb2xkLXBsdWcgbWVtb3J5IGlzCnJlZ2lzdGVyZCB3aXRo
IG1lbWJsb2NrLgoKUmVwbGFjZSBsb29wIG92ZXIgbWVtYmxvY2subWVtb3J5IHdpdGggYSBjYWxs
IHRvIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKS4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3Bv
cnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9i
dWlsdGluLmMgfCAxMiArKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNz
X2h2X2J1aWx0aW4uYyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X2J1aWx0aW4uYwppbmRl
eCAwNzM2MTdjZTgzZTAuLjhmNThkZDIwYjM2MiAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL2t2
bS9ib29rM3NfaHZfYnVpbHRpbi5jCisrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X2J1
aWx0aW4uYwpAQCAtOTUsMjMgKzk1LDE1IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9mcmVlX2hw
dF9jbWEpOwogdm9pZCBfX2luaXQga3ZtX2NtYV9yZXNlcnZlKHZvaWQpCiB7CiAJdW5zaWduZWQg
bG9uZyBhbGlnbl9zaXplOwotCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsKLQlwaHlzX2Fk
ZHJfdCBzZWxlY3RlZF9zaXplID0gMDsKKwlwaHlzX2FkZHJfdCBzZWxlY3RlZF9zaXplOwogCiAJ
LyoKIAkgKiBXZSBuZWVkIENNQSByZXNlcnZhdGlvbiBvbmx5IHdoZW4gd2UgYXJlIGluIEhWIG1v
ZGUKIAkgKi8KIAlpZiAoIWNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX0hWTU9ERSkpCiAJCXJldHVy
bjsKLQkvKgotCSAqIFdlIGNhbm5vdCB1c2UgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpIGhlcmUs
IGJlY2F1c2UKLQkgKiBtZW1ibG9ja19hbmFseXplKCkgaGFzIG5vdCBiZWVuIGNhbGxlZCB5ZXQu
Ci0JICovCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcpCi0JCXNlbGVjdGVkX3NpemUg
Kz0gbWVtYmxvY2tfcmVnaW9uX21lbW9yeV9lbmRfcGZuKHJlZykgLQotCQkJCSBtZW1ibG9ja19y
ZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHJlZyk7CiAKLQlzZWxlY3RlZF9zaXplID0gKHNlbGVjdGVk
X3NpemUgKiBrdm1fY21hX3Jlc3ZfcmF0aW8gLyAxMDApIDw8IFBBR0VfU0hJRlQ7CisJc2VsZWN0
ZWRfc2l6ZSA9IFBBR0VfQUxJR04obWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpICoga3ZtX2NtYV9y
ZXN2X3JhdGlvIC8gMTAwKTsKIAlpZiAoc2VsZWN0ZWRfc2l6ZSkgewogCQlwcl9pbmZvKCIlczog
cmVzZXJ2aW5nICVsZCBNaUIgZm9yIGdsb2JhbCBhcmVhXG4iLCBfX2Z1bmNfXywKIAkJCSAodW5z
aWduZWQgbG9uZylzZWxlY3RlZF9zaXplIC8gU1pfMU0pOwotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

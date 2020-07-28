Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E30EC2460B2
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7DF0D20D53;
	Mon, 17 Aug 2020 10:46:11 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8FB7E20CC4
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:12:54 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13A8121883;
 Tue, 28 Jul 2020 05:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913173;
 bh=qkTb6G6sC5adsTqHQyd7bT8V4WYx2oAV2sECBmwt5OQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wt1p0YyBgor/93NHcOqjOUm3At5dqz/sRzw9h9n6XfVzCHEaX1bZW3fuapQfmdf2z
 sQz2uepSCtKxhcfipNySyfhMav8LB88xjE8OgOcqYfeQ3ZAJhYWReV0msWpup2pk2/
 j6tZq2lZvVV2OFcdC/B0nOlrCcmOC888LNy9rcDk=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:42 +0300
Message-Id: <20200728051153.1590-5-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 04/15] arm64: numa: simplify dummy_numa_init()
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZHVtbXlfbnVtYV9pbml0
KCkgbG9vcHMgb3ZlciBtZW1ibG9jay5tZW1vcnkgYW5kIHBhc3NlcyBuaWQ9MCB0bwpudW1hX2Fk
ZF9tZW1ibGsoKSB3aGljaCBlc3NlbnRpYWxseSB3cmFwcyBtZW1ibG9ja19zZXRfbm9kZSgpLiBI
b3dldmVyLAptZW1ibG9ja19zZXRfbm9kZSgpIGNhbiBjb3BlIHdpdGggZW50aXJlIG1lbW9yeSBz
cGFuIGl0c2VsZiwgc28gdGhlIGxvb3AKb3ZlciBtZW1ibG9jay5tZW1vcnkgcmVnaW9ucyBpcyBy
ZWR1bmRhbnQuCgpSZXBsYWNlIHRoZSBsb29wIHdpdGggYSBzaW5nbGUgY2FsbCB0byBtZW1ibG9j
a19zZXRfbm9kZSgpIHRvIHRoZSBlbnRpcmUKbWVtb3J5LgoKU2lnbmVkLW9mZi1ieTogTWlrZSBS
YXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvYXJtNjQvbW0vbnVtYS5jIHwg
MTMgKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL251bWEuYyBiL2FyY2gvYXJtNjQv
bW0vbnVtYS5jCmluZGV4IGFhZmNlZTNlM2Y3ZS4uMGNiZGJjYzg4NWZiIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L21tL251bWEuYworKysgYi9hcmNoL2FybTY0L21tL251bWEuYwpAQCAtNDIzLDE5
ICs0MjMsMTYgQEAgc3RhdGljIGludCBfX2luaXQgbnVtYV9pbml0KGludCAoKmluaXRfZnVuYyko
dm9pZCkpCiAgKi8KIHN0YXRpYyBpbnQgX19pbml0IGR1bW15X251bWFfaW5pdCh2b2lkKQogewor
CXBoeXNfYWRkcl90IHN0YXJ0ID0gbWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpOworCXBoeXNfYWRk
cl90IGVuZCA9IG1lbWJsb2NrX2VuZF9vZl9EUkFNKCk7CiAJaW50IHJldDsKLQlzdHJ1Y3QgbWVt
YmxvY2tfcmVnaW9uICptYmxrOwogCiAJaWYgKG51bWFfb2ZmKQogCQlwcl9pbmZvKCJOVU1BIGRp
c2FibGVkXG4iKTsgLyogRm9yY2VkIG9mZiBvbiBjb21tYW5kIGxpbmUuICovCi0JcHJfaW5mbygi
RmFraW5nIGEgbm9kZSBhdCBbbWVtICUjMDE4THgtJSMwMThMeF1cbiIsCi0JCW1lbWJsb2NrX3N0
YXJ0X29mX0RSQU0oKSwgbWVtYmxvY2tfZW5kX29mX0RSQU0oKSAtIDEpOwotCi0JZm9yX2VhY2hf
bWVtYmxvY2sobWVtb3J5LCBtYmxrKSB7Ci0JCXJldCA9IG51bWFfYWRkX21lbWJsaygwLCBtYmxr
LT5iYXNlLCBtYmxrLT5iYXNlICsgbWJsay0+c2l6ZSk7Ci0JCWlmICghcmV0KQotCQkJY29udGlu
dWU7CisJcHJfaW5mbygiRmFraW5nIGEgbm9kZSBhdCBbbWVtICUjMDE4THgtJSMwMThMeF1cbiIs
IHN0YXJ0LCBlbmQgLSAxKTsKIAorCXJldCA9IG51bWFfYWRkX21lbWJsaygwLCBzdGFydCwgZW5k
KTsKKwlpZiAocmV0KSB7CiAJCXByX2VycigiTlVNQSBpbml0IGZhaWxlZFxuIik7CiAJCXJldHVy
biByZXQ7CiAJfQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

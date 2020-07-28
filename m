Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BBE6B2460BC
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6927E20BB4;
	Mon, 17 Aug 2020 10:46:22 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9BF6020CDB
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:14:33 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A319622B45;
 Tue, 28 Jul 2020 05:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913272;
 bh=hFA2o8it4I/HXbe86IOHmF4tlkZa8gVYSY+0N3aJP/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+RZG9ZnotcmsF2PkNa5zM/WFJM3ny9Ao4jVf4GZvFJO9XWUIy1uk0iFGD2FkFtN2
 /+/KrQiOLQR/E4QyReOgoyl9fI+gDphQS1WeTYk5sT9/kd5vjko1vVBIixO3xg+5dl
 6l0zbIn3ds2e3/BzAP/7In9EqpLZsIJvcvdKNYd8=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:52 +0300
Message-Id: <20200728051153.1590-15-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 14/15] x86/numa: remove redundant iteration over
 memblock.reserved
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKbnVtYV9jbGVhcl9rZXJu
ZWxfbm9kZV9ob3RwbHVnKCkgZnVuY3Rpb24gZmlyc3QgdHJhdmVyc2VzIG51bWFfbWVtaW5mbwpy
ZWdpb25zIHRvIHNldCBub2RlIElEIGluIG1lbWJsb2NrLnJlc2VydmVkIGFuZCB0aGFuIHRyYXZl
cnNlcwptZW1ibG9jay5yZXNlcnZlZCB0byB1cGRhdGUgcmVzZXJ2ZWRfbm9kZW1hc2sgdG8gaW5j
bHVkZSBub2RlIElEcyB0aGF0IHdlcmUKc2V0IGluIHRoZSBmaXJzdCBsb29wLgoKUmVtb3ZlIHJl
ZHVuZGFudCB0cmF2ZXJzYWwgb3ZlciBtZW1ibG9jay5yZXNlcnZlZCBhbmQgdXBkYXRlCnJlc2Vy
dmVkX25vZGVtYXNrIHdoaWxlIGl0ZXJhdGluZyBvdmVyIG51bWFfbWVtaW5mby4KClNpZ25lZC1v
ZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3g4Ni9t
bS9udW1hLmMgfCAyNiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L21tL251bWEuYyBiL2FyY2gveDg2L21tL251bWEuYwppbmRleCA4ZWU5NTIwMzhjODAuLjQwNzhh
YmQzMzkzOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbW0vbnVtYS5jCisrKyBiL2FyY2gveDg2L21t
L251bWEuYwpAQCAtNDk4LDMxICs0OTgsMjUgQEAgc3RhdGljIHZvaWQgX19pbml0IG51bWFfY2xl
YXJfa2VybmVsX25vZGVfaG90cGx1Zyh2b2lkKQogCSAqIGFuZCB1c2UgdGhvc2UgcmFuZ2VzIHRv
IHNldCB0aGUgbmlkIGluIG1lbWJsb2NrLnJlc2VydmVkLgogCSAqIFRoaXMgd2lsbCBzcGxpdCB1
cCB0aGUgbWVtYmxvY2sgcmVnaW9ucyBhbG9uZyBub2RlCiAJICogYm91bmRhcmllcyBhbmQgd2ls
bCBzZXQgdGhlIG5vZGUgSURzIGFzIHdlbGwuCisJICoKKwkgKiBUaGUgbmlkIHdpbGwgYWxzbyBi
ZSBzZXQgaW4gcmVzZXJ2ZWRfbm9kZW1hc2sgd2hpY2ggaXMgbGF0ZXIKKwkgKiB1c2VkIHRvIGNs
ZWFyIE1FTUJMT0NLX0hPVFBMVUcgZmxhZy4KKwkgKgorCSAqIFsgTm90ZSwgd2hlbiBib290aW5n
IHdpdGggbWVtPW5uW2tNR10gb3IgaW4gYSBrZHVtcCBrZXJuZWwsCisJICogICBudW1hX21lbWlu
Zm8gbWlnaHQgbm90IGluY2x1ZGUgYWxsIG1lbWJsb2NrLnJlc2VydmVkCisJICogICBtZW1vcnkg
cmFuZ2VzLCBiZWNhdXNlIHF1aXJrcyBzdWNoIGFzIHRyaW1fc25iX21lbW9yeSgpCisJICogICBy
ZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBTYW5keSBCcmlkZ2UgZ3JhcGhpY3MuCisJICogICBU
aGVzZSByYW5nZXMgd2lsbCByZW1haW4gd2l0aCBuaWQgPT0gTUFYX05VTU5PREVTLiBdCiAJICov
CiAJZm9yIChpID0gMDsgaSA8IG51bWFfbWVtaW5mby5ucl9ibGtzOyBpKyspIHsKIAkJc3RydWN0
IG51bWFfbWVtYmxrICptYiA9IG51bWFfbWVtaW5mby5ibGsgKyBpOwogCQlpbnQgcmV0OwogCiAJ
CXJldCA9IG1lbWJsb2NrX3NldF9ub2RlKG1iLT5zdGFydCwgbWItPmVuZCAtIG1iLT5zdGFydCwg
Jm1lbWJsb2NrLnJlc2VydmVkLCBtYi0+bmlkKTsKKwkJbm9kZV9zZXQobWItPm5pZCwgcmVzZXJ2
ZWRfbm9kZW1hc2spOwogCQlXQVJOX09OX09OQ0UocmV0KTsKIAl9CiAKLQkvKgotCSAqIE5vdyBn
byBvdmVyIGFsbCByZXNlcnZlZCBtZW1ibG9jayByZWdpb25zLCB0byBjb25zdHJ1Y3QgYQotCSAq
IG5vZGUgbWFzayBvZiBhbGwga2VybmVsIHJlc2VydmVkIG1lbW9yeSBhcmVhcy4KLQkgKgotCSAq
IFsgTm90ZSwgd2hlbiBib290aW5nIHdpdGggbWVtPW5uW2tNR10gb3IgaW4gYSBrZHVtcCBrZXJu
ZWwsCi0JICogICBudW1hX21lbWluZm8gbWlnaHQgbm90IGluY2x1ZGUgYWxsIG1lbWJsb2NrLnJl
c2VydmVkCi0JICogICBtZW1vcnkgcmFuZ2VzLCBiZWNhdXNlIHF1aXJrcyBzdWNoIGFzIHRyaW1f
c25iX21lbW9yeSgpCi0JICogICByZXNlcnZlIHNwZWNpZmljIHBhZ2VzIGZvciBTYW5keSBCcmlk
Z2UgZ3JhcGhpY3MuIF0KLQkgKi8KLQlmb3JfZWFjaF9tZW1ibG9jayhyZXNlcnZlZCwgbWJfcmVn
aW9uKSB7Ci0JCWludCBuaWQgPSBtZW1ibG9ja19nZXRfcmVnaW9uX25vZGUobWJfcmVnaW9uKTsK
LQotCQlpZiAobmlkICE9IE1BWF9OVU1OT0RFUykKLQkJCW5vZGVfc2V0KG5pZCwgcmVzZXJ2ZWRf
bm9kZW1hc2spOwotCX0KLQogCS8qCiAJICogRmluYWxseSwgY2xlYXIgdGhlIE1FTUJMT0NLX0hP
VFBMVUcgZmxhZyBmb3IgYWxsIG1lbW9yeQogCSAqIGJlbG9uZ2luZyB0byB0aGUgcmVzZXJ2ZWQg
bm9kZSBtYXNrLgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

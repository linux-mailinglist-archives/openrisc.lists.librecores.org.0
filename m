Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E90132460CF
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9C4A120E20;
	Mon, 17 Aug 2020 10:46:37 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 0B06120D73
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:37:45 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13C5E207BB;
 Sun,  2 Aug 2020 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386263;
 bh=Bk2P7sJWRrlh9DIJh+EEUqVaYV+j9jXoTAkyubSAGEU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xkrtb/NnZuRj9wKvAXpeIlB3+bYoq60qFjBRzOA9/WIgAd3c3thtLHE58AeON1qpI
 Y8+QZ2LOBBah4eeK8wYtIrAl+wXzwLjIRtcGigqFAEyWGljxgxiQ/qWVumOKxaB5yQ
 k5tln6kB6HLGJvUE3EGslheASCGEhwXBPDAu0QAo=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:52 +0300
Message-Id: <20200802163601.8189-9-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: [OpenRISC] [PATCH v2 08/17] memblock: make for_each_memblock_type()
 iterator private
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZm9yX2VhY2hfbWVtYmxv
Y2tfdHlwZSgpIGlzIG5vdCB1c2VkIG91dHNpZGUgbW0vbWVtYmxvY2suYywgbW92ZSBpdCB0aGVy
ZQpmcm9tIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaAoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpSZXZpZXdlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJl
ZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9tZW1ibG9jay5oIHwgNSAtLS0tLQogbW0vbWVt
YmxvY2suYyAgICAgICAgICAgIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1ibG9j
ay5oIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCmluZGV4IDAxN2ZhZTgzM2Q0YS4uMjIwYjVm
MGRhZDQyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9tZW1ibG9jay5oCkBAIC01MzIsMTEgKzUzMiw2IEBAIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBtZW1ibG9ja19yZWdpb25fcmVzZXJ2ZWRfZW5kX3Bmbihjb25zdCBzdHJ1Y3Qg
bWVtYmxvCiAJICAgICByZWdpb24gPCAobWVtYmxvY2subWVtYmxvY2tfdHlwZS5yZWdpb25zICsg
bWVtYmxvY2subWVtYmxvY2tfdHlwZS5jbnQpOwlcCiAJICAgICByZWdpb24rKykKIAotI2RlZmlu
ZSBmb3JfZWFjaF9tZW1ibG9ja190eXBlKGksIG1lbWJsb2NrX3R5cGUsIHJnbikJCQlcCi0JZm9y
IChpID0gMCwgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbMF07CQkJXAotCSAgICAgaSA8
IG1lbWJsb2NrX3R5cGUtPmNudDsJCQkJCVwKLQkgICAgIGkrKywgcmduID0gJm1lbWJsb2NrX3R5
cGUtPnJlZ2lvbnNbaV0pCi0KIGV4dGVybiB2b2lkICphbGxvY19sYXJnZV9zeXN0ZW1faGFzaChj
b25zdCBjaGFyICp0YWJsZW5hbWUsCiAJCQkJICAgICB1bnNpZ25lZCBsb25nIGJ1Y2tldHNpemUs
CiAJCQkJICAgICB1bnNpZ25lZCBsb25nIG51bWVudHJpZXMsCmRpZmYgLS1naXQgYS9tbS9tZW1i
bG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCAzOWFjZWFmYzU3ZjYuLmE1YjliM2RmODFmYyAx
MDA2NDQKLS0tIGEvbW0vbWVtYmxvY2suYworKysgYi9tbS9tZW1ibG9jay5jCkBAIC0xMjksNiAr
MTI5LDExIEBAIHN0cnVjdCBtZW1ibG9jayBtZW1ibG9jayBfX2luaXRkYXRhX21lbWJsb2NrID0g
ewogCS5jdXJyZW50X2xpbWl0CQk9IE1FTUJMT0NLX0FMTE9DX0FOWVdIRVJFLAogfTsKIAorI2Rl
ZmluZSBmb3JfZWFjaF9tZW1ibG9ja190eXBlKGksIG1lbWJsb2NrX3R5cGUsIHJnbikJCQlcCisJ
Zm9yIChpID0gMCwgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbMF07CQkJXAorCSAgICAg
aSA8IG1lbWJsb2NrX3R5cGUtPmNudDsJCQkJCVwKKwkgICAgIGkrKywgcmduID0gJm1lbWJsb2Nr
X3R5cGUtPnJlZ2lvbnNbaV0pCisKIGludCBtZW1ibG9ja19kZWJ1ZyBfX2luaXRkYXRhX21lbWJs
b2NrOwogc3RhdGljIGJvb2wgc3lzdGVtX2hhc19zb21lX21pcnJvciBfX2luaXRkYXRhX21lbWJs
b2NrID0gZmFsc2U7CiBzdGF0aWMgaW50IG1lbWJsb2NrX2Nhbl9yZXNpemUgX19pbml0ZGF0YV9t
ZW1ibG9jazsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

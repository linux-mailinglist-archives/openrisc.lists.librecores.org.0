Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 146F52499BA
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 276A2202F7;
	Wed, 19 Aug 2020 11:55:47 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 793E220CC3
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:18:17 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA7162087D;
 Tue, 18 Aug 2020 15:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763896;
 bh=pd6tPUt2ij5eVwUys1N2/je9Ueo/gXQuNWSa4Q9eWYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aMwnH14VB9pEvRif2kVXF2j9PC1kC4UCHLgZKwNXLzSUzRVbdfutiHYDJNbY4L5Cn
 DSx/dIQT+xRpE9G7mTEjerjFtWAArSIBhoi9OW+Gl+/Arns44xtJv2oiFd0qu78t60
 DniuPQvPK80yg3qGzD04yvXU+ZjlZwAlZl+BmuiU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:25 +0300
Message-Id: <20200818151634.14343-9-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 08/17] memblock: make for_each_memblock_type()
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
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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
ay5oIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCmluZGV4IDlkOTI1ZGIwZDM1NS4uNTUwZmFm
NjlmYzFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9tZW1ibG9jay5oCkBAIC01NTIsMTEgKzU1Miw2IEBAIHN0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyBtZW1ibG9ja19yZWdpb25fcmVzZXJ2ZWRfZW5kX3Bmbihjb25zdCBzdHJ1Y3Qg
bWVtYmxvCiAJICAgICByZWdpb24gPCAobWVtYmxvY2subWVtYmxvY2tfdHlwZS5yZWdpb25zICsg
bWVtYmxvY2subWVtYmxvY2tfdHlwZS5jbnQpOwlcCiAJICAgICByZWdpb24rKykKIAotI2RlZmlu
ZSBmb3JfZWFjaF9tZW1ibG9ja190eXBlKGksIG1lbWJsb2NrX3R5cGUsIHJnbikJCQlcCi0JZm9y
IChpID0gMCwgcmduID0gJm1lbWJsb2NrX3R5cGUtPnJlZ2lvbnNbMF07CQkJXAotCSAgICAgaSA8
IG1lbWJsb2NrX3R5cGUtPmNudDsJCQkJCVwKLQkgICAgIGkrKywgcmduID0gJm1lbWJsb2NrX3R5
cGUtPnJlZ2lvbnNbaV0pCi0KIGV4dGVybiB2b2lkICphbGxvY19sYXJnZV9zeXN0ZW1faGFzaChj
b25zdCBjaGFyICp0YWJsZW5hbWUsCiAJCQkJICAgICB1bnNpZ25lZCBsb25nIGJ1Y2tldHNpemUs
CiAJCQkJICAgICB1bnNpZ25lZCBsb25nIG51bWVudHJpZXMsCmRpZmYgLS1naXQgYS9tbS9tZW1i
bG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCA0NWYxOTg3NTBiZTkuLjU5ZjM5OThhZTVkYiAx
MDA2NDQKLS0tIGEvbW0vbWVtYmxvY2suYworKysgYi9tbS9tZW1ibG9jay5jCkBAIC0xMzIsNiAr
MTMyLDExIEBAIHN0cnVjdCBtZW1ibG9ja190eXBlIHBoeXNtZW0gPSB7CiB9OwogI2VuZGlmCiAK
KyNkZWZpbmUgZm9yX2VhY2hfbWVtYmxvY2tfdHlwZShpLCBtZW1ibG9ja190eXBlLCByZ24pCQkJ
XAorCWZvciAoaSA9IDAsIHJnbiA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25zWzBdOwkJCVwKKwkg
ICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJCQlcCisJICAgICBpKyssIHJnbiA9ICZtZW1i
bG9ja190eXBlLT5yZWdpb25zW2ldKQorCiBpbnQgbWVtYmxvY2tfZGVidWcgX19pbml0ZGF0YV9t
ZW1ibG9jazsKIHN0YXRpYyBib29sIHN5c3RlbV9oYXNfc29tZV9taXJyb3IgX19pbml0ZGF0YV9t
ZW1ibG9jayA9IGZhbHNlOwogc3RhdGljIGludCBtZW1ibG9ja19jYW5fcmVzaXplIF9faW5pdGRh
dGFfbWVtYmxvY2s7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

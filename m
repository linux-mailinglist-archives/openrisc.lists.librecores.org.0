Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 636862460B7
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 35E9320E51;
	Mon, 17 Aug 2020 10:46:16 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 25FE820CD6
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:44 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3889F21883;
 Tue, 28 Jul 2020 05:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913222;
 bh=VR/BXCbAGDXiTc2rrw4BtAkWHkepE699HsOgdQ8rv0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pe560+Wm3RFnEmULaa53wH76qBJxCszvYnNevCYd1rvmCATos0eyeEG3MuKsU+rh7
 ZASD4r+m+7eL0vyMwJb5sE+ZH1uE1hodcDEHLpAyf64FfWaU40NfwmcAEsw6YVkzSg
 CxXRY9P9LZrUbR8Rgo3jRZCAkUWh5kJKutjxM4CU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:47 +0300
Message-Id: <20200728051153.1590-10-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 09/15] memblock: make for_each_memblock_type()
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZm9yX2VhY2hfbWVtYmxv
Y2tfdHlwZSgpIGlzIG5vdCB1c2VkIG91dHNpZGUgbW0vbWVtYmxvY2suYywgbW92ZSBpdCB0aGVy
ZQpmcm9tIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaAoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaCB8
IDUgLS0tLS0KIG1tL21lbWJsb2NrLmMgICAgICAgICAgICB8IDUgKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvbWVtYmxvY2suaCBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaAppbmRleCAwMTdm
YWU4MzNkNGEuLjIyMGI1ZjBkYWQ0MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZW1ibG9j
ay5oCisrKyBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaApAQCAtNTMyLDExICs1MzIsNiBAQCBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgbWVtYmxvY2tfcmVnaW9uX3Jlc2VydmVkX2VuZF9w
Zm4oY29uc3Qgc3RydWN0IG1lbWJsbwogCSAgICAgcmVnaW9uIDwgKG1lbWJsb2NrLm1lbWJsb2Nr
X3R5cGUucmVnaW9ucyArIG1lbWJsb2NrLm1lbWJsb2NrX3R5cGUuY250KTsJXAogCSAgICAgcmVn
aW9uKyspCiAKLSNkZWZpbmUgZm9yX2VhY2hfbWVtYmxvY2tfdHlwZShpLCBtZW1ibG9ja190eXBl
LCByZ24pCQkJXAotCWZvciAoaSA9IDAsIHJnbiA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25zWzBd
OwkJCVwKLQkgICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJCQlcCi0JICAgICBpKyssIHJn
biA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25zW2ldKQotCiBleHRlcm4gdm9pZCAqYWxsb2NfbGFy
Z2Vfc3lzdGVtX2hhc2goY29uc3QgY2hhciAqdGFibGVuYW1lLAogCQkJCSAgICAgdW5zaWduZWQg
bG9uZyBidWNrZXRzaXplLAogCQkJCSAgICAgdW5zaWduZWQgbG9uZyBudW1lbnRyaWVzLApkaWZm
IC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJsb2NrLmMKaW5kZXggMzlhY2VhZmM1N2Y2
Li5hNWI5YjNkZjgxZmMgMTAwNjQ0Ci0tLSBhL21tL21lbWJsb2NrLmMKKysrIGIvbW0vbWVtYmxv
Y2suYwpAQCAtMTI5LDYgKzEyOSwxMSBAQCBzdHJ1Y3QgbWVtYmxvY2sgbWVtYmxvY2sgX19pbml0
ZGF0YV9tZW1ibG9jayA9IHsKIAkuY3VycmVudF9saW1pdAkJPSBNRU1CTE9DS19BTExPQ19BTllX
SEVSRSwKIH07CiAKKyNkZWZpbmUgZm9yX2VhY2hfbWVtYmxvY2tfdHlwZShpLCBtZW1ibG9ja190
eXBlLCByZ24pCQkJXAorCWZvciAoaSA9IDAsIHJnbiA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25z
WzBdOwkJCVwKKwkgICAgIGkgPCBtZW1ibG9ja190eXBlLT5jbnQ7CQkJCQlcCisJICAgICBpKyss
IHJnbiA9ICZtZW1ibG9ja190eXBlLT5yZWdpb25zW2ldKQorCiBpbnQgbWVtYmxvY2tfZGVidWcg
X19pbml0ZGF0YV9tZW1ibG9jazsKIHN0YXRpYyBib29sIHN5c3RlbV9oYXNfc29tZV9taXJyb3Ig
X19pbml0ZGF0YV9tZW1ibG9jayA9IGZhbHNlOwogc3RhdGljIGludCBtZW1ibG9ja19jYW5fcmVz
aXplIF9faW5pdGRhdGFfbWVtYmxvY2s7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

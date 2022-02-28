Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BBC264C6771
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:49:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A6B9A24835;
	Mon, 28 Feb 2022 11:49:11 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 82C722431F
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:49:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1079106F;
 Mon, 28 Feb 2022 02:49:09 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B4F8C3F73D;
 Mon, 28 Feb 2022 02:49:01 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:26 +0530
Message-Id: <1646045273-9343-4-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 03/30] mm/mmap: Add new config
 ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWRkIGEgbmV3IGNvbmZpZyBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9ULCB3aGljaCB3aGVuIHN1
YnNjcmliZWQgZW5hYmxlcyBhCmdpdmVuIHBsYXRmb3JtIHRvIGRlZmluZSBpdHMgb3duIHZtX2dl
dF9wYWdlX3Byb3QoKS4gVGhpcyBmcmFtZXdvcmsgd2lsbApoZWxwIHJlbW92ZSBwcm90ZWN0aW9u
X21hcFtdIGRlcGVuZGVuY3kgZ29pbmcgZm9yd2FyZC4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnClN1Z2dlc3RlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBpbmZyYWRlYWQub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVt
YW4ua2hhbmR1YWxAYXJtLmNvbT4KLS0tCiBtbS9LY29uZmlnIHwgMyArKysKIG1tL21tYXAuYyAg
fCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21t
L0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IDI1N2VkOWM4NmRlMy4uZmE0MzY0NzhhOTRjIDEw
MDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTc0Nyw2ICs3NDcsOSBA
QCBjb25maWcgQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFCiBjb25maWcgQVJDSF9IQVNfRklMVEVS
X1BHUFJPVAogCWJvb2wKIAorY29uZmlnIEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QKKwlib29s
CisKIGNvbmZpZyBBUkNIX0hBU19QVEVfREVWTUFQCiAJYm9vbAogCmRpZmYgLS1naXQgYS9tbS9t
bWFwLmMgYi9tbS9tbWFwLmMKaW5kZXggMzQwMDBhN2Q3ZWZhLi5mMjMxMGY2ZTc0NjYgMTAwNjQ0
Ci0tLSBhL21tL21tYXAuYworKysgYi9tbS9tbWFwLmMKQEAgLTgxLDYgKzgxLDcgQEAgc3RhdGlj
IHZvaWQgdW5tYXBfcmVnaW9uKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCQlzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICpwcmV2LAogCQl1bnNpZ25lZCBs
b25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CiAKKyNpZm5kZWYgQ09ORklHX0FSQ0hfSEFT
X1ZNX0dFVF9QQUdFX1BST1QKIC8qIGRlc2NyaXB0aW9uIG9mIGVmZmVjdHMgb2YgbWFwcGluZyB0
eXBlIGFuZCBwcm90IGluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCiAgKiB0aGlzIGlzIGR1ZSB0
byB0aGUgbGltaXRlZCB4ODYgcGFnZSBwcm90ZWN0aW9uIGhhcmR3YXJlLiAgVGhlIGV4cGVjdGVk
CiAgKiBiZWhhdmlvciBpcyBpbiBwYXJlbnM6CkBAIC0xMzYsNiArMTM3LDcgQEAgcGdwcm90X3Qg
dm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQogCXJldHVybiBhcmNoX2Zp
bHRlcl9wZ3Byb3QocmV0KTsKIH0KIEVYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7Cisj
ZW5kaWYJLyogQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QgKi8KIAogc3RhdGljIHBn
cHJvdF90IHZtX3BncHJvdF9tb2RpZnkocGdwcm90X3Qgb2xkcHJvdCwgdW5zaWduZWQgbG9uZyB2
bV9mbGFncykKIHsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

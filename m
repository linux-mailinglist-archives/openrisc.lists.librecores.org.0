Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BF4DD4C6850
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:52:54 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD32C2488F;
	Mon, 28 Feb 2022 11:52:54 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 5C0CE2487B
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:52:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD662106F;
 Mon, 28 Feb 2022 02:52:51 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A59CF3F73D;
 Mon, 28 Feb 2022 02:52:44 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:52 +0530
Message-Id: <1646045273-9343-30-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 29/30] mm/mmap: Drop generic vm_get_page_prot()
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

QWxsIGF2YWlsYWJsZSBwbGF0Zm9ybXMgZXhwb3J0IHRoZWlyIG93biB2bV9nZXRfcGFnZV9wcm90
KCkgaW1wbGVtZW50YXRpb24KdmlhIEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QuIEhlbmNlIGEg
Z2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBpcyBubyBsb25nZXIKbmVlZGVkLgoKQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcK
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4g
S2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Ci0tLQogbW0vbW1hcC5jIHwgNDAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRl
eCBjMTNkZDljMzc4NjYuLmZmMzQzZjc2YTgyNSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBi
L21tL21tYXAuYwpAQCAtMTAyLDQ2ICsxMDIsNiBAQCBzdGF0aWMgdm9pZCB1bm1hcF9yZWdpb24o
c3RydWN0IG1tX3N0cnVjdCAqbW0sCiAgKgkJCQkJCQkJdzogKG5vKSBubwogICoJCQkJCQkJCXg6
ICh5ZXMpIHllcwogICovCi1wZ3Byb3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcg
dm1fZmxhZ3MpCi17Ci0Jc3dpdGNoICh2bV9mbGFncyAmIChWTV9SRUFEIHwgVk1fV1JJVEUgfCBW
TV9FWEVDIHwgVk1fU0hBUkVEKSkgewotCWNhc2UgVk1fTk9ORToKLQkJcmV0dXJuIF9fUDAwMDsK
LQljYXNlIFZNX1JFQUQ6Ci0JCXJldHVybiBfX1AwMDE7Ci0JY2FzZSBWTV9XUklURToKLQkJcmV0
dXJuIF9fUDAxMDsKLQljYXNlIFZNX1JFQUQgfCBWTV9XUklURToKLQkJcmV0dXJuIF9fUDAxMTsK
LQljYXNlIFZNX0VYRUM6Ci0JCXJldHVybiBfX1AxMDA7Ci0JY2FzZSBWTV9FWEVDIHwgVk1fUkVB
RDoKLQkJcmV0dXJuIF9fUDEwMTsKLQljYXNlIFZNX0VYRUMgfCBWTV9XUklURToKLQkJcmV0dXJu
IF9fUDExMDsKLQljYXNlIFZNX0VYRUMgfCBWTV9SRUFEIHwgVk1fV1JJVEU6Ci0JCXJldHVybiBf
X1AxMTE7Ci0JY2FzZSBWTV9TSEFSRUQ6Ci0JCXJldHVybiBfX1MwMDA7Ci0JY2FzZSBWTV9TSEFS
RUQgfCBWTV9SRUFEOgotCQlyZXR1cm4gX19TMDAxOwotCWNhc2UgVk1fU0hBUkVEIHwgVk1fV1JJ
VEU6Ci0JCXJldHVybiBfX1MwMTA7Ci0JY2FzZSBWTV9TSEFSRUQgfCBWTV9SRUFEIHwgVk1fV1JJ
VEU6Ci0JCXJldHVybiBfX1MwMTE7Ci0JY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDOgotCQlyZXR1
cm4gX19TMTAwOwotCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1JFQUQ6Ci0JCXJldHVy
biBfX1MxMDE7Ci0JY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fV1JJVEU6Ci0JCXJldHVy
biBfX1MxMTA7Ci0JY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRCB8IFZNX1dSSVRF
OgotCQlyZXR1cm4gX19TMTExOwotCWRlZmF1bHQ6Ci0JCUJVSUxEX0JVRygpOwotCX0KLX0KLUVY
UE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7CiAjZW5kaWYJLyogQ09ORklHX0FSQ0hfSEFT
X1ZNX0dFVF9QQUdFX1BST1QgKi8KIAogc3RhdGljIHBncHJvdF90IHZtX3BncHJvdF9tb2RpZnko
cGdwcm90X3Qgb2xkcHJvdCwgdW5zaWduZWQgbG9uZyB2bV9mbGFncykKLS0gCjIuMjUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

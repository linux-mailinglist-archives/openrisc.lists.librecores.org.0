Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECE44C67B7
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:50:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7174A2484F;
	Mon, 28 Feb 2022 11:50:29 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 1E99E24848
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:50:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E3C41063;
 Mon, 28 Feb 2022 02:50:27 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 73D0F3F73D;
 Mon, 28 Feb 2022 02:50:19 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:35 +0530
Message-Id: <1646045273-9343-13-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 12/30] mm/mmap: Drop arch_filter_pgprot()
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

VGhlcmUgYXJlIG5vIHBsYXRmb3JtcyBsZWZ0IHdoaWNoIHN1YnNjcmliZSBBUkNIX0hBU19GSUxU
RVJfUEdQUk9ULiBIZW5jZQpqdXN0IGRyb3AgYXJjaF9maWx0ZXJfcGdwcm90KCkgYW5kIGFsc28g
dGhlIGNvbmZpZyBBUkNIX0hBU19GSUxURVJfUEdQUk9ULgoKQ2M6IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBsaW51eC1tbUBrdmFjay5vcmcKQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwg
PGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Ci0tLQogbW0vS2NvbmZpZyB8ICAzIC0tLQogbW0v
bW1hcC5jICB8IDEwICstLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCmlu
ZGV4IGZhNDM2NDc4YTk0Yy4uMjEyZmI2ZTFkZGFhIDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisr
KyBiL21tL0tjb25maWcKQEAgLTc0NCw5ICs3NDQsNiBAQCBjb25maWcgSURMRV9QQUdFX1RSQUNL
SU5HCiBjb25maWcgQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFCiAJYm9vbAogCi1jb25maWcgQVJD
SF9IQVNfRklMVEVSX1BHUFJPVAotCWJvb2wKLQogY29uZmlnIEFSQ0hfSEFTX1ZNX0dFVF9QQUdF
X1BST1QKIAlib29sCiAKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCA3
OGVlYWMyNzdhODAuLmM4ZmQ4ZjA2YmY3YyAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21t
L21tYXAuYwpAQCAtMTAyLDE0ICsxMDIsNiBAQCBzdGF0aWMgdm9pZCB1bm1hcF9yZWdpb24oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCiAgKgkJCQkJCQkJdzogKG5vKSBubwogICoJCQkJCQkJCXg6ICh5
ZXMpIHllcwogICovCi0KLSNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX0ZJTFRFUl9QR1BST1QKLXN0
YXRpYyBpbmxpbmUgcGdwcm90X3QgYXJjaF9maWx0ZXJfcGdwcm90KHBncHJvdF90IHByb3QpCi17
Ci0JcmV0dXJuIHByb3Q7Ci19Ci0jZW5kaWYKLQogc3RhdGljIGlubGluZSBwZ3Byb3RfdCBfX3Zt
X2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKIHsKIAlzd2l0Y2ggKHZtX2Zs
YWdzICYgKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBWTV9TSEFSRUQpKSB7CkBAIC0x
NTUsNyArMTQ3LDcgQEAgcGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZt
X2ZsYWdzKQogCXBncHJvdF90IHJldCA9IF9fcGdwcm90KHBncHJvdF92YWwoX192bV9nZXRfcGFn
ZV9wcm90KHZtX2ZsYWdzKSkgfAogCQkJcGdwcm90X3ZhbChhcmNoX3ZtX2dldF9wYWdlX3Byb3Qo
dm1fZmxhZ3MpKSk7CiAKLQlyZXR1cm4gYXJjaF9maWx0ZXJfcGdwcm90KHJldCk7CisJcmV0dXJu
IHJldDsKIH0KIEVYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7CiAjZW5kaWYJLyogQ09O
RklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 130784C67C4
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:50:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EC86D24854;
	Mon, 28 Feb 2022 11:50:46 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 53FEB24849
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:50:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEEB41063;
 Mon, 28 Feb 2022 02:50:44 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC5143F73D;
 Mon, 28 Feb 2022 02:50:36 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:37 +0530
Message-Id: <1646045273-9343-15-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 14/30] s390/mm: Enable
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
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dl
dF9wYWdlX3Byb3QoKSB2aWEKc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4g
U3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAptYWNyb3MgY2FuIGJlIGRyb3BwZWQg
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogSGVpa28gQ2Fyc3RlbnMgPGhjYUBsaW51
eC5pYm0uY29tPgpDYzogVmFzaWx5IEdvcmJpayA8Z29yQGxpbnV4LmlibS5jb20+CkNjOiBsaW51
eC1zMzkwQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpB
Y2tlZC1ieTogU3ZlbiBTY2huZWxsZSA8c3ZlbnNAbGludXguaWJtLmNvbT4KQWNrZWQtYnk6IEFs
ZXhhbmRlciBHb3JkZWV2IDxhZ29yZGVldkBsaW51eC5pYm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KLS0tCiBhcmNoL3Mz
OTAvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3MzOTAvbW0vbW1hcC5jICAgICAg
ICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvczM5MC9LY29uZmlnIGIvYXJjaC9zMzkwL0tjb25maWcKaW5kZXggYmU5ZjM5ZmQwNmRmLi5j
YjFiNDg3ZTgyMDEgMTAwNjQ0Ci0tLSBhL2FyY2gvczM5MC9LY29uZmlnCisrKyBiL2FyY2gvczM5
MC9LY29uZmlnCkBAIC03OCw2ICs3OCw3IEBAIGNvbmZpZyBTMzkwCiAJc2VsZWN0IEFSQ0hfSEFT
X1NZU0NBTExfV1JBUFBFUgogCXNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwKIAlz
ZWxlY3QgQVJDSF9IQVNfVkRTT19EQVRBCisJc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BS
T1QKIAlzZWxlY3QgQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEcKIAlzZWxlY3QgQVJDSF9JTkxJ
TkVfUkVBRF9MT0NLCiAJc2VsZWN0IEFSQ0hfSU5MSU5FX1JFQURfTE9DS19CSApkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvczM5MC9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKaW5kZXggMDA4YTZjODU2ZmE0Li4zODkzZWY2NGI0MzkgMTAwNjQ0Ci0tLSBh
L2FyY2gvczM5MC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL3BndGFibGUuaApAQCAtNDIyLDIzICs0MjIsNiBAQCBzdGF0aWMgaW5saW5lIGludCBpc19t
b2R1bGVfYWRkcih2b2lkICphZGRyKQogICogaW1wbGllcyByZWFkIHBlcm1pc3Npb24uCiAgKi8K
ICAgICAgICAgIC8qeHdyKi8KLSNkZWZpbmUgX19QMDAwCVBBR0VfTk9ORQotI2RlZmluZSBfX1Aw
MDEJUEFHRV9STwotI2RlZmluZSBfX1AwMTAJUEFHRV9STwotI2RlZmluZSBfX1AwMTEJUEFHRV9S
TwotI2RlZmluZSBfX1AxMDAJUEFHRV9SWAotI2RlZmluZSBfX1AxMDEJUEFHRV9SWAotI2RlZmlu
ZSBfX1AxMTAJUEFHRV9SWAotI2RlZmluZSBfX1AxMTEJUEFHRV9SWAotCi0jZGVmaW5lIF9fUzAw
MAlQQUdFX05PTkUKLSNkZWZpbmUgX19TMDAxCVBBR0VfUk8KLSNkZWZpbmUgX19TMDEwCVBBR0Vf
UlcKLSNkZWZpbmUgX19TMDExCVBBR0VfUlcKLSNkZWZpbmUgX19TMTAwCVBBR0VfUlgKLSNkZWZp
bmUgX19TMTAxCVBBR0VfUlgKLSNkZWZpbmUgX19TMTEwCVBBR0VfUldYCi0jZGVmaW5lIF9fUzEx
MQlQQUdFX1JXWAogCiAvKgogICogU2VnbWVudCBlbnRyeSAobGFyZ2UgcGFnZSkgcHJvdGVjdGlv
biBkZWZpbml0aW9ucy4KZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9tbS9tbWFwLmMgYi9hcmNoL3Mz
OTAvbW0vbW1hcC5jCmluZGV4IGU1NGY5Mjg1MDNjNS4uZTk5YzE5OGFhNWRlIDEwMDY0NAotLS0g
YS9hcmNoL3MzOTAvbW0vbW1hcC5jCisrKyBiL2FyY2gvczM5MC9tbS9tbWFwLmMKQEAgLTE4OCwz
ICsxODgsMzYgQEAgdm9pZCBhcmNoX3BpY2tfbW1hcF9sYXlvdXQoc3RydWN0IG1tX3N0cnVjdCAq
bW0sIHN0cnVjdCBybGltaXQgKnJsaW1fc3RhY2spCiAJCW1tLT5nZXRfdW5tYXBwZWRfYXJlYSA9
IGFyY2hfZ2V0X3VubWFwcGVkX2FyZWFfdG9wZG93bjsKIAl9CiB9CisKK3BncHJvdF90IHZtX2dl
dF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKK3sKKwlzd2l0Y2ggKHZtX2ZsYWdz
ICYgKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBWTV9TSEFSRUQpKSB7CisJY2FzZSBW
TV9OT05FOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fUkVBRDoKKwljYXNlIFZNX1dS
SVRFOgorCWNhc2UgVk1fV1JJVEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9STzsKKwljYXNl
IFZNX0VYRUM6CisJY2FzZSBWTV9FWEVDIHwgVk1fUkVBRDoKKwljYXNlIFZNX0VYRUMgfCBWTV9X
UklURToKKwljYXNlIFZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBQQUdF
X1JYOworCWNhc2UgVk1fU0hBUkVEOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fU0hB
UkVEIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfUk87CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9X
UklURToKKwljYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBB
R0VfUlc7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDOgorCWNhc2UgVk1fU0hBUkVEIHwgVk1f
RVhFQyB8IFZNX1JFQUQ6CisJCXJldHVybiBQQUdFX1JYOworCWNhc2UgVk1fU0hBUkVEIHwgVk1f
RVhFQyB8IFZNX1dSSVRFOgorCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwg
Vk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfUldYOworCWRlZmF1bHQ6CisJCUJVSUxEX0JVRygpOwor
CX0KK30KK0VYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7Ci0tIAoyLjI1LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

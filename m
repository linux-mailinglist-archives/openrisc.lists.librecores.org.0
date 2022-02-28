Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9A04C6833
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:51:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 191ED24863;
	Mon, 28 Feb 2022 11:51:30 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 23EEC24858
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:51:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75FD6106F;
 Mon, 28 Feb 2022 02:51:27 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D94EB3F73D;
 Mon, 28 Feb 2022 02:51:19 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:42 +0530
Message-Id: <1646045273-9343-20-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 19/30] csky/mm: Enable
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

VGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dl
dF9wYWdlX3Byb3QoKSB2aWEKc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4g
U3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAptYWNyb3MgY2FuIGJlIGRyb3BwZWQg
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4KQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFs
IDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgotLS0KIGFyY2gvY3NreS9LY29uZmlnICAgICAg
ICAgICAgICAgfCAgMSArCiBhcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTggLS0t
LS0tLS0tLS0tLS0tLS0tCiBhcmNoL2Nza3kvbW0vaW5pdC5jICAgICAgICAgICAgIHwgMzIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L0tjb25maWcg
Yi9hcmNoL2Nza3kvS2NvbmZpZwppbmRleCAxMzJmNDNmMTJkZDguLjIwOWRhYzU2ODZkZCAxMDA2
NDQKLS0tIGEvYXJjaC9jc2t5L0tjb25maWcKKysrIGIvYXJjaC9jc2t5L0tjb25maWcKQEAgLTYs
NiArNiw3IEBAIGNvbmZpZyBDU0tZCiAJc2VsZWN0IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwK
IAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVQogCXNlbGVjdCBBUkNIX0hBU19TWU5D
X0RNQV9GT1JfREVWSUNFCisJc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QKIAlzZWxl
Y3QgQVJDSF9VU0VfQlVJTFRJTl9CU1dBUAogCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NL
UwogCXNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMgaWYgIUNQVV9DSzYxMCAmJiAkKGNj
LW9wdGlvbiwtbWJhY2t0cmFjZSkKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmggYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IDE1MTYwN2Vk
NTE1OC4uMmM2YjFjZmIxY2NlIDEwMDY0NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCisrKyBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTc2LDI0ICs3
Niw2IEBACiAjZGVmaW5lIE1BWF9TV0FQRklMRVNfQ0hFQ0soKSBcCiAJCUJVSUxEX0JVR19PTihN
QVhfU1dBUEZJTEVTX1NISUZUICE9IDUpCiAKLSNkZWZpbmUgX19QMDAwCVBBR0VfTk9ORQotI2Rl
ZmluZSBfX1AwMDEJUEFHRV9SRUFECi0jZGVmaW5lIF9fUDAxMAlQQUdFX1JFQUQKLSNkZWZpbmUg
X19QMDExCVBBR0VfUkVBRAotI2RlZmluZSBfX1AxMDAJUEFHRV9SRUFECi0jZGVmaW5lIF9fUDEw
MQlQQUdFX1JFQUQKLSNkZWZpbmUgX19QMTEwCVBBR0VfUkVBRAotI2RlZmluZSBfX1AxMTEJUEFH
RV9SRUFECi0KLSNkZWZpbmUgX19TMDAwCVBBR0VfTk9ORQotI2RlZmluZSBfX1MwMDEJUEFHRV9S
RUFECi0jZGVmaW5lIF9fUzAxMAlQQUdFX1dSSVRFCi0jZGVmaW5lIF9fUzAxMQlQQUdFX1dSSVRF
Ci0jZGVmaW5lIF9fUzEwMAlQQUdFX1JFQUQKLSNkZWZpbmUgX19TMTAxCVBBR0VfUkVBRAotI2Rl
ZmluZSBfX1MxMTAJUEFHRV9XUklURQotI2RlZmluZSBfX1MxMTEJUEFHRV9XUklURQotCiBleHRl
cm4gdW5zaWduZWQgbG9uZyBlbXB0eV96ZXJvX3BhZ2VbUEFHRV9TSVpFIC8gc2l6ZW9mKHVuc2ln
bmVkIGxvbmcpXTsKICNkZWZpbmUgWkVST19QQUdFKHZhZGRyKQkodmlydF90b19wYWdlKGVtcHR5
X3plcm9fcGFnZSkpCiAKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9tbS9pbml0LmMgYi9hcmNoL2Nz
a3kvbW0vaW5pdC5jCmluZGV4IGJmMjAwNGFhODExYS4uZjliYWJiZWQxN2Q0IDEwMDY0NAotLS0g
YS9hcmNoL2Nza3kvbW0vaW5pdC5jCisrKyBiL2FyY2gvY3NreS9tbS9pbml0LmMKQEAgLTE5Nywz
ICsxOTcsMzUgQEAgdm9pZCBfX2luaXQgZml4YWRkcl9pbml0KHZvaWQpCiAJdmFkZHIgPSBfX2Zp
eF90b192aXJ0KF9fZW5kX29mX2ZpeGVkX2FkZHJlc3NlcyAtIDEpICYgUE1EX01BU0s7CiAJZml4
cmFuZ2VfaW5pdCh2YWRkciwgdmFkZHIgKyBQTURfU0laRSwgc3dhcHBlcl9wZ19kaXIpOwogfQor
CitwZ3Byb3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpCit7CisJ
c3dpdGNoICh2bV9mbGFncyAmIChWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgVk1fU0hB
UkVEKSkgeworCWNhc2UgVk1fTk9ORToKKwkJcmV0dXJuIFBBR0VfTk9ORTsKKwljYXNlIFZNX1JF
QUQ6CisJY2FzZSBWTV9XUklURToKKwljYXNlIFZNX1dSSVRFIHwgVk1fUkVBRDoKKwljYXNlIFZN
X0VYRUM6CisJY2FzZSBWTV9FWEVDIHwgVk1fUkVBRDoKKwljYXNlIFZNX0VYRUMgfCBWTV9XUklU
RToKKwljYXNlIFZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBQQUdFX1JF
QUQ7CisJY2FzZSBWTV9TSEFSRUQ6CisJCXJldHVybiBQQUdFX05PTkU7CisJY2FzZSBWTV9TSEFS
RUQgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFEOworCWNhc2UgVk1fU0hBUkVEIHwgVk1f
V1JJVEU6CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBQ
QUdFX1dSSVRFOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQzoKKwljYXNlIFZNX1NIQVJFRCB8
IFZNX0VYRUMgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFEOworCWNhc2UgVk1fU0hBUkVE
IHwgVk1fRVhFQyB8IFZNX1dSSVRFOgorCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dS
SVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfV1JJVEU7CisJZGVmYXVsdDoKKwkJQlVJTERf
QlVHKCk7CisJfQorfQorRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KTsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

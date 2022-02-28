Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C265E4C6849
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:52:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ABA9624877;
	Mon, 28 Feb 2022 11:52:19 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 910BC2486D
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:52:18 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10EEE11FB;
 Mon, 28 Feb 2022 02:52:18 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 863F03F73D;
 Mon, 28 Feb 2022 02:52:10 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:48 +0530
Message-Id: <1646045273-9343-26-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 25/30] nios2/mm: Enable
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
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dl
dF9wYWdlX3Byb3QoKSB2aWEKc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4g
U3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAptYWNyb3MgY2FuIGJlIGRyb3BwZWQg
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtl
cm5lbC5vcmc+CkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkFja2VkLWJ5OiBEaW5o
IE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hh
bmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Ci0tLQogYXJjaC9uaW9zMi9LY29uZmln
ICAgICAgICAgICAgICAgfCAgMSArCiBhcmNoL25pb3MyL2luY2x1ZGUvYXNtL3BndGFibGUuaCB8
IDI0IC0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvbmlvczIvbW0vaW5pdC5jICAgICAgICAgICAgIHwg
NDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNDgg
aW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9L
Y29uZmlnIGIvYXJjaC9uaW9zMi9LY29uZmlnCmluZGV4IDMzZmQwNmY1ZmE0MS4uODVhNThhMzU3
YTNiIDEwMDY0NAotLS0gYS9hcmNoL25pb3MyL0tjb25maWcKKysrIGIvYXJjaC9uaW9zMi9LY29u
ZmlnCkBAIC02LDYgKzYsNyBAQCBjb25maWcgTklPUzIKIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19E
TUFfRk9SX0NQVQogCXNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfREVWSUNFCiAJc2VsZWN0
IEFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQKKwlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0Vf
UFJPVAogCXNlbGVjdCBBUkNIX05PX1NXQVAKIAlzZWxlY3QgQ09NTU9OX0NMSwogCXNlbGVjdCBU
SU1FUl9PRgpkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9h
cmNoL25pb3MyL2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA0YTk5NWZhNjI4ZWUuLmJhM2Y5
ODIyYzBiMyAxMDA2NDQKLS0tIGEvYXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysr
IGIvYXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTM0LDMwICszNCw2IEBAIHN0
cnVjdCBtbV9zdHJ1Y3Q7CiAJCQkJKCh4KSA/IF9QQUdFX0VYRUMgOiAwKSB8CQlcCiAJCQkJKChy
KSA/IF9QQUdFX1JFQUQgOiAwKSB8CQlcCiAJCQkJKCh3KSA/IF9QQUdFX1dSSVRFIDogMCkpCi0v
KgotICogVGhlc2UgYXJlIHRoZSBtYWNyb3MgdGhhdCBnZW5lcmljIGtlcm5lbCBjb2RlIG5lZWRz
Ci0gKiAodG8gcG9wdWxhdGUgcHJvdGVjdGlvbl9tYXBbXSkKLSAqLwotCi0vKiBSZW1vdmUgVyBi
aXQgb24gcHJpdmF0ZSBwYWdlcyBmb3IgQ09XIHN1cHBvcnQgKi8KLSNkZWZpbmUgX19QMDAwCU1L
UCgwLCAwLCAwKQotI2RlZmluZSBfX1AwMDEJTUtQKDAsIDAsIDEpCi0jZGVmaW5lIF9fUDAxMAlN
S1AoMCwgMCwgMCkJLyogQ09XICovCi0jZGVmaW5lIF9fUDAxMQlNS1AoMCwgMCwgMSkJLyogQ09X
ICovCi0jZGVmaW5lIF9fUDEwMAlNS1AoMSwgMCwgMCkKLSNkZWZpbmUgX19QMTAxCU1LUCgxLCAw
LCAxKQotI2RlZmluZSBfX1AxMTAJTUtQKDEsIDAsIDApCS8qIENPVyAqLwotI2RlZmluZSBfX1Ax
MTEJTUtQKDEsIDAsIDEpCS8qIENPVyAqLwotCi0vKiBTaGFyZWQgcGFnZXMgY2FuIGhhdmUgZXhh
Y3QgSFcgbWFwcGluZyAqLwotI2RlZmluZSBfX1MwMDAJTUtQKDAsIDAsIDApCi0jZGVmaW5lIF9f
UzAwMQlNS1AoMCwgMCwgMSkKLSNkZWZpbmUgX19TMDEwCU1LUCgwLCAxLCAwKQotI2RlZmluZSBf
X1MwMTEJTUtQKDAsIDEsIDEpCi0jZGVmaW5lIF9fUzEwMAlNS1AoMSwgMCwgMCkKLSNkZWZpbmUg
X19TMTAxCU1LUCgxLCAwLCAxKQotI2RlZmluZSBfX1MxMTAJTUtQKDEsIDEsIDApCi0jZGVmaW5l
IF9fUzExMQlNS1AoMSwgMSwgMSkKIAogLyogVXNlZCBhbGwgb3ZlciB0aGUga2VybmVsICovCiAj
ZGVmaW5lIFBBR0VfS0VSTkVMIF9fcGdwcm90KF9QQUdFX1BSRVNFTlQgfCBfUEFHRV9DQUNIRUQg
fCBfUEFHRV9SRUFEIHwgXApkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9tbS9pbml0LmMgYi9hcmNo
L25pb3MyL21tL2luaXQuYwppbmRleCA2MTNmY2FhNTk4OGEuLmU4NjdmNWQ4NTU4MCAxMDA2NDQK
LS0tIGEvYXJjaC9uaW9zMi9tbS9pbml0LmMKKysrIGIvYXJjaC9uaW9zMi9tbS9pbml0LmMKQEAg
LTEyNCwzICsxMjQsNTAgQEAgY29uc3QgY2hhciAqYXJjaF92bWFfbmFtZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKIHsKIAlyZXR1cm4gKHZtYS0+dm1fc3RhcnQgPT0gS1VTRVJfQkFTRSkg
PyAiW2t1c2VyXSIgOiBOVUxMOwogfQorCitwZ3Byb3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2ln
bmVkIGxvbmcgdm1fZmxhZ3MpCit7CisJc3dpdGNoICh2bV9mbGFncyAmIChWTV9SRUFEIHwgVk1f
V1JJVEUgfCBWTV9FWEVDIHwgVk1fU0hBUkVEKSkgeworCS8qIFJlbW92ZSBXIGJpdCBvbiBwcml2
YXRlIHBhZ2VzIGZvciBDT1cgc3VwcG9ydCAqLworCWNhc2UgVk1fTk9ORToKKwkJcmV0dXJuIE1L
UCgwLCAwLCAwKTsKKwljYXNlIFZNX1JFQUQ6CisJCXJldHVybiBNS1AoMCwgMCwgMSk7CisJLyog
Q09XICovCisJY2FzZSBWTV9XUklURToKKwkJcmV0dXJuIE1LUCgwLCAwLCAwKTsKKwkvKiBDT1cg
Ki8KKwljYXNlIFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIE1LUCgwLCAwLCAxKTsKKwlj
YXNlIFZNX0VYRUM6CisJCXJldHVybiBNS1AoMSwgMCwgMCk7CisJY2FzZSBWTV9FWEVDIHwgVk1f
UkVBRDoKKwkJcmV0dXJuIE1LUCgxLCAwLCAxKTsKKwkvKiBDT1cgKi8KKwljYXNlIFZNX0VYRUMg
fCBWTV9XUklURToKKwkJcmV0dXJuIE1LUCgxLCAwLCAwKTsKKwkvKiBDT1cgKi8KKwljYXNlIFZN
X0VYRUMgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBNS1AoMSwgMCwgMSk7CisJLyog
U2hhcmVkIHBhZ2VzIGNhbiBoYXZlIGV4YWN0IEhXIG1hcHBpbmcgKi8KKwljYXNlIFZNX1NIQVJF
RDoKKwkJcmV0dXJuIE1LUCgwLCAwLCAwKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX1JFQUQ6CisJ
CXJldHVybiBNS1AoMCwgMCwgMSk7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9XUklURToKKwkJcmV0
dXJuIE1LUCgwLCAxLCAwKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFIHwgVk1fUkVBRDoK
KwkJcmV0dXJuIE1LUCgwLCAxLCAxKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUM6CisJCXJl
dHVybiBNS1AoMSwgMCwgMCk7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRDoK
KwkJcmV0dXJuIE1LUCgxLCAwLCAxKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9X
UklURToKKwkJcmV0dXJuIE1LUCgxLCAxLCAwKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUMg
fCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBNS1AoMSwgMSwgMSk7CisJZGVmYXVsdDoK
KwkJQlVJTERfQlVHKCk7CisJfQorfQorRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KTsK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

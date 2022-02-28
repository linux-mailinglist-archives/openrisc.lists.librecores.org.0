Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 902044C6847
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:52:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7551324871;
	Mon, 28 Feb 2022 11:52:12 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 9D27924869
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:52:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A8411FB;
 Mon, 28 Feb 2022 02:52:10 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1303C3F73D;
 Mon, 28 Feb 2022 02:52:01 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:47 +0530
Message-Id: <1646045273-9343-25-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 24/30] microblaze/mm: Enable
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
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBkZWZpbmVzIGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dl
dF9wYWdlX3Byb3QoKSB2aWEKc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4g
U3Vic2VxdWVudGx5IGFsbCBfX1NYWFggYW5kIF9fUFhYWAptYWNyb3MgY2FuIGJlIGRyb3BwZWQg
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogTWljaGFsIFNpbWVrIDxtb25zdHJAbW9u
c3RyLmV1PgpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBB
bnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KLS0tCiBhcmNoL21p
Y3JvYmxhemUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgIDEgKwogYXJjaC9taWNyb2JsYXplL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaCB8IDE3IC0tLS0tLS0tLS0tCiBhcmNoL21pY3JvYmxhemUvbW0v
aW5pdC5jICAgICAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvbWljcm9ibGF6ZS9LY29uZmlnIGIvYXJjaC9taWNyb2JsYXplL0tjb25maWcKaW5k
ZXggNTk3OThlNDNjZGIwLi5mMmMyNWJhODYyMWUgMTAwNjQ0Ci0tLSBhL2FyY2gvbWljcm9ibGF6
ZS9LY29uZmlnCisrKyBiL2FyY2gvbWljcm9ibGF6ZS9LY29uZmlnCkBAIC03LDYgKzcsNyBAQCBj
b25maWcgTUlDUk9CTEFaRQogCXNlbGVjdCBBUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMCiAJc2Vs
ZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9DUFUKIAlzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFf
Rk9SX0RFVklDRQorCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UCiAJc2VsZWN0IEFS
Q0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUCiAJc2VsZWN0IEFSQ0hfV0FOVF9JUENfUEFSU0VfVkVS
U0lPTgogCXNlbGVjdCBCVUlMRFRJTUVfVEFCTEVfU09SVApkaWZmIC0tZ2l0IGEvYXJjaC9taWNy
b2JsYXplL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKaW5kZXggYzEzNmEwMWU0NjdlLi42ZGYzNzMwNzdmZjIgMTAwNjQ0Ci0tLSBh
L2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9taWNyb2Js
YXplL2luY2x1ZGUvYXNtL3BndGFibGUuaApAQCAtMjA0LDIzICsyMDQsNiBAQCBleHRlcm4gcHRl
X3QgKnZhX3RvX3B0ZSh1bnNpZ25lZCBsb25nIGFkZHJlc3MpOwogICogV2UgY29uc2lkZXIgZXhl
Y3V0ZSBwZXJtaXNzaW9uIHRoZSBzYW1lIGFzIHJlYWQuCiAgKiBBbHNvLCB3cml0ZSBwZXJtaXNz
aW9ucyBpbXBseSByZWFkIHBlcm1pc3Npb25zLgogICovCi0jZGVmaW5lIF9fUDAwMAlQQUdFX05P
TkUKLSNkZWZpbmUgX19QMDAxCVBBR0VfUkVBRE9OTFlfWAotI2RlZmluZSBfX1AwMTAJUEFHRV9D
T1BZCi0jZGVmaW5lIF9fUDAxMQlQQUdFX0NPUFlfWAotI2RlZmluZSBfX1AxMDAJUEFHRV9SRUFE
T05MWQotI2RlZmluZSBfX1AxMDEJUEFHRV9SRUFET05MWV9YCi0jZGVmaW5lIF9fUDExMAlQQUdF
X0NPUFkKLSNkZWZpbmUgX19QMTExCVBBR0VfQ09QWV9YCi0KLSNkZWZpbmUgX19TMDAwCVBBR0Vf
Tk9ORQotI2RlZmluZSBfX1MwMDEJUEFHRV9SRUFET05MWV9YCi0jZGVmaW5lIF9fUzAxMAlQQUdF
X1NIQVJFRAotI2RlZmluZSBfX1MwMTEJUEFHRV9TSEFSRURfWAotI2RlZmluZSBfX1MxMDAJUEFH
RV9SRUFET05MWQotI2RlZmluZSBfX1MxMDEJUEFHRV9SRUFET05MWV9YCi0jZGVmaW5lIF9fUzEx
MAlQQUdFX1NIQVJFRAotI2RlZmluZSBfX1MxMTEJUEFHRV9TSEFSRURfWAogCiAjaWZuZGVmIF9f
QVNTRU1CTFlfXwogLyoKZGlmZiAtLWdpdCBhL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMgYi9h
cmNoL21pY3JvYmxhemUvbW0vaW5pdC5jCmluZGV4IDk1MmYzNWIzMzViMi4uNjhmYWY3ZDA0ZmFm
IDEwMDY0NAotLS0gYS9hcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jCisrKyBiL2FyY2gvbWljcm9i
bGF6ZS9tbS9pbml0LmMKQEAgLTI4MCwzICsyODAsNDQgQEAgdm9pZCAqIF9fcmVmIHphbGxvY19t
YXliZV9ib290bWVtKHNpemVfdCBzaXplLCBnZnBfdCBtYXNrKQogCiAJcmV0dXJuIHA7CiB9CisK
K3BncHJvdF90IHZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKK3sKKwlz
d2l0Y2ggKHZtX2ZsYWdzICYgKFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBWTV9TSEFS
RUQpKSB7CisJY2FzZSBWTV9OT05FOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fUkVB
RDoKKwkJcmV0dXJuIFBBR0VfUkVBRE9OTFlfWDsKKwljYXNlIFZNX1dSSVRFOgorCQlyZXR1cm4g
UEFHRV9DT1BZOworCWNhc2UgVk1fV1JJVEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9DT1BZ
X1g7CisJY2FzZSBWTV9FWEVDOgorCQlyZXR1cm4gUEFHRV9SRUFET05MWTsKKwljYXNlIFZNX0VY
RUMgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFET05MWV9YOworCWNhc2UgVk1fRVhFQyB8
IFZNX1dSSVRFOgorCQlyZXR1cm4gUEFHRV9DT1BZOworCWNhc2UgVk1fRVhFQyB8IFZNX1dSSVRF
IHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfQ09QWV9YOworCWNhc2UgVk1fU0hBUkVEOgorCQly
ZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBB
R0VfUkVBRE9OTFlfWDsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFOgorCQlyZXR1cm4gUEFH
RV9TSEFSRUQ7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVy
biBQQUdFX1NIQVJFRF9YOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQzoKKwkJcmV0dXJuIFBB
R0VfUkVBRE9OTFk7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1fUkVBRDoKKwkJcmV0
dXJuIFBBR0VfUkVBRE9OTFlfWDsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklU
RToKKwkJcmV0dXJuIFBBR0VfU0hBUkVEOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZN
X1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfU0hBUkVEX1g7CisJZGVmYXVsdDoKKwkJ
QlVJTERfQlVHKCk7CisJfQorfQorRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KTsKLS0g
CjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

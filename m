Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A33424C6808
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:51:13 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86C6B2485C;
	Mon, 28 Feb 2022 11:51:13 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 5EB6924855
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:51:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D98D7106F;
 Mon, 28 Feb 2022 02:51:10 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8EF333F73D;
 Mon, 28 Feb 2022 02:51:02 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:40 +0530
Message-Id: <1646045273-9343-18-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 17/30] sh/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
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
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogWW9zaGlub3JpIFNhdG8gPHlzYXRvQHVz
ZXJzLnNvdXJjZWZvcmdlLmpwPgpDYzogUmljaCBGZWxrZXIgPGRhbGlhc0BsaWJjLm9yZz4KQ2M6
IGxpbnV4LXNoQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJt
LmNvbT4KLS0tCiBhcmNoL3NoL0tjb25maWcgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvc2gv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTcgLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9zaC9tbS9t
bWFwLmMgICAgICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3NoL0tjb25maWcgYi9hcmNoL3NoL0tjb25maWcKaW5kZXggMjQ3NGEw
NGNlYWM0Li5mM2ZjZDFjNWUwMDIgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvS2NvbmZpZworKysgYi9h
cmNoL3NoL0tjb25maWcKQEAgLTExLDYgKzExLDcgQEAgY29uZmlnIFNVUEVSSAogCXNlbGVjdCBB
UkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMCiAJc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCiAJ
c2VsZWN0IEFSQ0hfSEFTX1RJQ0tfQlJPQURDQVNUIGlmIEdFTkVSSUNfQ0xPQ0tFVkVOVFNfQlJP
QURDQVNUCisJc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QKIAlzZWxlY3QgQVJDSF9I
SUJFUk5BVElPTl9QT1NTSUJMRSBpZiBNTVUKIAlzZWxlY3QgQVJDSF9NSUdIVF9IQVZFX1BDX1BB
UlBPUlQKIAlzZWxlY3QgQVJDSF9XQU5UX0lQQ19QQVJTRV9WRVJTSU9OCmRpZmYgLS1naXQgYS9h
cmNoL3NoL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCmluZGV4IGQ3ZGRiMWVjODZhMC4uNmZiOWVjNTRjZjliIDEwMDY0NAotLS0gYS9hcmNoL3No
L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3NoL2luY2x1ZGUvYXNtL3BndGFibGUu
aApAQCAtODksMjMgKzg5LDYgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIHBoeXNfYWRk
cl9tYXNrKHZvaWQpCiAgKiBjb21wbGV0ZWx5IHNlcGFyYXRlIHBlcm1pc3Npb24gYml0cyBmb3Ig
dXNlciBhbmQga2VybmVsIHNwYWNlLgogICovCiAJIC8qeHdyKi8KLSNkZWZpbmUgX19QMDAwCVBB
R0VfTk9ORQotI2RlZmluZSBfX1AwMDEJUEFHRV9SRUFET05MWQotI2RlZmluZSBfX1AwMTAJUEFH
RV9DT1BZCi0jZGVmaW5lIF9fUDAxMQlQQUdFX0NPUFkKLSNkZWZpbmUgX19QMTAwCVBBR0VfRVhF
Q1JFQUQKLSNkZWZpbmUgX19QMTAxCVBBR0VfRVhFQ1JFQUQKLSNkZWZpbmUgX19QMTEwCVBBR0Vf
Q09QWQotI2RlZmluZSBfX1AxMTEJUEFHRV9DT1BZCi0KLSNkZWZpbmUgX19TMDAwCVBBR0VfTk9O
RQotI2RlZmluZSBfX1MwMDEJUEFHRV9SRUFET05MWQotI2RlZmluZSBfX1MwMTAJUEFHRV9XUklU
RU9OTFkKLSNkZWZpbmUgX19TMDExCVBBR0VfU0hBUkVECi0jZGVmaW5lIF9fUzEwMAlQQUdFX0VY
RUNSRUFECi0jZGVmaW5lIF9fUzEwMQlQQUdFX0VYRUNSRUFECi0jZGVmaW5lIF9fUzExMAlQQUdF
X1JXWAotI2RlZmluZSBfX1MxMTEJUEFHRV9SV1gKIAogdHlwZWRlZiBwdGVfdCAqcHRlX2FkZHJf
dDsKIApkaWZmIC0tZ2l0IGEvYXJjaC9zaC9tbS9tbWFwLmMgYi9hcmNoL3NoL21tL21tYXAuYwpp
bmRleCA2YTFhMTI5N2JhYWUuLmNhZDE0YWY2YzhlNiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9tbS9t
bWFwLmMKKysrIGIvYXJjaC9zaC9tbS9tbWFwLmMKQEAgLTE2MiwzICsxNjIsNDEgQEAgaW50IHZh
bGlkX21tYXBfcGh5c19hZGRyX3JhbmdlKHVuc2lnbmVkIGxvbmcgcGZuLCBzaXplX3Qgc2l6ZSkK
IHsKIAlyZXR1cm4gMTsKIH0KKworI2lmZGVmIENPTkZJR19NTVUKK3BncHJvdF90IHZtX2dldF9w
YWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKK3sKKwlzd2l0Y2ggKHZtX2ZsYWdzICYg
KFZNX1JFQUQgfCBWTV9XUklURSB8IFZNX0VYRUMgfCBWTV9TSEFSRUQpKSB7CisJY2FzZSBWTV9O
T05FOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0Vf
UkVBRE9OTFk7CisJY2FzZSBWTV9XUklURToKKwljYXNlIFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJ
cmV0dXJuIFBBR0VfQ09QWTsKKwljYXNlIFZNX0VYRUM6CisJY2FzZSBWTV9FWEVDIHwgVk1fUkVB
RDoKKwkJcmV0dXJuIFBBR0VfRVhFQ1JFQUQ7CisJY2FzZSBWTV9FWEVDIHwgVk1fV1JJVEU6CisJ
Y2FzZSBWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9DT1BZOwor
CWNhc2UgVk1fU0hBUkVEOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fU0hBUkVEIHwg
Vk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfUkVBRE9OTFk7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9X
UklURToKKwkJcmV0dXJuIFBBR0VfV1JJVEVPTkxZOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fV1JJ
VEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9TSEFSRUQ7CisJY2FzZSBWTV9TSEFSRUQgfCBW
TV9FWEVDOgorCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1JFQUQ6CisJCXJldHVybiBQ
QUdFX0VYRUNSRUFEOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFOgorCWNh
c2UgVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBB
R0VfUldYOworCWRlZmF1bHQ6CisJCUJVSUxEX0JVRygpOworCX0KK30KK0VYUE9SVF9TWU1CT0wo
dm1fZ2V0X3BhZ2VfcHJvdCk7CisjZW5kaWYKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

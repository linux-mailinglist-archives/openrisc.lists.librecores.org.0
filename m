Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 890F04C684D
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:52:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 763D524881;
	Mon, 28 Feb 2022 11:52:46 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id A584C24879
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:52:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DC19106F;
 Mon, 28 Feb 2022 02:52:44 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D472D3F73D;
 Mon, 28 Feb 2022 02:52:35 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:51 +0530
Message-Id: <1646045273-9343-29-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 28/30] ia64/mm: Enable
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
d2hpY2ggYXJlIG5vIGxvbmdlciBuZWVkZWQuCgpDYzogbGludXgtaWE2NEB2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogQW5zaHVt
YW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Ci0tLQogYXJjaC9pYTY0L0tj
b25maWcgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmggfCAxNyAtLS0tLS0tLS0tLS0tLQogYXJjaC9pYTY0L21tL2luaXQuYyAgICAgICAgICAgICB8
IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0
MSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2lhNjQv
S2NvbmZpZyBiL2FyY2gvaWE2NC9LY29uZmlnCmluZGV4IGE3ZTAxNTczYWJkOC4uMGFiMTVlOGQ1
NzgzIDEwMDY0NAotLS0gYS9hcmNoL2lhNjQvS2NvbmZpZworKysgYi9hcmNoL2lhNjQvS2NvbmZp
ZwpAQCAtMTEsNiArMTEsNyBAQCBjb25maWcgSUE2NAogCXNlbGVjdCBBUkNIX0hBU19ETUFfTUFS
S19DTEVBTgogCXNlbGVjdCBBUkNIX0hBU19TVFJOQ1BZX0ZST01fVVNFUgogCXNlbGVjdCBBUkNI
X0hBU19TVFJOTEVOX1VTRVIKKwlzZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVAogCXNl
bGVjdCBBUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVAogCXNlbGVjdCBBUkNIX01JR0hUX0hBVkVf
UENfU0VSSU8KIAlzZWxlY3QgQUNQSQpkaWZmIC0tZ2l0IGEvYXJjaC9pYTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaCBiL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggOTU4NGIy
YzVmMzk0Li44MTU0Yzc4YmJhNTYgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKKysrIGIvYXJjaC9pYTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaApAQCAtMTYxLDIz
ICsxNjEsNiBAQAogICogYXR0ZW1wdHMgdG8gd3JpdGUgdG8gdGhlIHBhZ2UuCiAgKi8KIAkvKiB4
d3IgKi8KLSNkZWZpbmUgX19QMDAwCVBBR0VfTk9ORQotI2RlZmluZSBfX1AwMDEJUEFHRV9SRUFE
T05MWQotI2RlZmluZSBfX1AwMTAJUEFHRV9SRUFET05MWQkvKiB3cml0ZSB0byBwcml2IHBnIC0+
IGNvcHkgJiBtYWtlIHdyaXRhYmxlICovCi0jZGVmaW5lIF9fUDAxMQlQQUdFX1JFQURPTkxZCS8q
IGRpdHRvICovCi0jZGVmaW5lIF9fUDEwMAlfX3BncHJvdChfX0FDQ0VTU19CSVRTIHwgX1BBR0Vf
UExfMyB8IF9QQUdFX0FSX1hfUlgpCi0jZGVmaW5lIF9fUDEwMQlfX3BncHJvdChfX0FDQ0VTU19C
SVRTIHwgX1BBR0VfUExfMyB8IF9QQUdFX0FSX1JYKQotI2RlZmluZSBfX1AxMTAJUEFHRV9DT1BZ
X0VYRUMKLSNkZWZpbmUgX19QMTExCVBBR0VfQ09QWV9FWEVDCi0KLSNkZWZpbmUgX19TMDAwCVBB
R0VfTk9ORQotI2RlZmluZSBfX1MwMDEJUEFHRV9SRUFET05MWQotI2RlZmluZSBfX1MwMTAJUEFH
RV9TSEFSRUQJLyogd2UgZG9uJ3QgaGF2ZSAoYW5kIGRvbid0IG5lZWQpIHdyaXRlLW9ubHkgKi8K
LSNkZWZpbmUgX19TMDExCVBBR0VfU0hBUkVECi0jZGVmaW5lIF9fUzEwMAlfX3BncHJvdChfX0FD
Q0VTU19CSVRTIHwgX1BBR0VfUExfMyB8IF9QQUdFX0FSX1hfUlgpCi0jZGVmaW5lIF9fUzEwMQlf
X3BncHJvdChfX0FDQ0VTU19CSVRTIHwgX1BBR0VfUExfMyB8IF9QQUdFX0FSX1JYKQotI2RlZmlu
ZSBfX1MxMTAJX19wZ3Byb3QoX19BQ0NFU1NfQklUUyB8IF9QQUdFX1BMXzMgfCBfUEFHRV9BUl9S
V1gpCi0jZGVmaW5lIF9fUzExMQlfX3BncHJvdChfX0FDQ0VTU19CSVRTIHwgX1BBR0VfUExfMyB8
IF9QQUdFX0FSX1JXWCkKIAogI2RlZmluZSBwZ2RfRVJST1IoZSkJcHJpbnRrKCIlczolZDogYmFk
IHBnZCAlMDE2bHguXG4iLCBfX0ZJTEVfXywgX19MSU5FX18sIHBnZF92YWwoZSkpCiAjaWYgQ09O
RklHX1BHVEFCTEVfTEVWRUxTID09IDQKZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9tbS9pbml0LmMg
Yi9hcmNoL2lhNjQvbW0vaW5pdC5jCmluZGV4IDVkMTY1NjA3YmYzNS4uMmE5MjI4ODNlMzBmIDEw
MDY0NAotLS0gYS9hcmNoL2lhNjQvbW0vaW5pdC5jCisrKyBiL2FyY2gvaWE2NC9tbS9pbml0LmMK
QEAgLTI3Myw3ICsyNzMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBnYXRlX3ZtYV9pbml0KHZvaWQp
CiAJZ2F0ZV92bWEudm1fc3RhcnQgPSBGSVhBRERSX1VTRVJfU1RBUlQ7CiAJZ2F0ZV92bWEudm1f
ZW5kID0gRklYQUREUl9VU0VSX0VORDsKIAlnYXRlX3ZtYS52bV9mbGFncyA9IFZNX1JFQUQgfCBW
TV9NQVlSRUFEIHwgVk1fRVhFQyB8IFZNX01BWUVYRUM7Ci0JZ2F0ZV92bWEudm1fcGFnZV9wcm90
ID0gX19QMTAxOworCWdhdGVfdm1hLnZtX3BhZ2VfcHJvdCA9IF9fcGdwcm90KF9fQUNDRVNTX0JJ
VFMgfCBfUEFHRV9QTF8zIHwgX1BBR0VfQVJfUlgpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC00OTIs
MyArNDkyLDQyIEBAIHZvaWQgYXJjaF9yZW1vdmVfbWVtb3J5KHU2NCBzdGFydCwgdTY0IHNpemUs
IHN0cnVjdCB2bWVtX2FsdG1hcCAqYWx0bWFwKQogCV9fcmVtb3ZlX3BhZ2VzKHN0YXJ0X3Bmbiwg
bnJfcGFnZXMsIGFsdG1hcCk7CiB9CiAjZW5kaWYKKworcGdwcm90X3Qgdm1fZ2V0X3BhZ2VfcHJv
dCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQoreworCXN3aXRjaCAodm1fZmxhZ3MgJiAoVk1fUkVB
RCB8IFZNX1dSSVRFIHwgVk1fRVhFQyB8IFZNX1NIQVJFRCkpIHsKKwljYXNlIFZNX05PTkU6CisJ
CXJldHVybiBQQUdFX05PTkU7CisJY2FzZSBWTV9SRUFEOgorCS8qIHdyaXRlIHRvIHByaXYgcGcg
LT4gY29weSAmIG1ha2Ugd3JpdGFibGUgKi8KKwljYXNlIFZNX1dSSVRFOgorCS8qIHdyaXRlIHRv
IHByaXYgcGcgLT4gY29weSAmIG1ha2Ugd3JpdGFibGUgKi8KKwljYXNlIFZNX1dSSVRFIHwgVk1f
UkVBRDoKKwkJcmV0dXJuIFBBR0VfUkVBRE9OTFk7CisJY2FzZSBWTV9FWEVDOgorCQlyZXR1cm4g
X19wZ3Byb3QoX19BQ0NFU1NfQklUUyB8IF9QQUdFX1BMXzMgfCBfUEFHRV9BUl9YX1JYKTsKKwlj
YXNlIFZNX0VYRUMgfCBWTV9SRUFEOgorCQlyZXR1cm4gX19wZ3Byb3QoX19BQ0NFU1NfQklUUyB8
IF9QQUdFX1BMXzMgfCBfUEFHRV9BUl9SWCk7CisJY2FzZSBWTV9FWEVDIHwgVk1fV1JJVEU6CisJ
Y2FzZSBWTV9FWEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9DT1BZX0VY
RUM7CisJY2FzZSBWTV9TSEFSRUQ6CisJCXJldHVybiBQQUdFX05PTkU7CisJY2FzZSBWTV9TSEFS
RUQgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFET05MWTsKKwkvKiB3ZSBkb24ndCBoYXZl
IChhbmQgZG9uJ3QgbmVlZCkgd3JpdGUtb25seSAqLworCWNhc2UgVk1fU0hBUkVEIHwgVk1fV1JJ
VEU6CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9XUklURSB8IFZNX1JFQUQ6CisJCXJldHVybiBQQUdF
X1NIQVJFRDsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUM6CisJCXJldHVybiBfX3BncHJvdChf
X0FDQ0VTU19CSVRTIHwgX1BBR0VfUExfMyB8IF9QQUdFX0FSX1hfUlgpOworCWNhc2UgVk1fU0hB
UkVEIHwgVk1fRVhFQyB8IFZNX1JFQUQ6CisJCXJldHVybiBfX3BncHJvdChfX0FDQ0VTU19CSVRT
IHwgX1BBR0VfUExfMyB8IF9QQUdFX0FSX1JYKTsKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUMg
fCBWTV9XUklURToKKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUMgfCBWTV9XUklURSB8IFZNX1JF
QUQ6CisJCXJldHVybiBfX3BncHJvdChfX0FDQ0VTU19CSVRTIHwgX1BBR0VfUExfMyB8IF9QQUdF
X0FSX1JXWCk7CisJZGVmYXVsdDoKKwkJQlVJTERfQlVHKCk7CisJfQorfQorRVhQT1JUX1NZTUJP
TCh2bV9nZXRfcGFnZV9wcm90KTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

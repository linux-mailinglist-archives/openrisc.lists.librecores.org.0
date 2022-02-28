Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 393744C67B4
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:50:13 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1CECC2484A;
	Mon, 28 Feb 2022 11:50:13 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 767682483F
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:50:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C07F11063;
 Mon, 28 Feb 2022 02:50:10 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE70D3F73D;
 Mon, 28 Feb 2022 02:50:02 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:33 +0530
Message-Id: <1646045273-9343-11-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 10/30] x86/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
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
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgoKVGhpcyBkZWZpbmVz
IGFuZCBleHBvcnRzIGEgcGxhdGZvcm0gc3BlY2lmaWMgY3VzdG9tIHZtX2dldF9wYWdlX3Byb3Qo
KSB2aWEKc3Vic2NyaWJpbmcgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gU3Vic2VxdWVudGx5
IGFsbCBfX1NYWFggYW5kIF9fUFhYWAptYWNyb3MgY2FuIGJlIGRyb3BwZWQgd2hpY2ggYXJlIG5v
IGxvbmdlciBuZWVkZWQuIFRoaXMgYWxzbyB1bnN1YnNjcmliZXMKZnJvbSBBUkNIX0hBU19GSUxU
RVJfUEdQUk9ULCBhZnRlciBkcm9wcGluZyBvZmYgYXJjaF9maWx0ZXJfcGdwcm90KCkgYW5kCmFy
Y2hfdm1fZ2V0X3BhZ2VfcHJvdCgpLgoKQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
aW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFu
LmtoYW5kdWFsQGFybS5jb20+Ci0tLQogYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICB8ICA1IC0t
CiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlX3R5cGVzLmggfCAxOSAtLS0tLS0tLQogYXJj
aC94ODYvaW5jbHVkZS91YXBpL2FzbS9tbWFuLmggICAgIHwgMTQgLS0tLS0tCiBhcmNoL3g4Ni9t
bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC94ODYvbW0vbWVtX2VuY3J5
cHRfYW1kLmMgICAgICAgIHwgIDYgLS0tCiBhcmNoL3g4Ni9tbS9wZ3Byb3QuYyAgICAgICAgICAg
ICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQs
IDczIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gveDg2L21tL3BncHJvdC5jCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvS2NvbmZpZyBiL2FyY2gv
eDg2L0tjb25maWcKaW5kZXggYjFjZTc1ZDBhYjBjLi5iMmVhMDZjODc3MDggMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L0tjb25maWcKKysrIGIvYXJjaC94ODYvS2NvbmZpZwpAQCAtNzUsNyArNzUsNiBA
QCBjb25maWcgWDg2CiAJc2VsZWN0IEFSQ0hfSEFTX0VBUkxZX0RFQlVHCQlpZiBLR0RCCiAJc2Vs
ZWN0IEFSQ0hfSEFTX0VMRl9SQU5ET01JWkUKIAlzZWxlY3QgQVJDSF9IQVNfRkFTVF9NVUxUSVBM
SUVSCi0Jc2VsZWN0IEFSQ0hfSEFTX0ZJTFRFUl9QR1BST1QKIAlzZWxlY3QgQVJDSF9IQVNfRk9S
VElGWV9TT1VSQ0UKIAlzZWxlY3QgQVJDSF9IQVNfR0NPVl9QUk9GSUxFX0FMTAogCXNlbGVjdCBB
UkNIX0hBU19LQ09WCQkJaWYgWDg2XzY0CkBAIC05NCw2ICs5Myw3IEBAIGNvbmZpZyBYODYKIAlz
ZWxlY3QgQVJDSF9IQVNfU1lOQ19DT1JFX0JFRk9SRV9VU0VSTU9ERQogCXNlbGVjdCBBUkNIX0hB
U19TWVNDQUxMX1dSQVBQRVIKIAlzZWxlY3QgQVJDSF9IQVNfVUJTQU5fU0FOSVRJWkVfQUxMCisJ
c2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QKIAlzZWxlY3QgQVJDSF9IQVNfREVCVUdf
V1gKIAlzZWxlY3QgQVJDSF9IQVNfWk9ORV9ETUFfU0VUIGlmIEVYUEVSVAogCXNlbGVjdCBBUkNI
X0hBVkVfTk1JX1NBRkVfQ01QWENIRwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IDhhOTQzMmZi
MzgwMi4uOTg1ZTFiODIzNjkxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC02NDgsMTEgKzY0
OCw2IEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90X3QgcGdwcm90X21vZGlmeShwZ3Byb3RfdCBvbGRw
cm90LCBwZ3Byb3RfdCBuZXdwcm90KQogCiAjZGVmaW5lIGNhbm9uX3BncHJvdChwKSBfX3BncHJv
dChtYXNzYWdlX3BncHJvdChwKSkKIAotc3RhdGljIGlubGluZSBwZ3Byb3RfdCBhcmNoX2ZpbHRl
cl9wZ3Byb3QocGdwcm90X3QgcHJvdCkKLXsKLQlyZXR1cm4gY2Fub25fcGdwcm90KHByb3QpOwot
fQotCiBzdGF0aWMgaW5saW5lIGludCBpc19uZXdfbWVtdHlwZV9hbGxvd2VkKHU2NCBwYWRkciwg
dW5zaWduZWQgbG9uZyBzaXplLAogCQkJCQkgZW51bSBwYWdlX2NhY2hlX21vZGUgcGNtLAogCQkJ
CQkgZW51bSBwYWdlX2NhY2hlX21vZGUgbmV3X3BjbSkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL3BndGFibGVfdHlwZXMuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVf
dHlwZXMuaAppbmRleCA0MDQ5N2E5MDIwYzYuLjFhOWRkOTMzMDg4ZSAxMDA2NDQKLS0tIGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vcGd0YWJsZV90eXBlcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3BndGFibGVfdHlwZXMuaApAQCAtMjI4LDI1ICsyMjgsNiBAQCBlbnVtIHBhZ2VfY2FjaGVf
bW9kZSB7CiAKICNlbmRpZgkvKiBfX0FTU0VNQkxZX18gKi8KIAotLyogICAgICAgICB4d3IgKi8K
LSNkZWZpbmUgX19QMDAwCVBBR0VfTk9ORQotI2RlZmluZSBfX1AwMDEJUEFHRV9SRUFET05MWQot
I2RlZmluZSBfX1AwMTAJUEFHRV9DT1BZCi0jZGVmaW5lIF9fUDAxMQlQQUdFX0NPUFkKLSNkZWZp
bmUgX19QMTAwCVBBR0VfUkVBRE9OTFlfRVhFQwotI2RlZmluZSBfX1AxMDEJUEFHRV9SRUFET05M
WV9FWEVDCi0jZGVmaW5lIF9fUDExMAlQQUdFX0NPUFlfRVhFQwotI2RlZmluZSBfX1AxMTEJUEFH
RV9DT1BZX0VYRUMKLQotI2RlZmluZSBfX1MwMDAJUEFHRV9OT05FCi0jZGVmaW5lIF9fUzAwMQlQ
QUdFX1JFQURPTkxZCi0jZGVmaW5lIF9fUzAxMAlQQUdFX1NIQVJFRAotI2RlZmluZSBfX1MwMTEJ
UEFHRV9TSEFSRUQKLSNkZWZpbmUgX19TMTAwCVBBR0VfUkVBRE9OTFlfRVhFQwotI2RlZmluZSBf
X1MxMDEJUEFHRV9SRUFET05MWV9FWEVDCi0jZGVmaW5lIF9fUzExMAlQQUdFX1NIQVJFRF9FWEVD
Ci0jZGVmaW5lIF9fUzExMQlQQUdFX1NIQVJFRF9FWEVDCi0KIC8qCiAgKiBlYXJseSBpZGVudGl0
eSBtYXBwaW5nICBwdGUgYXR0cmliIG1hY3Jvcy4KICAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
aW5jbHVkZS91YXBpL2FzbS9tbWFuLmggYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNtL21tYW4u
aAppbmRleCBkNGE4ZDA0MjRiZmIuLjc3NWRiZDNhZmY3MyAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS91YXBpL2FzbS9tbWFuLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS91YXBpL2FzbS9t
bWFuLmgKQEAgLTUsMjAgKzUsNiBAQAogI2RlZmluZSBNQVBfMzJCSVQJMHg0MAkJLyogb25seSBn
aXZlIG91dCAzMmJpdCBhZGRyZXNzZXMgKi8KIAogI2lmZGVmIENPTkZJR19YODZfSU5URUxfTUVN
T1JZX1BST1RFQ1RJT05fS0VZUwotLyoKLSAqIFRha2UgdGhlIDQgcHJvdGVjdGlvbiBrZXkgYml0
cyBvdXQgb2YgdGhlIHZtYS0+dm1fZmxhZ3MKLSAqIHZhbHVlIGFuZCB0dXJuIHRoZW0gaW4gdG8g
dGhlIGJpdHMgdGhhdCB3ZSBjYW4gcHV0IGluCi0gKiB0byBhIHB0ZS4KLSAqCi0gKiBPbmx5IG92
ZXJyaWRlIHRoZXNlIGlmIFByb3RlY3Rpb24gS2V5cyBhcmUgYXZhaWxhYmxlCi0gKiAod2hpY2gg
aXMgb25seSBvbiA2NC1iaXQpLgotICovCi0jZGVmaW5lIGFyY2hfdm1fZ2V0X3BhZ2VfcHJvdCh2
bV9mbGFncykJX19wZ3Byb3QoCVwKLQkJKCh2bV9mbGFncykgJiBWTV9QS0VZX0JJVDAgPyBfUEFH
RV9QS0VZX0JJVDAgOiAwKSB8CVwKLQkJKCh2bV9mbGFncykgJiBWTV9QS0VZX0JJVDEgPyBfUEFH
RV9QS0VZX0JJVDEgOiAwKSB8CVwKLQkJKCh2bV9mbGFncykgJiBWTV9QS0VZX0JJVDIgPyBfUEFH
RV9QS0VZX0JJVDIgOiAwKSB8CVwKLQkJKCh2bV9mbGFncykgJiBWTV9QS0VZX0JJVDMgPyBfUEFH
RV9QS0VZX0JJVDMgOiAwKSkKLQogI2RlZmluZSBhcmNoX2NhbGNfdm1fcHJvdF9iaXRzKHByb3Qs
IGtleSkgKAkJXAogCQkoKGtleSkgJiAweDEgPyBWTV9QS0VZX0JJVDAgOiAwKSB8ICAgICAgXAog
CQkoKGtleSkgJiAweDIgPyBWTV9QS0VZX0JJVDEgOiAwKSB8ICAgICAgXApkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvbW0vTWFrZWZpbGUgYi9hcmNoL3g4Ni9tbS9NYWtlZmlsZQppbmRleCBmZTNkMzA2
MWZjMTEuLmZiNmI0MWE0OGFlNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbW0vTWFrZWZpbGUKKysr
IGIvYXJjaC94ODYvbW0vTWFrZWZpbGUKQEAgLTIwLDcgKzIwLDcgQEAgQ0ZMQUdTX1JFTU9WRV9t
ZW1fZW5jcnlwdF9pZGVudGl0eS5vCT0gLXBnCiBlbmRpZgogCiBvYmoteQkJCQk6PSAgaW5pdC5v
IGluaXRfJChCSVRTKS5vIGZhdWx0Lm8gaW9yZW1hcC5vIGV4dGFibGUubyBtbWFwLm8gXAotCQkJ
CSAgICBwZ3RhYmxlLm8gcGh5c2FkZHIubyBzZXR1cF9ueC5vIHRsYi5vIGNwdV9lbnRyeV9hcmVh
Lm8gbWFjY2Vzcy5vCisJCQkJICAgIHBndGFibGUubyBwaHlzYWRkci5vIHNldHVwX254Lm8gdGxi
Lm8gY3B1X2VudHJ5X2FyZWEubyBtYWNjZXNzLm8gcGdwcm90Lm8KIAogb2JqLXkJCQkJKz0gcGF0
LwogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9tZW1fZW5jcnlwdF9hbWQuYyBiL2FyY2gveDg2
L21tL21lbV9lbmNyeXB0X2FtZC5jCmluZGV4IDJiMmQwMThlYTM0NS4uOTVmOTRlYWFjOWEwIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9tZW1fZW5jcnlwdF9hbWQuYworKysgYi9hcmNoL3g4Ni9t
bS9tZW1fZW5jcnlwdF9hbWQuYwpAQCAtMTc5LDggKzE3OSw2IEBAIHZvaWQgX19pbml0IHNtZV9t
YXBfYm9vdGRhdGEoY2hhciAqcmVhbF9tb2RlX2RhdGEpCiAKIHZvaWQgX19pbml0IHNtZV9lYXJs
eV9pbml0KHZvaWQpCiB7Ci0JdW5zaWduZWQgaW50IGk7Ci0KIAlpZiAoIXNtZV9tZV9tYXNrKQog
CQlyZXR1cm47CiAKQEAgLTE4OCwxMCArMTg2LDYgQEAgdm9pZCBfX2luaXQgc21lX2Vhcmx5X2lu
aXQodm9pZCkKIAogCV9fc3VwcG9ydGVkX3B0ZV9tYXNrID0gX19zbWVfc2V0KF9fc3VwcG9ydGVk
X3B0ZV9tYXNrKTsKIAotCS8qIFVwZGF0ZSB0aGUgcHJvdGVjdGlvbiBtYXAgd2l0aCBtZW1vcnkg
ZW5jcnlwdGlvbiBtYXNrICovCi0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUocHJvdGVjdGlv
bl9tYXApOyBpKyspCi0JCXByb3RlY3Rpb25fbWFwW2ldID0gcGdwcm90X2VuY3J5cHRlZChwcm90
ZWN0aW9uX21hcFtpXSk7Ci0KIAlpZiAoY2NfcGxhdGZvcm1faGFzKENDX0FUVFJfR1VFU1RfTUVN
X0VOQ1JZUFQpKQogCQlzd2lvdGxiX2ZvcmNlID0gU1dJT1RMQl9GT1JDRTsKIH0KZGlmZiAtLWdp
dCBhL2FyY2gveDg2L21tL3BncHJvdC5jIGIvYXJjaC94ODYvbW0vcGdwcm90LmMKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41ZjJmMDI5Y2U0ZmEKLS0tIC9kZXYvbnVs
bAorKysgYi9hcmNoL3g4Ni9tbS9wZ3Byb3QuYwpAQCAtMCwwICsxLDcxIEBACisvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCisjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cisj
aW5jbHVkZSA8bGludXgvbW0uaD4KKyNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgorCitzdGF0aWMg
aW5saW5lIHBncHJvdF90IF9fdm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdz
KQoreworCXN3aXRjaCAodm1fZmxhZ3MgJiAoVk1fUkVBRCB8IFZNX1dSSVRFIHwgVk1fRVhFQyB8
IFZNX1NIQVJFRCkpIHsKKwljYXNlIFZNX05PTkU6CisJCXJldHVybiBQQUdFX05PTkU7CisJY2Fz
ZSBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFET05MWTsKKwljYXNlIFZNX1dSSVRFOgorCQly
ZXR1cm4gUEFHRV9DT1BZOworCWNhc2UgVk1fV1JJVEUgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFH
RV9DT1BZOworCWNhc2UgVk1fRVhFQzoKKwljYXNlIFZNX0VYRUMgfCBWTV9SRUFEOgorCQlyZXR1
cm4gUEFHRV9SRUFET05MWV9FWEVDOworCWNhc2UgVk1fRVhFQyB8IFZNX1dSSVRFOgorCWNhc2Ug
Vk1fRVhFQyB8IFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfQ09QWV9FWEVDOwor
CWNhc2UgVk1fU0hBUkVEOgorCQlyZXR1cm4gUEFHRV9OT05FOworCWNhc2UgVk1fU0hBUkVEIHwg
Vk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfUkVBRE9OTFk7CisJY2FzZSBWTV9TSEFSRUQgfCBWTV9X
UklURToKKwljYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBB
R0VfU0hBUkVEOworCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhFQzoKKwljYXNlIFZNX1NIQVJFRCB8
IFZNX0VYRUMgfCBWTV9SRUFEOgorCQlyZXR1cm4gUEFHRV9SRUFET05MWV9FWEVDOworCWNhc2Ug
Vk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZNX1dSSVRFOgorCWNhc2UgVk1fU0hBUkVEIHwgVk1fRVhF
QyB8IFZNX1dSSVRFIHwgVk1fUkVBRDoKKwkJcmV0dXJuIFBBR0VfU0hBUkVEX0VYRUM7CisJZGVm
YXVsdDoKKwkJQlVJTERfQlVHKCk7CisJCXJldHVybiBQQUdFX05PTkU7CisJfQorfQorCisKK3Bn
cHJvdF90IHZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKK3sKKwl1bnNp
Z25lZCBsb25nIHZhbCA9IHBncHJvdF92YWwoX192bV9nZXRfcGFnZV9wcm90KHZtX2ZsYWdzKSk7
CisKKyNpZmRlZiBDT05GSUdfWDg2X0lOVEVMX01FTU9SWV9QUk9URUNUSU9OX0tFWVMKKwkvKgor
CSAqIFRha2UgdGhlIDQgcHJvdGVjdGlvbiBrZXkgYml0cyBvdXQgb2YgdGhlIHZtYS0+dm1fZmxh
Z3MgdmFsdWUgYW5kCisJICogdHVybiB0aGVtIGluIHRvIHRoZSBiaXRzIHRoYXQgd2UgY2FuIHB1
dCBpbiB0byBhIHB0ZS4KKwkgKgorCSAqIE9ubHkgb3ZlcnJpZGUgdGhlc2UgaWYgUHJvdGVjdGlv
biBLZXlzIGFyZSBhdmFpbGFibGUgKHdoaWNoIGlzIG9ubHkKKwkgKiBvbiA2NC1iaXQpLgorCSAq
LworCWlmICh2bV9mbGFncyAmIFZNX1BLRVlfQklUMCkKKwkJdmFsIHw9IF9QQUdFX1BLRVlfQklU
MDsKKwlpZiAodm1fZmxhZ3MgJiBWTV9QS0VZX0JJVDEpCisJCXZhbCB8PSBfUEFHRV9QS0VZX0JJ
VDE7CisJaWYgKHZtX2ZsYWdzICYgVk1fUEtFWV9CSVQyKQorCQl2YWwgfD0gX1BBR0VfUEtFWV9C
SVQyOworCWlmICh2bV9mbGFncyAmIFZNX1BLRVlfQklUMykKKwkJdmFsIHw9IF9QQUdFX1BLRVlf
QklUMzsKKyNlbmRpZgorCisJdmFsID0gX19zbWVfc2V0KHZhbCk7CisJaWYgKHZhbCAmIF9QQUdF
X1BSRVNFTlQpCisJCXZhbCAmPSBfX3N1cHBvcnRlZF9wdGVfbWFzazsKKwlyZXR1cm4gX19wZ3By
b3QodmFsKTsKK30KK0VYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2VfcHJvdCk7Ci0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

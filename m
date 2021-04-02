Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ABFBB35324E
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3D265212F8;
	Sat,  3 Apr 2021 06:19:00 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 4B8A0212C8
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:15 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFx03zqz9v2m3;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A8kam4b7TJbi; Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFw53rLz9v2ls;
 Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C7E18BB7F;
 Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H5LeedaB8gob; Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25D4A8BB79;
 Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0385767989; Fri,  2 Apr 2021 15:18:13 +0000 (UTC)
Message-Id: <9b4899b0abc156eb207b19fe0b24dd5bf0355b99.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:13 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 12/20] nios2: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4K
LS0tCnY0OiBBZGRlZCBtaXNzaW5nIHNlbGVjdGlvbiBvZiBDT05GSUdfR0VORVJJQ19DTURMSU5F
IGluIEtjb25maWcKLS0tCiBhcmNoL25pb3MyL0tjb25maWcgICAgICAgIHwgMjUgKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYyB8IDEzICsrKystLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL0tjb25maWcgYi9hcmNoL25pb3MyL0tjb25maWcKaW5k
ZXggYzI0OTU1YzgxYzkyLi42MDE4ZjNkNjI2ZjggMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIvS2Nv
bmZpZworKysgYi9hcmNoL25pb3MyL0tjb25maWcKQEAgLTEwLDYgKzEwLDcgQEAgY29uZmlnIE5J
T1MyCiAJc2VsZWN0IENPTU1PTl9DTEsKIAlzZWxlY3QgVElNRVJfT0YKIAlzZWxlY3QgR0VORVJJ
Q19BVE9NSUM2NAorCXNlbGVjdCBHRU5FUklDX0NNRExJTkUKIAlzZWxlY3QgR0VORVJJQ19DUFVf
REVWSUNFUwogCXNlbGVjdCBHRU5FUklDX0lSUV9QUk9CRQogCXNlbGVjdCBHRU5FUklDX0lSUV9T
SE9XCkBAIC05MCwzMSArOTEsOSBAQCBjb25maWcgTklPUzJfQUxJR05NRU5UX1RSQVAKIAogY29t
bWVudCAiQm9vdCBvcHRpb25zIgogCi1jb25maWcgQ01ETElORV9CT09MCi0JYm9vbCAiRGVmYXVs
dCBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMiCi0JZGVmYXVsdCB5Ci0KLWNvbmZpZyBDTURM
SU5FCi0Jc3RyaW5nICJEZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLQlkZWZhdWx0ICIi
Ci0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKLQloZWxwCi0JICBPbiBzb21lIHBsYXRmb3Jtcywg
dGhlcmUgaXMgY3VycmVudGx5IG5vIHdheSBmb3IgdGhlIGJvb3QgbG9hZGVyIHRvCi0JICBwYXNz
IGFyZ3VtZW50cyB0byB0aGUga2VybmVsLiBGb3IgdGhlc2UgcGxhdGZvcm1zLCB5b3UgY2FuIHN1
cHBseQotCSAgc29tZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0aW1lIGJ5IGVudGVy
aW5nIHRoZW0gaGVyZS4gIEluCi0JICBvdGhlciBjYXNlcyB5b3UgY2FuIHNwZWNpZnkga2VybmVs
IGFyZ3Mgc28gdGhhdCB5b3UgZG9uJ3QgaGF2ZQotCSAgdG8gc2V0IHRoZW0gdXAgaW4gYm9hcmQg
cHJvbSBpbml0aWFsaXphdGlvbiByb3V0aW5lcy4KLQotY29uZmlnIENNRExJTkVfRk9SQ0UKLQli
b29sICJGb3JjZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLQlkZXBlbmRzIG9uIENN
RExJTkVfQk9PTAotCWhlbHAKLQkgIFNldCB0aGlzIHRvIGhhdmUgYXJndW1lbnRzIGZyb20gdGhl
IGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nCi0JICBvdmVycmlkZSB0aG9zZSBwYXNzZWQg
YnkgdGhlIGJvb3QgbG9hZGVyLgotCiBjb25maWcgTklPUzJfQ01ETElORV9JR05PUkVfRFRCCiAJ
Ym9vbCAiSWdub3JlIGtlcm5lbCBjb21tYW5kIHN0cmluZyBmcm9tIERUQiIKLQlkZXBlbmRzIG9u
IENNRExJTkVfQk9PTAorCWRlcGVuZHMgb24gQ01ETElORSAhPSAiIgogCWRlcGVuZHMgb24gIUNN
RExJTkVfRk9SQ0UKIAlkZWZhdWx0IHkKIAloZWxwCmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL2tl
cm5lbC9zZXR1cC5jIGIvYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYwppbmRleCBkMmYyMTk1N2U5
OWMuLjViMzhkM2QwYWQ2NCAxMDA2NDQKLS0tIGEvYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYwor
KysgYi9hcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5jCkBAIC0yMCw2ICsyMCw3IEBACiAjaW5jbHVk
ZSA8bGludXgvaW5pdHJkLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZmR0Lmg+CiAjaW5jbHVkZSA8
bGludXgvc2NyZWVuX2luZm8uaD4KKyNpbmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+CiAKICNpbmNs
dWRlIDxhc20vbW11X2NvbnRleHQuaD4KICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KQEAgLTEw
OCw3ICsxMDksNyBAQCBhc21saW5rYWdlIHZvaWQgX19pbml0IG5pb3MyX2Jvb3RfaW5pdCh1bnNp
Z25lZCByNCwgdW5zaWduZWQgcjUsIHVuc2lnbmVkIHI2LAogCQkJCSAgICAgICB1bnNpZ25lZCBy
NykKIHsKIAl1bnNpZ25lZCBkdGJfcGFzc2VkID0gMDsKLQljaGFyIGNtZGxpbmVfcGFzc2VkW0NP
TU1BTkRfTElORV9TSVpFXSBfX21heWJlX3VudXNlZCA9IHsgMCwgfTsKKwljaGFyIGNtZGxpbmVf
cGFzc2VkW0NPTU1BTkRfTElORV9TSVpFXSA9IHsgMCwgfTsKIAogI2lmIGRlZmluZWQoQ09ORklH
X05JT1MyX1BBU1NfQ01ETElORSkKIAlpZiAocjQgPT0gMHg1MzRmNDk0ZSkgeyAvKiByNCBpcyBt
YWdpYyBOSU9TICovCkBAIC0xMjcsMTQgKzEyOCw4IEBAIGFzbWxpbmthZ2Ugdm9pZCBfX2luaXQg
bmlvczJfYm9vdF9pbml0KHVuc2lnbmVkIHI0LCB1bnNpZ25lZCByNSwgdW5zaWduZWQgcjYsCiAK
IAllYXJseV9pbml0X2RldnRyZWUoKHZvaWQgKilkdGJfcGFzc2VkKTsKIAotI2lmbmRlZiBDT05G
SUdfQ01ETElORV9GT1JDRQotCWlmIChjbWRsaW5lX3Bhc3NlZFswXSkKLQkJc3RybGNweShib290
X2NvbW1hbmRfbGluZSwgY21kbGluZV9wYXNzZWQsIENPTU1BTkRfTElORV9TSVpFKTsKLSNpZmRl
ZiBDT05GSUdfTklPUzJfQ01ETElORV9JR05PUkVfRFRCCi0JZWxzZQotCQlzdHJsY3B5KGJvb3Rf
Y29tbWFuZF9saW5lLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwotI2VuZGlm
Ci0jZW5kaWYKKwlpZiAoY21kbGluZV9wYXNzZWRbMF0gfHwgSVNfRU5BQkxFRChDT05GSUdfTklP
UzJfQ01ETElORV9JR05PUkVfRFRCKSkKKwkJY21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGlu
ZSwgY21kbGluZV9wYXNzZWQpOwogCiAJcGFyc2VfZWFybHlfcGFyYW0oKTsKIH0KLS0gCjIuMjUu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

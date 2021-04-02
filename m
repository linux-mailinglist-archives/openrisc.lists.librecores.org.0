Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CB53C353245
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 03FB821336;
	Sat,  3 Apr 2021 06:18:49 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 0F3422122B
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFl3Jq5z9v2m1;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id otY6ACZI1rY1; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFl2Mpwz9v2ls;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 33C168BB7B;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id j0ftI9D6qL0u; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A27078BB79;
 Fri,  2 Apr 2021 17:18:04 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7ECCA67989; Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
Message-Id: <76542a49b685ddb41894fd53feb250fcec731b01.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:04 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 03/20] x86/efi: Replace
 CONFIG_CMDLINE_OVERRIDE by CONFIG_CMDLINE_FORCE
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

RHVyaW5nIGJvb3QsIHg4NiB1c2VzIEVGSSBkcml2ZXIuIFRoYXQgZHJpdmVyIGlzIGFsc28gdXNl
ZApieSBBUk0uCgpJbiBvcmRlciB0byByZWZhY3RvciB0aGUgY29tbWFuZCBsaW5lIHByb2Nlc3Np
bmcgaW4gdGhhdCBkcml2ZXIKaW4gYSBmb2xsb3dpbmcgcGF0Y2gsIHJlbmFtZSBDT05GSUdfQ01E
TElORV9PVkVSUklERSBieQpDT05GSUdfQ01ETElORV9GT1JDRSBvbiB0aGUgeDg2IGluIG9yZGVy
IHRvIGJlIHNpbWlsYXIKdG8gQVJNIChhbmQgbW9zdCBvdGhlciBhcmNoaXRlY3R1cmVzKS4KClNp
Z25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4KLS0tCnY0OiBOZXcKLS0tCiBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgfCA0ICsrLS0KIGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgICAgICB8IDIg
Ky0KIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYyB8IDIgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDI3OTI4NzlkMzk4ZS4u
YTIwNjg0ZDU2YjRiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL2FyY2gveDg2
L0tjb25maWcKQEAgLTIzODQsMTQgKzIzODQsMTQgQEAgY29uZmlnIENNRExJTkUKIAkgIGNvbW1h
bmQgbGluZSBhdCBib290IHRpbWUsIGl0IGlzIGFwcGVuZGVkIHRvIHRoaXMgc3RyaW5nIHRvCiAJ
ICBmb3JtIHRoZSBmdWxsIGtlcm5lbCBjb21tYW5kIGxpbmUsIHdoZW4gdGhlIHN5c3RlbSBib290
cy4KIAotCSAgSG93ZXZlciwgeW91IGNhbiB1c2UgdGhlIENPTkZJR19DTURMSU5FX09WRVJSSURF
IG9wdGlvbiB0bworCSAgSG93ZXZlciwgeW91IGNhbiB1c2UgdGhlIENPTkZJR19DTURMSU5FX0ZP
UkNFIG9wdGlvbiB0bwogCSAgY2hhbmdlIHRoaXMgYmVoYXZpb3IuCiAKIAkgIEluIG1vc3QgY2Fz
ZXMsIHRoZSBjb21tYW5kIGxpbmUgKHdoZXRoZXIgYnVpbHQtaW4gb3IgcHJvdmlkZWQKIAkgIGJ5
IHRoZSBib290IGxvYWRlcikgc2hvdWxkIHNwZWNpZnkgdGhlIGRldmljZSBmb3IgdGhlIHJvb3QK
IAkgIGZpbGUgc3lzdGVtLgogCi1jb25maWcgQ01ETElORV9PVkVSUklERQorY29uZmlnIENNRExJ
TkVfRk9SQ0UKIAlib29sICJCdWlsdC1pbiBjb21tYW5kIGxpbmUgb3ZlcnJpZGVzIGJvb3QgbG9h
ZGVyIGFyZ3VtZW50cyIKIAlkZXBlbmRzIG9uIENNRExJTkVfQk9PTCAmJiBDTURMSU5FICE9ICIi
CiAJaGVscApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL3NldHVwLmMgYi9hcmNoL3g4Ni9r
ZXJuZWwvc2V0dXAuYwppbmRleCBkODgzMTc2ZWYyY2UuLjZmMmRlNThlZWI1NCAxMDA2NDQKLS0t
IGEvYXJjaC94ODYva2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMK
QEAgLTg4NCw3ICs4ODQsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5l
X3ApCiAJYnNzX3Jlc291cmNlLmVuZCA9IF9fcGFfc3ltYm9sKF9fYnNzX3N0b3ApLTE7CiAKICNp
ZmRlZiBDT05GSUdfQ01ETElORV9CT09MCi0jaWZkZWYgQ09ORklHX0NNRExJTkVfT1ZFUlJJREUK
KyNpZmRlZiBDT05GSUdfQ01ETElORV9GT1JDRQogCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUs
IGJ1aWx0aW5fY21kbGluZSwgQ09NTUFORF9MSU5FX1NJWkUpOwogI2Vsc2UKIAlpZiAoYnVpbHRp
bl9jbWRsaW5lWzBdKSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHVi
L3g4Ni1zdHViLmMgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL3g4Ni1zdHViLmMKaW5k
ZXggZjE0YzRmZjU4MzlmLi4yODY1OTI3NmI2YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZmlybXdh
cmUvZWZpL2xpYnN0dWIveDg2LXN0dWIuYworKysgYi9kcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJz
dHViL3g4Ni1zdHViLmMKQEAgLTc0Miw3ICs3NDIsNyBAQCB1bnNpZ25lZCBsb25nIGVmaV9tYWlu
KGVmaV9oYW5kbGVfdCBoYW5kbGUsCiAJCWdvdG8gZmFpbDsKIAl9CiAjZW5kaWYKLQlpZiAoIUlT
X0VOQUJMRUQoQ09ORklHX0NNRExJTkVfT1ZFUlJJREUpKSB7CisJaWYgKCFJU19FTkFCTEVEKENP
TkZJR19DTURMSU5FX0ZPUkNFKSkgewogCQl1bnNpZ25lZCBsb25nIGNtZGxpbmVfcGFkZHIgPSAo
KHU2NCloZHItPmNtZF9saW5lX3B0ciB8CiAJCQkJCSAgICAgICAoKHU2NClib290X3BhcmFtcy0+
ZXh0X2NtZF9saW5lX3B0ciA8PCAzMikpOwogCQlzdGF0dXMgPSBlZmlfcGFyc2Vfb3B0aW9ucygo
Y2hhciAqKWNtZGxpbmVfcGFkZHIpOwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

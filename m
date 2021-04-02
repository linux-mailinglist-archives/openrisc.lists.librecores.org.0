Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C14BD35324C
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1456821314;
	Sat,  3 Apr 2021 06:18:58 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 355F2212C8
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFt4S04z9v2lv;
 Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sA0hud0WLToF; Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFt3brMz9v2ls;
 Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68B998BB7B;
 Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b-4XVonvcJNM; Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB36D8BB79;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C79AA67989; Fri,  2 Apr 2021 15:18:11 +0000 (UTC)
Message-Id: <1180421ba35993f4a533708b91c93f1da07d14dc.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:11 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 10/20] hexagon: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL2hleGFnb24vS2NvbmZpZyAgICAgICAgfCAxMSArLS0tLS0tLS0tLQogYXJjaC9o
ZXhhZ29uL2tlcm5lbC9zZXR1cC5jIHwgMTAgKystLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdv
bi9LY29uZmlnIGIvYXJjaC9oZXhhZ29uL0tjb25maWcKaW5kZXggNDRhNDA5OTY3YWYxLi4xZTY5
Yzk5YmFlNmIgMTAwNjQ0Ci0tLSBhL2FyY2gvaGV4YWdvbi9LY29uZmlnCisrKyBiL2FyY2gvaGV4
YWdvbi9LY29uZmlnCkBAIC0xOCw2ICsxOCw3IEBAIGNvbmZpZyBIRVhBR09OCiAJc2VsZWN0IEhB
VkVfUEVSRl9FVkVOVFMKIAkjIEdFTkVSSUNfQUxMT0NBVE9SIGlzIHVzZWQgYnkgZG1hX2FsbG9j
X2NvaGVyZW50KCkKIAlzZWxlY3QgR0VORVJJQ19BTExPQ0FUT1IKKwlzZWxlY3QgR0VORVJJQ19D
TURMSU5FCiAJc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1cKIAlzZWxlY3QgSEFWRV9BUkNIX0tHREIK
IAlzZWxlY3QgSEFWRV9BUkNIX1RSQUNFSE9PSwpAQCAtOTEsMTYgKzkyLDYgQEAgY29uZmlnIEhF
WEFHT05fQVJDSF9WRVJTSU9OCiAJaW50ICJBcmNoaXRlY3R1cmUgdmVyc2lvbiIKIAlkZWZhdWx0
IDIKIAotY29uZmlnIENNRExJTkUKLQlzdHJpbmcgIkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3Ry
aW5nIgotCWRlZmF1bHQgIiIKLQloZWxwCi0JICBPbiBzb21lIHBsYXRmb3JtcywgdGhlcmUgaXMg
Y3VycmVudGx5IG5vIHdheSBmb3IgdGhlIGJvb3QgbG9hZGVyCi0JICB0byBwYXNzIGFyZ3VtZW50
cyB0byB0aGUga2VybmVsLiBGb3IgdGhlc2UsIHlvdSBzaG91bGQgc3VwcGx5IHNvbWUKLQkgIGNv
bW1hbmQtbGluZSBvcHRpb25zIGF0IGJ1aWxkIHRpbWUgYnkgZW50ZXJpbmcgdGhlbSBoZXJlLiAg
QXQgYQotCSAgbWluaW11bSwgeW91IHNob3VsZCBzcGVjaWZ5IHRoZSBtZW1vcnkgc2l6ZSBhbmQg
dGhlIHJvb3QgZGV2aWNlCi0JICAoZS5nLiwgbWVtPTY0TSByb290PS9kZXYvbmZzKS4KLQogY29u
ZmlnIFNNUAogCWJvb2wgIk11bHRpLVByb2Nlc3Npbmcgc3VwcG9ydCIKIAloZWxwCmRpZmYgLS1n
aXQgYS9hcmNoL2hleGFnb24va2VybmVsL3NldHVwLmMgYi9hcmNoL2hleGFnb24va2VybmVsL3Nl
dHVwLmMKaW5kZXggMTg4MGQ5YmVhZjJiLi43ODY0MWNlMjE5ZTIgMTAwNjQ0Ci0tLSBhL2FyY2gv
aGV4YWdvbi9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL2hleGFnb24va2VybmVsL3NldHVwLmMK
QEAgLTEzLDYgKzEzLDcgQEAKICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgogI2luY2x1ZGUg
PGxpbnV4L2NvbnNvbGUuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9mZHQuaD4KKyNpbmNsdWRlIDxs
aW51eC9jbWRsaW5lLmg+CiAjaW5jbHVkZSA8YXNtL2lvLmg+CiAjaW5jbHVkZSA8YXNtL3NlY3Rp
b25zLmg+CiAjaW5jbHVkZSA8YXNtL3NldHVwLmg+CkBAIC0yMiw3ICsyMyw2IEBACiAjaW5jbHVk
ZSA8YXNtL3RpbWUuaD4KIAogY2hhciBjbWRfbGluZVtDT01NQU5EX0xJTkVfU0laRV07Ci1zdGF0
aWMgY2hhciBkZWZhdWx0X2NvbW1hbmRfbGluZVtDT01NQU5EX0xJTkVfU0laRV0gX19pbml0ZGF0
YSA9IENPTkZJR19DTURMSU5FOwogCiBpbnQgb25fc2ltdWxhdG9yOwogCkBAIC0zOCw4ICszOCw2
IEBAIHZvaWQgY2FsaWJyYXRlX2RlbGF5KHZvaWQpCiAKIHZvaWQgX19pbml0IHNldHVwX2FyY2go
Y2hhciAqKmNtZGxpbmVfcCkKIHsKLQljaGFyICpwID0gJmV4dGVybmFsX2NtZGxpbmVfYnVmZmVy
OwotCiAJLyoKIAkgKiBUaGVzZSB3aWxsIGV2ZW50dWFsbHkgYmUgcHVsbGVkIGluIHZpYSBlaXRo
ZXIgc29tZSBoeXBlcnZpc29yCiAJICogb3IgZGV2aWNldHJlZSBkZXNjcmlwdGlvbi4gIEhhcmR3
aXJpbmcgZm9yIG5vdy4KQEAgLTY1LDExICs2Myw3IEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2go
Y2hhciAqKmNtZGxpbmVfcCkKIAllbHNlCiAJCW9uX3NpbXVsYXRvciA9IDA7CiAKLQlpZiAocFsw
XSAhPSAnXDAnKQotCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBwLCBDT01NQU5EX0xJTkVf
U0laRSk7Ci0JZWxzZQotCQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBkZWZhdWx0X2NvbW1h
bmRfbGluZSwKLQkJCUNPTU1BTkRfTElORV9TSVpFKTsKKwljbWRsaW5lX2J1aWxkKGJvb3RfY29t
bWFuZF9saW5lLCBleHRlcm5hbF9jbWRsaW5lX2J1ZmZlcik7CiAKIAkvKgogCSAqIGJvb3RfY29t
bWFuZF9saW5lIGFuZCB0aGUgdmFsdWUgc2V0IHVwIGJ5IHNldHVwX2FyY2gKLS0gCjIuMjUuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

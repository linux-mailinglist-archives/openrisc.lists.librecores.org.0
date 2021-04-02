Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F952353243
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 799D22132F;
	Sat,  3 Apr 2021 06:18:48 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id F15EA2122B
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFj2vNPz9v2lt;
 Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NJ34BehnDmHj; Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFj1ndyz9v2ls;
 Fri,  2 Apr 2021 17:18:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2774B8BB7C;
 Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wc8EW3tptikR; Fri,  2 Apr 2021 17:18:03 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 99C3C8BB7B;
 Fri,  2 Apr 2021 17:18:02 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 701DA67989; Fri,  2 Apr 2021 15:18:02 +0000 (UTC)
Message-Id: <68db4e57bb88c523f76dcae12feafbb0cae1a85d.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:02 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 01/20] cmdline: Add generic function to build
 command line.
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

VGhpcyBjb2RlIHByb3ZpZGVzIGFyY2hpdGVjdHVyZXMgd2l0aCBhIHdheSB0byBidWlsZCBjb21t
YW5kIGxpbmUKYmFzZWQgb24gd2hhdCBpcyBidWlsdCBpbiB0aGUga2VybmVsIGFuZCB3aGF0IGlz
IGhhbmRlZCBvdmVyIGJ5IHRoZQpib290bG9hZGVyLCBiYXNlZCBvbiBzZWxlY3RlZCBjb21waWxl
LXRpbWUgb3B0aW9ucy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4KLS0tCnYzOgotIEFkZHJlc3NlZCBjb21tZW50cyBmcm9tIFdp
bGwKLSBBZGRlZCBjYXBhYmlsaXR5IHRvIGhhdmUgc3JjID09IGRzdAp2NDoKLSBBZGQgY21kbGlu
ZV9zdHJsY3B5KCkKLSBSZW1vdmVkIGNtZGxpbmVfYnVpbGQoKSBtYWNybywgX19jbWRsaW5lX2J1
aWxkKCkgYmVjb21lcyBjbWRsaW5lX2J1aWxkKCkKLSBGaXhlZCB0aGUgZGVzdGluYXRpb24gbGVu
Z3RoIHRvIENPTU1BTkRfTElORV9TSVpFCi0gVHJ1bmNhdGUgYXQgYSBzcGFjZSBub3QgaW4gYSBx
dW90ZSB3aGVuIHRvbyBsb25nCi0gQWRkZWQgYSBtZXNzYWdlIHdoZW4gZm9yY2luZyB0aGUgY29t
bWFuZCBsaW5lCi0tLQogaW5jbHVkZS9saW51eC9jbWRsaW5lLmggfCA3OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvY21kbGluZS5oIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5hMDc3M2RjMzY1YzcKLS0t
IC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaApAQCAtMCwwICsxLDc5IEBA
CisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworI2lmbmRlZiBfTElOVVhf
Q01ETElORV9ICisjZGVmaW5lIF9MSU5VWF9DTURMSU5FX0gKKworI2luY2x1ZGUgPGxpbnV4L3N0
cmluZy5oPgorI2luY2x1ZGUgPGxpbnV4L3ByaW50ay5oPgorI2luY2x1ZGUgPGFzbS9zZXR1cC5o
PgorCisvKiBBbGxvdyB1c2VycyB0byBvdmVycmlkZSBzdHJsY2F0L3N0cmxjcHksIHBvd2VycGMg
Y2FuJ3QgdXNlIHN0cmluZ3Mgc28gZWFybHkqLworI2lmbmRlZiBjbWRsaW5lX3N0cmxjYXQKKyNk
ZWZpbmUgY21kbGluZV9zdHJsY2F0IHN0cmxjYXQKKyNkZWZpbmUgY21kbGluZV9zdHJsY3B5IHN0
cmxjcHkKKyNlbmRpZgorCisvKgorICogVGhpcyBmdW5jdGlvbiB3aWxsIGFwcGVuZCBvciBwcmVw
ZW5kIGEgYnVpbHRpbiBjb21tYW5kIGxpbmUgdG8gdGhlIGNvbW1hbmQKKyAqIGxpbmUgcHJvdmlk
ZWQgYnkgdGhlIGJvb3Rsb2FkZXIuIEtjb25maWcgb3B0aW9ucyBjYW4gYmUgdXNlZCB0byBhbHRl
cgorICogdGhlIGJlaGF2aW9yIG9mIHRoaXMgYnVpbHRpbiBjb21tYW5kIGxpbmUuCisgKiBAZHN0
OiBUaGUgZGVzdGluYXRpb24gb2YgdGhlIGZpbmFsIGNvbW1hbmQgbGluZSAoTWluLiBzaXplIENP
TU1BTkRfTElORV9TSVpFKQorICogQHNyYzogVGhlIHN0YXJ0aW5nIHN0cmluZyBvciBOVUxMIGlm
IHRoZXJlIGlzbid0IG9uZS4gTXVzdCBub3QgZXF1YWwgZHN0LgorICogUmV0dXJuczogZmFsc2Ug
aWYgdGhlIHN0cmluZyB3YXMgdHJ1bmNhdGVkLCB0cnVlIG90aGVyd2lzZQorICovCitzdGF0aWMg
X19hbHdheXNfaW5saW5lIGJvb2wgX19jbWRsaW5lX2J1aWxkKGNoYXIgKmRzdCwgY29uc3QgY2hh
ciAqc3JjKQoreworCWludCBsZW47CisJY2hhciAqcHRyLCAqbGFzdF9zcGFjZTsKKwlib29sIGlu
X3F1b3RlID0gZmFsc2U7CisKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkp
CisJCXNyYyA9IE5VTEw7CisKKwlkc3RbMF0gPSAwOworCisJaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfUFJFUEVORCkpCisJCWxlbiA9IGNtZGxpbmVfc3RybGNhdChkc3QsIENPTkZJR19D
TURMSU5FICIgIiwgQ09NTUFORF9MSU5FX1NJWkUpOworCisJbGVuID0gY21kbGluZV9zdHJsY2F0
KGRzdCwgc3JjLCBDT01NQU5EX0xJTkVfU0laRSk7CisKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdf
Q01ETElORV9FWFRFTkQpKQorCQlsZW4gPSBjbWRsaW5lX3N0cmxjYXQoZHN0LCAiICIgQ09ORklH
X0NNRExJTkUsIENPTU1BTkRfTElORV9TSVpFKTsKKworCWlmIChsZW4gPCBDT01NQU5EX0xJTkVf
U0laRSAtIDEpCisJCXJldHVybiB0cnVlOworCisJZm9yIChwdHIgPSBkc3Q7ICpwdHI7IHB0cisr
KSB7CisJCWlmICgqcHRyID09ICciJykKKwkJCWluX3F1b3RlID0gIWluX3F1b3RlOworCQlpZiAo
KnB0ciA9PSAnICcgJiYgIWluX3F1b3RlKQorCQkJbGFzdF9zcGFjZSA9IHB0cjsKKwl9CisJaWYg
KGxhc3Rfc3BhY2UpCisJCSpsYXN0X3NwYWNlID0gMDsKKworCXJldHVybiBmYWxzZTsKK30KKwor
LyoKKyAqIFRoaXMgZnVuY3Rpb24gd2lsbCBhcHBlbmQgb3IgcHJlcGVuZCBhIGJ1aWx0aW4gY29t
bWFuZCBsaW5lIHRvIHRoZSBjb21tYW5kCisgKiBsaW5lIHByb3ZpZGVkIGJ5IHRoZSBib290bG9h
ZGVyLiBLY29uZmlnIG9wdGlvbnMgY2FuIGJlIHVzZWQgdG8gYWx0ZXIKKyAqIHRoZSBiZWhhdmlv
ciBvZiB0aGlzIGJ1aWx0aW4gY29tbWFuZCBsaW5lLgorICogQGRzdDogVGhlIGRlc3RpbmF0aW9u
IG9mIHRoZSBmaW5hbCBjb21tYW5kIGxpbmUgKE1pbi4gc2l6ZSBDT01NQU5EX0xJTkVfU0laRSkK
KyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBpZiB0aGVyZSBpc24ndCBvbmUu
CisgKi8KK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBjbWRsaW5lX2J1aWxkKGNoYXIgKmRz
dCwgY29uc3QgY2hhciAqc3JjKQoreworCXN0YXRpYyBjaGFyIHRtcFtDT01NQU5EX0xJTkVfU0la
RV0gX19pbml0ZGF0YTsKKworCWlmIChzcmMgPT0gZHN0KSB7CisJCWNtZGxpbmVfc3RybGNweSh0
bXAsIHNyYywgQ09NTUFORF9MSU5FX1NJWkUpOworCQlzcmMgPSB0bXA7CisJfQorCWlmICghX19j
bWRsaW5lX2J1aWxkKGRzdCwgc3JjKSkKKwkJcHJfd2FybigiQ29tbWFuZCBsaW5lIGlzIHRvbyBs
b25nLCBpdCBoYXMgYmVlbiB0cnVuY2F0ZWRcbiIpOworCisJaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfRk9SQ0UpKQorCQlwcl9pbmZvKCJGb3JjaW5nIGtlcm5lbCBjb21tYW5kIGxpbmUg
dG86ICVzXG4iLCBkc3QpOworfQorCisjZW5kaWYgLyogX0xJTlVYX0NNRExJTkVfSCAqLwotLSAK
Mi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86A40353248
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1B9EB20BE0;
	Sat,  3 Apr 2021 06:18:52 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5C84821300
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:09 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFp6jM7z9v2m7;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Rp6dCVo7JWFW; Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFp5qTGz9v2ls;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E5668BB7D;
 Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gXDC2XbWW9k9; Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3C0D8BB7C;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 960AD67989; Fri,  2 Apr 2021 15:18:07 +0000 (UTC)
Message-Id: <03c0b931557967876abcebc7d0e3c6537eb6ab89.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:07 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 06/20] powerpc: convert strcpy to strlcpy in
 prom_init
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

RnJvbTogRGFuaWVsIFdhbGtlciA8ZGFuaWVsd2FAY2lzY28uY29tPgoKVGhlcmUncyBvbmx5IHR3
byB1c2VycyBvZiBzdHJjcHkgYW5kIG9uZSBpcyB0aGUgY29tbWFuZApsaW5lIGhhbmRsaW5nLiBU
aGUgZ2VuZXJpYyBjb21tYW5kIGxpbmUgaGFuZGxpbmcgdXNlcyBzdHJsY3B5CmFuZCBpdCBtYWtl
cyBzZW5zZSB0byBjb252ZXJ0IHRoaXMgb25lIG90aGVyIHVzZXIgdG8gc3RybGNweSB0bwprZWVw
IHByb21faW5pdCBzaXplIGNvbnNpc3RlbnQuCgpDYzogeGUtbGludXgtZXh0ZXJuYWxAY2lzY28u
Y29tClNpZ25lZC1vZmYtYnk6IERhbmllbCBXYWxrZXIgPGRhbmllbHdhQGNpc2NvLmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
PgotLS0KIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMgfCAyNSArKysrKysrKysrKysr
KystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMKaW5kZXggNDFlZDdlMzNkODk3Li4zMzMxNmVl
NTUyNjUgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMKKysrIGIv
YXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYwpAQCAtMjQyLDE1ICsyNDIsNiBAQCBzdGF0
aWMgaW50IF9faW5pdCBwcm9tX3N0cmNtcChjb25zdCBjaGFyICpjcywgY29uc3QgY2hhciAqY3Qp
CiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBjaGFyIF9faW5pdCAqcHJvbV9zdHJjcHkoY2hhciAq
ZGVzdCwgY29uc3QgY2hhciAqc3JjKQotewotCWNoYXIgKnRtcCA9IGRlc3Q7Ci0KLQl3aGlsZSAo
KCpkZXN0KysgPSAqc3JjKyspICE9ICdcMCcpCi0JCS8qIG5vdGhpbmcgKi87Ci0JcmV0dXJuIHRt
cDsKLX0KLQogc3RhdGljIGludCBfX2luaXQgcHJvbV9zdHJuY21wKGNvbnN0IGNoYXIgKmNzLCBj
b25zdCBjaGFyICpjdCwgc2l6ZV90IGNvdW50KQogewogCXVuc2lnbmVkIGNoYXIgYzEsIGMyOwpA
QCAtMjc2LDYgKzI2NywyMCBAQCBzdGF0aWMgc2l6ZV90IF9faW5pdCBwcm9tX3N0cmxlbihjb25z
dCBjaGFyICpzKQogCXJldHVybiBzYyAtIHM7CiB9CiAKK3N0YXRpYyBzaXplX3QgX19pbml0IHBy
b21fc3RybGNweShjaGFyICpkZXN0LCBjb25zdCBjaGFyICpzcmMsIHNpemVfdCBzaXplKQorewor
CXNpemVfdCByZXQgPSBwcm9tX3N0cmxlbihzcmMpOworCisJaWYgKHNpemUpIHsKKwkJc2l6ZV90
IGxlbiA9IChyZXQgPj0gc2l6ZSkgPyBzaXplIC0gMSA6IHJldDsKKworCQltZW1jcHkoZGVzdCwg
c3JjLCBsZW4pOworCQlkZXN0W2xlbl0gPSAnXDAnOworCX0KKwlyZXR1cm4gcmV0OworfQorCisK
IHN0YXRpYyBpbnQgX19pbml0IHByb21fbWVtY21wKGNvbnN0IHZvaWQgKmNzLCBjb25zdCB2b2lk
ICpjdCwgc2l6ZV90IGNvdW50KQogewogCWNvbnN0IHVuc2lnbmVkIGNoYXIgKnN1MSwgKnN1MjsK
QEAgLTI3MDIsNyArMjcwNyw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmbGF0dGVuX2RldmljZV90
cmVlKHZvaWQpCiAKIAkvKiBBZGQgInBoYW5kbGUiIGluIHRoZXJlLCB3ZSdsbCBuZWVkIGl0ICov
CiAJbmFtZXAgPSBtYWtlX3Jvb20oJm1lbV9zdGFydCwgJm1lbV9lbmQsIDE2LCAxKTsKLQlwcm9t
X3N0cmNweShuYW1lcCwgInBoYW5kbGUiKTsKKwlwcm9tX3N0cmxjcHkobmFtZXAsICJwaGFuZGxl
IiwgOCk7CiAJbWVtX3N0YXJ0ID0gKHVuc2lnbmVkIGxvbmcpbmFtZXAgKyBwcm9tX3N0cmxlbihu
YW1lcCkgKyAxOwogCiAJLyogQnVpbGQgc3RyaW5nIGFycmF5ICovCi0tIAoyLjI1LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

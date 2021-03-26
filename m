Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE2C34B0CE
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F2335212D7;
	Fri, 26 Mar 2021 21:51:58 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 4DA7821098
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:50 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWN2bwmz9tyyY;
 Fri, 26 Mar 2021 14:44:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WXR477eJDIpw; Fri, 26 Mar 2021 14:44:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWN1k0Gz9tyyV;
 Fri, 26 Mar 2021 14:44:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 196218B8C9;
 Fri, 26 Mar 2021 14:44:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id um4ZFYXC0Irt; Fri, 26 Mar 2021 14:44:49 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD9DC8B8C7;
 Fri, 26 Mar 2021 14:44:48 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5A96B67611; Fri, 26 Mar 2021 13:44:49 +0000 (UTC)
Message-Id: <f57bc57d4032a1893b22c39adcd671297610b31c.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:49 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 02/17] drivers: of: use cmdline building
 function
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
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBwYXRjaCB1c2VzIHRoZSBuZXcgY21kbGluZSBidWlsZGluZyBmdW5jdGlvbiB0bwpjb25j
YXRlbmF0ZSB0aGUgb2YgcHJvdmlkZWQgY21kbGluZSB3aXRoIGJ1aWx0LWluIHBhcnRzCmJhc2Vk
IG9uIGNvbXBpbGUtdGltZSBvcHRpb25zLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgotLS0KIGRyaXZlcnMvb2YvZmR0LmMgfCAy
MyArKysrLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9mZHQuYyBiL2RyaXZl
cnMvb2YvZmR0LmMKaW5kZXggZGNjMWRkOTY5MTFhLi5jZjJiOTViOGYyOTggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvb2YvZmR0LmMKKysrIGIvZHJpdmVycy9vZi9mZHQuYwpAQCAtMjUsNiArMjUsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF9jb3JlLmg+CiAjaW5jbHVkZSA8bGludXgvc3lzZnMu
aD4KICNpbmNsdWRlIDxsaW51eC9yYW5kb20uaD4KKyNpbmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+
CiAKICNpbmNsdWRlIDxhc20vc2V0dXAuaD4gIC8qIGZvciBDT01NQU5EX0xJTkVfU0laRSAqLwog
I2luY2x1ZGUgPGFzbS9wYWdlLmg+CkBAIC0xMDUwLDI2ICsxMDUxLDEwIEBAIGludCBfX2luaXQg
ZWFybHlfaW5pdF9kdF9zY2FuX2Nob3Nlbih1bnNpZ25lZCBsb25nIG5vZGUsIGNvbnN0IGNoYXIg
KnVuYW1lLAogCiAJLyogUmV0cmlldmUgY29tbWFuZCBsaW5lICovCiAJcCA9IG9mX2dldF9mbGF0
X2R0X3Byb3Aobm9kZSwgImJvb3RhcmdzIiwgJmwpOwotCWlmIChwICE9IE5VTEwgJiYgbCA+IDAp
Ci0JCXN0cmxjcHkoZGF0YSwgcCwgbWluKGwsIENPTU1BTkRfTElORV9TSVpFKSk7CisJaWYgKGwg
PD0gMCkKKwkJcCA9IE5VTEw7CiAKLQkvKgotCSAqIENPTkZJR19DTURMSU5FIGlzIG1lYW50IHRv
IGJlIGEgZGVmYXVsdCBpbiBjYXNlIG5vdGhpbmcgZWxzZQotCSAqIG1hbmFnZWQgdG8gc2V0IHRo
ZSBjb21tYW5kIGxpbmUsIHVubGVzcyBDT05GSUdfQ01ETElORV9GT1JDRQotCSAqIGlzIHNldCBp
biB3aGljaCBjYXNlIHdlIG92ZXJyaWRlIHdoYXRldmVyIHdhcyBmb3VuZCBlYXJsaWVyLgotCSAq
LwotI2lmZGVmIENPTkZJR19DTURMSU5FCi0jaWYgZGVmaW5lZChDT05GSUdfQ01ETElORV9FWFRF
TkQpCi0Jc3RybGNhdChkYXRhLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsKLQlzdHJsY2F0KGRh
dGEsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVfU0laRSk7Ci0jZWxpZiBkZWZpbmVkKENP
TkZJR19DTURMSU5FX0ZPUkNFKQotCXN0cmxjcHkoZGF0YSwgQ09ORklHX0NNRExJTkUsIENPTU1B
TkRfTElORV9TSVpFKTsKLSNlbHNlCi0JLyogTm8gYXJndW1lbnRzIGZyb20gYm9vdCBsb2FkZXIs
IHVzZSBrZXJuZWwncyAgY21kbCovCi0JaWYgKCEoKGNoYXIgKilkYXRhKVswXSkKLQkJc3RybGNw
eShkYXRhLCBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwotI2VuZGlmCi0jZW5k
aWYgLyogQ09ORklHX0NNRExJTkUgKi8KKwljbWRsaW5lX2J1aWxkKGRhdGEsIHAsIENPTU1BTkRf
TElORV9TSVpFKTsKIAogCXByX2RlYnVnKCJDb21tYW5kIGxpbmUgaXM6ICVzXG4iLCAoY2hhciAq
KWRhdGEpOwogCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4CB34B0CD
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 99043212CD;
	Fri, 26 Mar 2021 21:51:58 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 78EF220A71
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:49 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWM2kR9z9tyyX;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WniDc8Yabw7u; Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWM1m9wz9tyyV;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 18F9E8B8C9;
 Fri, 26 Mar 2021 14:44:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BZpKcB1zy9W0; Fri, 26 Mar 2021 14:44:48 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3A018B8C7;
 Fri, 26 Mar 2021 14:44:47 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4859067611; Fri, 26 Mar 2021 13:44:48 +0000 (UTC)
Message-Id: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:48 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 01/17] cmdline: Add generic function to build
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
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
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
bGwKLSBBZGRlZCBjYXBhYmlsaXR5IHRvIGhhdmUgc3JjID09IGRzdAotLS0KIGluY2x1ZGUvbGlu
dXgvY21kbGluZS5oIHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9saW51eC9jbWRsaW5lLmgKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NtZGxp
bmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCi0tLSAvZGV2L251bGwKKysrIGIvaW5jbHVkZS9s
aW51eC9jbWRsaW5lLmgKQEAgLTAsMCArMSw1NyBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAgKi8KKyNpZm5kZWYgX0xJTlVYX0NNRExJTkVfSAorI2RlZmluZSBfTElOVVhf
Q01ETElORV9ICisKKyNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KKworLyogQWxsb3cgYXJjaGl0
ZWN0dXJlcyB0byBvdmVycmlkZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNv
IGVhcmx5ICovCisjaWZuZGVmIGNtZGxpbmVfc3RybGNhdAorI2RlZmluZSBjbWRsaW5lX3N0cmxj
YXQgc3RybGNhdAorI2VuZGlmCisKKy8qCisgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9y
IHByZXBlbmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAorICogbGluZSBw
cm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2VkIHRv
IGFsdGVyCisgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNvbW1hbmQgbGluZS4KKyAq
IEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJlcGVuZGVkIHN0
cmluZy4KKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBpZiB0aGVyZSBpc24n
dCBvbmUuCisgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRlc3QgYnVmZmVyLgorICovCitzdGF0aWMg
X19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxkKGNoYXIgKmRzdCwgY29uc3QgY2hh
ciAqc3JjLCBzaXplX3QgbGVuKQoreworCWlmICghbGVuIHx8IHNyYyA9PSBkc3QpCisJCXJldHVy
bjsKKworCWlmIChJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSB8fCAhc3JjKSB7CisJ
CWRzdFswXSA9IDA7CisJCWNtZGxpbmVfc3RybGNhdChkc3QsIENPTkZJR19DTURMSU5FLCBsZW4p
OworCQlyZXR1cm47CisJfQorCisJaWYgKGRzdCAhPSBzcmMpCisJCWRzdFswXSA9IDA7CisKKwlp
ZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9QUkVQRU5EKSkKKwkJY21kbGluZV9zdHJsY2F0
KGRzdCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4pOworCisJY21kbGluZV9zdHJsY2F0KGRzdCwg
c3JjLCBsZW4pOworCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfRVhURU5EKSkKKwkJ
Y21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOworfQorCisjZGVm
aW5lIGNtZGxpbmVfYnVpbGQoZHN0LCBzcmMsIGxlbikgZG8gewkJCQlcCisJY2hhciAqX19jX2Rz
dCA9IChkc3QpOwkJCQkJCVwKKwljb25zdCBjaGFyICpfX2Nfc3JjID0gKHNyYyk7CQkJCQlcCisJ
CQkJCQkJCQlcCisJaWYgKF9fY19zcmMgPT0gX19jX2RzdCkgewkJCQkJXAorCQlzdGF0aWMgY2hh
ciBfX2NfdG1wW0NPTU1BTkRfTElORV9TSVpFXSBfX2luaXRkYXRhID0gIiI7CVwKKwkJCQkJCQkJ
CVwKKwkJY21kbGluZV9zdHJsY2F0KF9fY190bXAsIF9fY19zcmMsIENPTU1BTkRfTElORV9TSVpF
KTsJXAorCQlfX2NtZGxpbmVfYnVpbGQoX19jX2RzdCwgX19jX3RtcCwgKGxlbikpOwkJXAorCX0g
ZWxzZSB7CQkJCQkJCVwKKwkJX19jbWRsaW5lX2J1aWxkKF9fY19kc3QsIF9fY19zcmMsIChsZW4p
KTsJCVwKKwl9CQkJCQkJCQlcCit9IHdoaWxlICgwKQorCisjZW5kaWYgLyogX0xJTlVYX0NNRExJ
TkVfSCAqLwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

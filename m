Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB053353D5F
	for <lists+openrisc@lfdr.de>; Mon,  5 Apr 2021 11:58:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 173902074A;
	Mon,  5 Apr 2021 11:58:27 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5CC1E21081
 for <openrisc@lists.librecores.org>; Sun,  4 Apr 2021 19:20:49 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FD0tP1t4vz9tymG;
 Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ffq992l6CBkv; Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FD0tP0d2fz9tymF;
 Sun,  4 Apr 2021 19:20:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F2F08B78E;
 Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b-KtXSnASDF0; Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4454D8B76A;
 Sun,  4 Apr 2021 19:20:48 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 06D3A67685; Sun,  4 Apr 2021 17:20:48 +0000 (UTC)
Message-Id: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Sun,  4 Apr 2021 17:20:48 +0000 (UTC)
X-Mailman-Approved-At: Mon, 05 Apr 2021 11:58:24 +0200
Subject: [OpenRISC] [RFC PATCH v6 1/1] cmdline: Add capability to both
 append and prepend at the same time
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

T25lIHVzZXIgaGFzIGV4cHJlc3NlZCB0aGUgbmVlZCB0byBib3RoIGFwcGVuZCBhbmQgcHJlcGVu
ZCBzb21lCmJ1aWx0LWluIHBhcmFtZXRlcnMgdG8gdGhlIGNvbW1hbmQgbGluZSBwcm92aWRlZCBi
eSB0aGUgYm9vdGxvYWRlci4KCkFsbHRob3VnaCBpdCBpcyBhIGNvcm5lciBjYXNlLCBpdCBpcyBl
YXN5IHRvIGltcGxlbWVudCBzbyBsZXQncyBkbyBpdC4KCldoZW4gdGhlIHVzZXIgY2hvb3NlcyB0
byBwcmVwZW5kIHRoZSBib290bG9hZGVyIHByb3ZpZGVkIGNvbW1hbmQgbGluZQp3aXRoIHRoZSBi
dWlsdC1pbiBjb21tYW5kIGxpbmUsIGhlIGlzIG9mZmVyZWQgdGhlIHBvc3NpYmlsaXR5IHRvIGVu
dGVyCmFuIGFkZGl0aW9ubmFsIGJ1aWx0LWluIGNvbW1hbmQgbGluZSB0byBiZSBhcHBlbmRlZCBh
ZnRlciB0aGUKYm9vdGxvYWRlciBwcm92aWRlZCBjb21tYW5kIGxpbmUuCgpJdCBpcyBhIGNvbXBs
ZW1lbnRhcnkgZmVhdHVyZSB3aGljaCBoYXMgbm8gaW1wYWN0IG9uIHRoZSBhbHJlYWR5CmV4aXN0
aW5nIG9uZXMgYW5kL29yIHRoZSBleGlzdGluZyBkZWZjb25maWcuCgpTdWdnZXN0ZWQtYnk6IERh
bmllbCBXYWxrZXIgPGRhbmllbHdhQGNpc2NvLmNvbT4KU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgotLS0KU2VuZGluZyB0aGlzIG91
dCBhcyBhbiBSRkMsIGFwcGxpZXMgb24gdG9wIG9mIHRoZSBzZXJpZXMKKCJJbXBsZW1lbnQgR0VO
RVJJQ19DTURMSU5FIikuIEkgd2lsbCBhZGQgaXQgdG8gdGhlIHNlcmllcyBuZXh0IHNwaW4KdW5s
ZXNzIHNvbWVvbmUgaXMgYWdhaW5zdCBpdC4KLS0tCiBpbmNsdWRlL2xpbnV4L2NtZGxpbmUuaCB8
ICAzICsrKwogaW5pdC9LY29uZmlnICAgICAgICAgICAgfCAxMiArKysrKysrKysrKy0KIDIgZmls
ZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvY21kbGluZS5oIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKaW5kZXgg
MDIwMDI4ZTJiZGYwLi5mYjI3NGE0ZDU1MTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvY21k
bGluZS5oCisrKyBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCkBAIC0zNiw2ICszNiw5IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBfX2NtZGxpbmVfYnVpbGQoY2hhciAqZHN0LCBjb25z
dCBjaGFyICpzcmMpCiAKIAlsZW4gPSBjbWRsaW5lX3N0cmxjYXQoZHN0LCBzcmMsIENPTU1BTkRf
TElORV9TSVpFKTsKIAorCWlmIChJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX1BSRVBFTkQpKQor
CQlsZW4gPSBjbWRsaW5lX3N0cmxjYXQoZHN0LCAiICIgQ09ORklHX0NNRExJTkVfTU9SRSwgQ09N
TUFORF9MSU5FX1NJWkUpOworCiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5E
KSkKIAkJbGVuID0gY21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBDT01N
QU5EX0xJTkVfU0laRSk7CiAKZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZpZyBiL2luaXQvS2NvbmZp
ZwppbmRleCBmYTAwMmUzNzY1YWIuLmNkMzA4N2ZmNGYyOCAxMDA2NDQKLS0tIGEvaW5pdC9LY29u
ZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtMTI4LDYgKzEyOCwxNCBAQCBjb25maWcgQ01ETElO
RQogCSAgSWYgdGhpcyBzdHJpbmcgaXMgbm90IGVtcHR5LCBhZGRpdGlvbmFsIGNob2ljZXMgYXJl
IHByb3Bvc2VkCiAJICBiZWxvdyB0byBkZXRlcm1pbmUgaG93IGl0IHdpbGwgYmUgdXNlZCBieSB0
aGUga2VybmVsLgogCitjb25maWcgQ01ETElORV9NT1JFCisJc3RyaW5nICJBZGRpdGlvbmFsIGRl
ZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIiBpZiBHRU5FUklDX0NNRExJTkUgJiYgQ01ETElO
RV9QUkVQRU5ECisJZGVmYXVsdCAiIgorCWhlbHAKKwkgIERlZmluZXMgYW4gYWRkaXRpb25hbCBk
ZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZy4KKwkgIElmIHRoaXMgc3RyaW5nIGlzIG5vdCBl
bXB0eSwgaXQgaXMgYXBwZW5kZWQgdG8gdGhlCisJICBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHBy
b3ZpZGVkIGJ5IHRoZSBib290bG9hZGVyCisKIGNob2ljZQogCXByb21wdCAiS2VybmVsIGNvbW1h
bmQgbGluZSB0eXBlIiBpZiBDTURMSU5FICE9ICIiCiAJZGVmYXVsdCBDTURMSU5FX1BSRVBFTkQg
aWYgQVJDSF9XQU5UX0NNRExJTkVfUFJFUEVORF9CWV9ERUZBVUxUCkBAIC0xNTQsNyArMTYyLDkg
QEAgY29uZmlnIENNRExJTkVfUFJFUEVORAogCWJvb2wgIlByZXBlbmQgdG8gdGhlIGJvb3Rsb2Fk
ZXIga2VybmVsIGFyZ3VtZW50cyIKIAloZWxwCiAJICBUaGUgZGVmYXVsdCBrZXJuZWwgY29tbWFu
ZCBzdHJpbmcgd2lsbCBiZSBwcmVwZW5kZWQgdG8gdGhlCi0JICBjb21tYW5kLWxpbmUgYXJndW1l
bnRzIHByb3ZpZGVkIGJ5IHRoZSBib290bG9hZGVyLgorCSAgY29tbWFuZC1saW5lIGFyZ3VtZW50
cyBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gV2hlbiB0aGlzCisJICBvcHRpb24gaXMgc2Vs
ZWN0ZWQsIGFub3RoZXIgc3RyaW5nIGNhbiBiZSBhZGRlZCB3aGljaCB3aWxsCisJICBiZSBhcHBl
bmRlZC4KIAogY29uZmlnIENNRExJTkVfRk9SQ0UKIAlib29sICJBbHdheXMgdXNlIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

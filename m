Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E537A34B0CF
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6F1A4212A3;
	Fri, 26 Mar 2021 21:51:59 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 605E02114B
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:51 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWP3Wqyz9tyyc;
 Fri, 26 Mar 2021 14:44:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Lp2krAbalVCe; Fri, 26 Mar 2021 14:44:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWP2b22z9tyyV;
 Fri, 26 Mar 2021 14:44:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36CBD8B8C9;
 Fri, 26 Mar 2021 14:44:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IrDQLeKa7pLW; Fri, 26 Mar 2021 14:44:50 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D731D8B8C7;
 Fri, 26 Mar 2021 14:44:49 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 61C2067611; Fri, 26 Mar 2021 13:44:50 +0000 (UTC)
Message-Id: <76f43e108bda39dd374928d6d8b86038cc205e74.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:50 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 03/17] cmdline: Gives architectures
 opportunity to use generically defined boot cmdline manipulation
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

TW9zdCBhcmNoaXRlY3R1cmVzIGhhdmUgc2ltaWxhciBib290IGNvbW1hbmQgbGluZSBtYW5pcHVs
YXRpb24Kb3B0aW9ucy4gVGhpcyBwYXRjaHMgYWRkcyB0aGUgZGVmaW5pdGlvbiBpbiBpbml0L0tj
b25maWcsIGdhdGVkIGJ5CkNPTkZJR19IQVZFX0NNRExJTkUgdGhhdCB0aGUgYXJjaGl0ZWN0dXJl
cyBjYW4gc2VsZWN0IHRvIHVzZSB0aGVtLgoKQ09ORklHX0NNRExJTkVfRVhURU5EIGlzIHVuZGVy
c3Rvb2QgZGlmZmVyZW50bHkgYnkgYXJjaGl0ZWN0dXJlcy4KRm9yIHNvbWUgb2YgdGhlbSBpdCBh
cHBlbmRzIGJ1aWx0LWluIENNRExJTkUgdG8gYm9vdGxvYWRlciBwcm92aWRlZApsaW5lLiBGb3Ig
b3RoZXJzIGl0IGFwcGVuZHMgdGhlIGJvb3Rsb2FkZXIgcHJvdmlkZWQgQ01ETElORSB0byB0aGUK
YnVpbHQtaW4gb25lLgpUbyBhdm9pZCBjb25mdXNpb24sIHRoaXMgY29tbWl0IGJyaW5ncyB0byBk
aWZmZXJlbnQgb3B0aW9uczoKLSBDT05GSUdfQ01ETElORV9BUFBFTkQgdG8gYXBwZW5kIHRoZSBi
dWlsdC1pbiBDTURMSU5FIHRvIHRoZQpib290bG9hZGVyIGxpbmUuCi0gQ09ORklHX0NNRExJTkVf
UFJFUEVORCB0byBwcmVwZW5kIHRoZSBidWlsdC1pbiBDTURMSU5FIGluIGZyb250IG9mCnRoZSBi
b290bG9hZGVyIGxpbmUuCgpGb3IgY29tcGF0aWJpbGl0eSB3aXRoIGV4aXN0aW5nIGFyY2hpdGVj
dHVyZSB3aGljaCB1c2VzIENPTkZJR19PRiwgYXMKT0YgaGFzIGFscmVhZHkgYmVlbiBjb252ZXJ0
ZWQgdG8gZ2VuZXJpYyBjbWRsaW5lLCB3ZSBrZWVwCkNPTkZJR19DTURMSU5FX0VYVEVORCBhcyBh
IHN5bm9ueW0gdG8gQ09ORklHX0NNRExJTkVfQVBQRU5EIHVudGlsCmFybSwgcG93ZXJwYywgcmlz
Y3YgYW5kIHNoIGFyY2hpdGVjdHVyZXMgaGF2ZSBiZWVuIGNvbnZlcnRlZC4KCkEgZmV3IGRpZmZl
cmVuY2VzIGFyZSBpZGVudGlmaWVkIGFuZCB3aWxsIGhhdmUgdG8gYmUgdGFrZW4KaW50byBhY2Nv
dW50IHdoZW4gY29udmVydGluZyB0aGUgYXJjaGl0ZWN0dXJlIHRvIGdlbmVyaWMgY21kbGluZToK
LSByaXNjdiBoYXMgQ01ETElORV9GQUxMQkFDSyBpbnN0ZWFkIG9mIENNRExJTkVfRlJPTV9CT09U
TE9BREVSCi0gU29tZSBhcmNoaXRlY3R1cmVzIGFyZSB1c2luZyBDT05GSUdfQ01ETElORV9PVkVS
UklERSBvcgpDT05GSUdfQ01ETElORV9PVkVSV1JJVEUgaW5zdGVhZCBvZiBDT05GSUdfQ01ETElO
RV9GT1JDRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4KLS0tCnYzOgotIENvbW1lbnRzIGZyb20gV2lsbC4KLSBSZW1vdmUgQ09O
RklHX0NNRExJTkVfQk9PTC4gVXNpbmcgQ09ORklHX0NNRExJTkUgIT0gIiIgaW5zdGVhZCwgbGlr
ZSBhcm0gYW5kIHBvd2VycGMuCi0gQ2hhbmdlZCBFWFRFTkQgdG8gQVBQRU5ELiBLZWVwIEVYVEVO
RCBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KLS0tCiBpbmNsdWRlL2xpbnV4L2NtZGxpbmUu
aCB8ICAyICstCiBpbml0L0tjb25maWcgICAgICAgICAgICB8IDUyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaCBi
L2luY2x1ZGUvbGludXgvY21kbGluZS5oCmluZGV4IGRlYTg3ZWRkNDFiZS4uMzgzMDZjMTA5MDQx
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAorKysgYi9pbmNsdWRlL2xpbnV4
L2NtZGxpbmUuaApAQCAtMzYsNyArMzYsNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQg
X19jbWRsaW5lX2J1aWxkKGNoYXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3QgbAogCiAJ
Y21kbGluZV9zdHJsY2F0KGRzdCwgc3JjLCBsZW4pOwogCi0JaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfRVhURU5EKSkKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQp
IHx8IElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5EKSkKIAkJY21kbGluZV9zdHJsY2F0
KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOwogfQogCmRpZmYgLS1naXQgYS9pbml0L0tj
b25maWcgYi9pbml0L0tjb25maWcKaW5kZXggNWY1Yzc3NmVmMTkyLi5hZjBkODQ2NjJjYzIgMTAw
NjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAgLTExNyw2ICsxMTcs
NTggQEAgY29uZmlnIElOSVRfRU5WX0FSR19MSU1JVAogCSAgTWF4aW11bSBvZiBlYWNoIG9mIHRo
ZSBudW1iZXIgb2YgYXJndW1lbnRzIGFuZCBlbnZpcm9ubWVudAogCSAgdmFyaWFibGVzIHBhc3Nl
ZCB0byBpbml0IGZyb20gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUuCiAKK2NvbmZpZyBHRU5FUklD
X0NNRExJTkUKKwlib29sCisKK2NvbmZpZyBDTURMSU5FCisJc3RyaW5nICJEZWZhdWx0IGtlcm5l
bCBjb21tYW5kIHN0cmluZyIgaWYgR0VORVJJQ19DTURMSU5FCisJZGVmYXVsdCAiIgorCWhlbHAK
KwkgIERlZmluZXMgYSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZy4KKwkgIElmIHRoaXMg
c3RyaW5nIGlzIG5vdCBlbXB0eSwgYWRkaXRpb25hbCBjaG9pY2VzIGFyZSBwcm9wb3NlZAorCSAg
YmVsb3cgdG8gZGV0ZXJtaW5lIGhvdyBpdCB3aWxsIGJlIHVzZWQgYnkgdGhlIGtlcm5lbC4KKwor
Y2hvaWNlCisJcHJvbXB0ICJLZXJuZWwgY29tbWFuZCBsaW5lIHR5cGUiIGlmIENNRExJTkUgIT0g
IiIKKwlkZWZhdWx0IENNRExJTkVfUFJFUEVORCBpZiBBUkNIX1dBTlRfQ01ETElORV9QUkVQRU5E
X0JZX0RFRkFVTFQKKwlkZWZhdWx0IENNRExJTkVfRlJPTV9CT09UTE9BREVSCisJZGVwZW5kcyBv
biBHRU5FUklDX0NNRExJTkUKKwloZWxwCisJICBEZXRlcm1pbmUgaG93IHRoZSBkZWZhdWx0IGtl
cm5lbCBhcmd1bWVudHMgYXJlIGNvbWJpbmVkIHdpdGggYW55CisJICBhcmd1bWVudHMgcGFzc2Vk
IGJ5IHRoZSBib290bG9hZGVyIGlmIGFueS4KKworY29uZmlnIENNRExJTkVfRlJPTV9CT09UTE9B
REVSCisJYm9vbCAiVXNlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFpbGFibGUi
CisJaGVscAorCSAgVXNlcyB0aGUgY29tbWFuZC1saW5lIG9wdGlvbnMgcGFzc2VkIGJ5IHRoZSBi
b290IGxvYWRlci4gSWYKKwkgIHRoZSBib290IGxvYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0
aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZAorCSAgc3RyaW5nIHByb3ZpZGVkIGluIENNRExJTkUg
d2lsbCBiZSB1c2VkLgorCitjb25maWcgQ01ETElORV9BUFBFTkQKKwlib29sICJBcHBlbmQgdG8g
dGhlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKKwloZWxwCisJICBUaGUgZGVmYXVsdCBr
ZXJuZWwgY29tbWFuZCBzdHJpbmcgd2lsbCBiZSBhcHBlbmRlZCB0byB0aGUKKwkgIGNvbW1hbmQt
bGluZSBhcmd1bWVudHMgcHJvdmlkZWQgYnkgdGhlIGJvb3Rsb2FkZXIuCisKK2NvbmZpZyBDTURM
SU5FX1BSRVBFTkQKKwlib29sICJQcmVwZW5kIHRvIHRoZSBib290bG9hZGVyIGtlcm5lbCBhcmd1
bWVudHMiCisJaGVscAorCSAgVGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIHdpbGwg
YmUgcHJlcGVuZGVkIHRvIHRoZQorCSAgY29tbWFuZC1saW5lIGFyZ3VtZW50cyBwcm92aWRlZCBi
eSB0aGUgYm9vdGxvYWRlci4KKworY29uZmlnIENNRExJTkVfRk9SQ0UKKwlib29sICJBbHdheXMg
dXNlIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyIKKwloZWxwCisJICBBbHdheXMg
dXNlIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZywgaWdub3JpbmcgYW55CisJICBh
cmd1bWVudHMgcHJvdmlkZWQgYnkgdGhlIGJvb3Rsb2FkZXIuCitlbmRjaG9pY2UKKworY29uZmln
IENNRExJTkVfRVhURU5ECisJYm9vbAorCWRlZmF1bHQgQ01ETElORV9BUFBFTkQKKwloZWxwCisJ
ICBUbyBiZSByZW1vdmVkIG9uY2UgYWxsIGFyY2hpdGVjdHVyZXMgYXJlIGNvbnZlcnRlZCB0byBn
ZW5lcmljIENNRExJTkUKKwogY29uZmlnIENPTVBJTEVfVEVTVAogCWJvb2wgIkNvbXBpbGUgYWxz
byBkcml2ZXJzIHdoaWNoIHdpbGwgbm90IGxvYWQiCiAJZGVwZW5kcyBvbiBIQVNfSU9NRU0KLS0g
CjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

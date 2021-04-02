Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFC3353247
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 026982074A;
	Sat,  3 Apr 2021 06:18:50 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id D853E212F4
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFn3JGVz9v2m6;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VqEXDMYbbW_D; Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFn2H9Mz9v2ls;
 Fri,  2 Apr 2021 17:18:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 327708BB7B;
 Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RgJz95waFuwr; Fri,  2 Apr 2021 17:18:07 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB1658BB79;
 Fri,  2 Apr 2021 17:18:06 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8EFAC67989; Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
Message-Id: <9cf63d0419bb51d91c5b1c83ce250dff1e7107cc.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:06 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 05/20] cmdline: Gives architectures
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
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
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
RCBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4KCnY0OgotIEFkZGVkIENNRExJTkVfUFJFUEVO
RCBhcyBhIGRlcGVuZGVuY3kgZm9yIElOSVRSQU1GU19GT1JDRQotIFJlbW92ZWQgdGhlIEVYVEVO
RCB8fCBBUFBFTkQgaW4gY21kbGluZS5oLCBrZWVwIEVYVEVORCBhcyBpdAogICB3aWxsIGFsd2F5
cyBleGl0IGFuZCBzd2l0Y2ggdG8gQVBQRU5EIGluIGxhc3QgcGF0Y2guCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Ci0tLQogaW5p
dC9LY29uZmlnIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogdXNyL0tjb25maWcgIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZpZyBiL2lu
aXQvS2NvbmZpZwppbmRleCA1ZjVjNzc2ZWYxOTIuLmFmMGQ4NDY2MmNjMiAxMDA2NDQKLS0tIGEv
aW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtMTE3LDYgKzExNyw1OCBAQCBjb25m
aWcgSU5JVF9FTlZfQVJHX0xJTUlUCiAJICBNYXhpbXVtIG9mIGVhY2ggb2YgdGhlIG51bWJlciBv
ZiBhcmd1bWVudHMgYW5kIGVudmlyb25tZW50CiAJICB2YXJpYWJsZXMgcGFzc2VkIHRvIGluaXQg
ZnJvbSB0aGUga2VybmVsIGNvbW1hbmQgbGluZS4KIAorY29uZmlnIEdFTkVSSUNfQ01ETElORQor
CWJvb2wKKworY29uZmlnIENNRExJTkUKKwlzdHJpbmcgIkRlZmF1bHQga2VybmVsIGNvbW1hbmQg
c3RyaW5nIiBpZiBHRU5FUklDX0NNRExJTkUKKwlkZWZhdWx0ICIiCisJaGVscAorCSAgRGVmaW5l
cyBhIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLgorCSAgSWYgdGhpcyBzdHJpbmcgaXMg
bm90IGVtcHR5LCBhZGRpdGlvbmFsIGNob2ljZXMgYXJlIHByb3Bvc2VkCisJICBiZWxvdyB0byBk
ZXRlcm1pbmUgaG93IGl0IHdpbGwgYmUgdXNlZCBieSB0aGUga2VybmVsLgorCitjaG9pY2UKKwlw
cm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAiIgorCWRlZmF1
bHQgQ01ETElORV9QUkVQRU5EIGlmIEFSQ0hfV0FOVF9DTURMSU5FX1BSRVBFTkRfQllfREVGQVVM
VAorCWRlZmF1bHQgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKKwlkZXBlbmRzIG9uIEdFTkVSSUNf
Q01ETElORQorCWhlbHAKKwkgIERldGVybWluZSBob3cgdGhlIGRlZmF1bHQga2VybmVsIGFyZ3Vt
ZW50cyBhcmUgY29tYmluZWQgd2l0aCBhbnkKKwkgIGFyZ3VtZW50cyBwYXNzZWQgYnkgdGhlIGJv
b3Rsb2FkZXIgaWYgYW55LgorCitjb25maWcgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKKwlib29s
ICJVc2UgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKKwloZWxwCisJ
ICBVc2VzIHRoZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJvb3QgbG9hZGVy
LiBJZgorCSAgdGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZhdWx0
IGtlcm5lbCBjb21tYW5kCisJICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVz
ZWQuCisKK2NvbmZpZyBDTURMSU5FX0FQUEVORAorCWJvb2wgIkFwcGVuZCB0byB0aGUgYm9vdGxv
YWRlciBrZXJuZWwgYXJndW1lbnRzIgorCWhlbHAKKwkgIFRoZSBkZWZhdWx0IGtlcm5lbCBjb21t
YW5kIHN0cmluZyB3aWxsIGJlIGFwcGVuZGVkIHRvIHRoZQorCSAgY29tbWFuZC1saW5lIGFyZ3Vt
ZW50cyBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4KKworY29uZmlnIENNRExJTkVfUFJFUEVO
RAorCWJvb2wgIlByZXBlbmQgdG8gdGhlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKKwlo
ZWxwCisJICBUaGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcgd2lsbCBiZSBwcmVwZW5k
ZWQgdG8gdGhlCisJICBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBib290
bG9hZGVyLgorCitjb25maWcgQ01ETElORV9GT1JDRQorCWJvb2wgIkFsd2F5cyB1c2UgdGhlIGRl
ZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgorCWhlbHAKKwkgIEFsd2F5cyB1c2UgdGhlIGRl
ZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nLCBpZ25vcmluZyBhbnkKKwkgIGFyZ3VtZW50cyBw
cm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4KK2VuZGNob2ljZQorCitjb25maWcgQ01ETElORV9F
WFRFTkQKKwlib29sCisJZGVmYXVsdCBDTURMSU5FX0FQUEVORAorCWhlbHAKKwkgIFRvIGJlIHJl
bW92ZWQgb25jZSBhbGwgYXJjaGl0ZWN0dXJlcyBhcmUgY29udmVydGVkIHRvIGdlbmVyaWMgQ01E
TElORQorCiBjb25maWcgQ09NUElMRV9URVNUCiAJYm9vbCAiQ29tcGlsZSBhbHNvIGRyaXZlcnMg
d2hpY2ggd2lsbCBub3QgbG9hZCIKIAlkZXBlbmRzIG9uIEhBU19JT01FTQpkaWZmIC0tZ2l0IGEv
dXNyL0tjb25maWcgYi91c3IvS2NvbmZpZwppbmRleCA4YmJjZjY5OWZlM2IuLmIzOTdlNmIxMTRk
MSAxMDA2NDQKLS0tIGEvdXNyL0tjb25maWcKKysrIGIvdXNyL0tjb25maWcKQEAgLTI0LDcgKzI0
LDcgQEAgY29uZmlnIElOSVRSQU1GU19TT1VSQ0UKIAogY29uZmlnIElOSVRSQU1GU19GT1JDRQog
CWJvb2wgIklnbm9yZSB0aGUgaW5pdHJhbWZzIHBhc3NlZCBieSB0aGUgYm9vdGxvYWRlciIKLQlk
ZXBlbmRzIG9uIENNRExJTkVfRVhURU5EIHx8IENNRExJTkVfRk9SQ0UKKwlkZXBlbmRzIG9uIENN
RExJTkVfUFJFUEVORCB8fCBDTURMSU5FX0FQUEVORCB8fCBDTURMSU5FX0ZPUkNFCiAJaGVscAog
CSAgVGhpcyBvcHRpb24gY2F1c2VzIHRoZSBrZXJuZWwgdG8gaWdub3JlIHRoZSBpbml0cmFtZnMg
aW1hZ2UKIAkgIChvciBpbml0cmQgaW1hZ2UpIHBhc3NlZCB0byBpdCBieSB0aGUgYm9vdGxvYWRl
ci4gVGhpcyBpcwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

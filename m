Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC0E34B0D6
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D5E3F211F7;
	Fri, 26 Mar 2021 21:52:08 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 7B2E12129C
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWW4kcBz9v03H;
 Fri, 26 Mar 2021 14:44:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id X6tAOk3XRuAU; Fri, 26 Mar 2021 14:44:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWW3rR4z9v03B;
 Fri, 26 Mar 2021 14:44:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 665048B8C9;
 Fri, 26 Mar 2021 14:44:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pdElShztt2nj; Fri, 26 Mar 2021 14:44:56 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0CE3F8B8C7;
 Fri, 26 Mar 2021 14:44:56 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8E34E67611; Fri, 26 Mar 2021 13:44:56 +0000 (UTC)
Message-Id: <85b1dc6339351cbc46d179e8fdb9dfc398e58303.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:56 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 09/17] nios2: Convert to GENERIC_CMDLINE
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

VGhpcyBjb252ZXJ0cyB0aGUgYXJjaGl0ZWN0dXJlIHRvIEdFTkVSSUNfQ01ETElORS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4K
LS0tCiBhcmNoL25pb3MyL0tjb25maWcgICAgICAgIHwgMjQgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiBhcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5jIHwgMTMgKysrKy0tLS0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvbmlvczIvS2NvbmZpZyBiL2FyY2gvbmlvczIvS2NvbmZpZwppbmRleCBjMjQ5NTVjODFj
OTIuLmY2NmM5N2IxNTgxMyAxMDA2NDQKLS0tIGEvYXJjaC9uaW9zMi9LY29uZmlnCisrKyBiL2Fy
Y2gvbmlvczIvS2NvbmZpZwpAQCAtOTAsMzEgKzkwLDkgQEAgY29uZmlnIE5JT1MyX0FMSUdOTUVO
VF9UUkFQCiAKIGNvbW1lbnQgIkJvb3Qgb3B0aW9ucyIKIAotY29uZmlnIENNRExJTkVfQk9PTAot
CWJvb2wgIkRlZmF1bHQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIgotCWRlZmF1bHQgeQot
Ci1jb25maWcgQ01ETElORQotCXN0cmluZyAiRGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmci
Ci0JZGVmYXVsdCAiIgotCWRlcGVuZHMgb24gQ01ETElORV9CT09MCi0JaGVscAotCSAgT24gc29t
ZSBwbGF0Zm9ybXMsIHRoZXJlIGlzIGN1cnJlbnRseSBubyB3YXkgZm9yIHRoZSBib290IGxvYWRl
ciB0bwotCSAgcGFzcyBhcmd1bWVudHMgdG8gdGhlIGtlcm5lbC4gRm9yIHRoZXNlIHBsYXRmb3Jt
cywgeW91IGNhbiBzdXBwbHkKLQkgIHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQg
dGltZSBieSBlbnRlcmluZyB0aGVtIGhlcmUuICBJbgotCSAgb3RoZXIgY2FzZXMgeW91IGNhbiBz
cGVjaWZ5IGtlcm5lbCBhcmdzIHNvIHRoYXQgeW91IGRvbid0IGhhdmUKLQkgIHRvIHNldCB0aGVt
IHVwIGluIGJvYXJkIHByb20gaW5pdGlhbGl6YXRpb24gcm91dGluZXMuCi0KLWNvbmZpZyBDTURM
SU5FX0ZPUkNFCi0JYm9vbCAiRm9yY2UgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0J
ZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKLQloZWxwCi0JICBTZXQgdGhpcyB0byBoYXZlIGFyZ3Vt
ZW50cyBmcm9tIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZwotCSAgb3ZlcnJpZGUg
dGhvc2UgcGFzc2VkIGJ5IHRoZSBib290IGxvYWRlci4KLQogY29uZmlnIE5JT1MyX0NNRExJTkVf
SUdOT1JFX0RUQgogCWJvb2wgIklnbm9yZSBrZXJuZWwgY29tbWFuZCBzdHJpbmcgZnJvbSBEVEIi
Ci0JZGVwZW5kcyBvbiBDTURMSU5FX0JPT0wKKwlkZXBlbmRzIG9uIENNRExJTkUgIT0gIiIKIAlk
ZXBlbmRzIG9uICFDTURMSU5FX0ZPUkNFCiAJZGVmYXVsdCB5CiAJaGVscApkaWZmIC0tZ2l0IGEv
YXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvbmlvczIva2VybmVsL3NldHVwLmMKaW5k
ZXggZDJmMjE5NTdlOTljLi40MjQ2NGY0NTdhNmQgMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIva2Vy
bmVsL3NldHVwLmMKKysrIGIvYXJjaC9uaW9zMi9rZXJuZWwvc2V0dXAuYwpAQCAtMjAsNiArMjAs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L2luaXRyZC5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2ZkdC5o
PgogI2luY2x1ZGUgPGxpbnV4L3NjcmVlbl9pbmZvLmg+CisjaW5jbHVkZSA8bGludXgvY21kbGlu
ZS5oPgogCiAjaW5jbHVkZSA8YXNtL21tdV9jb250ZXh0Lmg+CiAjaW5jbHVkZSA8YXNtL3NlY3Rp
b25zLmg+CkBAIC0xMDgsNyArMTA5LDcgQEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBuaW9zMl9i
b290X2luaXQodW5zaWduZWQgcjQsIHVuc2lnbmVkIHI1LCB1bnNpZ25lZCByNiwKIAkJCQkgICAg
ICAgdW5zaWduZWQgcjcpCiB7CiAJdW5zaWduZWQgZHRiX3Bhc3NlZCA9IDA7Ci0JY2hhciBjbWRs
aW5lX3Bhc3NlZFtDT01NQU5EX0xJTkVfU0laRV0gX19tYXliZV91bnVzZWQgPSB7IDAsIH07CisJ
Y2hhciBjbWRsaW5lX3Bhc3NlZFtDT01NQU5EX0xJTkVfU0laRV0gPSB7IDAsIH07CiAKICNpZiBk
ZWZpbmVkKENPTkZJR19OSU9TMl9QQVNTX0NNRExJTkUpCiAJaWYgKHI0ID09IDB4NTM0ZjQ5NGUp
IHsgLyogcjQgaXMgbWFnaWMgTklPUyAqLwpAQCAtMTI3LDE0ICsxMjgsOCBAQCBhc21saW5rYWdl
IHZvaWQgX19pbml0IG5pb3MyX2Jvb3RfaW5pdCh1bnNpZ25lZCByNCwgdW5zaWduZWQgcjUsIHVu
c2lnbmVkIHI2LAogCiAJZWFybHlfaW5pdF9kZXZ0cmVlKCh2b2lkICopZHRiX3Bhc3NlZCk7CiAK
LSNpZm5kZWYgQ09ORklHX0NNRExJTkVfRk9SQ0UKLQlpZiAoY21kbGluZV9wYXNzZWRbMF0pCi0J
CXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIGNtZGxpbmVfcGFzc2VkLCBDT01NQU5EX0xJTkVf
U0laRSk7Ci0jaWZkZWYgQ09ORklHX05JT1MyX0NNRExJTkVfSUdOT1JFX0RUQgotCWVsc2UKLQkJ
c3RybGNweShib290X2NvbW1hbmRfbGluZSwgQ09ORklHX0NNRExJTkUsIENPTU1BTkRfTElORV9T
SVpFKTsKLSNlbmRpZgotI2VuZGlmCisJaWYgKGNtZGxpbmVfcGFzc2VkWzBdIHx8IElTX0VOQUJM
RUQoQ09ORklHX05JT1MyX0NNRExJTkVfSUdOT1JFX0RUQikpCisJCWNtZGxpbmVfYnVpbGQoYm9v
dF9jb21tYW5kX2xpbmUsIGNtZGxpbmVfcGFzc2VkLCBDT01NQU5EX0xJTkVfU0laRSk7CiAKIAlw
YXJzZV9lYXJseV9wYXJhbSgpOwogfQotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DD9A6353250
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5C7D221347;
	Sat,  3 Apr 2021 06:19:02 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5D58A212C8
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFz0Y09z9v2mB;
 Fri,  2 Apr 2021 17:18:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TNsWx4HFdgfR; Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFy6Rvjz9v2ls;
 Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BA3E68BB79;
 Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kXdNH-tnbrin; Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C7018BB7C;
 Fri,  2 Apr 2021 17:18:16 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 12AC46798A; Fri,  2 Apr 2021 15:18:16 +0000 (UTC)
Message-Id: <9590d262050923a22d434358a9037131f67fcaae.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:16 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 14/20] riscv: Convert to GENERIC_CMDLINE
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
LS0tCnY0OiBSZW1vdmUgdGhlIG1lc3NhZ2Ugd2hlbiBmb3JjaW5nCi0tLQogYXJjaC9yaXNjdi9L
Y29uZmlnICAgICAgICB8IDQ0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8ICA3ICsrKy0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggODdkN2I1MmYyNzhmLi4zZGJk
NTBiZWQwMzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2
L0tjb25maWcKQEAgLTM5LDYgKzM5LDcgQEAgY29uZmlnIFJJU0NWCiAJc2VsZWN0IEVEQUNfU1VQ
UE9SVAogCXNlbGVjdCBHRU5FUklDX0FSQ0hfVE9QT0xPR1kgaWYgU01QCiAJc2VsZWN0IEdFTkVS
SUNfQVRPTUlDNjQgaWYgITY0QklUCisJc2VsZWN0IEdFTkVSSUNfQ01ETElORQogCXNlbGVjdCBH
RU5FUklDX0VBUkxZX0lPUkVNQVAKIAlzZWxlY3QgR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWYgSEFW
RV9HRU5FUklDX1ZEU08KIAlzZWxlY3QgR0VORVJJQ19JT1JFTUFQCkBAIC0zOTAsNDkgKzM5MSw2
IEBAIGVuZG1lbnUKIAogbWVudSAiQm9vdCBvcHRpb25zIgogCi1jb25maWcgQ01ETElORQotCXN0
cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKLQloZWxwCi0JICBGb3IgbW9zdCBw
bGF0Zm9ybXMsIHRoZSBhcmd1bWVudHMgZm9yIHRoZSBrZXJuZWwncyBjb21tYW5kIGxpbmUKLQkg
IGFyZSBwcm92aWRlZCBhdCBydW4tdGltZSwgZHVyaW5nIGJvb3QuIEhvd2V2ZXIsIHRoZXJlIGFy
ZSBjYXNlcwotCSAgd2hlcmUgZWl0aGVyIG5vIGFyZ3VtZW50cyBhcmUgYmVpbmcgcHJvdmlkZWQg
b3IgdGhlIHByb3ZpZGVkCi0JICBhcmd1bWVudHMgYXJlIGluc3VmZmljaWVudCBvciBldmVuIGlu
dmFsaWQuCi0KLQkgIFdoZW4gdGhhdCBvY2N1cnMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBh
IGJ1aWx0LWluIGNvbW1hbmQKLQkgIGxpbmUgaGVyZSBhbmQgY2hvb3NlIGhvdyB0aGUga2VybmVs
IHNob3VsZCB1c2UgaXQgbGF0ZXIgb24uCi0KLWNob2ljZQotCXByb21wdCAiQnVpbHQtaW4gY29t
bWFuZCBsaW5lIHVzYWdlIiBpZiBDTURMSU5FICE9ICIiCi0JZGVmYXVsdCBDTURMSU5FX0ZBTExC
QUNLCi0JaGVscAotCSAgQ2hvb3NlIGhvdyB0aGUga2VybmVsIHdpbGwgaGFuZGxlIHRoZSBwcm92
aWRlZCBidWlsdC1pbiBjb21tYW5kCi0JICBsaW5lLgotCi1jb25maWcgQ01ETElORV9GQUxMQkFD
SwotCWJvb2wgIlVzZSBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMgaWYgYXZhaWxhYmxlIgot
CWhlbHAKLQkgIFVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGFzIGZhbGxiYWNrIGluIGNh
c2Ugd2UgZ2V0IG5vdGhpbmcKLQkgIGR1cmluZyBib290LiBUaGlzIGlzIHRoZSBkZWZhdWx0IGJl
aGF2aW91ci4KLQotY29uZmlnIENNRExJTkVfRVhURU5ECi0JYm9vbCAiRXh0ZW5kIGJvb3Rsb2Fk
ZXIga2VybmVsIGFyZ3VtZW50cyIKLQloZWxwCi0JICBUaGUgY29tbWFuZC1saW5lIGFyZ3VtZW50
cyBwcm92aWRlZCBkdXJpbmcgYm9vdCB3aWxsIGJlCi0JICBhcHBlbmRlZCB0byB0aGUgYnVpbHQt
aW4gY29tbWFuZCBsaW5lLiBUaGlzIGlzIHVzZWZ1bCBpbgotCSAgY2FzZXMgd2hlcmUgdGhlIHBy
b3ZpZGVkIGFyZ3VtZW50cyBhcmUgaW5zdWZmaWNpZW50IGFuZAotCSAgeW91IGRvbid0IHdhbnQg
dG8gb3IgY2Fubm90IG1vZGlmeSB0aGVtLgotCi0KLWNvbmZpZyBDTURMSU5FX0ZPUkNFCi0JYm9v
bCAiQWx3YXlzIHVzZSB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JaGVscAot
CSAgQWx3YXlzIHVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lLCBldmVuIGlmIHdlIGdldCBv
bmUgZHVyaW5nCi0JICBib290LiBUaGlzIGlzIHVzZWZ1bCBpbiBjYXNlIHlvdSBuZWVkIHRvIG92
ZXJyaWRlIHRoZSBwcm92aWRlZAotCSAgY29tbWFuZCBsaW5lIG9uIHN5c3RlbXMgd2hlcmUgeW91
IGRvbid0IGhhdmUgb3Igd2FudCBjb250cm9sCi0JICBvdmVyIGl0LgotCi1lbmRjaG9pY2UKLQog
Y29uZmlnIEVGSV9TVFVCCiAJYm9vbAogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwppbmRleCBmOGYxNTMzMmNhYTIuLmQ0
ZjE2YTljMTc2MiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC0yMCw2ICsyMCw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvc3dpb3RsYi5oPgogI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgogI2luY2x1ZGUgPGxpbnV4L2Vm
aS5oPgorI2luY2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4KIAogI2luY2x1ZGUgPGFzbS9jcHVfb3Bz
Lmg+CiAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KQEAgLTIyOCwxMCArMjI5LDggQEAg
c3RhdGljIHZvaWQgX19pbml0IHBhcnNlX2R0Yih2b2lkKQogCX0KIAogCXByX2VycigiTm8gRFRC
IHBhc3NlZCB0byB0aGUga2VybmVsXG4iKTsKLSNpZmRlZiBDT05GSUdfQ01ETElORV9GT1JDRQot
CXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5FLCBDT01NQU5EX0xJTkVf
U0laRSk7Ci0JcHJfaW5mbygiRm9yY2luZyBrZXJuZWwgY29tbWFuZCBsaW5lIHRvOiAlc1xuIiwg
Ym9vdF9jb21tYW5kX2xpbmUpOwotI2VuZGlmCisKKwljbWRsaW5lX2J1aWxkKGJvb3RfY29tbWFu
ZF9saW5lLCBOVUxMKTsKIH0KIAogdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGlu
ZV9wKQotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

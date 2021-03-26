Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 52F3034B0D8
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CFEC8212C8;
	Fri, 26 Mar 2021 21:52:11 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 9043D211F7
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:59 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWY5C3mz9v03L;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4mW1M94fWAEi; Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWY4Gn8z9v03B;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E7728B8C7;
 Fri, 26 Mar 2021 14:44:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lzygznqtzRZ7; Fri, 26 Mar 2021 14:44:58 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C1488B8C9;
 Fri, 26 Mar 2021 14:44:58 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9B96867611; Fri, 26 Mar 2021 13:44:58 +0000 (UTC)
Message-Id: <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:58 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgIHwgNDQgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgIDUgKystLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggODdk
N2I1MmYyNzhmLi4zZGJkNTBiZWQwMzcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwor
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTM5LDYgKzM5LDcgQEAgY29uZmlnIFJJU0NWCiAJ
c2VsZWN0IEVEQUNfU1VQUE9SVAogCXNlbGVjdCBHRU5FUklDX0FSQ0hfVE9QT0xPR1kgaWYgU01Q
CiAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQgaWYgITY0QklUCisJc2VsZWN0IEdFTkVSSUNfQ01E
TElORQogCXNlbGVjdCBHRU5FUklDX0VBUkxZX0lPUkVNQVAKIAlzZWxlY3QgR0VORVJJQ19HRVRU
SU1FT0ZEQVkgaWYgSEFWRV9HRU5FUklDX1ZEU08KIAlzZWxlY3QgR0VORVJJQ19JT1JFTUFQCkBA
IC0zOTAsNDkgKzM5MSw2IEBAIGVuZG1lbnUKIAogbWVudSAiQm9vdCBvcHRpb25zIgogCi1jb25m
aWcgQ01ETElORQotCXN0cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKLQloZWxw
Ci0JICBGb3IgbW9zdCBwbGF0Zm9ybXMsIHRoZSBhcmd1bWVudHMgZm9yIHRoZSBrZXJuZWwncyBj
b21tYW5kIGxpbmUKLQkgIGFyZSBwcm92aWRlZCBhdCBydW4tdGltZSwgZHVyaW5nIGJvb3QuIEhv
d2V2ZXIsIHRoZXJlIGFyZSBjYXNlcwotCSAgd2hlcmUgZWl0aGVyIG5vIGFyZ3VtZW50cyBhcmUg
YmVpbmcgcHJvdmlkZWQgb3IgdGhlIHByb3ZpZGVkCi0JICBhcmd1bWVudHMgYXJlIGluc3VmZmlj
aWVudCBvciBldmVuIGludmFsaWQuCi0KLQkgIFdoZW4gdGhhdCBvY2N1cnMsIGl0IGlzIHBvc3Np
YmxlIHRvIGRlZmluZSBhIGJ1aWx0LWluIGNvbW1hbmQKLQkgIGxpbmUgaGVyZSBhbmQgY2hvb3Nl
IGhvdyB0aGUga2VybmVsIHNob3VsZCB1c2UgaXQgbGF0ZXIgb24uCi0KLWNob2ljZQotCXByb21w
dCAiQnVpbHQtaW4gY29tbWFuZCBsaW5lIHVzYWdlIiBpZiBDTURMSU5FICE9ICIiCi0JZGVmYXVs
dCBDTURMSU5FX0ZBTExCQUNLCi0JaGVscAotCSAgQ2hvb3NlIGhvdyB0aGUga2VybmVsIHdpbGwg
aGFuZGxlIHRoZSBwcm92aWRlZCBidWlsdC1pbiBjb21tYW5kCi0JICBsaW5lLgotCi1jb25maWcg
Q01ETElORV9GQUxMQkFDSwotCWJvb2wgIlVzZSBib290bG9hZGVyIGtlcm5lbCBhcmd1bWVudHMg
aWYgYXZhaWxhYmxlIgotCWhlbHAKLQkgIFVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lIGFz
IGZhbGxiYWNrIGluIGNhc2Ugd2UgZ2V0IG5vdGhpbmcKLQkgIGR1cmluZyBib290LiBUaGlzIGlz
IHRoZSBkZWZhdWx0IGJlaGF2aW91ci4KLQotY29uZmlnIENNRExJTkVfRVhURU5ECi0JYm9vbCAi
RXh0ZW5kIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKLQloZWxwCi0JICBUaGUgY29tbWFu
ZC1saW5lIGFyZ3VtZW50cyBwcm92aWRlZCBkdXJpbmcgYm9vdCB3aWxsIGJlCi0JICBhcHBlbmRl
ZCB0byB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lLiBUaGlzIGlzIHVzZWZ1bCBpbgotCSAgY2Fz
ZXMgd2hlcmUgdGhlIHByb3ZpZGVkIGFyZ3VtZW50cyBhcmUgaW5zdWZmaWNpZW50IGFuZAotCSAg
eW91IGRvbid0IHdhbnQgdG8gb3IgY2Fubm90IG1vZGlmeSB0aGVtLgotCi0KLWNvbmZpZyBDTURM
SU5FX0ZPUkNFCi0JYm9vbCAiQWx3YXlzIHVzZSB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBz
dHJpbmciCi0JaGVscAotCSAgQWx3YXlzIHVzZSB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lLCBl
dmVuIGlmIHdlIGdldCBvbmUgZHVyaW5nCi0JICBib290LiBUaGlzIGlzIHVzZWZ1bCBpbiBjYXNl
IHlvdSBuZWVkIHRvIG92ZXJyaWRlIHRoZSBwcm92aWRlZAotCSAgY29tbWFuZCBsaW5lIG9uIHN5
c3RlbXMgd2hlcmUgeW91IGRvbid0IGhhdmUgb3Igd2FudCBjb250cm9sCi0JICBvdmVyIGl0Lgot
Ci1lbmRjaG9pY2UKLQogY29uZmlnIEVGSV9TVFVCCiAJYm9vbAogCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwppbmRleCBm
OGYxNTMzMmNhYTIuLmU3YzkxZWU0NzhkMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCkBAIC0yMCw2ICsyMCw3IEBA
CiAjaW5jbHVkZSA8bGludXgvc3dpb3RsYi5oPgogI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2VmaS5oPgorI2luY2x1ZGUgPGxpbnV4L2NtZGxpbmUuaD4KIAogI2luY2x1
ZGUgPGFzbS9jcHVfb3BzLmg+CiAjaW5jbHVkZSA8YXNtL2Vhcmx5X2lvcmVtYXAuaD4KQEAgLTIy
OCwxMCArMjI5LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHBhcnNlX2R0Yih2b2lkKQogCX0KIAog
CXByX2VycigiTm8gRFRCIHBhc3NlZCB0byB0aGUga2VybmVsXG4iKTsKLSNpZmRlZiBDT05GSUdf
Q01ETElORV9GT1JDRQotCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIENPTkZJR19DTURMSU5F
LCBDT01NQU5EX0xJTkVfU0laRSk7CisJY21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGluZSwg
TlVMTCwgQ09NTUFORF9MSU5FX1NJWkUpOwogCXByX2luZm8oIkZvcmNpbmcga2VybmVsIGNvbW1h
bmQgbGluZSB0bzogJXNcbiIsIGJvb3RfY29tbWFuZF9saW5lKTsKLSNlbmRpZgogfQogCiB2b2lk
IF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCi0tIAoyLjI1LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

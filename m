Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC26234B0D3
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 202D1212E4;
	Fri, 26 Mar 2021 21:52:04 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id B80EC212A4
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:54 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWS60pgz9v03C;
 Fri, 26 Mar 2021 14:44:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ua4xnFB1IzAD; Fri, 26 Mar 2021 14:44:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWS560hz9v03B;
 Fri, 26 Mar 2021 14:44:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 702B98B8CB;
 Fri, 26 Mar 2021 14:44:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nQgQ-Ws-8ZQe; Fri, 26 Mar 2021 14:44:53 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC3738B8C7;
 Fri, 26 Mar 2021 14:44:52 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 78A0A67611; Fri, 26 Mar 2021 13:44:53 +0000 (UTC)
Message-Id: <29e44feb9254a462e23513cc4279dae6af0f2ae6.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:53 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 06/17] arm64: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL2FybTY0L0tjb25maWcgICAgICAgICAgICAgICAgIHwgMzMgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL2FybTY0L2tlcm5lbC9pZHJlZy1vdmVycmlkZS5jIHwg
IDkgKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcgYi9hcmNoL2FybTY0L0tjb25m
aWcKaW5kZXggNTY1NmU3YWFjZDY5Li5lZWZmNzczMGNjZjAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQvS2NvbmZpZworKysgYi9hcmNoL2FybTY0L0tjb25maWcKQEAgLTEwNSw2ICsxMDUsNyBAQCBj
b25maWcgQVJNNjQKIAlzZWxlY3QgR0VORVJJQ19BTExPQ0FUT1IKIAlzZWxlY3QgR0VORVJJQ19B
UkNIX1RPUE9MT0dZCiAJc2VsZWN0IEdFTkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURDQVNUCisJc2Vs
ZWN0IEdFTkVSSUNfQ01ETElORQogCXNlbGVjdCBHRU5FUklDX0NQVV9BVVRPUFJPQkUKIAlzZWxl
Y3QgR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTCiAJc2VsZWN0IEdFTkVSSUNfRUFSTFlfSU9S
RU1BUApAQCAtMTgzMSwzOCArMTgzMiw2IEBAIGNvbmZpZyBBUk02NF9BQ1BJX1BBUktJTkdfUFJP
VE9DT0wKIAkgIHByb3RvY29sIGV2ZW4gaWYgdGhlIGNvcnJlc3BvbmRpbmcgZGF0YSBpcyBwcmVz
ZW50IGluIHRoZSBBQ1BJCiAJICBNQURUIHRhYmxlLgogCi1jb25maWcgQ01ETElORQotCXN0cmlu
ZyAiRGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JZGVmYXVsdCAiIgotCWhlbHAKLQkg
IFByb3ZpZGUgYSBzZXQgb2YgZGVmYXVsdCBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0
aW1lIGJ5Ci0JICBlbnRlcmluZyB0aGVtIGhlcmUuIEFzIGEgbWluaW11bSwgeW91IHNob3VsZCBz
cGVjaWZ5IHRoZSB0aGUKLQkgIHJvb3QgZGV2aWNlIChlLmcuIHJvb3Q9L2Rldi9uZnMpLgotCi1j
aG9pY2UKLQlwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUgdHlwZSIgaWYgQ01ETElORSAhPSAi
IgotCWRlZmF1bHQgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKLQloZWxwCi0JICBDaG9vc2UgaG93
IHRoZSBrZXJuZWwgd2lsbCBoYW5kbGUgdGhlIHByb3ZpZGVkIGRlZmF1bHQga2VybmVsCi0JICBj
b21tYW5kIGxpbmUgc3RyaW5nLgotCi1jb25maWcgQ01ETElORV9GUk9NX0JPT1RMT0FERVIKLQli
b29sICJVc2UgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKLQloZWxw
Ci0JICBVc2VzIHRoZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJvb3QgbG9h
ZGVyLiBJZgotCSAgdGhlIGJvb3QgbG9hZGVyIGRvZXNuJ3QgcHJvdmlkZSBhbnksIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kCi0JICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJl
IHVzZWQuCi0KLWNvbmZpZyBDTURMSU5FX0ZPUkNFCi0JYm9vbCAiQWx3YXlzIHVzZSB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JaGVscAotCSAgQWx3YXlzIHVzZSB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcsIGV2ZW4gaWYgdGhlIGJvb3QKLQkgIGxvYWRlciBw
YXNzZXMgb3RoZXIgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuCi0JICBUaGlzIGlzIHVzZWZ1bCBp
ZiB5b3UgY2Fubm90IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZQotCSAgY29tbWFuZC1saW5l
IG9wdGlvbnMgeW91ciBib290IGxvYWRlciBwYXNzZXMgdG8gdGhlIGtlcm5lbC4KLQotZW5kY2hv
aWNlCi0KIGNvbmZpZyBFRklfU1RVQgogCWJvb2wKIApkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9r
ZXJuZWwvaWRyZWctb3ZlcnJpZGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL2lkcmVnLW92ZXJyaWRl
LmMKaW5kZXggODNmMWM0YjkyMDk1Li44YmM5NTVjZGNmODIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
NjQva2VybmVsL2lkcmVnLW92ZXJyaWRlLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvaWRyZWct
b3ZlcnJpZGUuYwpAQCAtOSw2ICs5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9jdHlwZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L2xpYmZkdC5oPgorI2luY2x1
ZGUgPGxpbnV4L2NtZGxpbmUuaD4KIAogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAjaW5j
bHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KQEAgLTE4NywxMiArMTg4LDEwIEBAIHN0YXRpYyBfX2lu
aXQgY29uc3QgdTggKmdldF9ib290YXJnc19jbWRsaW5lKHZvaWQpCiBzdGF0aWMgX19pbml0IHZv
aWQgcGFyc2VfY21kbGluZSh2b2lkKQogewogCWNvbnN0IHU4ICpwcm9wID0gZ2V0X2Jvb3Rhcmdz
X2NtZGxpbmUoKTsKKwlzdGF0aWMgY2hhciBfX2luaXRkYXRhIGNtZGxpbmVbQ09NTUFORF9MSU5F
X1NJWkVdOwogCi0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfRk9SQ0UpIHx8ICFwcm9w
KQotCQlfX3BhcnNlX2NtZGxpbmUoQ09ORklHX0NNRExJTkUsIHRydWUpOwotCi0JaWYgKCFJU19F
TkFCTEVEKENPTkZJR19DTURMSU5FX0ZPUkNFKSAmJiBwcm9wKQotCQlfX3BhcnNlX2NtZGxpbmUo
cHJvcCwgdHJ1ZSk7CisJY21kbGluZV9idWlsZChjbWRsaW5lLCBwcm9wLCBDT01NQU5EX0xJTkVf
U0laRSk7CisJX19wYXJzZV9jbWRsaW5lKGNtZGxpbmUsIHRydWUpOwogfQogCiAvKiBLZWVwIGNo
ZWNrZXJzIHF1aWV0ICovCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

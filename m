Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6096D353252
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 24E882134D;
	Sat,  3 Apr 2021 06:19:04 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 006A5212C8
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG13TDmz9v2mD;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id F6l6AA6-Funv; Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG11sggz9v2ls;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BFC78BB7C;
 Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EfU0KCsncQUw; Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9978B8BB79;
 Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3721D67989; Fri,  2 Apr 2021 15:18:18 +0000 (UTC)
Message-Id: <37fc5bd333125270f7032b8f9be225297e6dbe4f.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:18 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 16/20] sparc: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL3NwYXJjL0tjb25maWcgICAgICAgICAgIHwgMTggKy0tLS0tLS0tLS0tLS0tLS0t
CiBhcmNoL3NwYXJjL3Byb20vYm9vdHN0cl82NC5jIHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJj
L0tjb25maWcgYi9hcmNoL3NwYXJjL0tjb25maWcKaW5kZXggMTY0YTUyNTRjOTFjLi4yYTE5N2Yz
YTI1NDkgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvS2NvbmZpZworKysgYi9hcmNoL3NwYXJjL0tj
b25maWcKQEAgLTUwLDYgKzUwLDcgQEAgY29uZmlnIFNQQVJDCiAJc2VsZWN0IE5FRURfRE1BX01B
UF9TVEFURQogCXNlbGVjdCBORUVEX1NHX0RNQV9MRU5HVEgKIAlzZWxlY3QgU0VUX0ZTCisJc2Vs
ZWN0IEdFTkVSSUNfQ01ETElORSBpZiBTUEFSQzY0CiAKIGNvbmZpZyBTUEFSQzMyCiAJZGVmX2Jv
b2wgITY0QklUCkBAIC0zMTMsMjMgKzMxNCw2IEBAIGNvbmZpZyBTQ0hFRF9NQwogCSAgbWFraW5n
IHdoZW4gZGVhbGluZyB3aXRoIG11bHRpLWNvcmUgQ1BVIGNoaXBzIGF0IGEgY29zdCBvZiBzbGln
aHRseQogCSAgaW5jcmVhc2VkIG92ZXJoZWFkIGluIHNvbWUgcGxhY2VzLiBJZiB1bnN1cmUgc2F5
IE4gaGVyZS4KIAotY29uZmlnIENNRExJTkVfQk9PTAotCWJvb2wgIkRlZmF1bHQgYm9vdGxvYWRl
ciBrZXJuZWwgYXJndW1lbnRzIgotCWRlcGVuZHMgb24gU1BBUkM2NAotCi1jb25maWcgQ01ETElO
RQotCXN0cmluZyAiSW5pdGlhbCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JZGVwZW5kcyBvbiBD
TURMSU5FX0JPT0wKLQlkZWZhdWx0ICJjb25zb2xlPXR0eVMwLDk2MDAgcm9vdD0vZGV2L3NkYTEi
Ci0JaGVscAotCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBiZSBhYmxlIHRvIHBhc3MgZGVm
YXVsdCBhcmd1bWVudHMgdG8KLQkgIHRoZSBrZXJuZWwuIFRoaXMgd2lsbCBiZSBvdmVycmlkZGVu
IGJ5IHRoZSBib290bG9hZGVyLCBpZiB5b3UKLQkgIHVzZSBvbmUgKHN1Y2ggYXMgU0lMTykuIFRo
aXMgaXMgbW9zdCB1c2VmdWwgaWYgeW91IHdhbnQgdG8gYm9vdAotCSAgYSBrZXJuZWwgZnJvbSBU
RlRQLCBhbmQgd2FudCBkZWZhdWx0IG9wdGlvbnMgdG8gYmUgYXZhaWxhYmxlCi0JICB3aXRoIGhh
dmluZyB0aGVtIHBhc3NlZCBvbiB0aGUgY29tbWFuZCBsaW5lLgotCi0JICBOT1RFOiBUaGlzIG9w
dGlvbiBXSUxMIG92ZXJyaWRlIHRoZSBQUk9NIGJvb3RhcmdzIHNldHRpbmchCi0KIGNvbmZpZyBT
VU5fUE0KIAlib29sCiAJZGVmYXVsdCB5IGlmIFNQQVJDMzIKZGlmZiAtLWdpdCBhL2FyY2gvc3Bh
cmMvcHJvbS9ib290c3RyXzY0LmMgYi9hcmNoL3NwYXJjL3Byb20vYm9vdHN0cl82NC5jCmluZGV4
IGYxY2MzNGQ5OWVlYy4uNDg1M2E0NWIzZGU5IDEwMDY0NAotLS0gYS9hcmNoL3NwYXJjL3Byb20v
Ym9vdHN0cl82NC5jCisrKyBiL2FyY2gvc3BhcmMvcHJvbS9ib290c3RyXzY0LmMKQEAgLTI1LDcg
KzI1LDcgQEAgc3RydWN0IHsKIAljaGFyIGJvb3RzdHJfYnVmW0JBUkdfTEVOXTsKIH0gYm9vdHN0
cl9pbmZvID0gewogCS5ib290c3RyX2xlbiA9IEJBUkdfTEVOLAotI2lmZGVmIENPTkZJR19DTURM
SU5FCisjaWYgQ09ORklHX0NNRExJTkUgIT0gIiIKIAkuYm9vdHN0cl92YWxpZCA9IDEsCiAJLmJv
b3RzdHJfYnVmID0gQ09ORklHX0NNRExJTkUsCiAjZW5kaWYKLS0gCjIuMjUuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

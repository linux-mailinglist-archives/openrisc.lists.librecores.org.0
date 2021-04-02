Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEB835324A
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7E3EB20FE2;
	Sat,  3 Apr 2021 06:18:54 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 19103212F9
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFr3RcWz9v2m8;
 Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GxtO1UqBUW7x; Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFr2PTSz9v2ls;
 Fri,  2 Apr 2021 17:18:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34FB48BB7B;
 Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BmkAXxz0r5S7; Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D1B498BB79;
 Fri,  2 Apr 2021 17:18:09 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A374467989; Fri,  2 Apr 2021 15:18:09 +0000 (UTC)
Message-Id: <2e49b9ae60a90aec8b555946279cab059a2812a4.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:09 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 08/20] arm: Convert to GENERIC_CMDLINE
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
LS0tCnY0OgotIFJlbW92ZWQgZGVwZW5kZW5jeSB0byBBVEFHUwotIFJlbW92ZWQgdGhlIG1lc3Nh
Z2Ugd2hlbiBmb3JjaW5nCi0tLQogYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgfCAzOCAr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm0va2VybmVsL2F0YWdz
X3BhcnNlLmMgfCAxMyArKystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9LY29uZmlnIGIvYXJj
aC9hcm0vS2NvbmZpZwppbmRleCA1ZGE5NmY1ZGY0OGYuLjFhMTgwOGIwZWVmNyAxMDA2NDQKLS0t
IGEvYXJjaC9hcm0vS2NvbmZpZworKysgYi9hcmNoL2FybS9LY29uZmlnCkBAIC01MCw2ICs1MCw3
IEBAIGNvbmZpZyBBUk0KIAlzZWxlY3QgR0VORVJJQ19BUkNIX1RPUE9MT0dZIGlmIEFSTV9DUFVf
VE9QT0xPR1kKIAlzZWxlY3QgR0VORVJJQ19BVE9NSUM2NCBpZiBDUFVfVjdNIHx8IENQVV9WNiB8
fCAhQ1BVXzMydjZLIHx8ICFBRUFCSQogCXNlbGVjdCBHRU5FUklDX0NMT0NLRVZFTlRTX0JST0FE
Q0FTVCBpZiBTTVAKKwlzZWxlY3QgR0VORVJJQ19DTURMSU5FCiAJc2VsZWN0IEdFTkVSSUNfSVJR
X0lQSSBpZiBTTVAKIAlzZWxlY3QgR0VORVJJQ19DUFVfQVVUT1BST0JFCiAJc2VsZWN0IEdFTkVS
SUNfRUFSTFlfSU9SRU1BUApAQCAtMTc0MCw0MyArMTc0MSw2IEBAIGNvbmZpZyBBUk1fQVRBR19E
VEJfQ09NUEFUX0NNRExJTkVfRVhURU5ECiAKIGVuZGNob2ljZQogCi1jb25maWcgQ01ETElORQot
CXN0cmluZyAiRGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JZGVmYXVsdCAiIgotCWhl
bHAKLQkgIE9uIHNvbWUgYXJjaGl0ZWN0dXJlcyAoZS5nLiBDQVRTKSwgdGhlcmUgaXMgY3VycmVu
dGx5IG5vIHdheQotCSAgZm9yIHRoZSBib290IGxvYWRlciB0byBwYXNzIGFyZ3VtZW50cyB0byB0
aGUga2VybmVsLiBGb3IgdGhlc2UKLQkgIGFyY2hpdGVjdHVyZXMsIHlvdSBzaG91bGQgc3VwcGx5
IHNvbWUgY29tbWFuZC1saW5lIG9wdGlvbnMgYXQgYnVpbGQKLQkgIHRpbWUgYnkgZW50ZXJpbmcg
dGhlbSBoZXJlLiBBcyBhIG1pbmltdW0sIHlvdSBzaG91bGQgc3BlY2lmeSB0aGUKLQkgIG1lbW9y
eSBzaXplIGFuZCB0aGUgcm9vdCBkZXZpY2UgKGUuZy4sIG1lbT02NE0gcm9vdD0vZGV2L25mcyku
Ci0KLWNob2ljZQotCXByb21wdCAiS2VybmVsIGNvbW1hbmQgbGluZSB0eXBlIiBpZiBDTURMSU5F
ICE9ICIiCi0JZGVmYXVsdCBDTURMSU5FX0ZST01fQk9PVExPQURFUgotCWRlcGVuZHMgb24gQVRB
R1MKLQotY29uZmlnIENNRExJTkVfRlJPTV9CT09UTE9BREVSCi0JYm9vbCAiVXNlIGJvb3Rsb2Fk
ZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFpbGFibGUiCi0JaGVscAotCSAgVXNlcyB0aGUgY29t
bWFuZC1saW5lIG9wdGlvbnMgcGFzc2VkIGJ5IHRoZSBib290IGxvYWRlci4gSWYKLQkgIHRoZSBi
b290IGxvYWRlciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFu
ZAotCSAgc3RyaW5nIHByb3ZpZGVkIGluIENNRExJTkUgd2lsbCBiZSB1c2VkLgotCi1jb25maWcg
Q01ETElORV9FWFRFTkQKLQlib29sICJFeHRlbmQgYm9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRz
IgotCWhlbHAKLQkgIFRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBi
b290IGxvYWRlciB3aWxsIGJlCi0JICBhcHBlbmRlZCB0byB0aGUgZGVmYXVsdCBrZXJuZWwgY29t
bWFuZCBzdHJpbmcuCi0KLWNvbmZpZyBDTURMSU5FX0ZPUkNFCi0JYm9vbCAiQWx3YXlzIHVzZSB0
aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JaGVscAotCSAgQWx3YXlzIHVzZSB0
aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcsIGV2ZW4gaWYgdGhlIGJvb3QKLQkgIGxv
YWRlciBwYXNzZXMgb3RoZXIgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuCi0JICBUaGlzIGlzIHVz
ZWZ1bCBpZiB5b3UgY2Fubm90IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZQotCSAgY29tbWFu
ZC1saW5lIG9wdGlvbnMgeW91ciBib290IGxvYWRlciBwYXNzZXMgdG8gdGhlIGtlcm5lbC4KLWVu
ZGNob2ljZQotCiBjb25maWcgWElQX0tFUk5FTAogCWJvb2wgIktlcm5lbCBFeGVjdXRlLUluLVBs
YWNlIGZyb20gUk9NIgogCWRlcGVuZHMgb24gIUFSTV9MUEFFICYmICFBUkNIX01VTFRJUExBVEZP
Uk0KZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2tlcm5lbC9hdGFnc19wYXJzZS5jIGIvYXJjaC9hcm0v
a2VybmVsL2F0YWdzX3BhcnNlLmMKaW5kZXggMzczYjYxZjlhNGYwLi5lZjk3ZWMwMTVjNTEgMTAw
NjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC9hdGFnc19wYXJzZS5jCisrKyBiL2FyY2gvYXJtL2tl
cm5lbC9hdGFnc19wYXJzZS5jCkBAIC0xNCw2ICsxNCw3IEBACiAgKiBpcyBub3QgcGFyc2VkIGlu
IGFueSB3YXkpLgogICovCiAKKyNpbmNsdWRlIDxsaW51eC9jbWRsaW5lLmg+CiAjaW5jbHVkZSA8
bGludXgvaW5pdC5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXRyZC5oPgogI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgpAQCAtMTIwLDE2ICsxMjEsOCBAQCBfX3RhZ3RhYmxlKEFUQUdfUkVWSVNJT04s
IHBhcnNlX3RhZ19yZXZpc2lvbik7CiAKIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3RhZ19jbWRs
aW5lKGNvbnN0IHN0cnVjdCB0YWcgKnRhZykKIHsKLSNpZiBkZWZpbmVkKENPTkZJR19DTURMSU5F
X0VYVEVORCkKLQlzdHJsY2F0KGRlZmF1bHRfY29tbWFuZF9saW5lLCAiICIsIENPTU1BTkRfTElO
RV9TSVpFKTsKLQlzdHJsY2F0KGRlZmF1bHRfY29tbWFuZF9saW5lLCB0YWctPnUuY21kbGluZS5j
bWRsaW5lLAotCQlDT01NQU5EX0xJTkVfU0laRSk7Ci0jZWxpZiBkZWZpbmVkKENPTkZJR19DTURM
SU5FX0ZPUkNFKQotCXByX3dhcm4oIklnbm9yaW5nIHRhZyBjbWRsaW5lICh1c2luZyB0aGUgZGVm
YXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lKVxuIik7Ci0jZWxzZQotCXN0cmxjcHkoZGVmYXVsdF9j
b21tYW5kX2xpbmUsIHRhZy0+dS5jbWRsaW5lLmNtZGxpbmUsCi0JCUNPTU1BTkRfTElORV9TSVpF
KTsKLSNlbmRpZgorCWNtZGxpbmVfYnVpbGQoZGVmYXVsdF9jb21tYW5kX2xpbmUsIHRhZy0+dS5j
bWRsaW5lLmNtZGxpbmUpOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjUuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9E38635324D
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:18:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 645A32133F;
	Sat,  3 Apr 2021 06:18:59 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 26747212C7
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFv5gXmz9v2lw;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZVGa-EQtaQRr; Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFv4Sv5z9v2ls;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83CBF8BB7C;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ePI0pVGy8P5x; Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FEB68BB79;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F0BE667989; Fri,  2 Apr 2021 15:18:12 +0000 (UTC)
Message-Id: <c73e170d5fbcc3ac5d7bc98a1e0bfa0b899b185e.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:12 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 11/20] microblaze: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL21pY3JvYmxhemUvS2NvbmZpZyAgICAgICAgICAgICAgIHwgMjQgKy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiBhcmNoL21pY3JvYmxhemUvY29uZmlncy9tbXVfZGVmY29uZmlnIHwg
IDIgKy0KIGFyY2gvbWljcm9ibGF6ZS9rZXJuZWwvaGVhZC5TICAgICAgICAgfCAgNCArKy0tCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9taWNyb2JsYXplL0tjb25maWcgYi9hcmNoL21pY3JvYmxhemUvS2NvbmZpZwpp
bmRleCAwNjYwZjQ3MDEyYmMuLjEyNDJmMzRiYzJhMiAxMDA2NDQKLS0tIGEvYXJjaC9taWNyb2Js
YXplL0tjb25maWcKKysrIGIvYXJjaC9taWNyb2JsYXplL0tjb25maWcKQEAgLTE1LDYgKzE1LDcg
QEAgY29uZmlnIE1JQ1JPQkxBWkUKIAlzZWxlY3QgQ09NTU9OX0NMSwogCXNlbGVjdCBETUFfRElS
RUNUX1JFTUFQCiAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQKKwlzZWxlY3QgR0VORVJJQ19DTURM
SU5FCiAJc2VsZWN0IEdFTkVSSUNfQ1BVX0RFVklDRVMKIAlzZWxlY3QgR0VORVJJQ19JRExFX1BP
TExfU0VUVVAKIAlzZWxlY3QgR0VORVJJQ19JUlFfUFJPQkUKQEAgLTkzLDI5ICs5NCw2IEBAIHNv
dXJjZSAia2VybmVsL0tjb25maWcuaHoiCiBjb25maWcgTU1VCiAJZGVmX2Jvb2wgeQogCi1jb21t
ZW50ICJCb290IG9wdGlvbnMiCi0KLWNvbmZpZyBDTURMSU5FX0JPT0wKLQlib29sICJEZWZhdWx0
IGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKLQotY29uZmlnIENNRExJTkUKLQlzdHJpbmcg
IkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgotCWRlcGVuZHMgb24gQ01ETElORV9CT09M
Ci0JZGVmYXVsdCAiY29uc29sZT10dHlVTDAsMTE1MjAwIgotCWhlbHAKLQkgIE9uIHNvbWUgYXJj
aGl0ZWN0dXJlcyB0aGVyZSBpcyBjdXJyZW50bHkgbm8gd2F5IGZvciB0aGUgYm9vdCBsb2FkZXIK
LQkgIHRvIHBhc3MgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuIEZvciB0aGVzZSBhcmNoaXRlY3R1
cmVzLCB5b3Ugc2hvdWxkCi0JICBzdXBwbHkgc29tZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBi
dWlsZCB0aW1lIGJ5IGVudGVyaW5nIHRoZW0KLQkgIGhlcmUuCi0KLWNvbmZpZyBDTURMSU5FX0ZP
UkNFCi0JYm9vbCAiRm9yY2UgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmciCi0JZGVwZW5k
cyBvbiBDTURMSU5FX0JPT0wKLQlkZWZhdWx0IG4KLQloZWxwCi0JICBTZXQgdGhpcyB0byBoYXZl
IGFyZ3VtZW50cyBmcm9tIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZwotCSAgb3Zl
cnJpZGUgdGhvc2UgcGFzc2VkIGJ5IHRoZSBib290IGxvYWRlci4KLQogZW5kbWVudQogCiBtZW51
ICJLZXJuZWwgZmVhdHVyZXMiCmRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvY29uZmlncy9t
bXVfZGVmY29uZmlnIGIvYXJjaC9taWNyb2JsYXplL2NvbmZpZ3MvbW11X2RlZmNvbmZpZwppbmRl
eCA1MTMzN2ZmZmI5NDcuLmI0ZDIyMTlkMGE4ZiAxMDA2NDQKLS0tIGEvYXJjaC9taWNyb2JsYXpl
L2NvbmZpZ3MvbW11X2RlZmNvbmZpZworKysgYi9hcmNoL21pY3JvYmxhemUvY29uZmlncy9tbXVf
ZGVmY29uZmlnCkBAIC0xNiw3ICsxNiw3IEBAIENPTkZJR19YSUxJTlhfTUlDUk9CTEFaRTBfVVNF
X0RJVj0xCiBDT05GSUdfWElMSU5YX01JQ1JPQkxBWkUwX1VTRV9IV19NVUw9MgogQ09ORklHX1hJ
TElOWF9NSUNST0JMQVpFMF9VU0VfRlBVPTIKIENPTkZJR19IWl8xMDA9eQotQ09ORklHX0NNRExJ
TkVfQk9PTD15CitDT05GSUdfQ01ETElORT0iY29uc29sZT10dHlVTDAsMTE1MjAwIgogQ09ORklH
X0NNRExJTkVfRk9SQ0U9eQogQ09ORklHX0hJR0hNRU09eQogQ09ORklHX1BDSV9YSUxJTlg9eQpk
aWZmIC0tZ2l0IGEvYXJjaC9taWNyb2JsYXplL2tlcm5lbC9oZWFkLlMgYi9hcmNoL21pY3JvYmxh
emUva2VybmVsL2hlYWQuUwppbmRleCBlYzJmY2I1NDVlNjQuLjYwNWIxOGM4NmFjOCAxMDA2NDQK
LS0tIGEvYXJjaC9taWNyb2JsYXplL2tlcm5lbC9oZWFkLlMKKysrIGIvYXJjaC9taWNyb2JsYXpl
L2tlcm5lbC9oZWFkLlMKQEAgLTEwNSw3ICsxMDUsNyBAQCBfY29weV9mZHQ6CiAJYWRkaWsJcjMs
IHIzLCAtNCAvKiBkZXNjcmVtZW50IGxvb3AgKi8KIG5vX2ZkdF9hcmc6CiAKLSNpZm5kZWYgQ09O
RklHX0NNRExJTkVfQk9PTAorI2lmIENPTkZJR19DTURMSU5FID09ICIiCiAvKgogICogaGFuZGxp
bmcgY29tbWFuZCBsaW5lCiAgKiBjb3B5IGNvbW1hbmQgbGluZSBkaXJlY3RseSB0byBjbWRfbGlu
ZSBwbGFjZWQgaW4gZGF0YSBzZWN0aW9uLgpAQCAtMTI2LDcgKzEyNiw3IEBAIF9jb3B5X2NvbW1h
bmRfbGluZToKIAlhZGRpawlyNSwgcjQsIDAJCS8qIGFkZCBuZXcgc3BhY2UgZm9yIGNvbW1hbmQg
bGluZSAqLwogCXRvdmlydChyNSxyNSkKIHNraXA6Ci0jZW5kaWYgLyogQ09ORklHX0NNRExJTkVf
Qk9PTCAqLworI2VuZGlmIC8qIENPTkZJR19DTURMSU5FICovCiAKICNpZmRlZiBOT1RfQ09NUElM
RQogLyogc2F2ZSBicmFtIGNvbnRleHQgKi8KLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

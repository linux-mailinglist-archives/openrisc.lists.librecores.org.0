Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0896534B0D7
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 77C6E20E5C;
	Fri, 26 Mar 2021 21:52:10 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id B2BB321098
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:44:58 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWX5nkqz9v03K;
 Fri, 26 Mar 2021 14:44:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WOLvZloR3Ccc; Fri, 26 Mar 2021 14:44:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWX4v6mz9v03B;
 Fri, 26 Mar 2021 14:44:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 627FB8B8C9;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6OaEXOQG2IEm; Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 147E38B8C7;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 94C9867611; Fri, 26 Mar 2021 13:44:57 +0000 (UTC)
Message-Id: <d583d618d93e723165b1145f9d4ec2981b61ca04.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:57 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:56 +0100
Subject: [OpenRISC] [PATCH v3 10/17] openrisc: Convert to GENERIC_CMDLINE
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
LS0tCiBhcmNoL29wZW5yaXNjL0tjb25maWcgfCAxMCArLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9LY29uZmlnIGIvYXJjaC9vcGVucmlzYy9LY29uZmlnCmluZGV4IDU5MWFjYzU5OTBkYy4u
Y2ExZDBmMThmZTE2IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL0tjb25maWcKKysrIGIvYXJj
aC9vcGVucmlzYy9LY29uZmlnCkBAIC0yNSw2ICsyNSw3IEBAIGNvbmZpZyBPUEVOUklTQwogCXNl
bGVjdCBIQVZFX1VJRDE2CiAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQKIAlzZWxlY3QgR0VORVJJ
Q19DTE9DS0VWRU5UU19CUk9BRENBU1QKKwlzZWxlY3QgR0VORVJJQ19DTURMSU5FCiAJc2VsZWN0
IEdFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVIKIAlzZWxlY3QgR0VORVJJQ19TVFJOTEVOX1VTRVIK
IAlzZWxlY3QgR0VORVJJQ19TTVBfSURMRV9USFJFQUQKQEAgLTE2MiwxNSArMTYzLDYgQEAgY29u
ZmlnIE9QRU5SSVNDX0hBVkVfU0hBRE9XX0dQUlMKIAkgIE9uIFNNUCBzeXN0ZW1zLCB0aGlzIGZl
YXR1cmUgaXMgbWFuZGF0b3J5LgogCSAgT24gYSB1bmljb3JlIHN5c3RlbSBpdCdzIHNhZmUgdG8g
c2F5IE4gaGVyZSBpZiB5b3UgYXJlIHVuc3VyZS4KIAotY29uZmlnIENNRExJTkUKLQlzdHJpbmcg
IkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgotCWRlZmF1bHQgIiIKLQloZWxwCi0JICBP
biBzb21lIGFyY2hpdGVjdHVyZXMgdGhlcmUgaXMgY3VycmVudGx5IG5vIHdheSBmb3IgdGhlIGJv
b3QgbG9hZGVyCi0JICB0byBwYXNzIGFyZ3VtZW50cyB0byB0aGUga2VybmVsLiBGb3IgdGhlc2Ug
YXJjaGl0ZWN0dXJlcywgeW91IHNob3VsZAotCSAgc3VwcGx5IHNvbWUgY29tbWFuZC1saW5lIG9w
dGlvbnMgYXQgYnVpbGQgdGltZSBieSBlbnRlcmluZyB0aGVtCi0JICBoZXJlLgotCiBtZW51ICJE
ZWJ1Z2dpbmcgb3B0aW9ucyIKIAogY29uZmlnIEpVTVBfVVBPTl9VTkhBTkRMRURfRVhDRVBUSU9O
Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C3610353256
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8369A2135B;
	Sat,  3 Apr 2021 06:19:06 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id B4CC2212FA
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:18:23 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG52l3Hz9v2lx;
 Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GzDR9N0g0Rpg; Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG519y8z9v2ls;
 Fri,  2 Apr 2021 17:18:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F0A0F8BB7C;
 Fri,  2 Apr 2021 17:18:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JBXhU7_Qtg1N; Fri,  2 Apr 2021 17:18:22 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 789078BB7D;
 Fri,  2 Apr 2021 17:18:22 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5513E67989; Fri,  2 Apr 2021 15:18:22 +0000 (UTC)
Message-Id: <349128c2baa37dfcafb61a10d4e6c62f93cfe881.1617375803.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:22 +0000 (UTC)
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
Subject: [OpenRISC] [PATCH v4 20/20] cmdline: Remove CONFIG_CMDLINE_EXTEND
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

QWxsIGFyY2hpdGVjdHVyZXMgcHJvdmlkaW5nIENPTkZJR19DTURMSU5FX0VYVEVORAphcmUgbm93
IGNvbnZlcnRlZCB0byBHRU5FUklDX0NNRExJTkUuCgpUaGlzIGNvbmZpZ3VyYXRpb24gaXRlbSBp
cyBub3QgdXNlZCBhbnltb3JlLCBkcm9wIGl0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgotLS0KIGluY2x1ZGUvbGludXgvY21k
bGluZS5oIHwgMiArLQogaW5pdC9LY29uZmlnICAgICAgICAgICAgfCA2IC0tLS0tLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2NtZGxpbmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCmluZGV4IGEw
NzczZGMzNjVjNy4uMDIwMDI4ZTJiZGYwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2NtZGxp
bmUuaAorKysgYi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaApAQCAtMzYsNyArMzYsNyBAQCBzdGF0
aWMgX19hbHdheXNfaW5saW5lIGJvb2wgX19jbWRsaW5lX2J1aWxkKGNoYXIgKmRzdCwgY29uc3Qg
Y2hhciAqc3JjKQogCiAJbGVuID0gY21kbGluZV9zdHJsY2F0KGRzdCwgc3JjLCBDT01NQU5EX0xJ
TkVfU0laRSk7CiAKLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpKQorCWlm
IChJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0FQUEVORCkpCiAJCWxlbiA9IGNtZGxpbmVfc3Ry
bGNhdChkc3QsICIgIiBDT05GSUdfQ01ETElORSwgQ09NTUFORF9MSU5FX1NJWkUpOwogCiAJaWYg
KGxlbiA8IENPTU1BTkRfTElORV9TSVpFIC0gMSkKZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZpZyBi
L2luaXQvS2NvbmZpZwppbmRleCBhZjBkODQ2NjJjYzIuLmZhMDAyZTM3NjVhYiAxMDA2NDQKLS0t
IGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtMTYzLDEyICsxNjMsNiBAQCBj
b25maWcgQ01ETElORV9GT1JDRQogCSAgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBib290bG9h
ZGVyLgogZW5kY2hvaWNlCiAKLWNvbmZpZyBDTURMSU5FX0VYVEVORAotCWJvb2wKLQlkZWZhdWx0
IENNRExJTkVfQVBQRU5ECi0JaGVscAotCSAgVG8gYmUgcmVtb3ZlZCBvbmNlIGFsbCBhcmNoaXRl
Y3R1cmVzIGFyZSBjb252ZXJ0ZWQgdG8gZ2VuZXJpYyBDTURMSU5FCi0KIGNvbmZpZyBDT01QSUxF
X1RFU1QKIAlib29sICJDb21waWxlIGFsc28gZHJpdmVycyB3aGljaCB3aWxsIG5vdCBsb2FkIgog
CWRlcGVuZHMgb24gSEFTX0lPTUVNCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

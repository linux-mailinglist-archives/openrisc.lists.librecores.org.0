Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C6C2234B0DE
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68CFD200E4;
	Fri, 26 Mar 2021 21:52:18 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id BB1AB212A2
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 14:45:06 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWh6NNJz9v03N;
 Fri, 26 Mar 2021 14:45:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xndv0v1GJYSd; Fri, 26 Mar 2021 14:45:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWh50m3z9v03M;
 Fri, 26 Mar 2021 14:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7ED9F8B8CB;
 Fri, 26 Mar 2021 14:45:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fcwQHTDmL2ra; Fri, 26 Mar 2021 14:45:05 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF2308B8CD;
 Fri, 26 Mar 2021 14:45:04 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 48ABF67611; Fri, 26 Mar 2021 13:45:05 +0000 (UTC)
Message-Id: <63c9c340da826c14ed0c4f0121e723b16f626bc7.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:45:05 +0000 (UTC)
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:57 +0100
Subject: [OpenRISC] [PATCH v3 17/17] cmdline: Remove CONFIG_CMDLINE_EXTEND
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

QWxsIGFyY2hpdGVjdHVyZXMgcHJvdmlkaW5nIENPTkZJR19DTURMSU5FX0VYVEVORAphcmUgbm93
IGNvbnZlcnRlZCB0byBHRU5FUklDX0NNRExJTkUuCgpUaGlzIGNvbmZpZ3VyYXRpb24gaXRlbSBp
cyBub3QgdXNlZCBhbnltb3JlLCBkcm9wIGl0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PgotLS0KIGluaXQvS2NvbmZpZyB8IDYg
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbml0
L0tjb25maWcgYi9pbml0L0tjb25maWcKaW5kZXggYWYwZDg0NjYyY2MyLi5mYTAwMmUzNzY1YWIg
MTAwNjQ0Ci0tLSBhL2luaXQvS2NvbmZpZworKysgYi9pbml0L0tjb25maWcKQEAgLTE2MywxMiAr
MTYzLDYgQEAgY29uZmlnIENNRExJTkVfRk9SQ0UKIAkgIGFyZ3VtZW50cyBwcm92aWRlZCBieSB0
aGUgYm9vdGxvYWRlci4KIGVuZGNob2ljZQogCi1jb25maWcgQ01ETElORV9FWFRFTkQKLQlib29s
Ci0JZGVmYXVsdCBDTURMSU5FX0FQUEVORAotCWhlbHAKLQkgIFRvIGJlIHJlbW92ZWQgb25jZSBh
bGwgYXJjaGl0ZWN0dXJlcyBhcmUgY29udmVydGVkIHRvIGdlbmVyaWMgQ01ETElORQotCiBjb25m
aWcgQ09NUElMRV9URVNUCiAJYm9vbCAiQ29tcGlsZSBhbHNvIGRyaXZlcnMgd2hpY2ggd2lsbCBu
b3QgbG9hZCIKIAlkZXBlbmRzIG9uIEhBU19JT01FTQotLSAKMi4yNS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

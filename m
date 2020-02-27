Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 00DBB171779
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CC68A209E4;
	Thu, 27 Feb 2020 13:35:48 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4E3EC20979
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 09:49:16 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1FE62467B;
 Thu, 27 Feb 2020 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793355;
 bh=W4eq3oKBNtn5njtCQFUl0E8W7deUmxpRXFBznDlnmPc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GWg6a4X86jnLVYeXklLgcO156TnY++Xe71DSE6B1Y2Dk/Puxcd0a8LMs3S0xl5CFX
 5YlbgPgfYKgyFMe1wYpSYNS9erfRpNc1gh2Fq6vTszeT2r9rd+OFjzSzuA3OpDO4u2
 Mmx5ZuMnIcG1AOK95gK1Usu2hj4aFWzw+k/5D5Ss=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2020 10:46:00 +0200
Message-Id: <20200227084608.18223-7-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH v3 06/14] openrisc: add support for folded p4d
 page tables
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, James Morse <james.morse@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSW1wbGVtZW50IHByaW1p
dGl2ZXMgbmVjZXNzYXJ5IGZvciB0aGUgNHRoIGxldmVsIGZvbGRpbmcsIGFkZCB3YWxrcyBvZiBw
NGQKbGV2ZWwgd2hlcmUgYXBwcm9wcmlhdGUgYW5kIHJlbW92ZSB1c2FnZSBvZiBfX0FSQ0hfVVNF
XzVMRVZFTF9IQUNLLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDEgLQog
YXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICAgICAgICAgICAgfCAxMCArKysrKysrKy0tCiBhcmNo
L29wZW5yaXNjL21tL2luaXQuYyAgICAgICAgICAgICB8ICA0ICsrKy0KIDMgZmlsZXMgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCmluZGV4IDI0OGQyMmQ4ZmFhNy4uYzA3Mjk0M2ZjNzIxIDEwMDY0NAotLS0gYS9h
cmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL29wZW5yaXNjL2lu
Y2x1ZGUvYXNtL3BndGFibGUuaApAQCAtMjEsNyArMjEsNiBAQAogI2lmbmRlZiBfX0FTTV9PUEVO
UklTQ19QR1RBQkxFX0gKICNkZWZpbmUgX19BU01fT1BFTlJJU0NfUEdUQUJMRV9ICiAKLSNkZWZp
bmUgX19BUkNIX1VTRV81TEVWRUxfSEFDSwogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGUt
bm9wbWQuaD4KIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2MvbW0vZmF1bHQuYyBiL2FyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYwppbmRleCA1ZDRkM2E5Njkx
ZDAuLjQ0YWEwNDU0NWRlMyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jCisr
KyBiL2FyY2gvb3BlbnJpc2MvbW0vZmF1bHQuYwpAQCAtMjk2LDYgKzI5Niw3IEBAIGFzbWxpbmth
Z2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25n
IGFkZHJlc3MsCiAKIAkJaW50IG9mZnNldCA9IHBnZF9pbmRleChhZGRyZXNzKTsKIAkJcGdkX3Qg
KnBnZCwgKnBnZF9rOworCQlwNGRfdCAqcDRkLCAqcDRkX2s7CiAJCXB1ZF90ICpwdWQsICpwdWRf
azsKIAkJcG1kX3QgKnBtZCwgKnBtZF9rOwogCQlwdGVfdCAqcHRlX2s7CkBAIC0zMjIsOCArMzIz
LDEzIEBAIGFzbWxpbmthZ2Ugdm9pZCBkb19wYWdlX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdz
LCB1bnNpZ25lZCBsb25nIGFkZHJlc3MsCiAJCSAqIGl0IGV4aXN0cy4KIAkJICovCiAKLQkJcHVk
ID0gcHVkX29mZnNldChwZ2QsIGFkZHJlc3MpOwotCQlwdWRfayA9IHB1ZF9vZmZzZXQocGdkX2ss
IGFkZHJlc3MpOworCQlwNGQgPSBwNGRfb2Zmc2V0KHBnZCwgYWRkcmVzcyk7CisJCXA0ZF9rID0g
cDRkX29mZnNldChwZ2RfaywgYWRkcmVzcyk7CisJCWlmICghcDRkX3ByZXNlbnQoKnA0ZF9rKSkK
KwkJCWdvdG8gbm9fY29udGV4dDsKKworCQlwdWQgPSBwdWRfb2Zmc2V0KHA0ZCwgYWRkcmVzcyk7
CisJCXB1ZF9rID0gcHVkX29mZnNldChwNGRfaywgYWRkcmVzcyk7CiAJCWlmICghcHVkX3ByZXNl
bnQoKnB1ZF9rKSkKIAkJCWdvdG8gbm9fY29udGV4dDsKIApkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9tbS9pbml0LmMgYi9hcmNoL29wZW5yaXNjL21tL2luaXQuYwppbmRleCAxZjg3YjUyNGRi
NzguLjI1MzZhZWFlMDk3NSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKKysr
IGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIHZvaWQg
X19pbml0IG1hcF9yYW0odm9pZCkKIAl1bnNpZ25lZCBsb25nIHYsIHAsIGU7CiAJcGdwcm90X3Qg
cHJvdDsKIAlwZ2RfdCAqcGdlOworCXA0ZF90ICpwNGU7CiAJcHVkX3QgKnB1ZTsKIAlwbWRfdCAq
cG1lOwogCXB0ZV90ICpwdGU7CkBAIC05MCw3ICs5MSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBt
YXBfcmFtKHZvaWQpCiAKIAkJd2hpbGUgKHAgPCBlKSB7CiAJCQlpbnQgajsKLQkJCXB1ZSA9IHB1
ZF9vZmZzZXQocGdlLCB2KTsKKwkJCXA0ZSA9IHA0ZF9vZmZzZXQocGdlLCB2KTsKKwkJCXB1ZSA9
IHB1ZF9vZmZzZXQocDRlLCB2KTsKIAkJCXBtZSA9IHBtZF9vZmZzZXQocHVlLCB2KTsKIAogCQkJ
aWYgKCh1MzIpIHB1ZSAhPSAodTMyKSBwZ2UgfHwgKHUzMikgcG1lICE9ICh1MzIpIHBnZSkgewot
LSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

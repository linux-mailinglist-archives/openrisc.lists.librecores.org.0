Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B6E6D17177F
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7FED920999;
	Thu, 27 Feb 2020 13:35:51 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1562020980
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 09:50:16 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 891982468D;
 Thu, 27 Feb 2020 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793414;
 bh=fX2jVUBPzvxIFycYqkqAbM2SK2Ye1AXe+sp7QV+wvtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d4IiDjgFH6t1vgwpRDOo5FroCcA4eMYRDg3X2POJN550EnoMdHqdbF2Ty83giIzXl
 x+RVLtGIm7/J3pX7WX2CTvqHpv70/qlUL3PSjghxWcIYEP4gOmM928b+6UCymk812a
 Za+6SMUld0dvUk/ErSdfxHppk4YiJ3ZxjjhBceKk=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2020 10:46:06 +0200
Message-Id: <20200227084608.18223-13-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH v3 12/14] unicore32: remove __ARCH_USE_5LEVEL_HACK
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIHVuaWNvcmUzMiBh
cmNoaXRlY3R1cmUgaGFzIDIgbGV2ZWwgcGFnZSB0YWJsZXMgYW5kCmFzbS1nZW5lcmljL3BndGFi
bGUtbm9wbWQuaCBhbmQgZXhwbGljaXQgY2FzdHMgZnJvbSBwdWRfdCB0byBwZ2RfdCBmb3IgcGFn
ZQp0YWJsZSBmb2xkaW5nLgoKQWRkIHA0ZCB3YWxrIGluIHRoZSBvbmx5IHBsYWNlIHRoYXQgYWN0
dWFsbHkgdW5mb2xkcyB0aGUgcHVkIGxldmVsIGFuZApyZW1vdmUgX19BUkNIX1VTRV81TEVWRUxf
SEFDSy4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
LS0tCiBhcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxIC0KIGFyY2gvdW5p
Y29yZTMyL2tlcm5lbC9oaWJlcm5hdGUuYyAgICB8IDQgKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC91bmljb3Jl
MzIvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC91bmljb3JlMzIvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCmluZGV4IGM4ZjdiYTEyZjMwOS4uODIwMzBjMzJmYzA1IDEwMDY0NAotLS0gYS9hcmNo
L3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC91bmljb3JlMzIvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCkBAIC05LDcgKzksNiBAQAogI2lmbmRlZiBfX1VOSUNPUkVfUEdU
QUJMRV9IX18KICNkZWZpbmUgX19VTklDT1JFX1BHVEFCTEVfSF9fCiAKLSNkZWZpbmUgX19BUkNI
X1VTRV81TEVWRUxfSEFDSwogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGUtbm9wbWQuaD4K
ICNpbmNsdWRlIDxhc20vY3B1LXNpbmdsZS5oPgogCmRpZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUz
Mi9rZXJuZWwvaGliZXJuYXRlLmMgYi9hcmNoL3VuaWNvcmUzMi9rZXJuZWwvaGliZXJuYXRlLmMK
aW5kZXggZjM4MTIyNDVjYzAwLi5jY2FkMDUxYTc5YjYgMTAwNjQ0Ci0tLSBhL2FyY2gvdW5pY29y
ZTMyL2tlcm5lbC9oaWJlcm5hdGUuYworKysgYi9hcmNoL3VuaWNvcmUzMi9rZXJuZWwvaGliZXJu
YXRlLmMKQEAgLTMzLDkgKzMzLDExIEBAIHN0cnVjdCBzd3N1c3BfYXJjaF9yZWdzIHN3c3VzcF9h
cmNoX3JlZ3NfY3B1MDsKIHN0YXRpYyBwbWRfdCAqcmVzdW1lX29uZV9tZF90YWJsZV9pbml0KHBn
ZF90ICpwZ2QpCiB7CiAJcHVkX3QgKnB1ZDsKKwlwNGRfdCAqcDRkOwogCXBtZF90ICpwbWRfdGFi
bGU7CiAKLQlwdWQgPSBwdWRfb2Zmc2V0KHBnZCwgMCk7CisJcDRkID0gcDRkX29mZnNldChwZ2Qs
IDApOworCXB1ZCA9IHB1ZF9vZmZzZXQocDRkLCAwKTsKIAlwbWRfdGFibGUgPSBwbWRfb2Zmc2V0
KHB1ZCwgMCk7CiAKIAlyZXR1cm4gcG1kX3RhYmxlOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

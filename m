Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB25171778
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:48 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 73E20209E0;
	Thu, 27 Feb 2020 13:35:48 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 739D920971
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 09:49:06 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C7772468D;
 Thu, 27 Feb 2020 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793345;
 bh=71MnpEc+yFN5lenidv0+rt0LqtwQ5nS0iIQpg548uOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dq7SIHKA08G/mHYW+R+Hf5myjEeBF/+ZZwlWiezYaYu0nVmt/e+UU4TN4Z3B6ySQ4
 EE9lcwNT0vOQPXGXTOqJ7+cPzaAljcurNcOGmtNG5CagITFm2uvC61OFhdt/1hLOUM
 lgKpxjlIRb05KaHqhxX0qt60VQ8Hk8tg9pl07c0Y=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2020 10:45:59 +0200
Message-Id: <20200227084608.18223-6-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH v3 05/14] nios2: add support for folded p4d page
 tables
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
Ym0uY29tPgotLS0KIGFyY2gvbmlvczIvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMyArLS0KIGFy
Y2gvbmlvczIvbW0vZmF1bHQuYyAgICAgICAgICAgIHwgOSArKysrKysrLS0KIGFyY2gvbmlvczIv
bW0vaW9yZW1hcC5jICAgICAgICAgIHwgNiArKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL2luY2x1
ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4
IDk5OTg1ZDhiNzE2Ni4uNTQzMDVhYTA5Yjc0IDEwMDY0NAotLS0gYS9hcmNoL25pb3MyL2luY2x1
ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL25pb3MyL2luY2x1ZGUvYXNtL3BndGFibGUuaApA
QCAtMjIsNyArMjIsNiBAQAogI2luY2x1ZGUgPGFzbS90bGJmbHVzaC5oPgogCiAjaW5jbHVkZSA8
YXNtL3BndGFibGUtYml0cy5oPgotI2RlZmluZSBfX0FSQ0hfVVNFXzVMRVZFTF9IQUNLCiAjaW5j
bHVkZSA8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3BtZC5oPgogCiAjZGVmaW5lIEZJUlNUX1VTRVJf
QUREUkVTUwkwVUwKQEAgLTEwMCw3ICs5OSw3IEBAIGV4dGVybiBwdGVfdCBpbnZhbGlkX3B0ZV90
YWJsZVtQQUdFX1NJWkUvc2l6ZW9mKHB0ZV90KV07CiAgKi8KIHN0YXRpYyBpbmxpbmUgdm9pZCBz
ZXRfcG1kKHBtZF90ICpwbWRwdHIsIHBtZF90IHBtZHZhbCkKIHsKLQlwbWRwdHItPnB1ZC5wZ2Qu
cGdkID0gcG1kdmFsLnB1ZC5wZ2QucGdkOworCSpwbWRwdHIgPSBwbWR2YWw7CiB9CiAKIC8qIHRv
IGZpbmQgYW4gZW50cnkgaW4gYSBwYWdlLXRhYmxlLWRpcmVjdG9yeSAqLwpkaWZmIC0tZ2l0IGEv
YXJjaC9uaW9zMi9tbS9mYXVsdC5jIGIvYXJjaC9uaW9zMi9tbS9mYXVsdC5jCmluZGV4IDZhMmU3
MTZiOTU5Zi4uZDNkYTk5NTY2NWMzIDEwMDY0NAotLS0gYS9hcmNoL25pb3MyL21tL2ZhdWx0LmMK
KysrIGIvYXJjaC9uaW9zMi9tbS9mYXVsdC5jCkBAIC0yNDUsNiArMjQ1LDcgQEAgYXNtbGlua2Fn
ZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcg
Y2F1c2UsCiAJCSAqLwogCQlpbnQgb2Zmc2V0ID0gcGdkX2luZGV4KGFkZHJlc3MpOwogCQlwZ2Rf
dCAqcGdkLCAqcGdkX2s7CisJCXA0ZF90ICpwNGQsICpwNGRfazsKIAkJcHVkX3QgKnB1ZCwgKnB1
ZF9rOwogCQlwbWRfdCAqcG1kLCAqcG1kX2s7CiAJCXB0ZV90ICpwdGVfazsKQEAgLTI1Niw4ICsy
NTcsMTIgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsIHVuc2lnbmVkIGxvbmcgY2F1c2UsCiAJCQlnb3RvIG5vX2NvbnRleHQ7CiAJCXNldF9wZ2Qo
cGdkLCAqcGdkX2spOwogCi0JCXB1ZCA9IHB1ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsKLQkJcHVk
X2sgPSBwdWRfb2Zmc2V0KHBnZF9rLCBhZGRyZXNzKTsKKwkJcDRkID0gcDRkX29mZnNldChwZ2Qs
IGFkZHJlc3MpOworCQlwNGRfayA9IHA0ZF9vZmZzZXQocGdkX2ssIGFkZHJlc3MpOworCQlpZiAo
IXA0ZF9wcmVzZW50KCpwNGRfaykpCisJCQlnb3RvIG5vX2NvbnRleHQ7CisJCXB1ZCA9IHB1ZF9v
ZmZzZXQocDRkLCBhZGRyZXNzKTsKKwkJcHVkX2sgPSBwdWRfb2Zmc2V0KHA0ZF9rLCBhZGRyZXNz
KTsKIAkJaWYgKCFwdWRfcHJlc2VudCgqcHVkX2spKQogCQkJZ290byBub19jb250ZXh0OwogCQlw
bWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcmVzcyk7CmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL21t
L2lvcmVtYXAuYyBiL2FyY2gvbmlvczIvbW0vaW9yZW1hcC5jCmluZGV4IDgxOWJkZmNjMmU3MS4u
ZmU4MjFlZmI5YTk5IDEwMDY0NAotLS0gYS9hcmNoL25pb3MyL21tL2lvcmVtYXAuYworKysgYi9h
cmNoL25pb3MyL21tL2lvcmVtYXAuYwpAQCAtODYsMTEgKzg2LDE1IEBAIHN0YXRpYyBpbnQgcmVt
YXBfYXJlYV9wYWdlcyh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHVuc2lnbmVkIGxvbmcgcGh5c19h
ZGRyLAogCWlmIChhZGRyZXNzID49IGVuZCkKIAkJQlVHKCk7CiAJZG8geworCQlwNGRfdCAqcDRk
OwogCQlwdWRfdCAqcHVkOwogCQlwbWRfdCAqcG1kOwogCiAJCWVycm9yID0gLUVOT01FTTsKLQkJ
cHVkID0gcHVkX2FsbG9jKCZpbml0X21tLCBkaXIsIGFkZHJlc3MpOworCQlwNGQgPSBwNGRfYWxs
b2MoJmluaXRfbW0sIGRpciwgYWRkcmVzcyk7CisJCWlmICghcDRkKQorCQkJYnJlYWs7CisJCXB1
ZCA9IHB1ZF9hbGxvYygmaW5pdF9tbSwgcDRkLCBhZGRyZXNzKTsKIAkJaWYgKCFwdWQpCiAJCQli
cmVhazsKIAkJcG1kID0gcG1kX2FsbG9jKCZpbml0X21tLCBwdWQsIGFkZHJlc3MpOwotLSAKMi4y
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86D1B1B20BF
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4EFB120AFE;
	Tue, 21 Apr 2020 10:02:03 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C0C6B20A79
 for <openrisc@lists.librecores.org>; Tue, 14 Apr 2020 17:36:57 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E5F920678;
 Tue, 14 Apr 2020 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878616;
 bh=+PM6cCkwYFqje74qzoRC6poZ06tSHFDDyFeAMiCHCeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1uXYftVP+SP8zAkhuU/yZP3XxMdTuasDKvfSy5JabFslhgYvIqGAY3gx75EMaGZCP
 c1BEUefD/ho3vwJjC8da0hE+eMTa9FhGFDTJyxFAmWVy+fIvJDP42sqU3PraFGMcTT
 WfnmK5AWGpqRApF3UrQRroyPdYXW48Z1E2raP14Q=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 18:34:52 +0300
Message-Id: <20200414153455.21744-12-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH v4 11/14] sh: add support for folded p4d page
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
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSW1wbGVtZW50IHByaW1p
dGl2ZXMgbmVjZXNzYXJ5IGZvciB0aGUgNHRoIGxldmVsIGZvbGRpbmcsIGFkZCB3YWxrcyBvZiBw
NGQKbGV2ZWwgd2hlcmUgYXBwcm9wcmlhdGUgYW5kIHJlbW92ZSB1c2FnZSBvZiBfX0FSQ0hfVVNF
XzVMRVZFTF9IQUNLLgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5p
Ym0uY29tPgotLS0KIGFyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0ybGV2ZWwuaCB8ICAxIC0K
IGFyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaCB8ICAxIC0KIGFyY2gvc2gva2Vy
bmVsL2lvX3RyYXBwZWQuYyAgICAgICAgICB8ICA3ICsrKysrKy0KIGFyY2gvc2gvbW0vY2FjaGUt
c2g0LmMgICAgICAgICAgICAgICB8ICA0ICsrKy0KIGFyY2gvc2gvbW0vY2FjaGUtc2g1LmMgICAg
ICAgICAgICAgICB8ICA3ICsrKysrKy0KIGFyY2gvc2gvbW0vZmF1bHQuYyAgICAgICAgICAgICAg
ICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrLS0tCiBhcmNoL3NoL21tL2h1Z2V0bGJw
YWdlLmMgICAgICAgICAgICAgfCAyOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiBhcmNo
L3NoL21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKy0KIGFyY2gvc2gv
bW0va21hcC5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBhcmNoL3NoL21tL3RsYmV4XzMy
LmMgICAgICAgICAgICAgICAgfCAgNiArKysrKy0KIGFyY2gvc2gvbW0vdGxiZXhfNjQuYyAgICAg
ICAgICAgICAgICB8ICA3ICsrKysrKy0KIDExIGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMo
KyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0
YWJsZS0ybGV2ZWwuaCBiL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0ybGV2ZWwuaAppbmRl
eCBiZjFlYjUxYzNlZTUuLjA4YmZmOTM5MjdmZiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9pbmNsdWRl
L2FzbS9wZ3RhYmxlLTJsZXZlbC5oCisrKyBiL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0y
bGV2ZWwuaApAQCAtMiw3ICsyLDYgQEAKICNpZm5kZWYgX19BU01fU0hfUEdUQUJMRV8yTEVWRUxf
SAogI2RlZmluZSBfX0FTTV9TSF9QR1RBQkxFXzJMRVZFTF9ICiAKLSNkZWZpbmUgX19BUkNIX1VT
RV81TEVWRUxfSEFDSwogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGUtbm9wbWQuaD4KIAog
LyoKZGlmZiAtLWdpdCBhL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaCBiL2Fy
Y2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaAppbmRleCA3NzkyNjBiNzIxY2EuLjBm
ODAwOTdlNWM5YyAxMDA2NDQKLS0tIGEvYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLTNsZXZl
bC5oCisrKyBiL2FyY2gvc2gvaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaApAQCAtMiw3ICsy
LDYgQEAKICNpZm5kZWYgX19BU01fU0hfUEdUQUJMRV8zTEVWRUxfSAogI2RlZmluZSBfX0FTTV9T
SF9QR1RBQkxFXzNMRVZFTF9ICiAKLSNkZWZpbmUgX19BUkNIX1VTRV81TEVWRUxfSEFDSwogI2lu
Y2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGUtbm9wdWQuaD4KIAogLyoKZGlmZiAtLWdpdCBhL2Fy
Y2gvc2gva2VybmVsL2lvX3RyYXBwZWQuYyBiL2FyY2gvc2gva2VybmVsL2lvX3RyYXBwZWQuYwpp
bmRleCA2MGM4MjhhMmI4YTIuLjAzN2FhYjI3MDhiNyAxMDA2NDQKLS0tIGEvYXJjaC9zaC9rZXJu
ZWwvaW9fdHJhcHBlZC5jCisrKyBiL2FyY2gvc2gva2VybmVsL2lvX3RyYXBwZWQuYwpAQCAtMTM2
LDYgKzEzNiw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKG1hdGNoX3RyYXBwZWRfaW9faGFuZGxlcik7
CiBzdGF0aWMgc3RydWN0IHRyYXBwZWRfaW8gKmxvb2t1cF90aW9wKHVuc2lnbmVkIGxvbmcgYWRk
cmVzcykKIHsKIAlwZ2RfdCAqcGdkX2s7CisJcDRkX3QgKnA0ZF9rOwogCXB1ZF90ICpwdWRfazsK
IAlwbWRfdCAqcG1kX2s7CiAJcHRlX3QgKnB0ZV9rOwpAQCAtMTQ1LDcgKzE0NiwxMSBAQCBzdGF0
aWMgc3RydWN0IHRyYXBwZWRfaW8gKmxvb2t1cF90aW9wKHVuc2lnbmVkIGxvbmcgYWRkcmVzcykK
IAlpZiAoIXBnZF9wcmVzZW50KCpwZ2RfaykpCiAJCXJldHVybiBOVUxMOwogCi0JcHVkX2sgPSBw
dWRfb2Zmc2V0KHBnZF9rLCBhZGRyZXNzKTsKKwlwNGRfayA9IHA0ZF9vZmZzZXQocGdkX2ssIGFk
ZHJlc3MpOworCWlmICghcDRkX3ByZXNlbnQoKnA0ZF9rKSkKKwkJcmV0dXJuIE5VTEw7CisKKwlw
dWRfayA9IHB1ZF9vZmZzZXQocDRkX2ssIGFkZHJlc3MpOwogCWlmICghcHVkX3ByZXNlbnQoKnB1
ZF9rKSkKIAkJcmV0dXJuIE5VTEw7CiAKZGlmZiAtLWdpdCBhL2FyY2gvc2gvbW0vY2FjaGUtc2g0
LmMgYi9hcmNoL3NoL21tL2NhY2hlLXNoNC5jCmluZGV4IGVlZTkxMTQyMmNmOS4uNDU5NDNiY2I3
MDQyIDEwMDY0NAotLS0gYS9hcmNoL3NoL21tL2NhY2hlLXNoNC5jCisrKyBiL2FyY2gvc2gvbW0v
Y2FjaGUtc2g0LmMKQEAgLTIwOSw2ICsyMDksNyBAQCBzdGF0aWMgdm9pZCBzaDRfZmx1c2hfY2Fj
aGVfcGFnZSh2b2lkICphcmdzKQogCXVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcGZuLCBwaHlzOwog
CWludCBtYXBfY29oZXJlbnQgPSAwOwogCXBnZF90ICpwZ2Q7CisJcDRkX3QgKnA0ZDsKIAlwdWRf
dCAqcHVkOwogCXBtZF90ICpwbWQ7CiAJcHRlX3QgKnB0ZTsKQEAgLTIyNCw3ICsyMjUsOCBAQCBz
dGF0aWMgdm9pZCBzaDRfZmx1c2hfY2FjaGVfcGFnZSh2b2lkICphcmdzKQogCQlyZXR1cm47CiAK
IAlwZ2QgPSBwZ2Rfb2Zmc2V0KHZtYS0+dm1fbW0sIGFkZHJlc3MpOwotCXB1ZCA9IHB1ZF9vZmZz
ZXQocGdkLCBhZGRyZXNzKTsKKwlwNGQgPSBwNGRfb2Zmc2V0KHBnZCwgYWRkcmVzcyk7CisJcHVk
ID0gcHVkX29mZnNldChwNGQsIGFkZHJlc3MpOwogCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBhZGRy
ZXNzKTsKIAlwdGUgPSBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIGFkZHJlc3MpOwogCmRpZmYgLS1n
aXQgYS9hcmNoL3NoL21tL2NhY2hlLXNoNS5jIGIvYXJjaC9zaC9tbS9jYWNoZS1zaDUuYwppbmRl
eCA0NDViNWU2OWI3M2MuLjQ0MmE3N2NjMjk1NyAxMDA2NDQKLS0tIGEvYXJjaC9zaC9tbS9jYWNo
ZS1zaDUuYworKysgYi9hcmNoL3NoL21tL2NhY2hlLXNoNS5jCkBAIC0zODMsNiArMzgzLDcgQEAg
c3RhdGljIHZvaWQgc2g2NF9kY2FjaGVfcHVyZ2VfdXNlcl9wYWdlcyhzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKIAkJCQl1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kKQogewogCXBn
ZF90ICpwZ2Q7CisJcDRkX3QgKnA0ZDsKIAlwdWRfdCAqcHVkOwogCXBtZF90ICpwbWQ7CiAJcHRl
X3QgKnB0ZTsKQEAgLTM5Nyw3ICszOTgsMTEgQEAgc3RhdGljIHZvaWQgc2g2NF9kY2FjaGVfcHVy
Z2VfdXNlcl9wYWdlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlpZiAocGdkX2JhZCgqcGdkKSkK
IAkJcmV0dXJuOwogCi0JcHVkID0gcHVkX29mZnNldChwZ2QsIGFkZHIpOworCXA0ZCA9IHA0ZF9v
ZmZzZXQocGdkLCBhZGRyKTsKKwlpZiAocDRkX25vbmUoKnA0ZCkgfHwgcDRkX2JhZCgqcDRkKSkK
KwkJcmV0dXJuOworCisJcHVkID0gcHVkX29mZnNldChwNGQsIGFkZHIpOwogCWlmIChwdWRfbm9u
ZSgqcHVkKSB8fCBwdWRfYmFkKCpwdWQpKQogCQlyZXR1cm47CiAKZGlmZiAtLWdpdCBhL2FyY2gv
c2gvbW0vZmF1bHQuYyBiL2FyY2gvc2gvbW0vZmF1bHQuYwppbmRleCA3Yjc0ZTE4YjcxZDcuLjhi
M2FiNjVjODFjNCAxMDA2NDQKLS0tIGEvYXJjaC9zaC9tbS9mYXVsdC5jCisrKyBiL2FyY2gvc2gv
bW0vZmF1bHQuYwpAQCAtNTMsNiArNTMsNyBAQCBzdGF0aWMgdm9pZCBzaG93X3B0ZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyKQogCQkgKHU2NClwZ2RfdmFsKCpwZ2Qp
KTsKIAogCWRvIHsKKwkJcDRkX3QgKnA0ZDsKIAkJcHVkX3QgKnB1ZDsKIAkJcG1kX3QgKnBtZDsK
IAkJcHRlX3QgKnB0ZTsKQEAgLTY1LDcgKzY2LDIwIEBAIHN0YXRpYyB2b2lkIHNob3dfcHRlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIpCiAJCQlicmVhazsKIAkJfQog
Ci0JCXB1ZCA9IHB1ZF9vZmZzZXQocGdkLCBhZGRyKTsKKwkJcDRkID0gcDRkX29mZnNldChwZ2Qs
IGFkZHIpOworCQlpZiAoUFRSU19QRVJfUDREICE9IDEpCisJCQlwcl9jb250KCIsICpwNGQ9JTAq
THgiLCAodTMyKShzaXplb2YoKnA0ZCkgKiAyKSwKKwkJCSAgICAgICAgKHU2NClwNGRfdmFsKCpw
NGQpKTsKKworCQlpZiAocDRkX25vbmUoKnA0ZCkpCisJCQlicmVhazsKKworCQlpZiAocDRkX2Jh
ZCgqcDRkKSkgeworCQkJcHJfY29udCgiKGJhZCkiKTsKKwkJCWJyZWFrOworCQl9CisKKwkJcHVk
ID0gcHVkX29mZnNldChwNGQsIGFkZHIpOwogCQlpZiAoUFRSU19QRVJfUFVEICE9IDEpCiAJCQlw
cl9jb250KCIsICpwdWQ9JTAqbGx4IiwgKHUzMikoc2l6ZW9mKCpwdWQpICogMiksCiAJCQkJKHU2
NClwdWRfdmFsKCpwdWQpKTsKQEAgLTEwNyw2ICsxMjEsNyBAQCBzdGF0aWMgaW5saW5lIHBtZF90
ICp2bWFsbG9jX3N5bmNfb25lKHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcykKIHsK
IAl1bnNpZ25lZCBpbmRleCA9IHBnZF9pbmRleChhZGRyZXNzKTsKIAlwZ2RfdCAqcGdkX2s7CisJ
cDRkX3QgKnA0ZCwgKnA0ZF9rOwogCXB1ZF90ICpwdWQsICpwdWRfazsKIAlwbWRfdCAqcG1kLCAq
cG1kX2s7CiAKQEAgLTExNiw4ICsxMzEsMTMgQEAgc3RhdGljIGlubGluZSBwbWRfdCAqdm1hbGxv
Y19zeW5jX29uZShwZ2RfdCAqcGdkLCB1bnNpZ25lZCBsb25nIGFkZHJlc3MpCiAJaWYgKCFwZ2Rf
cHJlc2VudCgqcGdkX2spKQogCQlyZXR1cm4gTlVMTDsKIAotCXB1ZCA9IHB1ZF9vZmZzZXQocGdk
LCBhZGRyZXNzKTsKLQlwdWRfayA9IHB1ZF9vZmZzZXQocGdkX2ssIGFkZHJlc3MpOworCXA0ZCA9
IHA0ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsKKwlwNGRfayA9IHA0ZF9vZmZzZXQocGdkX2ssIGFk
ZHJlc3MpOworCWlmICghcDRkX3ByZXNlbnQoKnA0ZF9rKSkKKwkJcmV0dXJuIE5VTEw7CisKKwlw
dWQgPSBwdWRfb2Zmc2V0KHA0ZCwgYWRkcmVzcyk7CisJcHVkX2sgPSBwdWRfb2Zmc2V0KHA0ZF9r
LCBhZGRyZXNzKTsKIAlpZiAoIXB1ZF9wcmVzZW50KCpwdWRfaykpCiAJCXJldHVybiBOVUxMOwog
CmRpZmYgLS1naXQgYS9hcmNoL3NoL21tL2h1Z2V0bGJwYWdlLmMgYi9hcmNoL3NoL21tL2h1Z2V0
bGJwYWdlLmMKaW5kZXggOTYwZGViMWYyNGExLi5hY2Q1NjUyYTBkZTMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvc2gvbW0vaHVnZXRsYnBhZ2UuYworKysgYi9hcmNoL3NoL21tL2h1Z2V0bGJwYWdlLmMKQEAg
LTI2LDE3ICsyNiwyMSBAQCBwdGVfdCAqaHVnZV9wdGVfYWxsb2Moc3RydWN0IG1tX3N0cnVjdCAq
bW0sCiAJCQl1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc3opCiB7CiAJcGdkX3Qg
KnBnZDsKKwlwNGRfdCAqcDRkOwogCXB1ZF90ICpwdWQ7CiAJcG1kX3QgKnBtZDsKIAlwdGVfdCAq
cHRlID0gTlVMTDsKIAogCXBnZCA9IHBnZF9vZmZzZXQobW0sIGFkZHIpOwogCWlmIChwZ2QpIHsK
LQkJcHVkID0gcHVkX2FsbG9jKG1tLCBwZ2QsIGFkZHIpOwotCQlpZiAocHVkKSB7Ci0JCQlwbWQg
PSBwbWRfYWxsb2MobW0sIHB1ZCwgYWRkcik7Ci0JCQlpZiAocG1kKQotCQkJCXB0ZSA9IHB0ZV9h
bGxvY19tYXAobW0sIHBtZCwgYWRkcik7CisJCXA0ZCA9IHA0ZF9hbGxvYyhtbSwgcGdkLCBhZGRy
KTsKKwkJaWYgKHA0ZCkgeworCQkJcHVkID0gcHVkX2FsbG9jKG1tLCBwNGQsIGFkZHIpOworCQkJ
aWYgKHB1ZCkgeworCQkJCXBtZCA9IHBtZF9hbGxvYyhtbSwgcHVkLCBhZGRyKTsKKwkJCQlpZiAo
cG1kKQorCQkJCQlwdGUgPSBwdGVfYWxsb2NfbWFwKG1tLCBwbWQsIGFkZHIpOworCQkJfQogCQl9
CiAJfQogCkBAIC00NywxNyArNTEsMjEgQEAgcHRlX3QgKmh1Z2VfcHRlX29mZnNldChzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwKIAkJICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9u
ZyBzeikKIHsKIAlwZ2RfdCAqcGdkOworCXA0ZF90ICpwNGQ7CiAJcHVkX3QgKnB1ZDsKIAlwbWRf
dCAqcG1kOwogCXB0ZV90ICpwdGUgPSBOVUxMOwogCiAJcGdkID0gcGdkX29mZnNldChtbSwgYWRk
cik7CiAJaWYgKHBnZCkgewotCQlwdWQgPSBwdWRfb2Zmc2V0KHBnZCwgYWRkcik7Ci0JCWlmIChw
dWQpIHsKLQkJCXBtZCA9IHBtZF9vZmZzZXQocHVkLCBhZGRyKTsKLQkJCWlmIChwbWQpCi0JCQkJ
cHRlID0gcHRlX29mZnNldF9tYXAocG1kLCBhZGRyKTsKKwkJcDRkID0gcDRkX29mZnNldChwZ2Qs
IGFkZHIpOworCQlpZiAocDRkKSB7CisJCQlwdWQgPSBwdWRfb2Zmc2V0KHA0ZCwgYWRkcik7CisJ
CQlpZiAocHVkKSB7CisJCQkJcG1kID0gcG1kX29mZnNldChwdWQsIGFkZHIpOworCQkJCWlmIChw
bWQpCisJCQkJCXB0ZSA9IHB0ZV9vZmZzZXRfbWFwKHBtZCwgYWRkcik7CisJCQl9CiAJCX0KIAl9
CiAKZGlmZiAtLWdpdCBhL2FyY2gvc2gvbW0vaW5pdC5jIGIvYXJjaC9zaC9tbS9pbml0LmMKaW5k
ZXggZjQ0NWJhNjMwNzkwLi42MGMzM2NmN2FjZDEgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvbW0vaW5p
dC5jCisrKyBiL2FyY2gvc2gvbW0vaW5pdC5jCkBAIC00NSw2ICs0NSw3IEBAIHZvaWQgX19pbml0
IF9fd2VhayBwbGF0X21lbV9zZXR1cCh2b2lkKQogc3RhdGljIHB0ZV90ICpfX2dldF9wdGVfcGh5
cyh1bnNpZ25lZCBsb25nIGFkZHIpCiB7CiAJcGdkX3QgKnBnZDsKKwlwNGRfdCAqcDRkOwogCXB1
ZF90ICpwdWQ7CiAJcG1kX3QgKnBtZDsKIApAQCAtNTQsNyArNTUsMTMgQEAgc3RhdGljIHB0ZV90
ICpfX2dldF9wdGVfcGh5cyh1bnNpZ25lZCBsb25nIGFkZHIpCiAJCXJldHVybiBOVUxMOwogCX0K
IAotCXB1ZCA9IHB1ZF9hbGxvYyhOVUxMLCBwZ2QsIGFkZHIpOworCXA0ZCA9IHA0ZF9hbGxvYyhO
VUxMLCBwZ2QsIGFkZHIpOworCWlmICh1bmxpa2VseSghcDRkKSkgeworCQlwNGRfRVJST1IoKnA0
ZCk7CisJCXJldHVybiBOVUxMOworCX0KKworCXB1ZCA9IHB1ZF9hbGxvYyhOVUxMLCBwNGQsIGFk
ZHIpOwogCWlmICh1bmxpa2VseSghcHVkKSkgewogCQlwdWRfRVJST1IoKnB1ZCk7CiAJCXJldHVy
biBOVUxMOwpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9tbS9rbWFwLmMgYi9hcmNoL3NoL21tL2ttYXAu
YwppbmRleCA5ZTZiMzhiMDNjZjcuLjBlNzAzOTEzN2Y1YSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9t
bS9rbWFwLmMKKysrIGIvYXJjaC9zaC9tbS9rbWFwLmMKQEAgLTE1LDcgKzE1LDcgQEAKICNpbmNs
dWRlIDxhc20vY2FjaGVmbHVzaC5oPgogCiAjZGVmaW5lIGttYXBfZ2V0X2ZpeG1hcF9wdGUodmFk
ZHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLQlwdGVfb2Zmc2V0X2tl
cm5lbChwbWRfb2Zmc2V0KHB1ZF9vZmZzZXQocGdkX29mZnNldF9rKHZhZGRyKSwgKHZhZGRyKSks
ICh2YWRkcikpLCAodmFkZHIpKQorCXB0ZV9vZmZzZXRfa2VybmVsKHBtZF9vZmZzZXQocHVkX29m
ZnNldChwNGRfb2Zmc2V0KHBnZF9vZmZzZXRfayh2YWRkciksICh2YWRkcikpLCAodmFkZHIpKSwg
KHZhZGRyKSksIHZhZGRyKQogCiBzdGF0aWMgcHRlX3QgKmttYXBfY29oZXJlbnRfcHRlOwogCmRp
ZmYgLS1naXQgYS9hcmNoL3NoL21tL3RsYmV4XzMyLmMgYi9hcmNoL3NoL21tL3RsYmV4XzMyLmMK
aW5kZXggMzgyMjYyZGMwYzRiLi4xYzUzODY4NjMyZWUgMTAwNjQ0Ci0tLSBhL2FyY2gvc2gvbW0v
dGxiZXhfMzIuYworKysgYi9hcmNoL3NoL21tL3RsYmV4XzMyLmMKQEAgLTIzLDYgKzIzLDcgQEAg
aGFuZGxlX3RsYm1pc3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXJyb3Jf
Y29kZSwKIAkgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQogewogCXBnZF90ICpwZ2Q7CisJ
cDRkX3QgKnA0ZDsKIAlwdWRfdCAqcHVkOwogCXBtZF90ICpwbWQ7CiAJcHRlX3QgKnB0ZTsKQEAg
LTQyLDcgKzQzLDEwIEBAIGhhbmRsZV90bGJtaXNzKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNp
Z25lZCBsb25nIGVycm9yX2NvZGUsCiAJCXBnZCA9IHBnZF9vZmZzZXQoY3VycmVudC0+bW0sIGFk
ZHJlc3MpOwogCX0KIAotCXB1ZCA9IHB1ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsKKwlwNGQgPSBw
NGRfb2Zmc2V0KHBnZCwgYWRkcmVzcyk7CisJaWYgKHA0ZF9ub25lX29yX2NsZWFyX2JhZChwNGQp
KQorCQlyZXR1cm4gMTsKKwlwdWQgPSBwdWRfb2Zmc2V0KHA0ZCwgYWRkcmVzcyk7CiAJaWYgKHB1
ZF9ub25lX29yX2NsZWFyX2JhZChwdWQpKQogCQlyZXR1cm4gMTsKIAlwbWQgPSBwbWRfb2Zmc2V0
KHB1ZCwgYWRkcmVzcyk7CmRpZmYgLS1naXQgYS9hcmNoL3NoL21tL3RsYmV4XzY0LmMgYi9hcmNo
L3NoL21tL3RsYmV4XzY0LmMKaW5kZXggOGZmOTY2ZGQwYzc0Li4wZDAxNWY3NTU2ZmEgMTAwNjQ0
Ci0tLSBhL2FyY2gvc2gvbW0vdGxiZXhfNjQuYworKysgYi9hcmNoL3NoL21tL3RsYmV4XzY0LmMK
QEAgLTQ0LDYgKzQ0LDcgQEAgc3RhdGljIGludCBoYW5kbGVfdGxibWlzcyh1bnNpZ25lZCBsb25n
IGxvbmcgcHJvdGVjdGlvbl9mbGFncywKIAkJCSAgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQogewog
CXBnZF90ICpwZ2Q7CisJcDRkX3QgKnA0ZDsKIAlwdWRfdCAqcHVkOwogCXBtZF90ICpwbWQ7CiAJ
cHRlX3QgKnB0ZTsKQEAgLTU4LDcgKzU5LDExIEBAIHN0YXRpYyBpbnQgaGFuZGxlX3RsYm1pc3Mo
dW5zaWduZWQgbG9uZyBsb25nIHByb3RlY3Rpb25fZmxhZ3MsCiAJCXBnZCA9IHBnZF9vZmZzZXQo
Y3VycmVudC0+bW0sIGFkZHJlc3MpOwogCX0KIAotCXB1ZCA9IHB1ZF9vZmZzZXQocGdkLCBhZGRy
ZXNzKTsKKwlwNGQgPSBwNGRfb2Zmc2V0KHBnZCwgYWRkcmVzcyk7CisJaWYgKHA0ZF9ub25lKCpw
NGQpIHx8ICFwNGRfcHJlc2VudCgqcDRkKSkKKwkJcmV0dXJuIDE7CisKKwlwdWQgPSBwdWRfb2Zm
c2V0KHA0ZCwgYWRkcmVzcyk7CiAJaWYgKHB1ZF9ub25lKCpwdWQpIHx8ICFwdWRfcHJlc2VudCgq
cHVkKSkKIAkJcmV0dXJuIDE7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

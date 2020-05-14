Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 96A421E502B
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 35DE920CA9;
	Wed, 27 May 2020 23:19:20 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4C24020A70
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 19:04:50 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36882206DC;
 Thu, 14 May 2020 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475889;
 bh=r0qA/m8aho5QyEwejC1WCC2ZRpWujFeBiVtRKwhabXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=atU5KbtJo1kgAvUKoSINwMB2SL+dOQJWNe4IlACMJxiJjl1WTuTl5iJ8m7MJnDyDw
 yxqD4xol3vTEUeqZo9MScwPsvWVMwy41lZ8rhAggIH8mQxL2GjjB5raD85BOM6tp4T
 INcD3dphNVZz3l0pngaw55A8PjFOkxbgN2/us6P4=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 14 May 2020 20:03:19 +0300
Message-Id: <20200514170327.31389-5-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH v2 04/12] csky: replace definitions of
 __pXd_offset() with pXd_index()
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
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-csky@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKQWxsIGFyY2hpdGVjdHVy
ZXMgdXNlIHBYZF9pbmRleCgpIHRvIGdldCBhbiBlbnRyeSBpbiB0aGUgcGFnZSB0YWJsZSBwYWdl
CmNvcnJlc3BvbmRpbmcgdG8gYSB2aXJ0dWFsIGFkZHJlc3MuCgpBbGlnbiBjc2t5IHdpdGggb3Ro
ZXIgYXJjaGl0ZWN0dXJlcy4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGlu
dXguaWJtLmNvbT4KLS0tCiBhcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgNSArKy0t
LQogYXJjaC9jc2t5L21tL2ZhdWx0LmMgICAgICAgICAgICB8IDIgKy0KIGFyY2gvY3NreS9tbS9o
aWdobWVtLmMgICAgICAgICAgfCAyICstCiBhcmNoL2Nza3kvbW0vaW5pdC5jICAgICAgICAgICAg
IHwgNiArKystLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNo
L2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IDlkMmQxNmRiMjM3ZC4uMmVmZjRhZWE1
MWIzIDEwMDY0NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2Fy
Y2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTIyOSw5ICsyMjksOCBAQCBzdGF0aWMg
aW5saW5lIHB0ZV90IHB0ZV9ta3lvdW5nKHB0ZV90IHB0ZSkKIAlyZXR1cm4gcHRlOwogfQogCi0j
ZGVmaW5lIF9fcGdkX29mZnNldChhZGRyZXNzKQlwZ2RfaW5kZXgoYWRkcmVzcykKLSNkZWZpbmUg
X19wdWRfb2Zmc2V0KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBVRF9TSElGVCkgJiAoUFRSU19Q
RVJfUFVELTEpKQotI2RlZmluZSBfX3BtZF9vZmZzZXQoYWRkcmVzcykJKCgoYWRkcmVzcykgPj4g
UE1EX1NISUZUKSAmIChQVFJTX1BFUl9QTUQtMSkpCisjZGVmaW5lIHB1ZF9pbmRleChhZGRyZXNz
KQkoKChhZGRyZXNzKSA+PiBQVURfU0hJRlQpICYgKFBUUlNfUEVSX1BVRC0xKSkKKyNkZWZpbmUg
cG1kX2luZGV4KGFkZHJlc3MpCSgoKGFkZHJlc3MpID4+IFBNRF9TSElGVCkgJiAoUFRSU19QRVJf
UE1ELTEpKQogCiAvKiB0byBmaW5kIGFuIGVudHJ5IGluIGEga2VybmVsIHBhZ2UtdGFibGUtZGly
ZWN0b3J5ICovCiAjZGVmaW5lIHBnZF9vZmZzZXRfayhhZGRyZXNzKQlwZ2Rfb2Zmc2V0KCZpbml0
X21tLCBhZGRyZXNzKQpkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2ZhdWx0LmMgYi9hcmNoL2Nz
a3kvbW0vZmF1bHQuYwppbmRleCA0ZTZkYzY4ZjMyNTguLjQwNTVkNDMwYzBjOCAxMDA2NDQKLS0t
IGEvYXJjaC9jc2t5L21tL2ZhdWx0LmMKKysrIGIvYXJjaC9jc2t5L21tL2ZhdWx0LmMKQEAgLTc4
LDcgKzc4LDcgQEAgYXNtbGlua2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MsIHVuc2lnbmVkIGxvbmcgd3JpdGUsCiAJCSAqIERvIF9ub3RfIHVzZSAidHNrIiBoZXJl
LiBXZSBtaWdodCBiZSBpbnNpZGUKIAkJICogYW4gaW50ZXJydXB0IGluIHRoZSBtaWRkbGUgb2Yg
YSB0YXNrIHN3aXRjaC4uCiAJCSAqLwotCQlpbnQgb2Zmc2V0ID0gX19wZ2Rfb2Zmc2V0KGFkZHJl
c3MpOworCQlpbnQgb2Zmc2V0ID0gcGdkX2luZGV4KGFkZHJlc3MpOwogCQlwZ2RfdCAqcGdkLCAq
cGdkX2s7CiAJCXB1ZF90ICpwdWQsICpwdWRfazsKIAkJcG1kX3QgKnBtZCwgKnBtZF9rOwpkaWZm
IC0tZ2l0IGEvYXJjaC9jc2t5L21tL2hpZ2htZW0uYyBiL2FyY2gvY3NreS9tbS9oaWdobWVtLmMK
aW5kZXggM2IzZjYyMmY1YWU5Li44OWVjMzJlNjAyYTEgMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9t
bS9oaWdobWVtLmMKKysrIGIvYXJjaC9jc2t5L21tL2hpZ2htZW0uYwpAQCAtOTIsNyArOTIsNyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQga21hcF9wYWdlc19pbml0KHZvaWQpCiAJdmFkZHIgPSBQS01B
UF9CQVNFOwogCWZpeHJhbmdlX2luaXQodmFkZHIsIHZhZGRyICsgUEFHRV9TSVpFKkxBU1RfUEtN
QVAsIHN3YXBwZXJfcGdfZGlyKTsKIAotCXBnZCA9IHN3YXBwZXJfcGdfZGlyICsgX19wZ2Rfb2Zm
c2V0KHZhZGRyKTsKKwlwZ2QgPSBzd2FwcGVyX3BnX2RpciArIHBnZF9pbmRleCh2YWRkcik7CiAJ
cHVkID0gKHB1ZF90ICopcGdkOwogCXBtZCA9IHBtZF9vZmZzZXQocHVkLCB2YWRkcik7CiAJcHRl
ID0gcHRlX29mZnNldF9rZXJuZWwocG1kLCB2YWRkcik7CmRpZmYgLS1naXQgYS9hcmNoL2Nza3kv
bW0vaW5pdC5jIGIvYXJjaC9jc2t5L21tL2luaXQuYwppbmRleCBlZGEyYjQyOTE0ODUuLmFmNjI3
MTI4MzE0ZiAxMDA2NDQKLS0tIGEvYXJjaC9jc2t5L21tL2luaXQuYworKysgYi9hcmNoL2Nza3kv
bW0vaW5pdC5jCkBAIC0xNTcsOSArMTU3LDkgQEAgdm9pZCBfX2luaXQgZml4cmFuZ2VfaW5pdCh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKIAl1bnNpZ25lZCBsb25nIHZh
ZGRyOwogCiAJdmFkZHIgPSBzdGFydDsKLQlpID0gX19wZ2Rfb2Zmc2V0KHZhZGRyKTsKLQlqID0g
X19wdWRfb2Zmc2V0KHZhZGRyKTsKLQlrID0gX19wbWRfb2Zmc2V0KHZhZGRyKTsKKwlpID0gcGdk
X2luZGV4KHZhZGRyKTsKKwlqID0gcHVkX2luZGV4KHZhZGRyKTsKKwlrID0gcG1kX2luZGV4KHZh
ZGRyKTsKIAlwZ2QgPSBwZ2RfYmFzZSArIGk7CiAKIAlmb3IgKCA7IChpIDwgUFRSU19QRVJfUEdE
KSAmJiAodmFkZHIgIT0gZW5kKTsgcGdkKyssIGkrKykgewotLSAKMi4yNi4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

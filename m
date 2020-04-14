Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4EF91B20C3
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4BC2320AEF;
	Tue, 21 Apr 2020 10:02:04 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8079520A7F
 for <openrisc@lists.librecores.org>; Tue, 14 Apr 2020 17:37:17 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF1522085B;
 Tue, 14 Apr 2020 15:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878636;
 bh=y5upl5y5kDKcOZZTB6xnGHWCDtOJ5v9v3QvgjuKGYnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VU/LlyjuZjD2xgCfZA7m8dLQDTyPj28OI08DI540xTc3wP1fJsitV67hiVVil7eVJ
 aSNmRqUVKgNW+oW2T/ecAsUG7/P9Ym38a5dxBUPtF2JQyqCeN7tx/o7OYsA14TDjOD
 JatvJvEQqBS9dHMIx3mUATBkVLOVSm36w2YSGeaE=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 18:34:54 +0300
Message-Id: <20200414153455.21744-14-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH v4 13/14] asm-generic: remove pgtable-nop4d-hack.h
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKTm8gYXJjaGl0ZWN0dXJl
IGRlZmluZXMgX19BUkNIX1VTRV81TEVWRUxfSEFDSyBhbmQgdGhlcmVmb3JlCnBndGFibGUtbm9w
NGQtaGFjay5oIHdpbGwgYmUgbmV2ZXIgYWN0dWFsbHkgaW5jbHVkZWQuCgpSZW1vdmUgaXQuCgpT
aWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogaW5j
bHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcDRkLWhhY2suaCB8IDY0IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVkLmggICAgICB8ICA0
IC0tCiAyIGZpbGVzIGNoYW5nZWQsIDY4IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC1oYWNrLmgKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wNGQtaGFjay5oIGIvaW5jbHVkZS9hc20tZ2Vu
ZXJpYy9wZ3RhYmxlLW5vcDRkLWhhY2suaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
ODI5YmRiMGQ2MzI3Li4wMDAwMDAwMDAwMDAKLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3Rh
YmxlLW5vcDRkLWhhY2suaAorKysgL2Rldi9udWxsCkBAIC0xLDY0ICswLDAgQEAKLS8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCi0jaWZuZGVmIF9QR1RBQkxFX05PUDREX0hB
Q0tfSAotI2RlZmluZSBfUEdUQUJMRV9OT1A0RF9IQUNLX0gKLQotI2lmbmRlZiBfX0FTU0VNQkxZ
X18KLSNpbmNsdWRlIDxhc20tZ2VuZXJpYy81bGV2ZWwtZml4dXAuaD4KLQotI2RlZmluZSBfX1BB
R0VUQUJMRV9QVURfRk9MREVEIDEKLQotLyoKLSAqIEhhdmluZyB0aGUgcHVkIHR5cGUgY29uc2lz
dCBvZiBhIHBnZCBnZXRzIHRoZSBzaXplIHJpZ2h0LCBhbmQgYWxsb3dzCi0gKiB1cyB0byBjb25j
ZXB0dWFsbHkgYWNjZXNzIHRoZSBwZ2QgZW50cnkgdGhhdCB0aGlzIHB1ZCBpcyBmb2xkZWQgaW50
bwotICogd2l0aG91dCBjYXN0aW5nLgotICovCi10eXBlZGVmIHN0cnVjdCB7IHBnZF90IHBnZDsg
fSBwdWRfdDsKLQotI2RlZmluZSBQVURfU0hJRlQJUEdESVJfU0hJRlQKLSNkZWZpbmUgUFRSU19Q
RVJfUFVECTEKLSNkZWZpbmUgUFVEX1NJWkUJKDFVTCA8PCBQVURfU0hJRlQpCi0jZGVmaW5lIFBV
RF9NQVNLCSh+KFBVRF9TSVpFLTEpKQotCi0vKgotICogVGhlICJwZ2RfeHh4KCkiIGZ1bmN0aW9u
cyBoZXJlIGFyZSB0cml2aWFsIGZvciBhIGZvbGRlZCB0d28tbGV2ZWwKLSAqIHNldHVwOiB0aGUg
cHVkIGlzIG5ldmVyIGJhZCwgYW5kIGEgcHVkIGFsd2F5cyBleGlzdHMgKGFzIGl0J3MgZm9sZGVk
Ci0gKiBpbnRvIHRoZSBwZ2QgZW50cnkpCi0gKi8KLXN0YXRpYyBpbmxpbmUgaW50IHBnZF9ub25l
KHBnZF90IHBnZCkJCXsgcmV0dXJuIDA7IH0KLXN0YXRpYyBpbmxpbmUgaW50IHBnZF9iYWQocGdk
X3QgcGdkKQkJeyByZXR1cm4gMDsgfQotc3RhdGljIGlubGluZSBpbnQgcGdkX3ByZXNlbnQocGdk
X3QgcGdkKQl7IHJldHVybiAxOyB9Ci1zdGF0aWMgaW5saW5lIHZvaWQgcGdkX2NsZWFyKHBnZF90
ICpwZ2QpCXsgfQotI2RlZmluZSBwdWRfRVJST1IocHVkKQkJCQkocGdkX0VSUk9SKChwdWQpLnBn
ZCkpCi0KLSNkZWZpbmUgcGdkX3BvcHVsYXRlKG1tLCBwZ2QsIHB1ZCkJCWRvIHsgfSB3aGlsZSAo
MCkKLSNkZWZpbmUgcGdkX3BvcHVsYXRlX3NhZmUobW0sIHBnZCwgcHVkKQkJZG8geyB9IHdoaWxl
ICgwKQotLyoKLSAqIChwdWRzIGFyZSBmb2xkZWQgaW50byBwZ2RzIHNvIHRoaXMgZG9lc24ndCBn
ZXQgYWN0dWFsbHkgY2FsbGVkLAotICogYnV0IHRoZSBkZWZpbmUgaXMgbmVlZGVkIGZvciBhIGdl
bmVyaWMgaW5saW5lIGZ1bmN0aW9uLikKLSAqLwotI2RlZmluZSBzZXRfcGdkKHBnZHB0ciwgcGdk
dmFsKQlzZXRfcHVkKChwdWRfdCAqKShwZ2RwdHIpLCAocHVkX3QpIHsgcGdkdmFsIH0pCi0KLXN0
YXRpYyBpbmxpbmUgcHVkX3QgKnB1ZF9vZmZzZXQocGdkX3QgKnBnZCwgdW5zaWduZWQgbG9uZyBh
ZGRyZXNzKQotewotCXJldHVybiAocHVkX3QgKilwZ2Q7Ci19Ci0KLSNkZWZpbmUgcHVkX3ZhbCh4
KQkJCQkocGdkX3ZhbCgoeCkucGdkKSkKLSNkZWZpbmUgX19wdWQoeCkJCQkJKChwdWRfdCkgeyBf
X3BnZCh4KSB9KQotCi0jZGVmaW5lIHBnZF9wYWdlKHBnZCkJCQkJKHB1ZF9wYWdlKChwdWRfdCl7
IHBnZCB9KSkKLSNkZWZpbmUgcGdkX3BhZ2VfdmFkZHIocGdkKQkJCShwdWRfcGFnZV92YWRkcigo
cHVkX3QpeyBwZ2QgfSkpCi0KLS8qCi0gKiBhbGxvY2F0aW5nIGFuZCBmcmVlaW5nIGEgcHVkIGlz
IHRyaXZpYWw6IHRoZSAxLWVudHJ5IHB1ZCBpcwotICogaW5zaWRlIHRoZSBwZ2QsIHNvIGhhcyBu
byBleHRyYSBtZW1vcnkgYXNzb2NpYXRlZCB3aXRoIGl0LgotICovCi0jZGVmaW5lIHB1ZF9hbGxv
Y19vbmUobW0sIGFkZHJlc3MpCQlOVUxMCi0jZGVmaW5lIHB1ZF9mcmVlKG1tLCB4KQkJCQlkbyB7
IH0gd2hpbGUgKDApCi0jZGVmaW5lIF9fcHVkX2ZyZWVfdGxiKHRsYiwgeCwgYSkJCWRvIHsgfSB3
aGlsZSAoMCkKLQotI3VuZGVmICBwdWRfYWRkcl9lbmQKLSNkZWZpbmUgcHVkX2FkZHJfZW5kKGFk
ZHIsIGVuZCkJCQkoZW5kKQotCi0jZW5kaWYgLyogX19BU1NFTUJMWV9fICovCi0jZW5kaWYgLyog
X1BHVEFCTEVfTk9QNERfSEFDS19IICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmlj
L3BndGFibGUtbm9wdWQuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3B1ZC5oCmlu
ZGV4IGQzNzc2Y2I0OTRjMC4uYWQwNWMxNjg0YmZjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1n
ZW5lcmljL3BndGFibGUtbm9wdWQuaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUt
bm9wdWQuaApAQCAtNCw5ICs0LDYgQEAKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAotI2lmZGVm
IF9fQVJDSF9VU0VfNUxFVkVMX0hBQ0sKLSNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZ3RhYmxlLW5v
cDRkLWhhY2suaD4KLSNlbHNlCiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC5o
PgogCiAjZGVmaW5lIF9fUEFHRVRBQkxFX1BVRF9GT0xERUQgMQpAQCAtNjUsNSArNjIsNCBAQCBz
dGF0aWMgaW5saW5lIHB1ZF90ICpwdWRfb2Zmc2V0KHA0ZF90ICpwNGQsIHVuc2lnbmVkIGxvbmcg
YWRkcmVzcykKICNkZWZpbmUgcHVkX2FkZHJfZW5kKGFkZHIsIGVuZCkJCQkoZW5kKQogCiAjZW5k
aWYgLyogX19BU1NFTUJMWV9fICovCi0jZW5kaWYgLyogIV9fQVJDSF9VU0VfNUxFVkVMX0hBQ0sg
Ki8KICNlbmRpZiAvKiBfUEdUQUJMRV9OT1BVRF9IICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

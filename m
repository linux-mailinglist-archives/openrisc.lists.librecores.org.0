Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5521217177A
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2F7D7209E7;
	Thu, 27 Feb 2020 13:35:49 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 224A82097B
 for <openrisc@lists.librecores.org>; Thu, 27 Feb 2020 09:49:26 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E0F324683;
 Thu, 27 Feb 2020 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582793364;
 bh=d6JASArDTC2YfUmrU9XUpiTM3xImoHt6h/h+S4gwbKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0x1SYOFRdLAqiutbk8dXzSYLqNK4ETW4iJYOWrtI8+trt2hNpAQQSkNNThvHytoHK
 sbrR13MAdpcaucxR0egMp+nacxwn7Jj7scMmKl0+W2M2EN14rTs9zMxDRW8QM5580x
 98Tecr/imFBp2kLO33ktoryGWwg8fo5MsC/0AYHc=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Feb 2020 10:46:01 +0200
Message-Id: <20200227084608.18223-8-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200227084608.18223-1-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH v3 07/14] powerpc/32: drop get_pteptr()
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

RnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+CgpDb21taXQg
OGQzMGMxNGNhYjMwICgicG93ZXJwYy9tbTogUmV3b3JrIEkkL0QkIGNvaGVyZW5jeSAodjMpIikg
YW5kCmNvbW1pdCA5MGFjMTlhOGIyMWIgKCJbUE9XRVJQQ10gQWJvbGlzaCBpb3BhKCksIG1tX3B0
b3YoKSwKaW9fYmxvY2tfbWFwcGluZygpIGZyb20gYXJjaC9wb3dlcnBjIikgcmVtb3ZlZCB0aGUg
dXNlIG9mIGdldF9wdGVwdHIoKQpvdXRzaWRlIG9mIG1tL3BndGFibGVfMzIuYwoKSW4gbW0vcGd0
YWJsZV8zMi5jLCB0aGUgb25seSB1c2VyIG9mIGdldF9wdGVwdHIoKSBpcyBfX2NoYW5nZV9wYWdl
X2F0dHIoKQp3aGljaCBvcGVyYXRlcyBvbiBrZXJuZWwgY29udGV4dCBhbmQgb24gbG93bWVtIHBh
Z2VzIG9ubHkuCgpNb3ZlIHBhZ2UgdGFibGUgdHJhdmVyc2FsIHRvIF9fY2hhbmdlX3BhZ2VfYXR0
cigpIGFuZCBkcm9wIGdldF9wdGVwdHIoKS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0
IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIuYyB8
IDQzICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL21tL3BndGFibGVfMzIuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlXzMyLmMKaW5kZXgg
NWZiOTBlZGQ4NjVlLi40ODk0NTU1NjIyZDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9w
Z3RhYmxlXzMyLmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIuYwpAQCAtMTIxLDUz
ICsxMjEsMjQgQEAgdm9pZCBfX2luaXQgbWFwaW5fcmFtKHZvaWQpCiAJfQogfQogCi0vKiBTY2Fu
IHRoZSByZWFsIExpbnV4IHBhZ2UgdGFibGVzIGFuZCByZXR1cm4gYSBQVEUgcG9pbnRlciBmb3IK
LSAqIGEgdmlydHVhbCBhZGRyZXNzIGluIGEgY29udGV4dC4KLSAqIFJldHVybnMgdHJ1ZSAoMSkg
aWYgUFRFIHdhcyBmb3VuZCwgemVybyBvdGhlcndpc2UuICBUaGUgcG9pbnRlciB0bwotICogdGhl
IFBURSBwb2ludGVyIGlzIHVubW9kaWZpZWQgaWYgUFRFIGlzIG5vdCBmb3VuZC4KLSAqLwotc3Rh
dGljIGludAotZ2V0X3B0ZXB0cihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyLCBwdGVfdCAqKnB0ZXAsIHBtZF90ICoqcG1kcCkKLXsKLSAgICAgICAgcGdkX3QJKnBnZDsK
LQlwdWRfdAkqcHVkOwotICAgICAgICBwbWRfdAkqcG1kOwotICAgICAgICBwdGVfdAkqcHRlOwot
ICAgICAgICBpbnQgICAgIHJldHZhbCA9IDA7Ci0KLSAgICAgICAgcGdkID0gcGdkX29mZnNldCht
bSwgYWRkciAmIFBBR0VfTUFTSyk7Ci0gICAgICAgIGlmIChwZ2QpIHsKLQkJcHVkID0gcHVkX29m
ZnNldChwZ2QsIGFkZHIgJiBQQUdFX01BU0spOwotCQlpZiAocHVkICYmIHB1ZF9wcmVzZW50KCpw
dWQpKSB7Ci0JCQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkciAmIFBBR0VfTUFTSyk7Ci0JCQlp
ZiAocG1kX3ByZXNlbnQoKnBtZCkpIHsKLQkJCQlwdGUgPSBwdGVfb2Zmc2V0X21hcChwbWQsIGFk
ZHIgJiBQQUdFX01BU0spOwotCQkJCWlmIChwdGUpIHsKLQkJCQkJcmV0dmFsID0gMTsKLQkJCQkJ
KnB0ZXAgPSBwdGU7Ci0JCQkJCWlmIChwbWRwKQotCQkJCQkJKnBtZHAgPSBwbWQ7Ci0JCQkJCS8q
IFhYWCBjYWxsZXIgbmVlZHMgdG8gZG8gcHRlX3VubWFwLCB5dWNrICovCi0JCQkJfQotCQkJfQot
CQl9Ci0gICAgICAgIH0KLSAgICAgICAgcmV0dXJuKHJldHZhbCk7Ci19Ci0KIHN0YXRpYyBpbnQg
X19jaGFuZ2VfcGFnZV9hdHRyX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHBncHJvdF90IHBy
b3QpCiB7CiAJcHRlX3QgKmtwdGU7CiAJcG1kX3QgKmtwbWQ7Ci0JdW5zaWduZWQgbG9uZyBhZGRy
ZXNzOworCXVuc2lnbmVkIGxvbmcgYWRkcmVzcywgdmE7CiAKIAlCVUdfT04oUGFnZUhpZ2hNZW0o
cGFnZSkpOwogCWFkZHJlc3MgPSAodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSk7CisJ
dmEgPSBhZGRyZXNzICYgUEFHRV9NQVNLOwogCiAJaWYgKHZfYmxvY2tfbWFwcGVkKGFkZHJlc3Mp
KQogCQlyZXR1cm4gMDsKLQlpZiAoIWdldF9wdGVwdHIoJmluaXRfbW0sIGFkZHJlc3MsICZrcHRl
LCAma3BtZCkpCisKKwlrcG1kID0gcG1kX29mZnNldChwdWRfb2Zmc2V0KHBnZF9vZmZzZXRfayh2
YSksIHZhKSwgdmEpOworCWlmICghcG1kX3ByZXNlbnQoKmtwbWQpKQogCQlyZXR1cm4gLUVJTlZB
TDsKKworCWtwdGUgPSBwdGVfb2Zmc2V0X21hcChrcG1kLCB2YSk7CiAJX19zZXRfcHRlX2F0KCZp
bml0X21tLCBhZGRyZXNzLCBrcHRlLCBta19wdGUocGFnZSwgcHJvdCksIDApOwogCXB0ZV91bm1h
cChrcHRlKTsKIAotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

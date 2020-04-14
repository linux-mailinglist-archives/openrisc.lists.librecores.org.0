Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9BD1B20BB
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:02:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 67B0B202B0;
	Tue, 21 Apr 2020 10:02:02 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 0EAD620A73
 for <openrisc@lists.librecores.org>; Tue, 14 Apr 2020 17:36:38 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C03320678;
 Tue, 14 Apr 2020 15:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878596;
 bh=ybPPvADQAq307A0mTIfstOnJj2n8fbsD+ITheeuQdo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t/yCmpCcn8sCzGMmKhQcslmtaEsbx0+I+UZtglQV6ojnIQromBlhZlaLBILJGAd6y
 4Vn8iZPrK0sW8k+OougefKf9e1ZgbFEiDkY2u2fJZMlwXYYyOiu+omc8hiEdMujXQD
 1OSJEg4mIUApPR9xNP/PjDEgG9IK6jvSzBnwpCpg=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 18:34:50 +0300
Message-Id: <20200414153455.21744-10-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH v4 09/14] sh: fault: Modernize printing of kernel
 messages
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

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCiAgLSBD
b252ZXJ0IGZyb20gcHJpbnRrKCkgdG8gcHJfKigpLAogIC0gQWRkIG1pc3NpbmcgY29udGludWF0
aW9ucywKICAtIFVzZSAiJWxseCIgdG8gZm9ybWF0IHU2NCwKICAtIEpvaW4gbXVsdGlwbGUgcHJp
bnRzIGluIHNob3dfZmF1bHRfb29wcygpIGludG8gYSBzaW5nbGUgcHJpbnQuCgpTaWduZWQtb2Zm
LWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9zaC9t
bS9mYXVsdC5jIHwgMzkgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9zaC9tbS9mYXVsdC5jIGIvYXJjaC9zaC9tbS9mYXVsdC5jCmluZGV4IDVmMjNk
NzkwNzU5Ny4uN2I3NGUxOGI3MWQ3IDEwMDY0NAotLS0gYS9hcmNoL3NoL21tL2ZhdWx0LmMKKysr
IGIvYXJjaC9zaC9tbS9mYXVsdC5jCkBAIC00NywxMCArNDcsMTAgQEAgc3RhdGljIHZvaWQgc2hv
d19wdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcikKIAkJCXBnZCA9
IHN3YXBwZXJfcGdfZGlyOwogCX0KIAotCXByaW50ayhLRVJOX0FMRVJUICJwZ2QgPSAlcFxuIiwg
cGdkKTsKKwlwcl9hbGVydCgicGdkID0gJXBcbiIsIHBnZCk7CiAJcGdkICs9IHBnZF9pbmRleChh
ZGRyKTsKLQlwcmludGsoS0VSTl9BTEVSVCAiWyUwOGx4XSAqcGdkPSUwKkx4IiwgYWRkciwKLQkg
ICAgICAgKHUzMikoc2l6ZW9mKCpwZ2QpICogMiksICh1NjQpcGdkX3ZhbCgqcGdkKSk7CisJcHJf
YWxlcnQoIlslMDhseF0gKnBnZD0lMCpsbHgiLCBhZGRyLCAodTMyKShzaXplb2YoKnBnZCkgKiAy
KSwKKwkJICh1NjQpcGdkX3ZhbCgqcGdkKSk7CiAKIAlkbyB7CiAJCXB1ZF90ICpwdWQ7CkBAIC02
MSwzMyArNjEsMzMgQEAgc3RhdGljIHZvaWQgc2hvd19wdGUoc3RydWN0IG1tX3N0cnVjdCAqbW0s
IHVuc2lnbmVkIGxvbmcgYWRkcikKIAkJCWJyZWFrOwogCiAJCWlmIChwZ2RfYmFkKCpwZ2QpKSB7
Ci0JCQlwcmludGsoIihiYWQpIik7CisJCQlwcl9jb250KCIoYmFkKSIpOwogCQkJYnJlYWs7CiAJ
CX0KIAogCQlwdWQgPSBwdWRfb2Zmc2V0KHBnZCwgYWRkcik7CiAJCWlmIChQVFJTX1BFUl9QVUQg
IT0gMSkKLQkJCXByaW50aygiLCAqcHVkPSUwKkx4IiwgKHUzMikoc2l6ZW9mKCpwdWQpICogMiks
Ci0JCQkgICAgICAgKHU2NClwdWRfdmFsKCpwdWQpKTsKKwkJCXByX2NvbnQoIiwgKnB1ZD0lMCps
bHgiLCAodTMyKShzaXplb2YoKnB1ZCkgKiAyKSwKKwkJCQkodTY0KXB1ZF92YWwoKnB1ZCkpOwog
CiAJCWlmIChwdWRfbm9uZSgqcHVkKSkKIAkJCWJyZWFrOwogCiAJCWlmIChwdWRfYmFkKCpwdWQp
KSB7Ci0JCQlwcmludGsoIihiYWQpIik7CisJCQlwcl9jb250KCIoYmFkKSIpOwogCQkJYnJlYWs7
CiAJCX0KIAogCQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcik7CiAJCWlmIChQVFJTX1BFUl9Q
TUQgIT0gMSkKLQkJCXByaW50aygiLCAqcG1kPSUwKkx4IiwgKHUzMikoc2l6ZW9mKCpwbWQpICog
MiksCi0JCQkgICAgICAgKHU2NClwbWRfdmFsKCpwbWQpKTsKKwkJCXByX2NvbnQoIiwgKnBtZD0l
MCpsbHgiLCAodTMyKShzaXplb2YoKnBtZCkgKiAyKSwKKwkJCQkodTY0KXBtZF92YWwoKnBtZCkp
OwogCiAJCWlmIChwbWRfbm9uZSgqcG1kKSkKIAkJCWJyZWFrOwogCiAJCWlmIChwbWRfYmFkKCpw
bWQpKSB7Ci0JCQlwcmludGsoIihiYWQpIik7CisJCQlwcl9jb250KCIoYmFkKSIpOwogCQkJYnJl
YWs7CiAJCX0KIApAQCAtOTYsMTEgKzk2LDExIEBAIHN0YXRpYyB2b2lkIHNob3dfcHRlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIpCiAJCQlicmVhazsKIAogCQlwdGUg
PSBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIGFkZHIpOwotCQlwcmludGsoIiwgKnB0ZT0lMCpMeCIs
ICh1MzIpKHNpemVvZigqcHRlKSAqIDIpLAotCQkgICAgICAgKHU2NClwdGVfdmFsKCpwdGUpKTsK
KwkJcHJfY29udCgiLCAqcHRlPSUwKmxseCIsICh1MzIpKHNpemVvZigqcHRlKSAqIDIpLAorCQkJ
KHU2NClwdGVfdmFsKCpwdGUpKTsKIAl9IHdoaWxlICgwKTsKIAotCXByaW50aygiXG4iKTsKKwlw
cl9jb250KCJcbiIpOwogfQogCiBzdGF0aWMgaW5saW5lIHBtZF90ICp2bWFsbG9jX3N5bmNfb25l
KHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgYWRkcmVzcykKQEAgLTE4OCwxNCArMTg4LDExIEBA
IHNob3dfZmF1bHRfb29wcyhzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRy
ZXNzKQogCWlmICghb29wc19tYXlfcHJpbnQoKSkKIAkJcmV0dXJuOwogCi0JcHJpbnRrKEtFUk5f
QUxFUlQgIkJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgIik7Ci0JaWYgKGFkZHJlc3MgPCBQ
QUdFX1NJWkUpCi0JCXByaW50ayhLRVJOX0NPTlQgIk5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSIp
OwotCWVsc2UKLQkJcHJpbnRrKEtFUk5fQ09OVCAicGFnaW5nIHJlcXVlc3QiKTsKLQotCXByaW50
ayhLRVJOX0NPTlQgIiBhdCAlMDhseFxuIiwgYWRkcmVzcyk7Ci0JcHJpbnRrKEtFUk5fQUxFUlQg
IlBDOiIpOworCXByX2FsZXJ0KCJCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsICVzIGF0ICUw
OGx4XG4iLAorCQkgYWRkcmVzcyA8IFBBR0VfU0laRSA/ICJOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UiCisJCQkJICAgICA6ICJwYWdpbmcgcmVxdWVzdCIsCisJCSBhZGRyZXNzKTsKKwlwcl9hbGVy
dCgiUEM6Iik7CiAJcHJpbnRrX2FkZHJlc3MocmVncy0+cGMsIDEpOwogCiAJc2hvd19wdGUoTlVM
TCwgYWRkcmVzcyk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

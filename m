Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 449B5163128
	for <lists+openrisc@lfdr.de>; Tue, 18 Feb 2020 21:00:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AE5FC2035D;
	Tue, 18 Feb 2020 21:00:24 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1528C2091A
 for <openrisc@lists.librecores.org>; Sun, 16 Feb 2020 09:19:16 +0100 (CET)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 307B924649;
 Sun, 16 Feb 2020 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581841154;
 bh=4sQuAppJ9V8uQLBiWjuxN6eOuFTm+NWRpi38gIPMGaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IrGzuxCA83oW5cfkOQW52qTCQfOb6o9wxjHpc3wOuyz4EK2kMGqIUugemS+6YI4BO
 V3FyRmzLm47eolAh1sBEeZ4pMx8QjAHnGXET3Fp7oLSet5xZdlNokN0IZY1S1YV/J/
 v4ptml2vFK1l6zTGw2jXz8ycZs4NLPGZ6CY+3Gu8=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 16 Feb 2020 10:18:32 +0200
Message-Id: <20200216081843.28670-3-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200216081843.28670-1-rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Feb 2020 21:00:15 +0100
Subject: [OpenRISC] [PATCH v2 02/13] h8300: remove usage of
 __ARCH_USE_5LEVEL_HACK
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKaDgzMDAgaXMgYSBub21t
dSBhcmNoaXRlY3R1cmUgYW5kIGRvZXMgbm90IHJlcXVpcmUgZml4dXAgZm9yIHVwcGVyIGxheWVy
cwpvZiB0aGUgcGFnZSB0YWJsZXMgYmVjYXVzZSBpdCBpcyBhbHJlYWR5IGhhbmRsZWQgYnkgdGhl
IGdlbmVyaWMgbm9tbXUKaW1wbGVtZW50YXRpb24uCgpSZW1vdmUgZGVmaW5pdGlvbiBvZiBfX0FS
Q0hfVVNFXzVMRVZFTF9IQUNLIGluCmFyY2gvaDgzMDAvaW5jbHVkZS9hc20vcGd0YWJsZS5oCgpT
aWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJj
aC9oODMwMC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9oODMwMC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
Yi9hcmNoL2g4MzAwL2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA0ZDAwMTUyZmFiNTguLmYw
MDgyODcyMGRjNCAxMDA2NDQKLS0tIGEvYXJjaC9oODMwMC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
KysrIGIvYXJjaC9oODMwMC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTEsNyArMSw2IEBACiAv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwogI2lmbmRlZiBfSDgzMDBfUEdU
QUJMRV9ICiAjZGVmaW5lIF9IODMwMF9QR1RBQkxFX0gKLSNkZWZpbmUgX19BUkNIX1VTRV81TEVW
RUxfSEFDSwogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BndGFibGUtbm9wdWQuaD4KICNpbmNsdWRl
IDxhc20tZ2VuZXJpYy9wZ3RhYmxlLmg+CiBleHRlcm4gdm9pZCBwYWdpbmdfaW5pdCh2b2lkKTsK
LS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

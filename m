Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A14D01B20B5
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5B8F720ADC;
	Tue, 21 Apr 2020 10:01:58 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 754A52086C
 for <openrisc@lists.librecores.org>; Tue, 14 Apr 2020 17:35:49 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2B5520678;
 Tue, 14 Apr 2020 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586878548;
 bh=fjzNG8yY02PqaaPTK2NNq2l5ac1RCQQHV+RmdqI+WGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2wC3fqEp/1PqxnTHVZQDHXtb7+s/YqCCMRzRarNF56wSkfQCe6bcorNIVmJmXspK8
 rVmSePjH6BEUwjpNRBNPOL5PGz3DxGRymzKy3+IJTXhJZm6XbWYIeeOApYaX4ccgp6
 +/OxzKWBnHWw9GeCqjGKUQB68qKI4eNKuJMdQrzM=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 18:34:45 +0300
Message-Id: <20200414153455.21744-5-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414153455.21744-1-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH v4 04/14] hexagon: remove __ARCH_USE_5LEVEL_HACK
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGhleGFnb24gYXJj
aGl0ZWN0dXJlIGhhcyAyIGxldmVsIHBhZ2UgdGFibGVzIGFuZCBhcyBzdWNoIG1vc3Qgb2YgdGhl
CnBhZ2UgdGFibGUgZm9sZGluZyBpcyBhbHJlYWR5IGltcGxlbWVudGVkIGluIGFzbS1nZW5lcmlj
L3BndGFibGUtbm9wbWQuaC4KCkZpeHVwIHRoZSBvbmx5IHBsYWNlIGluIGFyY2gvaGV4YWdvbiB0
byB1bmZvbGQgdGhlIHA0ZCBsZXZlbCBhbmQgcmVtb3ZlCl9fQVJDSF9VU0VfNUxFVkVMX0hBQ0su
CgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQog
YXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2ZpeG1hcC5oICB8IDQgKystLQogYXJjaC9oZXhhZ29u
L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9oZXhhZ29uL2luY2x1ZGUv
YXNtL2ZpeG1hcC5oIGIvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2ZpeG1hcC5oCmluZGV4IDkz
M2RhYzE2NzUwNC4uOTdiMWIwNjJlNzUwIDEwMDY0NAotLS0gYS9hcmNoL2hleGFnb24vaW5jbHVk
ZS9hc20vZml4bWFwLmgKKysrIGIvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2ZpeG1hcC5oCkBA
IC0xNiw3ICsxNiw3IEBACiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvZml4bWFwLmg+CiAKICNkZWZp
bmUga21hcF9nZXRfZml4bWFwX3B0ZSh2YWRkcikgXAotCXB0ZV9vZmZzZXRfa2VybmVsKHBtZF9v
ZmZzZXQocHVkX29mZnNldChwZ2Rfb2Zmc2V0X2sodmFkZHIpLCBcCi0JCQkJKHZhZGRyKSksICh2
YWRkcikpLCAodmFkZHIpKQorCXB0ZV9vZmZzZXRfa2VybmVsKHBtZF9vZmZzZXQocHVkX29mZnNl
dChwNGRfb2Zmc2V0KHBnZF9vZmZzZXRfayh2YWRkciksIFwKKwkJCQkodmFkZHIpKSwgKHZhZGRy
KSksICh2YWRkcikpLCAodmFkZHIpKQogCiAjZW5kaWYKZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdv
bi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL2hleGFnb24vaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCmluZGV4IGQzODNlOGJlYTViMi4uMmExN2Q0ZWIyZmE0IDEwMDY0NAotLS0gYS9hcmNoL2hl
eGFnb24vaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvaGV4YWdvbi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmgKQEAgLTEyLDcgKzEyLDYgQEAKICAqIFBhZ2UgdGFibGUgZGVmaW5pdGlvbnMg
Zm9yIFF1YWxjb21tIEhleGFnb24gcHJvY2Vzc29yLgogICovCiAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4KLSNkZWZpbmUgX19BUkNIX1VTRV81TEVWRUxfSEFDSwogI2luY2x1ZGUgPGFzbS1nZW5lcmlj
L3BndGFibGUtbm9wbWQuaD4KIAogLyogQSBoYW5keSB0aGluZyB0byBoYXZlIGlmIG9uZSBoYXMg
dGhlIFJBTS4gRGVjbGFyZWQgaW4gaGVhZC5TICovCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

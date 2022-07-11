Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8A28956D565
	for <lists+openrisc@lfdr.de>; Mon, 11 Jul 2022 09:07:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7342322126;
	Mon, 11 Jul 2022 09:07:37 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id CEE51205C5
 for <openrisc@lists.librecores.org>; Mon, 11 Jul 2022 09:07:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0CA71684;
 Mon, 11 Jul 2022 00:07:35 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.45.183])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DA3F3F70D;
 Mon, 11 Jul 2022 00:07:26 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V7 09/26] loongarch/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 11 Jul 2022 12:35:43 +0530
Message-Id: <20220711070600.2378316-10-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711070600.2378316-1-anshuman.khandual@arm.com>
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 christophe.leroy@csgroup.eu, hch@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
up a private and static protection_map[] array. Subsequently all __SXXX and
__PXXX macros can be dropped which are no longer needed.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/loongarch/Kconfig                    |  1 +
 arch/loongarch/include/asm/pgtable-bits.h | 19 ----------
 arch/loongarch/mm/cache.c                 | 46 +++++++++++++++++++++++
 3 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 53a912befb62..ed55abcc3dbd 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -9,6 +9,7 @@ config LOONGARCH
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
 	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 3badd112d9ab..9ca147a29bab 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -83,25 +83,6 @@
 				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_SUC)
 #define PAGE_KERNEL_WUC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
 				 _PAGE_GLOBAL | _PAGE_KERN |  _CACHE_WUC)
-
-#define __P000 __pgprot(_CACHE_CC | _PAGE_USER | _PAGE_PROTNONE | _PAGE_NO_EXEC | _PAGE_NO_READ)
-#define __P001 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P010 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P011 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __P100 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P101 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P110 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __P111 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-
-#define __S000 __pgprot(_CACHE_CC | _PAGE_USER | _PAGE_PROTNONE | _PAGE_NO_EXEC | _PAGE_NO_READ)
-#define __S001 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC)
-#define __S010 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE)
-#define __S011 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE)
-#define __S100 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __S101 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT)
-#define __S110 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_WRITE)
-#define __S111 __pgprot(_CACHE_CC | _PAGE_VALID | _PAGE_USER | _PAGE_PRESENT | _PAGE_WRITE)
-
 #ifndef __ASSEMBLY__
 
 #define pgprot_noncached pgprot_noncached
diff --git a/arch/loongarch/mm/cache.c b/arch/loongarch/mm/cache.c
index 9e5ce5aa73f7..e8c68dcf6ab2 100644
--- a/arch/loongarch/mm/cache.c
+++ b/arch/loongarch/mm/cache.c
@@ -139,3 +139,49 @@ void cpu_cache_init(void)
 
 	shm_align_mask = PAGE_SIZE - 1;
 }
+
+static const pgprot_t protection_map[16] = {
+	[VM_NONE]					= __pgprot(_CACHE_CC | _PAGE_USER |
+								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
+								   _PAGE_NO_READ),
+	[VM_READ]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_WRITE]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_WRITE | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_EXEC]					= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_WRITE]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_EXEC | VM_WRITE | VM_READ]			= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED]					= __pgprot(_CACHE_CC | _PAGE_USER |
+								   _PAGE_PROTNONE | _PAGE_NO_EXEC |
+								   _PAGE_NO_READ),
+	[VM_SHARED | VM_READ]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC),
+	[VM_SHARED | VM_WRITE]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC | _PAGE_WRITE),
+	[VM_SHARED | VM_WRITE | VM_READ]		= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_NO_EXEC | _PAGE_WRITE),
+	[VM_SHARED | VM_EXEC]				= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED | VM_EXEC | VM_READ]			= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT),
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_WRITE),
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __pgprot(_CACHE_CC | _PAGE_VALID |
+								   _PAGE_USER | _PAGE_PRESENT |
+								   _PAGE_WRITE)
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


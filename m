Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1E67A559054
	for <lists+openrisc@lfdr.de>; Fri, 24 Jun 2022 06:45:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EA211249F2;
	Fri, 24 Jun 2022 06:45:44 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 05D03249E7
 for <openrisc@lists.librecores.org>; Fri, 24 Jun 2022 06:45:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D4A169E;
 Thu, 23 Jun 2022 21:45:42 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7F3C23F66F;
 Thu, 23 Jun 2022 21:45:34 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V4 13/26] parisc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Fri, 24 Jun 2022 10:13:26 +0530
Message-Id: <20220624044339.1533882-14-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624044339.1533882-1-anshuman.khandual@arm.com>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu,
 hch@infradead.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
up a private and static protection_map[] array. Subsequently all __SXXX and
__PXXX macros can be dropped which are no longer needed.

Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-parisc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/parisc/Kconfig               |  1 +
 arch/parisc/include/asm/pgtable.h | 18 ------------------
 arch/parisc/mm/init.c             | 20 ++++++++++++++++++++
 3 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 5f2448dc5a2b..90eabc846f81 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -11,6 +11,7 @@ config PARISC
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 69765a6dbe89..6a1899a9b420 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -271,24 +271,6 @@ extern void __update_cache(pte_t pte);
  */
 
 	 /*xwr*/
-#define __P000  PAGE_NONE
-#define __P001  PAGE_READONLY
-#define __P010  __P000 /* copy on write */
-#define __P011  __P001 /* copy on write */
-#define __P100  PAGE_EXECREAD
-#define __P101  PAGE_EXECREAD
-#define __P110  __P100 /* copy on write */
-#define __P111  __P101 /* copy on write */
-
-#define __S000  PAGE_NONE
-#define __S001  PAGE_READONLY
-#define __S010  PAGE_WRITEONLY
-#define __S011  PAGE_SHARED
-#define __S100  PAGE_EXECREAD
-#define __S101  PAGE_EXECREAD
-#define __S110  PAGE_RWX
-#define __S111  PAGE_RWX
-
 
 extern pgd_t swapper_pg_dir[]; /* declared in init_task.c */
 
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 0a81499dd35e..451f20f87711 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -871,3 +871,23 @@ void flush_tlb_all(void)
 	spin_unlock(&sid_lock);
 }
 #endif
+
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_NONE,
+	[VM_WRITE | VM_READ]				= PAGE_READONLY,
+	[VM_EXEC]					= PAGE_EXECREAD,
+	[VM_EXEC | VM_READ]				= PAGE_EXECREAD,
+	[VM_EXEC | VM_WRITE]				= PAGE_EXECREAD,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_EXECREAD,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_WRITEONLY,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_EXECREAD,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_EXECREAD,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_RWX,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_RWX
+};
+DECLARE_VM_GET_PAGE_PROT
-- 
2.25.1


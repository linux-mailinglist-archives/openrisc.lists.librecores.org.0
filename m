Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 085CE5610B2
	for <lists+openrisc@lfdr.de>; Thu, 30 Jun 2022 07:17:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E454A249E5;
	Thu, 30 Jun 2022 07:17:40 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 859EF249AD
 for <openrisc@lists.librecores.org>; Thu, 30 Jun 2022 07:17:39 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BB3F169C;
 Wed, 29 Jun 2022 22:17:39 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99ED63F66F;
 Wed, 29 Jun 2022 22:17:30 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V6 06/26] x86/mm: Move protection_map[] inside the platform
Date: Thu, 30 Jun 2022 10:46:10 +0530
Message-Id: <20220630051630.1718927-7-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
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
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu,
 hch@infradead.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

This moves protection_map[] inside the platform and makes it a static. This
also defines a helper function add_encrypt_protection_map() that can update
the protection_map[] array with pgprot_encrypted().

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/x86/include/asm/pgtable_types.h | 19 -------------------
 arch/x86/mm/mem_encrypt_amd.c        |  7 +++----
 arch/x86/mm/pgprot.c                 | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index bdaf8391e2e0..aa174fed3a71 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -230,25 +230,6 @@ enum page_cache_mode {
 
 #endif	/* __ASSEMBLY__ */
 
-/*         xwr */
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READONLY
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY
-#define __P100	PAGE_READONLY_EXEC
-#define __P101	PAGE_READONLY_EXEC
-#define __P110	PAGE_COPY_EXEC
-#define __P111	PAGE_COPY_EXEC
-
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READONLY
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_READONLY_EXEC
-#define __S101	PAGE_READONLY_EXEC
-#define __S110	PAGE_SHARED_EXEC
-#define __S111	PAGE_SHARED_EXEC
-
 /*
  * early identity mapping  pte attrib macros.
  */
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index f6d038e2cd8e..4b3ec87e8c7d 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -484,10 +484,10 @@ void __init early_set_mem_enc_dec_hypercall(unsigned long vaddr, int npages, boo
 	enc_dec_hypercall(vaddr, npages, enc);
 }
 
+void add_encrypt_protection_map(void);
+
 void __init sme_early_init(void)
 {
-	unsigned int i;
-
 	if (!sme_me_mask)
 		return;
 
@@ -496,8 +496,7 @@ void __init sme_early_init(void)
 	__supported_pte_mask = __sme_set(__supported_pte_mask);
 
 	/* Update the protection map with memory encryption mask */
-	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
-		protection_map[i] = pgprot_encrypted(protection_map[i]);
+	add_encrypt_protection_map();
 
 	x86_platform.guest.enc_status_change_prepare = amd_enc_status_change_prepare;
 	x86_platform.guest.enc_status_change_finish  = amd_enc_status_change_finish;
diff --git a/arch/x86/mm/pgprot.c b/arch/x86/mm/pgprot.c
index 763742782286..b867839b16aa 100644
--- a/arch/x86/mm/pgprot.c
+++ b/arch/x86/mm/pgprot.c
@@ -4,6 +4,33 @@
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
+static pgprot_t protection_map[16] __ro_after_init = {
+	[VM_NONE]					= PAGE_NONE,
+	[VM_READ]					= PAGE_READONLY,
+	[VM_WRITE]					= PAGE_COPY,
+	[VM_WRITE | VM_READ]				= PAGE_COPY,
+	[VM_EXEC]					= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_READ]				= PAGE_READONLY_EXEC,
+	[VM_EXEC | VM_WRITE]				= PAGE_COPY_EXEC,
+	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_EXEC,
+	[VM_SHARED]					= PAGE_NONE,
+	[VM_SHARED | VM_READ]				= PAGE_READONLY,
+	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
+	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
+	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_EXEC,
+	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_EXEC
+};
+
+void add_encrypt_protection_map(void)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
+		protection_map[i] = pgprot_encrypted(protection_map[i]);
+}
+
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
 	unsigned long val = pgprot_val(protection_map[vm_flags &
-- 
2.25.1


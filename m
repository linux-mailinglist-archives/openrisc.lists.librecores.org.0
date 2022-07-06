Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E4C1A56823F
	for <lists+openrisc@lfdr.de>; Wed,  6 Jul 2022 10:59:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C67B12492B;
	Wed,  6 Jul 2022 10:59:35 +0200 (CEST)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by mail.librecores.org (Postfix) with ESMTPS id 46A45248C7
 for <openrisc@lists.librecores.org>; Wed,  6 Jul 2022 10:59:33 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=33; SR=0;
 TI=SMTPD_---0VIXgrTG_1657097965; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VIXgrTG_1657097965) by smtp.aliyun-inc.com;
 Wed, 06 Jul 2022 16:59:26 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org
Subject: [PATCH 2/3] mm: Add PUD level pagetable account
Date: Wed,  6 Jul 2022 16:59:16 +0800
Message-Id: <6c7316e17ccf8d9343c5f703c272df51346b44fa.1657096412.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
References: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
References: <cover.1657096412.git.baolin.wang@linux.alibaba.com>
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
Cc: x86@kernel.org, baolin.wang@linux.alibaba.com, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, guoren@kernel.org,
 linux-csky@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, will@kernel.org,
 tglx@linutronix.de, jonas@southpole.se, aneesh.kumar@linux.ibm.com,
 chenhuacai@kernel.org, willy@infradead.org, rppt@linux.ibm.com,
 mingo@redhat.com, linux-arch@vger.kernel.org, arnd@arndb.de, npiggin@gmail.com,
 loongarch@lists.linux.dev, openrisc@lists.librecores.org, bp@alien8.de,
 luto@kernel.org, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Now the PUD level ptes are always protected by mm->page_table_lock,
which means no split pagetable lock needed. So the generic PUD level
pagetable pages allocation will not call pgtable_pte_page_ctor/dtor(),
that means we will miss to account PUD level pagetable pages.

So introducing pgtable_pud_page_ctor/dtor(), which are just wrappers
of page_{set,clear}_pgtable() to help to get an accurate PUD pagetable
accounting, when allocating or freeing PUD level pagetable pages.

Moreover this patch will also mark the PUD level pagetable with PG_table
flag, which will help to do sanity validation in unpoison_memory() and
get more accurate pagetable accounting by /proc/kpageflags interface.

Meanwhile converting the architectures with using generic PUD pagatable
allocation to add corresponding pgtable_pud_page_ctor() or
pgtable_pud_page_dtor() to account PUD level pagetable.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/tlb.h         |  5 ++++-
 arch/loongarch/include/asm/pgalloc.h | 12 +++++++++---
 arch/mips/include/asm/pgalloc.h      | 12 +++++++++---
 arch/x86/mm/pgtable.c                |  5 ++++-
 include/asm-generic/pgalloc.h        | 12 ++++++++++--
 include/linux/mm.h                   | 10 ++++++++++
 6 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index c995d1f..6665f33 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -94,7 +94,10 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 				  unsigned long addr)
 {
-	tlb_remove_table(tlb, virt_to_page(pudp));
+	struct page *page = virt_to_page(pudp);
+
+	pgtable_pud_page_dtor(page);
+	tlb_remove_table(tlb, page);
 }
 #endif
 
diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 4bfeb3c..8138101 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -89,10 +89,16 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
+	struct page *page;
+
+	page = alloc_page(GFP_KERNEL);
+	if (!page)
+		return NULL;
+
+	pgtable_pud_page_ctor(page);
+	pud = (pud_t *)page_address(page);
+	pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
 
-	pud = (pud_t *) __get_free_page(GFP_KERNEL);
-	if (pud)
-		pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
 	return pud;
 }
 
diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 7960357..5da5880 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -89,11 +89,17 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
+	struct page *page;
 	pud_t *pud;
 
-	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
-	if (pud)
-		pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
+	page = alloc_pages(GFP_KERNEL, PUD_TABLE_ORDER);
+	if (!page)
+		return NULL;
+
+	pgtable_pud_page_ctor(page);
+	pud = (pud_t *)page_address(page);
+	pud_init((unsigned long)pud, (unsigned long)invalid_pmd_table);
+
 	return pud;
 }
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a932d77..ea39670 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -76,8 +76,11 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
+	struct page *page = virt_to_page(pud);
+
+	pgtable_pud_page_dtor(page);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
+	paravirt_tlb_remove_table(tlb, page);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 977bea1..8ce8d7c 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -149,11 +149,16 @@ static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 
 static inline pud_t *__pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
+	struct page *page;
 	gfp_t gfp = GFP_PGTABLE_USER;
 
 	if (mm == &init_mm)
 		gfp = GFP_PGTABLE_KERNEL;
-	return (pud_t *)get_zeroed_page(gfp);
+	page = alloc_pages(gfp, 0);
+	if (!page)
+		return NULL;
+	pgtable_pud_page_ctor(page);
+	return (pud_t *)page_address(page);
 }
 
 #ifndef __HAVE_ARCH_PUD_ALLOC_ONE
@@ -174,8 +179,11 @@ static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
 
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
+	struct page *page = virt_to_page(pud);
+
 	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	free_page((unsigned long)pud);
+	pgtable_pud_page_dtor(page);
+	__free_page(page);
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7894bc5..54ed6f7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2364,6 +2364,16 @@ static inline void page_clear_pgtable(struct page *page)
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
 
+static inline void pgtable_pud_page_ctor(struct page *page)
+{
+	page_set_pgtable(page);
+}
+
+static inline void pgtable_pud_page_dtor(struct page *page)
+{
+	page_clear_pgtable(page);
+}
+
 static inline bool pgtable_pte_page_ctor(struct page *page)
 {
 	if (!ptlock_init(page))
-- 
1.8.3.1


Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9DC644612
	for <lists+openrisc@lfdr.de>; Tue,  6 Dec 2022 15:49:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 14A1724BC5;
	Tue,  6 Dec 2022 15:49:05 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id DC09224B9B
 for <openrisc@lists.librecores.org>; Tue,  6 Dec 2022 15:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670338142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XBg+RrASZLSOgjQZ+h9w7ax0WTHgQALeSHGQDl5XWVQ=;
 b=VGExIWmpuUHktKkAnn8lg+T5au5E/ACQNIXiv1BRHyS1sTizGpUzW8uxQi38pmKIalpPJo
 RELhqpL1Ue2dtVYju7rXE0Vm8XiGzMRmBUXyej/ovQ+z7+X68twKizkSLxEWH0nTGIKset
 orKAzLLpbPId1enlMAuKH1A+OzSTnkk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-Ojd-27knM6CkAPy6DTEeyw-1; Tue, 06 Dec 2022 09:48:58 -0500
X-MC-Unique: Ojd-27knM6CkAPy6DTEeyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD19985A59D;
 Tue,  6 Dec 2022 14:48:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BCB3492B04;
 Tue,  6 Dec 2022 14:48:49 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 08/26] loongarch/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue,  6 Dec 2022 15:47:12 +0100
Message-Id: <20221206144730.163732-9-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
References: <20221206144730.163732-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
 linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>,
 linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
from the type. Generic MM currently only uses 5 bits for the type
(MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.

While at it, also mask the type in mk_swap_pte().

Note that this bit does not conflict with swap PMDs and could also be used
in swap PMD context later.

Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/loongarch/include/asm/pgtable-bits.h |  4 +++
 arch/loongarch/include/asm/pgtable.h      | 39 ++++++++++++++++++++---
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable-bits.h b/arch/loongarch/include/asm/pgtable-bits.h
index 3d1e0a69975a..8b98d22a145b 100644
--- a/arch/loongarch/include/asm/pgtable-bits.h
+++ b/arch/loongarch/include/asm/pgtable-bits.h
@@ -20,6 +20,7 @@
 #define	_PAGE_SPECIAL_SHIFT	11
 #define	_PAGE_HGLOBAL_SHIFT	12 /* HGlobal is a PMD bit */
 #define	_PAGE_PFN_SHIFT		12
+#define	_PAGE_SWP_EXCLUSIVE_SHIFT 23
 #define	_PAGE_PFN_END_SHIFT	48
 #define	_PAGE_NO_READ_SHIFT	61
 #define	_PAGE_NO_EXEC_SHIFT	62
@@ -33,6 +34,9 @@
 #define _PAGE_PROTNONE		(_ULCAST_(1) << _PAGE_PROTNONE_SHIFT)
 #define _PAGE_SPECIAL		(_ULCAST_(1) << _PAGE_SPECIAL_SHIFT)
 
+/* We borrow bit 23 to store the exclusive marker in swap PTEs. */
+#define _PAGE_SWP_EXCLUSIVE	(_ULCAST_(1) << _PAGE_SWP_EXCLUSIVE_SHIFT)
+
 /* Used by TLB hardware (placed in EntryLo*) */
 #define _PAGE_VALID		(_ULCAST_(1) << _PAGE_VALID_SHIFT)
 #define _PAGE_DIRTY		(_ULCAST_(1) << _PAGE_DIRTY_SHIFT)
diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 022ec6be3602..70d037c957a4 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -249,13 +249,26 @@ extern void pud_init(void *addr);
 extern void pmd_init(void *addr);
 
 /*
- * Non-present pages:  high 40 bits are offset, next 8 bits type,
- * low 16 bits zero.
+ * Encode/decode swap entries and swap PTEs. Swap PTEs are all PTEs that
+ * are !pte_none() && !pte_present().
+ *
+ * Format of swap PTEs:
+ *
+ *   6 6 6 6 5 5 5 5 5 5 5 5 5 5 4 4 4 4 4 4 4 4 4 4 3 3 3 3 3 3 3 3
+ *   3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2
+ *   <--------------------------- offset ---------------------------
+ *
+ *   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
+ *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ *   --------------> E <--- type ---> <---------- zeroes ---------->
+ *
+ *   E is the exclusive marker that is not stored in swap entries.
+ *   The zero'ed bits include _PAGE_PRESENT and _PAGE_PROTNONE.
  */
 static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
-{ pte_t pte; pte_val(pte) = (type << 16) | (offset << 24); return pte; }
+{ pte_t pte; pte_val(pte) = ((type & 0x7f) << 16) | (offset << 24); return pte; }
 
-#define __swp_type(x)		(((x).val >> 16) & 0xff)
+#define __swp_type(x)		(((x).val >> 16) & 0x7f)
 #define __swp_offset(x)		((x).val >> 24)
 #define __swp_entry(type, offset) ((swp_entry_t) { pte_val(mk_swap_pte((type), (offset))) })
 #define __pte_to_swp_entry(pte) ((swp_entry_t) { pte_val(pte) })
@@ -263,6 +276,24 @@ static inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
 #define __pmd_to_swp_entry(pmd) ((swp_entry_t) { pmd_val(pmd) })
 #define __swp_entry_to_pmd(x)	((pmd_t) { (x).val | _PAGE_HUGE })
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	pte_val(pte) |= _PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	pte_val(pte) &= ~_PAGE_SWP_EXCLUSIVE;
+	return pte;
+}
+
 extern void paging_init(void);
 
 #define pte_none(pte)		(!(pte_val(pte) & ~_PAGE_GLOBAL))
-- 
2.38.1


Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4775FC377
	for <lists+openrisc@lfdr.de>; Wed, 12 Oct 2022 12:10:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9778724B60;
	Wed, 12 Oct 2022 12:10:11 +0200 (CEST)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 by mail.librecores.org (Postfix) with ESMTPS id A22D724B52
 for <openrisc@lists.librecores.org>; Wed, 12 Oct 2022 12:10:09 +0200 (CEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4MnT0x0qw5z9sn3;
 Wed, 12 Oct 2022 12:10:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIVUJqBKGH_A; Wed, 12 Oct 2022 12:10:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4MnT0w5hBVz9sml;
 Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A7A768B779;
 Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sQdoCYhcG0-i; Wed, 12 Oct 2022 12:10:08 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.127])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 063CD8B776;
 Wed, 12 Oct 2022 12:10:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 29CA9wIl1165783
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:09:58 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 29CA9vLE1165772;
 Wed, 12 Oct 2022 12:09:57 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Baoquan He <bhe@redhat.com>
Subject: [RFC PATCH 2/8] openrisc: mm: remove unneeded early ioremap code
Date: Wed, 12 Oct 2022 12:09:38 +0200
Message-Id: <9010e8719949cce376dc3f75a97b8bfb2ff98442.1665568707.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1665568707.git.christophe.leroy@csgroup.eu>
References: <cover.1665568707.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665569381; l=1888;
 i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id;
 bh=f2w0I54eSGQxmIhNTUEqBybhfAm8ExZ/ChMo0/3T1RI=;
 b=qbXIm933JmWHxLgvIWJg+km9cyZtWnimWkpDXCVrpdc35YeAbAefnQpKJSleXGv1VMLtwp3js5TH
 9nHo40RYD5qpu7L+OWpHdhUaePk9M1QASy6k+82L4lUQSggT0bCb
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, Jonas Bonn <jonas@southpole.se>,
 wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 hch@infradead.org, linux-mm@kvack.org, David.Laight@ACULAB.COM,
 akpm@linux-foundation.org, agordeev@linux.ibm.com,
 openrisc@lists.librecores.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

From: Baoquan He <bhe@redhat.com>

Under arch/openrisc, there isn't any place where ioremap() is called.
It means that there isn't early ioremap handling needed in openrisc,
So the early ioremap handling code in ioremap() of
arch/openrisc/mm/ioremap.c is unnecessary and can be removed.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
---
 arch/openrisc/mm/ioremap.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/openrisc/mm/ioremap.c b/arch/openrisc/mm/ioremap.c
index 8ec0dafecf25..90b59bc53c8c 100644
--- a/arch/openrisc/mm/ioremap.c
+++ b/arch/openrisc/mm/ioremap.c
@@ -22,8 +22,6 @@
 
 extern int mem_init_done;
 
-static unsigned int fixmaps_used __initdata;
-
 /*
  * Remap an arbitrary physical address space into the kernel virtual
  * address space. Needed when the kernel wants to access high addresses
@@ -52,24 +50,14 @@ void __iomem *__ref ioremap(phys_addr_t addr, unsigned long size)
 	p = addr & PAGE_MASK;
 	size = PAGE_ALIGN(last_addr + 1) - p;
 
-	if (likely(mem_init_done)) {
-		area = get_vm_area(size, VM_IOREMAP);
-		if (!area)
-			return NULL;
-		v = (unsigned long)area->addr;
-	} else {
-		if ((fixmaps_used + (size >> PAGE_SHIFT)) > FIX_N_IOREMAPS)
-			return NULL;
-		v = fix_to_virt(FIX_IOREMAP_BEGIN + fixmaps_used);
-		fixmaps_used += (size >> PAGE_SHIFT);
-	}
+	area = get_vm_area(size, VM_IOREMAP);
+	if (!area)
+		return NULL;
+	v = (unsigned long)area->addr;
 
 	if (ioremap_page_range(v, v + size, p,
 			__pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_CI))) {
-		if (likely(mem_init_done))
-			vfree(area->addr);
-		else
-			fixmaps_used -= (size >> PAGE_SHIFT);
+		vfree(area->addr);
 		return NULL;
 	}
 
-- 
2.37.1


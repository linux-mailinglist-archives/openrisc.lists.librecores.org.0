Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C467519DA8
	for <lists+openrisc@lfdr.de>; Wed,  4 May 2022 13:09:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CB0FB248EC;
	Wed,  4 May 2022 13:09:23 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 898D223E0C
 for <openrisc@lists.librecores.org>; Wed,  4 May 2022 13:09:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E11F61B75;
 Wed,  4 May 2022 11:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20658C385A5;
 Wed,  4 May 2022 11:09:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SuY9kwWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651662557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wv+QAKoXYa5FdarxsSFuATIydt8Bd7pDfEI2EBNpl4w=;
 b=SuY9kwWJM1EIf1QWdAd/lGEHlbhD2ZeYQZEj3eVFlGzs13BK+GhoAvnS+nGEi8pFHhGleV
 L2S5UugRxXXBOF9OnI0Snou2KsnSIPPEtSqSR6YhCdCVNeba1lW7EC1Iwb2WY7w4T8bUHI
 AvCkCWnRYZWvz5KAGEDsD/ZpMdmwqPQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2558d3b2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 4 May 2022 11:09:17 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: openrisc@lists.librecores.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] openrisc: remove bogus nops and shutdowns
Date: Wed,  4 May 2022 13:09:11 +0200
Message-Id: <20220504110911.283525-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Nop 42 is some leftover debugging thing by the looks of it. Nop 1 will
shut down the simulator, which isn't what we want, since it makes it
possible to handle errors.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/openrisc/mm/fault.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/openrisc/mm/fault.c b/arch/openrisc/mm/fault.c
index 80bb66ad42f6..860da58d7509 100644
--- a/arch/openrisc/mm/fault.c
+++ b/arch/openrisc/mm/fault.c
@@ -223,8 +223,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
 	{
 		const struct exception_table_entry *entry;
 
-		__asm__ __volatile__("l.nop 42");
-
 		if ((entry = search_exception_tables(regs->pc)) != NULL) {
 			/* Adjust the instruction pointer in the stackframe */
 			regs->pc = entry->fixup;
@@ -252,9 +250,6 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long address,
 	 */
 
 out_of_memory:
-	__asm__ __volatile__("l.nop 42");
-	__asm__ __volatile__("l.nop 1");
-
 	mmap_read_unlock(mm);
 	if (!user_mode(regs))
 		goto no_context;
-- 
2.35.1


Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B6AB15A5C2B
	for <lists+openrisc@lfdr.de>; Tue, 30 Aug 2022 08:53:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9480B2491C;
	Tue, 30 Aug 2022 08:53:52 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 3BCAD2431F
 for <openrisc@lists.librecores.org>; Tue, 30 Aug 2022 08:53:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06ECF6146E;
 Tue, 30 Aug 2022 06:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5161C433D6;
 Tue, 30 Aug 2022 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661842429;
 bh=wxIJahY4bNgAXVbpWaC9W2nMSDfpOu3ZSd8EuV6xsso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kpjay5YsyYfycs7ZTlN911Ki+d8mT0EfwjtiLpalFcYQh9VpfuE8febThdR3WlnSH
 UOKGnoa4Hq0l+0R0LxhjKYOaEwb/eRa6LsEMQc16RMRgrKMy3HBQNx25b6nmcLNktt
 pBiDHwH1u9nGpTGlAnoOiEEXCOJIDJuzm8Dx5CJh1hQq/XtcnYKJbcLssjhuFvP+Fa
 7K9DNxIZ5S51MuwUHRlxLRm8Fie5EEEQwcURimXekqg5sJNst6Qsfvh7tGwUNBBldG
 3tkthmrYK1VdUoucu3Vf5fK+K5aMvwCzvWuO8xUsFXooEjAYyFicx6dANpQa1aKAl3
 +q9Qfe43KkXTQ==
From: guoren@kernel.org
To: oleg@redhat.com, vgupta@kernel.org, linux@armlinux.org.uk,
 monstr@monstr.eu, dinguyen@kernel.org, palmer@dabbelt.com,
 davem@davemloft.net, arnd@arndb.de, shorne@gmail.com, guoren@kernel.org
Subject: [PATCH 3/3] arch: ptrace: Cleanup ptrace_disable
Date: Tue, 30 Aug 2022 02:53:16 -0400
Message-Id: <20220830065316.3924938-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830065316.3924938-1-guoren@kernel.org>
References: <20220830065316.3924938-1-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

From: Guo Ren <guoren@linux.alibaba.com>

Add a weak empty function in common and remove architectures' duplicated
ones.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/arc/kernel/ptrace.c        |  4 ----
 arch/arm/kernel/ptrace.c        |  8 --------
 arch/microblaze/kernel/ptrace.c |  5 -----
 arch/nios2/kernel/ptrace.c      |  5 -----
 arch/riscv/kernel/ptrace.c      |  4 ----
 arch/sparc/kernel/ptrace_32.c   | 10 ----------
 arch/sparc/kernel/ptrace_64.c   | 10 ----------
 kernel/ptrace.c                 |  8 ++++++++
 8 files changed, 8 insertions(+), 46 deletions(-)

diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index da7542cea0d8..c227e145fede 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -317,10 +317,6 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 	return &user_arc_view;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-}
-
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index bfe88c6e60d5..b85f5bdc56ef 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -186,14 +186,6 @@ put_user_reg(struct task_struct *task, int offset, long data)
 	return ret;
 }
 
-/*
- * Called by kernel/ptrace.c when detaching..
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* Nothing to do. */
-}
-
 /*
  * Handle hitting a breakpoint.
  */
diff --git a/arch/microblaze/kernel/ptrace.c b/arch/microblaze/kernel/ptrace.c
index 5234d0c1dcaa..72e3eece72aa 100644
--- a/arch/microblaze/kernel/ptrace.c
+++ b/arch/microblaze/kernel/ptrace.c
@@ -162,8 +162,3 @@ asmlinkage void do_syscall_trace_leave(struct pt_regs *regs)
 	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
 		ptrace_report_syscall_exit(regs, step);
 }
-
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
diff --git a/arch/nios2/kernel/ptrace.c b/arch/nios2/kernel/ptrace.c
index cd62f310778b..de5f4199c45f 100644
--- a/arch/nios2/kernel/ptrace.c
+++ b/arch/nios2/kernel/ptrace.c
@@ -117,11 +117,6 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 	return &nios2_user_view;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-
-}
-
 long arch_ptrace(struct task_struct *child, long request, unsigned long addr,
 		 unsigned long data)
 {
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 44f4b1ca315d..19e4d8057e24 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -210,10 +210,6 @@ unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
 		return 0;
 }
 
-void ptrace_disable(struct task_struct *child)
-{
-}
-
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
diff --git a/arch/sparc/kernel/ptrace_32.c b/arch/sparc/kernel/ptrace_32.c
index e7db48acb838..f6df84e12739 100644
--- a/arch/sparc/kernel/ptrace_32.c
+++ b/arch/sparc/kernel/ptrace_32.c
@@ -29,16 +29,6 @@
 
 /* #define ALLOW_INIT_TRACING */
 
-/*
- * Called by kernel/ptrace.c when detaching..
- *
- * Make sure single step bits etc are not set.
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
-
 enum sparc_regset {
 	REGSET_GENERAL,
 	REGSET_FP,
diff --git a/arch/sparc/kernel/ptrace_64.c b/arch/sparc/kernel/ptrace_64.c
index 86a7eb5c27ba..b20a16ebe533 100644
--- a/arch/sparc/kernel/ptrace_64.c
+++ b/arch/sparc/kernel/ptrace_64.c
@@ -83,16 +83,6 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_END,
 };
 
-/*
- * Called by kernel/ptrace.c when detaching..
- *
- * Make sure single step bits etc are not set.
- */
-void ptrace_disable(struct task_struct *child)
-{
-	/* nothing to do */
-}
-
 /* To get the necessary page struct, access_process_vm() first calls
  * get_user_pages().  This has done a flush_dcache_page() on the
  * accessed page.  Then our caller (copy_{to,from}_user_page()) did
diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 1893d909e45c..77299bb65d97 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -579,6 +579,14 @@ static bool __ptrace_detach(struct task_struct *tracer, struct task_struct *p)
 	return dead;
 }
 
+__weak void ptrace_disable(struct task_struct *child)
+{
+	/*
+	 * Nothing to do.., some architectures would replace it with
+	 * their own function.
+	 */
+}
+
 static int ptrace_detach(struct task_struct *child, unsigned int data)
 {
 	if (!valid_signal(data))
-- 
2.36.1


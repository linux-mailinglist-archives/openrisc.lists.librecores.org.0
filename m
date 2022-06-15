Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5542F54BEF3
	for <lists+openrisc@lfdr.de>; Wed, 15 Jun 2022 02:55:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B3B0A24987;
	Wed, 15 Jun 2022 02:55:04 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id ACC3324996
 for <openrisc@lists.librecores.org>; Wed, 15 Jun 2022 02:44:14 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 02329B81A43;
 Wed, 15 Jun 2022 00:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6D3C3411F;
 Wed, 15 Jun 2022 00:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655253852;
 bh=rcjBHcwDa3Vvz9ae34yYid9fcwgrK1WVNSLCfZ/KP5E=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=fdhcRapfOZeMu89rXN1F9+PFgQBw1jq2TFCvdWilZKBPl7d60xoaf+Z1BoVI71oyo
 RqJwT7IyOmWKrdq1gGthk/wr5qRLVQoB8lFuH3bhpG8v28ehqFht7ixYYEHPsMm9AB
 B8Nl92yiOr67Th9tcRyEPi0fRLrSpOhoRzoC/T6UuHa5X12CLk5h++1bfLpyoCHqB+
 fvK77b4d+EdbOzzr1aIJ1u6gTHC44L8QS8SaSAp9SKbflwgVl3VgsZCvB9XatY8lhL
 9YwdPZU6iL7l0pnNRdqWmeOhCsfxrQ+i6D2NKXEGZhl5QpSSUjx5BoIk0tcHaLBiwv
 bedv5BuhTNO6Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 327DD5C0BCC; Tue, 14 Jun 2022 17:44:12 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:44:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 16/36] rcu: Fix rcu_idle_exit()
Message-ID: <20220615004412.GA5766@paulmck-ThinkPad-P17-Gen-1>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.935970247@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608144516.935970247@infradead.org>
X-Mailman-Approved-At: Wed, 15 Jun 2022 02:55:03 +0200
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
Reply-To: paulmck@kernel.org
Cc: juri.lelli@redhat.com, rafael@kernel.org, benh@kernel.crashing.org,
 linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
 agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org,
 vincent.guittot@linaro.org, mpe@ellerman.id.au, chenhuacai@kernel.org,
 linux-acpi@vger.kernel.org, agross@kernel.org, linux-imx@nxp.com,
 catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com,
 borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net,
 pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
 acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org,
 paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com,
 deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org,
 linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com,
 alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
 linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org,
 boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org,
 pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org,
 josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de,
 bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net,
 dalias@libc.org, tony@atomide.com, amakhalov@vmware.com,
 bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com,
 richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 aou@eecs.berkeley.edu, hca@linux.ibm.com, openrisc@lists.librecores.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com,
 monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Wed, Jun 08, 2022 at 04:27:39PM +0200, Peter Zijlstra wrote:
> Current rcu_idle_exit() is terminally broken because it uses
> local_irq_{save,restore}(), which are traced which uses RCU.
> 
> However, now that all the callers are sure to have IRQs disabled, we
> can remove these calls.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>

We have some fun conflicts between this series and Frederic's context-tracking
series.  But it looks like these can be resolved by:

1.	A patch on top of Frederic's series that provides the old rcu_*()
	names for the functions now prefixed with ct_*() such as
	ct_idle_exit().

2.	Another patch on top of Frederic's series that takes the
	changes remaining from this patch, shown below.  Frederic's
	series uses raw_local_irq_save() and raw_local_irq_restore(),
	which can then be removed.

Or is there a better way to do this?

							Thanx, Paul

------------------------------------------------------------------------

commit f64cee8c159e9863a74594efe3d33fb513a6a7b5
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Jun 14 17:24:43 2022 -0700

    context_tracking: Interrupts always disabled for ct_idle_exit()
    
    Now that the idle-loop cleanups have ensured that rcu_idle_exit() is
    always invoked with interrupts disabled, remove the interrupt disabling
    in favor of a debug check.
    
    Signed-off-by: Peter Zijlstra <peterz@infradead.org>
    Cc: Frederic Weisbecker <frederic@kernel.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index 1da44803fd319..99310cf5b0254 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -332,11 +332,8 @@ EXPORT_SYMBOL_GPL(ct_idle_enter);
  */
 void noinstr ct_idle_exit(void)
 {
-	unsigned long flags;
-
-	raw_local_irq_save(flags);
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
 	ct_kernel_enter(false, RCU_DYNTICKS_IDX - CONTEXT_IDLE);
-	raw_local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(ct_idle_exit);
 

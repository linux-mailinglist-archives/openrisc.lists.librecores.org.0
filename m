Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C17B1543F91
	for <lists+openrisc@lfdr.de>; Thu,  9 Jun 2022 01:00:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7723D24A2C;
	Thu,  9 Jun 2022 01:00:09 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id B001F249B0
 for <openrisc@lists.librecores.org>; Wed,  8 Jun 2022 16:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=OtG2eksypqTPnibPh4fnaffiD2hY+EVznlbJ2kHLrow=; b=OVXFxuucL+euI7qJ0DHWP+HSd+
 K0Ja573cJSNgJwZfmTV/5FSX0IvQJrgOo9v/0uLAq5TdSmJQtXAZyIW9o/35yTdAOleYqjANFEm+E
 l56+S1viwHvjXO62dxEnDYPCdtMwVOYv/k+oP4A2fDyCb6sOHq4kRNEOvqcsJ/5x/Zoh6zkng8v4u
 /0d1tlL+++2dqJwM54DkEmGHC+DPLj6jQdLOk++gXXVkvZXV4HarSMkLWNk/RWR6rJjZ3hTgPD+7o
 fRFAUGoXS/CQX8DE/ix3aPY/jnZckpcWrGai1TDNvAnceUPXNMM/pOlZZ/Tt52+3oavm+6TFmtcmc
 EkhLqJ7w==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nywwy-0066BS-W1; Wed, 08 Jun 2022 14:46:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A8FF730008D;
 Wed,  8 Jun 2022 16:46:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 5313720C0F9B9; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144516.362668063@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH 07/36] cpuidle,tegra: Push RCU-idle into driver
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Thu, 09 Jun 2022 00:59:57 +0200
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
 aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com,
 openrisc@lists.librecores.org, paul.walmsley@sifive.com,
 linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com,
 monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Doing RCU-idle outside the driver, only to then temporarily enable it
again, at least twice, before going idle is daft.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 drivers/cpuidle/cpuidle-tegra.c |   21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

--- a/drivers/cpuidle/cpuidle-tegra.c
+++ b/drivers/cpuidle/cpuidle-tegra.c
@@ -180,9 +180,11 @@ static int tegra_cpuidle_state_enter(str
 	}
 
 	local_fiq_disable();
-	RCU_NONIDLE(tegra_pm_set_cpu_in_lp2());
+	tegra_pm_set_cpu_in_lp2();
 	cpu_pm_enter();
 
+	rcu_idle_enter();
+
 	switch (index) {
 	case TEGRA_C7:
 		err = tegra_cpuidle_c7_enter();
@@ -197,8 +199,10 @@ static int tegra_cpuidle_state_enter(str
 		break;
 	}
 
+	rcu_idle_exit();
+
 	cpu_pm_exit();
-	RCU_NONIDLE(tegra_pm_clear_cpu_in_lp2());
+	tegra_pm_clear_cpu_in_lp2();
 	local_fiq_enable();
 
 	return err ?: index;
@@ -226,6 +230,7 @@ static int tegra_cpuidle_enter(struct cp
 			       struct cpuidle_driver *drv,
 			       int index)
 {
+	bool do_rcu = drv->states[index].flags & CPUIDLE_FLAG_RCU_IDLE;
 	unsigned int cpu = cpu_logical_map(dev->cpu);
 	int ret;
 
@@ -233,9 +238,13 @@ static int tegra_cpuidle_enter(struct cp
 	if (dev->states_usage[index].disable)
 		return -1;
 
-	if (index == TEGRA_C1)
+	if (index == TEGRA_C1) {
+		if (do_rcu)
+			rcu_idle_enter();
 		ret = arm_cpuidle_simple_enter(dev, drv, index);
-	else
+		if (do_rcu)
+			rcu_idle_exit();
+	} else
 		ret = tegra_cpuidle_state_enter(dev, index, cpu);
 
 	if (ret < 0) {
@@ -285,7 +294,8 @@ static struct cpuidle_driver tegra_idle_
 			.exit_latency		= 2000,
 			.target_residency	= 2200,
 			.power_usage		= 100,
-			.flags			= CPUIDLE_FLAG_TIMER_STOP,
+			.flags			= CPUIDLE_FLAG_TIMER_STOP |
+						  CPUIDLE_FLAG_RCU_IDLE,
 			.name			= "C7",
 			.desc			= "CPU core powered off",
 		},
@@ -295,6 +305,7 @@ static struct cpuidle_driver tegra_idle_
 			.target_residency	= 10000,
 			.power_usage		= 0,
 			.flags			= CPUIDLE_FLAG_TIMER_STOP |
+						  CPUIDLE_FLAG_RCU_IDLE   |
 						  CPUIDLE_FLAG_COUPLED,
 			.name			= "CC6",
 			.desc			= "CPU cluster powered off",



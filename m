Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 88F1C544960
	for <lists+openrisc@lfdr.de>; Thu,  9 Jun 2022 12:42:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3F7E3248EE;
	Thu,  9 Jun 2022 12:42:04 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id D11F920E4E
 for <openrisc@lists.librecores.org>; Thu,  9 Jun 2022 12:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UbbDgBiwip0YBZOTZVQugfugvsZnYOECFEm/sChB2KE=; b=bn7nWKrTByqCttAV7Tb+hk3S6t
 I/mkMmJ369JvRCOAATit3qrnLrVVApCU3MZIi6lIKiFAlbStRcA30X0UFUd1T8D12fVQnVKa7hYPR
 K7EYNQp37UzeZk78mCBcTmEsaKr3iz0rWwxCle8s1uG3rrOkr/TW+qX1Zj/6s0Og8NDJ1jJvyTCIJ
 X/UPiCnCV5l95zgrnKFHSTcoAhPMEQ49r4HzYtVzZmCksowLBW+PMICGN33p7tE1QEHeN+zrII/zd
 ec7l/iKVKEAoDbJibxSRhGbBYgET1Ue5jZm0b5HeYxPcLQDm5a8x7p7RxjPba9/By/81XUqzodwzS
 pNWm9E9w==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nzEzM-006LJR-Mm; Thu, 09 Jun 2022 10:02:07 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2E614981287; Thu,  9 Jun 2022 12:02:04 +0200 (CEST)
Date: Thu, 9 Jun 2022 12:02:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org> <YqG6URbihTNCk9YR@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqG6URbihTNCk9YR@alley>
X-Mailman-Approved-At: Thu, 09 Jun 2022 12:41:56 +0200
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
 linux-pm@vger.kernel.org, jiangshanlai@gmail.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
 acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 dietmar.eggemann@arm.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org,
 paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
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

On Thu, Jun 09, 2022 at 11:16:46AM +0200, Petr Mladek wrote:
> On Wed 2022-06-08 16:27:47, Peter Zijlstra wrote:
> > The problem, per commit fc98c3c8c9dc ("printk: use rcuidle console
> > tracepoint"), was printk usage from the cpuidle path where RCU was
> > already disabled.
> > 
> > Per the patches earlier in this series, this is no longer the case.
> 
> My understanding is that this series reduces a lot the amount
> of code called with RCU disabled. As a result the particular printk()
> call mentioned by commit fc98c3c8c9dc ("printk: use rcuidle console
> tracepoint") is called with RCU enabled now. Hence this particular
> problem is fixed better way now.
> 
> But is this true in general?
> Does this "prevent" calling printk() a safe way in code with
> RCU disabled?

On x86_64, yes. Other architectures, less so.

Specifically, the objtool noinstr validation pass will warn at build
time (DEBUG_ENTRY=y) if any noinstr/cpuidle code does a call to
non-vetted code like printk().

At the same time; there's a few hacks that allow WARN to work, but
mostly if you hit WARN in entry/noinstr you get to keep the pieces in
any case.

On other architecture we'll need to rely on runtime coverage with
PROVE_RCU. That is, if a splat like in the above mentioned commit
happens again, we'll need to fix it by adjusting the callchain, not by
mucking about with RCU state.

> I am not sure if anyone cares. printk() is the best effort
> functionality because of the consoles code anyway. Also I wonder
> if anyone uses this trace_console().

This is the tracepoint used to spool all of printk into ftrace, I
suspect there's users, but I haven't used it myself.

> Therefore if this patch allows to remove some tricky tracing
> code then it might be worth it. But if trace_console_rcuidle()
> variant is still going to be available then I would keep using it.

My ultimate goal is to delete trace_.*_rcuidle() and RCU_NONIDLE()
entirely. We're close, but not quite there yet.

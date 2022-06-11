Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5DE5477C5
	for <lists+openrisc@lfdr.de>; Sat, 11 Jun 2022 23:54:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4ECB124997;
	Sat, 11 Jun 2022 23:54:08 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by mail.librecores.org (Postfix) with ESMTPS id 66DB1242D4
 for <openrisc@lists.librecores.org>; Thu,  9 Jun 2022 15:06:29 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id EEA1421F3C;
 Thu,  9 Jun 2022 13:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1654779989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fQ7/fX+AXX7RSe4KqEkRum0uc4vC19BTUP6nq2wTOec=;
 b=o28ZaXYpRsbDNeH7DdY3dJH3Fnc3dlxZT8L+x/2aFmo5tE4BAEDzQGW4+i3DDhNGrDHekt
 G23+f/oOyTepRO03yIh1gixSASehX2C07pg1fm0i3R3KDgn22PhYw8V9jvCq8nE2YIN+/O
 p3FQSqV1HR0kVCZZzDry3RvUltYRjYI=
Received: from suse.cz (unknown [10.100.208.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id CEE382C141;
 Thu,  9 Jun 2022 13:06:27 +0000 (UTC)
Date: Thu, 9 Jun 2022 15:06:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YqHwOFg/WlMqe8/Z@alley>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org> <YqG6URbihTNCk9YR@alley>
 <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
X-Mailman-Approved-At: Sat, 11 Jun 2022 23:54:06 +0200
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

On Thu 2022-06-09 12:02:04, Peter Zijlstra wrote:
> On Thu, Jun 09, 2022 at 11:16:46AM +0200, Petr Mladek wrote:
> > On Wed 2022-06-08 16:27:47, Peter Zijlstra wrote:
> > > The problem, per commit fc98c3c8c9dc ("printk: use rcuidle console
> > > tracepoint"), was printk usage from the cpuidle path where RCU was
> > > already disabled.
> > > 
> > Does this "prevent" calling printk() a safe way in code with
> > RCU disabled?
> 
> On x86_64, yes. Other architectures, less so.
> 
> Specifically, the objtool noinstr validation pass will warn at build
> time (DEBUG_ENTRY=y) if any noinstr/cpuidle code does a call to
> non-vetted code like printk().
> 
> At the same time; there's a few hacks that allow WARN to work, but
> mostly if you hit WARN in entry/noinstr you get to keep the pieces in
> any case.
> 
> On other architecture we'll need to rely on runtime coverage with
> PROVE_RCU. That is, if a splat like in the above mentioned commit
> happens again, we'll need to fix it by adjusting the callchain, not by
> mucking about with RCU state.

Makes sense. Feel free to use for this patch:

Acked-by: Petr Mladek <pmladek@suse.com>

> > Therefore if this patch allows to remove some tricky tracing
> > code then it might be worth it. But if trace_console_rcuidle()
> > variant is still going to be available then I would keep using it.
> 
> My ultimate goal is to delete trace_.*_rcuidle() and RCU_NONIDLE()
> entirely. We're close, but not quite there yet.

I keep my fingers crossed.

Best Regards,
Petr

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 021F75BDD1D
	for <lists+openrisc@lfdr.de>; Tue, 20 Sep 2022 08:26:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A94D2491F;
	Tue, 20 Sep 2022 08:26:32 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id A426B24B40
 for <openrisc@lists.librecores.org>; Mon, 19 Sep 2022 17:17:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B61BB81622;
 Mon, 19 Sep 2022 15:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47AEC433D6;
 Mon, 19 Sep 2022 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663600657;
 bh=SGRWSsWxhYnFNcVdXVanCp7r8VhObbFain7vrJ2pf9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fxVxz+v2ZKRYGR2RcB+jwqcdhOAyWFuA63mrtcEpyRTpMkbyS6WHs4N4WpL6wD55y
 MEw4vseCOHKlzHluXBoBp/tNbhBozucjByJQwggqB8cSL766iSR/fB5p7HP2XX3V5a
 W432aviHiF1CtVbY9+02lVZyqI6r7f0Y+oEmkgLbQeCLJ6mZ8QHUtL9Cb1Rt7pnsGN
 oU9BgJeognmYR5a7tpyKmtArG/qTrOVW6g6oNhiIq3bF6GOaiMj1jdkgNeNp7u/R+2
 PWnZiOvApDwvdE77MAQCyvfpVSOU+ZSH1CmsYL840fIy4Yva2osOuqdAr10RKbdLw3
 uLMmSqj+LM5sA==
Date: Mon, 19 Sep 2022 17:17:34 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 08/44] cpuidle,imx6: Push RCU-idle into driver
Message-ID: <20220919151734.GB62211@lothringen>
References: <20220919095939.761690562@infradead.org>
 <20220919101520.869531945@infradead.org>
 <20220919144941.GA62211@lothringen>
 <YyiEqDSJVOZrQYg8@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyiEqDSJVOZrQYg8@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Tue, 20 Sep 2022 08:26:29 +0200
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com,
 linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
 agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org,
 vincent.guittot@linaro.org, mpe@ellerman.id.au, chenhuacai@kernel.org,
 christophe.leroy@csgroup.eu, linux-acpi@vger.kernel.org, agross@kernel.org,
 linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com,
 borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net,
 pmladek@suse.com, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
 npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org,
 dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com,
 linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org,
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com,
 deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com,
 dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org,
 kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, chris@zankel.net, sboyd@kernel.org,
 dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com,
 fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org,
 linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org,
 boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org,
 pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org,
 ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com,
 shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com,
 amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org,
 glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se,
 yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk,
 mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 richard.henderson@linaro.org, openrisc@lists.librecores.org, acme@kernel.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com,
 jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org,
 palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de,
 johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Mon, Sep 19, 2022 at 05:03:04PM +0200, Peter Zijlstra wrote:
> On Mon, Sep 19, 2022 at 04:49:41PM +0200, Frederic Weisbecker wrote:
> > On Mon, Sep 19, 2022 at 11:59:47AM +0200, Peter Zijlstra wrote:
> > > Doing RCU-idle outside the driver, only to then temporarily enable it
> > > again, at least twice, before going idle is daft.
> > > 
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > >  arch/arm/mach-imx/cpuidle-imx6sx.c |    5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
> > > +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
> > > @@ -47,7 +47,9 @@ static int imx6sx_enter_wait(struct cpui
> > >  		cpu_pm_enter();
> > >  		cpu_cluster_pm_enter();
> > >  
> > > +		ct_idle_enter();
> > >  		cpu_suspend(0, imx6sx_idle_finish);
> > > +		ct_idle_exit();
> > >  
> > >  		cpu_cluster_pm_exit();
> > >  		cpu_pm_exit();
> > > @@ -87,7 +89,8 @@ static struct cpuidle_driver imx6sx_cpui
> > >  			 */
> > >  			.exit_latency = 300,
> > >  			.target_residency = 500,
> > > -			.flags = CPUIDLE_FLAG_TIMER_STOP,
> > > +			.flags = CPUIDLE_FLAG_TIMER_STOP |
> > > +				 CPUIDLE_FLAG_RCU_IDLE,
> > >  			.enter = imx6sx_enter_wait,
> > 
> > There is a second one below that also uses imx6sx_enter_wait.
> 
> Oh, above you mean; but only @index==2 gets us into the whole PM crud.
> @index==1 is fine afaict.

Ah ok, got it, hence why you didn't touch cpu_do_idle()...
May need to comment that somewhere...

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks!

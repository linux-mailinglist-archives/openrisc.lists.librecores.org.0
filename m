Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EB8FD5EF755
	for <lists+openrisc@lfdr.de>; Thu, 29 Sep 2022 16:20:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B93B248E6;
	Thu, 29 Sep 2022 16:20:27 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 984D124BD2
 for <openrisc@lists.librecores.org>; Mon, 26 Sep 2022 20:41:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70D3BB80D67;
 Mon, 26 Sep 2022 18:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8346C433D7;
 Mon, 26 Sep 2022 18:40:49 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:41:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 33/44] ftrace: WARN on rcuidle
Message-ID: <20220926144157.0406dfbb@gandalf.local.home>
In-Reply-To: <20220919101522.573936213@infradead.org>
References: <20220919095939.761690562@infradead.org>
 <20220919101522.573936213@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 Sep 2022 16:20:25 +0200
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
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
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
 ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, ink@jurassic.park.msu.ru,
 bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org,
 davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com,
 konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com,
 hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com,
 anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com,
 richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com,
 aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org,
 openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com,
 linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com,
 jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org,
 palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de,
 johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>


Nit, the subject should have "tracing:" an not "ftrace:" as the former
encompasses the tracing infrastructure and the latter is for the function
hook part of that.

On Mon, 19 Sep 2022 12:00:12 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> CONFIG_GENERIC_ENTRY disallows any and all tracing when RCU isn't
> enabled.
> 
> XXX if s390 (the only other GENERIC_ENTRY user as of this writing)
> isn't comfortable with this, we could switch to
> HAVE_NOINSTR_VALIDATION which is x86_64 only atm.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/tracepoint.h |   13 ++++++++++++-
>  kernel/trace/trace.c       |    3 +++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -178,6 +178,16 @@ static inline struct tracepoint *tracepo
>  #endif /* CONFIG_HAVE_STATIC_CALL */
>  
>  /*
> + * CONFIG_GENERIC_ENTRY archs are expected to have sanitized entry and idle
> + * code that disallow any/all tracing/instrumentation when RCU isn't watching.
> + */
> +#ifdef CONFIG_GENERIC_ENTRY
> +#define RCUIDLE_COND(rcuidle)	(rcuidle)
> +#else

Should probably move the below comment to here:

 /* srcu can't be used from NMI */

> +#define RCUIDLE_COND(rcuidle)	(rcuidle && in_nmi())
> +#endif
> +
> +/*
>   * it_func[0] is never NULL because there is at least one element in the array
>   * when the array itself is non NULL.
>   */
> @@ -189,7 +199,8 @@ static inline struct tracepoint *tracepo
>  			return;						\
>  									\
>  		/* srcu can't be used from NMI */			\

And remove the above.

-- Steve

> -		WARN_ON_ONCE(rcuidle && in_nmi());			\
> +		if (WARN_ON_ONCE(RCUIDLE_COND(rcuidle)))		\
> +			return;						\
>  									\
>  		/* keep srcu and sched-rcu usage consistent */		\
>  		preempt_disable_notrace();				\
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -3104,6 +3104,9 @@ void __trace_stack(struct trace_array *t
>  		return;
>  	}
>  
> +	if (WARN_ON_ONCE(IS_ENABLED(CONFIG_GENERIC_ENTRY)))
> +		return;
> +
>  	/*
>  	 * When an NMI triggers, RCU is enabled via ct_nmi_enter(),
>  	 * but if the above rcu_is_watching() failed, then the NMI
> 


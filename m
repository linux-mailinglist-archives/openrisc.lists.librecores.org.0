Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9467C54BB12
	for <lists+openrisc@lfdr.de>; Tue, 14 Jun 2022 22:02:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6166C24940;
	Tue, 14 Jun 2022 22:02:03 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id 9E1292496D
 for <openrisc@lists.librecores.org>; Tue, 14 Jun 2022 18:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lGPDnVOvpW5cJYkNK5aiO+HQt8YloxSeZZcAt0L3T+0=; b=DAyjnelx4YBZDCDKjW1vABnwD6
 bfuQInSMcO0k1N9c43zulrHrt0FEspCLqBV7dzVlaMMaDm/0d8h+E1vx/Mn16eV+mdIA5cFTuH3pJ
 ZPctIYIGAc1IQVFMkXT59RectB0+FvezRUN6pXOBo7jPhyxeW7DquiSvQAiutE+ZX5GvtHgbHFHRx
 6HNiF1zBAiNoXSUuUybOLrpKXxYLhLp7SkKzRQuOg8AsSzW4GjX7X7PIc8C1Yqe4MS+PoRyI4eENc
 TnTVXl8b+mj78ByEoizyUwQl4K8tWC0/1bV8h78+HtzLeArX034mK97ekOVdMcZW15wljxz2QwCm7
 eJasXJFA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o19e7-007uTz-7Y; Tue, 14 Jun 2022 16:44:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BBDAE3002BE;
 Tue, 14 Jun 2022 18:44:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A1F7228B3F630; Tue, 14 Jun 2022 18:44:02 +0200 (CEST)
Date: Tue, 14 Jun 2022 18:44:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [Pv-drivers] [PATCH 29/36] cpuidle,	xenpv: Make more
 PARAVIRT_XXL noinstr clean
Message-ID: <Yqi60lnN6MQpysBw@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.759631860@infradead.org>
 <510b9b68-7d53-7d4d-5a05-37fbd199eb4b@csail.mit.edu>
 <BAE566A0-AEA3-493E-8AC5-912C795BF1DE@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAE566A0-AEA3-493E-8AC5-912C795BF1DE@vmware.com>
X-Mailman-Approved-At: Tue, 14 Jun 2022 22:01:55 +0200
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
Cc: "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "bsegall@google.com" <bsegall@google.com>,
 "guoren@kernel.org" <guoren@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "mattst88@gmail.com" <mattst88@gmail.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "sammy@sammy.net" <sammy@sammy.net>, "pmladek@suse.com" <pmladek@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "ink@jurassic.park.msu.ru" <ink@jurassic.park.msu.ru>,
 "jiangshanlai@gmail.com" <jiangshanlai@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "acme@kernel.org" <acme@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 "svens@linux.ibm.com" <svens@linux.ibm.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "paulus@samba.org" <paulus@samba.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "kernel@xen0n.name" <kernel@xen0n.name>,
 "quic_neeraju@quicinc.com" <quic_neeraju@quicinc.com>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "vschneid@redhat.com" <vschneid@redhat.com>,
 "john.ogness@linutronix.de" <john.ogness@linutronix.de>,
 "ysato@users.sourceforge.jp" <ysato@users.sourceforge.jp>,
 "festevam@gmail.com" <festevam@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "lenb@kernel.org" <lenb@kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "jolsa@kernel.org" <jolsa@kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "chris@zankel.net" <chris@zankel.net>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "bristot@redhat.com" <bristot@redhat.com>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Mel Gorman <mgorman@suse.de>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>,
 "vgupta@kernel.org" <vgupta@kernel.org>,
 "josh@joshtriplett.org" <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "rcu@vger.kernel.org" <rcu@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "bcain@quicinc.com" <bcain@quicinc.com>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "dalias@libc.org" <dalias@libc.org>, Pv-drivers <Pv-drivers@vmware.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "jonas@southpole.se" <jonas@southpole.se>,
 "yury.norov@gmail.com" <yury.norov@gmail.com>,
 "richard@nod.at" <richard@nod.at>, X86 ML <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "agross@kernel.org" <agross@kernel.org>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "frederic@kernel.org" <frederic@kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "namhyung@kernel.org" <namhyung@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Mon, Jun 13, 2022 at 07:23:13PM +0000, Nadav Amit wrote:
> On Jun 13, 2022, at 11:48 AM, Srivatsa S. Bhat <srivatsa@csail.mit.edu> wrote:
> 
> > ⚠ External Email
> > 
> > On 6/8/22 4:27 PM, Peter Zijlstra wrote:
> >> vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0xde: call to wbinvd() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: default_idle+0x4: call to arch_safe_halt() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: xen_safe_halt+0xa: call to HYPERVISOR_sched_op.constprop.0() leaves .noinstr.text section
> >> 
> >> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > 
> > Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> > 
> >> 
> >> -static inline void wbinvd(void)
> >> +extern noinstr void pv_native_wbinvd(void);
> >> +
> >> +static __always_inline void wbinvd(void)
> >> {
> >>      PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
> >> }
> 
> I guess it is yet another instance of wrong accounting of GCC for
> the assembly blocks’ weight. I guess it is not a solution for older
> GCCs, but presumably ____PVOP_ALT_CALL() and friends should have
> used asm_inline or some new “asm_volatile_inline” variant.

Partially, some of the *SAN options also generate a metric ton of
nonsense when enabled and skew the compilers towards not inlining
things.

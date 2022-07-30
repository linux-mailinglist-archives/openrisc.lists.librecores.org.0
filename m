Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA0B558619E
	for <lists+openrisc@lfdr.de>; Mon,  1 Aug 2022 00:07:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7CDB524A66;
	Mon,  1 Aug 2022 00:07:43 +0200 (CEST)
Received: from server.lespinasse.org (server.lespinasse.org [63.205.204.226])
 by mail.librecores.org (Postfix) with ESMTPS id A03E924A0F
 for <openrisc@lists.librecores.org>; Sat, 30 Jul 2022 11:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=lespinasse.org; i=@lespinasse.org; q=dns/txt; s=srv-79-ed;
 t=1659174480; h=date : from : to : cc : subject : message-id :
 references : mime-version : content-type : in-reply-to : from;
 bh=Zxf3RSaNJoCIr1yVDJrzk/JbWyKzetatYmCU4rexx90=;
 b=cZU78DKx8pFQT/pgVoRK+oC1CZy06YVs0Ncnf0QaLcl424By3Kjx5CkEiKeOCe5qVRr6F
 d5VUO89u24wx67IDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lespinasse.org;
 i=@lespinasse.org; q=dns/txt; s=srv-79-rsa; t=1659174480; h=date :
 from : to : cc : subject : message-id : references : mime-version :
 content-type : in-reply-to : from;
 bh=Zxf3RSaNJoCIr1yVDJrzk/JbWyKzetatYmCU4rexx90=;
 b=E7bNTGGoLCtSak6vdo2mcsTxCf1hzf0BGfTJf+3fxNW8XoC1Irg25HKARFJxMUqglwRiZ
 /+PtdJukPF4I7dMchFGuOTlc6HF+ILudreHXspZ5+iq1EUo4O8wMtq/TUdXSHXBaa5SJ3NO
 jNncE1xXfEZDGhm9tVuTZARivwI3g2bOG161J6kIR/uneTxU5u8uosRneQGgcxDKcMpS14k
 VDxLDCrjKG2W1akV+QJCTqjuPVvOs13Tc5A3x81JQOC51BYOxcxo1P+tMKYHnkvyMojBpOI
 ML3j+Tx2rQv8aS6U1W+HYjpeQRsMxu/Pw3oIh4x81I9GbWbHHfVrH8MXwhjw==
Received: by server.lespinasse.org (Postfix, from userid 1000)
 id B784116096F; Sat, 30 Jul 2022 02:48:00 -0700 (PDT)
Date: Sat, 30 Jul 2022 02:48:00 -0700
From: Michel Lespinasse <michel@lespinasse.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220730094800.GB1587@lespinasse.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
 <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
 <20220729102458.GA1695@lespinasse.org>
 <CAJZ5v0gyPtX=ksCibo2ZN_BztCqUn9KRtRu+gsJ5KetB_1MwEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gyPtX=ksCibo2ZN_BztCqUn9KRtRu+gsJ5KetB_1MwEQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 01 Aug 2022 00:07:35 +0200
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
Cc: Michel Lespinasse <michel@lespinasse.org>,
 Juri Lelli <juri.lelli@redhat.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>, Benjamin Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Alexander Gordeev <agordeev@linux.ibm.com>, srivatsa@csail.mit.edu,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 Matt Turner <mattst88@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, sammy@sammy.net,
 Petr Mladek <pmladek@suse.com>, Linux PM <linux-pm@vger.kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-um@lists.infradead.org, acme@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
 Sven Schnelle <svens@linux.ibm.com>, jolsa@kernel.org,
 Paul Mackerras <paulus@samba.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org,
 vschneid@redhat.com, John Ogness <john.ogness@linutronix.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Will Deacon <will@kernel.org>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jon Hunter <jonathanh@nvidia.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Frederic Weisbecker <frederic@kernel.org>, Len Brown <lenb@kernel.org>,
 linux-xtensa@linux-xtensa.org, Sascha Hauer <kernel@pengutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-alpha@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Stephen Boyd <sboyd@kernel.org>, rh0@fb.com,
 dinguyen@kernel.org, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Joel Fernandes <joel@joelfernandes.org>, Fabio Estevam <festevam@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Josh Triplett <josh@joshtriplett.org>, Kevin Hilman <khilman@kernel.org>,
 linux-csky@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 linux-snps-arc@lists.infradead.org, Mel Gorman <mgorman@suse.de>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Yury Norov <yury.norov@gmail.com>,
 ulli.kroll@googlemail.com, vgupta@kernel.org,
 linux-clk <linux-clk@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, bcain@quicinc.com,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Peter Zijlstra <peterz@infradead.org>, amakhalov@vmware.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>, anton.ivanov@cambridgegreys.com,
 jonas@southpole.se, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Paul E. McKenney" <paulmck@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, namhyung@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jpoimboe@kernel.org,
 Juergen Gross <jgross@suse.com>, pv-drivers@vmware.com,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Johannes Berg <johannes@sipsolutions.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Fri, Jul 29, 2022 at 04:59:50PM +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 29, 2022 at 12:25 PM Michel Lespinasse
> <michel@lespinasse.org> wrote:
> >
> > On Thu, Jul 28, 2022 at 10:20:53AM -0700, Paul E. McKenney wrote:
> > > On Mon, Jul 25, 2022 at 12:43:06PM -0700, Michel Lespinasse wrote:
> > > > On Wed, Jun 08, 2022 at 04:27:27PM +0200, Peter Zijlstra wrote:
> > > > > Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > > > Xeons") wrecked intel_idle in two ways:
> > > > >
> > > > >  - must not have tracing in idle functions
> > > > >  - must return with IRQs disabled
> > > > >
> > > > > Additionally, it added a branch for no good reason.
> > > > >
> > > > > Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on Xeons")
> > > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > >
> > > > After this change was introduced, I am seeing "WARNING: suspicious RCU
> > > > usage" when booting a kernel with debug options compiled in. Please
> > > > see the attached dmesg output. The issue starts with commit 32d4fd5751ea
> > > > and is still present in v5.19-rc8.
> > > >
> > > > I'm not sure, is this too late to fix or revert in v5.19 final ?
> > >
> > > I finally got a chance to take a quick look at this.
> > >
> > > The rcu_eqs_exit() function is making a lockdep complaint about
> > > being invoked with interrupts enabled.  This function is called from
> > > rcu_idle_exit(), which is an expected code path from cpuidle_enter_state()
> > > via its call to rcu_idle_exit().  Except that rcu_idle_exit() disables
> > > interrupts before invoking rcu_eqs_exit().
> > >
> > > The only other call to rcu_idle_exit() does not disable interrupts,
> > > but it is via rcu_user_exit(), which would be a very odd choice for
> > > cpuidle_enter_state().
> > >
> > > It seems unlikely, but it might be that it is the use of local_irq_save()
> > > instead of raw_local_irq_save() within rcu_idle_exit() that is causing
> > > the trouble.  If this is the case, then the commit shown below would
> > > help.  Note that this commit removes the warning from lockdep, so it
> > > is necessary to build the kernel with CONFIG_RCU_EQS_DEBUG=y to enable
> > > equivalent debugging.
> > >
> > > Could you please try your test with the -rce commit shown below applied?
> >
> > Thanks for looking into it.
> >
> > After checking out Peter's commit 32d4fd5751ea,
> > cherry picking your commit ed4ae5eff4b3,
> > and setting CONFIG_RCU_EQS_DEBUG=y in addition of my usual debug config,
> > I am now seeing this a few seconds into the boot:
> >
> > [    3.010650] ------------[ cut here ]------------
> > [    3.010651] WARNING: CPU: 0 PID: 0 at kernel/sched/clock.c:397 sched_clock_tick+0x27/0x60
> > [    3.010657] Modules linked in:
> > [    3.010660] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc1-test-00005-g1be22fea0611 #1
> > [    3.010662] Hardware name: LENOVO 30BFS44D00/1036, BIOS S03KT51A 01/17/2022
> > [    3.010663] RIP: 0010:sched_clock_tick+0x27/0x60
> > [    3.010665] Code: 1f 40 00 53 eb 02 5b c3 66 90 8b 05 2f c3 40 01 85 c0 74 18 65 8b 05 60 88 8f 4e 85 c0 75 0d 65 8b 05 a9 85 8f 4e 85 c0 74 02 <0f> 0b e8 e2 6c 89 00 48 c7 c3 40 d5 02 00
> >  89 c0 48 03 1c c5 c0 98
> > [    3.010667] RSP: 0000:ffffffffb2803e28 EFLAGS: 00010002
> > [    3.010670] RAX: 0000000000000001 RBX: ffffc8ce7fa07060 RCX: 0000000000000001
> > [    3.010671] RDX: 0000000000000000 RSI: ffffffffb268dd21 RDI: ffffffffb269ab13
> > [    3.010673] RBP: 0000000000000001 R08: ffffffffffc300d5 R09: 000000000002be80
> > [    3.010674] R10: 000003625b53183a R11: ffffa012b802b7a4 R12: ffffffffb2aa9e80
> > [    3.010675] R13: ffffffffb2aa9e00 R14: 0000000000000001 R15: 0000000000000000
> > [    3.010677] FS:  0000000000000000(0000) GS:ffffa012b8000000(0000) knlGS:0000000000000000
> > [    3.010678] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    3.010680] CR2: ffffa012f81ff000 CR3: 0000000c99612001 CR4: 00000000003706f0
> > [    3.010681] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [    3.010682] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [    3.010683] Call Trace:
> > [    3.010685]  <TASK>
> > [    3.010688]  cpuidle_enter_state+0xb7/0x4b0
> > [    3.010694]  cpuidle_enter+0x29/0x40
> > [    3.010697]  do_idle+0x1d4/0x210
> > [    3.010702]  cpu_startup_entry+0x19/0x20
> > [    3.010704]  rest_init+0x117/0x1a0
> > [    3.010708]  arch_call_rest_init+0xa/0x10
> > [    3.010711]  start_kernel+0x6d8/0x6ff
> > [    3.010716]  secondary_startup_64_no_verify+0xce/0xdb
> > [    3.010728]  </TASK>
> > [    3.010729] irq event stamp: 44179
> > [    3.010730] hardirqs last  enabled at (44179): [<ffffffffb2000ccb>] asm_sysvec_apic_timer_interrupt+0x1b/0x20
> > [    3.010734] hardirqs last disabled at (44177): [<ffffffffb22003f0>] __do_softirq+0x3f0/0x498
> > [    3.010736] softirqs last  enabled at (44178): [<ffffffffb2200332>] __do_softirq+0x332/0x498
> > [    3.010738] softirqs last disabled at (44171): [<ffffffffb16c760b>] irq_exit_rcu+0xab/0xf0
> > [    3.010741] ---[ end trace 0000000000000000 ]---
> 
> Can you please give this patch a go:
> https://patchwork.kernel.org/project/linux-pm/patch/Yt/AxPFi88neW7W5@e126311.manchester.arm.com/
> ?

I tried, but it didn't change the picture for me.

I'm not sure if that was the patch you meant to send though, as it
seems it's only adding a tracepoint so shouldn't make any difference
if I'm not actually using the tracepoint ?

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F18415BCE9B
	for <lists+openrisc@lfdr.de>; Mon, 19 Sep 2022 16:24:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BB67824AD2;
	Mon, 19 Sep 2022 16:24:43 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 9CA0425B54
 for <openrisc@lists.librecores.org>; Mon, 19 Sep 2022 12:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=eYoUngVW9N27gIhULqYrRlt6uLJ7xBInAkMSAu6ULjk=; b=Ij73wphXljMJWUVviTKuDqPZhp
 17e2HpP2XUZvIm72WBG7HRFIFj+7gfL8MzcE2u8uVZa75Ug0NOLh6Jo9K0OzCAAbmFXzQGTGsr3no
 wU+nQSRqmaoK4oh5m7eCdzV4ayTPQhHWh3bXZszmdpw53MzLGQ4TxfnnDnyOMCth1WFLh9R8fUYmK
 /6EYCH2gb/vXiihmgHFnsduufEMZY5OcI61sbS6ewGPmyKgeJRB221D8HstksAgGk6ZaxYB5igHxB
 K5S7A+j6jWOoio3pKI4So9hGF/Yc4sXdIGfZhqJOma/Bv6Afx77/wHaFynD9cIU0w6i7MArAN9NVa
 lRcOIM+A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oaDqB-004bEk-2s; Mon, 19 Sep 2022 10:17:27 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A3C95302F83;
 Mon, 19 Sep 2022 12:16:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id ABA4E2BAC75B6; Mon, 19 Sep 2022 12:16:22 +0200 (CEST)
Message-ID: <20220919101523.244550344@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 19 Sep 2022 12:00:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Subject: [PATCH v2 43/44] sched: Always inline __this_cpu_preempt_check()
References: <20220919095939.761690562@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Mon, 19 Sep 2022 16:24:30 +0200
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

vmlinux.o: warning: objtool: in_entry_stack+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: fpu_idle_fpregs+0x41: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xb0: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xae: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: irqentry_nmi_enter+0x69: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves .noinstr.text section
vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x45: call to __this_cpu_preempt_check() leaves .noinstr.text section

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/percpu-defs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -310,7 +310,7 @@ extern void __bad_size_call_parameter(vo
 #ifdef CONFIG_DEBUG_PREEMPT
 extern void __this_cpu_preempt_check(const char *op);
 #else
-static inline void __this_cpu_preempt_check(const char *op) { }
+static __always_inline void __this_cpu_preempt_check(const char *op) { }
 #endif
 
 #define __pcpu_size_call_return(stem, variable)				\



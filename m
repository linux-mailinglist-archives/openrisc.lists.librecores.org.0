Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9759F5477C3
	for <lists+openrisc@lfdr.de>; Sat, 11 Jun 2022 23:54:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C3906248F0;
	Sat, 11 Jun 2022 23:54:07 +0200 (CEST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mail.librecores.org (Postfix) with ESMTPS id 5C69E20E4E
 for <openrisc@lists.librecores.org>; Thu,  9 Jun 2022 13:31:10 +0200 (CEST)
Received: by mail-ej1-f51.google.com with SMTP id v1so36168061ejg.13
 for <openrisc@lists.librecores.org>; Thu, 09 Jun 2022 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
 b=dD0Bz9eW32MHk+TeRLS+QqFpXQSyJG1PFuM0sFc2oIQiPmRbBKI4wiAjUnrY0TOPB3
 vmLpoVIxPESYT9ISrrirk39KtLhSpCgEKtG3yrDCpv/Gh6ZWSamp4kS8RJg23gIGNIEa
 lDd2yagv7BcuRvFzrWxMhthjwknH7br96szys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
 b=vI0kSCGdNneJk2xUN05IjyrrTb+qra+p568vocIpGdm7OcPGGUVzSuQEaJShvFHevK
 B4M+NeT3CvnpnU+AxI2PFdB4jHUNYB4SSSOJhU4fv5g7OQWulVVQszoLFnOa4bduFjVk
 typeFao+Xq8CdcpNxELVmg4mzvZuIvvULDJx4gLycXMlKwdhpArYK1z2xOYJe8xxY0IT
 +NY7x1x8myIUZGCw7bUXehNu4GtHycPOM65x/zvqI1v/curzbNmeBnRW09Hzx/IzECVG
 hixWl/2suxUpQyKGCJBVSbAsDdzSpwLjWtXShfq4b/O3AeCjC32IJqjtnxzoUtTP4xcV
 XdcA==
X-Gm-Message-State: AOAM531m5izTFhbqEhwY9MurQodnpHpSsxIuPLq4zOkqccE8o6YCTvqN
 vccOUhBgmW0Byhjgx2vaGUbbsj5tlEsSZfM5i1f3Nw==
X-Google-Smtp-Source: ABdhPJx9nV7wAxP/lyAtNedlGfDPIROj9YXpatcH7EqCac1uVlfTSKszMzYbWUxkatf8WgjTCZNOZTjPAlJBoltWDx4=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr13928684ejc.62.1654774269713; Thu, 09
 Jun 2022 04:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
In-Reply-To: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Thu, 9 Jun 2022 20:30:58 +0900
Message-ID: <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
 jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de,
 linux-omap@vger.kernel.org, dietmar.eggemann@arm.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, svens@linux.ibm.com, jolsa@kernel.org,
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

My emails are getting rejected... Let me try web-interface

Kudos to Petr for the questions and thanks to PeterZ for the answers.

On Thu, Jun 9, 2022 at 7:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
> This is the tracepoint used to spool all of printk into ftrace, I
> suspect there's users, but I haven't used it myself.

I'm somewhat curious whether we can actually remove that trace event.

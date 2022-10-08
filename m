Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 409BA5F8723
	for <lists+openrisc@lfdr.de>; Sat,  8 Oct 2022 21:40:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 086EA24B30;
	Sat,  8 Oct 2022 21:40:37 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 924EB24B30
 for <openrisc@lists.librecores.org>; Sat,  8 Oct 2022 21:40:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E09E3B80BD9;
 Sat,  8 Oct 2022 19:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B91C433D6;
 Sat,  8 Oct 2022 19:40:20 +0000 (UTC)
Date: Sat, 8 Oct 2022 15:40:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
Message-ID: <20221008154016.0f7ecd8f@rorschach.local.home>
In-Reply-To: <Y0CFnWDpMNGajIRD@fuller.cnet>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 Marc Zyngier <maz@kernel.org>, linux-hexagon@vger.kernel.org, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S.
 Miller" <davem@davemloft.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Fri, 7 Oct 2022 17:01:33 -0300
Marcelo Tosatti <mtosatti@redhat.com> wrote:

> > As for the targeted CPUs, the existing tracepoint does export them, albeit in
> > cpumask form, which is quite inconvenient from a tooling perspective. For
> > instance, as far as I'm aware, it's not possible to do event filtering on a
> > cpumask via trace-cmd.  
> 
> https://man7.org/linux/man-pages/man1/trace-cmd-set.1.html
> 
>        -f filter
>            Specify a filter for the previous event. This must come after
>            a -e. This will filter what events get recorded based on the
>            content of the event. Filtering is passed to the kernel
>            directly so what filtering is allowed may depend on what
>            version of the kernel you have. Basically, it will let you
>            use C notation to check if an event should be processed or
>            not.
> 
>                ==, >=, <=, >, <, &, |, && and ||
> 
>            The above are usually safe to use to compare fields.

We could always add an "isset(x)" filter ;-)

-- Steve

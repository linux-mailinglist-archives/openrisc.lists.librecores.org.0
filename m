Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 499AF5694BF
	for <lists+openrisc@lfdr.de>; Wed,  6 Jul 2022 23:55:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C782B21247;
	Wed,  6 Jul 2022 23:55:28 +0200 (CEST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mail.librecores.org (Postfix) with ESMTPS id 165242133D
 for <openrisc@lists.librecores.org>; Wed,  6 Jul 2022 11:46:50 +0200 (CEST)
Received: by mail-qk1-f170.google.com with SMTP id z16so10616665qkj.7
 for <openrisc@lists.librecores.org>; Wed, 06 Jul 2022 02:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8jOPstF035V3JBIGTjyEra8xnCZ4RAIho4NrHeIzoU=;
 b=2u3wRku5vJYRxhS20P6nHNsb6KSMX6b9MN6GltRfjqUB829BOM2qtUHuYO2NJ+u4Hd
 yWbmKatwmRmjVBe/QUFBfon3eZq3WuCoHbSSES/nQo7MLzRSj8od18p2uOETJKHRUfhk
 ODdeUBZx/lF5ZojzuUG8RqYBq9/wv0O/BVvkg61dQTTAaNFmshB2ncGreC7UdxbUy9SK
 vuy0nuSZl1BQmE7zKNj+cwLOd2wfOmHkBLiv95NGDU0TlfdUiyk3gQ2rk2TG6ZUzaUH9
 +bQ5uvvWkMB6JvvfVDb1JP62wuL/ug+j9u7HG5DI1aKJS7P3RUvEv86eryztXdAn9OKM
 HcjA==
X-Gm-Message-State: AJIora9gqM/SD+aPcEWrIWP/6FBLxDBhaCIHGREwGKfvwgPQ8LipLHFa
 dx4OThgjlABgwaAYD+GsOrWD3oXZBfpaVmxf
X-Google-Smtp-Source: AGRyM1sS4HzvNTluf4LyB49jy3AvWySgae4dSPYn7/y6nwTH2g6dhxqYZlKjnUQ2TN0wZmgqOpwJ3w==
X-Received: by 2002:a05:620a:1b8f:b0:6af:337a:5067 with SMTP id
 dv15-20020a05620a1b8f00b006af337a5067mr25960728qkb.343.1657100808842; 
 Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176]) by smtp.gmail.com with ESMTPSA id
 t19-20020a05622a01d300b00304f3e320f2sm26163875qtw.4.2022.07.06.02.46.47
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id r3so26416291ybr.6
 for <openrisc@lists.librecores.org>; Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
X-Received: by 2002:a05:6902:50e:b0:66e:7f55:7a66 with SMTP id
 x14-20020a056902050e00b0066e7f557a66mr6648581ybs.365.1657100796735; Wed, 06
 Jul 2022 02:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org>
 <20220608144517.124597382@infradead.org>
In-Reply-To: <20220608144517.124597382@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 11:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Subject: Re: [PATCH 19/36] objtool/idle: Validate __cpuidle code as noinstr
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 06 Jul 2022 23:55:27 +0200
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
 Linus Walleij <linus.walleij@linaro.org>, bsegall@google.com,
 guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com,
 srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org,
 mpe@ellerman.id.au, chenhuacai@kernel.org, linux-acpi@vger.kernel.org,
 agross@kernel.org, NXP Linux Team <linux-imx@nxp.com>, catalin.marinas@arm.com,
 xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>,
 borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net,
 pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
 acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
 dietmar.eggemann@arm.com, Richard Henderson <rth@twiddle.net>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
 svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com,
 linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 virtualization@lists.linux-foundation.org,
 James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com,
 thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com,
 linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de,
 ysato@users.sourceforge.jp, linux-sh@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, deller@gmx.de, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org,
 lenb@kernel.org, linux-xtensa@linux-xtensa.org,
 Sascha Hauer <kernel@pengutronix.de>, gor@linux.ibm.com,
 linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com,
 alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
 linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org,
 boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org,
 pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, Vineet Gupta <vgupta@kernel.org>,
 linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com,
 Shawn Guo <shawnguo@kernel.org>, davem@davemloft.net, dalias@libc.org,
 tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com,
 jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, mingo@redhat.com, aou@eecs.berkeley.edu,
 paulmck@kernel.org, hca@linux.ibm.com, openrisc@lists.librecores.org,
 paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org,
 andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com,
 monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Wed, Jun 8, 2022 at 4:46 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Idle code is very like entry code in that RCU isn't available. As
> such, add a little validation.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>  arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
>  arch/m68k/kernel/vmlinux-std.lds     |    1 -
>  arch/m68k/kernel/vmlinux-sun3.lds    |    1 -

FWIW
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 552DB543FB4
	for <lists+openrisc@lfdr.de>; Thu,  9 Jun 2022 01:00:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ED0D1249D7;
	Thu,  9 Jun 2022 01:00:33 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id AB5E1249B5
 for <openrisc@lists.librecores.org>; Wed,  8 Jun 2022 22:03:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93CBAB82AC4;
 Wed,  8 Jun 2022 20:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFC6C34116;
 Wed,  8 Jun 2022 20:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654718595;
 bh=YZj1RmoUZo+LYT5ptsLh5yk+BpSbCXtp2v5Q3jvJ2yk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rOeLrE8rnpKlWp1L6QV8jwDsJJaMtcMr7WDG2/vqLSawxjnGItPceVZFlHTUrnWyn
 9+efmotoys2/zcmyQ+2SiY2vmlncrC9YSx9eX2LtQ3gTK4bn8zXIJLPC3S1yBpMZZw
 2qreZHAHeGZgvi1VuNxh+OEn8aBYZhVnWOgh8n+AYCKFEvGc8lv11v15OZafMlMiPE
 0xDVpRNMj8gOLpIXJeYzglBnvFvkh+GCkt4QDHid18PobTg6Mb0qcnz3/6cipnr2To
 eQCv7sinD98qIhIYXSEjsJPBZidTnTnYxN2cPw54PLu4ECKoLyinDEhUapDw9DnRAK
 XLR4CpCut9s5A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220608144518.199614455@infradead.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.199614455@infradead.org>
Subject: Re: [PATCH 36/36] cpuidle,clk: Remove trace_.*_rcuidle()
From: Stephen Boyd <sboyd@kernel.org>
To: peterz@infradead.org
Date: Wed, 08 Jun 2022 13:03:13 -0700
User-Agent: alot/0.10
Message-Id: <20220608200315.0DFC6C34116@smtp.kernel.org>
X-Mailman-Approved-At: Thu, 09 Jun 2022 00:59:57 +0200
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
Cc: juri.lelli@redhat.com, rafael@kernel.org,
	benh@kernel.crashing.org, linus.walleij@linaro.org,
	bsegall@google.com, guoren@kernel.org, pavel@ucw.cz,
	agordeev@linux.ibm.com, srivatsa@csail.mit.edu,
	linux-arch@vger.kernel.org, vincent.guittot@linaro.org,
	mpe@ellerman.id.au, chenhuacai@kernel.org,
	linux-acpi@vger.kernel.org, agross@kernel.org, linux-imx@nxp.com,
	catalin.marinas@arm.com, xen-devel@lists.xenproject.org,
	mattst88@gmail.com, borntraeger@linux.ibm.com,
	mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com,
	linux-pm@vger.kernel.org, jiangshanlai@gmail.com,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org,
	acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org,
	dietmar.eggemann@arm.com, rth@twiddle.net,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, senozhatsky@chromium.org,
	t@lists.librecores.org, jolsa@kernel.org, paulus@samba.org,
	lenb@kernel.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org,
	dave.hansen@linux.intel.com,
	virtualization@lists.linux-foundation.org,
	James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com,
	thierry.reding@gmail.com, kernel@xen0n.name,
	quic_neeraju@quicinc.com, linux-s390@vger.kernel.org,
	vschneid@redhat.com, john.ogness@linutronix.de,
	ysato@users.sourceforge.jp, linux-sh@vger.kernel.org,
	festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org,
	jonathanh@nvidia.com, mathieu.desnoyers@efficios.com,
	frederic@kernel.org, svens@linux.ibm.com, kernel@pengutronix.de,
	gor@linux.ibm.com, linux-arm-msm@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-arm-kernel@lists.infradead.org, chris@zankel.net,
	dinguyen@kernel.org, bristot@redhat.com,
	alexander.shishkin@linux.intel.com, lpieralisi@kernel.org,
	linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org,
	boris.ostrovsky@oracle.com, khilman@kernel.org,
	linux-csky@vger.kernel.org, pv-drivers@vmware.com,
	linux-snps-arc@lists.infradead.org, richard@nod.a, mgorman@suse.de,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	ulli.kroll@googlemail.com, vgupta@kernel.org,
	linux-clk@vger.kernel.org, josh@joshtriplett.org,
	rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de,
	bcain@quicinc.com, tsbogend@alpha.franken.de,
	linux-parisc@vger.kernel.org, sudeep.holla@arm.com,
	shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org,
	tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org,
	hpa@zytor.com, sparclinux@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
	anton.ivanov@cambridgegreys.com, jonas@southpole.se,
	yury.norov@gmail.com, a.org@lists.librecores.org, x86@kernel.org,
	linux@armlinux.org.uk, linux-xtensa@linux-xtens, mingo@redhat.com,
	aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com,
	openrisc@lists.librecores.org, paul.walmsley@sifive.com,
	linux-tegra@vger.kernel.org, namhyung@kernel.org,
	andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org,
	jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org,
	palmer@dabbelt.com, anup@brainfault.org, ink@jurassic.park.msu.ru,
	johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Quoting Peter Zijlstra (2022-06-08 07:27:59)
> OMAP was the one and only user.
>=20
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

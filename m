Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C561E61E
	for <lists+openrisc@lfdr.de>; Sun,  6 Nov 2022 22:06:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2A64524B16;
	Sun,  6 Nov 2022 22:05:58 +0100 (CET)
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mail.librecores.org (Postfix) with ESMTPS id 8B3F524C0F
 for <openrisc@lists.librecores.org>; Thu,  3 Nov 2022 16:02:16 +0100 (CET)
Received: from zn.tnic (p200300ea9733e7e7329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e7e7:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E2C1D1EC0528;
 Thu,  3 Nov 2022 16:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1667487736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=5zOKDwJu4FB0xil2b5a/FPJvsZt45ByyRxSMQsaaDR8=;
 b=QSTgD6Ncd3yLcOSJYmXGo3EY1DApfHw02ztOKs7k0PAMuO15QSqsfMgfLs99GK7c8D6O5M
 EIOEJproe4r8R5EXjhGGomlU7hRESTU4jQUJYXGQ2n64qCj7A3JMaFvsauSzmA31U5bm9T
 1HVpbEVPWdzipSAdtoW/ML7JHqLy6kc=
Date: Thu, 3 Nov 2022 16:02:12 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2PX9GfxWYh6+XGT@zn.tnic>
References: <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop> <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic> <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic> <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic> <20221103125945.lrr5oxxmylwpam53@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221103125945.lrr5oxxmylwpam53@kamzik>
X-Mailman-Approved-At: Sun, 06 Nov 2022 22:05:56 +0100
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>,
 Albert Ou <aou@eecs.berkeley.edu>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> The patch I'm proposing ensures cpumask_next()'s range, which is actually
> [-1, nr_cpus_ids - 1),

Lemme make sure I understand it correctly: on the upper boundary, if you
supply for n the value nr_cpu_ids - 2, then it will return potentially
the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).

If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
further bits set.

Yes, no?

> I'll send a v4 with another stab at the commit message.

Yes, and it is still an unreadable mess: "A kernel compiled with commit
... but not its revert... " Nope.

First make sure cpumask_next()'s valid accepted range has been settled
upon, has been explicitly documented in a comment above it and then I'll
take a patch that fixes whatever is there to fix.

Callers should not have to filter values before passing them in - the
function either returns an error or returns the next bit in the mask.

This thing:

	if (*pos == nr_cpu_ids)

but then to pass in pos - 1:

	*pos = cpumask_next(*pos - 1

looks to me like the interface needs more cooking.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1895861E620
	for <lists+openrisc@lfdr.de>; Sun,  6 Nov 2022 22:06:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E565224A8D;
	Sun,  6 Nov 2022 22:05:58 +0100 (CET)
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by mail.librecores.org (Postfix) with ESMTPS id 7DF302593C
 for <openrisc@lists.librecores.org>; Thu,  3 Nov 2022 17:49:10 +0100 (CET)
Received: from zn.tnic (p200300ea9733e7e7329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e7e7:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3F291EC04F0;
 Thu,  3 Nov 2022 17:49:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1667494150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=2ASRoXT4dNz3rsz3g7wk4DQzgAno9/V5MAy7ltfZSS0=;
 b=GEBGVYysxzMU6LGJTmZd7M+/R/6mbCD6zp4ZSzgggbaUSAV0SVqDm2Gc6AAhFjue3w91tt
 IAhvE9D7fZ+NRgIf5TsYL8evNAQClXdM104Vgktn6WclPvN36r3al1OF9AVLqkFvz+Oj+i
 92QAmiYx47vWftNfKrMeen4/XGStEic=
Date: Thu, 3 Nov 2022 17:49:06 +0100
From: Borislav Petkov <bp@alien8.de>
To: yury.norov@gmail.com
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2PxAiJ1yNzcUSgs@zn.tnic>
References: <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic> <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic> <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic> <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic> <20221103153404.uh77nrdkowrxj6cr@kamzik>
 <Y2PsvvOWVs9ZLBsp@yury-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2PsvvOWVs9ZLBsp@yury-laptop>
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
 Alexander Gordeev <agordeev@linux.ibm.com>, x86@kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>,
 Albert Ou <aou@eecs.berkeley.edu>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, Nov 03, 2022 at 09:30:54AM -0700, yury.norov@gmail.com wrote:a
> Callers should pass sane arguments into internal functions if they
> expect sane output.

What internal function? It's in a global header.

> The API not exported to userspace shouldn't sanity-check all inputs
> arguments.

That doesn't have anything to do with userspace at all.

APIs exported to the rest of the kernel should very well check their
inputs. Otherwise they're not APIs - just some random functions which
are visible to the compiler.

> So, the portable code shouldn't expect from cpumasks more than
> documentation said: for a _valid_ offset cpumask_next() returns next
> set bit or >= nr_cpu_ids.

Lemme quote from my previous mail:

"First make sure cpumask_next()'s valid accepted range has been settled
upon, has been explicitly documented"

So where is that valid range documented?

> cpumask_check() has been broken for years. Attempting to fix it faced
> so much resistance, that I had to revert the patch.

The suggestion on that thread made sense: you first fix the callers and
then the interface. Just like any other "broken" kernel API.

Nothing's stopping you from fixing it properly - it'll just take a while
and if it is such a widely used interface, you probably should come up
with a strategy first how to fix it without impacting current use.

Interfaces and their in-kernel users get refactored constantly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 598FB519DAC
	for <lists+openrisc@lfdr.de>; Wed,  4 May 2022 13:10:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 29E9D248EC;
	Wed,  4 May 2022 13:10:25 +0200 (CEST)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id 01711242C4
 for <openrisc@lists.librecores.org>; Wed,  4 May 2022 13:10:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 65B3CCE1386
 for <openrisc@lists.librecores.org>; Wed,  4 May 2022 11:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAEBC385AE
 for <openrisc@lists.librecores.org>; Wed,  4 May 2022 11:10:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kyRhvdzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651662616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sChtuXGZ9YP+4H0o5k4v/GPndPTTWnkPojaSeBimyOM=;
 b=kyRhvdzKz9H+ZU4RPqEcqPiXLYj1YbA3Oxi2R34QJnIuisAir7Ml0yWY8uKwtieIKuIM3w
 yWTa2iDsdIQx7P4YyVFhOCuWsapeoBiWz3fu8KZDJSxVxL7vBq4Vm/hA53X8sip88FRgDu
 PXP377wfz7IBIoq/SFPwMPzAWoO/qtk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a19ede76
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <openrisc@lists.librecores.org>;
 Wed, 4 May 2022 11:10:16 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2f7d621d1caso11106397b3.11
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 04:10:16 -0700 (PDT)
X-Gm-Message-State: AOAM532nzAYYL14w4KMdROTB5dOANFM8c3P5jKHpZ09AOMhKyFAunph4
 LLfJaK2uecmA4MuPgK7ZPzkS+KJw8BFQG/E0X4Q=
X-Google-Smtp-Source: ABdhPJwMiZUuiuxWJRySwh0SK+aGojTawLBmdtaeP3evtNqT/kWZFLtbBfHaiI5YSEXGP27AJzWPXE74J1gpzuBA2lo=
X-Received: by 2002:a81:2541:0:b0:2f8:efd7:8962 with SMTP id
 l62-20020a812541000000b002f8efd78962mr17268902ywl.404.1651662615314; Wed, 04
 May 2022 04:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220502232800.259036-1-Jason@zx2c4.com>
 <20220503094533.402157-1-Jason@zx2c4.com> <YnGPDumfp1+6DUQG@antec>
In-Reply-To: <YnGPDumfp1+6DUQG@antec>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 May 2022 13:10:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
Message-ID: <CAHmME9prmCzpg6h-j3o7zUiYzePuegqJOAGSH167H4L-DH=QMg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/openrisc: use right OMPIC size variable
To: Stafford Horne <shorne@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openrisc@lists.librecores.org, richard.henderson@linaro.org,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Tue, May 3, 2022 at 10:22 PM Stafford Horne <shorne@gmail.com> wrote:
>
> On Tue, May 03, 2022 at 11:45:33AM +0200, Jason A. Donenfeld wrote:
> > This appears to be a copy and paste error. The UART size was used
> > instead of the much smaller OMPIC size. But actually that smaller OMPIC
> > size is wrong too and doesn't allow the IPI to work in Linux. So set it
> > to the old value.
> >
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  hw/openrisc/openrisc_sim.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index 99b14940f4..3218db6656 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -78,7 +78,7 @@ static const struct MemmapEntry {
> >      [OR1KSIM_DRAM] =      { 0x00000000,          0 },
> >      [OR1KSIM_UART] =      { 0x90000000,      0x100 },
> >      [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
> > -    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
> > +    [OR1KSIM_OMPIC] =     { 0x98000000,      0x100 },
>
> Right, I missed this as part of my series.  OMPIC will allocate 2 32-bit
> registers per CPU.  I documented this here:
>
>   - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/irqchip/irq-ompic.c
>
> I think what we will want here is something like:
>
> [OR1KSIM_OMPIC] =     { 0x98000000, 8 * OR1KSIM_CPUS_MAX },

Do you want a v3 or are you going to fix it up yourself?

Jason

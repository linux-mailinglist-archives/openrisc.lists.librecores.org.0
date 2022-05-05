Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6927151B686
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 05:21:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 46239248EB;
	Thu,  5 May 2022 05:21:42 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 8C9F924840
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 05:21:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4255661977
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2DBC385BA
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651720897;
 bh=WI76IzBl5E+DVGCHLZoWTBt/u6JBPeoGf/8qPZFcVao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dD8GAhv1JedQ8m+DwFkBY7KL0AYcMUyju8/h+Wd1qK/l8GGy/ThsplwdZRal1beO0
 FWmDAzketLrU8KsCO7XLtzf4ghKg5Kl5rsFUVgmWp0aSWrk0IXL6n7iolctNNr86Ym
 wlYxAx02eGzHs4u6aTi0pTLuG5UhDWuaPgdu5TWBE+vspZ3iW4niDtqADKKTENHeYx
 PSWLz/H/FyqKeOB/rxN5Y9L4CqXxsUSU7iTc1QBNsjUrpPubrh++9Oohta/OxF2g/s
 dfRCn0NOviMP3K90DhKmWPIEURG0G/JD5K2bGRTf5T+5Ynf4cgcVOZRStTvPxWhvnx
 TfVnA4bXUlCLg==
Received: by mail-ua1-f45.google.com with SMTP id f13so1206319uax.11
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 20:21:37 -0700 (PDT)
X-Gm-Message-State: AOAM5321x1dMCmxoH1KYKdg9DUFCcepsoFfXjyH3ub9s2LCskG5FEDL7
 DMq4FWqPYNNiRyLb7JemM2Hg/db/dCIGI0JoMrA=
X-Google-Smtp-Source: ABdhPJz7HX2dmfOkhWZMgS9lfnbrZYrBU9XtWlH/KZSbKdZYqPn9l6+QzwX4PKswK0JznE1x6+YJtNZui3FYrsicNLI=
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr7073593uao.114.1651720896690; Wed, 04
 May 2022 20:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-6-palmer@rivosinc.com>
 <3428595.iIbC2pHGDl@diego>
In-Reply-To: <3428595.iIbC2pHGDl@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:21:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSAbjTOjG+BhR-NW4i=Zqtb4eJ=5dTfxU1bU2Oc8V=2Wg@mail.gmail.com>
Message-ID: <CAJF2gTSAbjTOjG+BhR-NW4i=Zqtb4eJ=5dTfxU1bU2Oc8V=2Wg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 jszhang@kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, linux-arch <linux-arch@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Boqun Feng <boqun.feng@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, May 4, 2022 at 8:02 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Samstag, 30. April 2022, 17:36:24 CEST schrieb Palmer Dabbelt:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > Our existing spinlocks aren't fair and replacing them has been on the
> > TODO list for a long time.  This moves to the recently-introduced ticke=
t
> > spinlocks, which are simple enough that they are likely to be correct
> > and fast on the vast majority of extant implementations.
> >
> > This introduces a horrible hack that allows us to split out the spinloc=
k
> > conversion from the rwlock conversion.  We have to do the spinlocks
> > first because qrwlock needs fair spinlocks, but we don't want to pollut=
e
> > the asm-generic code to support the generic spinlocks without qrwlocks.
> > Thus we pollute the RISC-V code, but just until the next commit as it's
> > all going away.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> on riscv64+riscv32 qemu, beaglev and d1-nezha
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>
>


--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

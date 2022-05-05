Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE6551B692
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 05:30:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2376D248EC;
	Thu,  5 May 2022 05:30:27 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 8BBE1248EB
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 05:30:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 16A3AB82B20
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EA6C385B3
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651721423;
 bh=vOH0kAdmR1eNZn7dq7qeSAVj/s+a8/0GdFuCXLUW/CU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g+9CtdtO3/zzV1+bZ2QmOejc7pc6dzZz5V0iTRIcx1bdlYXlMHrs9nQqg10r/BeYs
 +PmvWnmGptI78zUdjkwjx425vxkvJixLXLplrhuBg86OnLbNCrvh/M64SOvKglEE7s
 0EjNWcc7pr28auxz3kD64IaTwkSpy2qGJiCIvsSSsgdLp6NiCzjf1gNecbuBIFY5tR
 OM5TFGUGGcWe4m9ktlTyOKeRL1GmMjEVGuX31mfWrJbyYnZVyp1slkTqDDEDsRonTS
 p54NUkVH61i1VhOaYPi3pWgpqZoPBA/yCGJdCl1YnaYAHSCWgzgfOKzyePzU9CTlQA
 ur4WWGWOtmk9w==
Received: by mail-ua1-f54.google.com with SMTP id z15so1219616uad.7
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 20:30:22 -0700 (PDT)
X-Gm-Message-State: AOAM532p1317pg+YBnWLUf8qivOfBhbGhum5FMf4wViBXUMB0pIVdR+O
 0vo4ob6zr3Sxd9cu/BYkMdr4F5tzO1UBFlELqV4=
X-Google-Smtp-Source: ABdhPJzbU/iPzb/jLBOfTd8HLatPunLFi+iu4xyj0d3kkgDuJ1vstUU5IUyh/crnvfi60C0KDYx5aW4fbp9tD6SDpKg=
X-Received: by 2002:ab0:2a87:0:b0:362:9cdb:8b64 with SMTP id
 h7-20020ab02a87000000b003629cdb8b64mr7496584uar.83.1651721421926; Wed, 04 May
 2022 20:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-2-palmer@rivosinc.com>
 <2180881.iZASKD2KPV@diego>
In-Reply-To: <2180881.iZASKD2KPV@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:30:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSjwu3-SLfXAh=UrqSq28mq_7nxbFNQ9j9kqY32EiXcJw@mail.gmail.com>
Message-ID: <CAJF2gTSjwu3-SLfXAh=UrqSq28mq_7nxbFNQ9j9kqY32EiXcJw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
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

On Wed, May 4, 2022 at 7:57 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Samstag, 30. April 2022, 17:36:20 CEST schrieb Palmer Dabbelt:
> > From: Peter Zijlstra <peterz@infradead.org>
> >
> > This is a simple, fair spinlock.  Specifically it doesn't have all the
> > subtle memory model dependencies that qspinlock has, which makes it mor=
e
> > suitable for simple systems as it is more likely to be correct.  It is
> > implemented entirely in terms of standard atomics and thus works fine
> > without any arch-specific code.
> >
> > This replaces the existing asm-generic/spinlock.h, which just errored
> > out on SMP systems.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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

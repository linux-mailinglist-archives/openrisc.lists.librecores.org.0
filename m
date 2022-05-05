Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA4C51B67A
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 05:21:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 16B47248F5;
	Thu,  5 May 2022 05:21:00 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 3FEE924840
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 05:20:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23C0C61929
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F8FC385B9
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 03:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651720857;
 bh=8W4kBn4cvHk6r3+lwf/6ButOTrWe/kiGQICQ5Hzrtlw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ULiDy+TNuXJo6HQ4a4XM1jHiaWkDRP5O+X8fId3NvLdKPBzT0svQn/OTP9SK+6huD
 5Garqm1aRrc92H33s0ghHBKvEt/mrrGT0KJOmAlZtUOeyrvGkuP8DDUFHMh0cmzdsP
 zaQMmdQmhZn0ivopaD05gh26RZspyaqNIGsbjV4F+LYn856W2yQHDl0C/D4KxcYbtZ
 f/9G1my/QNQ1n99xy6RdAZn507oz6/cU2wqOjcENbnJhK2brcnXcDFfTrteXI1JuCd
 tRJlgFhYbyMjx37jsZQb1Qn8XUbIpswzMnE3SaBz+vVw3eAoa/WXX7tuuF/pCQTpRd
 1yMP7pi7WgKng==
Received: by mail-vk1-f172.google.com with SMTP id s68so1527701vke.6
 for <openrisc@lists.librecores.org>; Wed, 04 May 2022 20:20:56 -0700 (PDT)
X-Gm-Message-State: AOAM531/IjhJYYYU8nRk9uo4lueDGRrG6y7eRERV1C4v/2ItCsgN2YMo
 mapWEq1xMzNXMuXMmdCkwOUTXC3xFFnVaoOSBI4=
X-Google-Smtp-Source: ABdhPJyJZejNzSZk8O7z5JR3mWL5/1Sv673cZFpbPSQ+7GqKCT9F24kk4CFIyITIIwUZE190BgkA/I9p6RX4tzvx38w=
X-Received: by 2002:a1f:1856:0:b0:34e:be86:97b4 with SMTP id
 83-20020a1f1856000000b0034ebe8697b4mr5873966vky.8.1651720855656; Wed, 04 May
 2022 20:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-7-palmer@rivosinc.com>
 <3100713.5fSG56mABF@diego>
In-Reply-To: <3100713.5fSG56mABF@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:20:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRspLiaSExBMOXODTokhBofUXrF7sKAT8wp-XnKf3VJ=g@mail.gmail.com>
Message-ID: <CAJF2gTRspLiaSExBMOXODTokhBofUXrF7sKAT8wp-XnKf3VJ=g@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] RISC-V: Move to queued RW locks
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

On Wed, May 4, 2022 at 8:03 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Samstag, 30. April 2022, 17:36:25 CEST schrieb Palmer Dabbelt:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > Now that we have fair spinlocks we can use the generic queued rwlocks,
> > so we might as well do so.
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

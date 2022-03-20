Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 854D84E198E
	for <lists+openrisc@lfdr.de>; Sun, 20 Mar 2022 04:36:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1347C24806;
	Sun, 20 Mar 2022 04:36:46 +0100 (CET)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mail.librecores.org (Postfix) with ESMTPS id 2500C242D4
 for <openrisc@lists.librecores.org>; Sun, 20 Mar 2022 04:36:44 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id r13so23936396ejd.5
 for <openrisc@lists.librecores.org>; Sat, 19 Mar 2022 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RX+wAIU08pZOCcEO0NZztSrVKhdsGwNyZR/deDLMb/U=;
 b=qjVp2JKIypspQwQFfigWj03ByHirMGiir2cjMrv7ibmXcaqsnOMapEC2xHMaHQ+Md9
 e+JFdeKSciAOuB/C29vBmckTRm/0TC3OEazRnJVxegrXKIXHviUvhRYWWHl9+o5X02me
 Rq0O7DBAPrtbVLOIYE+7xNErdUzo/fBH7KW+eXS0fKc+UD+K2zZjm8AvN5v+HuvydnbK
 6W5++n5+USgaMsts8ldkikMIlRQBEXw8BER9180/0LmvC+v9KviPVwdyGzQzWMPJxdyQ
 skjuqmkwDRAgTQkZBP5HS8r2FKFHKjOFa9+/e1xw9Xx2KsmXWpGvmLcKFmMrAvrI8WRX
 sk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RX+wAIU08pZOCcEO0NZztSrVKhdsGwNyZR/deDLMb/U=;
 b=fQELdvrp5O+MQzYmzbObMHLRbFLfhuoVjKvFAejVF/CT6Zmjf5FI+755lR104dQ7kB
 Gnubq4xl6zAnQWy0Hx+7TqXBkQLbztULvQt9Jp1iLN46OnynfyHntK4fVyY8+ia/02K5
 hp83vMHMrZX/IPV7nBR+CuwlCCaxddBmosIULeVyCfl9Hmb15dNFPxNSwopSpmw0llco
 GLiKHdD6ucOqCF9L7/+zCAvhaQOSqzL9Yg4cMel0QGR5JVe1scwwjqfzZ9JS4dk2U0PG
 hGEYGRhwTWDLYx11PhbcCxxKCYbc8BGdzJbmeeZzqFbSysM+COG5DgmcOIfhwvSWqDKs
 BWpA==
X-Gm-Message-State: AOAM533IuJsexBf53MjrUZHQBegv6iuqKhalXG78YQqgu0eNBj//gnfz
 vZ8U1ivuJa3i5JP3EsKTVvDH2myZ4E+Vzu4Ek+k=
X-Google-Smtp-Source: ABdhPJwoorXBzHML9VB00eSxayzGeBtdziQYR6NMlBjvMSUtJ2qP1GM8l3is5JN2sq1ZBdxc3Tghc1iAHCcCuLp1EqU=
X-Received: by 2002:a17:907:1c19:b0:6dc:c19e:8cc5 with SMTP id
 nc25-20020a1709071c1900b006dcc19e8cc5mr15520251ejc.333.1647747403553; Sat, 19
 Mar 2022 20:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220319035457.2214979-6-guoren@kernel.org>
 <202203200824.EQJTy8pW-lkp@intel.com>
 <CAJF2gTQXgXJjX6h5d_5tM312Ky_QfCKm-wLZP2SJBuYtHvE9xQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQXgXJjX6h5d_5tM312Ky_QfCKm-wLZP2SJBuYtHvE9xQ@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Sun, 20 Mar 2022 12:36:31 +0900
Message-ID: <CAAfxs74xtts3bzMGsVp9fOyxfZzj1vQPgrEsquXFa6AGAAC+_w@mail.gmail.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [OpenRISC] [PATCH V2 5/5] openrisc: Move to ticket-spinlock
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
Cc: Jonas Bonn <jonas@southpole.se>, Openrisc <openrisc@lists.librecores.org>
Content-Type: multipart/mixed; boundary="===============7797445531364317004=="
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

--===============7797445531364317004==
Content-Type: multipart/alternative; boundary="000000000000ab1d5b05da9e1627"

--000000000000ab1d5b05da9e1627
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 20, 2022, 12:05 PM Guo Ren <guoren@kernel.org> wrote:

> Hi openrisc guys,
>
> >    kernel/signal.c:2625:49: sparse:     expected struct sighand_struct
> *sighand
> >    kernel/signal.c:2625:49: sparse:     got struct sighand_struct
> [noderef] __rcu *sighand
>
> Some warning here, Is that all right? I don't think it is because of
> changing arch_spinlock_t from struct qspinlock to atomic_t.
>

I haven't built or tested this series yet.  But this doesn't look like a
new problem. It looks like this patch series may have introduced a new
instance of the existing issue.

I have some patches to clean up sparse warnings and I've seen this pattern
before but haven't spent the time to clean it up. This is a good
opportunity to do that now.  Let me have a look in the next few days.

-Stafford


On Sun, Mar 20, 2022 at 8:07 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on arnd-asm-generic/master]
> > [also build test WARNING on tip/locking/core openrisc/for-next
> linus/master v5.17-rc8 next-20220318]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:
> https://github.com/0day-ci/linux/commits/guoren-kernel-org/Generic-Ticket-Spinlocks/20220319-115644
> > base:
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
> master
> > config: openrisc-randconfig-s032-20220319 (
> https://download.01.org/0day-ci/archive/20220320/202203200824.EQJTy8pW-lkp@intel.com/config
> )
> > compiler: or1k-linux-gcc (GCC) 11.2.0
> > reproduce:
> >         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # apt-get install sparse
> >         # sparse version: v0.6.4-dirty
> >         #
> https://github.com/0day-ci/linux/commit/4e66dc8c71c62011bcb287f66bf5c5363920cd91
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review
> guoren-kernel-org/Generic-Ticket-Spinlocks/20220319-115644
> >         git checkout 4e66dc8c71c62011bcb287f66bf5c5363920cd91
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross
> C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc
> SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> >
> > sparse warnings: (new ones prefixed by >>)
> >    kernel/signal.c: note: in included file (through
> include/uapi/asm-generic/signal.h, include/asm-generic/signal.h,
> arch/openrisc/include/generated/uapi/asm/signal.h, ...):
> >    include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse:
> multiple address spaces given
> >    kernel/signal.c:195:31: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:195:31: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:195:31: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:198:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:198:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:198:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:480:9: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:480:9: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:480:9: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:484:34: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:484:34: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:484:34: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:517:9: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:517:9: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:517:9: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:520:36: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:520:36: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:520:36: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:542:53: sparse: sparse: incorrect type in initializer
> (different address spaces) @@     expected struct k_sigaction *ka @@
>  got struct k_sigaction [noderef] __rcu * @@
> >    kernel/signal.c:542:53: sparse:     expected struct k_sigaction *ka
> >    kernel/signal.c:542:53: sparse:     got struct k_sigaction [noderef]
> __rcu *
> >    include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse:
> multiple address spaces given
> >    kernel/signal.c:698:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:698:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:698:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:700:31: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:700:31: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:700:31: sparse:     got struct spinlock [noderef]
> __rcu *
> > >> kernel/signal.c:887:9: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct atomic_t [usertype] *lock
> @@     got struct atomic_t [noderef] __rcu * @@
> >    kernel/signal.c:887:9: sparse:     expected struct atomic_t
> [usertype] *lock
> >    kernel/signal.c:887:9: sparse:     got struct atomic_t [noderef]
> __rcu *
> >    kernel/signal.c:1082:9: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct atomic_t [usertype] *lock
> @@     got struct atomic_t [noderef] __rcu * @@
> >    kernel/signal.c:1082:9: sparse:     expected struct atomic_t
> [usertype] *lock
> >    kernel/signal.c:1082:9: sparse:     got struct atomic_t [noderef]
> __rcu *
> >    kernel/signal.c:1330:9: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:1330:9: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:1330:9: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:1331:16: sparse: sparse: incorrect type in assignment
> (different address spaces) @@     expected struct k_sigaction *action @@
>  got struct k_sigaction [noderef] __rcu * @@
> >    kernel/signal.c:1331:16: sparse:     expected struct k_sigaction
> *action
> >    kernel/signal.c:1331:16: sparse:     got struct k_sigaction [noderef]
> __rcu *
> >    kernel/signal.c:1350:34: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:1350:34: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:1350:34: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:1928:36: sparse: sparse: incorrect type in
> initializer (different address spaces) @@     expected struct spinlock
> [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:1928:36: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:1928:36: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2038:44: sparse: sparse: cast removes address space
> '__rcu' of expression
> >    kernel/signal.c:2057:65: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct task_struct *tsk @@
>  got struct task_struct [noderef] __rcu *parent @@
> >    kernel/signal.c:2057:65: sparse:     expected struct task_struct *tsk
> >    kernel/signal.c:2057:65: sparse:     got struct task_struct [noderef]
> __rcu *parent
> >    kernel/signal.c:2058:40: sparse: sparse: cast removes address space
> '__rcu' of expression
> >    kernel/signal.c:2076:14: sparse: sparse: incorrect type in assignment
> (different address spaces) @@     expected struct sighand_struct *psig @@
>    got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
> >    kernel/signal.c:2076:14: sparse:     expected struct sighand_struct
> *psig
> >    kernel/signal.c:2076:14: sparse:     got struct sighand_struct
> [noderef] __rcu *[noderef] __rcu sighand
> >    kernel/signal.c:2105:46: sparse: sparse: incorrect type in argument 3
> (different address spaces) @@     expected struct task_struct *t @@     got
> struct task_struct [noderef] __rcu *parent @@
> >    kernel/signal.c:2105:46: sparse:     expected struct task_struct *t
> >    kernel/signal.c:2105:46: sparse:     got struct task_struct [noderef]
> __rcu *parent
> >    kernel/signal.c:2106:34: sparse: sparse: incorrect type in argument 2
> (different address spaces) @@     expected struct task_struct *parent @@
>  got struct task_struct [noderef] __rcu *parent @@
> >    kernel/signal.c:2106:34: sparse:     expected struct task_struct
> *parent
> >    kernel/signal.c:2106:34: sparse:     got struct task_struct [noderef]
> __rcu *parent
> >    kernel/signal.c:2135:24: sparse: sparse: incorrect type in assignment
> (different address spaces) @@     expected struct task_struct *parent @@
>  got struct task_struct [noderef] __rcu *parent @@
> >    kernel/signal.c:2135:24: sparse:     expected struct task_struct
> *parent
> >    kernel/signal.c:2135:24: sparse:     got struct task_struct [noderef]
> __rcu *parent
> >    kernel/signal.c:2138:24: sparse: sparse: incorrect type in assignment
> (different address spaces) @@     expected struct task_struct *parent @@
>  got struct task_struct [noderef] __rcu *real_parent @@
> >    kernel/signal.c:2138:24: sparse:     expected struct task_struct
> *parent
> >    kernel/signal.c:2138:24: sparse:     got struct task_struct [noderef]
> __rcu *real_parent
> >    kernel/signal.c:2171:17: sparse: sparse: incorrect type in assignment
> (different address spaces) @@     expected struct sighand_struct *sighand
> @@     got struct sighand_struct [noderef] __rcu *sighand @@
> >    kernel/signal.c:2171:17: sparse:     expected struct sighand_struct
> *sighand
> >    kernel/signal.c:2171:17: sparse:     got struct sighand_struct
> [noderef] __rcu *sighand
> >    kernel/signal.c:2209:41: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2209:41: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2209:41: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2211:39: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2211:39: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2211:39: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2261:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2261:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2261:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2316:31: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2316:31: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2316:31: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2350:31: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2350:31: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2350:31: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2352:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2352:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2352:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2450:41: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2450:41: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2450:41: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2535:41: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2535:41: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2535:41: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2547:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2547:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2547:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2585:52: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct task_struct *tsk @@
>  got struct task_struct [noderef] __rcu *parent @@
> >    kernel/signal.c:2585:52: sparse:     expected struct task_struct *tsk
> >    kernel/signal.c:2585:52: sparse:     got struct task_struct [noderef]
> __rcu *parent
> >    kernel/signal.c:2587:49: sparse: sparse: cast removes address space
> '__rcu' of expression
> >    kernel/signal.c:2625:49: sparse: sparse: incorrect type in
> initializer (different address spaces) @@     expected struct
> sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu
> *sighand @@
> >    kernel/signal.c:2625:49: sparse:     expected struct sighand_struct
> *sighand
> >    kernel/signal.c:2625:49: sparse:     got struct sighand_struct
> [noderef] __rcu *sighand
> >    kernel/signal.c:2961:27: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2961:27: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2961:27: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:2981:29: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:2981:29: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:2981:29: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3048:27: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3048:27: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3048:27: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3050:29: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3050:29: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3050:29: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3201:31: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3201:31: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3201:31: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3204:33: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3204:33: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3204:33: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3591:27: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3591:27: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3591:27: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3603:37: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3603:37: sparse:     expected struct spinlock
> [usertype] *lock
> >    kernel/signal.c:3603:37: sparse:     got struct spinlock [noderef]
> __rcu *
> >    kernel/signal.c:3608:35: sparse: sparse: incorrect type in argument 1
> (different address spaces) @@     expected struct spinlock [usertype] *lock
> @@     got struct spinlock [noderef] __rcu * @@
> >    kernel/signal.c:3608:35: sparse:     expected struct spinlock
> [usertype] *lock
> >
> > vim +887 kernel/signal.c
> >
> > ^1da177e4c3f415 Linus Torvalds 2005-04-16  866
> > fb1d910c178ba0c Tejun Heo      2011-06-14  867  /**
> > fb1d910c178ba0c Tejun Heo      2011-06-14  868   * ptrace_trap_notify -
> schedule trap to notify ptracer
> > fb1d910c178ba0c Tejun Heo      2011-06-14  869   * @t: tracee wanting to
> notify tracer
> > fb1d910c178ba0c Tejun Heo      2011-06-14  870   *
> > fb1d910c178ba0c Tejun Heo      2011-06-14  871   * This function
> schedules sticky ptrace trap which is cleared on the next
> > fb1d910c178ba0c Tejun Heo      2011-06-14  872   * TRAP_STOP to notify
> ptracer of an event.  @t must have been seized by
> > fb1d910c178ba0c Tejun Heo      2011-06-14  873   * ptracer.
> > fb1d910c178ba0c Tejun Heo      2011-06-14  874   *
> > 544b2c91a9f14f9 Tejun Heo      2011-06-14  875   * If @t is running,
> STOP trap will be taken.  If trapped for STOP and
> > 544b2c91a9f14f9 Tejun Heo      2011-06-14  876   * ptracer is listening
> for events, tracee is woken up so that it can
> > 544b2c91a9f14f9 Tejun Heo      2011-06-14  877   * re-trap for the new
> event.  If trapped otherwise, STOP trap will be
> > 544b2c91a9f14f9 Tejun Heo      2011-06-14  878   * eventually taken
> without returning to userland after the existing traps
> > 544b2c91a9f14f9 Tejun Heo      2011-06-14  879   * are finished by
> PTRACE_CONT.
> > fb1d910c178ba0c Tejun Heo      2011-06-14  880   *
> > fb1d910c178ba0c Tejun Heo      2011-06-14  881   * CONTEXT:
> > fb1d910c178ba0c Tejun Heo      2011-06-14  882   * Must be called with
> @task->sighand->siglock held.
> > fb1d910c178ba0c Tejun Heo      2011-06-14  883   */
> > fb1d910c178ba0c Tejun Heo      2011-06-14  884  static void
> ptrace_trap_notify(struct task_struct *t)
> > fb1d910c178ba0c Tejun Heo      2011-06-14  885  {
> > fb1d910c178ba0c Tejun Heo      2011-06-14  886
> WARN_ON_ONCE(!(t->ptrace & PT_SEIZED));
> > fb1d910c178ba0c Tejun Heo      2011-06-14 @887
> assert_spin_locked(&t->sighand->siglock);
> > fb1d910c178ba0c Tejun Heo      2011-06-14  888
> > fb1d910c178ba0c Tejun Heo      2011-06-14  889
> task_set_jobctl_pending(t, JOBCTL_TRAP_NOTIFY);
> > 910ffdb18a6408e Oleg Nesterov  2013-01-21  890
> ptrace_signal_wake_up(t, t->jobctl & JOBCTL_LISTENING);
> > fb1d910c178ba0c Tejun Heo      2011-06-14  891  }
> > fb1d910c178ba0c Tejun Heo      2011-06-14  892
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/
>

--000000000000ab1d5b05da9e1627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Mar 20, 2022, 12:05 PM Guo Ren &lt;<a href=3D"=
mailto:guoren@kernel.org">guoren@kernel.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Hi openrisc guys,<br>
<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2625:49: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct sighand_struct *sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2625:49: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct sighand_struct [noderef] __rcu *sighand<br>
<br>
Some warning here, Is that all right? I don&#39;t think it is because of<br=
>
changing arch_spinlock_t from struct qspinlock to atomic_t.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I haven&#39;t bu=
ilt or tested this series yet.=C2=A0 But this doesn&#39;t look like a new p=
roblem. It looks like this patch series may have introduced a new instance =
of the existing issue.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
 have some patches to clean up sparse warnings and I&#39;ve seen this patte=
rn before but haven&#39;t spent the time to clean it up. This is a good opp=
ortunity to do that now.=C2=A0 Let me have a look in the next=C2=A0few days=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">-Stafford</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
On Sun, Mar 20, 2022 at 8:07 AM kernel test robot &lt;<a href=3D"mailto:lkp=
@intel.com" target=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I love your patch! Perhaps something to improve:<br>
&gt;<br>
&gt; [auto build test WARNING on arnd-asm-generic/master]<br>
&gt; [also build test WARNING on tip/locking/core openrisc/for-next linus/m=
aster v5.17-rc8 next-20220318]<br>
&gt; [If your patch is applied to the wrong git tree, kindly drop us a note=
.<br>
&gt; And when submitting patch, we suggest to use &#39;--base&#39; as docum=
ented in<br>
&gt; <a href=3D"https://git-scm.com/docs/git-format-patch" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://git-scm.com/docs/git-format-patch</=
a>]<br>
&gt;<br>
&gt; url:=C2=A0 =C2=A0 <a href=3D"https://github.com/0day-ci/linux/commits/=
guoren-kernel-org/Generic-Ticket-Spinlocks/20220319-115644" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://github.com/0day-ci/linux/commits/g=
uoren-kernel-org/Generic-Ticket-Spinlocks/20220319-115644</a><br>
&gt; base:=C2=A0 =C2=A0<a href=3D"https://git.kernel.org/pub/scm/linux/kern=
el/git/arnd/asm-generic.git" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git</a> =
master<br>
&gt; config: openrisc-randconfig-s032-20220319 (<a href=3D"https://download=
.01.org/0day-ci/archive/20220320/202203200824.EQJTy8pW-lkp@intel.com/config=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://download.01.org/0=
day-ci/archive/20220320/202203200824.EQJTy8pW-lkp@intel.com/config</a>)<br>
&gt; compiler: or1k-linux-gcc (GCC) 11.2.0<br>
&gt; reproduce:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wget <a href=3D"https://raw.githubuse=
rcontent.com/intel/lkp-tests/master/sbin/make.cross" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://raw.githubusercontent.com/intel/lkp-tests=
/master/sbin/make.cross</a> -O ~/bin/make.cross<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x ~/bin/make.cross<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# apt-get install sparse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# sparse version: v0.6.4-dirty<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://github.com/0day-=
ci/linux/commit/4e66dc8c71c62011bcb287f66bf5c5363920cd91" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://github.com/0day-ci/linux/commit/4e66=
dc8c71c62011bcb287f66bf5c5363920cd91</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git remote add linux-review <a href=
=3D"https://github.com/0day-ci/linux" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/0day-ci/linux</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git fetch --no-tags linux-review guor=
en-kernel-org/Generic-Ticket-Spinlocks/20220319-115644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git checkout 4e66dc8c71c62011bcb287f6=
6bf5c5363920cd91<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# save the config file to linux build=
 tree<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir build_dir<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COMPILER_INSTALL_PATH=3D$HOME/0day CO=
MPILER=3Dgcc-11.2.0 make.cross C=3D1 CF=3D&#39;-fdiagnostic-prefix -D__CHEC=
K_ENDIAN__&#39; O=3Dbuild_dir ARCH=3Dopenrisc SHELL=3D/bin/bash<br>
&gt;<br>
&gt; If you fix the issue, kindly add following tag as appropriate<br>
&gt; Reported-by: kernel test robot &lt;<a href=3D"mailto:lkp@intel.com" ta=
rget=3D"_blank" rel=3D"noreferrer">lkp@intel.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; sparse warnings: (new ones prefixed by &gt;&gt;)<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c: note: in included file (through include/=
uapi/asm-generic/signal.h, include/asm-generic/signal.h, arch/openrisc/incl=
ude/generated/uapi/asm/signal.h, ...):<br>
&gt;=C2=A0 =C2=A0 include/uapi/asm-generic/signal-defs.h:83:29: sparse: spa=
rse: multiple address spaces given<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:195:31: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:195:31: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:195:31: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:198:33: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:198:33: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:198:33: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:480:9: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struct=
 spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [noder=
ef] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:480:9: sparse:=C2=A0 =C2=A0 =C2=A0expecte=
d struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:480:9: sparse:=C2=A0 =C2=A0 =C2=A0got str=
uct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:484:34: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:484:34: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:484:34: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:517:9: sparse: sparse: incorrect type in =
argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struct=
 spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [noder=
ef] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:517:9: sparse:=C2=A0 =C2=A0 =C2=A0expecte=
d struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:517:9: sparse:=C2=A0 =C2=A0 =C2=A0got str=
uct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:520:36: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:520:36: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:520:36: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:542:53: sparse: sparse: incorrect type in=
 initializer (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct k_sigaction *ka @@=C2=A0 =C2=A0 =C2=A0got struct k_sigaction [noderef] _=
_rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:542:53: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct k_sigaction *ka<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:542:53: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct k_sigaction [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 include/uapi/asm-generic/signal-defs.h:83:29: sparse: spa=
rse: multiple address spaces given<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:698:33: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:698:33: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:698:33: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:700:31: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:700:31: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:700:31: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt; &gt;&gt; kernel/signal.c:887:9: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struct ato=
mic_t [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct atomic_t [noderef] =
__rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:887:9: sparse:=C2=A0 =C2=A0 =C2=A0expecte=
d struct atomic_t [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:887:9: sparse:=C2=A0 =C2=A0 =C2=A0got str=
uct atomic_t [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1082:9: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t atomic_t [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct atomic_t [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1082:9: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct atomic_t [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1082:9: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct atomic_t [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1330:9: sparse: sparse: incorrect type in=
 argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected struc=
t spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [node=
ref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1330:9: sparse:=C2=A0 =C2=A0 =C2=A0expect=
ed struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1330:9: sparse:=C2=A0 =C2=A0 =C2=A0got st=
ruct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1331:16: sparse: sparse: incorrect type i=
n assignment (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct k_sigaction *action @@=C2=A0 =C2=A0 =C2=A0got struct k_sigaction [nodere=
f] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1331:16: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct k_sigaction *action<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1331:16: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct k_sigaction [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1350:34: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1350:34: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1350:34: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1928:36: sparse: sparse: incorrect type i=
n initializer (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected str=
uct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [no=
deref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1928:36: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:1928:36: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2038:44: sparse: sparse: cast removes add=
ress space &#39;__rcu&#39; of expression<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2057:65: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *tsk @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [noderef] =
__rcu *parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2057:65: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *tsk<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2057:65: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2058:40: sparse: sparse: cast removes add=
ress space &#39;__rcu&#39; of expression<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2076:14: sparse: sparse: incorrect type i=
n assignment (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct sighand_struct *psig @@=C2=A0 =C2=A0 =C2=A0got struct sighand_struct [no=
deref] __rcu *[noderef] __rcu sighand @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2076:14: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct sighand_struct *psig<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2076:14: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct sighand_struct [noderef] __rcu *[noderef] __rcu sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2105:46: sparse: sparse: incorrect type i=
n argument 3 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *t @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [noderef] __=
rcu *parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2105:46: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *t<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2105:46: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2106:34: sparse: sparse: incorrect type i=
n argument 2 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *parent @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [nodere=
f] __rcu *parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2106:34: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2106:34: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2135:24: sparse: sparse: incorrect type i=
n assignment (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *parent @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [nodere=
f] __rcu *parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2135:24: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2135:24: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2138:24: sparse: sparse: incorrect type i=
n assignment (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *parent @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [nodere=
f] __rcu *real_parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2138:24: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2138:24: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *real_parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2171:17: sparse: sparse: incorrect type i=
n assignment (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct sighand_struct *sighand @@=C2=A0 =C2=A0 =C2=A0got struct sighand_struct =
[noderef] __rcu *sighand @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2171:17: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct sighand_struct *sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2171:17: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct sighand_struct [noderef] __rcu *sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2209:41: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2209:41: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2209:41: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2211:39: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2211:39: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2211:39: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2261:33: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2261:33: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2261:33: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2316:31: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2316:31: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2316:31: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2350:31: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2350:31: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2350:31: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2352:33: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2352:33: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2352:33: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2450:41: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2450:41: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2450:41: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2535:41: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2535:41: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2535:41: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2547:33: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2547:33: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2547:33: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2585:52: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct task_struct *tsk @@=C2=A0 =C2=A0 =C2=A0got struct task_struct [noderef] =
__rcu *parent @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2585:52: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct task_struct *tsk<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2585:52: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct task_struct [noderef] __rcu *parent<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2587:49: sparse: sparse: cast removes add=
ress space &#39;__rcu&#39; of expression<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2625:49: sparse: sparse: incorrect type i=
n initializer (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected str=
uct sighand_struct *sighand @@=C2=A0 =C2=A0 =C2=A0got struct sighand_struct=
 [noderef] __rcu *sighand @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2625:49: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct sighand_struct *sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2625:49: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct sighand_struct [noderef] __rcu *sighand<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2961:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2961:27: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2961:27: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2981:29: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2981:29: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:2981:29: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3048:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3048:27: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3048:27: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3050:29: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3050:29: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3050:29: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3201:31: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3201:31: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3201:31: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3204:33: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3204:33: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3204:33: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3591:27: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3591:27: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3591:27: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3603:37: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3603:37: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3603:37: sparse:=C2=A0 =C2=A0 =C2=A0got s=
truct spinlock [noderef] __rcu *<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3608:35: sparse: sparse: incorrect type i=
n argument 1 (different address spaces) @@=C2=A0 =C2=A0 =C2=A0expected stru=
ct spinlock [usertype] *lock @@=C2=A0 =C2=A0 =C2=A0got struct spinlock [nod=
eref] __rcu * @@<br>
&gt;=C2=A0 =C2=A0 kernel/signal.c:3608:35: sparse:=C2=A0 =C2=A0 =C2=A0expec=
ted struct spinlock [usertype] *lock<br>
&gt;<br>
&gt; vim +887 kernel/signal.c<br>
&gt;<br>
&gt; ^1da177e4c3f415 Linus Torvalds 2005-04-16=C2=A0 866<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 867=C2=
=A0 /**<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 868=C2=
=A0 =C2=A0* ptrace_trap_notify - schedule trap to notify ptracer<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 869=C2=
=A0 =C2=A0* @t: tracee wanting to notify tracer<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 870=C2=
=A0 =C2=A0*<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 871=C2=
=A0 =C2=A0* This function schedules sticky ptrace trap which is cleared on =
the next<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 872=C2=
=A0 =C2=A0* TRAP_STOP to notify ptracer of an event.=C2=A0 @t must have bee=
n seized by<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 873=C2=
=A0 =C2=A0* ptracer.<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 874=C2=
=A0 =C2=A0*<br>
&gt; 544b2c91a9f14f9 Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 875=C2=
=A0 =C2=A0* If @t is running, STOP trap will be taken.=C2=A0 If trapped for=
 STOP and<br>
&gt; 544b2c91a9f14f9 Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 876=C2=
=A0 =C2=A0* ptracer is listening for events, tracee is woken up so that it =
can<br>
&gt; 544b2c91a9f14f9 Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 877=C2=
=A0 =C2=A0* re-trap for the new event.=C2=A0 If trapped otherwise, STOP tra=
p will be<br>
&gt; 544b2c91a9f14f9 Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 878=C2=
=A0 =C2=A0* eventually taken without returning to userland after the existi=
ng traps<br>
&gt; 544b2c91a9f14f9 Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 879=C2=
=A0 =C2=A0* are finished by PTRACE_CONT.<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 880=C2=
=A0 =C2=A0*<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 881=C2=
=A0 =C2=A0* CONTEXT:<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 882=C2=
=A0 =C2=A0* Must be called with @task-&gt;sighand-&gt;siglock held.<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 883=C2=
=A0 =C2=A0*/<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 884=C2=
=A0 static void ptrace_trap_notify(struct task_struct *t)<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 885=C2=
=A0 {<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 886=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WARN_ON_ONCE(!(t-&gt;ptrace &amp; PT_SEIZED=
));<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14 @887=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_spin_locked(&amp;t-&gt;sighand-&gt;siglo=
ck);<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 888<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 889=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 task_set_jobctl_pending(t, JOBCTL_TRAP_NOTI=
FY);<br>
&gt; 910ffdb18a6408e Oleg Nesterov=C2=A0 2013-01-21=C2=A0 890=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ptrace_signal_wake_up(t, t-&gt;jobctl &amp; JOBCTL_LIS=
TENING);<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 891=C2=
=A0 }<br>
&gt; fb1d910c178ba0c Tejun Heo=C2=A0 =C2=A0 =C2=A0 2011-06-14=C2=A0 892<br>
&gt;<br>
&gt; --<br>
&gt; 0-DAY CI Kernel Test Service<br>
&gt; <a href=3D"https://01.org/lkp" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://01.org/lkp</a><br>
<br>
<br>
<br>
-- <br>
Best Regards<br>
=C2=A0Guo Ren<br>
<br>
ML: <a href=3D"https://lore.kernel.org/linux-csky/" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://lore.kernel.org/linux-csky/</a><br>
</blockquote></div></div></div>

--000000000000ab1d5b05da9e1627--

--===============7797445531364317004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

--===============7797445531364317004==--

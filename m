Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 37F8651BDB3
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 13:05:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 954FD248FB;
	Thu,  5 May 2022 13:05:29 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by mail.librecores.org (Postfix) with ESMTPS id 9E6C923E0C
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 13:05:28 +0200 (CEST)
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MrPyJ-1o8gE30vmp-00oatP for <openrisc@lists.librecores.org>; Thu, 05 May
 2022 13:05:28 +0200
Received: by mail-wr1-f43.google.com with SMTP id v12so5596335wrv.10
 for <openrisc@lists.librecores.org>; Thu, 05 May 2022 04:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM532gIY6A84VwmjkeKwW3+vGZnFd9dqdErlsdLb2Ykz03R96MpnNz
 3B6HMRcz1KsNb1wlSGeCfG/fo0W/XEjwtKvAwI8=
X-Google-Smtp-Source: ABdhPJxGGq5Fa9Cx5SSfnKSUo4b+MfSDkdVAVLGUTqD/GBtgFGV3C400pAFOppOt2I8pMGzWGNhT2WNvFkyhjBMEOv4=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr19580488wrs.12.1651748727768; Thu, 05
 May 2022 04:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-3-palmer@rivosinc.com>
 <7375410.EvYhyI6sBW@diego>
In-Reply-To: <7375410.EvYhyI6sBW@diego>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 May 2022 13:05:11 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2fLg9DJvQeOAFhRQk-O72PAhJ77CLQ+Pz_Vvh1WV1APQ@mail.gmail.com>
Message-ID: <CAK8P3a2fLg9DJvQeOAFhRQk-O72PAhJ77CLQ+Pz_Vvh1WV1APQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] asm-generic: qspinlock: Indicate the use of
 mixed-size atomics
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T4FSz3DHkDoWZLJexU/cZCGyhDVRQkO3+Pb9sZdJhMYVTAK2vi8
 iT32JzFdebOlwV66Lwy06BoxLZaLhB6PcTPS1L6SSMM28W3T0sIwhNcxQs8lHBgrOmiZnhN
 qASVNWsLZmKKImqN2GsGB24YxJCbGlXkRUcRcN1DkuUkJANdVy5rXiNXdNrpeQPF4j9QBNs
 bfmcmkdgnQWu6mmMiKaXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:G8EDPOorFIE=:INoRAO/1QFt8dREbEQxRvD
 LPHTGaGsS+qqce64ioX9j8/wngjOgE534KBm17qZkJ692+f5o14cr2XPjIJLd4CeOlOxEKrYW
 kvLQbpyk6uxp0ndp2gMKp3yoPFRFazTATDbxJkwE+dwWRAE8m+IwI7tnEB1XQloDhNc+KKl+a
 1Yc9zoJie9Ev9t3srpoSPaGiahWZ8aVjfoU3xbjyGo1MRAbE0OKy2GzV7yeGbuNHjhL7MI9Vj
 Ffkp+989g+d98qMd+G6Qimn8FNw+OR/EdH18GLzvSt7kYobFgQOLRCJ/VLGcMbwFsc/UkG8NH
 Bc+kFI2ogMX7C1j4o4oKnDghYQzYIXZGbA5PMkG8Avf/cVSMQ0zqgDpbm9gFo+WEV9rsCdxR+
 QJWch1k7Ugx8RS7U3Jr/JknqbAzSa3RQveeNOiPbphEYKVRUiPw1PaQen2c1iF2lTVRldu6Ss
 lPSTC07IJ0EKKXbt7AMmR8754kGQ1M/pAOrNwP6h/WYPbG3vbfKEBWban7OF7RrciV9GwVnZO
 bicTASa4T30NPBb7z5frRO3cr5dN7EtWNudpaH5cUMS7PcxBEQNXiV5S/coYx08TmI/PIqklU
 C7LmB3J9EYBxb6PMnptSIfa80NAUJNA+2K9ovHSA24l/14rTls9zUoAjgGkrAdnDUi2F3yBdG
 bLGn7EM579LgRxAvNx+xEqNoO6vsbYlur8cpvX6CGVhwebr8eM3t19iB/Td1Zp5ZRNUfH3YoO
 DyFF0q5WWILxJtGnlswX3CLDdWQUW5sB68J5llSdB9SASQa8Avxk2r5eNnEsyncvBwYDVMJ7z
 0No2txfDe5/5vXUp5X19/LuOiPAXs4kqRcr8dCOQzmX/Va+Z9k=
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
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Wed, May 4, 2022 at 2:02 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
> > index d74b13825501..95be3f3c28b5 100644
> > --- a/include/asm-generic/qspinlock.h
> > +++ b/include/asm-generic/qspinlock.h
> > @@ -2,6 +2,37 @@
> >  /*
> >   * Queued spinlock
> >   *
> > + * A 'generic' spinlock implementation that is based on MCS locks. An
>
> _For_ an architecture that's ... ?
>
> > + * architecture that's looking for a 'generic' spinlock, please first =
consider
> > + * ticket-lock.h and only come looking here when you've considered all=
 the
> > + * constraints below and can show your hardware does actually perform =
better
> > + * with qspinlock.
> > + *
> > + *
>
> double empty line is probably not necessary
>

I've applied the series to the asm-generic tree now, and edited both the ab=
ove
as you suggested in the process, to save Palmer the v5.

         Arnd

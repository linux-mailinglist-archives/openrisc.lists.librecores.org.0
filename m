Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB83D51BEE1
	for <lists+openrisc@lfdr.de>; Thu,  5 May 2022 14:10:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08F8F248FB;
	Thu,  5 May 2022 14:10:17 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by mail.librecores.org (Postfix) with ESMTPS id EB6752410F
 for <openrisc@lists.librecores.org>; Thu,  5 May 2022 14:10:15 +0200 (CEST)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRC7g-1nRjXf2F8u-00N7iq for <openrisc@lists.librecores.org>; Thu, 05 May
 2022 14:10:15 +0200
Received: by mail-wr1-f54.google.com with SMTP id v12so5816832wrv.10
 for <openrisc@lists.librecores.org>; Thu, 05 May 2022 05:10:15 -0700 (PDT)
X-Gm-Message-State: AOAM533XGKhVgrFizk9FcuJfC5uuDqddbIzRtVkNz+UUTLsUWHaRbk2o
 uNsdYwktw/f555zaOB1LU3H9owuA9ztE2hWzC3w=
X-Google-Smtp-Source: ABdhPJy3sZItdcfe17y+S/VnaEhqFhXcQF66aoZmv1r68aZfE+8weQM2Hae0G8znhhQS8eBb/xXeQCqA+DvrYRMKHic=
X-Received: by 2002:a5d:49cb:0:b0:20a:cee3:54fc with SMTP id
 t11-20020a5d49cb000000b0020acee354fcmr19600892wrs.12.1651749002633; Thu, 05
 May 2022 04:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 May 2022 13:09:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
Message-ID: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Generic Ticket Spinlocks
To: Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hvwvcrS74HIKenb9mDC3CzTFl2/7VQNxKCtAz6LjX2wLr8YsuW9
 AXlySmrijYhmCweigsBdKdugLUd4KsZQigUh2qmNRQldrR1O3C9b6vlFMueK8+WF4gyqKi/
 s9w0G1anFPDU7iI6xyV/2jdJKUa0Eu+IYHVGNy1EMvF0axuGvQi3SX7wSFxfJBaABqv1yju
 cD5jfK4F+s+GU89SUjVnw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WKxuMgwVpLM=:mNcr4tAOzD745apNNc7EGd
 kMX3v0IAojEdQNgbpwO8ESdBjmRMQFtFghLFridcg4RvJEyL7Kr6wbf8dZ7LSAoTS9qpwHfxm
 JJvfcmgbVYg1monx7DEtpmVv2PExFYG8cV9bPJVx4m9Et0MUxUkGuZyydQAr+pyypo8hNJ8yq
 tRLdq6ZMcHmTyhJ4BFBQJScg+Lpiywwxkn5TQWnGXCShYTVSyZacBVze1IMyd7IMZbiqLT43s
 fy8fike+AGgy2Coo4r+vkDw5Tu7Nrd5eEut/f0NrTBRYvNnfIjjX20+c7h2G2QOy8Swdx0kHu
 tYGDm3yq5e6VWTGkgk2B+hfY7ig9NB/uv2GQcegRgbPakbqb2oWeIInjb6PXXic/fQZXsy9lT
 5iGdnV9+G/kqyQsXxZElQIy0WTrWtjCAS6cy7FcjeHNFhHcbzh/vsoynmOmH1epwUi0NXWHHH
 q9W29lLxO+ENRp8ipb+UTNvUOFPzglykrnozE3bnv+ZPYdbnj1s8hzNZRewI+WUkwQB9q26Ym
 RIYWlgpervaer6x9Fmh6ASSL/PA4rdstw38DjhdcuZVfM2dXrdx7S+s/zQHoXA2+1Z4ZpMJCI
 ngo4v2YvwD4sVono6JPejrKZvEcdeCruhKrpYXn56C0Jy41Iv6iAXXwgV+SbqA5Dq5czdeLRN
 vey0TLqHCXZcBbwcxhnioE0TDEO1BQFFqWQ09tvV/un26Pou+1wwI32JYf8VGq9Vw1zDPTqtf
 WT2Ej80EO1oeR6PJzhdHZhAQzn5a0kWn99V/OvEzF975qiDwQwHvWyyHbn7NX8vHc/eSjpP0r
 MaGI4ybF56PA53EM08IVeYyoVBaUzycrO2rZ9xjyiZOYSD8HKU=
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
Cc: Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
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

On Sat, Apr 30, 2022 at 5:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Comments on the v3 looked pretty straight-forward, essentially just that
> RCsc issue I'd missed from the v2 and some cleanups.  A part of the
> discussion some additional possible cleanups came up related to the
> qrwlock headers, but I hadn't looked at those yet and I had already
> handled everything else.  This went on the back burner, but given that
> LoongArch appears to want to use it for their new port I think it's best
> to just run with this and defer the other cleanups until later.
>
> I've placed the whole patch set at palmer/tspinlock-v4, and also tagged
> the asm-generic bits as generic-ticket-spinlocks-v4.  Ideally I'd like
> to take that, along with the RISC-V patches, into my tree as there's
> some RISC-V specific testing before things land in linux-next.  This
> passes all my testing, but I'll hold off until merging things anywhere
> else to make sure everyone has time to look.  There's no rush on my end
> for this one, but I don't want to block LoongArch so I'll try to stay a
> bit more on top of this one.

I took another look as well and everything seems fine. I had expected
that I would merge it into the asm-generic tree first and did not bother
sending a separate Reviewed-by tag, but I agree that it's best if you
create the branch.

Can you add 'Reviewed-by: Arnd Bergmann <arnd@arndb.de>'
to each patch and send me a pull request for a v5 tag so we can
merge that into both the riscv and the asm-generic trees?

       Arnd

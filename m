Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 04D566104DB
	for <lists+openrisc@lfdr.de>; Thu, 27 Oct 2022 23:55:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5CDD424C43;
	Thu, 27 Oct 2022 23:55:58 +0200 (CEST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mail.librecores.org (Postfix) with ESMTPS id 62A8524B3B
 for <openrisc@lists.librecores.org>; Thu, 27 Oct 2022 23:55:56 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id 13so8582970ejn.3
 for <openrisc@lists.librecores.org>; Thu, 27 Oct 2022 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
 b=mDkvDqdAij8U7APRP9yt0MpP0X4VRBno0CXMoN30kyF44cwwyG6SWPi0RMmgixT3Bt
 gDGI3NQdLQgzAOkEJRsHlv30WGUJ2hQblLeSpwcJ5STMlX4u4j8a3tQV2KR2m0LIQzBm
 AQJ503ah+Ml5VjRZNjjXGPE/NDYPCFMXA8zgjE5t0SVsx9Hw9IWLWZ3AMAqfOZwZ+V+e
 qYuMVsdT8DFxXyS63KjEsQME+nw+FVWDILA1TQjyCKoVJwx1GB6oAfX2SEHxx6BUkppp
 FRbFNc1nFH6dDsPv8S53kFNtYm8nzlkRSUmQ01A3lEAB9LpF+C23K7NNIPQTDmTy9HCd
 Qzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NBF9nN1amKjoEJYkIjpsAIirOQycb1TH6Xv8hrGX720=;
 b=SMSxK/teEtGckaFpUuSxrY1lki+VNSta6r9VA/jwb7aJ26Rc4K5PX2vBFGlDwq6BgY
 1b/zAKNzxJ+p5qZKZYX6UDA+6JHub2I5DNk6QpPCyghHfmoMY1n5bbYowGwChQBe1YGV
 wS7tiHpXJUYU9aNZL8iZtwk8Hjx8scx5aewnzK2qiLH2gt2RX/C0+g1oOoc4mgtmUCDf
 fhVBm21XNs5MufaOfsX0RiCICDLAEeDQmEhNG2Lpxq6O4jYka0FKiazTjbLDW1FVYAIg
 ceiiPppZw5nHJcsjRc6fBBQS6hAXHu+eBQqPXmCVwp+X06F3lqEUUd3eKwI+pcCjK5cQ
 0ioQ==
X-Gm-Message-State: ACrzQf000KoiiXf9m5KgT4oMqNkTIM9ycYuFYgD/fuZCAYlEpoPMRp4v
 N6U8tgTbBv/SDP7ZPd1FmEBVsvfVkQUehPEp4Wg=
X-Google-Smtp-Source: AMsMyM6xp5XG883Sfz6qxUaX5+gPHPonCP4MPn0vbsj6Bzy6ERW5G8ermHkmXVNLJ97zdVUdhxlu0w7L/DMiIXxWfLY=
X-Received: by 2002:a17:906:8442:b0:7ad:960b:ef61 with SMTP id
 e2-20020a170906844200b007ad960bef61mr2610486ejy.702.1666907755828; Thu, 27
 Oct 2022 14:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
 <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
In-Reply-To: <87o7tx5oyx.fsf@stealth>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Oct 2022 10:55:42 +1300
Message-ID: <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Punit Agrawal <punit.agrawal@bytedance.com>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com,
 linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>,
 linux-mips@vger.kernel.org, arnd@arndb.de,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org,
 darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com,
 Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
<punit.agrawal@bytedance.com> wrote:
>
>
> [ Apologies for chiming in late in the conversation ]
>
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>
> > On 9/28/22 05:53, Barry Song wrote:
> >> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
> >>>
> >>> On 2022/9/27 14:16, Anshuman Khandual wrote:
> >>>> [...]
> >>>>
> >>>> On 9/21/22 14:13, Yicong Yang wrote:
> >>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>>>> +{
> >>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
> >>>>> +    if (num_online_cpus() <= 4)
> >>>>
> >>>> It would be great to have some more inputs from others, whether 4 (which should
> >>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> >>>> is optimal for an wide range of arm64 platforms.
> >>>>
> >>
> >> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> >> with 5,6,7
> >> cores.
> >> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> >> this patch.
> >>
> >> so it seems safe to have
> >> if (num_online_cpus()  < 8)
> >>
> >>>
> >>> Do you prefer this macro to be static or make it configurable through kconfig then
> >>> different platforms can make choice based on their own situations? It maybe hard to
> >>> test on all the arm64 platforms.
> >>
> >> Maybe we can have this default enabled on machines with 8 and more cpus and
> >> provide a tlbflush_batched = on or off to allow users enable or
> >> disable it according
> >> to their hardware and products. Similar example: rodata=on or off.
> >
> > No, sounds bit excessive. Kernel command line options should not be added
> > for every possible run time switch options.
> >
> >>
> >> Hi Anshuman, Will,  Catalin, Andrew,
> >> what do you think about this approach?
> >>
> >> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> >> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> >>
> >> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> >> even by hardware broadcast.
> >
> > Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
> > with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>
> When running the test program in the commit in a VM, I saw benefits from
> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
> ptep_clear_flush() went from ~1% in the unpatched version to not showing
> up.
>
> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
> there any overhead? I am wondering what are the downsides of enabling
> the config by default.

As we are deferring tlb flush, but sometimes while we are modifying the vma
which are deferred, we need to do a sync by flush_tlb_batched_pending() in
mprotect() , madvise() to make sure they can see the flushed result. if nobody
is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.

>
> Thanks,
> Punit

Thanks
Barry

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 400A1662F47
	for <lists+openrisc@lfdr.de>; Mon,  9 Jan 2023 19:35:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D59F6229F9;
	Mon,  9 Jan 2023 19:35:32 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 4360620E5D
 for <openrisc@lists.librecores.org>; Mon,  9 Jan 2023 19:35:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD342611CA;
 Mon,  9 Jan 2023 17:19:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 167BBC433F0;
 Mon,  9 Jan 2023 17:19:02 +0000 (UTC)
Date: Mon, 9 Jan 2023 17:19:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Message-ID: <Y7xMhPTAwcUT4O6b@arm.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-3-yangyicong@huawei.com>
 <Y7cToj5mWd1ZbMyQ@arm.com>
 <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
X-BeenThere: openrisc@lists.librecores.org
X-Mailman-Version: 2.1.29
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
 linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com,
 linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org,
 zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org,
 Mel Gorman <mgorman@suse.de>, arnd@arndb.de, anshuman.khandual@arm.com,
 Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org,
 darren@os.amperecomputing.com, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com,
 linux-mips@vger.kernel.org, huzhanyuan@oppo.com,
 Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Sun, Jan 08, 2023 at 06:48:41PM +0800, Barry Song wrote:
> On Fri, Jan 6, 2023 at 2:15 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> > > It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> > > large systems but may not have improvement on small systems like on
> > > a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> > > on CONFIG_EXPERT for this stage and make this disabled on systems
> > > with less than 8 CPUs. User can modify this threshold according to
> > > their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
> >
> > What's the overhead of such batching on systems with 4 or fewer CPUs? If
> > it isn't noticeable, I'd rather have it always on than some number
> > chosen on whichever SoC you tested.
> 
> On the one hand, tlb flush is cheap on a small system. so batching tlb flush
> helps very minorly.

Yes, it probably won't help on small systems but I don't like config
options choosing the threshold, which may be different from system to
system even if they have the same number of CPUs. A run-time tunable
would be a better option.

> On the other hand, since we have batched the tlb flush, new PTEs might be
> invisible to others before the final broadcast is done and Ack-ed.

The new PTEs could indeed be invisible at the TLB level but not at the
memory (page table) level since this is done under the PTL IIUC.

> thus, there
> is a risk someone else might do mprotect or similar things  on those deferred
> pages which will ask for read-modify-write on those deferred PTEs.

And this should be fine, we have things like the PTL in place for the
actual memory access to the page table.

> in this
> case, mm will do an explicit flush by flush_tlb_batched_pending which is
> not required if tlb flush is not deferred.

I don't fully understand why it's needed, or at least why it would be
needed on arm64. At the end of an mprotect(), we have the final PTEs in
place and we just need to issue a TLBI for that range.
change_pte_range() for example has a tlb_flush_pte_range() if the PTE
was present and that won't be done lazily. If there are other TLBIs
pending for the same range, they'll be done later though likely
unnecessarily but still cheaper than issuing a flush_tlb_mm().

> void flush_tlb_batched_pending(struct mm_struct *mm)
> {
>        int batch = atomic_read(&mm->tlb_flush_batched);
>        int pending = batch & TLB_FLUSH_BATCH_PENDING_MASK;
>        int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
> 
>        if (pending != flushed) {
>                flush_tlb_mm(mm);
>         /*
>          * If the new TLB flushing is pending during flushing, leave
>          * mm->tlb_flush_batched as is, to avoid losing flushing.
>         */
>       atomic_cmpxchg(&mm->tlb_flush_batched, batch,
>            pending | (pending << TLB_FLUSH_BATCH_FLUSHED_SHIFT));
>      }
> }

I guess this works on x86 better as it avoids the IPIs if this flush
already happened. But on arm64 we already issued the TLBI, we just
didn't wait for it to complete via a DSB.

> I believe Anshuman has contributed many points on this in those previous
> discussions.

Yeah, I should re-read the old threads.

-- 
Catalin

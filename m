Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD3065F38C
	for <lists+openrisc@lfdr.de>; Thu,  5 Jan 2023 19:15:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9673924C6A;
	Thu,  5 Jan 2023 19:15:10 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 61D3224C5C
 for <openrisc@lists.librecores.org>; Thu,  5 Jan 2023 19:15:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 292AE61BD1;
 Thu,  5 Jan 2023 18:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDBC433D2;
 Thu,  5 Jan 2023 18:15:01 +0000 (UTC)
Date: Thu, 5 Jan 2023 18:14:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Message-ID: <Y7cToj5mWd1ZbMyQ@arm.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117082648.47526-3-yangyicong@huawei.com>
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
 linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, punit.agrawal@bytedance.com,
 linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org,
 zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org,
 Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, arnd@arndb.de,
 anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>,
 openrisc@lists.librecores.org, darren@os.amperecomputing.com,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org,
 huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> large systems but may not have improvement on small systems like on
> a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> on CONFIG_EXPERT for this stage and make this disabled on systems
> with less than 8 CPUs. User can modify this threshold according to
> their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.

What's the overhead of such batching on systems with 4 or fewer CPUs? If
it isn't noticeable, I'd rather have it always on than some number
chosen on whichever SoC you tested.

Another option would be to make this a sysctl tunable.

>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  6 +++
>  arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>  arch/arm64/include/asm/tlbflush.h             | 52 ++++++++++++++++++-
>  arch/x86/include/asm/tlbflush.h               |  5 +-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 10 ++--

Please keep any function prototype changes in a preparatory patch so
that the arm64 one only introduces the arch specific changes. Easier to
review.

> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/*
> +	 * TLB batched flush is proved to be beneficial for systems with large
> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
> +	 * is cheap on small systems which may not need this feature. So use
> +	 * a threshold for enabling this to avoid potential side effects on
> +	 * these platforms.
> +	 */
> +	if (num_online_cpus() < CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
> +		return false;

The x86 implementation tracks the cpumask of where a task has run. We
don't have such tracking on arm64 and I don't think it matters. As
noticed/described in this series, the bottleneck is the actual DSB
synchronisation (which sends a DVM Sync message to all the other CPUs
and waits for a DVM Complete response). So I think it makes sense not to
bother with an mm_cpumask(). What this patch aims to optimise is
actually the number of DSBs issued on an SMP system by
ptep_clear_flush().

The DVM is not an architected concept (well, it's part of AMBA AXI). I'd
be curious to know how such patch behaves on Apple's M1/M2 hardware. My
preference would be to have this always on for num_online_cpus() > 1 if
there's no overhead.

-- 
Catalin

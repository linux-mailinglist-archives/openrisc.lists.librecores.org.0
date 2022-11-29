Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6364763BEA2
	for <lists+openrisc@lfdr.de>; Tue, 29 Nov 2022 12:09:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D4C6024B50;
	Tue, 29 Nov 2022 12:09:32 +0100 (CET)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mail.librecores.org (Postfix) with ESMTPS id 0490C24A1C
 for <openrisc@lists.librecores.org>; Tue, 29 Nov 2022 12:09:31 +0100 (CET)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NM02T6VXhzRpc6;
 Tue, 29 Nov 2022 19:08:49 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 29 Nov 2022 19:09:28 +0800
Subject: Re: [PATCH v7 0/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <catalin.marinas@arm.com>, <will@kernel.org>
References: <20221117082648.47526-1-yangyicong@huawei.com>
Message-ID: <938c4c00-8cf9-b37a-d70e-04262d86f01c@huawei.com>
Date: Tue, 29 Nov 2022 19:09:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221117082648.47526-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
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
Cc: wangkefeng.wang@huawei.com, x86@kernel.org, darren@os.amperecomputing.com,
 linux-doc@vger.kernel.org, peterz@infradead.org, yangyicong@hisilicon.com,
 punit.agrawal@bytedance.com, guojian@oppo.com, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 corbet@lwn.net, realmz6@gmail.com, Barry Song <21cnbao@gmail.com>,
 linux-mips@vger.kernel.org, arnd@arndb.de, anshuman.khandual@arm.com,
 openrisc@lists.librecores.org, prime.zeng@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

a gentle ping...

Hi Andrew, Will and Catalin,

is it ok to pick this series?

Thanks.

On 2022/11/17 16:26, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Though ARM64 has the hardware to do tlb shootdown, the hardware
> broadcasting is not free.
> A simplest micro benchmark shows even on snapdragon 888 with only
> 8 cores, the overhead for ptep_clear_flush is huge even for paging
> out one page mapped by only one process:
> 5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
> 
> While pages are mapped by multiple processes or HW has more CPUs,
> the cost should become even higher due to the bad scalability of
> tlb shootdown.
> 
> The same benchmark can result in 16.99% CPU consumption on ARM64
> server with around 100 cores according to Yicong's test on patch
> 4/4.
> 
> This patchset leverages the existing BATCHED_UNMAP_TLB_FLUSH by
> 1. only send tlbi instructions in the first stage -
> 	arch_tlbbatch_add_mm()
> 2. wait for the completion of tlbi by dsb while doing tlbbatch
> 	sync in arch_tlbbatch_flush()
> Testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
> 
> With this support we're possible to do more optimization for memory
> reclamation and migration[*].
> 
> [*] https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> 
> -v7:
> 1. rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending() as suggested, since it
>    takes an extra address for arm64, per Nadav and Anshuman. Also mentioned in the commit.
> 2. add tags from Xin Hao, thanks.
> Link: https://lore.kernel.org/lkml/20221115031425.44640-1-yangyicong@huawei.com/
> 
> -v6:
> 1. comment we don't defer TLB flush on platforms affected by ARM64_WORKAROUND_REPEAT_TLBI
> 2. use cpus_have_const_cap() instead of this_cpu_has_cap()
> 3. add tags from Punit, Thanks.
> 4. default enable the feature when cpus >= 8 rather than > 8, since the original
>    improvement is observed on snapdragon 888 with 8 cores.
> Link: https://lore.kernel.org/lkml/20221028081255.19157-1-yangyicong@huawei.com/
> 
> -v5:
> 1. Make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends on EXPERT for this stage on arm64.
> 2. Make a threshold of CPU numbers for enabling batched TLP flush on arm64
> Link: https://lore.kernel.org/linux-arm-kernel/20220921084302.43631-1-yangyicong@huawei.com/T/
> 
> -v4:
> 1. Add tags from Kefeng and Anshuman, Thanks.
> 2. Limit the TLB batch/defer on systems with >4 CPUs, per Anshuman
> 3. Merge previous Patch 1,2-3 into one, per Anshuman
> Link: https://lore.kernel.org/linux-mm/20220822082120.8347-1-yangyicong@huawei.com/
> 
> -v3:
> 1. Declare arch's tlbbatch defer support by arch_tlbbatch_should_defer() instead
>    of ARCH_HAS_MM_CPUMASK, per Barry and Kefeng
> 2. Add Tested-by from Xin Hao
> Link: https://lore.kernel.org/linux-mm/20220711034615.482895-1-21cnbao@gmail.com/
> 
> -v2:
> 1. Collected Yicong's test result on kunpeng920 ARM64 server;
> 2. Removed the redundant vma parameter in arch_tlbbatch_add_mm()
>    according to the comments of Peter Zijlstra and Dave Hansen
> 3. Added ARCH_HAS_MM_CPUMASK rather than checking if mm_cpumask
>    is empty according to the comments of Nadav Amit
> 
> Thanks, Peter, Dave and Nadav for your testing or reviewing
> , and comments.
> 
> -v1:
> https://lore.kernel.org/lkml/20220707125242.425242-1-21cnbao@gmail.com/
> 
> Anshuman Khandual (1):
>   mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
> 
> Barry Song (1):
>   arm64: support batched/deferred tlb shootdown during page reclamation
> 
>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  6 +++
>  arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>  arch/arm64/include/asm/tlbflush.h             | 52 ++++++++++++++++++-
>  arch/x86/include/asm/tlbflush.h               | 17 +++++-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 19 +++----
>  7 files changed, 93 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> 

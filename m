Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1DA5AE37D
	for <lists+openrisc@lfdr.de>; Tue,  6 Sep 2022 10:53:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9F8272486D;
	Tue,  6 Sep 2022 10:53:25 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mail.librecores.org (Postfix) with ESMTPS id 9CBD820C8F
 for <openrisc@lists.librecores.org>; Tue,  6 Sep 2022 10:53:24 +0200 (CEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MMJwq2Zl9zmVCj;
 Tue,  6 Sep 2022 16:49:47 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 16:53:20 +0800
Subject: Re: [PATCH v3 0/4] mm: arm64: bring up BATCHED_UNMAP_TLB_FLUSH
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
References: <20220822082120.8347-1-yangyicong@huawei.com>
Message-ID: <34762b48-3da4-4f2e-64a7-68a44f21d4fd@huawei.com>
Date: Tue, 6 Sep 2022 16:53:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220822082120.8347-1-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com,
 zhangshiming@oppo.com, lipeifeng@oppo.com, prime.zeng@hisilicon.com,
 arnd@arndb.de, corbet@lwn.net, peterz@infradead.org, realmz6@gmail.com,
 Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org,
 yangyicong@hisilicon.com, openrisc@lists.librecores.org,
 xhao@linux.alibaba.com, darren@os.amperecomputing.com, huzhanyuan@oppo.com,
 guojian@oppo.com, linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, anshuman.khandual@arm.com
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Hi mm and arm64 maintainers,

a gentle ping for this..

Thanks.

On 2022/8/22 16:21, Yicong Yang wrote:
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
> My testing on snapdragon shows the overhead of ptep_clear_flush
> is removed by the patchset. The micro benchmark becomes 5% faster
> even for one page mapped by single process on snapdragon 888.
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
> Barry Song (3):
>   Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't
>     apply to ARM64"
>   mm: rmap: Extend tlbbatch APIs to fit new platforms
>   arm64: support batched/deferred tlb shootdown during page reclamation
> 
>  Documentation/features/arch-support.txt       |  1 -
>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
>  arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
>  arch/x86/include/asm/tlbflush.h               | 15 +++++++++-
>  mm/rmap.c                                     | 19 +++++--------
>  7 files changed, 61 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
> 

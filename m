Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1F1495B9417
	for <lists+openrisc@lfdr.de>; Thu, 15 Sep 2022 08:08:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 62CA424B94;
	Thu, 15 Sep 2022 08:08:00 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id B482B24AB1
 for <openrisc@lists.librecores.org>; Thu, 15 Sep 2022 08:07:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 315E31682;
 Wed, 14 Sep 2022 23:08:04 -0700 (PDT)
Received: from [10.162.43.6] (unknown [10.162.43.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94AAA3F73B;
 Wed, 14 Sep 2022 23:08:16 -0700 (PDT)
Message-ID: <1125554b-c183-23c4-5516-95b918a761cc@arm.com>
Date: Thu, 15 Sep 2022 11:37:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Barry Song <21cnbao@gmail.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
 <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com,
 linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>,
 linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com,
 Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org,
 darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com,
 Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>



On 9/9/22 11:05, Barry Song wrote:
> On Fri, Sep 9, 2022 at 5:24 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>>
>> On 8/22/22 13:51, Yicong Yang wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
>>>
>>> on x86, batched and deferred tlb shootdown has lead to 90%
>>> performance increase on tlb shootdown. on arm64, HW can do
>>> tlb shootdown without software IPI. But sync tlbi is still
>>> quite expensive.
>>>
>>> Even running a simplest program which requires swapout can
>>> prove this is true,
>>>  #include <sys/types.h>
>>>  #include <unistd.h>
>>>  #include <sys/mman.h>
>>>  #include <string.h>
>>>
>>>  int main()
>>>  {
>>>  #define SIZE (1 * 1024 * 1024)
>>>          volatile unsigned char *p = mmap(NULL, SIZE, PROT_READ | PROT_WRITE,
>>>                                           MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>>>
>>>          memset(p, 0x88, SIZE);
>>>
>>>          for (int k = 0; k < 10000; k++) {
>>>                  /* swap in */
>>>                  for (int i = 0; i < SIZE; i += 4096) {
>>>                          (void)p[i];
>>>                  }
>>>
>>>                  /* swap out */
>>>                  madvise(p, SIZE, MADV_PAGEOUT);
>>>          }
>>>  }
>>>
>>> Perf result on snapdragon 888 with 8 cores by using zRAM
>>> as the swap block device.
>>>
>>>  ~ # perf record taskset -c 4 ./a.out
>>>  [ perf record: Woken up 10 times to write data ]
>>>  [ perf record: Captured and wrote 2.297 MB perf.data (60084 samples) ]
>>>  ~ # perf report
>>>  # To display the perf.data header info, please use --header/--header-only options.
>>>  # To display the perf.data header info, please use --header/--header-only options.
>>>  #
>>>  #
>>>  # Total Lost Samples: 0
>>>  #
>>>  # Samples: 60K of event 'cycles'
>>>  # Event count (approx.): 35706225414
>>>  #
>>>  # Overhead  Command  Shared Object      Symbol
>>>  # ........  .......  .................  .............................................................................
>>>  #
>>>     21.07%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irq
>>>      8.23%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestore
>>>      6.67%  a.out    [kernel.kallsyms]  [k] filemap_map_pages
>>>      6.16%  a.out    [kernel.kallsyms]  [k] __zram_bvec_write
>>>      5.36%  a.out    [kernel.kallsyms]  [k] ptep_clear_flush
>>>      3.71%  a.out    [kernel.kallsyms]  [k] _raw_spin_lock
>>>      3.49%  a.out    [kernel.kallsyms]  [k] memset64
>>>      1.63%  a.out    [kernel.kallsyms]  [k] clear_page
>>>      1.42%  a.out    [kernel.kallsyms]  [k] _raw_spin_unlock
>>>      1.26%  a.out    [kernel.kallsyms]  [k] mod_zone_state.llvm.8525150236079521930
>>>      1.23%  a.out    [kernel.kallsyms]  [k] xas_load
>>>      1.15%  a.out    [kernel.kallsyms]  [k] zram_slot_lock
>>>
>>> ptep_clear_flush() takes 5.36% CPU in the micro-benchmark
>>> swapping in/out a page mapped by only one process. If the
>>> page is mapped by multiple processes, typically, like more
>>> than 100 on a phone, the overhead would be much higher as
>>> we have to run tlb flush 100 times for one single page.
>>> Plus, tlb flush overhead will increase with the number
>>> of CPU cores due to the bad scalability of tlb shootdown
>>> in HW, so those ARM64 servers should expect much higher
>>> overhead.
>>>
>>> Further perf annonate shows 95% cpu time of ptep_clear_flush
>>> is actually used by the final dsb() to wait for the completion
>>> of tlb flush. This provides us a very good chance to leverage
>>> the existing batched tlb in kernel. The minimum modification
>>> is that we only send async tlbi in the first stage and we send
>>> dsb while we have to sync in the second stage.
>>>
>>> With the above simplest micro benchmark, collapsed time to
>>> finish the program decreases around 5%.
>>>
>>> Typical collapsed time w/o patch:
>>>  ~ # time taskset -c 4 ./a.out
>>>  0.21user 14.34system 0:14.69elapsed
>>> w/ patch:
>>>  ~ # time taskset -c 4 ./a.out
>>>  0.22user 13.45system 0:13.80elapsed
>>>
>>> Also, Yicong Yang added the following observation.
>>>       Tested with benchmark in the commit on Kunpeng920 arm64 server,
>>>       observed an improvement around 12.5% with command
>>>       `time ./swap_bench`.
>>>               w/o             w/
>>>       real    0m13.460s       0m11.771s
>>>       user    0m0.248s        0m0.279s
>>>       sys     0m12.039s       0m11.458s
>>>
>>>       Originally it's noticed a 16.99% overhead of ptep_clear_flush()
>>>       which has been eliminated by this patch:
>>>
>>>       [root@localhost yang]# perf record -- ./swap_bench && perf report
>>>       [...]
>>>       16.99%  swap_bench  [kernel.kallsyms]  [k] ptep_clear_flush
>>>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Nadav Amit <namit@vmware.com>
>>> Cc: Mel Gorman <mgorman@suse.de>
>>> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
>>> Tested-by: Xin Hao <xhao@linux.alibaba.com>
>>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>  .../features/vm/TLB/arch-support.txt          |  2 +-
>>>  arch/arm64/Kconfig                            |  1 +
>>>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++++++
>>>  arch/arm64/include/asm/tlbflush.h             | 28 +++++++++++++++++--
>>>  4 files changed, 40 insertions(+), 3 deletions(-)
>>>  create mode 100644 arch/arm64/include/asm/tlbbatch.h
>>>
>>> diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
>>> index 1c009312b9c1..2caf815d7c6c 100644
>>> --- a/Documentation/features/vm/TLB/arch-support.txt
>>> +++ b/Documentation/features/vm/TLB/arch-support.txt
>>> @@ -9,7 +9,7 @@
>>>      |       alpha: | TODO |
>>>      |         arc: | TODO |
>>>      |         arm: | TODO |
>>> -    |       arm64: | TODO |
>>> +    |       arm64: |  ok  |
>>>      |        csky: | TODO |
>>>      |     hexagon: | TODO |
>>>      |        ia64: | TODO |
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index 571cc234d0b3..09d45cd6d665 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -93,6 +93,7 @@ config ARM64
>>>       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>>>       select ARCH_SUPPORTS_NUMA_BALANCING
>>>       select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>>> +     select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>>>       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
>>>       select ARCH_WANT_DEFAULT_BPF_JIT
>>>       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
>>> diff --git a/arch/arm64/include/asm/tlbbatch.h b/arch/arm64/include/asm/tlbbatch.h
>>> new file mode 100644
>>> index 000000000000..fedb0b87b8db
>>> --- /dev/null
>>> +++ b/arch/arm64/include/asm/tlbbatch.h
>>> @@ -0,0 +1,12 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ARCH_ARM64_TLBBATCH_H
>>> +#define _ARCH_ARM64_TLBBATCH_H
>>> +
>>> +struct arch_tlbflush_unmap_batch {
>>> +     /*
>>> +      * For arm64, HW can do tlb shootdown, so we don't
>>> +      * need to record cpumask for sending IPI
>>> +      */
>>> +};
>>> +
>>> +#endif /* _ARCH_ARM64_TLBBATCH_H */
>>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>>> index 412a3b9a3c25..23cbc987321a 100644
>>> --- a/arch/arm64/include/asm/tlbflush.h
>>> +++ b/arch/arm64/include/asm/tlbflush.h
>>> @@ -254,17 +254,24 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
>>>       dsb(ish);
>>>  }
>>>
>>> -static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>>> +
>>> +static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
>>>                                        unsigned long uaddr)
>>>  {
>>>       unsigned long addr;
>>>
>>>       dsb(ishst);
>>> -     addr = __TLBI_VADDR(uaddr, ASID(vma->vm_mm));
>>> +     addr = __TLBI_VADDR(uaddr, ASID(mm));
>>>       __tlbi(vale1is, addr);
>>>       __tlbi_user(vale1is, addr);
>>>  }
>>>
>>> +static inline void flush_tlb_page_nosync(struct vm_area_struct *vma,
>>> +                                      unsigned long uaddr)
>>> +{
>>> +     return __flush_tlb_page_nosync(vma->vm_mm, uaddr);
>>> +}
>>> +
>>>  static inline void flush_tlb_page(struct vm_area_struct *vma,
>>>                                 unsigned long uaddr)
>>>  {
>>> @@ -272,6 +279,23 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>>>       dsb(ish);
>>>  }
>>>
>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>> +{
>>> +     return true;
>>> +}
>>
>> Always defer and batch up TLB flush, unconditionally ?
> 
> My understanding is we actually don't need tlbbatch for a machine with one
> or two cores as the tlb flush is not expensive. even for a system with four
> cortex-a55 cores, i didn't see obvious cost. it was less than 1%.
> when we have 8 cores, we see the obvious cost of tlb flush. for a server with
> 100 crores, the cost is incredibly huge.

Although dsb(ish) is deferred via arch_tlbbatch_flush(), there is still
one dsb(isht) instruction left in __flush_tlb_page_nosync(). Is not that
expensive as well, while queuing up individual TLB flushes ?

The very idea behind TLB deferral is the opportunity it (might) provide
to accumulate address ranges and cpu masks so that individual TLB flush
can be replaced with a more cost effective range based TLB flush. Hence
I guess unless address range or cpumask based cost effective TLB flush
is available, deferral does not improve the unmap performance as much.

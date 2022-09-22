Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 00F065E5971
	for <lists+openrisc@lfdr.de>; Thu, 22 Sep 2022 05:15:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 84D0024B82;
	Thu, 22 Sep 2022 05:15:37 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 35A7624B71
 for <openrisc@lists.librecores.org>; Thu, 22 Sep 2022 05:15:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAACE143D;
 Wed, 21 Sep 2022 20:15:40 -0700 (PDT)
Received: from [10.162.43.8] (unknown [10.162.43.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAB43F5A1;
 Wed, 21 Sep 2022 20:15:24 -0700 (PDT)
Message-ID: <0236922f-841e-c6d8-c9ee-599d72c458d3@arm.com>
Date: Thu, 22 Sep 2022 08:45:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <888da5f3-104c-3929-c21e-c710922d6f1e@arm.com>
 <36B9DE22-E3BC-4CB2-8E3F-B21B61434CD3@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <36B9DE22-E3BC-4CB2-8E3F-B21B61434CD3@vmware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
 Linux MM <linux-mm@kvack.org>, "guojian@oppo.com" <guojian@oppo.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "zhangshiming@oppo.com" <zhangshiming@oppo.com>,
 "lipeifeng@oppo.com" <lipeifeng@oppo.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "x86@kernel.org" <x86@kernel.org>, Barry Song <21cnbao@gmail.com>,
 Mel Gorman <mgorman@suse.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "realmz6@gmail.com" <realmz6@gmail.com>,
 Barry Song <v-songbaohua@oppo.com>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>,
 Yicong Yang <yangyicong@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>



On 9/21/22 12:47, Nadav Amit wrote:
> On Sep 20, 2022, at 11:53 PM, Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> ⚠ External Email
>>
>> On 8/22/22 13:51, Yicong Yang wrote:
>>> +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
>>> +                                     struct mm_struct *mm,
>>> +                                     unsigned long uaddr)
>>> +{
>>> +     __flush_tlb_page_nosync(mm, uaddr);
>>> +}
>>> +
>>> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>>> +{
>>> +     dsb(ish);
>>> +}
>>
>> Just wondering if arch_tlbbatch_add_mm() could also detect continuous mapping
>> TLB invalidation requests on a given mm and try to generate a range based TLB
>> invalidation such as flush_tlb_range().
>>
>> struct arch_tlbflush_unmap_batch via task->tlb_ubc->arch can track continuous
>> ranges while being queued up via arch_tlbbatch_add_mm(), any range formed can
>> later be flushed in subsequent arch_tlbbatch_flush() ?
>>
>> OR
>>
>> It might not be worth the effort and complexity, in comparison to performance
>> improvement, TLB range flush brings in ?
> 
> So here are my 2 cents, based on my experience with Intel-x86. It is likely
> different on arm64, but perhaps it can provide you some insight into what
> parameters you should measure and consider.
> 
> In general there is a tradeoff between full TLB flushes and entry-specific
> ones. Flushing specific entries takes more time than flushing the entire
> TLB, but sade TLB refills.

Right.

> 
> Dave Hansen made some calculations in the past and came up with 33 as a
> magic cutoff number, i.e., if you need to flush more than 33 entries, just
> flush the entire TLB. I am not sure that this exact number is very
> meaningful, since one might argue that it should’ve taken PTI into account
> (which might require twice as many TLB invalidations).

Okay.

> 
> Anyhow, back to arch_tlbbatch_add_mm(). It may be possible to track ranges,
> but the question is whether you would actually succeed in forming continuous
> ranges that are eventually (on x86) smaller than the full TLB flush cutoff
> (=33). Questionable (perhaps better with MGLRU?).

This proposal here for arm64 does not cause a full TLB flush ever. It creates
individual TLB flushes all the time. Hence the choice here is not between full
TLB flush and possible range flushes. Choice is actually between individual
TLB flushes and range/full TLB flushes.

> 
> Then, you should remember that tracking should be very efficient, since even
> few cache misses might have greater cost than what you save by
> selective-flushing. Finally, on x86 you would need to invoke the smp/IPI
> layer multiple times to send different cores the relevant range they need to
> flush.

Agreed, these reasons make it much difficult to gain any more performance.

> 
> IOW: It is somewhat complicated to implement efficeintly. On x86, and
> probably other IPI-based TLB shootdown systems, does not have clear
> performance benefit (IMHO).

Agreed, thanks for such a detailed explanation, appreciate it.

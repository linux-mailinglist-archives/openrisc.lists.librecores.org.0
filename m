Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 664A760F582
	for <lists+openrisc@lfdr.de>; Thu, 27 Oct 2022 12:42:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 063EE24C41;
	Thu, 27 Oct 2022 12:42:08 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 5D00924B33
 for <openrisc@lists.librecores.org>; Thu, 27 Oct 2022 12:42:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF9221FB;
 Thu, 27 Oct 2022 03:42:12 -0700 (PDT)
Received: from [10.163.38.26] (unknown [10.163.38.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EF8D3F445;
 Thu, 27 Oct 2022 03:41:56 -0700 (PDT)
Message-ID: <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
Date: Thu, 27 Oct 2022 16:11:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Barry Song <21cnbao@gmail.com>, Yicong Yang <yangyicong@huawei.com>
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
 <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
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
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>



On 9/28/22 05:53, Barry Song wrote:
> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>> [...]
>>>
>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>> +{
>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>> +    if (num_online_cpus() <= 4)
>>>
>>> It would be great to have some more inputs from others, whether 4 (which should
>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>> is optimal for an wide range of arm64 platforms.
>>>
> 
> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> with 5,6,7
> cores.
> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> this patch.
> 
> so it seems safe to have
> if (num_online_cpus()  < 8)
> 
>>
>> Do you prefer this macro to be static or make it configurable through kconfig then
>> different platforms can make choice based on their own situations? It maybe hard to
>> test on all the arm64 platforms.
> 
> Maybe we can have this default enabled on machines with 8 and more cpus and
> provide a tlbflush_batched = on or off to allow users enable or
> disable it according
> to their hardware and products. Similar example: rodata=on or off.

No, sounds bit excessive. Kernel command line options should not be added
for every possible run time switch options.

> 
> Hi Anshuman, Will,  Catalin, Andrew,
> what do you think about this approach?
> 
> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> 
> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> even by hardware broadcast.

Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
with CONFIG_EXPERT and for num_online_cpus()  > 8 ?

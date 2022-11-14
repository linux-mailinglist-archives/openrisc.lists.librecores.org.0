Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 03BB9627806
	for <lists+openrisc@lfdr.de>; Mon, 14 Nov 2022 09:46:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ABD0424A5E;
	Mon, 14 Nov 2022 09:46:15 +0100 (CET)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by mail.librecores.org (Postfix) with ESMTPS id 3A5DD24953
 for <openrisc@lists.librecores.org>; Mon, 14 Nov 2022 09:46:14 +0100 (CET)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N9jZS4TZcz15Md3;
 Mon, 14 Nov 2022 16:45:52 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 16:46:11 +0800
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
 <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9982dac0-9f2e-112a-d440-467c8e8f8aa4@huawei.com>
Date: Mon, 14 Nov 2022 16:46:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com,
 peterz@infradead.org, yangyicong@hisilicon.com, punit.agrawal@bytedance.com,
 Nadav Amit <namit@vmware.com>, guojian@oppo.com,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net,
 Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>,
 linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com,
 Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org,
 prime.zeng@hisilicon.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org,
 huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On 2022/11/14 11:29, Anshuman Khandual wrote:
> 
> 
> On 10/28/22 13:42, Yicong Yang wrote:
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +	/*
>> +	 * TLB batched flush is proved to be beneficial for systems with large
>> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
>> +	 * is cheap on small systems which may not need this feature. So use
>> +	 * a threshold for enabling this to avoid potential side effects on
>> +	 * these platforms.
>> +	 */
>> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
>> +		return false;
>> +
>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>> +		return false;
>> +#endif
> 
> should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
> arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
> It should be okay to check capability with this_cpu_has_cap() as the entire call chain
> here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
> simpler, consistent, and also cost effective ?
> 

ok. Checked cpus_have_const_cap() I think it matches your words.

> Regardless, a comment is needed before the #ifdef block explaining why it does not make
> sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
> between two TLBI instructions to workaround the errata.
> 

The workaround for the errata mentioned the affected platforms need the tlbi+dsb to be done
twice, so I'm not sure if we defer the final dsb will cause any problem so I think the judgement
here is used for safety. I have no such platform to test if it's ok to defer the last dsb.

>> +
>> +	return true;
>> +}
>> +
>> +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
>> +					struct mm_struct *mm,
>> +					unsigned long uaddr)
>> +{
>> +	__flush_tlb_page_nosync(mm, uaddr);
>> +}
>> +
>> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>> +{
>> +	dsb(ish);
>> +}
> .
> 

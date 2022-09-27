Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 62BD75EBE15
	for <lists+openrisc@lfdr.de>; Tue, 27 Sep 2022 11:15:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DEB5124BFA;
	Tue, 27 Sep 2022 11:15:47 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by mail.librecores.org (Postfix) with ESMTPS id 3ABF924B7A
 for <openrisc@lists.librecores.org>; Tue, 27 Sep 2022 11:15:46 +0200 (CEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McDRd2xl3zpV3J;
 Tue, 27 Sep 2022 17:12:45 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 17:15:40 +0800
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Anshuman Khandual <anshuman.khandual@arm.com>
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
Date: Tue, 27 Sep 2022 17:15:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com,
 linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 corbet@lwn.net, x86@kernel.org, Barry Song <21cnbao@gmail.com>,
 Mel Gorman <mgorman@suse.de>, linux-mips@vger.kernel.org, arnd@arndb.de,
 realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>,
 openrisc@lists.librecores.org, darren@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com,
 linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On 2022/9/27 14:16, Anshuman Khandual wrote:
> [...]
> 
> On 9/21/22 14:13, Yicong Yang wrote:
>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>> +{
>> +	/* for small systems with small number of CPUs, TLB shootdown is cheap */
>> +	if (num_online_cpus() <= 4)
> 
> It would be great to have some more inputs from others, whether 4 (which should
> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
> is optimal for an wide range of arm64 platforms.
> 

Do you prefer this macro to be static or make it configurable through kconfig then
different platforms can make choice based on their own situations? It maybe hard to
test on all the arm64 platforms.

Thanks.

>> +		return false;> +
>> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
>> +		return false;
>> +#endif
>> +
>> +	return true;
>> +}
>> +
> 
> [...]
> 
> .
> 

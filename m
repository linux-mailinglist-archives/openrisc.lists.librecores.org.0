Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5434C6640C4
	for <lists+openrisc@lfdr.de>; Tue, 10 Jan 2023 13:46:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B984B22A3B;
	Tue, 10 Jan 2023 13:46:56 +0100 (CET)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mail.librecores.org (Postfix) with ESMTPS id 25333213BB
 for <openrisc@lists.librecores.org>; Tue, 10 Jan 2023 13:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673354814; x=1704890814;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JjCURNXFRNcYm6qc3FnZISad0UB5+7XjMdbu/B0f1Fo=;
 b=KcH1YcRq4SGVzIXVeSkfLjSr79CduwwjQzChp90FrawH9DWJ9+pngahw
 ZdLi0iqcV0sh5zs6QKXKthaQnXkXdUrAeHAlWgzRe0kElBIChKKcWdOlG
 h50ouHyD7HWyuYQZ/zTU8nHzsL8ZR2cjtsXfoRgogs1N8fLo9lMD+Eo4a
 f4TUabRhv53fvmgkCU4igP9XEjVblV3CnqLlvolENCTU7SFj/bLPwbxFN
 yIVI1ttWV2XsaHLEgsan6lknE5xzuLIrLtWoDXSmEkLJyBCsKfsudWp6v
 hDNzlsYd7sXh3fe4xeicMxom1j42p0B+nZfb2QSNsf2YPB93pTrnvXbhd w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="302834341"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="302834341"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:46:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689393555"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="689393555"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.19])
 ([10.213.8.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 04:46:39 -0800
Message-ID: <1bfae3d0-8c0b-ea83-7184-db847a4a969f@intel.com>
Date: Tue, 10 Jan 2023 13:46:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC DO NOT MERGE] treewide: use __xchg in most
 obvious places
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
 <20230110105306.3973122-1-andrzej.hajda@intel.com>
 <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Y71G1tkmUzM4BLxn@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Boqun Feng <boqun.feng@gmail.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, loongarch@lists.linux.dev,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On 10.01.2023 12:07, Andy Shevchenko wrote:
> On Tue, Jan 10, 2023 at 11:53:06AM +0100, Andrzej Hajda wrote:
>> This patch tries to show usability of __xchg helper.
>> It is not intended to be merged, but I can convert
>> it to proper patchset if necessary.
>>
>> There are many more places where __xchg can be used.
>> This demo shows the most spectacular cases IMHO:
>> - previous value is returned from function,
>> - temporary variables are in use.
>>
>> As a result readability is much better and diffstat is quite
>> nice, less local vars to look at.
>> In many cases whole body of functions is replaced
>> with __xchg(ptr, val), so as further refactoring the whole
>> function can be removed and __xchg can be called directly.
> 
> ...
> 
>>   arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
>>   				  struct pt_regs *regs)
>>   {
>> -	unsigned long orig_ret_vaddr;
>> -
>> -	orig_ret_vaddr = regs->ARM_lr;
>> -	/* Replace the return addr with trampoline addr */
>> -	regs->ARM_lr = trampoline_vaddr;
>> -	return orig_ret_vaddr;
>> +	return __xchg(&regs->ARM_lr, trampoline_vaddr);
>>   }
> 
> If it's not a callback, the entire function can be killed.
> And this is a good example of the function usage.
> OTOH, these places might have a side effect (if it's in deep CPU
> handlers), means we need to do this carefully.
> 
> ...
> 
>>   static inline void *qed_chain_produce(struct qed_chain *p_chain)
>>   {
>> -	void *p_ret = NULL, *p_prod_idx, *p_prod_page_idx;
>> +	void *p_prod_idx, *p_prod_page_idx;
>>   
>>   	if (is_chain_u16(p_chain)) {
>>   		if ((p_chain->u.chain16.prod_idx &
>> @@ -390,11 +391,8 @@ static inline void *qed_chain_produce(struct qed_chain *p_chain)
>>   		p_chain->u.chain32.prod_idx++;
>>   	}
>>   
>> -	p_ret = p_chain->p_prod_elem;
>> -	p_chain->p_prod_elem = (void *)(((u8 *)p_chain->p_prod_elem) +
>> -					p_chain->elem_size);
>> -
>> -	return p_ret;
>> +	return __xchg(&p_chain->p_prod_elem,
>> +		      (void *)(((u8 *)p_chain->p_prod_elem) + p_chain->elem_size));
> 
> Wondering if you still need a (void *) casting after the change. Ditto for the
> rest of similar cases.

IMHO it is not needed also before the change and IIRC gcc has an 
extension which allows to drop (u8 *) cast as well [1].

[1]: https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html

> 
>>   }
> 
> ...
> 
> Btw, is it done by coccinelle? If no, why not providing the script?
> 

Yes I have used cocci. My cocci skills are far from perfect, so I did 
not want to share my dirty code, but this is nothing secret:

@r1@
expression x, v;
local idexpression p;
@@
-       p = x;
-       x = v;
-       return p;
+       return __xchg(&x, v);

@depends on r1@
expression e;
@@
         __xchg(
-       &*e,
+       e,
         ...)

@depends on r1@
expression t;
@@
-       if (t) {
+       if (t)
                 return __xchg(...);
-       }

@depends on r1@
type t;
identifier p;
expression e;
@@
(
-       t p;
|
-       t p = e;
)
         ... when != p

Regards
Andrzej


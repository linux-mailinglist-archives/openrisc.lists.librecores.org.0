Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D054495B
	for <lists+openrisc@lfdr.de>; Thu,  9 Jun 2022 12:42:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CFD46248F8;
	Thu,  9 Jun 2022 12:41:58 +0200 (CEST)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by mail.librecores.org (Postfix) with ESMTPS id E722D20CE9
 for <openrisc@lists.librecores.org>; Thu,  9 Jun 2022 06:44:59 +0200 (CEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VFqwi0e_1654749895; 
Received: from 30.97.48.137(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VFqwi0e_1654749895) by smtp.aliyun-inc.com;
 Thu, 09 Jun 2022 12:44:55 +0800
Message-ID: <59676cdf-a719-efcd-d5c1-b43198dc4348@linux.alibaba.com>
Date: Thu, 9 Jun 2022 12:45:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [mm] 9b12e49e9b: BUG:Bad_page_state_in_process
To: Matthew Wilcox <willy@infradead.org>,
 kernel test robot <oliver.sang@intel.com>
References: <d35f42f7b598f629437940f941826e2cc49a97f6.1654271618.git.baolin.wang@linux.alibaba.com>
 <20220608143819.GA31193@xsang-OptiPlex-9020>
 <YqC7K0e2FFp7vT6i@casper.infradead.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <YqC7K0e2FFp7vT6i@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Jun 2022 12:41:56 +0200
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
Cc: linux-arch@vger.kernel.org, 0day robot <lkp@intel.com>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org,
 lkp@lists.01.org, openrisc@lists.librecores.org, akpm@linux-foundation.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>



On 6/8/2022 11:07 PM, Matthew Wilcox wrote:
> On Wed, Jun 08, 2022 at 10:38:19PM +0800, kernel test robot wrote:
>>
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-11):
>>
>> commit: 9b12e49e9b02bbaca8041f236a6b2fd4586d45c8 ("[RFC PATCH 3/3] mm: Add kernel PTE level pagetable pages account")
> 
>> [   75.338681][ T4873] BUG: Bad page state in process 444  pfn:20b066
>> [   75.338840][ T4873] page:0000000016cf0259 refcount:0 mapcount:-512 mapping:0000000000000000 index:0x0 pfn:0x20b066
> 
> mapcount:-512 is PG_table.  Somebody forgot to call
> pgtable_pte_page_dtor() (or similar)

Right. Thanks for reminding. :)

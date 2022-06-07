Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8859153DB1D
	for <lists+openrisc@lfdr.de>; Sun,  5 Jun 2022 11:50:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4268124952;
	Sun,  5 Jun 2022 11:50:59 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 3B7C42431D
 for <openrisc@lists.librecores.org>; Sun,  5 Jun 2022 11:50:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AEC0D6E;
 Sun,  5 Jun 2022 02:50:56 -0700 (PDT)
Received: from [10.163.37.253] (unknown [10.163.37.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BD7E3F73D;
 Sun,  5 Jun 2022 02:50:47 -0700 (PDT)
Message-ID: <03fb0343-25ec-0356-211f-edbea7541429@arm.com>
Date: Sun, 5 Jun 2022 15:20:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/6] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-5-anshuman.khandual@arm.com>
 <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Openrisc <openrisc@lists.librecores.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>



On 6/4/22 17:43, Guo Ren wrote:
> Acked-by: Guo Ren <guoren@kernel.org>

I will resend this series with suggested changes.

> 
> On Fri, Jun 3, 2022 at 6:15 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed.
>>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: linux-csky@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Guo Ren <guoren@kernel.org>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/csky/Kconfig               |  1 +
>>  arch/csky/include/asm/pgtable.h | 18 ------------------
>>  arch/csky/mm/init.c             | 32 ++++++++++++++++++++++++++++++++
>>  3 files changed, 33 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
>> index 21d72b078eef..588b8a9c68ed 100644
>> --- a/arch/csky/Kconfig
>> +++ b/arch/csky/Kconfig
>> @@ -6,6 +6,7 @@ config CSKY
>>         select ARCH_HAS_GCOV_PROFILE_ALL
>>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>> +       select ARCH_HAS_VM_GET_PAGE_PROT
>>         select ARCH_USE_BUILTIN_BSWAP
>>         select ARCH_USE_QUEUED_RWLOCKS
>>         select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
>> diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
>> index bbe245117777..229a5f4ad7fc 100644
>> --- a/arch/csky/include/asm/pgtable.h
>> +++ b/arch/csky/include/asm/pgtable.h
>> @@ -77,24 +77,6 @@
>>  #define MAX_SWAPFILES_CHECK() \
>>                 BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
>>
>> -#define __P000 PAGE_NONE
>> -#define __P001 PAGE_READ
>> -#define __P010 PAGE_READ
>> -#define __P011 PAGE_READ
>> -#define __P100 PAGE_READ
>> -#define __P101 PAGE_READ
>> -#define __P110 PAGE_READ
>> -#define __P111 PAGE_READ
>> -
>> -#define __S000 PAGE_NONE
>> -#define __S001 PAGE_READ
>> -#define __S010 PAGE_WRITE
>> -#define __S011 PAGE_WRITE
>> -#define __S100 PAGE_READ
>> -#define __S101 PAGE_READ
>> -#define __S110 PAGE_WRITE
>> -#define __S111 PAGE_WRITE
>> -
>>  extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>>  #define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>>
>> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
>> index bf2004aa811a..f9babbed17d4 100644
>> --- a/arch/csky/mm/init.c
>> +++ b/arch/csky/mm/init.c
>> @@ -197,3 +197,35 @@ void __init fixaddr_init(void)
>>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>>  }
>> +
>> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +       switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
>> +       case VM_NONE:
>> +               return PAGE_NONE;
>> +       case VM_READ:
>> +       case VM_WRITE:
>> +       case VM_WRITE | VM_READ:
>> +       case VM_EXEC:
>> +       case VM_EXEC | VM_READ:
>> +       case VM_EXEC | VM_WRITE:
>> +       case VM_EXEC | VM_WRITE | VM_READ:
>> +               return PAGE_READ;
>> +       case VM_SHARED:
>> +               return PAGE_NONE;
>> +       case VM_SHARED | VM_READ:
>> +               return PAGE_READ;
>> +       case VM_SHARED | VM_WRITE:
>> +       case VM_SHARED | VM_WRITE | VM_READ:
>> +               return PAGE_WRITE;
>> +       case VM_SHARED | VM_EXEC:
>> +       case VM_SHARED | VM_EXEC | VM_READ:
>> +               return PAGE_READ;
>> +       case VM_SHARED | VM_EXEC | VM_WRITE:
>> +       case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
>> +               return PAGE_WRITE;
>> +       default:
>> +               BUILD_BUG();
>> +       }
>> +}
>> +EXPORT_SYMBOL(vm_get_page_prot);
>> --
>> 2.25.1
>>
> 
> 

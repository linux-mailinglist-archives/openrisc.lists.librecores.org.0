Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4065455BB42
	for <lists+openrisc@lfdr.de>; Mon, 27 Jun 2022 19:15:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D92F2496D;
	Mon, 27 Jun 2022 19:15:02 +0200 (CEST)
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by mail.librecores.org (Postfix) with ESMTPS id AE6D92492A
 for <openrisc@lists.librecores.org>; Mon, 27 Jun 2022 19:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7lcoTIguoCU25UtATqw0zpenNexDp4klBKBcas47lUI=;
 b=DnMKzuyWChdqVj0eyu9qk+S12hDc5E1lpoUVu+RwnrA66JDBO9VVaJjjgy7iZh0CwjBX0Tb2UW9eA
 IDL3blt0HWe+7nCJ6LBbtgtWCdYTIJf7JxMi5tEKyk04dMJhxQKgJhN19n7gZmip7ExOCH60av6Zc+
 fpOnPKVrkcE6dB7IpmBBA5V/48B5nOCXs0dWxrIHUJoi6B5gDTxnps7C32yW7RQiRmwMZofOskZtJ1
 g5yggk+VyjJho8A1QsSz/r/K9taqv0SWrqNZr//W7DugrtnSjHFKtDOi/ahsacud1GZwml0SRslSij
 +WBGlPijIt3aAxUmrpMXX3P747L7FOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=7lcoTIguoCU25UtATqw0zpenNexDp4klBKBcas47lUI=;
 b=0c4FfNqt1mwTyFHOd20j3eJXx+yZAcz5xOVj+2VVBhkRNfl+lcYaMnmV/txPP7q97nUwiERp2Rz/D
 LTtF3EvDA==
X-HalOne-Cookie: be347a0a6f76c63821867329f3b288b192d004df
X-HalOne-ID: ab689703-f63c-11ec-8236-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id ab689703-f63c-11ec-8236-d0431ea8bb10;
 Mon, 27 Jun 2022 17:14:58 +0000 (UTC)
Date: Mon, 27 Jun 2022 19:14:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V5 04/26] sparc/mm: Move protection_map[] inside the
 platform
Message-ID: <YrnlkLbyYSbI0EQw@ravnborg.org>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-5-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627045833.1590055-5-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 christophe.leroy@csgroup.eu, hch@infradead.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Hi Anshuman,

On Mon, Jun 27, 2022 at 10:28:11AM +0530, Anshuman Khandual wrote:
> This moves protection_map[] inside the platform and while here, also enable
> ARCH_HAS_VM_GET_PAGE_PROT on 32 bit platforms via DECLARE_VM_GET_PAGE_PROT.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/sparc/Kconfig                  |  2 +-
>  arch/sparc/include/asm/pgtable_32.h | 19 -------------------
>  arch/sparc/include/asm/pgtable_64.h | 19 -------------------
>  arch/sparc/mm/init_32.c             | 20 ++++++++++++++++++++
>  arch/sparc/mm/init_64.c             |  3 +++
>  5 files changed, 24 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index ba449c47effd..09f868613a4d 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -13,6 +13,7 @@ config 64BIT
>  config SPARC
>  	bool
>  	default y
> +	select ARCH_HAS_VM_GET_PAGE_PROT
>  	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
>  	select ARCH_MIGHT_HAVE_PC_SERIO
>  	select DMA_OPS
> @@ -84,7 +85,6 @@ config SPARC64
>  	select PERF_USE_VMALLOC
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select HAVE_C_RECORDMCOUNT
> -	select ARCH_HAS_VM_GET_PAGE_PROT
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
> index 4866625da314..8ff549004fac 100644
> --- a/arch/sparc/include/asm/pgtable_32.h
> +++ b/arch/sparc/include/asm/pgtable_32.h
> @@ -64,25 +64,6 @@ void paging_init(void);
>  
>  extern unsigned long ptr_in_current_pgd;
>  
> -/*         xwr */
> -#define __P000  PAGE_NONE
> -#define __P001  PAGE_READONLY
> -#define __P010  PAGE_COPY
> -#define __P011  PAGE_COPY
> -#define __P100  PAGE_READONLY
> -#define __P101  PAGE_READONLY
> -#define __P110  PAGE_COPY
> -#define __P111  PAGE_COPY
> -
> -#define __S000	PAGE_NONE
> -#define __S001	PAGE_READONLY
> -#define __S010	PAGE_SHARED
> -#define __S011	PAGE_SHARED
> -#define __S100	PAGE_READONLY
> -#define __S101	PAGE_READONLY
> -#define __S110	PAGE_SHARED
> -#define __S111	PAGE_SHARED
> -
>  /* First physical page can be anywhere, the following is needed so that
>   * va-->pa and vice versa conversions work properly without performance
>   * hit for all __pa()/__va() operations.
> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> index 4679e45c8348..a779418ceba9 100644
> --- a/arch/sparc/include/asm/pgtable_64.h
> +++ b/arch/sparc/include/asm/pgtable_64.h
> @@ -187,25 +187,6 @@ bool kern_addr_valid(unsigned long addr);
>  #define _PAGE_SZHUGE_4U	_PAGE_SZ4MB_4U
>  #define _PAGE_SZHUGE_4V	_PAGE_SZ4MB_4V
>  
> -/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
> -#define __P000	__pgprot(0)
> -#define __P001	__pgprot(0)
> -#define __P010	__pgprot(0)
> -#define __P011	__pgprot(0)
> -#define __P100	__pgprot(0)
> -#define __P101	__pgprot(0)
> -#define __P110	__pgprot(0)
> -#define __P111	__pgprot(0)
> -
> -#define __S000	__pgprot(0)
> -#define __S001	__pgprot(0)
> -#define __S010	__pgprot(0)
> -#define __S011	__pgprot(0)
> -#define __S100	__pgprot(0)
> -#define __S101	__pgprot(0)
> -#define __S110	__pgprot(0)
> -#define __S111	__pgprot(0)
> -
>  #ifndef __ASSEMBLY__
>  
>  pte_t mk_pte_io(unsigned long, pgprot_t, int, unsigned long);
> diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
> index 1e9f577f084d..8693e4e28b86 100644
> --- a/arch/sparc/mm/init_32.c
> +++ b/arch/sparc/mm/init_32.c
> @@ -302,3 +302,23 @@ void sparc_flush_page_to_ram(struct page *page)
>  		__flush_page_to_ram(vaddr);
>  }
>  EXPORT_SYMBOL(sparc_flush_page_to_ram);
> +
> +static pgprot_t protection_map[16] __ro_after_init = {
This can be const - like done for powerpc and others.
sparc32 and sparc64 uses each their own - and I do not see sparc32 do
any modifications to protection_map.

With this change:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> +	[VM_NONE]					= PAGE_NONE,
> +	[VM_READ]					= PAGE_READONLY,
> +	[VM_WRITE]					= PAGE_COPY,
> +	[VM_WRITE | VM_READ]				= PAGE_COPY,
> +	[VM_EXEC]					= PAGE_READONLY,
> +	[VM_EXEC | VM_READ]				= PAGE_READONLY,
> +	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
> +	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY,
> +	[VM_SHARED]					= PAGE_NONE,
> +	[VM_SHARED | VM_READ]				= PAGE_READONLY,
> +	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
> +	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
> +	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
> +	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY,
> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED
> +};
> +DECLARE_VM_GET_PAGE_PROT
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index f6174df2d5af..d6faee23c77d 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2634,6 +2634,9 @@ void vmemmap_free(unsigned long start, unsigned long end,
>  }
>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>  
> +/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
> +static pgprot_t protection_map[16] __ro_after_init;
> +
>  static void prot_init_common(unsigned long page_none,
>  			     unsigned long page_shared,
>  			     unsigned long page_copy,
> -- 
> 2.25.1

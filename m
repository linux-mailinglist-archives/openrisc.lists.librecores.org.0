Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1D30453D6AD
	for <lists+openrisc@lfdr.de>; Sat,  4 Jun 2022 14:14:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A6F4324929;
	Sat,  4 Jun 2022 14:14:05 +0200 (CEST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id E891524871
 for <openrisc@lists.librecores.org>; Sat,  4 Jun 2022 14:14:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C43F260B79
 for <openrisc@lists.librecores.org>; Sat,  4 Jun 2022 12:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1A8C3411F
 for <openrisc@lists.librecores.org>; Sat,  4 Jun 2022 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654344842;
 bh=P9g5evQvLeCWlEOvlwctyGL5SApo79l0tSxaVcIHKPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GIyFj6BBzBZ4owCCVP5Aw4h3f0cXtR3hEqmrT9g670pZU/aQzIAQ2WfJvI/DknBRp
 4bYKwydQ0aYuGH1L5fBQCLpyzXIofO9higKucAr9Sy6M/NdNgRTqlWLPjz76TpemCg
 o5/euygaM3XOLTr8By89APAq6jiMVCST2z+Q9PMv3E7nS9Z42DH7R0OrYd6SVheduF
 EZlfIsJBqn4SM90nhHS8OrgxuSA94ZHCoBGkUfXicORrA8v5ly8ntcA/nQuwU0e9It
 FE7DXLjmfzYeTqs7rwtKtwfeJR+KZPybsrMoiF6VsZOU0EImc2irdP0IzRClSsVLBw
 zeZ+URjHsYFVg==
Received: by mail-vs1-f45.google.com with SMTP id d39so9423926vsv.7
 for <openrisc@lists.librecores.org>; Sat, 04 Jun 2022 05:14:01 -0700 (PDT)
X-Gm-Message-State: AOAM531ACnzH3HiZL1P+KL4dcKTZNpwkquD311yQRDTDX7jNoLCIRt2m
 LKDXXPetUas+DxDIejrL1k586Q/oXg7ufXq10IA=
X-Google-Smtp-Source: ABdhPJwwEZX9ryeNihnPAt9cIeqrE+zZlFv6d4BeVpnc8qN7eqFa9hlNwwNfnB2L+k7vfA514WdPGRvZColxx5FoxRk=
X-Received: by 2002:a05:6102:292b:b0:34b:9fad:2b63 with SMTP id
 cz43-20020a056102292b00b0034b9fad2b63mr2132145vsb.51.1654344840935; Sat, 04
 Jun 2022 05:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-5-anshuman.khandual@arm.com>
In-Reply-To: <20220603101411.488970-5-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Jun 2022 20:13:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
Message-ID: <CAJF2gTQOKUfCyaU7gqkejvoJWeSnqc5QyyzWQCw1RJ8PEB2zKg@mail.gmail.com>
Subject: Re: [PATCH 4/6] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
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

Acked-by: Guo Ren <guoren@kernel.org>

On Fri, Jun 3, 2022 at 6:15 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/Kconfig               |  1 +
>  arch/csky/include/asm/pgtable.h | 18 ------------------
>  arch/csky/mm/init.c             | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 21d72b078eef..588b8a9c68ed 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -6,6 +6,7 @@ config CSKY
>         select ARCH_HAS_GCOV_PROFILE_ALL
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +       select ARCH_HAS_VM_GET_PAGE_PROT
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
> diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
> index bbe245117777..229a5f4ad7fc 100644
> --- a/arch/csky/include/asm/pgtable.h
> +++ b/arch/csky/include/asm/pgtable.h
> @@ -77,24 +77,6 @@
>  #define MAX_SWAPFILES_CHECK() \
>                 BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
>
> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READ
> -#define __P010 PAGE_READ
> -#define __P011 PAGE_READ
> -#define __P100 PAGE_READ
> -#define __P101 PAGE_READ
> -#define __P110 PAGE_READ
> -#define __P111 PAGE_READ
> -
> -#define __S000 PAGE_NONE
> -#define __S001 PAGE_READ
> -#define __S010 PAGE_WRITE
> -#define __S011 PAGE_WRITE
> -#define __S100 PAGE_READ
> -#define __S101 PAGE_READ
> -#define __S110 PAGE_WRITE
> -#define __S111 PAGE_WRITE
> -
>  extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>  #define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>
> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
> index bf2004aa811a..f9babbed17d4 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -197,3 +197,35 @@ void __init fixaddr_init(void)
>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>  }
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +       switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +       case VM_NONE:
> +               return PAGE_NONE;
> +       case VM_READ:
> +       case VM_WRITE:
> +       case VM_WRITE | VM_READ:
> +       case VM_EXEC:
> +       case VM_EXEC | VM_READ:
> +       case VM_EXEC | VM_WRITE:
> +       case VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED:
> +               return PAGE_NONE;
> +       case VM_SHARED | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_WRITE:
> +       case VM_SHARED | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       case VM_SHARED | VM_EXEC:
> +       case VM_SHARED | VM_EXEC | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_EXEC | VM_WRITE:
> +       case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       default:
> +               BUILD_BUG();
> +       }
> +}
> +EXPORT_SYMBOL(vm_get_page_prot);
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

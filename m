Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 88C6967FA62
	for <lists+openrisc@lfdr.de>; Sat, 28 Jan 2023 20:13:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 242B222A2C;
	Sat, 28 Jan 2023 20:13:39 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 77D32200C6
 for <openrisc@lists.librecores.org>; Sat, 28 Jan 2023 20:13:37 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F31CB8222B
 for <openrisc@lists.librecores.org>; Sat, 28 Jan 2023 05:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE10C4331F
 for <openrisc@lists.librecores.org>; Sat, 28 Jan 2023 05:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674882453;
 bh=rsLs+t0ueo1dcmdRSpYQm2gd6LqM294GlAMO4XAwih8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d5RBdNXK57QfgM9+438iCZNMuFuvEjuhuCSWz9U2TCgGCg9EHUCEnP14oWRsE7C1N
 ZOk0y/TwUIBlJ7cD9gyIwZgX/dRplnE3K103W4QYGk3L6NDXgIuzbL/ERdPy7WaV5L
 Rz56Qy9u5/Zt8YLLhOqLo7U6cVr5vlFVJvauVlGyisjf9nr3HEiMkId7pS+lNeXGKI
 hl17er6FNmYIau19XrPEowmQyVZs+45g4swODvO/nJLYAH0CEECN6l8IRQI9W16c5O
 Vc63psUgJnzvpQjfb6N8k+pPPXJMNbc7inFIIkTz1agakNOA24WiX+6fV8OKsG/VGd
 0ZU8Jft1j7lIA==
Received: by mail-lj1-f180.google.com with SMTP id by7so7600920ljb.6
 for <openrisc@lists.librecores.org>; Fri, 27 Jan 2023 21:07:33 -0800 (PST)
X-Gm-Message-State: AO0yUKUdmkoY2G4IW3HZq7T2h/1v+qfC/H6vAC0sbyydV9oXH81YTJvE
 b7P8K2iWs7YkIbVwTi7Orbfy/GYJE5ERSLudnlw=
X-Google-Smtp-Source: AMrXdXskjYJTXvWDKPuqxUvK33Eb7L5Q7PiOZ/7BXcBuMhio6ktc6GCizdAMunO49pacZFXZhTJU93iCqEOmtBCQhlo=
X-Received: by 2002:a17:906:9ea5:b0:84c:a863:ebf3 with SMTP id
 fx37-20020a1709069ea500b0084ca863ebf3mr8020307ejc.100.1674882440398; Fri, 27
 Jan 2023 21:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20230125190757.22555-1-rppt@kernel.org>
 <20230125190757.22555-4-rppt@kernel.org>
 <CAJF2gTQw7vaj8uu2CYuKHwKQM4=v7dxmtNaMMoFXjwhtvog7nw@mail.gmail.com>
In-Reply-To: <CAJF2gTQw7vaj8uu2CYuKHwKQM4=v7dxmtNaMMoFXjwhtvog7nw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 28 Jan 2023 13:07:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6JbP3zMdax1fLcNMru3D2RSiKgfMt75xmMZYBTGYiiQQ@mail.gmail.com>
Message-ID: <CAAhV-H6JbP3zMdax1fLcNMru3D2RSiKgfMt75xmMZYBTGYiiQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mm, arch: add generic implementation of pfn_valid()
 for FLATMEM
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-riscv@lists.infradead.org,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux--csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

For LoongArch part:
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Jan 27, 2023 at 9:58 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 3:08 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > Every architecture that supports FLATMEM memory model defines its own
> > version of pfn_valid() that essentially compares a pfn to max_mapnr.
> >
> > Use mips/powerpc version implemented as static inline as a generic
> > implementation of pfn_valid() and drop its per-architecture definitions
> >
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/alpha/include/asm/page.h      |  4 ----
> >  arch/arc/include/asm/page.h        |  1 -
> >  arch/csky/include/asm/page.h       |  1 -
> >  arch/hexagon/include/asm/page.h    |  1 -
> >  arch/ia64/include/asm/page.h       |  4 ----
> >  arch/loongarch/include/asm/page.h  | 13 -------------
> >  arch/m68k/include/asm/page_no.h    |  2 --
> >  arch/microblaze/include/asm/page.h |  1 -
> >  arch/mips/include/asm/page.h       | 13 -------------
> >  arch/nios2/include/asm/page.h      |  9 ---------
> >  arch/openrisc/include/asm/page.h   |  2 --
> >  arch/parisc/include/asm/page.h     |  4 ----
> >  arch/powerpc/include/asm/page.h    |  9 ---------
> >  arch/riscv/include/asm/page.h      |  5 -----
> >  arch/sh/include/asm/page.h         |  3 ---
> >  arch/sparc/include/asm/page_32.h   |  1 -
> >  arch/um/include/asm/page.h         |  1 -
> >  arch/x86/include/asm/page_32.h     |  4 ----
> >  arch/x86/include/asm/page_64.h     |  4 ----
> >  arch/xtensa/include/asm/page.h     |  2 --
> >  include/asm-generic/memory_model.h | 12 ++++++++++++
> >  include/asm-generic/page.h         |  2 --
> >  22 files changed, 12 insertions(+), 86 deletions(-)
> >
> > diff --git a/arch/alpha/include/asm/page.h b/arch/alpha/include/asm/page.h
> > index 8f3f5eecba28..227d32b6b75f 100644
> > --- a/arch/alpha/include/asm/page.h
> > +++ b/arch/alpha/include/asm/page.h
> > @@ -87,10 +87,6 @@ typedef struct page *pgtable_t;
> >  #define virt_to_page(kaddr)    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> >  #define virt_addr_valid(kaddr) pfn_valid((__pa(kaddr) >> PAGE_SHIFT))
> >
> > -#ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn)         ((pfn) < max_mapnr)
> > -#endif /* CONFIG_FLATMEM */
> > -
> >  #include <asm-generic/memory_model.h>
> >  #include <asm-generic/getorder.h>
> >
> > diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> > index 9a62e1d87967..e43fe27ec54d 100644
> > --- a/arch/arc/include/asm/page.h
> > +++ b/arch/arc/include/asm/page.h
> > @@ -109,7 +109,6 @@ extern int pfn_valid(unsigned long pfn);
> >  #else /* CONFIG_HIGHMEM */
> >
> >  #define ARCH_PFN_OFFSET                virt_to_pfn(CONFIG_LINUX_RAM_BASE)
> > -#define pfn_valid(pfn)         (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> >
> >  #endif /* CONFIG_HIGHMEM */
> >
> > diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
> > index ed7451478b1b..b23e3006a9e0 100644
> > --- a/arch/csky/include/asm/page.h
> > +++ b/arch/csky/include/asm/page.h
> > @@ -39,7 +39,6 @@
> >
> >  #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && \
> >                         (void *)(kaddr) < high_memory)
> > -#define pfn_valid(pfn)         ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> For csky part:
> Acked-by: Guo Ren <guoren@kernel.org>
>
> >
> >  extern void *memset(void *dest, int c, size_t l);
> >  extern void *memcpy(void *to, const void *from, size_t l);
> > diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
> > index d7d4f9fca327..9c03b9965f07 100644
> > --- a/arch/hexagon/include/asm/page.h
> > +++ b/arch/hexagon/include/asm/page.h
> > @@ -95,7 +95,6 @@ struct page;
> >  /* Default vm area behavior is non-executable.  */
> >  #define VM_DATA_DEFAULT_FLAGS  VM_DATA_FLAGS_NON_EXEC
> >
> > -#define pfn_valid(pfn) ((pfn) < max_mapnr)
> >  #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> >
> >  /*  Need to not use a define for linesize; may move this to another file.  */
> > diff --git a/arch/ia64/include/asm/page.h b/arch/ia64/include/asm/page.h
> > index 1b990466d540..783eceab5df3 100644
> > --- a/arch/ia64/include/asm/page.h
> > +++ b/arch/ia64/include/asm/page.h
> > @@ -97,10 +97,6 @@ do {                                         \
> >
> >  #include <asm-generic/memory_model.h>
> >
> > -#ifdef CONFIG_FLATMEM
> > -# define pfn_valid(pfn)                ((pfn) < max_mapnr)
> > -#endif
> > -
> >  #define page_to_phys(page)     (page_to_pfn(page) << PAGE_SHIFT)
> >  #define virt_to_page(kaddr)    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> >  #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
> > diff --git a/arch/loongarch/include/asm/page.h b/arch/loongarch/include/asm/page.h
> > index 53f284a96182..fb5338b352e6 100644
> > --- a/arch/loongarch/include/asm/page.h
> > +++ b/arch/loongarch/include/asm/page.h
> > @@ -82,19 +82,6 @@ typedef struct { unsigned long pgprot; } pgprot_t;
> >
> >  #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
> >
> > -#ifdef CONFIG_FLATMEM
> > -
> > -static inline int pfn_valid(unsigned long pfn)
> > -{
> > -       /* avoid <linux/mm.h> include hell */
> > -       extern unsigned long max_mapnr;
> > -       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > -
> > -       return pfn >= pfn_offset && pfn < max_mapnr;
> > -}
> > -
> > -#endif
> > -
> >  #define virt_to_pfn(kaddr)     PFN_DOWN(PHYSADDR(kaddr))
> >  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> >
> > diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
> > index 0a8ccef777fd..2555ec57149d 100644
> > --- a/arch/m68k/include/asm/page_no.h
> > +++ b/arch/m68k/include/asm/page_no.h
> > @@ -26,8 +26,6 @@ extern unsigned long memory_end;
> >  #define virt_to_page(addr)     (mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
> >  #define page_to_virt(page)     __va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))
> >
> > -#define pfn_valid(pfn)         ((pfn) < max_mapnr)
> > -
> >  #define        virt_addr_valid(kaddr)  (((unsigned long)(kaddr) >= PAGE_OFFSET) && \
> >                                 ((unsigned long)(kaddr) < memory_end))
> >
> > diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> > index 4b8b2fa78fc5..7b9861bcd458 100644
> > --- a/arch/microblaze/include/asm/page.h
> > +++ b/arch/microblaze/include/asm/page.h
> > @@ -112,7 +112,6 @@ extern int page_is_ram(unsigned long pfn);
> >  #  define page_to_phys(page)     (page_to_pfn(page) << PAGE_SHIFT)
> >
> >  #  define ARCH_PFN_OFFSET      (memory_start >> PAGE_SHIFT)
> > -#  define pfn_valid(pfn)       ((pfn) >= ARCH_PFN_OFFSET && (pfn) < (max_mapnr + ARCH_PFN_OFFSET))
> >  # endif /* __ASSEMBLY__ */
> >
> >  #define        virt_addr_valid(vaddr)  (pfn_valid(virt_to_pfn(vaddr)))
> > diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> > index 9286f11ff6ad..5978a8dfb917 100644
> > --- a/arch/mips/include/asm/page.h
> > +++ b/arch/mips/include/asm/page.h
> > @@ -224,19 +224,6 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
> >
> >  #define pfn_to_kaddr(pfn)      __va((pfn) << PAGE_SHIFT)
> >
> > -#ifdef CONFIG_FLATMEM
> > -
> > -static inline int pfn_valid(unsigned long pfn)
> > -{
> > -       /* avoid <linux/mm.h> include hell */
> > -       extern unsigned long max_mapnr;
> > -       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > -
> > -       return pfn >= pfn_offset && pfn < max_mapnr;
> > -}
> > -
> > -#endif
> > -
> >  #define virt_to_pfn(kaddr)     PFN_DOWN(virt_to_phys((void *)(kaddr)))
> >  #define virt_to_page(kaddr)    pfn_to_page(virt_to_pfn(kaddr))
> >
> > diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.h
> > index 6a989819a7c1..0ae7d9ce369b 100644
> > --- a/arch/nios2/include/asm/page.h
> > +++ b/arch/nios2/include/asm/page.h
> > @@ -86,15 +86,6 @@ extern struct page *mem_map;
> >
> >  # define pfn_to_kaddr(pfn)     __va((pfn) << PAGE_SHIFT)
> >
> > -static inline bool pfn_valid(unsigned long pfn)
> > -{
> > -       /* avoid <linux/mm.h> include hell */
> > -       extern unsigned long max_mapnr;
> > -       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > -
> > -       return pfn >= pfn_offset && pfn < max_mapnr;
> > -}
> > -
> >  # define virt_to_page(vaddr)   pfn_to_page(PFN_DOWN(virt_to_phys(vaddr)))
> >  # define virt_addr_valid(vaddr)        pfn_valid(PFN_DOWN(virt_to_phys(vaddr)))
> >
> > diff --git a/arch/openrisc/include/asm/page.h b/arch/openrisc/include/asm/page.h
> > index aab6e64d6db4..52b0d7e76446 100644
> > --- a/arch/openrisc/include/asm/page.h
> > +++ b/arch/openrisc/include/asm/page.h
> > @@ -80,8 +80,6 @@ typedef struct page *pgtable_t;
> >
> >  #define page_to_phys(page)      ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
> >
> > -#define pfn_valid(pfn)          ((pfn) < max_mapnr)
> > -
> >  #define virt_addr_valid(kaddr) (pfn_valid(virt_to_pfn(kaddr)))
> >
> >  #endif /* __ASSEMBLY__ */
> > diff --git a/arch/parisc/include/asm/page.h b/arch/parisc/include/asm/page.h
> > index 6faaaa3ebe9b..667e703c0e8f 100644
> > --- a/arch/parisc/include/asm/page.h
> > +++ b/arch/parisc/include/asm/page.h
> > @@ -155,10 +155,6 @@ extern int npmem_ranges;
> >  #define __pa(x)                        ((unsigned long)(x)-PAGE_OFFSET)
> >  #define __va(x)                        ((void *)((unsigned long)(x)+PAGE_OFFSET))
> >
> > -#ifndef CONFIG_SPARSEMEM
> > -#define pfn_valid(pfn)         ((pfn) < max_mapnr)
> > -#endif
> > -
> >  #ifdef CONFIG_HUGETLB_PAGE
> >  #define HPAGE_SHIFT            PMD_SHIFT /* fixed for transparent huge pages */
> >  #define HPAGE_SIZE             ((1UL) << HPAGE_SHIFT)
> > diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> > index edf1dd1b0ca9..f2b6bf5687d0 100644
> > --- a/arch/powerpc/include/asm/page.h
> > +++ b/arch/powerpc/include/asm/page.h
> > @@ -117,15 +117,6 @@ extern long long virt_phys_offset;
> >
> >  #ifdef CONFIG_FLATMEM
> >  #define ARCH_PFN_OFFSET                ((unsigned long)(MEMORY_START >> PAGE_SHIFT))
> > -#ifndef __ASSEMBLY__
> > -extern unsigned long max_mapnr;
> > -static inline bool pfn_valid(unsigned long pfn)
> > -{
> > -       unsigned long min_pfn = ARCH_PFN_OFFSET;
> > -
> > -       return pfn >= min_pfn && pfn < max_mapnr;
> > -}
> > -#endif
> >  #endif
> >
> >  #define virt_to_pfn(kaddr)     (__pa(kaddr) >> PAGE_SHIFT)
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 9f432c1b5289..7fed7c431928 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -171,11 +171,6 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
> >
> >  #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
> >
> > -#ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn) \
> > -       (((pfn) >= ARCH_PFN_OFFSET) && (((pfn) - ARCH_PFN_OFFSET) < max_mapnr))
> > -#endif
> > -
> >  #endif /* __ASSEMBLY__ */
> >
> >  #define virt_addr_valid(vaddr) ({                                              \
> > diff --git a/arch/sh/include/asm/page.h b/arch/sh/include/asm/page.h
> > index eca5daa43b93..09ac6c7faee0 100644
> > --- a/arch/sh/include/asm/page.h
> > +++ b/arch/sh/include/asm/page.h
> > @@ -169,9 +169,6 @@ typedef struct page *pgtable_t;
> >  #define PFN_START              (__MEMORY_START >> PAGE_SHIFT)
> >  #define ARCH_PFN_OFFSET                (PFN_START)
> >  #define virt_to_page(kaddr)    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> > -#ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn)         ((pfn) >= min_low_pfn && (pfn) < max_low_pfn)
> > -#endif
> >  #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> >
> >  #include <asm-generic/memory_model.h>
> > diff --git a/arch/sparc/include/asm/page_32.h b/arch/sparc/include/asm/page_32.h
> > index fff8861df107..6be6f683f98f 100644
> > --- a/arch/sparc/include/asm/page_32.h
> > +++ b/arch/sparc/include/asm/page_32.h
> > @@ -130,7 +130,6 @@ extern unsigned long pfn_base;
> >  #define ARCH_PFN_OFFSET                (pfn_base)
> >  #define virt_to_page(kaddr)    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> >
> > -#define pfn_valid(pfn)         (((pfn) >= (pfn_base)) && (((pfn)-(pfn_base)) < max_mapnr))
> >  #define virt_addr_valid(kaddr) ((((unsigned long)(kaddr)-PAGE_OFFSET)>>PAGE_SHIFT) < max_mapnr)
> >
> >  #include <asm-generic/memory_model.h>
> > diff --git a/arch/um/include/asm/page.h b/arch/um/include/asm/page.h
> > index cdbd9653aa14..84866127d074 100644
> > --- a/arch/um/include/asm/page.h
> > +++ b/arch/um/include/asm/page.h
> > @@ -108,7 +108,6 @@ extern unsigned long uml_physmem;
> >  #define phys_to_pfn(p) ((p) >> PAGE_SHIFT)
> >  #define pfn_to_phys(pfn) PFN_PHYS(pfn)
> >
> > -#define pfn_valid(pfn) ((pfn) < max_mapnr)
> >  #define virt_addr_valid(v) pfn_valid(phys_to_pfn(__pa(v)))
> >
> >  #include <asm-generic/memory_model.h>
> > diff --git a/arch/x86/include/asm/page_32.h b/arch/x86/include/asm/page_32.h
> > index df42f8aa99e4..580d71aca65a 100644
> > --- a/arch/x86/include/asm/page_32.h
> > +++ b/arch/x86/include/asm/page_32.h
> > @@ -15,10 +15,6 @@ extern unsigned long __phys_addr(unsigned long);
> >  #define __phys_addr_symbol(x)  __phys_addr(x)
> >  #define __phys_reloc_hide(x)   RELOC_HIDE((x), 0)
> >
> > -#ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn)         ((pfn) < max_mapnr)
> > -#endif /* CONFIG_FLATMEM */
> > -
> >  #include <linux/string.h>
> >
> >  static inline void clear_page(void *page)
> > diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
> > index 198e03e59ca1..cc6b8e087192 100644
> > --- a/arch/x86/include/asm/page_64.h
> > +++ b/arch/x86/include/asm/page_64.h
> > @@ -39,10 +39,6 @@ extern unsigned long __phys_addr_symbol(unsigned long);
> >
> >  #define __phys_reloc_hide(x)   (x)
> >
> > -#ifdef CONFIG_FLATMEM
> > -#define pfn_valid(pfn)          ((pfn) < max_pfn)
> > -#endif
> > -
> >  void clear_page_orig(void *page);
> >  void clear_page_rep(void *page);
> >  void clear_page_erms(void *page);
> > diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
> > index 493eb7083b1a..3267c672cd11 100644
> > --- a/arch/xtensa/include/asm/page.h
> > +++ b/arch/xtensa/include/asm/page.h
> > @@ -189,8 +189,6 @@ static inline unsigned long ___pa(unsigned long va)
> >  #endif
> >  #define __va(x)        \
> >         ((void *)((unsigned long) (x) - PHYS_OFFSET + PAGE_OFFSET))
> > -#define pfn_valid(pfn) \
> > -       ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> >
> >  #define virt_to_page(kaddr)    pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> >  #define page_to_virt(page)     __va(page_to_pfn(page) << PAGE_SHIFT)
> > diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> > index a2c8ed60233a..13d2a844d928 100644
> > --- a/include/asm-generic/memory_model.h
> > +++ b/include/asm-generic/memory_model.h
> > @@ -19,6 +19,18 @@
> >  #define __page_to_pfn(page)    ((unsigned long)((page) - mem_map) + \
> >                                  ARCH_PFN_OFFSET)
> >
> > +#ifndef pfn_valid
> > +static inline int pfn_valid(unsigned long pfn)
> > +{
> > +       /* avoid <linux/mm.h> include hell */
> > +       extern unsigned long max_mapnr;
> > +       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > +
> > +       return pfn >= pfn_offset && pfn < max_mapnr;
> > +}
> > +#define pfn_valid pfn_valid
> > +#endif
> > +
> >  #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
> >
> >  /* memmap is virtually contiguous.  */
> > diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
> > index 6fc47561814c..c0be2edeb484 100644
> > --- a/include/asm-generic/page.h
> > +++ b/include/asm-generic/page.h
> > @@ -84,8 +84,6 @@ extern unsigned long memory_end;
> >  #define page_to_phys(page)      ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
> >  #endif
> >
> > -#define pfn_valid(pfn)         ((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
> > -
> >  #define        virt_addr_valid(kaddr)  (((void *)(kaddr) >= (void *)PAGE_OFFSET) && \
> >                                 ((void *)(kaddr) < (void *)memory_end))
> >
> > --
> > 2.35.1
> >
>
>
> --
> Best Regards
>  Guo Ren

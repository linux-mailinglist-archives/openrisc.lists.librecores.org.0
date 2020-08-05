Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E70BE2460E3
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C02A420EBD;
	Mon, 17 Aug 2020 10:46:50 +0200 (CEST)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by mail.librecores.org (Postfix) with ESMTPS id 6CEDC20BD6
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 19:10:16 +0200 (CEST)
Received: by mail-lf1-f68.google.com with SMTP id b30so24654073lfj.12
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=RdzmbMMLETEqNtoVgyRCKj1pU2wD/0M8qEqvRXNRRNY+b914UvXZkxoVgayVQubBPC
 CE/souAwCoROj7cmbTcH2Md3LKEYbq7hyPYtIYReTO92nMUXfSeWszPI988KPS2REOZ/
 x8Lg5axuTOlNvJMwV7URNblxu16MjbinauMnuxvVDwlqKDPHVH06HlMC2htBpXCjb11y
 71kjYcUyosO0NzQGNjoXOZVONMcKv4BHAUmemA/OfyAvVhCb2Eag/fpp10a8cB3ymmQm
 ukYz/pLgzNQdHe5F/wMNFpu3aiLl6i8gq8ye/o/O6zNgd9JR7Oi+/mkdZRJPFt4uOCZ/
 Wj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+69HNPUBLn+0j8xa7ztNqSpAC3bH5kdSFM7se7mw/Y=;
 b=ldSikIBaRCbq4y+VxLU8Ftjf2sQK+6Abp2F+9oDPOWjzwSS246z1Vct4Pk2+DUwYuk
 +EJNhggGwmbe8bPL7Xb2XEx/AJihmD9yq6DTTnXBEftfgrhjVhgo/vz9BPFe2wUYj05j
 7aLDPHEwEctVAmNQp22gJNLPmiPh784LpoOeSvfOLGVgHPY9XpActvjHRLh+EHgpKdTI
 a7L0pqRvteXo1kBNvoLOgGZxgjXS5lWSJFukdvz9oLsGIrJBFapp3PA6eIyBCLu7hr88
 XOI/Fq5tjZOzS7Z5ADW6I9i94zpOh3Lw6+Rphj5AZFvBrHcvpHYRDhTwacht7FSCrHik
 4FcA==
X-Gm-Message-State: AOAM532tijcbd4+sK1JDFMsLWhYhVFibkp1ecdp06cu+1TvWQre41RkS
 EVf7JqWFd0blI5YAFNRNu1rU/N37j6z+DJbGFRg=
X-Google-Smtp-Source: ABdhPJwrfD4lQmBmRhZhj4oSbWRKgm3lTiWKFBcnnoErai4/oJd38wR2GismiRK0iE3hYzt+6N6iDQ3Zkito0n/twrM=
X-Received: by 2002:a05:6512:3b7:: with SMTP id
 v23mr2064439lfp.10.1596647415748; 
 Wed, 05 Aug 2020 10:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:10:04 +0200
Message-ID: <CANiq72kaw7EMePMbgYyKMCkBC+7CgERq4FV2Lp-fH+ea3H12vg@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 17/17] memblock: use separate iterators
 for memory and reserved regions
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-MM <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBdWcgMiwgMjAyMCBhdCA2OjQxIFBNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiAgLmNsYW5nLWZvcm1hdCAgICAgICAgICAgICAgICAgIHwgIDMgKyst
CgpUaGUgLmNsYW5nLWZvcm1hdCBiaXQ6CgpBY2tlZC1ieTogTWlndWVsIE9qZWRhIDxtaWd1ZWwu
b2plZGEuc2FuZG9uaXNAZ21haWwuY29tPgoKQ2hlZXJzLApNaWd1ZWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5F72460E5
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4C38120EBE;
	Mon, 17 Aug 2020 10:46:51 +0200 (CEST)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by mail.librecores.org (Postfix) with ESMTPS id 4F8FE20CA6
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 19:11:42 +0200 (CEST)
Received: by mail-lj1-f196.google.com with SMTP id 185so38328429ljj.7
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=oziJJooKYyQ5sG761r04I5LKIuXOAb4zkqQY0rWC/xo2s+cTYTs9U7RyQWnqJ5pq1v
 Nbi4cMvrIp/CIcHu8pIr+eoqlm0BvwqSZf/j11GWMus1IVdOI8eFA+JP3OpxAqxrqH8K
 4U3LrHkbnbOlDfybyMuly/WmuqEo0ptHsHBq2XUlda4WU2cHiLw7ZD+AnmV8uuOJ/jgu
 3gjhgLG0ATcZI4I3fwTk7ZEPoMTcfQVSsz4xqNOlCB6RK7j7M3zBxlIMpYdsF8DV3rrq
 yNVU9YFhsTtYiIivGSgzfm9XcHZ9fq/Ugzzwuzkf0diKBR/hJ5MKs2YpE9NsOoFGUM2c
 kG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wXACrCF85ppHwQuHqdOjCkc1N78NkRlSijLNjTow210=;
 b=MgqI3e/0gMrZD+KS6N8HpFXtTHaLgBONVlWV4mRx3jpTYcA2V1+awOxcBm4uaxs/9G
 El1cpxj+95Zg0fr3A3h0lkdGRN8Vn3lsth/uYDP+T7idTAF8mR9EHB13ig5Qte3JE4uJ
 0gn4p9lP7NVz2B9ZCSWZiESHBUEhE67aKtEw8w6TUfqDXdLBHjav7P0MsEcN+kzDJPxr
 GmNltcfFAT4a0q6/NfdgG/kurLdC/iu8DzjIbwsNSs5aOXdjZcd8geGeITUtpyMFDtg7
 2ZRp3sjjwMpAU2ta5CMRKEYoWE4mjv9cViFt4VTfap0frNCkeX/bIxCKm/XSkHlhMDpV
 BpVg==
X-Gm-Message-State: AOAM531v3s7TOEmRItkZe0nGoxLrbzDVisOnubCigsQCWfULrvPh/5Vp
 85QK/FJ5zIiW38AZMn7jjN0hn+yZDhSZIPimAFg=
X-Google-Smtp-Source: ABdhPJwaicIhf8YdyAekvXwX7eOOzcHPiY2LvmIo6u440HJ6sOevFi0lA9FP0nbD1iVE8pjbKUmnQK8GBjMj1kpsXT0=
X-Received: by 2002:a2e:b814:: with SMTP id u20mr1829339ljo.202.1596647501750; 
 Wed, 05 Aug 2020 10:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-17-rppt@kernel.org>
In-Reply-To: <20200802163601.8189-17-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2020 19:11:30 +0200
Message-ID: <CANiq72k-hZwbnttADQhi3+NrHkLDVe95jxLAPvLbvSOW41+HaQ@mail.gmail.com>
To: Mike Rapoport <rppt@kernel.org>
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: Re: [OpenRISC] [PATCH v2 16/17] memblock: implement
 for_each_reserved_mem_region() using __next_mem_region()
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

T24gU3VuLCBBdWcgMiwgMjAyMCBhdCA2OjQwIFBNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiAgLmNsYW5nLWZvcm1hdCAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQoKVGhlIC5jbGFuZy1mb3JtYXQgYml0OgoKQWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8bWlndWVs
Lm9qZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4KCkNoZWVycywKTWlndWVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6594C5BF319
	for <lists+openrisc@lfdr.de>; Wed, 21 Sep 2022 03:50:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0D7C124B15;
	Wed, 21 Sep 2022 03:50:38 +0200 (CEST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mail.librecores.org (Postfix) with ESMTPS id CFFB424AD1
 for <openrisc@lists.librecores.org>; Wed, 21 Sep 2022 03:50:35 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id y17so10371681ejo.6
 for <openrisc@lists.librecores.org>; Tue, 20 Sep 2022 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=6BQ+n+4VW6hHwhXqAlkDoSlNz/771IN91baTY6cW3mc=;
 b=Hsxb1h+EMvvkdsefMmznixkb9yPc3ROIaG+LUt0+8GdgrzGiBW3AgAI0RjPjnW1a93
 DY3sKYF7CvzXAe00TGJRDY77eMBmAM0480SdlHfjxG4lyc5EbwrTXa15468ciTechEYT
 WGETfvgoH53XN8KYelN7OAjCyWHBudaSxMJ2L8rTgdvY1WUYvP7Q8KL14RK4KdBht206
 uGl//hA7A5//q7f7eaYrI0DnwnygQF2ZaOGzjx7l19o32olfp0XYIWQPV7GeFwqwofTY
 VpclnNyeiusjibhMe9Hq1ilMiZtIFMoCJZSuw0/xwB2H0iVevrwbGzuhW+Knat88VluT
 5vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=6BQ+n+4VW6hHwhXqAlkDoSlNz/771IN91baTY6cW3mc=;
 b=Od6GlI+BTq4H7WS3iViINaAGkZyFgAi//zpIeJnHAJwm+pCxqV+4sz3PLYjXCuGGS6
 EbcZUFYZ9UPjZigLXHCRrp56t6JtHkS1tw2wHEAQdo8/TrRzsyAMSWANi1Ik5vDATplw
 0Uhu++NcsKIFDAmwS9RMsA3meQoIQ77LdAgDTqqrBuoucA2zgmtlm/fh7z+Yd9JH/LJr
 /T08UrRLZmMaq40eXyWWOoAttOmRNiobhTNNdrHWeQaaJxCOnzDuXNtJF5MZsZhcJWzH
 poPCmA4S3Xmy2LQ8fk+fCxQlbIkZkdG6ocYt4vpzWGLPvTbq3wlZGU4kur1aVwJ/EAQX
 r6MA==
X-Gm-Message-State: ACrzQf3oNPHuBXGjs2VsWsbkFH2s4RugCFYXfQ6VD9+U6tsm8g6oImHd
 uxiG9Nj4oAJsw96pS8OZ1UCbX9PjXG4j/P3XRJ4=
X-Google-Smtp-Source: AMsMyM4BpJG31Gs91JHdJmZGt8F5S3yEOSSf/UDOFiYo+s9qWWQwy3OlMqr27Xca6ZiQ4/GcrUZCaWrZRKbnRXNpOoI=
X-Received: by 2002:a17:907:3e89:b0:779:4869:b799 with SMTP id
 hs9-20020a1709073e8900b007794869b799mr17924838ejc.91.1663725035280; Tue, 20
 Sep 2022 18:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com>
 <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
 <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
In-Reply-To: <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 13:50:24 +1200
Message-ID: <CAGsJ_4xCpSFneh7dPriGeM2_z5njB71cXKGfrarc8Kq0CA37CQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com,
 linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com,
 yangyicong@hisilicon.com, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com,
 corbet@lwn.net, x86@kernel.org, Mel Gorman <mgorman@suse.de>,
 linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com,
 Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org,
 darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com,
 Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Tue, Sep 20, 2022 at 8:45 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 9/20/22 09:09, Barry Song wrote:
> > On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >>
> >> On 8/22/22 13:51, Yicong Yang wrote:
> >>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>> +{
> >>> +     return true;
> >>> +}
> >>
> >> This needs to be conditional on systems, where there will be performance
> >> improvements, and should not just be enabled all the time on all systems.
> >> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
> >> a good metric ?
> >
> > for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> > so we can actually disable tlb-batch on small systems.
>
> Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
> That might not help much as the default value is 256 for NR_CPUS.
>
> OR
>
> arch_tlbbatch_should_defer() checks on
>
> 1. online cpus                  (dont enable batched TLB if <= X)
> 2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)
>
> > just need to check if we will have any race condition since hotplug will
> > make the condition true and false dynamically.
>
> If should_defer_flush() evaluate to be false, then ptep_clear_flush()
> clears and flushes the entry right away. This should not race with other
> queued up TLBI requests, which will be flushed separately. Wondering how
> there can be a race here !

Right. How about we make something as below?

static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
{
    /* for a small system very small number of CPUs, TLB shootdown is cheap */
    if (num_online_cpus() <= 4 ||
unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
          return false;

#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
    if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
         return false;
#endif

    return true;
}

Thanks
Barry

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 748F25385B0
	for <lists+openrisc@lfdr.de>; Mon, 30 May 2022 18:01:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8E86024165;
	Mon, 30 May 2022 18:01:03 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by mail.librecores.org (Postfix) with ESMTP id A3AA523E0C
 for <openrisc@lists.librecores.org>; Mon, 30 May 2022 18:01:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653926460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ZWphZRcK3afyDhn+H8+iYAM34Y/wtF11YrAt0KXpqo=;
 b=OAlzTeE5V8IDemnaydPys11/ZrVI/qBW1DOX6CPplb5qXISrVW1Skgh7NUzAUpdX2Yqw/p
 pHKMJG+8Mdx/ufIWFXE5y5I8riDML3OEKL/xpQCxyErsRfUKjW22PRJZPOar4KJ4zfDQ61
 nAJEfPCcXlXGS1LH0+N1yZAXk2j7fts=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-Epj8nuKwPli79dXEO68Rvg-1; Mon, 30 May 2022 12:00:59 -0400
X-MC-Unique: Epj8nuKwPli79dXEO68Rvg-1
Received: by mail-il1-f200.google.com with SMTP id
 h9-20020a056e021d8900b002d39d3d2367so3678905ila.3
 for <openrisc@lists.librecores.org>; Mon, 30 May 2022 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9ZWphZRcK3afyDhn+H8+iYAM34Y/wtF11YrAt0KXpqo=;
 b=7AJYQymbIuuXD/JC+QtNRolvl0nMMuhThfAFNXJcgchX28FfjTHLwlCVLCx05noz48
 7/ZjVBTgPXJm2OcDN9Q0FNwJgJOb1bvOUw+VrtXHQSv1QshKdhqJUhy/yba+3YfPsrr4
 hwOEBxSHnoWbgNWZ9dza3c7UKQuwKLJbpGKLhdxw96jN3V90/trKKonidPZBTLCC3DBN
 70mfoYofc2/2qFgoQqjjgFyYn0i3z0SsuoBOodNWT8tOPGg4OSEb74nH51uuQlVqynwR
 tlVzMZ5UE7iz+TfRA1uL8YfcXwFQiJsIB4FRl+ooRCSKUx1oQavNIeqsG3lDHpcuKS4H
 p+pg==
X-Gm-Message-State: AOAM532hP7C/QGGkxWPx7bP+OmYN2z4OimtNq23MwG0LbX7CtCou9mUv
 YhwjTQW/pyItxF/mT+bfQHK9M3gaiX+tDyw5xaHNouiaQPeireJXCD9+4516VgE9DW1gdZvKWkh
 k2l0HzadvZLzs4qMYdz8w8ko0Ig==
X-Received: by 2002:a05:6e02:1648:b0:2cd:fe43:39db with SMTP id
 v8-20020a056e02164800b002cdfe4339dbmr30191743ilu.172.1653926458627; 
 Mon, 30 May 2022 09:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0UxFyFLwjW1ZOMQsp2rrmtoQtqcFmY+n0cdYYM503zYLjoFDoHLhs+0Zam5Eh/FIDylo0ew==
X-Received: by 2002:a05:6e02:1648:b0:2cd:fe43:39db with SMTP id
 v8-20020a056e02164800b002cdfe4339dbmr30191721ilu.172.1653926458383; 
 Mon, 30 May 2022 09:00:58 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a926710000000b002cde6e352e5sm3863762ilc.47.2022.05.30.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:00:57 -0700 (PDT)
Date: Mon, 30 May 2022 12:00:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpTqNKMTt8PoA41n@xz-m1.local>
References: <20220527193936.30678-1-peterx@redhat.com>
 <YpPYkzbrQmy4FjrI@osiris>
 <33fd4731-9765-d78b-bdc3-f8243c98e81f@linux.ibm.com>
 <YpToVpjXmdFqGOpY@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YpToVpjXmdFqGOpY@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Chris Zankel <chris@zankel.net>, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Richard Henderson <rth@twiddle.net>, Brian Cain <bcain@quicinc.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Mon, May 30, 2022 at 11:52:54AM -0400, Peter Xu wrote:
> On Mon, May 30, 2022 at 11:35:10AM +0200, Christian Borntraeger wrote:
> > 
> > 
> > Am 29.05.22 um 22:33 schrieb Heiko Carstens:
> > [...]
> > > 
> > > Guess the patch below on top of your patch is what we want.
> > > Just for clarification: if gmap is not NULL then the process is a kvm
> > > process. So, depending on the workload, this optimization makes sense.
> > > 
> > > diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> > > index 4608cc962ecf..e1d40ca341b7 100644
> > > --- a/arch/s390/mm/fault.c
> > > +++ b/arch/s390/mm/fault.c
> > > @@ -436,12 +436,11 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
> > >   	/* The fault is fully completed (including releasing mmap lock) */
> > >   	if (fault & VM_FAULT_COMPLETED) {
> > > -		/*
> > > -		 * Gmap will need the mmap lock again, so retake it.  TODO:
> > > -		 * only conditionally take the lock when CONFIG_PGSTE set.
> > > -		 */
> > > -		mmap_read_lock(mm);
> > > -		goto out_gmap;
> > > +		if (gmap) {
> > > +			mmap_read_lock(mm);
> > > +			goto out_gmap;
> > > +		}
> > > +		goto out;

Hmm, right after I replied I found "goto out" could be problematic, since
all s390 callers of do_exception() will assume it an error condition (side
note: "goto out_gmap" contains one step to clear "fault" to 0).  I'll
replace this with "return 0" instead if it looks good to both of you.

I'll wait for a confirmation before reposting.  Thanks,

-- 
Peter Xu


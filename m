Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7AA51DA9A
	for <lists+openrisc@lfdr.de>; Fri,  6 May 2022 16:34:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2D98B248E4;
	Fri,  6 May 2022 16:34:45 +0200 (CEST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mail.librecores.org (Postfix) with ESMTPS id E5B01240DA
 for <openrisc@lists.librecores.org>; Fri,  6 May 2022 16:34:42 +0200 (CEST)
Received: by mail-pf1-f172.google.com with SMTP id p12so6441657pfn.0
 for <openrisc@lists.librecores.org>; Fri, 06 May 2022 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7u3OwSkyFfQPtUMBSXJ+m0o3AIK+1qwz0/mjtmfCQB0=;
 b=FdeTUfLPDw9k8X6pTEaLv52yUet9VfSQ7bi4HQ1t2xxaDysAJZFgQ7VRrYNlmPjTaj
 2tZL8ukYEo7mNc766P4NQqVT9VU4xcQVvoq18pPjJEP+0zEMAny+6Y6R1wOkE1tgO1wN
 uO8kog1rHC8+u41oS0ocTQzuT0i21hJ3Uz5f+CifLuIMIngaK02mJcE8pu1U5afhbLJI
 DQvD2wdX+c/IHeRxzEhPxhM8zCujiWsHkyNF2bZlVm+qDJtsTHgLYuDntTJYuurXEomy
 6N6H/Q1iuEHCKEfOxPpaFPLiJqifIcesYahJuQ4SUdI1fRp5qzJFzMshG8VThV3XD+0t
 zf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7u3OwSkyFfQPtUMBSXJ+m0o3AIK+1qwz0/mjtmfCQB0=;
 b=qX1aMRVgL19i6iZU4QbmSI0Pjk+zAHjfz9KLTQDBZgbc1sNkZ/3OctJvbZYprUeLEK
 QEvmYTELxaMq4RT9JlnlZR+nxDKh+kTvQQU/+oYrJgrGjJmrEggUknMiTh1hE8Br0Ykd
 6HlVJabJ/uMz9+7ccjpHEEoeT9dj2lxom8VWiH7/NVuKx4WqJy0W38ORDoQ8mDNiMSaW
 ZL6iUzMLuDDxN9Czrk1QWkW761KTU45eFNuMqQLzAJZMknKR08SBUDYyGKvZZzhW63Cf
 xbYXtPrnCU23aLEsIXwZWg0fN7aiFEyJmIQ4aO6jlugnAWwYnE0ZaoUNeSLyNJ1CFK8K
 7AKg==
X-Gm-Message-State: AOAM531BiTdgm/7VSXGHEZcOhIpONwySHiDviDA9OcPsryx/eFJVhrGR
 k96tAzkb/cCJJthLixNe0h8Xog==
X-Google-Smtp-Source: ABdhPJxRyjLgEf03HBpUE/mZuN6gq4KYh/avgT4q6TfXPSIwYir1NJqPKE0fyCteJUZc4c2jSgcLGw==
X-Received: by 2002:a63:d00b:0:b0:3c1:6c87:2135 with SMTP id
 z11-20020a63d00b000000b003c16c872135mr2936313pgf.93.1651847681336; 
 Fri, 06 May 2022 07:34:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170902ee9500b0015e8d4eb241sm1820885pld.139.2022.05.06.07.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:34:41 -0700 (PDT)
Date: Fri, 06 May 2022 07:34:41 -0700 (PDT)
X-Google-Original-Date: Fri, 06 May 2022 07:34:18 PDT (-0700)
Subject: Re: [PATCH v4 0/7] Generic Ticket Spinlocks
In-Reply-To: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-2750a5d4-cb79-4142-a8c6-e7e0c80f8e85@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, boqun.feng@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, mingo@redhat.com, guoren@kernel.org,
 jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 longman@redhat.com, Will Deacon <will@kernel.org>, sudipm.mukherjee@gmail.com,
 openrisc@lists.librecores.org, macro@orcam.me.uk
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

On Thu, 05 May 2022 04:09:46 PDT (-0700), Arnd Bergmann wrote:
> On Sat, Apr 30, 2022 at 5:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> Comments on the v3 looked pretty straight-forward, essentially just that
>> RCsc issue I'd missed from the v2 and some cleanups.  A part of the
>> discussion some additional possible cleanups came up related to the
>> qrwlock headers, but I hadn't looked at those yet and I had already
>> handled everything else.  This went on the back burner, but given that
>> LoongArch appears to want to use it for their new port I think it's best
>> to just run with this and defer the other cleanups until later.
>>
>> I've placed the whole patch set at palmer/tspinlock-v4, and also tagged
>> the asm-generic bits as generic-ticket-spinlocks-v4.  Ideally I'd like
>> to take that, along with the RISC-V patches, into my tree as there's
>> some RISC-V specific testing before things land in linux-next.  This
>> passes all my testing, but I'll hold off until merging things anywhere
>> else to make sure everyone has time to look.  There's no rush on my end
>> for this one, but I don't want to block LoongArch so I'll try to stay a
>> bit more on top of this one.
>
> I took another look as well and everything seems fine. I had expected
> that I would merge it into the asm-generic tree first and did not bother
> sending a separate Reviewed-by tag, but I agree that it's best if you
> create the branch.
>
> Can you add 'Reviewed-by: Arnd Bergmann <arnd@arndb.de>'
> to each patch and send me a pull request for a v5 tag so we can
> merge that into both the riscv and the asm-generic trees?

Yep.  There were some other minor comments, I'll clean those up as well 
and send something soon.

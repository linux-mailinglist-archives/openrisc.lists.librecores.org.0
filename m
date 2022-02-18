Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F121D4BB2F7
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 08:10:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5FFD524837;
	Fri, 18 Feb 2022 08:10:58 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id CC55024785
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 08:10:56 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65442B820CC
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A8CC340FE
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168254;
 bh=U1L1tXaxAPzHw25B4dwwR3MsazfLjv3b5y7cZc7Ajbc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mTaQ1idIXxEiGA4X8PSUpvoVAc7LFr9qA/8kqH3K+5U35rBLfWDJoKxXDfYlUROuE
 vPPFcRJ+RVILr31exZafpiTryhYfp7IBunRUwhoHn1WKRCZPwAgbNkcGThG2RooVaP
 GL3gRGsNNlCMcbD7pY+xBFyK1Q7Tp+pzMcltuMILYUYpdFsSDcXYtjlndWqiuGfw1e
 pwUYopJDHnud5NCSujOH+7F8tkPa9QtdmfsYjmbCYsoFO/kmbeBgPP2kLVfOnfqFdL
 jixtGXBN6hg3xbrliyeIM4R/ixC2I3ehfA2uB4XrRj5DLysBpoCBXBtAUuMAoVDxMD
 UPCz5DQbKNytw==
Received: by mail-ej1-f53.google.com with SMTP id qx21so12774067ejb.13
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:10:54 -0800 (PST)
X-Gm-Message-State: AOAM532HgOg293YzNOkIYQIOmOCxQXM9xiDgVEI4RMmrHcWACpDyrJB9
 nIA5GGPuq1TbjWpn4L4HWvneefxE3ucLJ9JICdY=
X-Google-Smtp-Source: ABdhPJyoMw4CwWZhykLaKIetnvcgd+UId8rsi1OwYV9K65APKYAe4q4e2o9Z+APv3B5OF6xZqiLLay/ZUVAPiuS2n+0=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4956866wri.219.1645168241615; Thu, 17
 Feb 2022 23:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
 <20220218063714.GL22576@lst.de>
In-Reply-To: <20220218063714.GL22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:10:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ac9Wo6fs+Wbdw3-WHfzF9vu_CZs5EUUTX-1iALUr54w@mail.gmail.com>
Message-ID: <CAK8P3a3ac9Wo6fs+Wbdw3-WHfzF9vu_CZs5EUUTX-1iALUr54w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgNzozNyBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBzL21haW5pbmcvcmVtYWluaW5nLyA/Cj4KPiBPciBtYXliZSByYXRo
ZXI6Cj4KPiB1YWNjZXNzOiByZW1vdmUgQ09ORklHX1NFVF9GUwo+Cj4gYmVjYXVzZSBpdCBpcyBh
bGwgZ29uZSBub3cuCj4KPiA+IFdpdGggQ09ORklHX1NFVF9GUyBnb25lLCBzbyBkcm9wIGFsbCBy
ZW1haW5pbmcgcmVmZXJlbmNlcyB0bwo+ID4gc2V0X2ZzKCkvZ2V0X2ZzKCksIG1tX3NlZ21lbnRf
dCBhbmQgdWFjY2Vzc19rZXJuZWwoKS4KPgo+IEFuZCB0aGlzIHNlbnRlbmNlIGRvZXMgbm90IHBh
cnNlLgoKQm90aCBmaXhlZCBub3csIHRoYW5rcyEKCiAgICAgICBBcm5kCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

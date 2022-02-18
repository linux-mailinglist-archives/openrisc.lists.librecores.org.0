Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 56F0C4BB309
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 08:16:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0BFCF24859;
	Fri, 18 Feb 2022 08:16:17 +0100 (CET)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by mail.librecores.org (Postfix) with ESMTPS id 1BBA32483A
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 08:16:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 748C6CE3152
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0E2C340E9
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168570;
 bh=vgWt8lxnjYZUPlvwCFWcIBvafVy+fWmkyAOoKRaWgHQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=brykg3orAWhzT1eShDnIqWiuvTtbNc2QCFkxAh1K7YK/kRc+swoGKo5s8Fy8YLbGr
 hc4KU9yCkTtPzsEFTjEMsUOlO7S4blCchs5ff0ZUeSF1M1MwsdTpKXs8Q722IoumV5
 wWZ/Ud2NirMkJK5Z1ZlptDLHluY0qTABwQmvq83LF0HQ/hLeRKtb2S91h930mt7IMN
 +IVk8tTFexO7cBruFMAUkGnp4XxSmx2qWufMJpXKrZd+rszraON5XmdxGDBB/rBEjq
 qWnAPIR/pKwix5/alY1YcrHjRud91MIX/ezTnOif5FrydE9krKYz++XLye87rDdKA5
 AVW3j7aGhb5Pg==
Received: by mail-lj1-f179.google.com with SMTP id n24so2956903ljj.10
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:16:10 -0800 (PST)
X-Gm-Message-State: AOAM533CzN1WVcRnBkpkoFRt58JX5YtBPoiTezhwEMyB+aTsYuQLVdBA
 3gAKlOQzw2mUS2BcT+Arz6dJmXKKdDRCF2j2pJo=
X-Google-Smtp-Source: ABdhPJyN/H83BSKKeXJGtgECPVgYv1w4NoilhoSCj+92CRqaoOjPXRtnkFYRBhAzB91QtgFwdj4YRtpnThbImHSlPPw=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4972052wri.219.1645168558306; Thu, 17
 Feb 2022 23:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-15-arnd@kernel.org>
 <20220218063549.GJ22576@lst.de>
In-Reply-To: <20220218063549.GJ22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:15:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [OpenRISC] [PATCH v2 14/18] lib/test_lockup: fix kernel pointer
 check for separate address spaces
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

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgNzozNSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAxNiwgMjAyMiBhdCAwMjoxMzoyOFBNICswMTAw
LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPiA+Cj4gPiB0ZXN0X2tlcm5lbF9wdHIoKSB1c2VzIGFjY2Vzc19vaygpIHRvIGZpZ3Vy
ZSBvdXQgaWYgYSBnaXZlbiBhZGRyZXNzCj4gPiBwb2ludHMgdG8gdXNlciBzcGFjZSBpbnN0ZWFk
IG9mIGtlcm5lbCBzcGFjZS4gSG93ZXZlciBvbiBhcmNoaXRlY3R1cmVzCj4gPiB0aGF0IHNldCBD
T05GSUdfQUxURVJOQVRFX1VTRVJfQUREUkVTU19TUEFDRSwgYSBwb2ludGVyIGNhbiBiZSB2YWxp
ZAo+ID4gZm9yIGJvdGgsIGFuZCB0aGUgY2hlY2sgYWx3YXlzIGZhaWxzIGJlY2F1c2UgYWNjZXNz
X29rKCkgcmV0dXJucyB0cnVlLgo+ID4KPiA+IE1ha2UgdGhlIGNoZWNrIGZvciB1c2VyIHNwYWNl
IHBvaW50ZXJzIGNvbmRpdGlvbmFsIG9uIHRoZSB0eXBlIG9mCj4gPiBhZGRyZXNzIHNwYWNlIGxh
eW91dC4KPgo+IFdoYXQgaXMgdGhpcyBjb2RlIGV2ZW4gdHJ5aW5nIHRvIGRvPyAgSXQgbG9va3Mg
ZXh0cmVtbHkgYnJva2VuLgoKQXMgSSB1bmRlcnN0YW5kIGl0LCB0aGlzIGlzIG9ubHkgbWVhbnQg
Zm9yIGRlYnVnZ2luZywgYW5kIHRoZSBtb2R1bGUgY29udGFpbnMKaW50ZW50aW9uYWxseSBicm9r
ZW4gbG9jayB1c2FnZSB0byB0ZXN0IHdoZXRoZXIgdGhlIHdhdGNoZG9nIGFuZCBsb2NrdXAKZGV0
ZWN0aW9uIGluIHRoZSBrZXJuZWwgaXMgYWJsZSB0byBmaW5kIHRoZW0uCgpJIGRpZCBub3QgdHJ5
IHRoYXQgaGFyZCB0byB1bmRlcnN0YW5kIGhvdyBpdCB3b3JrcyB0aG91Z2guCgogICAgICBBcm5k
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

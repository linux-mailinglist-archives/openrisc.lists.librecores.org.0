Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 576AB4BB32C
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 08:24:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1643024870;
	Fri, 18 Feb 2022 08:24:00 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 08BCF24851
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 08:23:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D827F61EF1
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD270C340F4
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169037;
 bh=iX8k9YjATKpR4c62jPbZyUcM9GG/inNR2Rws8vh+5TI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tqTEPi3D8ykMJuM1O5WZXRrY+x9fqigElYE+7U2lP66aiQhXjwqc8np5cgJ3nPhob
 INc5mSHbYoAozc5dz6c6XrssTjPgLHo3DEzE+GZW+ofRygPj1jwo24y8Visn79VwMA
 TYn3bM3oEslfU6UAsDfSTdiWgRHp/xbijA5Nn8EoxI84pjZNNihf5nveTL2Wg3t2Uk
 NCbKF/iOfzWH0fJ2ENk81YbpznN36uJOc4XefmD5VTowvxTO475eweZNksp6ybfoLa
 KPWJ3pTDi4VzPKsHnWQphUSIyN2wHVcVVpwH2x7YU+Z9AstU7CKENvU2MS9xP0zaMn
 bqHyOdm/qy+lw==
Received: by mail-lf1-f53.google.com with SMTP id d23so3632942lfv.13
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:23:57 -0800 (PST)
X-Gm-Message-State: AOAM532k8SDb7HVoMFyRh5pBMy9UjytwxY+g1rF9ynPw8Jk7IyDH14vi
 H/kJG4ZXxQ2gyAEh+mYH9sbFIi474Ebih+2ScPg=
X-Google-Smtp-Source: ABdhPJy+O8dl23fyesXRWHjz7SZRLrJN54UunjRaSC3OSIYzwaAC/i9x7WkjUHComAvPWqTtg86CqT1E/gHbWgqhIZI=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4994775wri.219.1645169025031; Thu, 17
 Feb 2022 23:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <20220218063450.GI22576@lst.de>
In-Reply-To: <20220218063450.GI22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:23:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgNzozNCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiA+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvYWNjZXNzX29rLmg+Cj4K
PiBJbnN0ZWFkIG9mIHRoZSBhc20tZ2VuZXJpYyBnYW1lcywgc2hvdWxkbid0IHdlIGp1c3QgZGVm
aW5lIGFjY2Vzc19vayBpbgo+IDxsaW51eC91YWNjZXNzLmg+IGlmIG5vdCBhbHJlYWR5IGRlZmlu
ZWQgYnkgdGhlIGFyY2hpdGVjdHVyZT8KCkkgdHJpZWQsIGJ1dCBjb3VsZG4ndCBhY3R1YWxseSBt
YWtlIGl0IHdvcmsgYmVjYXVzZSBhc20vdWFjY2Vzcy5oIHRlbmRzCnRvIGNvbnRhaW4gaW5saW5l
IGZ1bmN0aW9ucyB0aGF0IHJlbHkgb24gYWNjZXNzX29rKCkuIEl0IGNvdWxkIHdvcmsgb25jZSB3
ZQptb3ZlIGFsbCB0aGUgaGlnaC1sZXZlbCBmdW5jdGlvbnMgaW50byBsaW51eC91YWNjZXNzLmgs
IGJ1dCB0aGF0IHdvdWxkIGxpa2VseQpyZXF1aXJlIGFub3RoZXIgbG9uZyBwYXRjaCBzZXJpZXMu
CgpPbmUgb3B0aW9uIHRoYXQgY2FuIHdvcmsgaXMgdG8gcmVxdWlyZSBhcmNoaXRlY3R1cmVzIHRv
IGhhdmUgYW4KYXNtL2FjY2Vzc19vay5oIGhlYWRlciB0aGF0IGdldHMgaW5jbHVkZWQgYnkgbGlu
dXgvdWFjY2Vzcy5oLgpPbiBtb3N0IGFyY2hpdGVjdHVyZXMsIHRoYXQgd291bGQgYmUgcmVkaXJl
Y3RlZCB0bwphc20tZ2VuZXJpYy9hY2Nlc3Nfb2suaCwgYXMgb25seSBpYTY0LCB4ODYsIGFybTY0
IGFuZCB1bQpuZWVkIHRvIG92ZXJyaWRlIHRoZSBkZWZpbml0aW9uLgoKICAgICAgQXJuZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

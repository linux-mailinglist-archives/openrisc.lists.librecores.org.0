Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A55A44B8878
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:07:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5351024806;
	Wed, 16 Feb 2022 14:07:06 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id A9BA324042
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:07:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B500BB81EDC
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 13:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C1AC34101
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645016803;
 bh=XpyXyO6XeLPMFwMT57AZNzNQgXnMBZ2Ni2r+dAXZ1s0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m86IV6YQZzHRJuDux3taFbaRjn+w9RuI6vh4wtLv8qscNybLMG9S7+2rm1PNzrb20
 Dd5S6VsCYA0xUl1vOFFn3tNcP5kMF/3okjlp1F0h2o1Xvta1epkmZYCJUZnDs3yLoA
 VzYx4F/n1Ow3YwU1D9VL3p/ZapRwreq4wU2F2zdBEZVDPHlhJZ5UCirUITvqXKP03u
 mjPPXaT5ZCAExBhxPZs+6x/NgZOCXftC+3jOhCw6lYUHk202K2WWgJTp7zViNeOTI3
 d6qcX+NrilxdmbmnVfKB2lTecLHUYHmjxyqYH1gVkIK8Gk+2LbSYNZnzPmnsXhuwAQ
 I1fP9Rg2mGbLg==
Received: by mail-wm1-f52.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso2739857wmi.0
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 05:06:43 -0800 (PST)
X-Gm-Message-State: AOAM532I4F8/4BMNZb4WbFWTW3YqXoT/iqpoEDLroKH1BJ67VbKRt/qE
 HDeqDzWxmM2CJwT3pnVtXOthc7Og/hZVg/p0rZU=
X-Google-Smtp-Source: ABdhPJz2fGQt4XBj3ZPZmmV0DF3C11Wmt7pFZ5Wv5cMpV0NQk32vVK4/Sp5p4cooe9t3m3i9Hn5C5g4DuBewCt15hb0=
X-Received: by 2002:a1c:21c5:0:b0:37d:40d0:94c7 with SMTP id
 h188-20020a1c21c5000000b0037d40d094c7mr1551416wmh.1.1645016801710; Wed, 16
 Feb 2022 05:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-12-arnd@kernel.org>
 <YgqMLYJs0RMecMck@infradead.org>
In-Reply-To: <YgqMLYJs0RMecMck@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 14:06:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0PwjB+KE+j3_sknZuiuY-kUe_J76nYac-mx82dccA3Rw@mail.gmail.com>
Message-ID: <CAK8P3a0PwjB+KE+j3_sknZuiuY-kUe_J76nYac-mx82dccA3Rw@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [OpenRISC] [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
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
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgNjowNiBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gPiAgdm9pZCBwcm9tX3dvcmxkKGludCBlbnRlcikKPiA+
ICB7Cj4gPiAtICAgICBpZiAoIWVudGVyKQo+ID4gLSAgICAgICAgICAgICBzZXRfZnMoZ2V0X2Zz
KCkpOwo+ID4gLQo+ID4gICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oImZsdXNodyIpOwo+ID4g
IH0KPgo+IFRoZSBlbnRlciBhcmd1bWVudCBpcyBub3cgdW51c2VkLgoKUmlnaHQsIGdvb2QgcG9p
bnQuIEknbGwgYWRkIGEgY29tbWVudCwgYnV0IEkgdGhpbmsgSSB3aWxsIGxlYXZlIHRoYXQKYXMg
dGhpcyBzZWVtcwp0b28gaGFyZCB0byBjaGFuZ2UgdGhlIGNhbGxlcnMgaW4gYXNzZW1ibHkgY29k
ZSBmb3IgdGhpcy4gSWYgYW55CnNwYXJjNjQgZGV2ZWxvcGVyCndhbnRzIHRvIGNsZWFuIHRoYXQg
dXAsIEknbSBoYXBweSB0byBpbnRlZ3JhdGUgdGhlIGNsZWFudXAgcGF0Y2ggaW4gbXkgc2VyaWVz
LgoKICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

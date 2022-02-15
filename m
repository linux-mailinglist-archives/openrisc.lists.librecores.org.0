Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8944B676F
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 10:21:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2ADC224822;
	Tue, 15 Feb 2022 10:21:45 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 380F32481A
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:21:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D30F60B53
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD0AC340F7
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916902;
 bh=RZSvrBa9M+3bZFIsmIZDqZd7d5VDsf+KxZINLGmOa8g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ByWt4vOJfqjqQ0OH4IvfI8jS3cNXCG5QhUo8gSIwjjhgCCS+EG0eKJ0OH6/0slZvx
 5U+ORhV/qmEP9oYVsVNpQ4z0lgql1TDOtqZVyNJTB8uBbTHj7+Hg7hvcX9C+Qv1bCI
 xQNAX/BA+J/E8f8ciCAWG7YKJjWggpCRtRf088QmmnoHbINY0ozxdVN63LXsFj9bVW
 ZhFM4Qb1eAEg1T5cs+QDuQULOCDF4wZ0xb4KGHrAr2D6FIM67m8SLg/YuPl9OWXIEm
 yh46w91bs+bStHygYZV+PqbRzBrItLIY2RTjtzTLLCehlXePQ+tqzQBbMEGgsxRqGP
 oZHRnDmRrRB6Q==
Received: by mail-ed1-f45.google.com with SMTP id f17so31086553edd.2
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:21:41 -0800 (PST)
X-Gm-Message-State: AOAM533QI04oEvnTMtOAeQjX9hgyLZpzx1qrZtWehrPpGX1fTpIKUwFF
 ZJyA8vKCtdausycPvqDhdKqW6fcjHMCxl7L3ALM=
X-Google-Smtp-Source: ABdhPJxTZ3T3Abm/GIU6+FEpYkuoBAl5nS/ZOniPodztANRfoa0z/A0V8x7uBN46c9isaaDTdlBbvvwdEiVYUyGe5DM=
X-Received: by 2002:adf:da4c:: with SMTP id r12mr2454185wrl.550.1644916889390; 
 Tue, 15 Feb 2022 01:21:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
In-Reply-To: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Feb 2022 10:21:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
Message-ID: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCAxNSBGZWIgMjAyMiBhdCAxMDoxMywgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgRmViIDE1LCAyMDIyIGF0IDk6MTcgQU0gQXJkIEJpZXNo
ZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBPbiBNb24sIDE0IEZlYiAyMDIyIGF0
IDE3OjM3LCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBGcm9t
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4gPgo+ID4KPiA+IFdpdGggc2V0X2Zz
KCkgb3V0IG9mIHRoZSBwaWN0dXJlLCB3b3VsZG4ndCBpdCBiZSBzdWZmaWNpZW50IHRvIGNoZWNr
Cj4gPiB0aGF0IGJpdCAjNTUgaXMgY2xlYXI/ICh0aGUgYml0IHRoYXQgc2VsZWN0cyBiZXR3ZWVu
IFRUQlIwIGFuZCBUVEJSMSkKPiA+IFRoYXQgd291bGQgYWxzbyByZW1vdmUgdGhlIG5lZWQgdG8g
c3RyaXAgdGhlIHRhZyBmcm9tIHRoZSBhZGRyZXNzLgo+ID4KPiA+IFNvbWV0aGluZyBsaWtlCj4g
Pgo+ID4gICAgIGFzbSBnb3RvKCJ0Ym56ICAlMCwgIzU1LCAlMiAgICAgXG4iCj4gPiAgICAgICAg
ICAgICAgInRibnogICUxLCAjNTUsICUyICAgICBcbiIKPiA+ICAgICAgICAgICAgICA6OiAiciIo
YWRkciksICJyIihhZGRyICsgc2l6ZSAtIDEpIDo6IG5vdG9rKTsKPiA+ICAgICByZXR1cm4gMTsK
PiA+IG5vdG9rOgo+ID4gICAgIHJldHVybiAwOwo+ID4KPiA+IHdpdGggYW4gYWRkaXRpb25hbCBz
YW5pdHkgY2hlY2sgb24gdGhlIHNpemUgd2hpY2ggdGhlIGNvbXBpbGVyIGNvdWxkCj4gPiBlbGlt
aW5hdGUgZm9yIGNvbXBpbGUtdGltZSBjb25zdGFudCB2YWx1ZXMuCj4KPiBUaGF0IHNob3VsZCB3
b3JrLCBidXQgSSBkb24ndCBzZWUgaXQgYXMgYSBjbGVhciBlbm91Z2ggYWR2YW50YWdlIHRvCj4g
aGF2ZSBhIGN1c3RvbSBpbXBsZW1lbnRhdGlvbi4gRm9yIHRoZSBjb25zdGFudC1zaXplIGNhc2Us
IGl0IHByb2JhYmx5Cj4gaXNuJ3QgYmV0dGVyIHRoYW4gYSBjb21waWxlci1zY2hlZHVsZWQgY29t
cGFyaXNvbiBhZ2FpbnN0IGEKPiBjb25zdGFudCBsaW1pdCwgYnV0IGl0IGRvZXMgaHVydCBtYWlu
dGFpbmFiaWxpdHkgd2hlbiB0aGUgbmV4dCBwZXJzb24KPiB3YW50cyB0byBjaGFuZ2UgdGhlIGJl
aGF2aW9yIG9mIGFjY2Vzc19vaygpIGdsb2JhbGx5Lgo+Cgphcm02NCBhbHNvIGhhcyB0aGlzIGxl
YWRpbmcgdXAgdG8gdGhlIHJhbmdlIGNoZWNrLCBhbmQgSSB0aGluayB3ZSdkIG5vCmxvbmdlciBu
ZWVkIGl0OgoKICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUk02NF9UQUdHRURfQUREUl9BQkkp
ICYmCiAgICAgICAgKGN1cnJlbnQtPmZsYWdzICYgUEZfS1RIUkVBRCB8fCB0ZXN0X3RocmVhZF9m
bGFnKFRJRl9UQUdHRURfQUREUikpKQogICAgICAgICAgICBhZGRyID0gdW50YWdnZWRfYWRkcihh
ZGRyKTsKCj4gSWYgd2Ugd2FudCB0byBnZXQgaW50byBtaWNyby1vcHRpbWl6aW5nIHVhY2Nlc3Ms
IEkgdGhpbmsgYSBiZXR0ZXIgdGFyZ2V0Cj4gd291bGQgYmUgYSBDT05GSUdfQ0NfSEFTX0FTTV9H
T1RPX09VVFBVVCB2ZXJzaW9uCj4gb2YgX19nZXRfdXNlcigpL19fcHV0X3VzZXIgYXMgd2UgaGF2
ZSBvbiB4ODYgYW5kIHBvd2VycGMuCj4KPiAgICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==

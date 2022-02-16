Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83A6F4B9379
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 23:01:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3684E24845;
	Wed, 16 Feb 2022 23:01:49 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id AA2C02483D
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 23:01:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78A9061B44
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 22:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DFDC340ED
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 22:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645048904;
 bh=3GAgFKFSz4rrd4LtvDFKA/i0kbB+vNidxSnLES7CC90=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cqP4swvBSmEmDzilwiAl6hoaKg+rYJVULzcStt6ho4zk1m5ypcExNPVLQZgKy8sx8
 R95M9l3Bjf0n6qwkM2R2kbFNjXShLM9o6q74b6gcclX4vX9wZchI/bUwCZeWYrCTSY
 gsvEv/BA+uLXbpZD65b9rkIEwfFd/eZctL7fHkU/euGbob7Ar/pXDUC3v7xjDMgGwp
 YEgysit9Yo3IdSh1MHlmzjnxgpnmc5WeIMir/51AHJDH6J1zR1tdpEN4fjuXYfhGI7
 eo7HxAH95JU9to+vLgzK1WVTuLSUb/RJdq0M67nN7rgrrV6xt/h4H+7UQ7KLfthF4v
 8wivpc2dGDTlA==
Received: by mail-wm1-f43.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so4743677wme.1
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:01:44 -0800 (PST)
X-Gm-Message-State: AOAM530SFwfH8LsB7I4sGEveHyZp8L7WK0dIcv1fcB6rpYqCnxp3t6Sg
 tgZA4hGzM9SoQC7NqUVH3/NqBZ/FOtpAz5z52Z0=
X-Google-Smtp-Source: ABdhPJyTINkf1ZMgp+ijDiSYfGY6PCVSFYe6JpwLrHI4jPiDeP7SC/Zo0zGySiauKL0SyOBYxrfLHIczbDoJsvG/Low=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr3428429wms.82.1645048892813; Wed, 16
 Feb 2022 14:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-16-arnd@kernel.org>
 <Yg1D08+olCSGmnYU@ravnborg.org> <Yg1FRZcrhlh5C//V@ravnborg.org>
In-Reply-To: <Yg1FRZcrhlh5C//V@ravnborg.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 23:01:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1kV=0G9WYkdjYCiBu=fuT1fbPGHVD9cgHX3ht6J3MFEw@mail.gmail.com>
Message-ID: <CAK8P3a1kV=0G9WYkdjYCiBu=fuT1fbPGHVD9cgHX3ht6J3MFEw@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [OpenRISC] [PATCH v2 15/18] sparc64: remove CONFIG_SET_FS
 support
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
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
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

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgNzo0MSBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDA3OjM0OjU5UE0gKzAxMDAs
IFNhbSBSYXZuYm9yZyB3cm90ZToKCj4gPgo+ID4gSSB0aGluayB5b3Ugc29tZWhvdyBtaXNzZWQg
dGhlIEtjb25maWcgY2hhbmdlLCBhbmQgYWxzbyB0aGUgcmVsYXRlZAo+ID4gc3BhcmMzMiBjaGFu
Z2Ugd2hpY2ggY29udGludWUgdG8gaGF2ZSBzZXRfZnMoKSBhZnRlciB0aGlzIHBhdGNoLgoKUmln
aHQsIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoZSBpc3N1ZS4KCj4gSSBub3cgbm90aWNlIHRo
ZSBzcGFyYzMyIGJpdHMgYXJlIGluIHRoZSBsYXN0IHBhdGNoLgo+IFRvIGF2b2lkIGJyZWFraW5n
IGJpc2VjdC1hYmlsaXR5IG9uIHNwYXJjNjQgSSB0aGluayB5b3UgbmVlZCB0byBtZXJnZQo+IHRo
ZSBzcGFyYzMyIGNoYW5nZXMgd2l0aCB0aGlzIHBhdGNoLCB1bmxlc3MgdGhlIHNwYXJjNjQgY2hh
bmdlcyBjYW4KPiBjb2V4aXN0IHdpdGggQ09ORklHX1NFVF9GUyBjb250aW51ZSB0byBiZSBzZXQu
CgpJIG9yaWdpbmFsbHkgaGFkIHRoZW0gaW4gdGhlIHJldmVyc2Ugb3JkZXIgYW5kIGJyb2tlIGJp
c2VjdGFiaWxpdHkgZHVyaW5nIG15CnJlYmFzZS4gVGhlIGVuZCByZXN1bHQgaXMgc3RpbGwgZmlu
ZSwgYnV0IG5vdyBJIG5lZWQgdG8gbW92ZSB0aGUgJ3NlbGVjdApTRVRfRlMnIGZyb20gQ09ORklH
X1NQQVJDIHRvIENPTkZJR19TUEFSQzMyIGluIHRoaXMgcGF0Y2gKYW5kIHRoZW4gcmVtb3ZlIGl0
IGFnYWluIGZyb20gdGhlcmUgaW4gdGhlIGxhc3Qgc3RlcC4KCkkndmUgZG9uZSB0aGF0IGluIG15
IGxvY2FsIGNvcHkgbm93LgoKICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

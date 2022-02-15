Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2684B671F
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 10:13:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E31BA2481A;
	Tue, 15 Feb 2022 10:13:11 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 4103A2431F
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:13:10 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86517B8179D
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEE9C340F6
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916389;
 bh=nPLs5v71E/xzzKRq/jdD2UxtX1DBSgxHKB2i8EHy1KY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U6YsoLoH1TYXtKAzTFVODW3HlPZbncJCmF0maifv+rSqsYAhEblb/H3gJd8OFylof
 Mp5vMutYX05oW3vcUKj33XeEjCpIGJua47KopqfYoPnDpc40kuLtyxyQ/VcBPApWuF
 oKRGPo8rcfYzgcCA8ioj+XAXezxCoDAxDs1Kmhcz2nqCm8C12vvpFkBBld2+QQ4aZ+
 /LwB/zneNNo8YYiJoTh0Xe2vLlcKgcIpLYo10wrXS5H4wKOjIdEFZq0hPhIBTor/y3
 6oEytRPEAhGf+zCIZA/Ku66E74KNciZ7RQWSMDHqQHnVE+NgXVSHoXgujP5ukjiHwP
 iAmn8YR2Y2/Dw==
Received: by mail-lf1-f54.google.com with SMTP id p22so2033600lfu.5
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:13:09 -0800 (PST)
X-Gm-Message-State: AOAM533lTodKoZWem98bmYT9htP+SMFCn8YE6JwsGmll4ZOzKEpLPl10
 T5tpCwdrG0GfHZIykQmOcDlOA+R6C+Iu9R/LQck=
X-Google-Smtp-Source: ABdhPJwP302M1cXBE3IXsZS/v83gWi9XJR2q13sQJhY9b6tnSpJCd4099durtVh9QEm0yhQ4WeUq4MKNAAS9P/JPfzc=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr2380558wrp.219.1644916376776; 
 Tue, 15 Feb 2022 01:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:12:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
Message-ID: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgOToxNyBBTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJu
ZWwub3JnPiB3cm90ZToKPiBPbiBNb24sIDE0IEZlYiAyMDIyIGF0IDE3OjM3LCBBcm5kIEJlcmdt
YW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KPiA+Cj4KPiBXaXRoIHNldF9mcygpIG91dCBvZiB0aGUgcGljdHVyZSwgd291
bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBjaGVjawo+IHRoYXQgYml0ICM1NSBpcyBjbGVhcj8g
KHRoZSBiaXQgdGhhdCBzZWxlY3RzIGJldHdlZW4gVFRCUjAgYW5kIFRUQlIxKQo+IFRoYXQgd291
bGQgYWxzbyByZW1vdmUgdGhlIG5lZWQgdG8gc3RyaXAgdGhlIHRhZyBmcm9tIHRoZSBhZGRyZXNz
Lgo+Cj4gU29tZXRoaW5nIGxpa2UKPgo+ICAgICBhc20gZ290bygidGJueiAgJTAsICM1NSwgJTIg
ICAgIFxuIgo+ICAgICAgICAgICAgICAidGJueiAgJTEsICM1NSwgJTIgICAgIFxuIgo+ICAgICAg
ICAgICAgICA6OiAiciIoYWRkciksICJyIihhZGRyICsgc2l6ZSAtIDEpIDo6IG5vdG9rKTsKPiAg
ICAgcmV0dXJuIDE7Cj4gbm90b2s6Cj4gICAgIHJldHVybiAwOwo+Cj4gd2l0aCBhbiBhZGRpdGlv
bmFsIHNhbml0eSBjaGVjayBvbiB0aGUgc2l6ZSB3aGljaCB0aGUgY29tcGlsZXIgY291bGQKPiBl
bGltaW5hdGUgZm9yIGNvbXBpbGUtdGltZSBjb25zdGFudCB2YWx1ZXMuCgpUaGF0IHNob3VsZCB3
b3JrLCBidXQgSSBkb24ndCBzZWUgaXQgYXMgYSBjbGVhciBlbm91Z2ggYWR2YW50YWdlIHRvCmhh
dmUgYSBjdXN0b20gaW1wbGVtZW50YXRpb24uIEZvciB0aGUgY29uc3RhbnQtc2l6ZSBjYXNlLCBp
dCBwcm9iYWJseQppc24ndCBiZXR0ZXIgdGhhbiBhIGNvbXBpbGVyLXNjaGVkdWxlZCBjb21wYXJp
c29uIGFnYWluc3QgYQpjb25zdGFudCBsaW1pdCwgYnV0IGl0IGRvZXMgaHVydCBtYWludGFpbmFi
aWxpdHkgd2hlbiB0aGUgbmV4dCBwZXJzb24Kd2FudHMgdG8gY2hhbmdlIHRoZSBiZWhhdmlvciBv
ZiBhY2Nlc3Nfb2soKSBnbG9iYWxseS4KCklmIHdlIHdhbnQgdG8gZ2V0IGludG8gbWljcm8tb3B0
aW1pemluZyB1YWNjZXNzLCBJIHRoaW5rIGEgYmV0dGVyIHRhcmdldAp3b3VsZCBiZSBhIENPTkZJ
R19DQ19IQVNfQVNNX0dPVE9fT1VUUFVUIHZlcnNpb24Kb2YgX19nZXRfdXNlcigpL19fcHV0X3Vz
ZXIgYXMgd2UgaGF2ZSBvbiB4ODYgYW5kIHBvd2VycGMuCgogICAgICAgICBBcm5kCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

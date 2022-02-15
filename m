Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 320C24B67D4
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 10:40:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CD9C224826;
	Tue, 15 Feb 2022 10:40:16 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 90E3524821
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:40:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 156C8B81860
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A18C340EB
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644918014;
 bh=hv8AUuEMkapI1zY2x6Wj+fHd7ew8TaKYgsOBPTPrxmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VHH7CU79U316XDMWHeHJ8++Eh1MMKITXbQSzlZ0DrA6kWekzDktkCy5KhY7hZLGK7
 gfiQHmPbEC7L4AF+NDTP3++2HyxQqgay+CXVkTp1m9wIZSWiRsxhjEsRH76HB3HAb3
 /5H0IwFoMYLMdcVT0XuD8P6Vw9GPBTkN9xgNY7hhrRN337S5eN73tDcRKRPLMOcNTg
 NXwi07ICMcsXTT77IYOqmuFqUW8m3AaA+2IJmg2fkpra1D1NcZ3zVXZBTrXdEvv5Oq
 0XRwvrersUnw/PUKjeaOsXZQOemvEGElTmz0nKHB8fy3fN/J5cS0vZm5lHkoOpeHoi
 hdacTJ8dWWJzg==
Received: by mail-wm1-f41.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso1009781wmi.0
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:40:14 -0800 (PST)
X-Gm-Message-State: AOAM533lEuXHICA35D/KasGVCHL6GxP6tvVSRRghX3wgxBT5rfIeKB9v
 ZMxfkDxkgQJ33nwaDHFw3CSBgL7/d8Lxl1BmdB8=
X-Google-Smtp-Source: ABdhPJxpFSyo2tIfVZXx6xnWqAN7kXzL0SfiKGeaqLH7fIF3GRmujo8Iug1QC1Z1ypgNgRnGoRSGx0exr14yXtWS6QY=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr2314325wms.82.1644918002508; Tue, 15
 Feb 2022 01:40:02 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:39:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
Message-ID: <CAK8P3a0NTqK_m7q909d8FN6is8k4_u3zeckC9XOrjEi7kqSvmg@mail.gmail.com>
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MjEgQU0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCAxNSBGZWIgMjAyMiBhdCAxMDoxMywgQXJuZCBCZXJn
bWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IGFybTY0IGFsc28gaGFzIHRoaXMgbGVh
ZGluZyB1cCB0byB0aGUgcmFuZ2UgY2hlY2ssIGFuZCBJIHRoaW5rIHdlJ2Qgbm8KPiBsb25nZXIg
bmVlZCBpdDoKPgo+ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQVJNNjRfVEFHR0VEX0FERFJf
QUJJKSAmJgo+ICAgICAgICAgKGN1cnJlbnQtPmZsYWdzICYgUEZfS1RIUkVBRCB8fCB0ZXN0X3Ro
cmVhZF9mbGFnKFRJRl9UQUdHRURfQUREUikpKQo+ICAgICAgICAgICAgIGFkZHIgPSB1bnRhZ2dl
ZF9hZGRyKGFkZHIpOwoKSSBzdXNwZWN0IHRoZSBleHBlbnNpdmUgcGFydCBoZXJlIGlzIGNoZWNr
aW5nIHRoZSB0d28gZmxhZ3MsIGFzIHVudGFnZ2VkX2FkZHIoKQpzZWVtcyB0byBhbHdheXMganVz
dCBhZGQgYSBzYmZ4IGluc3RydWN0aW9uLiBXb3VsZCB0aGlzIHdvcms/CgojaWZkZWYgQ09ORklH
X0FSTTY0X1RBR0dFRF9BRERSX0FCSQojZGVmaW5lIGFjY2Vzc19vayhwdHIsIHNpemUpIF9fYWNj
ZXNzX29rKHVudGFnZ2VkX2FkZHIocHRyKSwgKHNpemUpKQojZWxzZSAvLyB0aGUgZWxzZSBwYXRo
IGlzIHRoZSBkZWZhdWx0LCB0aGlzIGNhbiBiZSBsZWZ0IG91dC4KI2RlZmluZSBhY2Nlc3Nfb2so
cHRyLCBzaXplKSBfX2FjY2Vzc19vaygocHRyKSwgKHNpemUpKQojZW5kaWYKCiAgICAgICBBcm5k
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

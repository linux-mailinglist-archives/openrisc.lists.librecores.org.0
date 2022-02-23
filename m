Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB3A84C0F33
	for <lists+openrisc@lfdr.de>; Wed, 23 Feb 2022 10:27:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3A1C1247D7;
	Wed, 23 Feb 2022 10:27:20 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id CA29C20A95
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 10:27:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1870BB81EAB
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 09:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAB7C340E7
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645608437;
 bh=D2jUPs6ryRSFqPbSylqUkNdDZuOthbzsmeMEmvziyjY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qqmQ8wyO3KiiRoY+dyct/TIYMNusVUOO5uBkZTYhtUECfjZmkRmaumdg0efpJyqu+
 1NUJbC9Z3gU9iKZ76MO3UpT4/QBmKBCF88pqLt144UXdY+HMEMC0NKwBLt8ddIYdhA
 4cfTyACUBNndKvI7l6kYGtTfeLVnOQvi9cvhrJ7Y5seMk3xdn+vhInqbypWk75PDVV
 ukutm41uLJwz1+2AWQrMOJbx4wCwKg3g5Buv7RBtSh5+DWH6WYdCZ0cfRiqBTSFz57
 YjiY60e2PdpP+9klK1djKE86K0i7Gd0U+HA/0LucKwfDZ0JvqvKDMnqMv8zSd6wwoq
 DHan5qZHkfXig==
Received: by mail-wm1-f52.google.com with SMTP id y5so2897231wmi.0
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 01:27:17 -0800 (PST)
X-Gm-Message-State: AOAM531MfL4XZlJlWo/2C9F8Ljle+shcBHF3lODLlIBWxQjhLf1T1GIE
 RjsLHLfAlfSxQXcMIWzdpf9xtqesqg74jX1aNCM=
X-Google-Smtp-Source: ABdhPJwtMkGkHNVPhtWq1LOTi2OcT9JVNmxiOoaUyabWMpAtHbaXvG0B+oJZMTvLmHy/MuDTQEaSkGsJ6B3oEOPptXw=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr6779098wms.82.1645608425823; Wed, 23
 Feb 2022 01:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220223074127.GA8287@alpha.franken.de>
In-Reply-To: <20220223074127.GA8287@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 23 Feb 2022 10:26:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [OpenRISC] [PATCH v2 09/18] mips: use simpler access_ok()
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
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
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

T24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgODo0MSBBTSBUaG9tYXMgQm9nZW5kb2VyZmVyCjx0c2Jv
Z2VuZEBhbHBoYS5mcmFua2VuLmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDE2LCAyMDIyIGF0
IDAyOjEzOjIzUE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS91
YWNjZXNzLmgKPiA+IGluZGV4IGRiOWE4ZTAwMmI2Mi4uZDdjODlkYzM0MjZjIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gKysrIGIvYXJjaC9taXBz
L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ID4gQEAgLTE5LDYgKzE5LDcgQEAKPiA+ICAjaWZkZWYg
Q09ORklHXzMyQklUCj4gPgo+ID4gICNkZWZpbmUgX19VQV9MSU1JVCAweDgwMDAwMDAwVUwKPiA+
ICsjZGVmaW5lIFRBU0tfU0laRV9NQVggICAgICAgIF9fVUFfTElNSVQKPgo+IHVzaW5nIEtTRUcw
IGluc3RlYWQgd291bGQgSU1ITyBiZSB0aGUgYmV0dGVyIGNob2ljZS4gVGhpcyBnaXZlcyB0aGUK
PiBjaGFuY2UgdG8gcmVtb3ZlIF9fVUFfTElNSVQgY29tcGxldGx5IGFmdGVyIGNsZWFuaW5nIHVw
IHB0cmFjZS5jCgpPaywgY2hhbmdlZCBub3cuCgogICAgICBBcm5kCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==

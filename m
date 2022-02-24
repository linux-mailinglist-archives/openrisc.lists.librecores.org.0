Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B8E0A4C2455
	for <lists+openrisc@lfdr.de>; Thu, 24 Feb 2022 08:06:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 24D3324250;
	Thu, 24 Feb 2022 08:06:20 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 59A992127B
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 08:06:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2469961972
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 07:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E845C340E9
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645686376;
 bh=d3iTCnmjiWI2WfX8T3i0lRHp9N81t6Yh8Z7V7FwGN/U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qRHA5NqUEplN9pIxZqIsW0kBn4+MBilYUh4ACzsMgXUXNRVhSeH8k99rVs+VguAdz
 S6nw5jZeA2U0sfghJtI+av1c041361/u33OVFn034lG4nfre1v86nWYuQmM7joS4ks
 Agm8jI646/XZqBZpm2KUVxpK4cH1m93Yam+wbo2huzzTMAz3INUDtPU8ZxedY0sjkR
 Q0blhmmZF3gCmqsSyWTbjENBVylQ/UtE3IYK+1xeZimaMKGdlOrqKnMJ1W0pixwOSS
 2onkioItET0unfSCYSyvkdtjTxUNN6BpQw2svjAg1a0ZTXaFUQp1iqBJgsEQrsP26v
 H7DkLDPiyrc0w==
Received: by mail-ej1-f50.google.com with SMTP id p15so2332162ejc.7
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 23:06:16 -0800 (PST)
X-Gm-Message-State: AOAM5334Byoj2u73FQo+MlJ5lNaIqtynvPmKt9JTc+irNIj2UBMXl/hr
 Exx7ZT5GUvv4+t/sj4+0VuOZ5SLjZ3oKKQerlFU=
X-Google-Smtp-Source: ABdhPJyN7vOmEPkorPTffJc1X7o++TFchfjh5Aum2nyP+tyYB62T97KqiFOhsVfqhaexAyBFN29agtP9qBPfezDsID0=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1075883wra.407.1645686364180; Wed, 23
 Feb 2022 23:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-8-arnd@kernel.org>
 <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
In-Reply-To: <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Feb 2022 08:05:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 07/18] nios2: drop access_ok() check from
 __put_user()
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
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjQsIDIwMjIgYXQgMTI6MzAgQU0gRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIDIvMTYvMjIgMDc6MTMsIEFybmQgQmVyZ21hbm4gd3JvdGU6
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gVW5saWtlIG90aGVy
IGFyY2hpdGVjdHVyZXMsIHRoZSBuaW9zMiB2ZXJzaW9uIG9mIF9fcHV0X3VzZXIoKSBoYXMgYW4K
PiA+IGV4dHJhIGNoZWNrIGZvciBhY2Nlc3Nfb2soKSwgcHJldmVudGluZyBpdCBmcm9tIGJlaW5n
IHVzZWQgdG8gaW1wbGVtZW50Cj4gPiBfX3B1dF9rZXJuZWxfbm9mYXVsdCgpLgo+ID4KPiA+IFNw
bGl0IHVwIHB1dF91c2VyKCkgYWxvbmcgdGhlIHNhbWUgbGluZXMgYXMgX19nZXRfdXNlcigpL2dl
dF91c2VyKCkKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Cj4gQWNrZWQtYnk6IERpbmggTmd1eWVuIDxkaW5ndXllbkBrZXJuZWwub3JnPgoKVGhh
bmtzISBDb3VsZCB5b3UgYWxzbyBoYXZlIGEgbG9vayBhdCBwYXRjaCAyICh1YWNjZXNzOiBmaXgg
bmlvczIgYW5kCm1pY3JvYmxhemUgZ2V0X3VzZXJfOCk/IFRoYXQgb25lIGlzIGFjdHVhbGx5IG1v
cmUgY3JpdGljYWwsIGFuZCBzaG91bGQKYmUgYmFja3BvcnRlZCB0byBzdGFibGUga2VybmVscy4K
CiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

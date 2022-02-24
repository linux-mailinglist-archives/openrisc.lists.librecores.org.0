Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6434C265D
	for <lists+openrisc@lfdr.de>; Thu, 24 Feb 2022 09:42:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D12472480F;
	Thu, 24 Feb 2022 09:42:00 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 7E1332419E
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 09:41:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6524261A22
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 08:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD97EC340E9
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692117;
 bh=3OZhY8JjlWpvQtjxNVEtkpMscELhOM136ShyKCOjsEU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WCrlgzEskrMg705+E53zyoLTgyGprZinWCLgH+YvW3/ISb9PE3VXE54pMfp460HAr
 lADIYJ+ATkIVR/Hv3rGkZPvcZqJX4KqZQHRbZykvJkt4Rp+HqhP3l8xRFXb5eEu26D
 tHW0xS10C1E5ztM+9dE98NI6Z+gh2QEMUXwXvQBcQxsjASnq9SCvExZS9UBAdYV0su
 CUTj8BeohJ6g9PTjFB0K3v+SykUbVHep9vfY9YS5tv0xXNMBbR3NxVLBD76ZO09tT8
 hDI/VeWHJIdZtXWIdRgIsANIH54OctHaeT3Wpw0127yoHhtIB8Aqsw+55S8yv0uXbh
 Ng/AINlfx1zvw==
Received: by mail-ej1-f53.google.com with SMTP id p9so2762929ejd.6
 for <openrisc@lists.librecores.org>; Thu, 24 Feb 2022 00:41:57 -0800 (PST)
X-Gm-Message-State: AOAM531N+r8If11lDu96c5sI66gGO3/wEIJAqkAPYS4TPmDOMjCCM2gu
 3Qaa0dkePPk3JWkWwlze11rkpI3ShZMSQPSzg8w=
X-Google-Smtp-Source: ABdhPJzneL/9b5VqISjziF71opYqNdlSHnzAsafkxFgpoEqKa+f7LCyuasR/zxK7OReD5OXFM6yWvfz7KIyaMqF7hrc=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr1312686wrr.192.1645692105823; Thu, 24
 Feb 2022 00:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <YhdB7tNDvtsYLUzr@antec>
In-Reply-To: <YhdB7tNDvtsYLUzr@antec>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 24 Feb 2022 09:41:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
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

T24gVGh1LCBGZWIgMjQsIDIwMjIgYXQgOToyOSBBTSBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdt
YWlsLmNvbT4gd3JvdGU6Cgo+ID4gLQo+ID4gLSNkZWZpbmUgYWNjZXNzX29rKGFkZHIsIHNpemUp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLSh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+IC0gICAgIF9fY2hrX3VzZXJfcHRyKGFkZHIpOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICBfX3JhbmdlX29rKCh1bnNp
Z25lZCBsb25nKShhZGRyKSwgKHNpemUpKTsgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLX0p
Cj4gPiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL2FjY2Vzc19vay5oPgo+Cj4gSSB3YXMgZ29pbmcg
dG8gYXNrIHdoeSB3ZSBhcmUgbWlzc2luZyBfX2Noa191c2VyX3B0ciBpbiB0aGUgZ2VuZXJpYyB2
ZXJzaW9uLgo+IEJ1dCB0aGlzIGlzIGJhc2ljYWxseSBub3cgYSBuby1vcCBzbyBJIHRoaW5rIGl0
cyBPSy4KCkNvcnJlY3QsIHRoZSB0eXBlIGNoZWNraW5nIGlzIGltcGxpZWQgYnkgbWFraW5nIF9f
YWNjZXNzX29rKCkgYW4gaW5saW5lCmZ1bmN0aW9uIHRoYXQgdGFrZXMgYSBfX3VzZXIgcG9pbnRl
ci4KCj4gQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPiBbb3BlbnJp
c2MsIGFzbS1nZW5lcmljXQoKVGhhbmtzIQoKICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

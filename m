Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 31D854B6D34
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 14:17:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E200024835;
	Tue, 15 Feb 2022 14:17:22 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 2077E2482F
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 14:17:21 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E266D61716
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 13:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4E8C36AF9
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644931039;
 bh=yV4ORJd5b6IZao4Zu1H2u9bAD/0nkvfeGMC8j+boEO0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lWgUaGdLqW554EZXokTcm/v9AghbPDjDPywraTqiCp09cAHI0uvpPI70uwb6C1kuX
 HMqf6JGZaU44F72XPompvBSKuFTg2TW2/RavVydvCVIIYMYnSlmPvgMJUIBgEnJgsx
 07JXOf0kZCxwevvactvc5Zg2M+dAIFnoJk5jmcO9yiO/LjKmvakhBy2255264M4t0A
 Nn7sz/yULzaUQlhm3jJjn/5BdXSuYxO3mcAln2EPtewbxgaaDRXPlTbxfBwb2Sd5Ll
 z+el8KxgxVMQQf4hDP0fGnvs8iJ7Isa2Cp9YOo1ZQrTc42f9dARHHKZ8AJ1oEup5p9
 q2lwkhJ0TCnrw==
Received: by mail-wm1-f41.google.com with SMTP id o34so7561354wms.1
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 05:17:19 -0800 (PST)
X-Gm-Message-State: AOAM53371T0sp6nXQtrp8fT3JhavVdlGdklONdnigrzI97K2o4basi/f
 FFtat6xeuoYp37YcTrwUSa46wKQWxC5TIE0SuF0=
X-Google-Smtp-Source: ABdhPJzhbiTSvbv50mQWSJ7smaLZnr2q978YJ0F6+MeQ3SrwEp5s0NrkvRE5+WnWUVexqYiFblH5E9BGGqHgxsxWGyI=
X-Received: by 2002:a05:600c:4ecb:: with SMTP id
 g11mr3088436wmq.98.1644931026534; 
 Tue, 15 Feb 2022 05:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-6-arnd@kernel.org>
 <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 14:16:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
Message-ID: <CAK8P3a2+qG=Q9Si_2D7wjM7Qao2JCnYqKgU=W-SFwoG+fT-U3A@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [OpenRISC] [PATCH 05/14] uaccess: add generic __{get,
 put}_kernel_nofault
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
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTozMSBBTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwNTozNDo0M1BNICsw
MTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBh
cm5kYi5kZT4KPiA+Cj4gPiBBbGwgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvbid0IHByb3ZpZGUgX197
Z2V0LHB1dH1fa2VybmVsX25vZmF1bHQoKSB5ZXQKPiA+IGNhbiBpbXBsZW1lbnQgdGhpcyBvbiB0
b3Agb2YgX197Z2V0LHB1dH1fdXNlci4KPiA+Cj4gPiBBZGQgYSBnZW5lcmljIHZlcnNpb24gdGhh
dCBsZXRzIGV2ZXJ5dGhpbmcgdXNlIHRoZSBub3JtYWwKPiA+IGNvcHlfe2Zyb20sdG99X2tlcm5l
bF9ub2ZhdWx0KCkgY29kZSBiYXNlZCBvbiB0aGVzZSwgcmVtb3ZpbmcgdGhlIGxhc3QKPiA+IHVz
ZSBvZiBnZXRfZnMoKS9zZXRfZnMoKSBmcm9tIGFyY2hpdGVjdHVyZS1pbmRlcGVuZGVudCBjb2Rl
Lgo+Cj4gSSdkIHB1dCB0aGUgbGlzdCBvZiB0aG9zZSBhcmNoaXRlY3R1cmVzIChBRkFJQ1MsIHRo
YXQncyBhbHBoYSwgaWE2NCwKPiBtaWNyb2JsYXplLCBuZHMzMiwgbmlvczIsIG9wZW5yaXNjLCBz
aCwgc3BhcmMzMiwgeHRlbnNhKSBpbnRvIGNvbW1pdAo+IG1lc3NhZ2UgLSBpdCdzIG5vdCB0aGF0
IGhhcmQgdG8gZmluZCBvdXQsIGJ1dC4uLgoKZG9uZS4KCj4gQW5kIEFGQUlDUywgeW91J3ZlIG1p
c3NlZCBuaW9zMiAtIHNlZQo+ICNkZWZpbmUgX19wdXRfdXNlcih4LCBwdHIpIHB1dF91c2VyKHgs
IHB0cikKPiBpbiB0aGVyZS4gIG5kczMyIG9kZGl0aWVzIGFyZSBkZWFsdCB3aXRoIGVhcmxpZXIg
aW4gdGhlIHNlcmllcywgdGhpcwo+IG9uZSBpcyBub3QuLi4KCk9rLCBmaXhlZCBteSBidWcgaW4g
bmlvczIgX19wdXRfdXNlcigpIGFzIHdlbGwgbm93LiBUaGlzIG9uZSBpcyBub3QgbmVhcmx5CmFz
IGJhZCBhcyBuZHMzMiwgYXQgbGVhc3Qgd2l0aG91dCBteSBwYXRjaGVzIGl0IHNob3VsZCB3b3Jr
IGFzIGV4cGVjdGVkLgoKVW5mb3J0dW5hdGVseSBJIGFsc28gbm90aWNlZCB0aGF0IF9fZ2V0X3Vz
ZXIoKSBvbiBtaWNyb2JsYXplIGFuZCBuaW9zMgppcyBjb21wbGV0ZWx5IGJyb2tlbiBmb3IgNjQt
Yml0IGFyZ3VtZW50cywgd2hlcmUgdGhlc2UgY29weSBlaWdodCBieXRlcwppbnRvIGEgZm91ciBi
eXRlIGJ1ZmZlci4gSSdsbCB0cnkgdG8gY29tZSB1cCB3aXRoIGEgZml4IGZvciB0aGlzIGFzIHdl
bGwgdGhlbi4KCiAgICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

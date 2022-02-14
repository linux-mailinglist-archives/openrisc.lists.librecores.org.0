Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2264B5A88
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 20:25:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A05DC24789;
	Mon, 14 Feb 2022 20:25:56 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 6943C211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 20:25:54 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CD2A6114B
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B79C340EE
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644866752;
 bh=zLWY4rc6tKJzkfOHU66+tSLIxceIVdBozj8MWHl9tz8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HRzznKrxZvfF8qc6VMsf/ITD1M9TWaBX9YM89R9X1RXEMmeyAaIPs1Vu+QiIBCDxP
 PRuAKi7BvugYdr2V/Jy+Awa9saoq7GUCzlyK1n9YY99rbYwOtA4qcNXBNUGLFJx12j
 TMMcMoQZtQ5wGiHA7Z7FyFpd67I1K2Qb4uZjfvO/uPOAWOoFtgFel3d0Zm3rNIUL5b
 zkbhVEcpghza3JUAedGYOCS3qSF8WxhQtz5ZaFf0b87xg7zAY+7XsRB9MSSAcp1ex0
 cTzRm2NltXaiQ+ml8rx5wZlbzkoeBEmkCV1GYuoZC4h2l1GPsh1BS2Vg0MoDOs0E5s
 kK7LeWRoxrFjQ==
Received: by mail-lj1-f182.google.com with SMTP id u16so2484010ljk.2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 11:25:52 -0800 (PST)
X-Gm-Message-State: AOAM5302YYwH5DZWjmZ0wf3GDM4GRsQqsaZwrqEBAFCue75XAgH3AL58
 BFaw7opeviAoS3sKwvhLNWwIPXmwd+TXRcUoOhk=
X-Google-Smtp-Source: ABdhPJwrOpkav7UeztG9pweW7/OWsS+hZNYg7RZgUDmgoSoPSixwWLgUERuof4XivnroH6SdfUIEp08YoMpfbv7qa3w=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr422520wrv.12.1644866740020;
 Mon, 14 Feb 2022 11:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-8-arnd@kernel.org>
 <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
In-Reply-To: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:25:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [OpenRISC] [PATCH 07/14] uaccess: generalize access_ok()
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgNjoxNSBQTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwNTozNDo0NVBNICsw
MTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L2tl
cm5lbC9zaWduYWwuYyBiL2FyY2gvY3NreS9rZXJuZWwvc2lnbmFsLmMKPiA+IGluZGV4IGM3Yjc2
M2QyZjUyNi4uODg2N2RkZjNlNmM3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9jc2t5L2tlcm5lbC9z
aWduYWwuYwo+ID4gKysrIGIvYXJjaC9jc2t5L2tlcm5lbC9zaWduYWwuYwo+ID4gQEAgLTEzNiw3
ICsxMzYsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX191c2VyICpnZXRfc2lnZnJhbWUoc3RydWN0
IGtzaWduYWwgKmtzaWcsCj4gPiAgc3RhdGljIGludAo+ID4gIHNldHVwX3J0X2ZyYW1lKHN0cnVj
dCBrc2lnbmFsICprc2lnLCBzaWdzZXRfdCAqc2V0LCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+
ICB7Cj4gPiAtICAgICBzdHJ1Y3QgcnRfc2lnZnJhbWUgKmZyYW1lOwo+ID4gKyAgICAgc3RydWN0
IHJ0X3NpZ2ZyYW1lIF9fdXNlciAqZnJhbWU7Cj4gPiAgICAgICBpbnQgZXJyID0gMDsKPiA+Cj4g
PiAgICAgICBmcmFtZSA9IGdldF9zaWdmcmFtZShrc2lnLCByZWdzLCBzaXplb2YoKmZyYW1lKSk7
Cj4KPiBNaW5vciBuaXQ6IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gc2VwYXJhdGUgYW5ub3RhdGlvbnMg
KGhlcmUsIG9uIG5pb3MyLCBldGMuKSBmcm9tIHRoZSByZXN0Li4uCgpEb25lLgoKPiA+IC19Cj4g
PiAtCj4gPiAtc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICog
YWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gLXsKPiA+IC0gICAgIHJldHVybiAxOwo+ID4g
LX0KPiA+ICsjZGVmaW5lIF9fcmFuZ2Vfbm90X29rKGFkZHIsIHNpemUsIGxpbWl0KSAoIV9fYWNj
ZXNzX29rKGFkZHIsIHNpemUpKQo+Cj4gaXMgcmVhbGx5IHdyb25nLiAgRm9yIHNwYXJjNjQsIGFj
Y2Vzc19vaygpIHNob3VsZCBhbHdheXMgYmUgdHJ1ZS4KPiBUaGlzIF9fcmFuZ2Vfbm90X29rKCkg
dGhpbmcgaXMgdXNlZCAqb25seSogZm9yIHZhbGlkX3VzZXJfZnJhbWUoKSBpbgo+IGFyY2gvc3Bh
cmMva2VybmVsL3BlcmZfZXZlbnQuYyAtIGl0J3Mgbm90IGEgcGFydCBvZiBub3JtYWwgYWNjZXNz
X29rKCkKPiB0aGVyZS4KPgo+IHNwYXJjNjQgaGFzIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2VzIGZv
ciBrZXJuZWwgYW5kIGZvciB1c2VybGFuZDsgYWNjZXNzX29rKCkKPiBoYWQgbmV2ZXIgYmVlbiB1
c2VmdWwgdGhlcmUuCgpPaywgZml4ZWQgYXMgd2VsbCBub3cuIEkgaGFkIHRoZSBhY2Nlc3Nfb2so
KSBiaXQgcmlnaHQsIHRoZSBkZWZpbml0aW9uIGp1c3QKbW92ZWQgYXJvdW5kIGhlcmUgc28gaXQg
Y29tZXMgYmVmb3JlIHRoZSAjaW5jbHVkZSwgYnV0IEkgbWlzc2VkIHRoZQpiaXQgYWJvdXQgX19y
YW5nZV9ub3Rfb2soKSwgd2hpY2ggSSBoYXZlIG5vdyByZXZlcnRlZCBiYWNrIHRvIHRoZQpjb3Jy
ZWN0IHZlcnNpb24gaW4gbXkgdHJlZS4KCiAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

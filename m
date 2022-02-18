Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA164BB344
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 08:30:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E30A424870;
	Fri, 18 Feb 2022 08:30:31 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 6513C2483D
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 08:30:30 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2991B820CC
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF6EC340FC
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169428;
 bh=4Rk51yI7cy+h8GrR+wkZuFO6d6ZOgVmodthZQla/xGE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nfieHdtoc5pDqS5G+Vo+kHzqd26jkrD4pn8k7ivIDT01UdTHxcfE2U323R+wTs95P
 SjXGrQR5t3CflTK8gDO5o1/jpzLh/W0vSfOdjuhK0MIH8MU487qgYRsdXfgKdcQFwx
 Z8DEhvjyyFZMgz9C+eJMrEuZiHjh8LZtvTGanxRtkC8k+PDbRqYpHCGQOKOSBtyZxU
 MyMVskyvUrgBJrO2kGej5iymlF3hkaSLGHXSeI8Kz9+3fQqcMqX4eMOdbLXgfkVQqP
 FGgsr6IvGiXxq/3RTaYxvb7ljrjO/V1YQAzhZqfx99tLC1lGmBpJkwxKHbLeLzEQHs
 QPzG/1NULMG0g==
Received: by mail-ed1-f47.google.com with SMTP id u18so13905083edt.6
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:30:28 -0800 (PST)
X-Gm-Message-State: AOAM530Q2i7iC8G589UfZAgrdflZD+6J/zRp6cubxNgtkWf/DLrqRJTo
 B0hMT4qnvuhstw3DsgW5+9UK71/nrCRdc1pC8x0=
X-Google-Smtp-Source: ABdhPJz4trlMwdvjT8y0UPggztkdijECp2hMuaf6QP4pGa8b+VYFZp4/tSgCA0YRdkm1OA4dObRIZr3wh6XhtS+RfLY=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr4942117wrm.317.1645169415535; Thu, 17
 Feb 2022 23:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
 <20220218062851.GC22576@lst.de>
In-Reply-To: <20220218062851.GC22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:29:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
Message-ID: <CAK8P3a1Dhn1Gsap1Wss2xpKBwe3jWLAmMYtL7S1-26tZ5D_2fQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [OpenRISC] [PATCH v2 05/18] x86: remove __range_not_ok()
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
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
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

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgNzoyOCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4gT24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDI6MTM6MTlQTSArMDEwMCwg
QXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IC0tLSBhL2FyY2gveDg2L2V2ZW50cy9jb3JlLmMKPiA+
ICsrKyBiL2FyY2gveDg2L2V2ZW50cy9jb3JlLmMKPiA+IEBAIC0yNzk0LDcgKzI3OTQsNyBAQCBw
ZXJmX2NhbGxjaGFpbl9rZXJuZWwoc3RydWN0IHBlcmZfY2FsbGNoYWluX2VudHJ5X2N0eCAqZW50
cnksIHN0cnVjdCBwdF9yZWdzICpyZQo+ID4gIHN0YXRpYyBpbmxpbmUgaW50Cj4gPiAgdmFsaWRf
dXNlcl9mcmFtZShjb25zdCB2b2lkIF9fdXNlciAqZnAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+
ICB7Cj4gPiAtICAgICByZXR1cm4gKF9fcmFuZ2Vfbm90X29rKGZwLCBzaXplLCBUQVNLX1NJWkUp
ID09IDApOwo+ID4gKyAgICAgcmV0dXJuIF9fYWNjZXNzX29rKGZwLCBzaXplKTsKPiA+ICB9Cj4K
PiB2YWxpZF91c2VyX2ZyYW1lIGp1c3QgbmVlZCB0byBnbyBhd2F5IGFuZCB0aGUgZm9sbG93aW5n
IF9fZ2V0X3VzZXIgY2FsbHMKPiByZXBsYWNlZCB3aXRoIG5vcm1hbCBnZXRfdXNlciBvbmVzLgoK
QXMgSSB1bmRlcnN0YW5kIGl0LCB0aGF0IHdvdWxkIG5vdCB3b3JrIGhlcmUgYmVjYXVzZSBnZXRf
dXNlcigpIGNhbGxzCmFjY2Vzc19vaygpIHJhdGhlciB0aGFuIF9fYWNjZXNzX29rKCksIGFuZCBv
biB4ODYgdGhhdCBjYW4gbm90IGJlCmNhbGxlZCBpbiBOTUkgY29udGV4dC4KCkl0IGlzIGEgYml0
IG9kZCB0aGF0IHg4NiBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgdGhhdCBoYXMgdGhpcyBjaGVj
aywKYnV0IGFkZGluZwppdCB3YXMgY2xlYXJseSBpbnRlbnRpb25hbCwgc2VlIDdjNDc4ODk1MGJh
NSAoIng4Ni91YWNjZXNzLCBzY2hlZC9wcmVlbXB0OgpWZXJpZnkgYWNjZXNzX29rKCkgY29udGV4
dCIpLgoKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmMgYi9hcmNo
L3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmMKPiA+IGluZGV4IDUzZGUwNDRlNTY1NC4uZGE1MzRmYjdi
NWM2IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC94ODYva2VybmVsL2R1bXBzdGFjay5jCj4gPiArKysg
Yi9hcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmMKPiA+IEBAIC04NSw3ICs4NSw3IEBAIHN0YXRp
YyBpbnQgY29weV9jb2RlKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1OCAqYnVmLCB1bnNpZ25lZCBs
b25nIHNyYywKPiA+ICAgICAgICAqIE1ha2Ugc3VyZSB1c2Vyc3BhY2UgaXNuJ3QgdHJ5aW5nIHRv
IHRyaWNrIHVzIGludG8gZHVtcGluZyBrZXJuZWwKPiA+ICAgICAgICAqIG1lbW9yeSBieSBwb2lu
dGluZyB0aGUgdXNlcnNwYWNlIGluc3RydWN0aW9uIHBvaW50ZXIgYXQgaXQuCj4gPiAgICAgICAg
Ki8KPiA+IC0gICAgIGlmIChfX2Noa19yYW5nZV9ub3Rfb2soc3JjLCBuYnl0ZXMsIFRBU0tfU0la
RV9NQVgpKQo+ID4gKyAgICAgaWYgKCFfX2FjY2Vzc19vaygodm9pZCBfX3VzZXIgKilzcmMsIG5i
eXRlcykpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gVGhpcyBvbmUgaXMg
bm90IG5lZWRlZCBhdCBhbGwgYXMgY29weV9mcm9tX3VzZXJfbm1pIGFscmVhZHkgY2hlY2tzIHRo
ZQo+IGFjY2VzcyByYW5nZS4KCk9rLCByZW1vdmluZyB0aGlzLgoKPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC94ODYva2VybmVsL3N0YWNrdHJhY2Uu
Ywo+ID4gaW5kZXggMTViMDU4ZWVmYzRlLi5lZTExN2ZjZjQ2ZWQgMTAwNjQ0Cj4gPiAtLS0gYS9h
cmNoL3g4Ni9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc3Rh
Y2t0cmFjZS5jCj4gPiBAQCAtOTAsNyArOTAsNyBAQCBjb3B5X3N0YWNrX2ZyYW1lKGNvbnN0IHN0
cnVjdCBzdGFja19mcmFtZV91c2VyIF9fdXNlciAqZnAsCj4gPiAgewo+ID4gICAgICAgaW50IHJl
dDsKPiA+Cj4gPiAtICAgICBpZiAoX19yYW5nZV9ub3Rfb2soZnAsIHNpemVvZigqZnJhbWUpLCBU
QVNLX1NJWkUpKQo+ID4gKyAgICAgaWYgKCFfX2FjY2Vzc19vayhmcCwgc2l6ZW9mKCpmcmFtZSkp
KQo+ID4gICAgICAgICAgICAgICByZXR1cm4gMDsKPgo+IEp1c3Qgc3dpdGNoIHRoZSBfX2dldF91
c2VyIGNhbGxzIGJlbG93IHRvIGdldF91c2VyIGluc3RlYWQuCgpTYW1lIGFzIHRoZSBmaXJzdCBv
bmUsIEkgdGhpbmsgd2UgY2FuJ3QgZG8gdGhpcyBpbiBOTUkgY29udGV4dC4KCiAgICAgICAgIEFy
bmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

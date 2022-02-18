Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5450C4BB587
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 10:25:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F23D22487D;
	Fri, 18 Feb 2022 10:25:20 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id E77DE24876
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:25:19 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5BCA3B825C1
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12256C340EF
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645176319;
 bh=mMLLIykgh57Awf38lSwA8MWwDlZ8x8pcozF3MLrCnRg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sq4m3Dgo4gWgyVxTrIGW8PCTX4ye2wRDjntiwC1sV2Amlm/vMu+XNB1jESk+7PC32
 tszy9JzCEY//ujCoLQCrsK92mKLzyEge1dx2/R4Gy1Zs0d5yf4whvYuOVqPTNxWR/r
 4ncpylgSrdkiul2GiTrokXQ/sO85JURvv1y8jJjsuPhN9iM1KwRfv4GXsplWwm+9Zd
 LFcxiC4igD16VDiYF4b0rJqvVLEWrlWKePZZD32oLexgu9HQ+BYu0O7M2xb0MJHzsn
 jc0QSiHCRLZeSy1oiVnISFhpiIbzWbAorl6JRhqGcUfaow+2BCXUqm16W0MmplZW4/
 usLkIxy/wG5/A==
Received: by mail-wm1-f54.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so8137337wme.3
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 01:25:18 -0800 (PST)
X-Gm-Message-State: AOAM531dmAbjx1XMFrrihHh7mJkInZZpa1lEuUl/crvj3n0h3uxT21k/
 a4fogDWvqjYLa4xnaOUkdXpexRdIflBzeiEG3/s=
X-Google-Smtp-Source: ABdhPJwrWpJqc0egLA12RwkumDKsH10yWoelsJ0RehwMogjvxHhR3UEotiD7Fxqib+HetrYJWhy8e0u55+IMdrLJwD4=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr9729968wms.82.1645176306970; Fri, 18
 Feb 2022 01:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
 <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 10:24:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
Message-ID: <CAK8P3a2hrjxzzAWk3ut3VTD3h=ZLpDwPdvqs+uKaC4_b6+Vbfg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [OpenRISC] [PATCH v2 10/18] m68k: fix access_ok for coldfire
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
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
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTA6MDAgQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiAgLyogV2UgbGV0IHRoZSBNTVUgZG8gYWxsIGNo
ZWNraW5nICovCj4gPiAtc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29rKGNvbnN0IHZvaWQgX191
c2VyICphZGRyLAo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGFjY2Vzc19vayhjb25zdCB2b2lkIF9f
dXNlciAqcHRyLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKPiA+ICB7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbGltaXQgPSBUQVNLX1NJWkU7
Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXB0cjsKPiA+
ICsKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICogWFhYOiBmb3IgIUNPTkZJR19DUFVfSEFT
X0FERFJFU1NfU1BBQ0VTIHRoaXMgcmVhbGx5IG5lZWRzIHRvIGNoZWNrCj4gPiAgICAgICAgICAq
IGZvciBUQVNLX1NJWkUhCj4gPiArICAgICAgICAqIFJlbW92aW5nIHRoaXMgaGVscGVyIGlzIHBy
b2JhYmx5IHN1ZmZpY2llbnQuCj4gPiAgICAgICAgICAqLwo+Cj4gU2hvdWxkbid0IHRoZSBhYm92
ZSBjb21tZW50IGJsb2NrIGJlIHJlbW92ZWQgY29tcGxldGVseSwKPiBhcyB0aGlzIGlzIG5vdyBp
bXBsZW1lbnRlZCBiZWxvdz8KClllcywgb2J2aW91c2x5LiBGaXhlZCBub3cuCgo+ID4gLSAgICAg
ICByZXR1cm4gMTsKPiA+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0NQVV9IQVNfQURE
UkVTU19TUEFDRVMpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAxOwoKSSBqdXN0IG5vdGlj
ZWQgdGhpcyBzaG91bGQgaGF2ZSB0aGUgc2FtZSBjaGFuZ2UgdGhhdCBJIG1hZGUgZm9yIHRoZQpn
ZW5lcmljIHZlcnNpb24sIGNoYW5nZWQgaXQgbm93IHRvCgorICAgICAgIGlmIChJU19FTkFCTEVE
KENPTkZJR19DUFVfSEFTX0FERFJFU1NfU1BBQ0VTKSB8fAorICAgICAgICAgICAhSVNfRU5BQkxF
RChDT05GSUdfTU1VKSkKClRoaXMgaXMgZ29uZSBhZ2FpbiBhZnRlciB0aGUgY2xlYW51cCBwYXRj
aCwgd2hlbiB0aGUgZ2VuZXJpYyB2ZXJzaW9uCmlzIHVzZWQgaW5zdGVhZC4KCj4gPiArICAgICAg
IHJldHVybiAoc2l6ZSA8PSBsaW1pdCkgJiYgKGFkZHIgPD0gKGxpbWl0IC0gc2l6ZSkpOwo+ID4g
IH0KPgo+IEFueSBwZXNreSBjb21waWxlcnMgdGhhdCB3YXJuIChvciB3b3JzZSB3aXRoIC1XZXJy
b3IpIGFib3V0Cj4gImNvbmRpdGlvbiBhbHdheXMgdHJ1ZSIgZm9yIFRBU0tfU0laRSA9IDB4RkZG
RkZGRkZVTD8KCk5vLCB1c2luZyBhIGxvY2FsIHZhcmlhYmxlIGF2b2lkcyB0aGlzIHdhcm5pbmcu
CgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

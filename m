Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E91C048183A
	for <lists+openrisc@lfdr.de>; Thu, 30 Dec 2021 02:48:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7790D24315;
	Thu, 30 Dec 2021 02:48:43 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id F05A42412F
 for <openrisc@lists.librecores.org>; Thu, 30 Dec 2021 02:48:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 978F8B81A6D
 for <openrisc@lists.librecores.org>; Thu, 30 Dec 2021 01:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E80C36AF7
 for <openrisc@lists.librecores.org>; Thu, 30 Dec 2021 01:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640828918;
 bh=81MO7TacqQe8I5ko0Q8CwbDD4h/99BabB8aCDnWo0lQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jV/ycMyovnmu9pbcNLGboBsGNIaWSzFTvzZh+Mx9BwCcRQ4wkFdLiGVgRkSKcn1av
 ACLs6uhvkNBtfi0XHerEvqHG9aDTvnP0DnkZJ23UYJg1+rpYpog6ujNkprLhWymjWQ
 hVule2DRwuMYA/yBJYRWrQwKgFOWg5pmJP5humJTKlsctrnxGtyKKZV5MSDWgxD4iF
 I5CuYOMx73K52jL6eCERvW0K/qJG/CffLHmjFLJmfkBjIdmKueJ2GntN8tpN5P6Axu
 +/iJu6EgjHsacUxqabHsXc98pimqrGXyEBPg4rn/eSXczdd7VTgu9//4yKsbFR5Bjg
 v0Y95G8jR3CDw==
Received: by mail-ed1-f44.google.com with SMTP id m21so93657225edc.0
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 17:48:38 -0800 (PST)
X-Gm-Message-State: AOAM530oQ9+Xr2wHoffFJiyJvm0dILaZbAsHf7QtXqz960fqzRTihlmn
 vvPRV3HalOuUVALbGDTCKZXzzzf939bF7f1AD6o=
X-Google-Smtp-Source: ABdhPJzYCdRT3l8EecUhPG5EkJz2cutHHKG9LloyzIQNKSKV94+pfG1Ig6YswCjGB6BOha4SzAwDhMxmrauWo4kartQ=
X-Received: by 2002:a5d:6989:: with SMTP id g9mr22454231wru.12.1640828906053; 
 Wed, 29 Dec 2021 17:48:26 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
 <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
 <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
In-Reply-To: <1f90f145-219e-1cad-6162-9959d43a27ad@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 29 Dec 2021 20:48:23 -0500
X-Gmail-Original-Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
Message-ID: <CAK8P3a3NqU-3nUZ9ve=QyPPB5Uep3eK+_hicjjSiP8VuL4FYfA@mail.gmail.com>
To: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [OpenRISC] [RFC 02/32] Kconfig: introduce HAS_IOPORT option and
 select it as necessary
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
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, John Garry <john.garry@huawei.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBEZWMgMjgsIDIwMjEgYXQgMTE6MTUgUE0gTWljaGFlbCBTY2htaXR6IDxzY2htaXR6
bWljQGdtYWlsLmNvbT4gd3JvdGU6Cj4gQW0gMjkuMTIuMjAyMSB1bSAxNjo0MSBzY2hyaWViIEFy
bmQgQmVyZ21hbm46Cj4gPiBPbiBUdWUsIERlYyAyOCwgMjAyMSBhdCA4OjIwIFBNIE1pY2hhZWwg
U2NobWl0eiA8c2NobWl0em1pY0BnbWFpbC5jb20+IHdyb3RlOgo+IEknZCBob3BlIG5vdCAtIHdl
IHNwZW50IHNvbWUgZWZmb3J0IHRvIG1ha2Ugc3VyZSBzZXR0aW5nIEFUQVJJX1JPTV9JU0EKPiBk
b2VzIG5vdCBhZmZlY3Qgb3RoZXIgbTY4ayBwbGF0Zm9ybXMgd2hlbiBlLmcuIGJ1aWxkaW5nIG11
bHRpcGxhdGZvcm0KPiBrZXJuZWxzLgoKT2sKCj4gUmVwbGFjaW5nIGluYigpIGJ5IHJlYWRiKCkg
d2l0aG91dCBhbnkgYWRkcmVzcyB0cmFuc2xhdGlvbiB3b24ndCBkbyBtdWNoCj4gZ29vZCBmb3Ig
bTY4ayB0aG91Z2ggLSBhZGRyZXNzZXMgaW4gdGhlIHRyYWRpdGlvbmFsIElTQSBJL08gcG9ydCBy
YW5nZQo+IHdvdWxkIGhpdCB0aGUgKHVubWFwcGVkKSB6ZXJvIHBhZ2UuCgpDb3JyZWN0LCB0aGlz
IGlzIGV4YWN0bHkgdGhlIHByb2JsZW0gdGhhdCBOaWtsYXMgaXMgdHJ5aW5nIHRvIHNvbHZlIGhl
cmU6CndlIGRvIGhhdmUgZHJpdmVycyB0aGF0IGhpdCB0aGlzIGJ1ZywgYW5kIG9uIHMzOTAgY2xh
bmcgYWN0dWFsbHkgcHJvZHVjZXMKYSBjb21waWxlLXRpbWUgZXJyb3IgZm9yIGRyaXZlcnMgdGhh
dCBjYXVzZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQp0aGlzIHdheS4KCldoYXQgc29tZSBv
dGhlciBhcmNoaXRlY3R1cmVzIGRvIGlzIHRvIHJlbHkgb24gaW5iKCkvb3V0YigpIHRvIGhhdmUg
YQp6ZXJvLWJhc2VkIG9mZnNldCwgYW5kIHVzZSBhbiBpb19vZmZzZXQgaW4gUENJIGJ1c2VzIHRv
IGVuc3VyZSB0aGF0IGEKbG93IHBvcnQgbnVtYmVyIG9uIHRoZSBidXMgZ2V0cyB0cmFuc2xhdGVk
IGludG8gYSBwb2ludGVyIHZhbHVlIGZvciB0aGUKdmlydHVhbCBtYXBwaW5nIGluIHRoZSBrZXJu
ZWwsIHdoaWNoIGlzIHRoZW4gcmVwcmVzZW50ZWQgYXMgYW4gdW5zaWduZWQKaW50LgoKQXMgdGhp
cyBpcyBpbmRpc3Rpbmd1aXNoYWJsZSBmcm9tIGFyY2hpdGVjdHVyZXMgdGhhdCBqdXN0IGRvbid0
IGhhdmUKYSBiYXNlIGFkZHJlc3MgZm9yIEkvTyBwb3J0cyAod2UgdW5mb3J0dW5hdGVseSBwaWNr
ZWQgMCBhcyB0aGUgZGVmYXVsdApQQ0lfSU9CQVNFIHZhbHVlKSwgbXkgc3VnZ2VzdGlvbiB3YXMg
dG8gc3RhcnQgbWFya2luZyBhcmNoaXRlY3R1cmVzCnRoYXQgbWF5IGhhdmUgdGhpcyBwcm9ibGVt
IGFzIHVzaW5nIEhBU19JT1BPUlQgaW4gb3JkZXIgdG8ga2VlcAp0aGUgZXhpc3RpbmcgYmVoYXZp
b3IgdW5jaGFuZ2VkLiBJZiBtNjhrIGRvZXMgbm90IHN1ZmZlciBmcm9tIHRoaXMsCm1ha2luZyBI
QVNfSU9QT1JUIGNvbmRpdGlvbmFsIG9uIHRob3NlIGNvbmZpZyBvcHRpb25zIHRoYXQgYWN0dWFs
bHkKbmVlZCBpdCB3b3VsZCBvZiBjb3Vyc2UgYmUgYmVzdC4KCiAgICAgICAgIEFybmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

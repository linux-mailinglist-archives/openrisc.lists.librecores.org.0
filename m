Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A30F34B6886
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 11:02:41 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5C38624824;
	Tue, 15 Feb 2022 11:02:41 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id D64312481E
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 11:02:39 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB08A61269
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91483C340ED
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644919358;
 bh=6OaJO5k8UStns9fCBustiYnW4Ue2uRRTBF363T6I8Z8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H1mzzxMRB5TMZ9neisHBMeicN83/WamyIC/pT/LZsF0TvXPL6IVMAZPTCP+nVfNYb
 n9G9vYBa2mfKP/77hkznGWZ3Fe7PU0TA06U7k1VCLe3HXCLlvlJRWgnZFxOLxTDW44
 ZPvaGpS87sq7sNiYnrBgIe5JuH55hGLwVtcwNvAroVwaPxBZpyemFc0nZnYHYjxZ1s
 cEi8Y0dDDxMg+Ad6QhYijVu+mroNz4tEcp0Fqn/slImdmxgp8cUVfac4Mse9dkkk7w
 6HHo2iKQyITZ0DUgGnfRWBCGVo0QXOLJfIXaobk+ElshnV8jkt3HPRoanHmRgxLksd
 AJa3zvZpzJRtw==
Received: by mail-wm1-f41.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so1074588wmb.0
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 02:02:38 -0800 (PST)
X-Gm-Message-State: AOAM530oe8Pb5hz/oUCeEuNZLv2cs9snLxyp6HQeLfkYsIbwzqfIdjNC
 R1UGCpAfFdVfnGViD8Rvni6+Wm+r282ZxACEu8I=
X-Google-Smtp-Source: ABdhPJxXhF5oN8HK5+/UBfeNSuYxeBNAH3pN7Z2cMEK019oVoVAxn2dH7YUg+eieAXhNWJaJdsC0aGcEXS3C4UXMT34=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr2332972wml.173.1644919346591; Tue, 15
 Feb 2022 02:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk> <20220215062942.GA12551@lst.de>
 <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
In-Reply-To: <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 11:02:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
Message-ID: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [OpenRISC] [PATCH 09/14] m68k: drop custom __access_ok()
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgODoxMyBBTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4gT24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMDc6Mjk6NDJBTSArMDEw
MCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAx
MjozNzo0MUFNICswMDAwLCBBbCBWaXJvIHdyb3RlOgo+ID4gPiBQZXJoYXBzIHNpbXBseSB3cmFw
IHRoYXQgc3Vja2VyIGludG8gI2lmZGVmIENPTkZJR19DUFVfSEFTX0FERFJFU1NfU1BBQ0VTCj4g
PiA+IChhbmQgdHJpbSB0aGUgY29tbWVudCBkb3duIHRvICJjb2xkZmlyZSBhbmQgNjgwMDAgd2ls
bCBwaWNrIGdlbmVyaWMKPiA+ID4gdmFyaWFudCIpPwo+ID4KPiA+IEkgd29uZGVyIGlmIHdlIHNo
b3VsZCBpbnZlcnQgQ09ORklHX0FSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNF
LAo+ID4gc2VsZWN0IHRoZSBzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlIGNvbmZpZyBmb3IgczM5MCwg
c3BhcmM2NCwgbm9uLWNvbGRmaXJlCj4gPiBtNjhrIGFuZCBtaXBzIHdpdGggRVZBIGFuZCB0aGVu
IGp1c3QgaGF2ZSBvbmUgc2luZ2xlIGFjY2Vzc19vayBmb3IKPiA+IG92ZXJsYXBwaW5nIGFkZHJl
c3Mgc3BhY2UgKGFzIGFkZGVkIGJ5IEFybmQpIGFuZCBub24tb3ZlcmxhcHBpbmcgb25lcwo+ID4g
KGFsd2F5cyByZXR1cm4gdHJ1ZSkuCj4KPiBwYXJpc2MgaXMgYWxzbyBzdWNoLi4uICBIb3cgYWJv
dXQKPgo+ICAgICAgICAgc2VsZWN0IEFMVEVSTkFURV9TUEFDRV9VU0VSTEFORAo+Cj4gZm9yIHRo
YXQgYnVuY2g/CgpFaXRoZXIgb2YgdGhvc2Ugd29ya3MgZm9yIG1lLiBNeSBjdXJyZW50IHZlcnNp
b24gaGFzIHRoaXMga2V5ZWQgb2ZmClRBU0tfU0laRV9NQVg9PVVMT05HX01BWCwgYnV0IGEgQ09O
RklHXyBzeW1ib2wgZG9lcwpsb29rIG1vcmUgZGVzY3JpcHRpdmUuCgo+ICBXaGlsZSB3ZSBhcmUg
YXQgaXQsIGhvdyBtYW55IHVudXN1YWwgYWNjZXNzX29rKCkgaW5zdGFuY2VzIGFyZQo+IGxlZnQg
YWZ0ZXIgdGhpcyBzZXJpZXM/ICBhcm02NCwgaXRhbmljLCB1bSwgYW55dGhpbmcgZWxzZT8KCng4
NiBhZGRzIGEgV0FSTl9PTl9JTl9JUlEoKSBjaGVjayBpbiB0aGVyZS4gVGhpcyBjb3VsZCBiZQpt
YWRlIGdlbmVyaWMsIGJ1dCBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgZXhhY3RseSB0aGUgZXhjZXB0
aW9ucyBhcmUKdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIG5lZWQuIFRoZSBhcm02NCB0YWdnZWQg
cG9pbnRlcnMgY291bGQKcHJvYmFibHkgYWxzbyBnZXQgaW50ZWdyYXRlZCBpbnRvIHRoZSBnZW5l
cmljIHZlcnNpb24uCgo+IEZXSVcsIHNwYXJjMzIgaGFzIGEgc2xpZ2h0bHkgdW51c3VhbCBpbnN0
YW5jZSAoc2VlIHVhY2Nlc3NfMzIuaCB0aGVyZSk7IGl0J3MKPiBvYnZpb3VzbHkgY2hlYXBlciB0
aGFuIGdlbmVyaWMgYW5kIEkgd29uZGVyIGlmIHRoZSB0cmljayBpcyBsZWdpdGltYXRlIChhbmQK
PiBhcHBsaWNhYmxlIGVsc2V3aGVyZSwgcGVyaGFwcykuLi4KClJpZ2h0LCBhIGZldyBvdGhlcnMg
aGF2ZSB0aGUgc2FtZSwgYnV0IEkgd2Fzbid0IGNvbnZpbmNlZCB0aGF0IHRoaXMKaXMgYWN0dWFs
bHkgc2FmZSBmb3IgY2FsbCBwb3NzaWJsZSBjYXNlczogaXQncyB0cml2aWFsIHRvIGNvbnN0cnVj
dCBhIGNhbGxlcgp0aGF0IHdvcmtzIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMgYnV0IG5vdCB0aGlz
IG9uZSwgaWYgeW91IHBhc3MgYSBsYXJnZQplbm91Z2ggc2l6ZSB2YWx1ZSBhbmQgZG9uJ3QgYWNj
ZXNzIHRoZSBjb250ZW50cyBpbiBzZXF1ZW5jZS4KCkFsc28sIGxpa2UgdGhlICgoYWRkciB8IChh
ZGRyICsgc2l6ZSkpICYgTUFTSykgY2hlY2sgb24gc29tZSBvdGhlcgphcmNoaXRlY3R1cmVzLCBp
dCBpcyBsZXNzIHBvcnRhYmxlIGJlY2F1c2UgaXQgbWFrZXMgYXNzdW1wdGlvbnMgYWJvdXQKdGhl
IGFjdHVhbCBsYXlvdXQgYmV5b25kIGEgZml4ZWQgYWRkcmVzcyBsaW1pdC4KCiAgICAgICAgQXJu
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

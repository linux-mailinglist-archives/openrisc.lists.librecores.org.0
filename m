Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 33C67478CA6
	for <lists+openrisc@lfdr.de>; Fri, 17 Dec 2021 14:47:26 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D3DA9242B5;
	Fri, 17 Dec 2021 14:47:25 +0100 (CET)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTP id 633AD2420E
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 14:47:23 +0100 (CET)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1BHDZQmf021580;
 Fri, 17 Dec 2021 07:35:26 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1BHDZJZQ021573;
 Fri, 17 Dec 2021 07:35:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 17 Dec 2021 07:35:18 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20211217133518.GR614@gate.crashing.org>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
 <20211216185620.GP614@gate.crashing.org>
 <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
User-Agent: Mutt/1.4.2.3i
Subject: Re: [OpenRISC] [PATCH v2 00/13] Unify asm/unaligned.h around struct
 helper
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonas Bonn <jonas@southpole.se>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>,
 John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBEZWMgMTcsIDIwMjEgYXQgMTI6MzQ6NTNQTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdy
b3RlOgo+IEZyb206IFNlZ2hlciBCb2Vzc2Vua29vbAo+ID4gU2VudDogMTYgRGVjZW1iZXIgMjAy
MSAxODo1Ngo+IC4uLgo+ID4gPiBUaGUgb25seSByZW1haW5pbmcgcHJvYmxlbSBoZXJlIGlzIHJl
aW50ZXJwcmV0aW5nIGEgY2hhciogcG9pbnRlciB0byBhCj4gPiA+IHUzMiosIGUuZy4sIGZvciBh
Y2Nlc3NpbmcgdGhlIElQIGFkZHJlc3MgaW4gYW4gRXRoZXJuZXQgZnJhbWUgd2hlbgo+ID4gPiBO
RVRfSVBfQUxJR04gPT0gMiwgd2hpY2ggY291bGQgc3VmZmVyIGZyb20gdGhlIHNhbWUgVUIgcHJv
YmxlbSBhZ2FpbiwKPiA+ID4gYXMgSSB1bmRlcnN0YW5kIGl0Lgo+ID4gCj4gPiBUaGUgcHJvYmxl
bSBpcyBuZXZlciBjYXN0aW5nIGEgcG9pbnRlciB0byBwb2ludGVyIHRvIGNoYXJhY3RlciB0eXBl
LCBhbmQKPiA+IHRoZW4gbGF0ZXIgYmFjayB0byBhbiBhcHByaW9wcmlhdGUgcG9pbnRlciB0eXBl
Lgo+ID4gVGhlc2UgdGhpbmdzIGFyZSBib3RoIHJlcXVpcmVkIHRvIHdvcmsuCj4gCj4gSSB0aGlu
ayB0aGF0IGlzIHRydWUgb2YgJ3ZvaWQgKicsIG5vdCAnY2hhciAqJy4KCk5vLCBzZWUgNi4zLjIu
My83LiAgQm90aCBhcmUgYWxsb3dlZCAoYW5kIGJlaGF2ZSB0aGUgc2FtZSBpbiBmYWN0KS4KCj4g
J2NoYXInIGlzIHNwZWNpYWwgaW4gdGhhdCAnc3RyaWN0IGFsaWFzaW5nJyBkb2Vzbid0IGFwcGx5
IHRvIGl0Lgo+IChXaGljaCBpcyBhY3R1YWxseSBhIHBhaW4gc29tZXRpbWVzLikKClRoYXQgaGFz
IG5vdGhpbmcgdG8gZG8gd2l0aCBpdC4gIFllcywgeW91IGNhbiB2YWxpZGx5IGFjY2VzcyBhbnkg
bWVtb3J5CmFzIGEgY2hhcmFjdGVyIHR5cGUsIGJ1dCB0aGF0IGhhcyBub3RoaW5nIHRvIGRvIHdp
dGggd2hhdCBwb2ludGVyIGNhc3RzCmFyZSBhbGxvd2VkIGFuZCB3aGljaCBhcmUgbm90LgoKPiA+
IFRoZSBwcm9ibGVtIGFsd2F5cyBpcyBhY2Nlc3Npbmcgc29tZXRoaW5nIGFzIGlmIGl0Cj4gPiB3
YXMgc29tZXRoaW5nIG9mIGFub3RoZXIgdHlwZSwgd2hpY2ggaXMgbm90IHZhbGlkIEMuICBUaGlz
IGhvd2V2ZXIgaXMKPiA+IGV4YWN0bHkgd2hhdCAtZm5vLXN0cmljdC1hbGlhc2luZyBhbGxvd3Ms
IHNvIHRoYXQgd29ya3MgYXMgd2VsbC4KPiAKPiBJSVJDIHRoZSBDIGxhbmd1YWdlIG9ubHkgYWxs
b3dzIHlvdSB0byBoYXZlIHBvaW50ZXJzIHRvIHZhbGlkIGRhdGEgaXRlbXMuCj4gKFNpbmNlIHRo
ZXkgY2FuIG9ubHkgYmUgZ2VuZXJhdGVkIGJ5IHRoZSAmIG9wZXJhdG9yIG9uIGEgdmFsaWQgaXRl
bS4pCgpOb3Qgc28uICBGb3IgZXhhbXBsZSB5b3UgYXJlIGV4cGxpY2l0bHkgYWxsb3dlZCB0byBo
YXZlIHBvaW50ZXJzIG9uZQpwYXN0IHRoZSBsYXN0IGVsZW1lbnQgb2YgYW4gYXJyYXkgKGFuZCBk
byBhcml0aG1ldGljIG9uIHRoYXQhKSwgYW5kIG9mCmNvdXJzZSBudWxsIHBvaW50ZXJzIGFyZSBh
IHRoaW5nLgoKQyBhbGxvd3MgeW91IHRvIG1ha2UgdXAgcG9pbnRlcnMgZnJvbSBpbnRlZ2VycyBh
cyB3ZWxsLiAgVGhpcyBpcwpwZXJmZWN0bHkgZmluZSB0byBkby4gIEFjY2Vzc2luZyBhbnl0aGlu
ZyB2aWEgc3VjaCBwb2ludGVycyBtaWdodCB3ZWxsCmJlIG5vdCBzdGFuZGFyZCBDLCBvZiBjb3Vy
c2UuCgo+IEluZGlyZWN0aW5nIGFueSBvdGhlciBwb2ludGVyIGlzIHByb2JhYmx5IFVCIQoKSWYg
YSBwb2ludGVyIHBvaW50cyB0byBhbiBvYmplY3QsIGluZGlyZWN0aW5nIGl0IGdpdmVzIGFuIGx2
YWx1ZSBvZiB0aGF0Cm9iamVjdC4gIEl0IGRvZXMgbm90IG1hdHRlciBob3cgeW91IGdvdCB0aGF0
IHBvaW50ZXIsIGFsbCB0aGF0IG1hdHRlcnMKaXMgdGhhdCBpdCBwb2ludHMgYXQgYSB2YWxpZCBv
YmplY3QuCgo+IFRoaXMgKHNvcnQgb2YpIGFsbG93cyB0aGUgY29tcGlsZXIgdG8gJ2xvb2sgdGhy
b3VnaCcgY2FzdHMgdG8gZmluZAo+IHdoYXQgdGhlIGFjdHVhbCB0eXBlIGlzIChvciBtaWdodCBi
ZSkuCj4gSXQgY2FuIHRoZW4gdXNlIHRoYXQgaW5mb3JtYXRpb24gdG8gbWFrZSBvcHRpbWlzYXRp
b24gY2hvaWNlcy4KPiBUaGlzIGhhcyBjYXVzZWQgZ3JpZWYgd2l0aCBtZW1jcHkoKSBjYWxscyB0
aGF0IGFyZSB0cnlpbmcgdG8gY29weQo+IGEgc3RydWN0dXJlIHRoYXQgdGhlIGNvZGVyIGtub3dz
IGlzIG1pc2FsaWduZWQgdG8gYW4gYWxpZ25lZCBidWZmZXIuCgpUaGlzIGlzIDYuNS83LgoKQWxp
Z25tZW50IGlzIDYuMi44IGJ1dCBpdCBkb2Vzbid0IGFjdHVhbGx5IGNvbWUgaW50byBwbGF5IGF0
IGFsbCBoZXJlLgoKPiBTbyB3aGlsZSAqKHVuYWxpZ25lZF9wdHIgKiljaGFyX3B0ciBwcm9iYWJs
eSBoYXMgdG8gd29yay4KCk9ubHkgaWYgdGhlIG9yaWdpbmFsIHBvaW50ZXIgcG9pbnRzIHRvIGFu
IG9iamVjdCB0aGF0IGlzIGNvcnJlY3QKKGluY2x1ZGluZyBjb3JyZWN0bHkgYWxpZ25lZCkgZm9y
IHN1Y2ggYW4gbHZhbHVlLgoKPiBJZiB0aGUgY29tcGlsZXIgY2FuIHNlZSAqKHVuYWxpZ25lZF9w
dHIgKikoY2hhciAqKWludF9wdHIgaXQgY2FuCj4gYXNzdW1lIHRoZSBhbGlnbm1lbnQgb2YgdGhl
ICdpbnRfcHRyJyBhbmQgZG8gYSBzaW5nbGUgYWxpZ25lZCBhY2Nlc3MuCgpJdCBpcyB1bmRlZmlu
ZWQgYmVoYXZpb3VyIHRvIGhhdmUgYW4gYWRkcmVzcyBpbiBpbnRfcHRyIHRoYXQgaXMgbm90CmNv
cnJlY3RseSBhbGlnbmVkIGZvciB3aGF0ZXZlciB0eXBlIGl0IHBvaW50cyB0by4KCgpTZWdoZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

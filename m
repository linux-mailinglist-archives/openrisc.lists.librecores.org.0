Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6BA478B71
	for <lists+openrisc@lfdr.de>; Fri, 17 Dec 2021 13:34:59 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CEFA92421E;
	Fri, 17 Dec 2021 13:34:58 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by mail.librecores.org (Postfix) with ESMTP id 1E493241F6
 for <openrisc@lists.librecores.org>; Fri, 17 Dec 2021 13:34:57 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-157-DNhCqrEmMiq0pBhWJMMNWw-1; Fri, 17 Dec 2021 12:34:55 +0000
X-MC-Unique: DNhCqrEmMiq0pBhWJMMNWw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Fri, 17 Dec 2021 12:34:53 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Fri, 17 Dec 2021 12:34:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Ard Biesheuvel
 <ardb@kernel.org>
Thread-Topic: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
Thread-Index: AQHX8q6cJnIWdY3H8E+V3sMdrqJgg6w2m38Q
Date: Fri, 17 Dec 2021 12:34:53 +0000
Message-ID: <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
 <20211216185620.GP614@gate.crashing.org>
In-Reply-To: <20211216185620.GP614@gate.crashing.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "Richard Russon
 \(FlatCap\)" <ldm@flatcap.org>, linux-m68k <linux-m68k@vger.kernel.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, "open list:BPF JIT for MIPS \(32-BIT AND
 64-BIT\)" <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "open
 list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonas Bonn <jonas@southpole.se>, Kees
 Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND
 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, Arnd
 Bergmann <arnd@kernel.org>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogU2VnaGVyIEJvZXNzZW5rb29sCj4gU2VudDogMTYgRGVjZW1iZXIgMjAyMSAxODo1Ngou
Li4KPiA+IFRoZSBvbmx5IHJlbWFpbmluZyBwcm9ibGVtIGhlcmUgaXMgcmVpbnRlcnByZXRpbmcg
YSBjaGFyKiBwb2ludGVyIHRvIGEKPiA+IHUzMiosIGUuZy4sIGZvciBhY2Nlc3NpbmcgdGhlIElQ
IGFkZHJlc3MgaW4gYW4gRXRoZXJuZXQgZnJhbWUgd2hlbgo+ID4gTkVUX0lQX0FMSUdOID09IDIs
IHdoaWNoIGNvdWxkIHN1ZmZlciBmcm9tIHRoZSBzYW1lIFVCIHByb2JsZW0gYWdhaW4sCj4gPiBh
cyBJIHVuZGVyc3RhbmQgaXQuCj4gCj4gVGhlIHByb2JsZW0gaXMgbmV2ZXIgY2FzdGluZyBhIHBv
aW50ZXIgdG8gcG9pbnRlciB0byBjaGFyYWN0ZXIgdHlwZSwgYW5kCj4gdGhlbiBsYXRlciBiYWNr
IHRvIGFuIGFwcHJpb3ByaWF0ZSBwb2ludGVyIHR5cGUuCj4gVGhlc2UgdGhpbmdzIGFyZSBib3Ro
IHJlcXVpcmVkIHRvIHdvcmsuCgpJIHRoaW5rIHRoYXQgaXMgdHJ1ZSBvZiAndm9pZCAqJywgbm90
ICdjaGFyIConLgonY2hhcicgaXMgc3BlY2lhbCBpbiB0aGF0ICdzdHJpY3QgYWxpYXNpbmcnIGRv
ZXNuJ3QgYXBwbHkgdG8gaXQuCihXaGljaCBpcyBhY3R1YWxseSBhIHBhaW4gc29tZXRpbWVzLikK
Cj4gVGhlIHByb2JsZW0gYWx3YXlzIGlzIGFjY2Vzc2luZyBzb21ldGhpbmcgYXMgaWYgaXQKPiB3
YXMgc29tZXRoaW5nIG9mIGFub3RoZXIgdHlwZSwgd2hpY2ggaXMgbm90IHZhbGlkIEMuICBUaGlz
IGhvd2V2ZXIgaXMKPiBleGFjdGx5IHdoYXQgLWZuby1zdHJpY3QtYWxpYXNpbmcgYWxsb3dzLCBz
byB0aGF0IHdvcmtzIGFzIHdlbGwuCgpJSVJDIHRoZSBDIGxhbmd1YWdlIG9ubHkgYWxsb3dzIHlv
dSB0byBoYXZlIHBvaW50ZXJzIHRvIHZhbGlkIGRhdGEgaXRlbXMuCihTaW5jZSB0aGV5IGNhbiBv
bmx5IGJlIGdlbmVyYXRlZCBieSB0aGUgJiBvcGVyYXRvciBvbiBhIHZhbGlkIGl0ZW0uKQpJbmRp
cmVjdGluZyBhbnkgb3RoZXIgcG9pbnRlciBpcyBwcm9iYWJseSBVQiEKClRoaXMgKHNvcnQgb2Yp
IGFsbG93cyB0aGUgY29tcGlsZXIgdG8gJ2xvb2sgdGhyb3VnaCcgY2FzdHMgdG8gZmluZAp3aGF0
IHRoZSBhY3R1YWwgdHlwZSBpcyAob3IgbWlnaHQgYmUpLgpJdCBjYW4gdGhlbiB1c2UgdGhhdCBp
bmZvcm1hdGlvbiB0byBtYWtlIG9wdGltaXNhdGlvbiBjaG9pY2VzLgpUaGlzIGhhcyBjYXVzZWQg
Z3JpZWYgd2l0aCBtZW1jcHkoKSBjYWxscyB0aGF0IGFyZSB0cnlpbmcgdG8gY29weQphIHN0cnVj
dHVyZSB0aGF0IHRoZSBjb2RlciBrbm93cyBpcyBtaXNhbGlnbmVkIHRvIGFuIGFsaWduZWQgYnVm
ZmVyLgoKU28gd2hpbGUgKih1bmFsaWduZWRfcHRyICopY2hhcl9wdHIgcHJvYmFibHkgaGFzIHRv
IHdvcmsuCklmIHRoZSBjb21waWxlciBjYW4gc2VlICoodW5hbGlnbmVkX3B0ciAqKShjaGFyICop
aW50X3B0ciBpdCBjYW4KYXNzdW1lIHRoZSBhbGlnbm1lbnQgb2YgdGhlICdpbnRfcHRyJyBhbmQg
ZG8gYSBzaW5nbGUgYWxpZ25lZCBhY2Nlc3MuCgoJRGF2aWQKCi0KUmVnaXN0ZXJlZCBBZGRyZXNz
IExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAx
UFQsIFVLClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

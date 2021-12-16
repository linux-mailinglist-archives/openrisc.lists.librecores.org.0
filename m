Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 30B25477C38
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 20:08:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CE6AB242DF;
	Thu, 16 Dec 2021 20:08:44 +0100 (CET)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTP id 59079242DF
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 20:08:42 +0100 (CET)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1BGIuSL3021510;
 Thu, 16 Dec 2021 12:56:28 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1BGIuLq7021509;
 Thu, 16 Dec 2021 12:56:21 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Dec 2021 12:56:20 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20211216185620.GP614@gate.crashing.org>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
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
Cc: linux-wireless@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>, X86 ML <x86@kernel.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, James Morris <jmorris@namei.org>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-m68k <linux-m68k@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Yoshinori Sato <ysato@users.osdn.me>,
 Russell King <linux@armlinux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Kalle Valo <kvalo@codeaurora.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonas Bonn <jonas@southpole.se>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Ganapathi Bhat <ganapathi017@gmail.com>,
 linux-block@vger.kernel.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@kernel.org>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, linux-security-module@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 johannes@sipsolutions.net,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMDY6Mjk6NDBQTSArMDEwMCwgQXJkIEJpZXNoZXV2ZWwg
d3JvdGU6Cj4gSSB0aGluayB0aGlzIHNlcmllcyBpcyBhIGh1Z2UgaW1wcm92ZW1lbnQsIGJ1dCBp
dCBkb2VzIG5vdCBzb2x2ZSB0aGUKPiBVQiBwcm9ibGVtIGNvbXBsZXRlbHkuIEFzIHdlIGZvdW5k
LCB0aGVyZSBhcmUgb3BlbiBpc3N1ZXMgaW4gdGhlIEdDQwo+IGJ1Z3ppbGxhIHJlZ2FyZGluZyBh
c3N1bXB0aW9ucyBpbiB0aGUgY29tcGlsZXIgdGhhdCBhbGlnbmVkIHF1YW50aXRpZXMKPiBlaXRo
ZXIgb3ZlcmxhcCBlbnRpcmVseSBvciBub3QgYXQgYWxsLiAoZS5nLiwKPiBodHRwczovL2djYy5n
bnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMDAzNjMpCgpUaGF0IGlzbid0IG9wZW4s
IGl0IHdhcyBjbG9zZWQgYXMgSU5WQUxJRCBiYWNrIGluIE1heS4KCihOYXR1cmFsbHkpIGFsaWdu
ZWQgcXVhbnRpdGllcyBvbmx5IG92ZXJsYXAgaWYgdGhleSBhcmUgdGhlIHNhbWUgZGF0dW0uClRo
aXMgZm9sbG93cyBkaXJlY3RseSBmcm9tIHRoZSBkZWZpbml0aW9uIG9mIChuYXR1cmFsbHkpIGFs
aWduZWQuICBUaGVyZQppcyBubyBteXN0ZXJ5IGhlcmUuCgpBbGwgdW5hbGlnbmVkIGRhdGEgbmVl
ZCB0byBiZSBtYXJrZWQgdXAgcHJvcGVybHkuCgo+IENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFM
SUdORURfQUNDRVNTIGlzIHVzZWQgaW4gbWFueSBwbGFjZXMgdG8KPiBjb25kaXRpb25hbGx5IGVt
aXQgY29kZSB0aGF0IHZpb2xhdGVzIEMgYWxpZ25tZW50IHJ1bGVzLgoKTW9zdCBvZiB0aGlzIGlz
IEFCSSwgbm90IEMuICBJdCBpcyB0aGUgQUJJIHRoYXQgcmVxdWlyZXMgY2VydGFpbgphbGlnbm1l
bnRzLiAgSWdub3JpbmcgdGhhdCBwbGFpbiBkb2VzIG5vdCB3b3JrLCBidXQgZXZlbiBpZiBpdCB3
b3VsZAp5b3Ugd2lsbCBlbmQgdXAgd2l0aCBtdWNoIHNsb3dlciBnZW5lcmF0ZWQgY29kZS4KCj4g
d2hlcmVhcyB0aGUgZm9sbG93aW5nIHBhdHRlcm4gbWFrZXMgbW9yZSBzZW5zZSwgSSB0aGluaywg
YW5kIGRvZXMgbm90Cj4gdmlvbGF0ZSBhbnkgQyBydWxlcyBpbiB0aGUgY29tbW9uIGNhc2U6Cj4g
Cj4gI2lmZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCj4gICAvLyB1
c2UgdW5hbGlnbmVkIGFjY2Vzc29ycywgd2hpY2ggYXJlIGNoZWFwIG9yIGV2ZW4gZW50aXJlbHkg
ZnJlZQo+ICNlbHNlCj4gICAvLyBhdm9pZCB1bmFsaWduZWQgYWNjZXNzb3JzLCBhcyB0aGV5IGFy
ZSBleHBlbnNpdmU7IGluc3RlYWQsIHJlb3JnYW5pemUKPiAgIC8vIHRoZSBkYXRhIHNvIHdlIGRv
bid0IG5lZWQgdGhlbSAoc2ltaWxhciB0byBzZXR0aW5nIE5FVF9JUF9BTElHTiB0byAyKQo+ICNl
bmRpZgoKWWVzLCB0aGlzIGxvb2tzIG1vcmUgcmVhc29uYWJsZS4KCj4gVGhlIG9ubHkgcmVtYWlu
aW5nIHByb2JsZW0gaGVyZSBpcyByZWludGVycHJldGluZyBhIGNoYXIqIHBvaW50ZXIgdG8gYQo+
IHUzMiosIGUuZy4sIGZvciBhY2Nlc3NpbmcgdGhlIElQIGFkZHJlc3MgaW4gYW4gRXRoZXJuZXQg
ZnJhbWUgd2hlbgo+IE5FVF9JUF9BTElHTiA9PSAyLCB3aGljaCBjb3VsZCBzdWZmZXIgZnJvbSB0
aGUgc2FtZSBVQiBwcm9ibGVtIGFnYWluLAo+IGFzIEkgdW5kZXJzdGFuZCBpdC4KClRoZSBwcm9i
bGVtIGlzIG5ldmVyIGNhc3RpbmcgYSBwb2ludGVyIHRvIHBvaW50ZXIgdG8gY2hhcmFjdGVyIHR5
cGUsIGFuZAp0aGVuIGxhdGVyIGJhY2sgdG8gYW4gYXBwcmlvcHJpYXRlIHBvaW50ZXIgdHlwZS4g
IFRoZXNlIHRoaW5ncyBhcmUgYm90aApyZXF1aXJlZCB0byB3b3JrLiAgVGhlIHByb2JsZW0gYWx3
YXlzIGlzIGFjY2Vzc2luZyBzb21ldGhpbmcgYXMgaWYgaXQKd2FzIHNvbWV0aGluZyBvZiBhbm90
aGVyIHR5cGUsIHdoaWNoIGlzIG5vdCB2YWxpZCBDLiAgVGhpcyBob3dldmVyIGlzCmV4YWN0bHkg
d2hhdCAtZm5vLXN0cmljdC1hbGlhc2luZyBhbGxvd3MsIHNvIHRoYXQgd29ya3MgYXMgd2VsbC4K
CkJ1dCB0aGlzIGRvZXMgbm90IGhhdmUgbXVjaCB0byBkbyB3aXRoIGFsaWdubWVudC4KCgpTZWdo
ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

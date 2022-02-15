Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 918CE4B6B7C
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 12:48:17 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EF9E224825;
	Tue, 15 Feb 2022 12:48:16 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 9797E24818
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 12:24:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7F21476;
 Tue, 15 Feb 2022 03:24:36 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160403F718;
 Tue, 15 Feb 2022 03:24:29 -0800 (PST)
Date: Tue, 15 Feb 2022 11:24:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <YguNamXeOtGVPyJf@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
X-Mailman-Approved-At: Tue, 15 Feb 2022 12:48:13 +0100
Subject: Re: [OpenRISC] [PATCH 08/14] arm64: simplify access_ok()
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 'Ard Biesheuvel' <ardb@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMDk6MzA6NDFBTSArMDAwMCwgRGF2aWQgTGFpZ2h0IHdy
b3RlOgo+IEZyb206IEFyZCBCaWVzaGV1dmVsCj4gPiBTZW50OiAxNSBGZWJydWFyeSAyMDIyIDA4
OjE4Cj4gPiAKPiA+IE9uIE1vbiwgMTQgRmViIDIwMjIgYXQgMTc6MzcsIEFybmQgQmVyZ21hbm4g
PGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+Cj4gPiA+Cj4gPiA+IGFybTY0IGhhcyBhbiBpbmxpbmUgYXNtIGltcGxl
bWVudGF0aW9uIG9mIGFjY2Vzc19vaygpIHRoYXQgaXMgZGVyaXZlZCBmcm9tCj4gPiA+IHRoZSAz
Mi1iaXQgYXJtIHZlcnNpb24gYW5kIG9wdGltaXplZCBmb3IgdGhlIGNhc2UgdGhhdCBib3RoIHRo
ZSBsaW1pdCBhbmQKPiA+ID4gdGhlIHNpemUgYXJlIHZhcmlhYmxlLiBXaXRoIHNldF9mcygpIGdv
bmUsIHRoZSBsaW1pdCBpcyBhbHdheXMgY29uc3RhbnQsCj4gPiA+IGFuZCB0aGUgc2l6ZSB1c3Vh
bGx5IGlzIGFzIHdlbGwsIHNvIGp1c3QgdXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24K
PiA+ID4gcmVkdWNlcyB0aGUgY2hlY2sgaW50byBhIGNvbXBhcmlzb24gYWdhaW5zdCBhIGNvbnN0
YW50IHRoYXQgY2FuIGJlCj4gPiA+IHNjaGVkdWxlZCBieSB0aGUgY29tcGlsZXIuCj4gPiA+Cj4g
PiA+IE9uIGEgZGVmY29uZmlnIGJ1aWxkLCB0aGlzIHNhdmVzIG92ZXIgMjhLQiBvZiAudGV4dC4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
PiA+ID4gLS0tCj4gPiA+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDI4ICsr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaAo+ID4gPiBpbmRleCAzNTdmN2JkOWM5ODEuLmU4ZGNlMGNjNWVhYSAxMDA2NDQKPiA+ID4g
LS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiA+ID4gKysrIGIvYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiA+ID4gQEAgLTI2LDYgKzI2LDggQEAKPiA+ID4g
ICNpbmNsdWRlIDxhc20vbWVtb3J5Lmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2V4dGFibGUuaD4K
PiA+ID4KPiA+ID4gK3N0YXRpYyBpbmxpbmUgaW50IF9fYWNjZXNzX29rKGNvbnN0IHZvaWQgX191
c2VyICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gPiA+ICsKPiA+ID4gIC8qCj4gPiA+ICAg
KiBUZXN0IHdoZXRoZXIgYSBibG9jayBvZiBtZW1vcnkgaXMgYSB2YWxpZCB1c2VyIHNwYWNlIGFk
ZHJlc3MuCj4gPiA+ICAgKiBSZXR1cm5zIDEgaWYgdGhlIHJhbmdlIGlzIHZhbGlkLCAwIG90aGVy
d2lzZS4KPiA+ID4gQEAgLTMzLDEwICszNSw4IEBACj4gPiA+ICAgKiBUaGlzIGlzIGVxdWl2YWxl
bnQgdG8gdGhlIGZvbGxvd2luZyB0ZXN0Ogo+ID4gPiAgICogKHU2NSlhZGRyICsgKHU2NSlzaXpl
IDw9ICh1NjUpVEFTS19TSVpFX01BWAo+ID4gPiAgICovCj4gPiA+IC1zdGF0aWMgaW5saW5lIHVu
c2lnbmVkIGxvbmcgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVk
IGxvbmcgc2l6ZSkKPiA+ID4gK3N0YXRpYyBpbmxpbmUgaW50IGFjY2Vzc19vayhjb25zdCB2b2lk
IF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQo+ID4gPiAgewo+ID4gPiAtICAgICAg
IHVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9IFRBU0tfU0laRV9NQVggLSAxOwo+ID4gPiAtCj4g
PiA+ICAgICAgICAgLyoKPiA+ID4gICAgICAgICAgKiBBc3luY2hyb25vdXMgSS9PIHJ1bm5pbmcg
aW4gYSBrZXJuZWwgdGhyZWFkIGRvZXMgbm90IGhhdmUgdGhlCj4gPiA+ICAgICAgICAgICogVElG
X1RBR0dFRF9BRERSIGZsYWcgb2YgdGhlIHByb2Nlc3Mgb3duaW5nIHRoZSBtbSwgc28gYWx3YXlz
IHVudGFnCj4gPiA+IEBAIC00NiwyNyArNDYsOSBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxv
bmcgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsIHVuc2lnbmVkIGxvbmcgcwo+
ID4gPiAgICAgICAgICAgICAoY3VycmVudC0+ZmxhZ3MgJiBQRl9LVEhSRUFEIHx8IHRlc3RfdGhy
ZWFkX2ZsYWcoVElGX1RBR0dFRF9BRERSKSkpCj4gPiA+ICAgICAgICAgICAgICAgICBhZGRyID0g
dW50YWdnZWRfYWRkcihhZGRyKTsKPiA+ID4KPiA+ID4gLSAgICAgICBfX2Noa191c2VyX3B0cihh
ZGRyKTsKPiA+ID4gLSAgICAgICBhc20gdm9sYXRpbGUoCj4gPiA+IC0gICAgICAgLy8gQSArIEIg
PD0gQyArIDEgZm9yIGFsbCBBLEIsQywgaW4gZm91ciBlYXN5IHN0ZXBzOgo+ID4gPiAtICAgICAg
IC8vIDE6IFggPSBBICsgQjsgWCcgPSBYICUgMl42NAo+ID4gPiAtICAgICAgICIgICAgICAgYWRk
cyAgICAlMCwgJTMsICUyXG4iCj4gPiA+IC0gICAgICAgLy8gMjogU2V0IEMgPSAwIGlmIFggPiAy
XjY0LCB0byBndWFyYW50ZWUgWCcgPiBDIGluIHN0ZXAgNAo+ID4gPiAtICAgICAgICIgICAgICAg
Y3NlbCAgICAlMSwgeHpyLCAlMSwgaGlcbiIKPiA+ID4gLSAgICAgICAvLyAzOiBTZXQgWCcgPSB+
MCBpZiBYID49IDJeNjQuIEZvciBYID09IDJeNjQsIHRoaXMgZGVjcmVtZW50cyBYJwo+ID4gPiAt
ICAgICAgIC8vICAgIHRvIGNvbXBlbnNhdGUgZm9yIHRoZSBjYXJyeSBmbGFnIGJlaW5nIHNldCBp
biBzdGVwIDQuIEZvcgo+ID4gPiAtICAgICAgIC8vICAgIFggPiAyXjY0LCBYJyBtZXJlbHkgaGFz
IHRvIHJlbWFpbiBub256ZXJvLCB3aGljaCBpdCBkb2VzLgo+ID4gPiAtICAgICAgICIgICAgICAg
Y3NpbnYgICAlMCwgJTAsIHh6ciwgY2NcbiIKPiA+ID4gLSAgICAgICAvLyA0OiBGb3IgWCA8IDJe
NjQsIHRoaXMgZ2l2ZXMgdXMgWCcgLSBDIC0gMSA8PSAwLCB3aGVyZSB0aGUgLTEKPiA+ID4gLSAg
ICAgICAvLyAgICBjb21lcyBmcm9tIHRoZSBjYXJyeSBpbiBiZWluZyBjbGVhci4gT3RoZXJ3aXNl
LCB3ZSBhcmUKPiA+ID4gLSAgICAgICAvLyAgICB0ZXN0aW5nIFgnIC0gQyA9PSAwLCBzdWJqZWN0
IHRvIHRoZSBwcmV2aW91cyBhZGp1c3RtZW50cy4KPiA+ID4gLSAgICAgICAiICAgICAgIHNiY3Mg
ICAgeHpyLCAlMCwgJTFcbiIKPiA+ID4gLSAgICAgICAiICAgICAgIGNzZXQgICAgJTAsIGxzXG4i
Cj4gPiA+IC0gICAgICAgOiAiPSZyIiAocmV0KSwgIityIiAobGltaXQpIDogIklyIiAoc2l6ZSks
ICIwIiAoYWRkcikgOiAiY2MiKTsKPiA+ID4gLQo+ID4gPiAtICAgICAgIHJldHVybiByZXQ7Cj4g
PiA+ICsgICAgICAgcmV0dXJuIGxpa2VseShfX2FjY2Vzc19vayhhZGRyLCBzaXplKSk7Cj4gPiA+
ICB9Cj4gPiA+IC0jZGVmaW5lIF9fYWNjZXNzX29rIF9fYWNjZXNzX29rCj4gPiA+ICsjZGVmaW5l
IGFjY2Vzc19vayBhY2Nlc3Nfb2sKPiA+ID4KPiA+ID4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9h
Y2Nlc3Nfb2suaD4KPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4yOS4yCj4gPiA+Cj4gPiAKPiA+IFdp
dGggc2V0X2ZzKCkgb3V0IG9mIHRoZSBwaWN0dXJlLCB3b3VsZG4ndCBpdCBiZSBzdWZmaWNpZW50
IHRvIGNoZWNrCj4gPiB0aGF0IGJpdCAjNTUgaXMgY2xlYXI/ICh0aGUgYml0IHRoYXQgc2VsZWN0
cyBiZXR3ZWVuIFRUQlIwIGFuZCBUVEJSMSkKPiA+IFRoYXQgd291bGQgYWxzbyByZW1vdmUgdGhl
IG5lZWQgdG8gc3RyaXAgdGhlIHRhZyBmcm9tIHRoZSBhZGRyZXNzLgo+ID4gCj4gPiBTb21ldGhp
bmcgbGlrZQo+ID4gCj4gPiAgICAgYXNtIGdvdG8oInRibnogICUwLCAjNTUsICUyICAgICBcbiIK
PiA+ICAgICAgICAgICAgICAidGJueiAgJTEsICM1NSwgJTIgICAgIFxuIgo+ID4gICAgICAgICAg
ICAgIDo6ICJyIihhZGRyKSwgInIiKGFkZHIgKyBzaXplIC0gMSkgOjogbm90b2spOwo+ID4gICAg
IHJldHVybiAxOwo+ID4gbm90b2s6Cj4gPiAgICAgcmV0dXJuIDA7Cj4gPiAKPiA+IHdpdGggYW4g
YWRkaXRpb25hbCBzYW5pdHkgY2hlY2sgb24gdGhlIHNpemUgd2hpY2ggdGhlIGNvbXBpbGVyIGNv
dWxkCj4gPiBlbGltaW5hdGUgZm9yIGNvbXBpbGUtdGltZSBjb25zdGFudCB2YWx1ZXMuCj4gCj4g
SXMgdGhlcmUgYXJlIHJlYXNvbiBub3QgdG8ganVzdCB1c2U6Cj4gCXNpemUgPCAxdSA8PCA0OCAm
JiAhKChhZGRyIHwgKGFkZHIgKyBzaXplIC0gMSkpICYgMXUgPDwgNTUpCgpUaGF0IGhhcyBhIGZl
dyBwcm9ibGVtcywgaW5jbHVkaW5nIGJlaW5nIGFuIEFCSSBjaGFuZ2UgZm9yIHRhc2tzIG5vdCB1
c2luZyB0aGUKcmVsYXhlZCB0YWcgQUJJIGFuZCBub3Qgd29ya2luZyBmb3IgNTItYml0IFZBcy4K
CklmIHdlIHJlYWxseSB3YW50IHRvIHJlbGF4IHRoZSB0YWcgY2hlY2tpbmcgYXNwZWN0LCB0aGVy
ZSBhcmUgc2ltcGxlciBvcHRpb25zLAppbmNsdWRpbmcgdmFyaWF0aW9ucyBvbiBBcmQncyBhcHBy
b2FjaCBhYm92ZS4KCj4gVWdnLCBpcyBhcm02NCBhZGRyZXNzaW5nIGFzIGhvcnJpZCBhcyBpdCBs
b29rcyAtIHdpdGggdGhlICdrZXJuZWwnCj4gYml0IGluIHRoZSBtaWRkbGUgb2YgdGhlIHZpcnR1
YWwgYWRkcmVzcyBzcGFjZT8KCkl0J3MganVzdCBzaWduLWV4dGVuc2lvbi9jYW5vbmljYWwgYWRk
cmVzc2luZywgZXhjZXB0IGJpdHMgWzYzOjU2XSBhcmUKY29uZmlndXJhYmxlIGJldHdlZW4gYSBm
ZXcgdXNlcywgc28gdGhlIGFjaGl0ZWN0dXJlIHNheXMgYml0IDU1IGlzIHRoZSBvbmUgdG8KbG9v
ayBhdCBpbiBhbGwgY29uZmlndXJhdGlvbnMgdG8gZmlndXJlIG91dCBpZiBhbiBhZGRyZXNzIGlz
IGhpZ2gvbG93IChpbgphZGRpdGlvbiB0byBjaGVja2luZyB0aGUgcmVtYWluaW5nIGJpdHMgYXJl
IGNhbm9uaWNhbCkuCgpUaGFua3MsCk1hcmsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

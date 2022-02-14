Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CCD914B5BFC
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 22:07:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6367624806;
	Mon, 14 Feb 2022 22:07:14 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id B4D9424792
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 22:07:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB93139F;
 Mon, 14 Feb 2022 13:07:11 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A689F3F718;
 Mon, 14 Feb 2022 13:07:04 -0800 (PST)
Message-ID: <cc6006c6-b073-7cc0-484d-7ddd193a8c2c@arm.com>
Date: Mon, 14 Feb 2022 21:06:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220214163452.1568807-9-arnd@kernel.org>
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 linux-mips@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMjAyMi0wMi0xNCAxNjozNCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IGFybTY0IGhhcyBhbiBpbmxpbmUgYXNtIGltcGxl
bWVudGF0aW9uIG9mIGFjY2Vzc19vaygpIHRoYXQgaXMgZGVyaXZlZCBmcm9tCj4gdGhlIDMyLWJp
dCBhcm0gdmVyc2lvbiBhbmQgb3B0aW1pemVkIGZvciB0aGUgY2FzZSB0aGF0IGJvdGggdGhlIGxp
bWl0IGFuZAo+IHRoZSBzaXplIGFyZSB2YXJpYWJsZS4gV2l0aCBzZXRfZnMoKSBnb25lLCB0aGUg
bGltaXQgaXMgYWx3YXlzIGNvbnN0YW50LAo+IGFuZCB0aGUgc2l6ZSB1c3VhbGx5IGlzIGFzIHdl
bGwsIHNvIGp1c3QgdXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24KPiByZWR1Y2VzIHRo
ZSBjaGVjayBpbnRvIGEgY29tcGFyaXNvbiBhZ2FpbnN0IGEgY29uc3RhbnQgdGhhdCBjYW4gYmUK
PiBzY2hlZHVsZWQgYnkgdGhlIGNvbXBpbGVyLgoKQXd3LCBJIHN0aWxsIHZpdmlkbHkgcmVtZW1i
ZXIgdGhlIGJpcnRoIG9mIHRoaXMgbWFkbmVzcywgc2F0IHdpdGggbXkgCnBob25lIG9uIGEgU2F0
dXJkYXkgbW9ybmluZyB3YWl0aW5nIGZvciBteSBiaWtlIHRvIGJlIE1PVCdkLCBzdGFyaW5nIGF0
IAp0aGUgNy1pbnN0cnVjdGlvbiBzZXF1ZW5jZSB0aGF0IE1hcmsgYW5kIEkgaGFkIGNvbWUgdXAg
d2l0aCBhbmQgY2VydGFpbiAKdGhhdCBpdCBjb3VsZCBiZSBzaG9ydGVuZWQgc3RpbGwuIEtpbmRh
IHNhZCB0byBzZWUgaXQgZ28sIGJ1dCBhdCB0aGUgCnNhbWUgdGltZSwgZ2xhZCB0aGF0IGl0IGNh
bi4KCkFja2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgoKPiBPbiBh
IGRlZmNvbmZpZyBidWlsZCwgdGhpcyBzYXZlcyBvdmVyIDI4S0Igb2YgLnRleHQuCgpOb3QgdG8g
bWVudGlvbiBzYXZpbmcgdGhvc2UgIldURiBpcyBnb2luZyBvbiB0aGVyZS4uLiBvaCB5ZWFoLCAK
YWNjZXNzX29rKCkiIG1vbWVudHMgd2hlbiBsb29raW5nIHRocm91Z2ggZGlzYXNzZW1ibHkgOikK
CkNoZWVycywKUm9iaW4uCgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gLS0tCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDI4ICsr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1
ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4gaW5k
ZXggMzU3ZjdiZDljOTgxLi5lOGRjZTBjYzVlYWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nl
c3MuaAo+IEBAIC0yNiw2ICsyNiw4IEBACj4gICAjaW5jbHVkZSA8YXNtL21lbW9yeS5oPgo+ICAg
I2luY2x1ZGUgPGFzbS9leHRhYmxlLmg+Cj4gICAKPiArc3RhdGljIGlubGluZSBpbnQgX19hY2Nl
c3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKnB0ciwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiArCj4g
ICAvKgo+ICAgICogVGVzdCB3aGV0aGVyIGEgYmxvY2sgb2YgbWVtb3J5IGlzIGEgdmFsaWQgdXNl
ciBzcGFjZSBhZGRyZXNzLgo+ICAgICogUmV0dXJucyAxIGlmIHRoZSByYW5nZSBpcyB2YWxpZCwg
MCBvdGhlcndpc2UuCj4gQEAgLTMzLDEwICszNSw4IEBACj4gICAgKiBUaGlzIGlzIGVxdWl2YWxl
bnQgdG8gdGhlIGZvbGxvd2luZyB0ZXN0Ogo+ICAgICogKHU2NSlhZGRyICsgKHU2NSlzaXplIDw9
ICh1NjUpVEFTS19TSVpFX01BWAo+ICAgICovCj4gLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyBfX2FjY2Vzc19vayhjb25zdCB2b2lkIF9fdXNlciAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXpl
KQo+ICtzdGF0aWMgaW5saW5lIGludCBhY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIs
IHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgIHsKPiAtCXVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9
IFRBU0tfU0laRV9NQVggLSAxOwo+IC0KPiAgIAkvKgo+ICAgCSAqIEFzeW5jaHJvbm91cyBJL08g
cnVubmluZyBpbiBhIGtlcm5lbCB0aHJlYWQgZG9lcyBub3QgaGF2ZSB0aGUKPiAgIAkgKiBUSUZf
VEFHR0VEX0FERFIgZmxhZyBvZiB0aGUgcHJvY2VzcyBvd25pbmcgdGhlIG1tLCBzbyBhbHdheXMg
dW50YWcKPiBAQCAtNDYsMjcgKzQ2LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9f
YWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHMKPiAgIAkg
ICAgKGN1cnJlbnQtPmZsYWdzICYgUEZfS1RIUkVBRCB8fCB0ZXN0X3RocmVhZF9mbGFnKFRJRl9U
QUdHRURfQUREUikpKQo+ICAgCQlhZGRyID0gdW50YWdnZWRfYWRkcihhZGRyKTsKPiAgIAo+IC0J
X19jaGtfdXNlcl9wdHIoYWRkcik7Cj4gLQlhc20gdm9sYXRpbGUoCj4gLQkvLyBBICsgQiA8PSBD
ICsgMSBmb3IgYWxsIEEsQixDLCBpbiBmb3VyIGVhc3kgc3RlcHM6Cj4gLQkvLyAxOiBYID0gQSAr
IEI7IFgnID0gWCAlIDJeNjQKPiAtCSIJYWRkcwklMCwgJTMsICUyXG4iCj4gLQkvLyAyOiBTZXQg
QyA9IDAgaWYgWCA+IDJeNjQsIHRvIGd1YXJhbnRlZSBYJyA+IEMgaW4gc3RlcCA0Cj4gLQkiCWNz
ZWwJJTEsIHh6ciwgJTEsIGhpXG4iCj4gLQkvLyAzOiBTZXQgWCcgPSB+MCBpZiBYID49IDJeNjQu
IEZvciBYID09IDJeNjQsIHRoaXMgZGVjcmVtZW50cyBYJwo+IC0JLy8gICAgdG8gY29tcGVuc2F0
ZSBmb3IgdGhlIGNhcnJ5IGZsYWcgYmVpbmcgc2V0IGluIHN0ZXAgNC4gRm9yCj4gLQkvLyAgICBY
ID4gMl42NCwgWCcgbWVyZWx5IGhhcyB0byByZW1haW4gbm9uemVybywgd2hpY2ggaXQgZG9lcy4K
PiAtCSIJY3NpbnYJJTAsICUwLCB4enIsIGNjXG4iCj4gLQkvLyA0OiBGb3IgWCA8IDJeNjQsIHRo
aXMgZ2l2ZXMgdXMgWCcgLSBDIC0gMSA8PSAwLCB3aGVyZSB0aGUgLTEKPiAtCS8vICAgIGNvbWVz
IGZyb20gdGhlIGNhcnJ5IGluIGJlaW5nIGNsZWFyLiBPdGhlcndpc2UsIHdlIGFyZQo+IC0JLy8g
ICAgdGVzdGluZyBYJyAtIEMgPT0gMCwgc3ViamVjdCB0byB0aGUgcHJldmlvdXMgYWRqdXN0bWVu
dHMuCj4gLQkiCXNiY3MJeHpyLCAlMCwgJTFcbiIKPiAtCSIJY3NldAklMCwgbHNcbiIKPiAtCTog
Ij0mciIgKHJldCksICIrciIgKGxpbWl0KSA6ICJJciIgKHNpemUpLCAiMCIgKGFkZHIpIDogImNj
Iik7Cj4gLQo+IC0JcmV0dXJuIHJldDsKPiArCXJldHVybiBsaWtlbHkoX19hY2Nlc3Nfb2soYWRk
ciwgc2l6ZSkpOwo+ICAgfQo+IC0jZGVmaW5lIF9fYWNjZXNzX29rIF9fYWNjZXNzX29rCj4gKyNk
ZWZpbmUgYWNjZXNzX29rIGFjY2Vzc19vawo+ICAgCj4gICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMv
YWNjZXNzX29rLmg+Cj4gICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E38724BB200
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 07:29:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 70B1124852;
	Fri, 18 Feb 2022 07:29:00 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id A1A9D24851
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:28:58 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A3FF967373; Fri, 18 Feb 2022 07:28:52 +0100 (CET)
Date: Fri, 18 Feb 2022 07:28:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220218062851.GC22576@lst.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-6-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org,
 Christoph Hellwig <hch@infradead.org>, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDI6MTM6MTlQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRoZSBfX3Jh
bmdlX25vdF9vaygpIGhlbHBlciBpcyBhbiB4ODYgKGFuZCBzcGFyYzY0KSBzcGVjaWZpYyBpbnRl
cmZhY2UKPiB0aGF0IGRvZXMgcm91Z2hseSB0aGUgc2FtZSB0aGluZyBhcyBfX2FjY2Vzc19vaygp
LCBidXQgd2l0aCBkaWZmZXJlbnQKPiBjYWxsaW5nIGNvbnZlbnRpb25zLgo+IAo+IENoYW5nZSB0
aGlzIHRvIHVzZSB0aGUgbm9ybWFsIGludGVyZmFjZSBpbiBvcmRlciBmb3IgY29uc2lzdGVuY3kg
YXMgd2UKPiBjbGVhbiB1cCBhbGwgYWNjZXNzX29rKCkgaW1wbGVtZW50YXRpb25zLgo+IAo+IFRo
aXMgY2hhbmdlcyB0aGUgbGltaXQgZnJvbSBUQVNLX1NJWkUgdG8gVEFTS19TSVpFX01BWCwgd2hp
Y2ggQWwgcG9pbnRzCj4gb3V0IGlzIHRoZSByaWdodCB0aGluZyBkbyBkbyBoZXJlIGFueXdheS4K
PiAKPiBUaGUgY2FsbGVycyBoYXZlIHRvIHVzZSBfX2FjY2Vzc19vaygpIGluc3RlYWQgb2YgdGhl
IG5vcm1hbCBhY2Nlc3Nfb2soKQo+IHRob3VnaCwgYmVjYXVzZSBvbiB4ODYgdGhhdCBjb250YWlu
cyBhIFdBUk5fT05fSU5fSVJRKCkgY2hlY2sgdGhhdCBjYW5ub3QKPiBiZSB1c2VkIGluc2lkZSBv
ZiBOTUkgY29udGV4dCB3aGlsZSB0cmFjaW5nLgo+IAo+IFN1Z2dlc3RlZC1ieTogQWwgVmlybyA8
dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+Cj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC9ZZ3NVS2NYR1I3cjRuSU5qQHplbml2LWNhLmxpbnV4Lm9yZy51ay8KPiBTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBhcmNoL3g4Ni9ldmVudHMv
Y29yZS5jICAgICAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgg
fCAxMCArKysrKystLS0tCj4gIGFyY2gveDg2L2tlcm5lbC9kdW1wc3RhY2suYyAgICB8ICAyICst
Cj4gIGFyY2gveDg2L2tlcm5lbC9zdGFja3RyYWNlLmMgICB8ICAyICstCj4gIGFyY2gveDg2L2xp
Yi91c2VyY29weS5jICAgICAgICB8ICAyICstCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvZXZlbnRz
L2NvcmUuYyBiL2FyY2gveDg2L2V2ZW50cy9jb3JlLmMKPiBpbmRleCBlNjg2YzVlMDUzN2IuLmVl
ZjgxNmZjMjE2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9ldmVudHMvY29yZS5jCj4gKysrIGIv
YXJjaC94ODYvZXZlbnRzL2NvcmUuYwo+IEBAIC0yNzk0LDcgKzI3OTQsNyBAQCBwZXJmX2NhbGxj
aGFpbl9rZXJuZWwoc3RydWN0IHBlcmZfY2FsbGNoYWluX2VudHJ5X2N0eCAqZW50cnksIHN0cnVj
dCBwdF9yZWdzICpyZQo+ICBzdGF0aWMgaW5saW5lIGludAo+ICB2YWxpZF91c2VyX2ZyYW1lKGNv
bnN0IHZvaWQgX191c2VyICpmcCwgdW5zaWduZWQgbG9uZyBzaXplKQo+ICB7Cj4gLQlyZXR1cm4g
KF9fcmFuZ2Vfbm90X29rKGZwLCBzaXplLCBUQVNLX1NJWkUpID09IDApOwo+ICsJcmV0dXJuIF9f
YWNjZXNzX29rKGZwLCBzaXplKTsKPiAgfQoKdmFsaWRfdXNlcl9mcmFtZSBqdXN0IG5lZWQgdG8g
Z28gYXdheSBhbmQgdGhlIGZvbGxvd2luZyBfX2dldF91c2VyIGNhbGxzCnJlcGxhY2VkIHdpdGgg
bm9ybWFsIGdldF91c2VyIG9uZXMuCgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvZHVt
cHN0YWNrLmMgYi9hcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmMKPiBpbmRleCA1M2RlMDQ0ZTU2
NTQuLmRhNTM0ZmI3YjVjNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNr
LmMKPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvZHVtcHN0YWNrLmMKPiBAQCAtODUsNyArODUsNyBA
QCBzdGF0aWMgaW50IGNvcHlfY29kZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdTggKmJ1ZiwgdW5z
aWduZWQgbG9uZyBzcmMsCj4gIAkgKiBNYWtlIHN1cmUgdXNlcnNwYWNlIGlzbid0IHRyeWluZyB0
byB0cmljayB1cyBpbnRvIGR1bXBpbmcga2VybmVsCj4gIAkgKiBtZW1vcnkgYnkgcG9pbnRpbmcg
dGhlIHVzZXJzcGFjZSBpbnN0cnVjdGlvbiBwb2ludGVyIGF0IGl0Lgo+ICAJICovCj4gLQlpZiAo
X19jaGtfcmFuZ2Vfbm90X29rKHNyYywgbmJ5dGVzLCBUQVNLX1NJWkVfTUFYKSkKPiArCWlmICgh
X19hY2Nlc3Nfb2soKHZvaWQgX191c2VyICopc3JjLCBuYnl0ZXMpKQo+ICAJCXJldHVybiAtRUlO
VkFMOwoKVGhpcyBvbmUgaXMgbm90IG5lZWRlZCBhdCBhbGwgYXMgY29weV9mcm9tX3VzZXJfbm1p
IGFscmVhZHkgY2hlY2tzIHRoZQphY2Nlc3MgcmFuZ2UuCgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC94ODYva2VybmVsL3N0YWNrdHJhY2UuYwo+IGlu
ZGV4IDE1YjA1OGVlZmM0ZS4uZWUxMTdmY2Y0NmVkIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2tl
cm5lbC9zdGFja3RyYWNlLmMKPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc3RhY2t0cmFjZS5jCj4g
QEAgLTkwLDcgKzkwLDcgQEAgY29weV9zdGFja19mcmFtZShjb25zdCBzdHJ1Y3Qgc3RhY2tfZnJh
bWVfdXNlciBfX3VzZXIgKmZwLAo+ICB7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCWlmIChfX3Jhbmdl
X25vdF9vayhmcCwgc2l6ZW9mKCpmcmFtZSksIFRBU0tfU0laRSkpCj4gKwlpZiAoIV9fYWNjZXNz
X29rKGZwLCBzaXplb2YoKmZyYW1lKSkpCj4gIAkJcmV0dXJuIDA7CgpKdXN0IHN3aXRjaCB0aGUg
X19nZXRfdXNlciBjYWxscyBiZWxvdyB0byBnZXRfdXNlciBpbnN0ZWFkLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

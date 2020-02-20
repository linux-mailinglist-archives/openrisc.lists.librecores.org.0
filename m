Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EE82D17175B
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D76462098E;
	Thu, 27 Feb 2020 13:35:28 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 718DE207EE
 for <openrisc@lists.librecores.org>; Thu, 20 Feb 2020 18:21:40 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A769931B;
 Thu, 20 Feb 2020 09:21:38 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3533A3F68F;
 Thu, 20 Feb 2020 09:21:37 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <502fa745-ddad-f91b-52bc-52edecf8fdbc@arm.com>
Date: Thu, 20 Feb 2020 17:21:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220170139.387354-2-hch@lst.de>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 1/2] dma-mapping: support setting memory
 uncached in place
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMjAvMDIvMjAyMCA1OjAxIHBtLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBXZSBjdXJy
ZW50bHkgb25seSBzdXBwb3J0IHJlbWFwcGluZyBtZW1vcnkgYXMgdW5jYWNoZWQgdGhyb3VnaCB2
bWFwCj4gb3IgYSBtYWdpYyB1bmNhY2hlZCBzZWdtZW50IHByb3ZpZGVkIGJ5IHNvbWUgYXJjaGl0
ZWN0dXJlcy4gIEJ1dCB0aGVyZQo+IGlzIGEgc2ltcGxlciBhbmQgbXVjaCBiZXR0ZXIgd2F5IGF2
YWlsYWJsZSBvbiBzb21lIGFyY2hpdGVjdHVyZXMgd2hlcmUKPiB3ZSBjYW4ganVzdCByZW1hcCB0
aGUgbWVtb3J5IGluIHBsYWNlLiAgVGhlIGFkdmFudGFnZXMgYXJlOgo+IAo+ICAgMSkgbm8gYWxp
YXNpbmcgaXMgcG9zc2libGUsIHdoaWNoIHByZXZlbnRzIHNwZWN1bGF0aW5nIGludG8gdGhlCj4g
ICAgICBjYWNoZWQgYWxpYXMKPiAgIDIpIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWxsb2NhdGUgbmV3
IHB0ZXMgYW5kIHRodXMgbm8gbmVlZCBmb3IgYSBzcGVjaWFsCj4gICAgICBwcmUtYWxsb2NhdGVk
IHBvb2wgb2YgbWVtb3J5IHRoYXQgY2FuIGJlIHVzZWQgd2l0aCBHRlBfQVRPTUlDIERNQQo+ICAg
ICAgYWxsb2NhdGlvbnMKPiAKPiBUaGUgZG93bnNpZGUgaXMgdGhhdCBhcmNoaXRlY3R1cmVzIG11
c3QgcHJvdmlkZSBhIHdheSB0byBzZXQgYXJiaXRyYXJ5Cj4gcGFnZXMgdW5jYWNoZWQgaW4gdGhl
IGtlcm5lbCBtYXBwaW5nLCB3aGljaCBtaWdodCBub3QgYmUgcG9zc2libGUgb24KPiBhcmNoaXRl
Y3R1cmUgdGhhdCBoYXZlIGEgc3BlY2lhbCBpbXBsaWNpdCBrZXJuZWwgbWFwcGluZywgYW5kIHJl
cXVpcmVzCj4gc3BsaXR0aW5nIG9mIGh1Z2UgcGFnZSBrZXJuZWwgbWFwcGluZ3Mgd2hlcmUgdGhl
eSBleGlzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmggfCAgMyArKysKPiAg
IGtlcm5lbC9kbWEvS2NvbmZpZyAgICAgICAgICAgICAgfCAgOCArKysrKysrKwo+ICAga2VybmVs
L2RtYS9kaXJlY3QuYyAgICAgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmggYi9pbmNs
dWRlL2xpbnV4L2RtYS1ub25jb2hlcmVudC5oCj4gaW5kZXggY2E5YjU3NzBjYWVlLi4wODIwZWM1
OGYxMTkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtbm9uY29oZXJlbnQuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmgKPiBAQCAtMTExLDQgKzExMSw3IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2RtYV9wcmVwX2NvaGVyZW50KHN0cnVjdCBwYWdlICpw
YWdlLCBzaXplX3Qgc2l6ZSkKPiAgIHZvaWQgKnVuY2FjaGVkX2tlcm5lbF9hZGRyZXNzKHZvaWQg
KmFkZHIpOwo+ICAgdm9pZCAqY2FjaGVkX2tlcm5lbF9hZGRyZXNzKHZvaWQgKmFkZHIpOwo+ICAg
Cj4gK2ludCBhcmNoX2RtYV9zZXRfdW5jYWNoZWQodm9pZCAqY3B1X2FkZHIsIHNpemVfdCBzaXpl
KTsKPiArdm9pZCBhcmNoX2RtYV9jbGVhcl91bmNhY2hlZCh2b2lkICpjcHVfYWRkciwgc2l6ZV90
IHNpemUpOwo+ICsKPiAgICNlbmRpZiAvKiBfTElOVVhfRE1BX05PTkNPSEVSRU5UX0ggKi8KPiBk
aWZmIC0tZ2l0IGEva2VybmVsL2RtYS9LY29uZmlnIGIva2VybmVsL2RtYS9LY29uZmlnCj4gaW5k
ZXggNGMxMDNhMjRlMzgwLi43YmMwYjc3ZjEyNDMgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2RtYS9L
Y29uZmlnCj4gKysrIGIva2VybmVsL2RtYS9LY29uZmlnCj4gQEAgLTgzLDYgKzgzLDE0IEBAIGNv
bmZpZyBETUFfRElSRUNUX1JFTUFQCj4gICAJYm9vbAo+ICAgCXNlbGVjdCBETUFfUkVNQVAKPiAg
IAo+ICsjCj4gKyMgU2hvdWxkIGJlIHNlbGVjdGVkIGlmIHRoZSBhcmNoaXRlY3R1cmUgY2FuIHJl
bWFwIG1lbW9yeSBmcm9tIHRoZSBwYWdlCj4gKyMgYWxsb2NhdG9yIGFuZCBDTUEgYXMgdW5jYWNo
ZWQgYW5kIHByb3ZpZGVzIHRoZSBhcmNoX2RtYV9zZXRfdW5jYWNoZWQgYW5kCj4gKyMgYXJjaF9k
bWFfY2xlYXJfdW5jYWNoZWQgaGVscGVycwo+ICsjCj4gK2NvbmZpZyBBUkNIX0hBU19ETUFfU0VU
X1VOQ0FDSEVECj4gKwlib29sCj4gKwo+ICAgY29uZmlnIERNQV9DTUEKPiAgIAlib29sICJETUEg
Q29udGlndW91cyBNZW1vcnkgQWxsb2NhdG9yIgo+ICAgCWRlcGVuZHMgb24gSEFWRV9ETUFfQ09O
VElHVU9VUyAmJiBDTUEKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9kaXJlY3QuYyBiL2tlcm5l
bC9kbWEvZGlyZWN0LmMKPiBpbmRleCA2YWY3YWU4M2M0YWQuLjczZmU2NWE0Y2JjMCAxMDA2NDQK
PiAtLS0gYS9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gKysrIGIva2VybmVsL2RtYS9kaXJlY3QuYwo+
IEBAIC0xNjksMTEgKzE2OSw4IEBAIHZvaWQgKmRtYV9kaXJlY3RfYWxsb2NfcGFnZXMoc3RydWN0
IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgIAkJcmV0ID0gZG1hX2NvbW1vbl9jb250aWd1
b3VzX3JlbWFwKHBhZ2UsIFBBR0VfQUxJR04oc2l6ZSksCj4gICAJCQkJZG1hX3BncHJvdChkZXYs
IFBBR0VfS0VSTkVMLCBhdHRycyksCj4gICAJCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNzKDAp
KTsKPiAtCQlpZiAoIXJldCkgewo+IC0JCQlkbWFfZnJlZV9jb250aWd1b3VzKGRldiwgcGFnZSwg
c2l6ZSk7Cj4gLQkJCXJldHVybiByZXQ7Cj4gLQkJfQo+IC0KPiArCQlpZiAoIXJldCkKPiArCQkJ
Z290byBvdXRfZnJlZV9wYWdlczsKPiAgIAkJbWVtc2V0KHJldCwgMCwgc2l6ZSk7Cj4gICAJCWdv
dG8gZG9uZTsKPiAgIAl9Cj4gQEAgLTE4Niw4ICsxODMsNyBAQCB2b2lkICpkbWFfZGlyZWN0X2Fs
bG9jX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsCj4gICAJCSAqIHNvIGxv
ZyBhbiBlcnJvciBhbmQgZmFpbC4KPiAgIAkJICovCj4gICAJCWRldl9pbmZvKGRldiwgIlJlamVj
dGluZyBoaWdobWVtIHBhZ2UgZnJvbSBDTUEuXG4iKTsKPiAtCQlkbWFfZnJlZV9jb250aWd1b3Vz
KGRldiwgcGFnZSwgc2l6ZSk7Cj4gLQkJcmV0dXJuIE5VTEw7Cj4gKwkJZ290byBvdXRfZnJlZV9w
YWdlczsKPiAgIAl9Cj4gICAKPiAgIAlyZXQgPSBwYWdlX2FkZHJlc3MocGFnZSk7Cj4gQEAgLTE5
NiwxMCArMTkyLDE1IEBAIHZvaWQgKmRtYV9kaXJlY3RfYWxsb2NfcGFnZXMoc3RydWN0IGRldmlj
ZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgIAo+ICAgCW1lbXNldChyZXQsIDAsIHNpemUpOwo+ICAg
Cj4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfQVJDSF9IQVNfVU5DQUNIRURfU0VHTUVOVCkgJiYK
PiAtCSAgICBkbWFfYWxsb2NfbmVlZF91bmNhY2hlZChkZXYsIGF0dHJzKSkgewo+ICsJaWYgKGRt
YV9hbGxvY19uZWVkX3VuY2FjaGVkKGRldiwgYXR0cnMpKSB7Cj4gICAJCWFyY2hfZG1hX3ByZXBf
Y29oZXJlbnQocGFnZSwgc2l6ZSk7Cj4gLQkJcmV0ID0gdW5jYWNoZWRfa2VybmVsX2FkZHJlc3Mo
cmV0KTsKPiArCj4gKwkJaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX0RNQV9TRVRfVU5D
QUNIRUQpKSB7Cj4gKwkJCWlmICghYXJjaF9kbWFfc2V0X3VuY2FjaGVkKHJldCwgc2l6ZSkpCj4g
KwkJCQlnb3RvIG91dF9mcmVlX3BhZ2VzOwo+ICsJCX0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05G
SUdfQVJDSF9IQVNfVU5DQUNIRURfU0VHTUVOVCkpIHsKPiArCQkJcmV0ID0gdW5jYWNoZWRfa2Vy
bmVsX2FkZHJlc3MocmV0KTsKCkhtbSwgd291bGQgd2UgYWN0dWFsbHkgbmVlZCB0byBrZWVwIEFS
Q0hfSEFTX1VOQ0FDSEVEX1NFR01FTlQ/IElmIAphcmNoX2RtYV9zZXRfdW5jYWNoZWQoKSByZXR1
cm5lZCB2b2lkKi9FUlJfUFRSIGluc3RlYWQsIHRoZW4gaXQgY291bGQgCndvcmsgZm9yIGJvdGgg
Y2FzZXMgKHdpdGggYXJjaF9kbWFfY2xlYXJfdW5jYWNoZWQoKSBiZWluZyBhIG5vLW9wIGZvciAK
c2VnbWVudHMpLgoKUm9iaW4uCgo+ICsJCX0KPiAgIAl9Cj4gICBkb25lOgo+ICAgCWlmIChmb3Jj
ZV9kbWFfdW5lbmNyeXB0ZWQoZGV2KSkKPiBAQCAtMjA3LDYgKzIwOCw5IEBAIHZvaWQgKmRtYV9k
aXJlY3RfYWxsb2NfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKPiAgIAll
bHNlCj4gICAJCSpkbWFfaGFuZGxlID0gcGh5c190b19kbWEoZGV2LCBwYWdlX3RvX3BoeXMocGFn
ZSkpOwo+ICAgCXJldHVybiByZXQ7Cj4gK291dF9mcmVlX3BhZ2VzOgo+ICsJZG1hX2ZyZWVfY29u
dGlndW91cyhkZXYsIHBhZ2UsIHNpemUpOwo+ICsJcmV0dXJuIE5VTEw7Cj4gICB9Cj4gICAKPiAg
IHZvaWQgZG1hX2RpcmVjdF9mcmVlX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsIHZvaWQgKmNwdV9hZGRyLAo+IEBAIC0yMzAsNiArMjM0LDggQEAgdm9pZCBkbWFfZGlyZWN0
X2ZyZWVfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqY3B1X2Fk
ZHIsCj4gICAKPiAgIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfRE1BX1JFTUFQKSAmJiBpc192bWFs
bG9jX2FkZHIoY3B1X2FkZHIpKQo+ICAgCQl2dW5tYXAoY3B1X2FkZHIpOwo+ICsJZWxzZSBpZiAo
SVNfRU5BQkxFRChDT05GSUdfQVJDSF9IQVNfRE1BX1NFVF9VTkNBQ0hFRCkpCj4gKwkJYXJjaF9k
bWFfY2xlYXJfdW5jYWNoZWQoY3B1X2FkZHIsIHNpemUpOwo+ICAgCj4gICAJZG1hX2ZyZWVfY29u
dGlndW91cyhkZXYsIGRtYV9kaXJlY3RfdG9fcGFnZShkZXYsIGRtYV9hZGRyKSwgc2l6ZSk7Cj4g
ICB9Cj4gQEAgLTIzOCw2ICsyNDQsNyBAQCB2b2lkICpkbWFfZGlyZWN0X2FsbG9jKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsCj4gICAJCWRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsIGdm
cF90IGdmcCwgdW5zaWduZWQgbG9uZyBhdHRycykKPiAgIHsKPiAgIAlpZiAoIUlTX0VOQUJMRUQo
Q09ORklHX0FSQ0hfSEFTX1VOQ0FDSEVEX1NFR01FTlQpICYmCj4gKwkgICAgIUlTX0VOQUJMRUQo
Q09ORklHX0FSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQpICYmCj4gICAJICAgICFJU19FTkFCTEVE
KENPTkZJR19ETUFfRElSRUNUX1JFTUFQKSAmJgo+ICAgCSAgICBkbWFfYWxsb2NfbmVlZF91bmNh
Y2hlZChkZXYsIGF0dHJzKSkKPiAgIAkJcmV0dXJuIGFyY2hfZG1hX2FsbG9jKGRldiwgc2l6ZSwg
ZG1hX2hhbmRsZSwgZ2ZwLCBhdHRycyk7Cj4gQEAgLTI0OCw2ICsyNTUsNyBAQCB2b2lkIGRtYV9k
aXJlY3RfZnJlZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+ICAgCQl2b2lkICpj
cHVfYWRkciwgZG1hX2FkZHJfdCBkbWFfYWRkciwgdW5zaWduZWQgbG9uZyBhdHRycykKPiAgIHsK
PiAgIAlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1VOQ0FDSEVEX1NFR01FTlQpICYm
Cj4gKwkgICAgIUlTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQpICYm
Cj4gICAJICAgICFJU19FTkFCTEVEKENPTkZJR19ETUFfRElSRUNUX1JFTUFQKSAmJgo+ICAgCSAg
ICBkbWFfYWxsb2NfbmVlZF91bmNhY2hlZChkZXYsIGF0dHJzKSkKPiAgIAkJYXJjaF9kbWFfZnJl
ZShkZXYsIHNpemUsIGNwdV9hZGRyLCBkbWFfYWRkciwgYXR0cnMpOwo+IApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

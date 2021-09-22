Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 16EA3415EA8
	for <lists+openrisc@lfdr.de>; Thu, 23 Sep 2021 14:44:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 69364240FB;
	Thu, 23 Sep 2021 14:44:13 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id B010B202A8
 for <openrisc@lists.librecores.org>; Wed, 22 Sep 2021 17:49:59 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C150A610A1;
 Wed, 22 Sep 2021 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632325798;
 bh=bG1NBP4It5lN9mNWkYcfkuu4qZacuaz/60AX2jQWjTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TV1auz9/KtJeMADAOSvuTYcU86ONLBAOf4bCIG+FrDqf+V0OwtMCNCI9EuC5H2YXj
 F6nT5TT8m6996iV82s1CbteoS28EBcfjvlSybGHeMCqG98FPss7hlxTPRCzsEZhCQR
 oK2iY4Nh3BMi1YCg3Zgjp2buFbfep00ijEqiR/6M1oAMT6RYpWW09P9/MJORjpx329
 HELvPOF8qBCPKtBs42oMP8TAIg6e+2vw3oHh/X547tbB2/eCavNCPoIkwq/hluA+f+
 n3DdjY0HiXhmZKyzDxAuSpuLpCuJr0iJtXSv/3X8mE15MVOT9F86f1FpMRJ6v++l35
 eawiKOZUCmahA==
Date: Wed, 22 Sep 2021 08:49:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <YUtQnml8FO8BC7sM@archlinux-ax161>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
 <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
 <20210922084156.xqru5fdjkarbkyew@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210922084156.xqru5fdjkarbkyew@gilmour>
X-Mailman-Approved-At: Thu, 23 Sep 2021 14:44:12 +0200
Subject: Re: [OpenRISC] [PATCH v3 1/6] drm/vc4: select PM (openrisc)
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
Cc: Jonas Bonn <jonas@southpole.se>, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Openrisc <openrisc@lists.librecores.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBTZXAgMjIsIDIwMjEgYXQgMTA6NDE6NTZBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBIaSBSYW5keSwKPiAKPiBPbiBTdW4sIFNlcCAxOSwgMjAyMSBhdCAwOTo0MDo0NEFN
IC0wNzAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4gPiBPbiA4LzE5LzIxIDY6NTkgQU0sIE1heGlt
ZSBSaXBhcmQgd3JvdGU6Cj4gPiA+IFdlIGFscmVhZHkgZGVwZW5kIG9uIHJ1bnRpbWUgUE0gdG8g
Z2V0IHRoZSBwb3dlciBkb21haW5zIGFuZCBjbG9ja3MgZm9yCj4gPiA+IG1vc3Qgb2YgdGhlIGRl
dmljZXMgc3VwcG9ydGVkIGJ5IHRoZSB2YzQgZHJpdmVyLCBzbyBsZXQncyBqdXN0IHNlbGVjdCBp
dAo+ID4gPiB0byBtYWtlIHN1cmUgaXQncyB0aGVyZSwgYW5kIHJlbW92ZSB0aGUgaWZkZWYuCj4g
PiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVj
aD4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnICAgIHwgMSAr
Cj4gPiA+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgMiAtLQo+ID4gPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC9LY29uZmlnCj4gPiA+IGluZGV4IDExOGU4YTQyNmIxYS4uZjc3NGFiMzQwODYzIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcKPiA+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnCj4gPiA+IEBAIC05LDYgKzksNyBAQCBjb25maWcg
RFJNX1ZDNAo+ID4gPiAgIAlzZWxlY3QgRFJNX0tNU19DTUFfSEVMUEVSCj4gPiA+ICAgCXNlbGVj
dCBEUk1fR0VNX0NNQV9IRUxQRVIKPiA+ID4gICAJc2VsZWN0IERSTV9QQU5FTF9CUklER0UKPiA+
ID4gKwlzZWxlY3QgUE0KPiA+ID4gICAJc2VsZWN0IFNORF9QQ00KPiA+ID4gICAJc2VsZWN0IFNO
RF9QQ01fRUxECj4gPiA+ICAgCXNlbGVjdCBTTkRfU09DX0dFTkVSSUNfRE1BRU5HSU5FX1BDTQo+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCj4gPiA+IGluZGV4IGMyODc2NzMxZWUyZC4uNjAyMjAz
YjJkOGUxIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMK
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jCj4gPiA+IEBAIC0yMTA3
LDcgKzIxMDcsNiBAQCBzdGF0aWMgaW50IHZjNV9oZG1pX2luaXRfcmVzb3VyY2VzKHN0cnVjdCB2
YzRfaGRtaSAqdmM0X2hkbWkpCj4gPiA+ICAgCXJldHVybiAwOwo+ID4gPiAgIH0KPiA+ID4gLSNp
ZmRlZiBDT05GSUdfUE0KPiA+ID4gICBzdGF0aWMgaW50IHZjNF9oZG1pX3J1bnRpbWVfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiA+ICAgewo+ID4gPiAgIAlzdHJ1Y3QgdmM0X2hkbWkg
KnZjNF9oZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiA+IEBAIC0yMTI4LDcgKzIxMjcs
NiBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiA+ID4gICAJcmV0dXJuIDA7Cj4gPiA+ICAgfQo+ID4gPiAtI2VuZGlmCj4gPiA+ICAgc3Rh
dGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAq
bWFzdGVyLCB2b2lkICpkYXRhKQo+ID4gPiAgIHsKPiA+ID4gCj4gPiAKPiA+IEhpLAo+ID4gCj4g
PiBGWUkuCj4gPiAKPiA+IFRoaXMgc3RpbGwgY2F1c2VzIGEgYnVpbGQgZXJyb3Igb24gYXJjaC9v
cGVucmlzYy8gc2luY2UgaXQgZG9lcyBub3Qgc3VwcG9ydAo+ID4gQ09ORklHX1BNIChpdCBkb2Vz
IG5vdCBzb3VyY2UgImtlcm5lbC9wb3dlci9LY29uZmlnIiBsaWtlIHNvbWUgb3RoZXIgYXJjaGVz
IGRvKToKPiA+IAo+ID4gLi9hcmNoL3Jpc2N2L0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIv
S2NvbmZpZyIKPiA+IC4vYXJjaC94ODYvS2NvbmZpZzpzb3VyY2UgImtlcm5lbC9wb3dlci9LY29u
ZmlnIgo+ID4gLi9hcmNoL25kczMyL0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZp
ZyIKPiA+IC4vYXJjaC9zaC9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCj4g
PiAuL2FyY2gvYXJjL0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IC4v
YXJjaC9hcm02NC9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCj4gPiAuL2Fy
Y2gveHRlbnNhL0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IC4vYXJj
aC9zcGFyYy9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCj4gPiAuL2FyY2gv
YXJtL0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IC4vYXJjaC9taXBz
L0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IC4vYXJjaC9wb3dlcnBj
L0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKPiA+IC4vYXJjaC91bS9LY29u
ZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCj4gPiAuL2FyY2gvaWE2NC9LY29uZmln
OnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCj4gPiAKPiA+IHNvIHdpdGgKPiA+IENPTkZJ
R19EUk1fVkM0PXkKPiA+ICMgQ09ORklHX0RSTV9WQzRfSERNSV9DRUMgaXMgbm90IHNldAo+ID4g
Cj4gPiBJIHN0aWxsIHNlZQo+ID4gLi4vZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jOjIx
Mzk6MTI6IHdhcm5pbmc6ICd2YzRfaGRtaV9ydW50aW1lX3N1c3BlbmQnIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KPiA+ICAyMTM5IHwgc3RhdGljIGludCB2YzRfaGRt
aV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gICAgICAgfCAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IAo+IFdpdGggd2hhdCB2ZXJzaW9uIGRpZCB5
b3UgZ2V0IHRoYXQgYnVpbGQgZXJyb3I/IC1yYzIgc2hvdWxkbid0IGhhdmUgaXQKPiBhbnltb3Jl
IHNpbmNlIHRoZSBydW50aW1lX3BtIGhvb2tzIGludHJvZHVjdGlvbiBnb3QgcmV2ZXJ0ZWQuCgot
bmV4dCBzdGlsbCBjb250YWlucyB0aGVzZSBwYXRjaGVzIGFzIFN0ZXBoZW4gZWZmZWN0aXZlbHkg
cmV2ZXJ0ZWQgdGhlCmNoYW5nZXMgaW4gTGludXMnIHRyZWUgd2hlbiBtZXJnaW5nIGluIHRoZSBk
cm0tbWlzYy1maXhlcyB0cmVlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDkyMDA5
MDcyOS4xOTQ1ODk1M0BjYW5iLmF1dWcub3JnLmF1LwoKQ2hlZXJzLApOYXRoYW4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

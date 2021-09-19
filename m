Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D2287410C64
	for <lists+openrisc@lfdr.de>; Sun, 19 Sep 2021 18:40:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68CEB24109;
	Sun, 19 Sep 2021 18:40:54 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id DBEB820DE0
 for <openrisc@lists.librecores.org>; Sun, 19 Sep 2021 18:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SkLH+UboopS3jydNhY/b3ibaID8wpHq9laVTqE2n57s=; b=E3ZV85cVknawbtUr32Gqm8RYhL
 Ab712U1reGxWRM7S4eKwC6U3oe3B9KULJHTMg7XyVm2d0Q1+CNzAh6qRZz9+WHwS/iemiw25p6ggr
 H2AUCcQC1kid2t5083+2fs8Fmh3pCJd15WFfFMUZe9x0UGi6YUn9SljaWcZdZkctQ4DCDFx0t6qkk
 xQQ1ps6/zrblGcdBsJ/QgHn8PsImtCIeL0kRYHq+TvCSMpXjAap/8jNxUSES9QMC2hf7dfXpEuy8H
 wMx+NDCGYitc3g+7cTX22FfyWxJEp9MfAS8g9XrG6l1uRXF8Mkr0NHDqrik/J8NL+58swO76H5Pj0
 +tdu5ljw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRzrz-00HWNq-1w; Sun, 19 Sep 2021 16:40:47 +0000
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20210819135931.895976-1-maxime@cerno.tech>
 <20210819135931.895976-2-maxime@cerno.tech>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8a5cdcf5-33ed-398f-243a-b8889fd754e3@infradead.org>
Date: Sun, 19 Sep 2021 09:40:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819135931.895976-2-maxime@cerno.tech>
Content-Language: en-US
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
Cc: Jonas Bonn <jonas@southpole.se>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Openrisc <openrisc@lists.librecores.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Phil Elwell <phil@raspberrypi.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gOC8xOS8yMSA2OjU5IEFNLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+IFdlIGFscmVhZHkgZGVw
ZW5kIG9uIHJ1bnRpbWUgUE0gdG8gZ2V0IHRoZSBwb3dlciBkb21haW5zIGFuZCBjbG9ja3MgZm9y
Cj4gbW9zdCBvZiB0aGUgZGV2aWNlcyBzdXBwb3J0ZWQgYnkgdGhlIHZjNCBkcml2ZXIsIHNvIGxl
dCdzIGp1c3Qgc2VsZWN0IGl0Cj4gdG8gbWFrZSBzdXJlIGl0J3MgdGhlcmUsIGFuZCByZW1vdmUg
dGhlIGlmZGVmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC9LY29uZmlnICAgIHwgMSArCj4g
ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgfCAyIC0tCj4gICAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcKPiBp
bmRleCAxMThlOGE0MjZiMWEuLmY3NzRhYjM0MDg2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmM0L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L0tjb25maWcKPiBA
QCAtOSw2ICs5LDcgQEAgY29uZmlnIERSTV9WQzQKPiAgIAlzZWxlY3QgRFJNX0tNU19DTUFfSEVM
UEVSCj4gICAJc2VsZWN0IERSTV9HRU1fQ01BX0hFTFBFUgo+ICAgCXNlbGVjdCBEUk1fUEFORUxf
QlJJREdFCj4gKwlzZWxlY3QgUE0KPiAgIAlzZWxlY3QgU05EX1BDTQo+ICAgCXNlbGVjdCBTTkRf
UENNX0VMRAo+ICAgCXNlbGVjdCBTTkRfU09DX0dFTkVSSUNfRE1BRU5HSU5FX1BDTQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMKPiBpbmRleCBjMjg3NjczMWVlMmQuLjYwMjIwM2IyZDhlMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9oZG1pLmMKPiBAQCAtMjEwNyw3ICsyMTA3LDYgQEAgc3RhdGljIGludCB2
YzVfaGRtaV9pbml0X3Jlc291cmNlcyhzdHJ1Y3QgdmM0X2hkbWkgKnZjNF9oZG1pKQo+ICAgCXJl
dHVybiAwOwo+ICAgfQo+ICAgCj4gLSNpZmRlZiBDT05GSUdfUE0KPiAgIHN0YXRpYyBpbnQgdmM0
X2hkbWlfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1
Y3QgdmM0X2hkbWkgKnZjNF9oZG1pID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gQEAgLTIxMjgs
NyArMjEyNyw2IEBAIHN0YXRpYyBpbnQgdmM0X2hkbWlfcnVudGltZV9yZXN1bWUoc3RydWN0IGRl
dmljZSAqZGV2KQo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gLSNlbmRpZgo+ICAgCj4gICBz
dGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNl
ICptYXN0ZXIsIHZvaWQgKmRhdGEpCj4gICB7Cj4gCgpIaSwKCkZZSS4KClRoaXMgc3RpbGwgY2F1
c2VzIGEgYnVpbGQgZXJyb3Igb24gYXJjaC9vcGVucmlzYy8gc2luY2UgaXQgZG9lcyBub3Qgc3Vw
cG9ydApDT05GSUdfUE0gKGl0IGRvZXMgbm90IHNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWci
IGxpa2Ugc29tZSBvdGhlciBhcmNoZXMgZG8pOgoKLi9hcmNoL3Jpc2N2L0tjb25maWc6c291cmNl
ICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKLi9hcmNoL3g4Ni9LY29uZmlnOnNvdXJjZSAia2VybmVs
L3Bvd2VyL0tjb25maWciCi4vYXJjaC9uZHMzMi9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2Vy
L0tjb25maWciCi4vYXJjaC9zaC9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWci
Ci4vYXJjaC9hcmMvS2NvbmZpZzpzb3VyY2UgImtlcm5lbC9wb3dlci9LY29uZmlnIgouL2FyY2gv
YXJtNjQvS2NvbmZpZzpzb3VyY2UgImtlcm5lbC9wb3dlci9LY29uZmlnIgouL2FyY2gveHRlbnNh
L0tjb25maWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKLi9hcmNoL3NwYXJjL0tjb25m
aWc6c291cmNlICJrZXJuZWwvcG93ZXIvS2NvbmZpZyIKLi9hcmNoL2FybS9LY29uZmlnOnNvdXJj
ZSAia2VybmVsL3Bvd2VyL0tjb25maWciCi4vYXJjaC9taXBzL0tjb25maWc6c291cmNlICJrZXJu
ZWwvcG93ZXIvS2NvbmZpZyIKLi9hcmNoL3Bvd2VycGMvS2NvbmZpZzpzb3VyY2UgImtlcm5lbC9w
b3dlci9LY29uZmlnIgouL2FyY2gvdW0vS2NvbmZpZzpzb3VyY2UgImtlcm5lbC9wb3dlci9LY29u
ZmlnIgouL2FyY2gvaWE2NC9LY29uZmlnOnNvdXJjZSAia2VybmVsL3Bvd2VyL0tjb25maWciCgpz
byB3aXRoCkNPTkZJR19EUk1fVkM0PXkKIyBDT05GSUdfRFJNX1ZDNF9IRE1JX0NFQyBpcyBub3Qg
c2V0CgpJIHN0aWxsIHNlZQouLi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmM6MjEzOTox
Mjogd2FybmluZzogJ3ZjNF9oZG1pX3J1bnRpbWVfc3VzcGVuZCcgZGVmaW5lZCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWZ1bmN0aW9uXQogIDIxMzkgfCBzdGF0aWMgaW50IHZjNF9oZG1pX3J1bnRp
bWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAgICAgICB8ICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CgoKLS0gCn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

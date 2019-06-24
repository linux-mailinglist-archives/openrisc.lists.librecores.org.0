Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C9B2E5592B
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 85B6A20305;
	Tue, 25 Jun 2019 22:41:52 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 079CC20203
 for <openrisc@lists.librecores.org>; Mon, 24 Jun 2019 16:23:13 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4151B344;
 Mon, 24 Jun 2019 07:23:12 -0700 (PDT)
Received: from [10.1.32.158] (unknown [10.1.32.158])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C9083F71E;
 Mon, 24 Jun 2019 07:23:10 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Vineet Gupta <vgupta@synopsys.com>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-2-hch@lst.de>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
Date: Mon, 24 Jun 2019 15:23:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614144431.21760-2-hch@lst.de>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 1/7] arm-nommu: remove the partial
 DMA_ATTR_NON_CONSISTENT support
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-xtensa@linux-xtensa.org,
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNi8xNC8xOSAzOjQ0IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUgYXJtLW5v
bW11IERNQSBjb2RlIHN1cHBvcnRzIERNQV9BVFRSX05PTl9DT05TSVNURU5UIGFsbG9jYXRpb25z
LCBidXQKPiBkb2VzIG5vdCBwcm92aWRlIGEgY2FjaGVfc3luYyBvcGVyYXRpb24uICBUaGlzIG1l
YW5zIGFueSB1c2VyIG9mIGl0Cj4gd2lsbCBuZXZlciBiZSBhYmxlIHRvIGFjdHVhbGx5IHRyYW5z
ZmVyIGNhY2hlIG93bmVyc2hpcCBhbmQgdGh1cyBjYXVzZQo+IGNvaGVyZW5jeSBidWdzLgoKQnkg
dGhlIHdheSwgRG9jdW1lbnRhdGlvbi9ETUEtYXR0cmlidXRlcy50eHQgZG9lc24ndCBzcGVjaWZ5
IGNhY2hlX3N5bmMoKSBhcwpyZXF1aXJlbWVudCBmb3IgRE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQg
aXQgb25seSBzdGF0ZXMgdGhhdCBpdCBpcyByZXNwb25zaWJpbGl0eQpvZiB0aGUgZHJpdmVyIHRv
IGhhdmUgYWxsIHRoZSBjb3JyZWN0IGFuZCBuZWNlc3Nhcnkgc3luYyBwb2ludHMuCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNo
L2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jIHwgMjQgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jIGIvYXJjaC9hcm0v
bW0vZG1hLW1hcHBpbmctbm9tbXUuYwo+IGluZGV4IGYzMDRiMTBlMjNhNC4uYmMwMDNkZjQ1NTQ2
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMKPiArKysgYi9h
cmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jCj4gQEAgLTM5LDE4ICszOSw3IEBAIHN0YXRp
YyB2b2lkICphcm1fbm9tbXVfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsCj4gIAkJCQkgdW5zaWduZWQgbG9uZyBhdHRycykKPiAgCj4gIHsKPiAtCXZvaWQgKnJldDsK
PiAtCj4gLQkvKgo+IC0JICogVHJ5IGdlbmVyaWMgYWxsb2NhdG9yIGZpcnN0IGlmIHdlIGFyZSBh
ZHZlcnRpc2VkIHRoYXQKPiAtCSAqIGNvbnNpc3RlbmN5IGlzIG5vdCByZXF1aXJlZC4KPiAtCSAq
Lwo+IC0KPiAtCWlmIChhdHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5UKQo+IC0JCXJldHVy
biBkbWFfZGlyZWN0X2FsbG9jX3BhZ2VzKGRldiwgc2l6ZSwgZG1hX2hhbmRsZSwgZ2ZwLAo+IC0J
CQkJYXR0cnMpOwo+IC0KPiAtCXJldCA9IGRtYV9hbGxvY19mcm9tX2dsb2JhbF9jb2hlcmVudChz
aXplLCBkbWFfaGFuZGxlKTsKPiArCXZvaWQgKnJldCA9IGRtYV9hbGxvY19mcm9tX2dsb2JhbF9j
b2hlcmVudChzaXplLCBkbWFfaGFuZGxlKTsKPiAgCj4gIAkvKgo+ICAJICogZG1hX2FsbG9jX2Zy
b21fZ2xvYmFsX2NvaGVyZW50KCkgbWF5IGZhaWwgYmVjYXVzZToKPiBAQCAtNzAsMTYgKzU5LDkg
QEAgc3RhdGljIHZvaWQgYXJtX25vbW11X2RtYV9mcmVlKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6
ZV90IHNpemUsCj4gIAkJCSAgICAgICB2b2lkICpjcHVfYWRkciwgZG1hX2FkZHJfdCBkbWFfYWRk
ciwKPiAgCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgYXR0cnMpCj4gIHsKPiAtCWlmIChhdHRycyAm
IERNQV9BVFRSX05PTl9DT05TSVNURU5UKSB7Cj4gLQkJZG1hX2RpcmVjdF9mcmVlX3BhZ2VzKGRl
diwgc2l6ZSwgY3B1X2FkZHIsIGRtYV9hZGRyLCBhdHRycyk7Cj4gLQl9IGVsc2Ugewo+IC0JCWlu
dCByZXQgPSBkbWFfcmVsZWFzZV9mcm9tX2dsb2JhbF9jb2hlcmVudChnZXRfb3JkZXIoc2l6ZSks
Cj4gLQkJCQkJCQkgICBjcHVfYWRkcik7Cj4gLQo+IC0JCVdBUk5fT05fT05DRShyZXQgPT0gMCk7
Cj4gLQl9Cj4gKwlpbnQgcmV0ID0gZG1hX3JlbGVhc2VfZnJvbV9nbG9iYWxfY29oZXJlbnQoZ2V0
X29yZGVyKHNpemUpLCBjcHVfYWRkcik7Cj4gIAo+IC0JcmV0dXJuOwo+ICsJV0FSTl9PTl9PTkNF
KHJldCA9PSAwKTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBhcm1fbm9tbXVfZG1hX21tYXAoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAKCkZXSVc6CgpS
ZXZpZXdlZC1ieTogVmxhZGltaXIgTXVyemluIDx2bGFkaW1pci5tdXJ6aW5AYXJtLmNvbT4KCkNo
ZWVycwpWbGFkaW1pcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F36D9171767
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D946B208C6;
	Thu, 27 Feb 2020 13:35:36 +0100 (CET)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mail.librecores.org (Postfix) with ESMTPS id 9D463208C6
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 22:53:32 +0100 (CET)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Feb 2020 13:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,481,1574150400"; d="scan'208";a="226126679"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 13:53:28 -0800
Date: Mon, 24 Feb 2020 13:53:28 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200224215327.GB11565@iweiny-DESK2.sc.intel.com>
References: <20200224194446.690816-1-hch@lst.de>
 <20200224194446.690816-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224194446.690816-5-hch@lst.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 4/5] dma-direct: provide a
 arch_dma_clear_uncached hook
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
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTE6NDQ6NDRBTSAtMDgwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyBhbGxvd3MgdGhlIGFyY2ggY29kZSB0byByZXNldCB0aGUgcGFnZSB0
YWJsZXMgdG8gY2FjaGVkIGFjY2VzcyB3aGVuCj4gZnJlZWluZyBhIGRtYSBjb2hlcmVudCBhbGxv
Y2F0aW9uIHRoYXQgd2FzIHNldCB0byB1bmNhY2hlZCB1c2luZwo+IGFyY2hfZG1hX3NldF91bmNh
Y2hlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
PiAtLS0KPiAgYXJjaC9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8IDcgKysrKysrKwo+ICBp
bmNsdWRlL2xpbnV4L2RtYS1ub25jb2hlcmVudC5oIHwgMSArCj4gIGtlcm5lbC9kbWEvZGlyZWN0
LmMgICAgICAgICAgICAgfCAyICsrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL0tjb25maWcgYi9hcmNoL0tjb25maWcKPiBpbmRleCAw
OTBjZmUwYzgyYTcuLmMyNjMwMmY5MGM5NiAxMDA2NDQKPiAtLS0gYS9hcmNoL0tjb25maWcKPiAr
KysgYi9hcmNoL0tjb25maWcKPiBAQCAtMjU1LDYgKzI1NSwxMyBAQCBjb25maWcgQVJDSF9IQVNf
U0VUX0RJUkVDVF9NQVAKPiAgY29uZmlnIEFSQ0hfSEFTX0RNQV9TRVRfVU5DQUNIRUQKPiAgCWJv
b2wKPiAgCj4gKyMKPiArIyBTZWxlY3QgaWYgdGhlIGFyY2hpdGVjdHVyZXMgcHJvdmlkZXMgdGhl
IGFyY2hfZG1hX2NsZWFyX3VuY2FjaGVkIHN5bWJvbAo+ICsjIHRvIHVuZG8gYW4gaW4tcGxhY2Ug
cGFnZSB0YWJsZSByZW1hcCBmb3IgdW5jYWNoZWQgYWNjZXNzLgo+ICsjCj4gK2NvbmZpZyBBUkNI
X0hBU19ETUFfQ0xFQVJfVU5DQUNIRUQKPiArCWJvb2wKPiArCj4gICMgU2VsZWN0IGlmIGFyY2gg
aW5pdF90YXNrIG11c3QgZ28gaW4gdGhlIF9faW5pdF90YXNrX2RhdGEgc2VjdGlvbgo+ICBjb25m
aWcgQVJDSF9UQVNLX1NUUlVDVF9PTl9TVEFDSwo+ICAJYm9vbAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2RtYS1ub25jb2hlcmVudC5oIGIvaW5jbHVkZS9saW51eC9kbWEtbm9uY29oZXJl
bnQuaAo+IGluZGV4IDFhNDAzOTUwNjY3My4uYjU5ZjFiNmJlM2U5IDEwMDY0NAo+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1u
b25jb2hlcmVudC5oCj4gQEAgLTEwOSw1ICsxMDksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXJj
aF9kbWFfcHJlcF9jb2hlcmVudChzdHJ1Y3QgcGFnZSAqcGFnZSwgc2l6ZV90IHNpemUpCj4gICNl
bmRpZiAvKiBDT05GSUdfQVJDSF9IQVNfRE1BX1BSRVBfQ09IRVJFTlQgKi8KPiAgCj4gIHZvaWQg
KmFyY2hfZG1hX3NldF91bmNhY2hlZCh2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSk7Cj4gK3ZvaWQg
YXJjaF9kbWFfY2xlYXJfdW5jYWNoZWQodm9pZCAqYWRkciwgc2l6ZV90IHNpemUpOwo+ICAKPiAg
I2VuZGlmIC8qIF9MSU5VWF9ETUFfTk9OQ09IRVJFTlRfSCAqLwo+IGRpZmYgLS1naXQgYS9rZXJu
ZWwvZG1hL2RpcmVjdC5jIGIva2VybmVsL2RtYS9kaXJlY3QuYwo+IGluZGV4IGYwMWE4MTkxZmQ1
OS4uYTg1NjAwNTJhOTE1IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9kbWEvZGlyZWN0LmMKPiArKysg
Yi9rZXJuZWwvZG1hL2RpcmVjdC5jCj4gQEAgLTIxOSw2ICsyMTksOCBAQCB2b2lkIGRtYV9kaXJl
Y3RfZnJlZV9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCB2b2lkICpjcHVf
YWRkciwKPiAgCj4gIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfRE1BX1JFTUFQKSAmJiBpc192bWFs
bG9jX2FkZHIoY3B1X2FkZHIpKQo+ICAJCXZ1bm1hcChjcHVfYWRkcik7Cj4gKwllbHNlIGlmIChJ
U19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19ETUFfQ0xFQVJfVU5DQUNIRUQpKQo+ICsJCWFyY2hf
ZG1hX2NsZWFyX3VuY2FjaGVkKGNwdV9hZGRyLCBzaXplKTsKCklzbid0IHVzaW5nIGFyY2hfZG1h
X2NsZWFyX3VuY2FjaGVkKCkgYmVmb3JlIHBhdGNoIDUgZ29pbmcgdG8gYnJlYWsKYmlzZWN0YWJp
bGl0eT8KCklyYQoKPiAgCj4gIAlkbWFfZnJlZV9jb250aWd1b3VzKGRldiwgZG1hX2RpcmVjdF90
b19wYWdlKGRldiwgZG1hX2FkZHIpLCBzaXplKTsKPiAgfQo+IC0tIAo+IDIuMjQuMQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

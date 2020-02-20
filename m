Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B6338171758
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 082AD2096E;
	Thu, 27 Feb 2020 13:35:28 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id E3F5A20909
 for <openrisc@lists.librecores.org>; Thu, 20 Feb 2020 18:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HtENtGXMu5lv8v2BETZ/HEIobwIkiHxnVtk2a6XxHoE=; b=T5FBHWOl/1ly9t3RQlAFneq+LH
 znE7SnHgY6zEKFQuQFZUtOazi674gzMFHGtiQRguRPHKUpUbCoRszbOyCSWhkt5V4wSetu00nWMIj
 SDgv5AxVFpQcpDs+txdludIlKBFYOQM5UH4DDKtuJx3uUFq3HQs9y6EFsF2ibt/ltHLfYK5TuFuGb
 RlMbOcbURkAR2slWv5WKCiEA3XimfqMSpfvhYQoM2LMwGno23dRlU80vcUm8bl1QsE3T7jCGJVyHF
 7Xk61JwG6k321wmvBIC0Nvxxm0md3oLioj7VFTWt/fxqpt0GInQM4j4s/G4tm7ygXDCIQP8LoIgV9
 ib0EF5Dg==;
Received: from [38.126.112.138] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4pCl-0000Dq-Og; Thu, 20 Feb 2020 17:01:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Thu, 20 Feb 2020 09:01:39 -0800
Message-Id: <20200220170139.387354-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200220170139.387354-1-hch@lst.de>
References: <20200220170139.387354-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH 2/2] openrisc: use the generic in-place uncached
 DMA allocator
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
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U3dpdGNoIG9wZW5yaXNjIHRvIHVzZSB0aGUgZG1hLWRpcmVjdCBhbGxvY2F0b3IgYW5kIGp1c3Qg
cHJvdmlkZSB0aGUKaG9va3MgZm9yIHNldHRpbmcgbWVtb3J5IHVuY2FjaGVkIG9yIGNhY2hlZC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gv
b3BlbnJpc2MvS2NvbmZpZyAgICAgIHwgIDEgKwogYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMg
fCA1MSArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
b3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwppbmRleCAxOTI4ZTA2MWZm
OTYuLjA0MWZmZjQzMjZkYyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9LY29uZmlnCisrKyBi
L2FyY2gvb3BlbnJpc2MvS2NvbmZpZwpAQCAtNyw2ICs3LDcgQEAKIGNvbmZpZyBPUEVOUklTQwog
CWRlZl9ib29sIHkKIAlzZWxlY3QgQVJDSF8zMkJJVF9PRkZfVAorCXNlbGVjdCBBUkNIX0hBU19E
TUFfU0VUX1VOQ0FDSEVECiAJc2VsZWN0IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UKIAlz
ZWxlY3QgT0YKIAlzZWxlY3QgT0ZfRUFSTFlfRkxBVFRSRUUKZGlmZiAtLWdpdCBhL2FyY2gvb3Bl
bnJpc2Mva2VybmVsL2RtYS5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMKaW5kZXggYWRl
YzcxMWFkMzlkLi5jNzNkMmIzYWUyNjcgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVs
L2RtYS5jCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL2RtYS5jCkBAIC0xMSw4ICsxMSw2IEBA
CiAgKiBDb3B5cmlnaHQgKEMpIDIwMTAtMjAxMSBKb25hcyBCb25uIDxqb25hc0Bzb3V0aHBvbGUu
c2U+CiAgKgogICogRE1BIG1hcHBpbmcgY2FsbGJhY2tzLi4uCi0gKiBBcyBhbGxvY19jb2hlcmVu
dCBpcyB0aGUgb25seSBETUEgY2FsbGJhY2sgYmVpbmcgdXNlZCBjdXJyZW50bHksIHRoYXQncwot
ICogdGhlIG9ubHkgdGhpbmcgaW1wbGVtZW50ZWQgcHJvcGVybHkuICBUaGUgcmVzdCBuZWVkIGxv
b2tpbmcgaW50by4uLgogICovCiAKICNpbmNsdWRlIDxsaW51eC9kbWEtbm9uY29oZXJlbnQuaD4K
QEAgLTY3LDYyICs2NSwyNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1tX3dhbGtfb3BzIGNsZWFy
X25vY2FjaGVfd2Fsa19vcHMgPSB7CiAJLnB0ZV9lbnRyeQkJPSBwYWdlX2NsZWFyX25vY2FjaGUs
CiB9OwogCi0vKgotICogQWxsb2MgImNvaGVyZW50IiBtZW1vcnksIHdoaWNoIGZvciBPcGVuUklT
QyBtZWFucyBzaW1wbHkgdW5jYWNoZWQuCi0gKgotICogVGhpcyBmdW5jdGlvbiBlZmZlY3RpdmVs
eSBqdXN0IGNhbGxzIF9fZ2V0X2ZyZWVfcGFnZXMsIHNldHMgdGhlCi0gKiBjYWNoZS1pbmhpYml0
IGJpdCBvbiB0aG9zZSBwYWdlcywgYW5kIG1ha2VzIHN1cmUgdGhhdCB0aGUgcGFnZXMgYXJlCi0g
KiBmbHVzaGVkIG91dCBvZiB0aGUgY2FjaGUgYmVmb3JlIHRoZXkgYXJlIHVzZWQuCi0gKgotICog
SWYgdGhlIE5PTl9DT05TSVNURU5UIGF0dHJpYnV0ZSBpcyBzZXQsIHRoZW4gdGhpcyBmdW5jdGlv
biBqdXN0Ci0gKiByZXR1cm5zICJub3JtYWwiLCBjYWNoYWJsZSBtZW1vcnkuCi0gKgotICogVGhl
cmUgYXJlIGFkZGl0aW9uYWwgZmxhZ3MgV0VBS19PUkRFUklORyBhbmQgV1JJVEVfQ09NQklORSB0
byB0YWtlCi0gKiBpbnRvIGNvbnNpZGVyYXRpb24gaGVyZSwgdG9vLiAgQWxsIGN1cnJlbnQga25v
d24gaW1wbGVtZW50YXRpb25zIG9mCi0gKiB0aGUgT1IxSyBzdXBwb3J0IG9ubHkgc3Ryb25nbHkg
b3JkZXJlZCBtZW1vcnkgYWNjZXNzZXMsIHNvIHRoYXQgZmxhZwotICogaXMgYmVpbmcgaWdub3Jl
ZCBmb3Igbm93OyB1bmNhY2hlZCBidXQgd3JpdGUtY29tYmluZWQgbWVtb3J5IGlzIGEKLSAqIG1p
c3NpbmcgZmVhdHVyZSBvZiB0aGUgT1IxSy4KLSAqLwotdm9pZCAqCi1hcmNoX2RtYV9hbGxvYyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlLAot
CQlnZnBfdCBnZnAsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCitpbnQgYXJjaF9kbWFfc2V0X3VuY2Fj
aGVkKHZvaWQgKmNwdV9hZGRyLCBzaXplX3Qgc2l6ZSkKIHsKLQl1bnNpZ25lZCBsb25nIHZhOwot
CXZvaWQgKnBhZ2U7Ci0KLQlwYWdlID0gYWxsb2NfcGFnZXNfZXhhY3Qoc2l6ZSwgZ2ZwIHwgX19H
RlBfWkVSTyk7Ci0JaWYgKCFwYWdlKQotCQlyZXR1cm4gTlVMTDsKLQotCS8qIFRoaXMgZ2l2ZXMg
dXMgdGhlIHJlYWwgcGh5c2ljYWwgYWRkcmVzcyBvZiB0aGUgZmlyc3QgcGFnZS4gKi8KLQkqZG1h
X2hhbmRsZSA9IF9fcGEocGFnZSk7Ci0KLQl2YSA9ICh1bnNpZ25lZCBsb25nKXBhZ2U7CisJdW5z
aWduZWQgbG9uZyB2YSA9ICh1bnNpZ25lZCBsb25nKWNwdV9hZGRyOwogCiAJLyoKIAkgKiBXZSBu
ZWVkIHRvIGl0ZXJhdGUgdGhyb3VnaCB0aGUgcGFnZXMsIGNsZWFyaW5nIHRoZSBkY2FjaGUgZm9y
CiAJICogdGhlbSBhbmQgc2V0dGluZyB0aGUgY2FjaGUtaW5oaWJpdCBiaXQuCiAJICovCi0JaWYg
KHdhbGtfcGFnZV9yYW5nZSgmaW5pdF9tbSwgdmEsIHZhICsgc2l6ZSwgJnNldF9ub2NhY2hlX3dh
bGtfb3BzLAotCQkJTlVMTCkpIHsKLQkJZnJlZV9wYWdlc19leGFjdChwYWdlLCBzaXplKTsKLQkJ
cmV0dXJuIE5VTEw7Ci0JfQotCi0JcmV0dXJuICh2b2lkICopdmE7CisJcmV0dXJuIHdhbGtfcGFn
ZV9yYW5nZSgmaW5pdF9tbSwgdmEsIHZhICsgc2l6ZSwgJnNldF9ub2NhY2hlX3dhbGtfb3BzLAor
CQkJTlVMTCk7CiB9CiAKLXZvaWQKLWFyY2hfZG1hX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCi0JCWRtYV9hZGRyX3QgZG1hX2hhbmRsZSwgdW5zaWdu
ZWQgbG9uZyBhdHRycykKK3ZvaWQgYXJjaF9kbWFfY2xlYXJfdW5jYWNoZWQodm9pZCAqY3B1X2Fk
ZHIsIHNpemVfdCBzaXplKQogewotCXVuc2lnbmVkIGxvbmcgdmEgPSAodW5zaWduZWQgbG9uZyl2
YWRkcjsKKwl1bnNpZ25lZCBsb25nIHZhID0gKHVuc2lnbmVkIGxvbmcpY3B1X2FkZHI7CiAKIAkv
KiB3YWxrX3BhZ2VfcmFuZ2Ugc2hvdWxkbid0IGJlIGFibGUgdG8gZmFpbCBoZXJlICovCiAJV0FS
Tl9PTih3YWxrX3BhZ2VfcmFuZ2UoJmluaXRfbW0sIHZhLCB2YSArIHNpemUsCiAJCQkmY2xlYXJf
bm9jYWNoZV93YWxrX29wcywgTlVMTCkpOwotCi0JZnJlZV9wYWdlc19leGFjdCh2YWRkciwgc2l6
ZSk7CiB9CiAKIHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90IGFkZHIs
IHNpemVfdCBzaXplLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=

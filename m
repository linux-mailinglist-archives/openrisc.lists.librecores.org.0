Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 976DA17175F
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E51A72097F;
	Thu, 27 Feb 2020 13:35:30 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 217D520551
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 20:45:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iT1ha3vn/DgdTku/Bog5zuoB0xCormrXF5g8ca1iceU=; b=lHh+PMofvcXyNyuezdyJSne6LY
 IUHXC/XLvFMihtgmgz+iVUT16siWpc7/ZRb9jr/vW6Lnf3AH1RA2dcxTl21WL3ZdEfV2OKNg/hJ8S
 1n+RIHHlt/reHHiDPg5xRpEmer2cdqj/Nl+BcJ11Mw5I36fx+Fh9vVG7yFlztNBefW0whQGdwU2R/
 aolom250/RxHGNbdyXsEf/GxmcvfPZZvgJaCmVbaIrk9cl24Eb74HyA29en4bcOwHlsOQqyOyofhf
 MbNNajN3MoxTsh0oJfa/BOEsA/PMPrAB5ukZQeSgDAD17TIscJ91CjKqLZ4xfqft7dqrFklLKXJ3b
 kBMEIZfA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Jer-0006XE-BN; Mon, 24 Feb 2020 19:44:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Mon, 24 Feb 2020 11:44:42 -0800
Message-Id: <20200224194446.690816-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224194446.690816-1-hch@lst.de>
References: <20200224194446.690816-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH 2/5] dma-direct: consolidate the error handling
 in dma_direct_alloc_pages
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

VXNlIGEgZ290byBsYWJlbCB0byBtZXJnZSB0d28gZXJyb3IgcmV0dXJuIGNhc2VzLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQoga2VybmVsL2RtYS9k
aXJlY3QuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9kaXJlY3QuYyBiL2tl
cm5lbC9kbWEvZGlyZWN0LmMKaW5kZXggYWM3OTU2YzM4ZjY5Li45ZGZjYzdiZTQ5MDMgMTAwNjQ0
Ci0tLSBhL2tlcm5lbC9kbWEvZGlyZWN0LmMKKysrIGIva2VybmVsL2RtYS9kaXJlY3QuYwpAQCAt
MTU3LDExICsxNTcsOCBAQCB2b2lkICpkbWFfZGlyZWN0X2FsbG9jX3BhZ2VzKHN0cnVjdCBkZXZp
Y2UgKmRldiwgc2l6ZV90IHNpemUsCiAJCXJldCA9IGRtYV9jb21tb25fY29udGlndW91c19yZW1h
cChwYWdlLCBQQUdFX0FMSUdOKHNpemUpLAogCQkJCWRtYV9wZ3Byb3QoZGV2LCBQQUdFX0tFUk5F
TCwgYXR0cnMpLAogCQkJCV9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Ci0JCWlmICghcmV0
KSB7Ci0JCQlkbWFfZnJlZV9jb250aWd1b3VzKGRldiwgcGFnZSwgc2l6ZSk7Ci0JCQlyZXR1cm4g
cmV0OwotCQl9Ci0KKwkJaWYgKCFyZXQpCisJCQlnb3RvIG91dF9mcmVlX3BhZ2VzOwogCQltZW1z
ZXQocmV0LCAwLCBzaXplKTsKIAkJZ290byBkb25lOwogCX0KQEAgLTE3NCw4ICsxNzEsNyBAQCB2
b2lkICpkbWFfZGlyZWN0X2FsbG9jX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsCiAJCSAqIHNvIGxvZyBhbiBlcnJvciBhbmQgZmFpbC4KIAkJICovCiAJCWRldl9pbmZvKGRl
diwgIlJlamVjdGluZyBoaWdobWVtIHBhZ2UgZnJvbSBDTUEuXG4iKTsKLQkJZG1hX2ZyZWVfY29u
dGlndW91cyhkZXYsIHBhZ2UsIHNpemUpOwotCQlyZXR1cm4gTlVMTDsKKwkJZ290byBvdXRfZnJl
ZV9wYWdlczsKIAl9CiAKIAlyZXQgPSBwYWdlX2FkZHJlc3MocGFnZSk7CkBAIC0xOTUsNiArMTkx
LDkgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvY19wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNp
emVfdCBzaXplLAogCWVsc2UKIAkJKmRtYV9oYW5kbGUgPSBwaHlzX3RvX2RtYShkZXYsIHBhZ2Vf
dG9fcGh5cyhwYWdlKSk7CiAJcmV0dXJuIHJldDsKK291dF9mcmVlX3BhZ2VzOgorCWRtYV9mcmVl
X2NvbnRpZ3VvdXMoZGV2LCBwYWdlLCBzaXplKTsKKwlyZXR1cm4gTlVMTDsKIH0KIAogdm9pZCBk
bWFfZGlyZWN0X2ZyZWVfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgdm9p
ZCAqY3B1X2FkZHIsCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

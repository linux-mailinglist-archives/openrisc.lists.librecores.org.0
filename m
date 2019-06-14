Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7A06D55922
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 495F8200E3;
	Tue, 25 Jun 2019 22:41:48 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id BD10D2028A
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FVUCgCFoYGXgRdotxfVuIpfdudDn7941OPaQ1qXavC8=; b=sl95Anw/1yGtNJg+5X/ycUvw5B
 R+FPClXInpjM0I2EDyP21g2dvHAlOqQgF3zhZCLbTiK7YVrhM+htr4NidyrleEyfZlLoMqq0hcaVd
 EM6nsp1ssY0bK4+tSMjmeERHUyeGLxS0NIriyrA9ESrJBYQMGrY3UpNsRPd7ReQ99FnoaVuhg63H5
 4hZcpogxT5coYCeqkv1L+oc/QJslp8fLPfdVPLriqmGmdT+jLtU5jbKz5eeIesW2IdB0Ug1GfeDFG
 v/qpUmhAHdnFnAMTRtcnAb2KLfaZr6mO0UO/zoZ1fEOcNNbRDDEJo5eZrR4VoPS4XqfwjfHYnlCYF
 eRHc24VA==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRi-0005yA-Mt; Fri, 14 Jun 2019 14:44:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:28 +0200
Message-Id: <20190614144431.21760-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614144431.21760-1-hch@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] [PATCH 4/7] dma-mapping: add a dma_alloc_need_uncached
 helper
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
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2hlY2sgaWYgd2UgbmVlZCB0byBhbGxvY2F0ZSB1bmNhY2hlZCBtZW1vcnkgZm9yIGEgZGV2aWNl
IGdpdmVuIHRoZQphbGxvY2F0aW9uIGZsYWdzLiAgU3dpdGNoIG92ZXIgdGhlIHVuY2FjaGVkIHNl
Z21lbnQgY2hlY2sgdG8gdGhpcyBoZWxwZXIKdG8gZGVhbCB3aXRoIGFyY2hpdGVjdHVyZXMgdGhh
dCBkbyBub3Qgc3VwcG9ydCB0aGUgZG1hX2NhY2hlX3N5bmMKb3BlcmF0aW9uIGFuZCB0aHVzIHNo
b3VsZCBub3QgcmV0dXJuZWQgY2FjaGVhYmxlIG1lbW9yeSBmb3IKRE1BX0FUVFJfTk9OX0NPTlNJ
U1RFTlQgYWxsb2NhdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L2RtYS1ub25jb2hlcmVudC5oIHwgMTQgKysrKysr
KysrKysrKysKIGtlcm5lbC9kbWEvZGlyZWN0LmMgICAgICAgICAgICAgfCAgNCArKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9kbWEtbm9uY29oZXJlbnQuaCBiL2luY2x1ZGUvbGludXgvZG1hLW5v
bmNvaGVyZW50LmgKaW5kZXggN2UwMTI2YTA0ZTAyLi43MzI5MTlhYzVjMTEgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmgKKysrIGIvaW5jbHVkZS9saW51eC9kbWEt
bm9uY29oZXJlbnQuaApAQCAtMjAsNiArMjAsMjAgQEAgc3RhdGljIGlubGluZSBib29sIGRldl9p
c19kbWFfY29oZXJlbnQoc3RydWN0IGRldmljZSAqZGV2KQogfQogI2VuZGlmIC8qIENPTkZJR19B
UkNIX0hBU19ETUFfQ09IRVJFTkNFX0ggKi8KIAorLyoKKyAqIENoZWNrIGlmIGFuIGFsbG9jYXRp
b24gbmVlZHMgdG8gYmUgbWFya2VkIHVuY2FjaGVkIHRvIGJlIGNvaGVyZW50LgorICovCitzdGF0
aWMgaW5saW5lIGJvb2wgZG1hX2FsbG9jX25lZWRfdW5jYWNoZWQoc3RydWN0IGRldmljZSAqZGV2
LAorCQl1bnNpZ25lZCBsb25nIGF0dHJzKQoreworCWlmIChkZXZfaXNfZG1hX2NvaGVyZW50KGRl
dikpCisJCXJldHVybiBmYWxzZTsKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfRE1BX05PTkNPSEVS
RU5UX0NBQ0hFX1NZTkMpICYmCisJICAgIChhdHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5U
KSkKKwkJcmV0dXJuIGZhbHNlOworCXJldHVybiB0cnVlOworfQorCiB2b2lkICphcmNoX2RtYV9h
bGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFu
ZGxlLAogCQlnZnBfdCBnZnAsIHVuc2lnbmVkIGxvbmcgYXR0cnMpOwogdm9pZCBhcmNoX2RtYV9m
cmVlKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIHZvaWQgKmNwdV9hZGRyLApkaWZm
IC0tZ2l0IGEva2VybmVsL2RtYS9kaXJlY3QuYyBiL2tlcm5lbC9kbWEvZGlyZWN0LmMKaW5kZXgg
YjY3ZjBhYTA4YWEzLi5jMjg5MzcxM2JmODAgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9kbWEvZGlyZWN0
LmMKKysrIGIva2VybmVsL2RtYS9kaXJlY3QuYwpAQCAtMTYwLDcgKzE2MCw3IEBAIHZvaWQgKmRt
YV9kaXJlY3RfYWxsb2NfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwKIAlt
ZW1zZXQocmV0LCAwLCBzaXplKTsKIAogCWlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19V
TkNBQ0hFRF9TRUdNRU5UKSAmJgotCSAgICAhZGV2X2lzX2RtYV9jb2hlcmVudChkZXYpICYmICEo
YXR0cnMgJiBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCkpIHsKKwkgICAgZG1hX2FsbG9jX25lZWRf
dW5jYWNoZWQoZGV2LCBhdHRycykpIHsKIAkJYXJjaF9kbWFfcHJlcF9jb2hlcmVudChwYWdlLCBz
aXplKTsKIAkJcmV0ID0gdW5jYWNoZWRfa2VybmVsX2FkZHJlc3MocmV0KTsKIAl9CkBAIC0xODIs
NyArMTgyLDcgQEAgdm9pZCBkbWFfZGlyZWN0X2ZyZWVfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2
LCBzaXplX3Qgc2l6ZSwgdm9pZCAqY3B1X2FkZHIsCiAJCXNldF9tZW1vcnlfZW5jcnlwdGVkKCh1
bnNpZ25lZCBsb25nKWNwdV9hZGRyLCAxIDw8IHBhZ2Vfb3JkZXIpOwogCiAJaWYgKElTX0VOQUJM
RUQoQ09ORklHX0FSQ0hfSEFTX1VOQ0FDSEVEX1NFR01FTlQpICYmCi0JICAgICFkZXZfaXNfZG1h
X2NvaGVyZW50KGRldikgJiYgIShhdHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5UKSkKKwkg
ICAgZG1hX2FsbG9jX25lZWRfdW5jYWNoZWQoZGV2LCBhdHRycykpCiAJCWNwdV9hZGRyID0gY2Fj
aGVkX2tlcm5lbF9hZGRyZXNzKGNwdV9hZGRyKTsKIAlfX2RtYV9kaXJlY3RfZnJlZV9wYWdlcyhk
ZXYsIHNpemUsIHZpcnRfdG9fcGFnZShjcHVfYWRkcikpOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

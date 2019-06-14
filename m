Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA1F5591F
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A6EE2202F7;
	Tue, 25 Jun 2019 22:41:46 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 6496420289
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PPh+LEJJkGlws2bM8T6WqvI8rRhSUTXZv5KuVG6RfrU=; b=u7OReZeaPTH6LLZqfu0lio/fTq
 Wm5i5uBvEZ7sT7UCF5kStdC/ZqTJrDwkBm+cBz5LQHK3C7+p5kKEUgqqSP5T+CT5v6mjWc813FwqM
 ccfBTNJW7893FHAjQCJWXWbi1qPBnhg5SntdO1Nu4CTxqv9lW2kmCWmBN7zfJrQPHTpHiQUiCFTVV
 l/9GFsIdgxFm3XHS1Tva/g4lI5iEBTVdZV3In5xazHZVxbnkIqX+hF29+x79xgOApQuCZVfdDBjy9
 3zkbZX4/bKtG8xempfi0HSaxIe9PmB9SZF1Yuz/drS2symmous/FFf+Oy3HJ74IDvWe0e2VwCOjhL
 9nLpskow==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRY-0005pM-87; Fri, 14 Jun 2019 14:44:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:25 +0200
Message-Id: <20190614144431.21760-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614144431.21760-1-hch@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] [PATCH 1/7] arm-nommu: remove the partial
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
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGFybS1ub21tdSBETUEgY29kZSBzdXBwb3J0cyBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCBh
bGxvY2F0aW9ucywgYnV0CmRvZXMgbm90IHByb3ZpZGUgYSBjYWNoZV9zeW5jIG9wZXJhdGlvbi4g
IFRoaXMgbWVhbnMgYW55IHVzZXIgb2YgaXQKd2lsbCBuZXZlciBiZSBhYmxlIHRvIGFjdHVhbGx5
IHRyYW5zZmVyIGNhY2hlIG93bmVyc2hpcCBhbmQgdGh1cyBjYXVzZQpjb2hlcmVuY3kgYnVncy4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gv
YXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMgfCAyNCArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL21tL2RtYS1tYXBwaW5nLW5vbW11LmMgYi9hcmNoL2FybS9tbS9kbWEt
bWFwcGluZy1ub21tdS5jCmluZGV4IGYzMDRiMTBlMjNhNC4uYmMwMDNkZjQ1NTQ2IDEwMDY0NAot
LS0gYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy1ub21tdS5jCisrKyBiL2FyY2gvYXJtL21tL2Rt
YS1tYXBwaW5nLW5vbW11LmMKQEAgLTM5LDE4ICszOSw3IEBAIHN0YXRpYyB2b2lkICphcm1fbm9t
bXVfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsCiAJCQkJIHVuc2ln
bmVkIGxvbmcgYXR0cnMpCiAKIHsKLQl2b2lkICpyZXQ7Ci0KLQkvKgotCSAqIFRyeSBnZW5lcmlj
IGFsbG9jYXRvciBmaXJzdCBpZiB3ZSBhcmUgYWR2ZXJ0aXNlZCB0aGF0Ci0JICogY29uc2lzdGVu
Y3kgaXMgbm90IHJlcXVpcmVkLgotCSAqLwotCi0JaWYgKGF0dHJzICYgRE1BX0FUVFJfTk9OX0NP
TlNJU1RFTlQpCi0JCXJldHVybiBkbWFfZGlyZWN0X2FsbG9jX3BhZ2VzKGRldiwgc2l6ZSwgZG1h
X2hhbmRsZSwgZ2ZwLAotCQkJCWF0dHJzKTsKLQotCXJldCA9IGRtYV9hbGxvY19mcm9tX2dsb2Jh
bF9jb2hlcmVudChzaXplLCBkbWFfaGFuZGxlKTsKKwl2b2lkICpyZXQgPSBkbWFfYWxsb2NfZnJv
bV9nbG9iYWxfY29oZXJlbnQoc2l6ZSwgZG1hX2hhbmRsZSk7CiAKIAkvKgogCSAqIGRtYV9hbGxv
Y19mcm9tX2dsb2JhbF9jb2hlcmVudCgpIG1heSBmYWlsIGJlY2F1c2U6CkBAIC03MCwxNiArNTks
OSBAQCBzdGF0aWMgdm9pZCBhcm1fbm9tbXVfZG1hX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2LCBz
aXplX3Qgc2l6ZSwKIAkJCSAgICAgICB2b2lkICpjcHVfYWRkciwgZG1hX2FkZHJfdCBkbWFfYWRk
ciwKIAkJCSAgICAgICB1bnNpZ25lZCBsb25nIGF0dHJzKQogewotCWlmIChhdHRycyAmIERNQV9B
VFRSX05PTl9DT05TSVNURU5UKSB7Ci0JCWRtYV9kaXJlY3RfZnJlZV9wYWdlcyhkZXYsIHNpemUs
IGNwdV9hZGRyLCBkbWFfYWRkciwgYXR0cnMpOwotCX0gZWxzZSB7Ci0JCWludCByZXQgPSBkbWFf
cmVsZWFzZV9mcm9tX2dsb2JhbF9jb2hlcmVudChnZXRfb3JkZXIoc2l6ZSksCi0JCQkJCQkJICAg
Y3B1X2FkZHIpOwotCi0JCVdBUk5fT05fT05DRShyZXQgPT0gMCk7Ci0JfQorCWludCByZXQgPSBk
bWFfcmVsZWFzZV9mcm9tX2dsb2JhbF9jb2hlcmVudChnZXRfb3JkZXIoc2l6ZSksIGNwdV9hZGRy
KTsKIAotCXJldHVybjsKKwlXQVJOX09OX09OQ0UocmV0ID09IDApOwogfQogCiBzdGF0aWMgaW50
IGFybV9ub21tdV9kbWFfbW1hcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

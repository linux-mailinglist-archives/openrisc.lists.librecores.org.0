Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CD3BC55920
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 43F0B200E4;
	Tue, 25 Jun 2019 22:41:47 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id A83BC20288
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FikfEnli7xC3lWxMo+lrSP8bukYq9kMRpBEiMtrt4/8=; b=jMCi+UGNulu+sLWA3p7lmnVzIu
 8tg1b4N89gHYYqIp7VN1qjjGT1kdHaoXPo9PFciOiveCQKhbEZ0HwwLdHN/lfh8BsC2KDllTyxWVt
 /WBG8sXigMo3SZb6jMSGAul5g1Rtpxf58hNKCxmDLHTap+JOkoMX8CX5U46kQp818Yc7zxT449bvt
 WPetfy9Mvq5j0wl+sIaUvALnCf9h5pWCEh4fVtPmAtdzLFlAa981kSK7S2iOBnEkLI2mxdP+kuege
 d37W3Oqew9mcoHxcxKMWWbymrqJWuTGGPk13ipyllLMxtA7t++cJWoHEQXa/NoOE24CeA9wQZH1ia
 eSBCHtOg==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRb-0005pn-PS; Fri, 14 Jun 2019 14:44:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:26 +0200
Message-Id: <20190614144431.21760-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614144431.21760-1-hch@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] [PATCH 2/7] arc: remove the partial
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

VGhlIGFyYyBETUEgY29kZSBzdXBwb3J0cyBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCBhbGxvY2F0
aW9ucywgYnV0IGRvZXMKbm90IHByb3ZpZGUgYSBjYWNoZV9zeW5jIG9wZXJhdGlvbi4gIFRoaXMg
bWVhbnMgYW55IHVzZXIgb2YgaXQgd2lsbApuZXZlciBiZSBhYmxlIHRvIGFjdHVhbGx5IHRyYW5z
ZmVyIGNhY2hlIG93bmVyc2hpcCBhbmQgdGh1cyBjYXVzZQpjb2hlcmVuY3kgYnVncy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJjL21t
L2RtYS5jIHwgMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FyYy9tbS9kbWEu
YyBiL2FyY2gvYXJjL21tL2RtYS5jCmluZGV4IDE1MjVhYzAwZmQwMi4uOTgzMjkyOGY4OTZkIDEw
MDY0NAotLS0gYS9hcmNoL2FyYy9tbS9kbWEuYworKysgYi9hcmNoL2FyYy9tbS9kbWEuYwpAQCAt
MjQsNyArMjQsNiBAQCB2b2lkICphcmNoX2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNp
emVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlLAogCXN0cnVjdCBwYWdlICpwYWdlOwog
CXBoeXNfYWRkcl90IHBhZGRyOwogCXZvaWQgKmt2YWRkcjsKLQlib29sIG5lZWRfY29oID0gIShh
dHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5UKTsKIAogCS8qCiAJICogX19HRlBfSElHSE1F
TSBmbGFnIGlzIGNsZWFyZWQgYnkgdXBwZXIgbGF5ZXIgZnVuY3Rpb25zCkBAIC00NiwxNCArNDUs
MTAgQEAgdm9pZCAqYXJjaF9kbWFfYWxsb2Moc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qgc2l6
ZSwgZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSwKIAkgKiBBIGNvaGVyZW50IGJ1ZmZlciBuZWVkcyBN
TVUgbWFwcGluZyB0byBlbmZvcmNlIG5vbi1jYWNoYWJpbGl0eS4KIAkgKiBrdmFkZHIgaXMga2Vy
bmVsIFZpcnR1YWwgYWRkcmVzcyAoMHg3MDAwXzAwMDAgYmFzZWQpLgogCSAqLwotCWlmIChuZWVk
X2NvaCkgewotCQlrdmFkZHIgPSBpb3JlbWFwX25vY2FjaGUocGFkZHIsIHNpemUpOwotCQlpZiAo
a3ZhZGRyID09IE5VTEwpIHsKLQkJCV9fZnJlZV9wYWdlcyhwYWdlLCBvcmRlcik7Ci0JCQlyZXR1
cm4gTlVMTDsKLQkJfQotCX0gZWxzZSB7Ci0JCWt2YWRkciA9ICh2b2lkICopKHUzMilwYWRkcjsK
KwlrdmFkZHIgPSBpb3JlbWFwX25vY2FjaGUocGFkZHIsIHNpemUpOworCWlmIChrdmFkZHIgPT0g
TlVMTCkgeworCQlfX2ZyZWVfcGFnZXMocGFnZSwgb3JkZXIpOworCQlyZXR1cm4gTlVMTDsKIAl9
CiAKIAkvKgpAQCAtNjYsOSArNjEsNyBAQCB2b2lkICphcmNoX2RtYV9hbGxvYyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlLAogCSAqIEN1cnJl
bnRseSBmbHVzaF9jYWNoZV92bWFwIG51a2VzIHRoZSBMMSBjYWNoZSBjb21wbGV0ZWx5IHdoaWNo
CiAJICogd2lsbCBiZSBvcHRpbWl6ZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQKIAkgKi8KLQlpZiAo
bmVlZF9jb2gpCi0JCWRtYV9jYWNoZV93YmFja19pbnYocGFkZHIsIHNpemUpOwotCisJZG1hX2Nh
Y2hlX3diYWNrX2ludihwYWRkciwgc2l6ZSk7CiAJcmV0dXJuIGt2YWRkcjsKIH0KIApAQCAtNzgs
OSArNzEsNyBAQCB2b2lkIGFyY2hfZG1hX2ZyZWUoc3RydWN0IGRldmljZSAqZGV2LCBzaXplX3Qg
c2l6ZSwgdm9pZCAqdmFkZHIsCiAJcGh5c19hZGRyX3QgcGFkZHIgPSBkbWFfaGFuZGxlOwogCXN0
cnVjdCBwYWdlICpwYWdlID0gdmlydF90b19wYWdlKHBhZGRyKTsKIAotCWlmICghKGF0dHJzICYg
RE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQpKQotCQlpb3VubWFwKCh2b2lkIF9fZm9yY2UgX19pb21l
bSAqKXZhZGRyKTsKLQorCWlvdW5tYXAoKHZvaWQgX19mb3JjZSBfX2lvbWVtICopdmFkZHIpOwog
CV9fZnJlZV9wYWdlcyhwYWdlLCBnZXRfb3JkZXIoc2l6ZSkpOwogfQogCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

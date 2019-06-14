Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5BF55924
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EA74D20156;
	Tue, 25 Jun 2019 22:41:49 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 9D1192028D
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uwnDv1KhES3Re+AMwM82pmt+rEujP4N4t/Md4KoSM88=; b=goAYdDm609nD5VBcnMmPH4v15P
 kYpPS40DH9d8YqwKfLgZO/b3FSOZOgUzamHnQFqToxP9H/DyUbvT/dwC04XH4P2LRiWrRVieXp1n5
 JbZ9AupJ6l+ROXP8jJv5jVaSekslaf+Wl2a/PO6rwDnQtclWPO3SY5W6LLZXYe9wRp/1qZhY1W2Cz
 W4omLGDSRkZ85dQ0h9KHFiYDUreq6puCMLiGeqeZ8wHYpe7AoozVZnMRUEkW5owjwIYA4YRLwzi0s
 dGictznwZyHKAr3d2Ljl3S60RN72I89FmbWsVVLfqJqLaTZ06iRd1DI4tkRLl42MAjBngAdrkUHoD
 B3WIkXlw==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRt-00069J-D9; Fri, 14 Jun 2019 14:45:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:31 +0200
Message-Id: <20190614144431.21760-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614144431.21760-1-hch@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] [PATCH 7/7] arc: use the generic remapping allocator for
 coherent DMA allocations
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

UmVwbGFjZSB0aGUgY29kZSB0aGF0IHNldHMgdXAgdW5jYWNoZWQgUFRFcyB3aXRoIHRoZSBnZW5l
cmljIHZtYXAgYmFzZWQKcmVtYXBwaW5nIGNvZGUuICBJdCBhbHNvIHByb3ZpZGVzIGFuIGF0b21p
YyBwb29sIGZvciBhbGxvY2F0aW9ucyBmcm9tCm5vbi1ibG9ja2luZyBjb250ZXh0LCB3aGljaCB3
ZSBub3QgcHJvcGVybHkgc3VwcG9ydGVkIGJ5IHRoZSBleGlzdGluZwphcmMgY29kZS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJjL0tj
b25maWcgIHwgIDIgKysKIGFyY2gvYXJjL21tL2RtYS5jIHwgNjIgKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcmMvS2NvbmZpZyBi
L2FyY2gvYXJjL0tjb25maWcKaW5kZXggMjNlMDYzZGY1ZDJjLi5jZGFkN2QzMGZmMWQgMTAwNjQ0
Ci0tLSBhL2FyY2gvYXJjL0tjb25maWcKKysrIGIvYXJjaC9hcmMvS2NvbmZpZwpAQCAtMTAsNiAr
MTAsNyBAQCBjb25maWcgQVJDCiAJZGVmX2Jvb2wgeQogCXNlbGVjdCBBUkNfVElNRVJTCiAJc2Vs
ZWN0IEFSQ0hfSEFTX0RNQV9DT0hFUkVOVF9UT19QRk4KKwlzZWxlY3QgQVJDSF9IQVNfRE1BX1BS
RVBfQ09IRVJFTlQKIAlzZWxlY3QgQVJDSF9IQVNfUFRFX1NQRUNJQUwKIAlzZWxlY3QgQVJDSF9I
QVNfU0VUVVBfRE1BX09QUwogCXNlbGVjdCBBUkNIX0hBU19TWU5DX0RNQV9GT1JfQ1BVCkBAIC0x
OSw2ICsyMCw3IEBAIGNvbmZpZyBBUkMKIAlzZWxlY3QgQlVJTERUSU1FX0VYVEFCTEVfU09SVAog
CXNlbGVjdCBDTE9ORV9CQUNLV0FSRFMKIAlzZWxlY3QgQ09NTU9OX0NMSworCXNlbGVjdCBETUFf
RElSRUNUX1JFTUFQCiAJc2VsZWN0IEdFTkVSSUNfQVRPTUlDNjQgaWYgIUlTQV9BUkNWMiB8fCAh
KEFSQ19IQVNfTEw2NCAmJiBBUkNfSEFTX0xMU0MpCiAJc2VsZWN0IEdFTkVSSUNfQ0xPQ0tFVkVO
VFMKIAlzZWxlY3QgR0VORVJJQ19GSU5EX0ZJUlNUX0JJVApkaWZmIC0tZ2l0IGEvYXJjaC9hcmMv
bW0vZG1hLmMgYi9hcmNoL2FyYy9tbS9kbWEuYwppbmRleCA5ODMyOTI4Zjg5NmQuLjBmYTg1MDcw
OWZhYyAxMDA2NDQKLS0tIGEvYXJjaC9hcmMvbW0vZG1hLmMKKysrIGIvYXJjaC9hcmMvbW0vZG1h
LmMKQEAgLTExLDQ2ICsxMSwxNSBAQAogI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+CiAKIC8q
Ci0gKiBBUkNIIHNwZWNpZmljIGNhbGxiYWNrcyBmb3IgZ2VuZXJpYyBub25jb2hlcmVudCBETUEg
b3BzIChkbWEvbm9uY29oZXJlbnQuYykKKyAqIEFSQ0ggc3BlY2lmaWMgY2FsbGJhY2tzIGZvciBn
ZW5lcmljIG5vbmNvaGVyZW50IERNQSBvcHMKICAqICAtIGhhcmR3YXJlIElPQyBub3QgYXZhaWxh
YmxlIChvciAiZG1hLWNvaGVyZW50IiBub3Qgc2V0IGZvciBkZXZpY2UgaW4gRFQpCiAgKiAgLSBC
dXQgc3RpbGwgaGFuZGxlIGJvdGggY29oZXJlbnQgYW5kIG5vbi1jb2hlcmVudCByZXF1ZXN0cyBm
cm9tIGNhbGxlcgogICoKICAqIEZvciBETUEgY29oZXJlbnQgaGFyZHdhcmUgKElPQykgZ2VuZXJp
YyBjb2RlIHN1ZmZpY2VzCiAgKi8KLXZvaWQgKmFyY2hfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc2l6ZV90IHNpemUsIGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsCi0JCWdmcF90IGdmcCwg
dW5zaWduZWQgbG9uZyBhdHRycykKLXsKLQl1bnNpZ25lZCBsb25nIG9yZGVyID0gZ2V0X29yZGVy
KHNpemUpOwotCXN0cnVjdCBwYWdlICpwYWdlOwotCXBoeXNfYWRkcl90IHBhZGRyOwotCXZvaWQg
Kmt2YWRkcjsKLQotCS8qCi0JICogX19HRlBfSElHSE1FTSBmbGFnIGlzIGNsZWFyZWQgYnkgdXBw
ZXIgbGF5ZXIgZnVuY3Rpb25zCi0JICogKGluIGluY2x1ZGUvbGludXgvZG1hLW1hcHBpbmcuaCkg
c28gd2Ugc2hvdWxkIG5ldmVyIGdldCBhCi0JICogX19HRlBfSElHSE1FTSBoZXJlLgotCSAqLwot
CUJVR19PTihnZnAgJiBfX0dGUF9ISUdITUVNKTsKLQotCXBhZ2UgPSBhbGxvY19wYWdlcyhnZnAg
fCBfX0dGUF9aRVJPLCBvcmRlcik7Ci0JaWYgKCFwYWdlKQotCQlyZXR1cm4gTlVMTDsKLQotCS8q
IFRoaXMgaXMgbGluZWFyIGFkZHIgKDB4ODAwMF8wMDAwIGJhc2VkKSAqLwotCXBhZGRyID0gcGFn
ZV90b19waHlzKHBhZ2UpOwotCi0JKmRtYV9oYW5kbGUgPSBwYWRkcjsKLQotCS8qCi0JICogQSBj
b2hlcmVudCBidWZmZXIgbmVlZHMgTU1VIG1hcHBpbmcgdG8gZW5mb3JjZSBub24tY2FjaGFiaWxp
dHkuCi0JICoga3ZhZGRyIGlzIGtlcm5lbCBWaXJ0dWFsIGFkZHJlc3MgKDB4NzAwMF8wMDAwIGJh
c2VkKS4KLQkgKi8KLQlrdmFkZHIgPSBpb3JlbWFwX25vY2FjaGUocGFkZHIsIHNpemUpOwotCWlm
IChrdmFkZHIgPT0gTlVMTCkgewotCQlfX2ZyZWVfcGFnZXMocGFnZSwgb3JkZXIpOwotCQlyZXR1
cm4gTlVMTDsKLQl9CiAKK3ZvaWQgYXJjaF9kbWFfcHJlcF9jb2hlcmVudChzdHJ1Y3QgcGFnZSAq
cGFnZSwgc2l6ZV90IHNpemUpCit7CiAJLyoKIAkgKiBFdmljdCBhbnkgZXhpc3RpbmcgTDEgYW5k
L29yIEwyIGxpbmVzIGZvciB0aGUgYmFja2luZyBwYWdlCiAJICogaW4gY2FzZSBpdCB3YXMgdXNl
ZCBlYXJsaWVyIGFzIGEgbm9ybWFsICJjYWNoZWQiIHBhZ2UuCkBAIC02MSwyNCArMzAsNyBAQCB2
b2lkICphcmNoX2RtYV9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLCBkbWFf
YWRkcl90ICpkbWFfaGFuZGxlLAogCSAqIEN1cnJlbnRseSBmbHVzaF9jYWNoZV92bWFwIG51a2Vz
IHRoZSBMMSBjYWNoZSBjb21wbGV0ZWx5IHdoaWNoCiAJICogd2lsbCBiZSBvcHRpbWl6ZWQgYXMg
YSBzZXBhcmF0ZSBjb21taXQKIAkgKi8KLQlkbWFfY2FjaGVfd2JhY2tfaW52KHBhZGRyLCBzaXpl
KTsKLQlyZXR1cm4ga3ZhZGRyOwotfQotCi12b2lkIGFyY2hfZG1hX2ZyZWUoc3RydWN0IGRldmlj
ZSAqZGV2LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsCi0JCWRtYV9hZGRyX3QgZG1hX2hhbmRs
ZSwgdW5zaWduZWQgbG9uZyBhdHRycykKLXsKLQlwaHlzX2FkZHJfdCBwYWRkciA9IGRtYV9oYW5k
bGU7Ci0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSB2aXJ0X3RvX3BhZ2UocGFkZHIpOwotCi0JaW91bm1h
cCgodm9pZCBfX2ZvcmNlIF9faW9tZW0gKil2YWRkcik7Ci0JX19mcmVlX3BhZ2VzKHBhZ2UsIGdl
dF9vcmRlcihzaXplKSk7Ci19Ci0KLWxvbmcgYXJjaF9kbWFfY29oZXJlbnRfdG9fcGZuKHN0cnVj
dCBkZXZpY2UgKmRldiwgdm9pZCAqY3B1X2FkZHIsCi0JCWRtYV9hZGRyX3QgZG1hX2FkZHIpCi17
Ci0JcmV0dXJuIF9fcGh5c190b19wZm4oZG1hX2FkZHIpOworCWRtYV9jYWNoZV93YmFja19pbnYo
cGFnZV90b19waHlzKHBhZ2UpLCBzaXplKTsKIH0KIAogLyoKQEAgLTE1NSwzICsxMDcsOSBAQCB2
b2lkIGFyY2hfc2V0dXBfZG1hX29wcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBkbWFfYmFzZSwg
dTY0IHNpemUsCiAJZGV2X2luZm8oZGV2LCAidXNlICVzbmNvaGVyZW50IERNQSBvcHNcbiIsCiAJ
CSBkZXYtPmRtYV9jb2hlcmVudCA/ICIiIDogIm5vbiIpOwogfQorCitzdGF0aWMgaW50IF9faW5p
dCBhdG9taWNfcG9vbF9pbml0KHZvaWQpCit7CisJcmV0dXJuIGRtYV9hdG9taWNfcG9vbF9pbml0
KEdGUF9LRVJORUwsIHBncHJvdF9ub25jYWNoZWQoUEFHRV9LRVJORUwpKTsKK30KK3Bvc3Rjb3Jl
X2luaXRjYWxsKGF0b21pY19wb29sX2luaXQpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

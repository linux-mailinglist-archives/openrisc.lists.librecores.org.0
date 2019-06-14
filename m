Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2260C55921
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9CDF0200FD;
	Tue, 25 Jun 2019 22:41:47 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2588C2017F
 for <openrisc@lists.librecores.org>; Fri, 14 Jun 2019 16:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBS/c6aAhCoK2T6+N2wWDRsaGJYTqp8SPA32e8G5Vls=; b=tQ3Dza/QcBJcS38+zf1dMFcwCR
 wOWrL7rj6nwYDGt7VTXJkayT9/vZ1B1x4y6D+70rRKXSK0Keg6en3t+OTABeFd2MpMr6pi86RsaVv
 piVg2obLpRIoHvWzGLid0ELT35b1jqNF8QOOvwr8qGwZL0fdgp7LNTCL5filwC7OjiebCX4sthC0R
 LoS2RmnWVPXEnO4xRcoY5OEvzqNgteFFeh0MPXGj/XsEnq99n4pB4DCMv1lJmzwZmadHpw25t0mwr
 l2JSMDIinJkBK1eMoahM70H9Du6SxZPPEN9FotSUwUszwxcjBfNcWhcuX+BBsRZNYIAsJs9aPJrRy
 4Dbh4RGg==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbnRf-0005uj-AL; Fri, 14 Jun 2019 14:44:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Vineet Gupta <vgupta@synopsys.com>
Date: Fri, 14 Jun 2019 16:44:27 +0200
Message-Id: <20190614144431.21760-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614144431.21760-1-hch@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: [OpenRISC] [PATCH 3/7] openrisc: remove the partial
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

VGhlIG9wZW5yaXNjIERNQSBjb2RlIHN1cHBvcnRzIERNQV9BVFRSX05PTl9DT05TSVNURU5UIGFs
bG9jYXRpb25zLCBidXQKZG9lcyBub3QgcHJvdmlkZSBhIGNhY2hlX3N5bmMgb3BlcmF0aW9uLiAg
VGhpcyBtZWFucyBhbnkgdXNlciBvZiBpdAp3aWxsIG5ldmVyIGJlIGFibGUgdG8gYWN0dWFsbHkg
dHJhbnNmZXIgY2FjaGUgb3duZXJzaGlwIGFuZCB0aHVzIGNhdXNlCmNvaGVyZW5jeSBidWdzLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9v
cGVucmlzYy9rZXJuZWwvZG1hLmMgfCAyMiArKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL29wZW5yaXNjL2tlcm5lbC9kbWEuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL2RtYS5jCmlu
ZGV4IGY3OTQ1N2NiMzc0MS4uOWYyNWZkMGZiYjVkIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNj
L2tlcm5lbC9kbWEuYworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9kbWEuYwpAQCAtOTgsMTUg
Kzk4LDEzIEBAIGFyY2hfZG1hX2FsbG9jKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNpemUs
IGRtYV9hZGRyX3QgKmRtYV9oYW5kbGUsCiAKIAl2YSA9ICh1bnNpZ25lZCBsb25nKXBhZ2U7CiAK
LQlpZiAoKGF0dHJzICYgRE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQpID09IDApIHsKLQkJLyoKLQkJ
ICogV2UgbmVlZCB0byBpdGVyYXRlIHRocm91Z2ggdGhlIHBhZ2VzLCBjbGVhcmluZyB0aGUgZGNh
Y2hlIGZvcgotCQkgKiB0aGVtIGFuZCBzZXR0aW5nIHRoZSBjYWNoZS1pbmhpYml0IGJpdC4KLQkJ
ICovCi0JCWlmICh3YWxrX3BhZ2VfcmFuZ2UodmEsIHZhICsgc2l6ZSwgJndhbGspKSB7Ci0JCQlm
cmVlX3BhZ2VzX2V4YWN0KHBhZ2UsIHNpemUpOwotCQkJcmV0dXJuIE5VTEw7Ci0JCX0KKwkvKgor
CSAqIFdlIG5lZWQgdG8gaXRlcmF0ZSB0aHJvdWdoIHRoZSBwYWdlcywgY2xlYXJpbmcgdGhlIGRj
YWNoZSBmb3IKKwkgKiB0aGVtIGFuZCBzZXR0aW5nIHRoZSBjYWNoZS1pbmhpYml0IGJpdC4KKwkg
Ki8KKwlpZiAod2Fsa19wYWdlX3JhbmdlKHZhLCB2YSArIHNpemUsICZ3YWxrKSkgeworCQlmcmVl
X3BhZ2VzX2V4YWN0KHBhZ2UsIHNpemUpOworCQlyZXR1cm4gTlVMTDsKIAl9CiAKIAlyZXR1cm4g
KHZvaWQgKil2YTsKQEAgLTEyMiwxMCArMTIwLDggQEAgYXJjaF9kbWFfZnJlZShzdHJ1Y3QgZGV2
aWNlICpkZXYsIHNpemVfdCBzaXplLCB2b2lkICp2YWRkciwKIAkJLm1tID0gJmluaXRfbW0KIAl9
OwogCi0JaWYgKChhdHRycyAmIERNQV9BVFRSX05PTl9DT05TSVNURU5UKSA9PSAwKSB7Ci0JCS8q
IHdhbGtfcGFnZV9yYW5nZSBzaG91bGRuJ3QgYmUgYWJsZSB0byBmYWlsIGhlcmUgKi8KLQkJV0FS
Tl9PTih3YWxrX3BhZ2VfcmFuZ2UodmEsIHZhICsgc2l6ZSwgJndhbGspKTsKLQl9CisJLyogd2Fs
a19wYWdlX3JhbmdlIHNob3VsZG4ndCBiZSBhYmxlIHRvIGZhaWwgaGVyZSAqLworCVdBUk5fT04o
d2Fsa19wYWdlX3JhbmdlKHZhLCB2YSArIHNpemUsICZ3YWxrKSk7CiAKIAlmcmVlX3BhZ2VzX2V4
YWN0KHZhZGRyLCBzaXplKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

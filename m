Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1E96CEAEA6
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B8B9420767;
	Thu, 31 Oct 2019 12:21:20 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 6CD6B206E7
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kfe9DrjfiddN7oSCREyZqOEpkhAZTlXuSa60xXNtXBE=; b=u6C8VW8HDF5uhDsgGir7FkotJE
 iY3CIYD/oeU7maFqk3UyguTvxJDf69n0ff2tfIYLfYA9Pc0NXShdhrVMk86wHjqdtdvqKyC0hIumt
 +LtuGXKNoMjLEYkWFMmULFGKL3LcBu0zYYkgmV6MozEZFUXZYFrS+O4hz7t7Q4/Wf+9Vrr/JePGBM
 224vDAAwwYm1jeN8ZO6T08hmi5ogcOLybAkPi50H0W8eT1IFx+Y+F8w2Xtux8DDq+EvOAWt9+OTFg
 6yUl8G2I6KgFPYPvST4uYjhC5PS0buYylh9n9OfnQVNtvQFJCN5ht8awazoSi0qZ/Kc9HwuEIQjnI
 V6z183EA==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJ2-0003J6-Ca; Tue, 29 Oct 2019 06:48:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:14 +0100
Message-Id: <20191029064834.23438-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 01/21] arm: remove ioremap_cached
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Tm8gdXNlcnMgb2YgaW9yZW1hcF9jYWNoZWQgYXJlIGxlZnQsIHJlbW92ZSBpdC4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJtL2luY2x1
ZGUvYXNtL2lvLmggfCA2IC0tLS0tLQogYXJjaC9hcm0vbW0vaW9yZW1hcC5jICAgICB8IDQgLS0t
LQogYXJjaC9hcm0vbW0vbW11LmMgICAgICAgICB8IDIgKy0KIGFyY2gvYXJtL21tL25vbW11LmMg
ICAgICAgfCA0IC0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lvLmggYi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9pby5oCmluZGV4IDdhMDU5NmZjYjJlNy4uOTI0ZjlkZDUwMmVkIDEwMDY0
NAotLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL2lvLmgKQEAgLTQwMCwxMiArNDAwLDYgQEAgdm9pZCBfX2lvbWVtICppb3JlbWFwKHJlc291
cmNlX3NpemVfdCByZXNfY29va2llLCBzaXplX3Qgc2l6ZSk7CiB2b2lkIF9faW9tZW0gKmlvcmVt
YXBfY2FjaGUocmVzb3VyY2Vfc2l6ZV90IHJlc19jb29raWUsIHNpemVfdCBzaXplKTsKICNkZWZp
bmUgaW9yZW1hcF9jYWNoZSBpb3JlbWFwX2NhY2hlCiAKLS8qCi0gKiBEbyBub3QgdXNlIGlvcmVt
YXBfY2FjaGVkIGluIG5ldyBjb2RlLiBQcm92aWRlZCBmb3IgdGhlIGJlbmVmaXQgb2YKLSAqIHRo
ZSBweGEyeHgtZmxhc2ggTVREIGRyaXZlciBvbmx5LgotICovCi12b2lkIF9faW9tZW0gKmlvcmVt
YXBfY2FjaGVkKHJlc291cmNlX3NpemVfdCByZXNfY29va2llLCBzaXplX3Qgc2l6ZSk7Ci0KIHZv
aWQgX19pb21lbSAqaW9yZW1hcF93YyhyZXNvdXJjZV9zaXplX3QgcmVzX2Nvb2tpZSwgc2l6ZV90
IHNpemUpOwogI2RlZmluZSBpb3JlbWFwX3djIGlvcmVtYXBfd2MKICNkZWZpbmUgaW9yZW1hcF93
dCBpb3JlbWFwX3djCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9pb3JlbWFwLmMgYi9hcmNoL2Fy
bS9tbS9pb3JlbWFwLmMKaW5kZXggZDQyYjkzMzE2MTgzLi43MjI4NmY5YTRkMzAgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL21tL2lvcmVtYXAuYworKysgYi9hcmNoL2FybS9tbS9pb3JlbWFwLmMKQEAg
LTM4MiwxNSArMzgyLDExIEBAIHZvaWQgX19pb21lbSAqaW9yZW1hcChyZXNvdXJjZV9zaXplX3Qg
cmVzX2Nvb2tpZSwgc2l6ZV90IHNpemUpCiBFWFBPUlRfU1lNQk9MKGlvcmVtYXApOwogCiB2b2lk
IF9faW9tZW0gKmlvcmVtYXBfY2FjaGUocmVzb3VyY2Vfc2l6ZV90IHJlc19jb29raWUsIHNpemVf
dCBzaXplKQotCV9fYWxpYXMoaW9yZW1hcF9jYWNoZWQpOwotCi12b2lkIF9faW9tZW0gKmlvcmVt
YXBfY2FjaGVkKHJlc291cmNlX3NpemVfdCByZXNfY29va2llLCBzaXplX3Qgc2l6ZSkKIHsKIAly
ZXR1cm4gYXJjaF9pb3JlbWFwX2NhbGxlcihyZXNfY29va2llLCBzaXplLCBNVF9ERVZJQ0VfQ0FD
SEVELAogCQkJCSAgIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7CiB9CiBFWFBPUlRfU1lN
Qk9MKGlvcmVtYXBfY2FjaGUpOwotRVhQT1JUX1NZTUJPTChpb3JlbWFwX2NhY2hlZCk7CiAKIHZv
aWQgX19pb21lbSAqaW9yZW1hcF93YyhyZXNvdXJjZV9zaXplX3QgcmVzX2Nvb2tpZSwgc2l6ZV90
IHNpemUpCiB7CmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9tbXUuYyBiL2FyY2gvYXJtL21tL21t
dS5jCmluZGV4IDQ4YzI4ODgyOTdkZC4uNWQwZDBmODZlNzkwIDEwMDY0NAotLS0gYS9hcmNoL2Fy
bS9tbS9tbXUuYworKysgYi9hcmNoL2FybS9tbS9tbXUuYwpAQCAtMjU5LDcgKzI1OSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgbWVtX3R5cGUgbWVtX3R5cGVzW10gX19yb19hZnRlcl9pbml0ID0gewogCQku
cHJvdF9zZWN0CT0gUFJPVF9TRUNUX0RFVklDRSwKIAkJLmRvbWFpbgkJPSBET01BSU5fSU8sCiAJ
fSwKLQlbTVRfREVWSUNFX0NBQ0hFRF0gPSB7CSAgLyogaW9yZW1hcF9jYWNoZWQgKi8KKwlbTVRf
REVWSUNFX0NBQ0hFRF0gPSB7CSAgLyogaW9yZW1hcF9jYWNoZSAqLwogCQkucHJvdF9wdGUJPSBQ
Uk9UX1BURV9ERVZJQ0UgfCBMX1BURV9NVF9ERVZfQ0FDSEVELAogCQkucHJvdF9sMQk9IFBNRF9U
WVBFX1RBQkxFLAogCQkucHJvdF9zZWN0CT0gUFJPVF9TRUNUX0RFVklDRSB8IFBNRF9TRUNUX1dC
LApkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0vbm9tbXUuYyBiL2FyY2gvYXJtL21tL25vbW11LmMK
aW5kZXggMjRlY2Y4ZDMwYTFlLi44YjNkNzE5MWUyYjggMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21t
L25vbW11LmMKKysrIGIvYXJjaC9hcm0vbW0vbm9tbXUuYwpAQCAtMjA2LDE1ICsyMDYsMTEgQEAg
dm9pZCBfX2lvbWVtICppb3JlbWFwKHJlc291cmNlX3NpemVfdCByZXNfY29va2llLCBzaXplX3Qg
c2l6ZSkKIEVYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAKIHZvaWQgX19pb21lbSAqaW9yZW1hcF9j
YWNoZShyZXNvdXJjZV9zaXplX3QgcmVzX2Nvb2tpZSwgc2l6ZV90IHNpemUpCi0JX19hbGlhcyhp
b3JlbWFwX2NhY2hlZCk7Ci0KLXZvaWQgX19pb21lbSAqaW9yZW1hcF9jYWNoZWQocmVzb3VyY2Vf
c2l6ZV90IHJlc19jb29raWUsIHNpemVfdCBzaXplKQogewogCXJldHVybiBfX2FybV9pb3JlbWFw
X2NhbGxlcihyZXNfY29va2llLCBzaXplLCBNVF9ERVZJQ0VfQ0FDSEVELAogCQkJCSAgICBfX2J1
aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwogfQogRVhQT1JUX1NZTUJPTChpb3JlbWFwX2NhY2hl
KTsKLUVYUE9SVF9TWU1CT0woaW9yZW1hcF9jYWNoZWQpOwogCiB2b2lkIF9faW9tZW0gKmlvcmVt
YXBfd2MocmVzb3VyY2Vfc2l6ZV90IHJlc19jb29raWUsIHNpemVfdCBzaXplKQogewotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F2CBE91114
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D0AAC204D8;
	Sat, 17 Aug 2019 17:02:43 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id CDA9320497
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H5e9wBBXZ2SEeKh19N9BUcShzxnU47J4RzJaCDghUh8=; b=JELjW3lhUIc1K8diqP0E9yGR4L
 HKTpsrrEK5ECNZJ18+tBRws6DkRWWrvwFrO9GWVwi1w9qM5iLnWts339tX5OazNVx/CaftXBeZ5yn
 6kARGEdhi4wLScsZx+rUaMAU9/I724jtqQPqQtw2h6RJEmMweJyvFvznKItYa1c/wzRAEkPOEsdN7
 bR55pbozxCV1UXNFwx7gVREdBt9t0QvHDPO8eVC4I0itll55nS26zabE5q7uMS0eKI7cJtrhKoWI2
 BvSyS+bK3EaZF0EeA4bmVgO0v9NJFPdXGGN0tysDZfBoJfJ2eksKYlh4U+5WRMT0Gt9IXk6GbZdy0
 impxqZZQ==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSr-0005ig-CV; Sat, 17 Aug 2019 07:49:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:52 +0200
Message-Id: <20190817073253.27819-26-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 25/26] csky: use generic ioremap
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

VXNlIHRoZSBnZW5lcmljIGlvcmVtYXBfcHJvdCBhbmQgaW91bm1hcCBoZWxwZXJzLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9jc2t5L0tj
b25maWcgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9pby5oICAg
ICAgfCAgNyAtLS0tLS0KIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgNCArKysr
CiBhcmNoL2Nza3kvbW0vaW9yZW1hcC5jICAgICAgICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L0tjb25maWcgYi9hcmNoL2Nza3kvS2Nv
bmZpZwppbmRleCAzOTczODQ3YjVmNDIuLmRhMDljODg0Y2MzMCAxMDA2NDQKLS0tIGEvYXJjaC9j
c2t5L0tjb25maWcKKysrIGIvYXJjaC9jc2t5L0tjb25maWcKQEAgLTE3LDYgKzE3LDcgQEAgY29u
ZmlnIENTS1kKIAlzZWxlY3QgSVJRX0RPTUFJTgogCXNlbGVjdCBIQU5ETEVfRE9NQUlOX0lSUQog
CXNlbGVjdCBEV19BUEJfVElNRVJfT0YKKwlzZWxlY3QgR0VORVJJQ19JT1JFTUFQCiAJc2VsZWN0
IEdFTkVSSUNfTElCX0FTSExESTMKIAlzZWxlY3QgR0VORVJJQ19MSUJfQVNIUkRJMwogCXNlbGVj
dCBHRU5FUklDX0xJQl9MU0hSREkzCmRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20v
aW8uaCBiL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9pby5oCmluZGV4IDgwMDk4NWFmMWM0NC4uMTBl
MDkyOTljOTEyIDEwMDY0NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vaW8uaAorKysgYi9h
cmNoL2Nza3kvaW5jbHVkZS9hc20vaW8uaApAQCAtOCwxMyArOCw2IEBACiAjaW5jbHVkZSA8bGlu
dXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAKLWV4dGVybiB2b2lkIF9f
aW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSk7Ci0KLWV4dGVy
biB2b2lkIGlvdW5tYXAodm9pZCAqYWRkcik7Ci0KLWV4dGVybiBpbnQgcmVtYXBfYXJlYV9wYWdl
cyh1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHBoeXNfYWRkcl90IHBoeXNfYWRkciwKLQkJc2l6ZV90
IHNpemUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwotCiAvKgogICogSS9PIG1lbW9yeSBhY2Nlc3Mg
cHJpbWl0aXZlcy4gUmVhZHMgYXJlIG9yZGVyZWQgcmVsYXRpdmUgdG8gYW55CiAgKiBmb2xsb3dp
bmcgTm9ybWFsIG1lbW9yeSBhY2Nlc3MuIFdyaXRlcyBhcmUgb3JkZXJlZCByZWxhdGl2ZSB0byBh
bnkgcHJpb3IKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9h
cmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IGM0MjlhNmYzNDdkZS4uYjVmNjA1
Yjk4MTBjIDEwMDY0NAotLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBi
L2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTg2LDYgKzg2LDEwIEBACiAjZGVm
aW5lIFBBR0VfVVNFUklPCV9fcGdwcm90KF9QQUdFX1BSRVNFTlQgfCBfUEFHRV9SRUFEIHwgX1BB
R0VfV1JJVEUgfCBcCiAJCQkJX0NBQ0hFX0NBQ0hFRCkKIAorI2RlZmluZSBfUEFHRV9JT1JFTUFQ
IFwKKwkoX1BBR0VfUFJFU0VOVCB8IF9fUkVBREFCTEUgfCBfX1dSSVRFQUJMRSB8IF9QQUdFX0dM
T0JBTCB8IFwKKwkgX0NBQ0hFX1VOQ0FDSEVEIHwgX1BBR0VfU08pCisKICNkZWZpbmUgX19QMDAw
CVBBR0VfTk9ORQogI2RlZmluZSBfX1AwMDEJUEFHRV9SRUFET05MWQogI2RlZmluZSBfX1AwMTAJ
UEFHRV9DT1BZCmRpZmYgLS1naXQgYS9hcmNoL2Nza3kvbW0vaW9yZW1hcC5jIGIvYXJjaC9jc2t5
L21tL2lvcmVtYXAuYwppbmRleCA4NDczYjZiZGY1MTIuLjY1NjE0ZjY1Y2U0OCAxMDA2NDQKLS0t
IGEvYXJjaC9jc2t5L21tL2lvcmVtYXAuYworKysgYi9hcmNoL2Nza3kvbW0vaW9yZW1hcC5jCkBA
IC0zLDUwICszLDggQEAKIAogI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgogI2luY2x1ZGUgPGxp
bnV4L21tLmg+Ci0jaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgogI2luY2x1ZGUgPGxpbnV4L2lv
Lmg+CiAKLSNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgotCi12b2lkIF9faW9tZW0gKmlvcmVtYXAo
cGh5c19hZGRyX3QgYWRkciwgc2l6ZV90IHNpemUpCi17Ci0JcGh5c19hZGRyX3QgbGFzdF9hZGRy
OwotCXVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB2YWRkcjsKLQlzdHJ1Y3Qgdm1fc3RydWN0ICphcmVh
OwotCXBncHJvdF90IHByb3Q7Ci0KLQlsYXN0X2FkZHIgPSBhZGRyICsgc2l6ZSAtIDE7Ci0JaWYg
KCFzaXplIHx8IGxhc3RfYWRkciA8IGFkZHIpCi0JCXJldHVybiBOVUxMOwotCi0Jb2Zmc2V0ID0g
YWRkciAmICh+UEFHRV9NQVNLKTsKLQlhZGRyICY9IFBBR0VfTUFTSzsKLQlzaXplID0gUEFHRV9B
TElHTihzaXplICsgb2Zmc2V0KTsKLQotCWFyZWEgPSBnZXRfdm1fYXJlYV9jYWxsZXIoc2l6ZSwg
Vk1fQUxMT0MsIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Ci0JaWYgKCFhcmVhKQotCQly
ZXR1cm4gTlVMTDsKLQotCXZhZGRyID0gKHVuc2lnbmVkIGxvbmcpYXJlYS0+YWRkcjsKLQotCXBy
b3QgPSBfX3BncHJvdChfUEFHRV9QUkVTRU5UIHwgX19SRUFEQUJMRSB8IF9fV1JJVEVBQkxFIHwK
LQkJCV9QQUdFX0dMT0JBTCB8IF9DQUNIRV9VTkNBQ0hFRCB8IF9QQUdFX1NPKTsKLQotCWlmIChp
b3JlbWFwX3BhZ2VfcmFuZ2UodmFkZHIsIHZhZGRyICsgc2l6ZSwgYWRkciwgcHJvdCkpIHsKLQkJ
ZnJlZV92bV9hcmVhKGFyZWEpOwotCQlyZXR1cm4gTlVMTDsKLQl9Ci0KLQlyZXR1cm4gKHZvaWQg
X19pb21lbSAqKSh2YWRkciArIG9mZnNldCk7Ci19Ci1FWFBPUlRfU1lNQk9MKGlvcmVtYXApOwot
Ci12b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRyKQotewotCXZ1bm1hcCgodm9pZCAqKSgo
dW5zaWduZWQgbG9uZylhZGRyICYgUEFHRV9NQVNLKSk7Ci19Ci1FWFBPUlRfU1lNQk9MKGlvdW5t
YXApOwotCiBwZ3Byb3RfdCBwaHlzX21lbV9hY2Nlc3NfcHJvdChzdHJ1Y3QgZmlsZSAqZmlsZSwg
dW5zaWduZWQgbG9uZyBwZm4sCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIHNpemUsIHBncHJvdF90
IHZtYV9wcm90KQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ECA0391106
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CF9A20305;
	Sat, 17 Aug 2019 17:02:36 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 418502048B
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ue4DxZ3Zcm953fmDi3d/yBssR+oeAqE0fhi/AFIRRjo=; b=DM7NuBiCER2SyLvxOha1uLSIil
 1PRBmLa9XJWK/YNKwZtoOw7l3UAtPrh0PbNr8nDg4aEWUOtiIE9W9F5j9VzQ9a0jai2SYKjORpORS
 7L+vWUwP9OnZ/VORXpCk0J7aCzu55jlqSh44R5ZKWxDE4jYe1uWRAFis6qOujjCoDURz3XPjFxaas
 NcPbqHlgXn56Y9LkzwNAkKZoCpsdA8sWwhfReey2wA/MI+BklRfCEeoucA/997Jj4dN0FKSD2vsQD
 fOjLhPgDK2SvhnykD1XqOCO1w1jvXAblSZzEnpQ2CK6jMogltxlTPf8T7Grk5NjquoO5ldoAwaY6a
 WkLSmmRg==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytS6-00050P-Gn; Sat, 17 Aug 2019 07:48:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:38 +0200
Message-Id: <20190817073253.27819-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 11/26] parisc: remove __ioremap
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

X19pb3JlbWFwIGlzIGFsd2F5cyBjYWxsZWQgd2l0aCB0aGUgX1BBR0VfTk9fQ0FDSEUsIHNvIGZv
bGQgdGhlIHdob2xlCnRoaW5nIGFuZCByZW5hbWUgaXQgdG8gaW9yZW1hcC4gIFRoaXMgYWxsb3dz
IGFsbG93cyB0byByZW1vdmUgdGhlCnNwZWNpYWwgRUlTQSBxdWlyayB0byBmb3JjZSBfUEFHRV9O
T19DQUNIRS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgot
LS0KIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL2lvLmggfCAxMSArLS0tLS0tLS0tLQogYXJjaC9w
YXJpc2MvbW0vaW9yZW1hcC5jICAgICB8IDE2ICsrKy0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L3BhcmlzYy9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vaW8uaApp
bmRleCA5M2QzNzAxMGIzNzUuLjQ2MjEyYjUyYzIzZSAxMDA2NDQKLS0tIGEvYXJjaC9wYXJpc2Mv
aW5jbHVkZS9hc20vaW8uaAorKysgYi9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9pby5oCkBAIC0x
MjcsMTYgKzEyNyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBnc2Nfd3JpdGVxKHVuc2lnbmVkIGxv
bmcgbG9uZyB2YWwsIHVuc2lnbmVkIGxvbmcgYWRkcikKIC8qCiAgKiBUaGUgc3RhbmRhcmQgUENJ
IGlvcmVtYXAgaW50ZXJmYWNlcwogICovCi0KLWV4dGVybiB2b2lkIF9faW9tZW0gKiBfX2lvcmVt
YXAodW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9u
ZyBmbGFncyk7Ci0KLS8qIE1vc3QgbWFjaGluZXMgcmVhY3QgcG9vcmx5IHRvIEkvTy1zcGFjZSBi
ZWluZyBjYWNoZWFibGUuLi4gSW5zdGVhZCBsZXQncwotICogZGVmaW5lIGlvcmVtYXAoKSBpbiB0
ZXJtcyBvZiBpb3JlbWFwX25vY2FjaGUoKS4KLSAqLwotc3RhdGljIGlubGluZSB2b2lkIF9faW9t
ZW0gKiBpb3JlbWFwKHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUpCi17
Ci0JcmV0dXJuIF9faW9yZW1hcChvZmZzZXQsIHNpemUsIF9QQUdFX05PX0NBQ0hFKTsKLX0KK3Zv
aWQgX19pb21lbSAqaW9yZW1hcCh1bnNpZ25lZCBsb25nIG9mZnNldCwgdW5zaWduZWQgbG9uZyBz
aXplKTsKICNkZWZpbmUgaW9yZW1hcF9ub2NhY2hlKG9mZiwgc3opCWlvcmVtYXAoKG9mZiksIChz
eikpCiAjZGVmaW5lIGlvcmVtYXBfd2MJCQlpb3JlbWFwX25vY2FjaGUKICNkZWZpbmUgaW9yZW1h
cF91YwkJCWlvcmVtYXBfbm9jYWNoZQpkaWZmIC0tZ2l0IGEvYXJjaC9wYXJpc2MvbW0vaW9yZW1h
cC5jIGIvYXJjaC9wYXJpc2MvbW0vaW9yZW1hcC5jCmluZGV4IDkyYTliNWYxMmY5OC4uZmU2NWUy
N2Y4ODJiIDEwMDY0NAotLS0gYS9hcmNoL3BhcmlzYy9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC9w
YXJpc2MvbW0vaW9yZW1hcC5jCkBAIC0yNSwyMyArMjUsMTMgQEAKICAqIGhhdmUgdG8gY29udmVy
dCB0aGVtIGludG8gYW4gb2Zmc2V0IGluIGEgcGFnZS1hbGlnbmVkIG1hcHBpbmcsIGJ1dCB0aGUK
ICAqIGNhbGxlciBzaG91bGRuJ3QgbmVlZCB0byBrbm93IHRoYXQgc21hbGwgZGV0YWlsLgogICov
Ci12b2lkIF9faW9tZW0gKiBfX2lvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2ln
bmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKK3ZvaWQgX19pb21lbSAqaW9yZW1h
cCh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQogewogCXZvaWQg
X19pb21lbSAqYWRkcjsKIAlzdHJ1Y3Qgdm1fc3RydWN0ICphcmVhOwogCXVuc2lnbmVkIGxvbmcg
b2Zmc2V0LCBsYXN0X2FkZHI7CiAJcGdwcm90X3QgcGdwcm90OwogCi0jaWZkZWYgQ09ORklHX0VJ
U0EKLQl1bnNpZ25lZCBsb25nIGVuZCA9IHBoeXNfYWRkciArIHNpemUgLSAxOwotCS8qIFN1cHBv
cnQgRUlTQSBhZGRyZXNzZXMgKi8KLQlpZiAoKHBoeXNfYWRkciA+PSAweDAwMDgwMDAwICYmIGVu
ZCA8IDB4MDAwZmZmZmYpIHx8Ci0JICAgIChwaHlzX2FkZHIgPj0gMHgwMDUwMDAwMCAmJiBlbmQg
PCAweDAzYmZmZmZmKSkgewotCQlwaHlzX2FkZHIgfD0gRl9FWFRFTkQoMHhmYzAwMDAwMCk7Ci0J
CWZsYWdzIHw9IF9QQUdFX05PX0NBQ0hFOwotCX0KLSNlbmRpZgotCiAJLyogRG9uJ3QgYWxsb3cg
d3JhcGFyb3VuZCBvciB6ZXJvIHNpemUgKi8KIAlsYXN0X2FkZHIgPSBwaHlzX2FkZHIgKyBzaXpl
IC0gMTsKIAlpZiAoIXNpemUgfHwgbGFzdF9hZGRyIDwgcGh5c19hZGRyKQpAQCAtNjUsNyArNTUs
NyBAQCB2b2lkIF9faW9tZW0gKiBfX2lvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbAogCX0KIAogCXBncHJvdCA9IF9fcGdwcm90KF9Q
QUdFX1BSRVNFTlQgfCBfUEFHRV9SVyB8IF9QQUdFX0RJUlRZIHwKLQkJCSAgX1BBR0VfQUNDRVNT
RUQgfCBmbGFncyk7CisJCQkgIF9QQUdFX0FDQ0VTU0VEIHwgX1BBR0VfTk9fQ0FDSEUpOwogCiAJ
LyoKIAkgKiBNYXBwaW5ncyBoYXZlIHRvIGJlIHBhZ2UtYWxpZ25lZApAQCAtOTAsNyArODAsNyBA
QCB2b2lkIF9faW9tZW0gKiBfX2lvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2ln
bmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbAogCiAJcmV0dXJuICh2b2lkIF9faW9tZW0gKikgKG9m
ZnNldCArIChjaGFyIF9faW9tZW0gKilhZGRyKTsKIH0KLUVYUE9SVF9TWU1CT0woX19pb3JlbWFw
KTsKK0VYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAKIHZvaWQgaW91bm1hcChjb25zdCB2b2xhdGls
ZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

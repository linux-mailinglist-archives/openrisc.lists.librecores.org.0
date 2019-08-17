Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C0E15910FE
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1DE72204C8;
	Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 461CE20305
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5P7q6l8cLYVBLk6RzMIc/f9RS2Ny/Mg2wyKPicXsQd4=; b=OC4+dGp0H/45VJJKGYUPkLy0RY
 k6gcSgWB0po/ZId7HVXtFUlg46DSxqMftLoGqFt9rlk5hIrrFklVPAzzj9UW92OhWTBNncLBL4+0V
 nJPHoVO48t6tnoVdbq2idVqHh6dcnuXS+otUp2FsIXpCcs72q+SzNwXMn/1DokeK0zODnBxcwnq2n
 gKCLKdU6THR+o0cru/sYmNXuI/k6AYki4HRYLooY7yX4s7/tBQpzwylsQo+AkQRxky7CeEmOMDZ2P
 WMWnibAbFoESGxgTzjWONecz0f9ZllT6KFCDKCIc/Li9Unht6O9a+eeIOtcUDnbOGGTmN+68M5BgZ
 gTrFoddA==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytLO-000175-Cc; Sat, 17 Aug 2019 07:41:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:30 +0200
Message-Id: <20190817073253.27819-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 03/26] m68k, microblaze: remove ioremap_fullcache
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

Tm8gY2FsbGVycyBvZiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2ttYXAuaCAgICAg
fCA3IC0tLS0tLS0KIGFyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9pby5oIHwgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1
ZGUvYXNtL2ttYXAuaCBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9rbWFwLmgKaW5kZXggYWFjN2Yw
NDVmN2YwLi4wM2Q5MDRmZTYwODcgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9r
bWFwLmgKKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL2ttYXAuaApAQCAtNDMsMTMgKzQzLDYg
QEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfd3QodW5zaWduZWQgbG9uZyBw
aHlzYWRkciwKIAlyZXR1cm4gX19pb3JlbWFwKHBoeXNhZGRyLCBzaXplLCBJT01BUF9XUklURVRI
Uk9VR0gpOwogfQogCi0jZGVmaW5lIGlvcmVtYXBfZnVsbGNhY2hlIGlvcmVtYXBfZnVsbGNhY2hl
Ci1zdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF9mdWxsY2FjaGUodW5zaWduZWQg
bG9uZyBwaHlzYWRkciwKLQkJCQkJICAgICAgdW5zaWduZWQgbG9uZyBzaXplKQotewotCXJldHVy
biBfX2lvcmVtYXAocGh5c2FkZHIsIHNpemUsIElPTUFQX0ZVTExfQ0FDSElORyk7Ci19Ci0KICNk
ZWZpbmUgbWVtc2V0X2lvIG1lbXNldF9pbwogc3RhdGljIGlubGluZSB2b2lkIG1lbXNldF9pbyh2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsIHVuc2lnbmVkIGNoYXIgdmFsLAogCQkJICAgICBp
bnQgY291bnQpCmRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vaW8uaCBi
L2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9pby5oCmluZGV4IGM3OTY4MTM5NDg2Zi4uODZj
OTViMmExY2UxIDEwMDY0NAotLS0gYS9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vaW8uaAor
KysgYi9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vaW8uaApAQCAtNDAsNyArNDAsNiBAQCBl
eHRlcm4gdm9pZCBpb3VubWFwKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcik7CiAKIGV4dGVy
biB2b2lkIF9faW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3QgYWRkcmVzcywgdW5zaWduZWQgbG9u
ZyBzaXplKTsKICNkZWZpbmUgaW9yZW1hcF9ub2NhY2hlKGFkZHIsIHNpemUpCQlpb3JlbWFwKChh
ZGRyKSwgKHNpemUpKQotI2RlZmluZSBpb3JlbWFwX2Z1bGxjYWNoZShhZGRyLCBzaXplKQkJaW9y
ZW1hcCgoYWRkciksIChzaXplKSkKICNkZWZpbmUgaW9yZW1hcF93YyhhZGRyLCBzaXplKQkJCWlv
cmVtYXAoKGFkZHIpLCAoc2l6ZSkpCiAjZGVmaW5lIGlvcmVtYXBfd3QoYWRkciwgc2l6ZSkJCQlp
b3JlbWFwKChhZGRyKSwgKHNpemUpKQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

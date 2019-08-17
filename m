Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 47D049110E
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 29957204B5;
	Sat, 17 Aug 2019 17:02:42 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 66E3F20496
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lb9sXGWY4Zo5jWgiVpTYPBkDFIQwZRv2oLfB2JZ22jg=; b=RHT/mc02CkHRWlwM8CPZXQBfET
 NjQuSoF6VHomwa/xo7gpEAlzYnKVFc/lZ4ITJKxjfzITlWuAgDf20774zWI8NCiM5K8jsK1T0IFcb
 /y+NB4cXQVfj/h9/782iWnoviBJ5Ok0KPTTwQNuVb6cMptrSsg5pW+fCH15/ZKJ4dBZvTi/O07WiK
 G0fhjQlwRABsYcdZOUhF9eJNTjl/eY8291gLDnPANdGnkv9zTOx5zn3BgB8lXBE+d1fYHaam4ejJE
 z2rHxb8Q6AJ0c5iZZpg/L3VvPEF8g1VSEcgvS9TuIOjh7GPTZcVZM5Y4Gk4zsIqKgiR59MzkTNBSC
 4NSzATrg==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSX-0005RI-L0; Sat, 17 Aug 2019 07:49:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:46 +0200
Message-Id: <20190817073253.27819-20-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 19/26] arm64: remove __iounmap
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

Tm8gbmVlZCB0byBpbmRpcmVjdCBpb3VubWFwIGZvciBhcm02NC4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
aW8uaCB8IDMgKy0tCiBhcmNoL2FybTY0L21tL2lvcmVtYXAuYyAgICAgfCA0ICsrLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaW8u
aAppbmRleCBhNjFiMTQ2OWY3ZDkuLjFiZjU2MzE2NzFjMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vaW8uaApAQCAt
MTY1LDEyICsxNjUsMTEgQEAgZXh0ZXJuIHZvaWQgX19tZW1zZXRfaW8odm9sYXRpbGUgdm9pZCBf
X2lvbWVtICosIGludCwgc2l6ZV90KTsKICAqIEkvTyBtZW1vcnkgbWFwcGluZyBmdW5jdGlvbnMu
CiAgKi8KIGV4dGVybiB2b2lkIF9faW9tZW0gKl9faW9yZW1hcChwaHlzX2FkZHJfdCBwaHlzX2Fk
ZHIsIHNpemVfdCBzaXplLCBwZ3Byb3RfdCBwcm90KTsKLWV4dGVybiB2b2lkIF9faW91bm1hcCh2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpOworZXh0ZXJuIHZvaWQgaW91bm1hcCh2b2xhdGls
ZSB2b2lkIF9faW9tZW0gKmFkZHIpOwogZXh0ZXJuIHZvaWQgX19pb21lbSAqaW9yZW1hcF9jYWNo
ZShwaHlzX2FkZHJfdCBwaHlzX2FkZHIsIHNpemVfdCBzaXplKTsKIAogI2RlZmluZSBpb3JlbWFw
KGFkZHIsIHNpemUpCQlfX2lvcmVtYXAoKGFkZHIpLCAoc2l6ZSksIF9fcGdwcm90KFBST1RfREVW
SUNFX25HblJFKSkKICNkZWZpbmUgaW9yZW1hcF93YyhhZGRyLCBzaXplKQkJX19pb3JlbWFwKChh
ZGRyKSwgKHNpemUpLCBfX3BncHJvdChQUk9UX05PUk1BTF9OQykpCi0jZGVmaW5lIGlvdW5tYXAJ
CQkJX19pb3VubWFwCiAKIC8qCiAgKiBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZSBtYXBwaW5nIGZ1
bmN0aW9uLgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9pb3JlbWFwLmMgYi9hcmNoL2FybTY0
L21tL2lvcmVtYXAuYwppbmRleCBmZGI1OTVhNWQ2NWYuLjliZTcxYmVlOTAyYyAxMDA2NDQKLS0t
IGEvYXJjaC9hcm02NC9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC9hcm02NC9tbS9pb3JlbWFwLmMK
QEAgLTY5LDcgKzY5LDcgQEAgdm9pZCBfX2lvbWVtICpfX2lvcmVtYXAocGh5c19hZGRyX3QgcGh5
c19hZGRyLCBzaXplX3Qgc2l6ZSwgcGdwcm90X3QgcHJvdCkKIH0KIEVYUE9SVF9TWU1CT0woX19p
b3JlbWFwKTsKIAotdm9pZCBfX2lvdW5tYXAodm9sYXRpbGUgdm9pZCBfX2lvbWVtICppb19hZGRy
KQordm9pZCBpb3VubWFwKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqaW9fYWRkcikKIHsKIAl1bnNp
Z25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZylpb19hZGRyICYgUEFHRV9NQVNLOwogCkBA
IC04MCw3ICs4MCw3IEBAIHZvaWQgX19pb3VubWFwKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqaW9f
YWRkcikKIAlpZiAoaXNfdm1hbGxvY19hZGRyKCh2b2lkICopYWRkcikpCiAJCXZ1bm1hcCgodm9p
ZCAqKWFkZHIpOwogfQotRVhQT1JUX1NZTUJPTChfX2lvdW5tYXApOworRVhQT1JUX1NZTUJPTChp
b3VubWFwKTsKIAogdm9pZCBfX2lvbWVtICppb3JlbWFwX2NhY2hlKHBoeXNfYWRkcl90IHBoeXNf
YWRkciwgc2l6ZV90IHNpemUpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

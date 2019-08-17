Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2A585910FC
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C926A204C4;
	Sat, 17 Aug 2019 17:02:32 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2B6AF20199
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LOFsaDUHf3oSjRMXw5gFEkv6KPkdmKdXRuV5c2KcYvA=; b=gIsKwk6n+bCIQONuEURySg1qEX
 ECAOChzlESqAv5fGqazply96L9cdHcfpjjyx3dZORFWGyH/r163KHliR+p8uKnVlrw1Xy2BMA8G9X
 0cqoOJ17bcPN000u+K+Px7KSD/Ub6OrBTZe8IWQtdFrfDnFQNpaD5tpYmrlsCzQ5UU74NQyaqbui3
 y/lkc//xBRDH3DK/rT40/ks+TNCetrO7vqLVpHCUq9AbEHtayN2fgzVTsQnDn9UAJ+Rl9RuxKiH2Y
 gEtfWLhhRLmBzFl1Mc5c4/9wE9NlK5KoRV8cwLKy8KTyLYK7Wmrp38l48fwI+NSqTssdqhQu/Udno
 spOWXvLA==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytH6-0006ut-0w; Sat, 17 Aug 2019 07:37:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:28 +0200
Message-Id: <20190817073253.27819-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 01/26] mtd/maps/pxa2xx: use ioremap_cache insted
 of ioremap_cached
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

cHhhMnh4LWZsYXNoIGlzIHRoZSBvbmx5IHVzZXIgb2YgaW9yZW1hcF9jYWNoZWQsIHdoaWNoIGlz
IGFuIGFsaWFzCmZvciBpb3JlbWFwX2NhY2hlIGFueXdheS4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvbXRkL21hcHMvcHhhMnh4LWZs
YXNoLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL21hcHMvcHhhMnh4LWZsYXNoLmMgYi9kcml2
ZXJzL210ZC9tYXBzL3B4YTJ4eC1mbGFzaC5jCmluZGV4IGNlYmIzNDY4NzdhOS4uN2Q5Njc1OGE4
ZjA0IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9tYXBzL3B4YTJ4eC1mbGFzaC5jCisrKyBiL2Ry
aXZlcnMvbXRkL21hcHMvcHhhMnh4LWZsYXNoLmMKQEAgLTY4LDggKzY4LDcgQEAgc3RhdGljIGlu
dCBweGEyeHhfZmxhc2hfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJICAg
ICAgIGluZm8tPm1hcC5uYW1lKTsKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQotCWluZm8tPm1hcC5j
YWNoZWQgPQotCQlpb3JlbWFwX2NhY2hlZChpbmZvLT5tYXAucGh5cywgaW5mby0+bWFwLnNpemUp
OworCWluZm8tPm1hcC5jYWNoZWQgPSBpb3JlbWFwX2NhY2hlKGluZm8tPm1hcC5waHlzLCBpbmZv
LT5tYXAuc2l6ZSk7CiAJaWYgKCFpbmZvLT5tYXAuY2FjaGVkKQogCQlwcmludGsoS0VSTl9XQVJO
SU5HICJGYWlsZWQgdG8gaW9yZW1hcCBjYWNoZWQgJXNcbiIsCiAJCSAgICAgICBpbmZvLT5tYXAu
bmFtZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

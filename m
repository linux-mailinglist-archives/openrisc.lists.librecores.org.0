Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D3FAB1CD2F4
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B07CF207E4;
	Mon, 11 May 2020 09:41:37 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 103E520B0C
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=INn4CtVqYhB5mCs8+6rhyM+JLlbdj/x9vTgOvRuFchU=; b=Sg0UDw1w5Rayw8JxN+k3lD3azg
 F3LeJA2/NA5rszW6L3bzCrDJXtE6EYULe7GCZftRW+QajvPEaOnjbzGVwfOBNuqPACprzdRviAmaz
 S+sHnwIfQVWKsYOX5X9bFoG3LRFun2LeegZtne7Zn0gjo40GSq0VynMuje/ns9TcGFevaXQCehbqC
 46/TtfsAa3m3mTbp2v2h/j9RjHXcoUHFNAqvM5y854a74KoqPzQGYg8Ujm4SDbizp9Vw47R04MTUf
 YK7yk0frjTctX3aWY011R8+bXrWx4QW+UhAD/NEPVGv+ow8wIUHtdIaqv0zmgcQ1o75L3D0sfJt+T
 VFLY3xcw==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoD-00089Q-95; Sun, 10 May 2020 07:55:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:47 +0200
Message-Id: <20200510075510.987823-9-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 08/31] asm-generic: don't include <linux/mm.h> in
 cacheflush.h
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBzZWVtcyB0byBsZWFkIHRvIHNvbWUgY3JhenkgaW5jbHVkZSBsb29wcyB3aGVuIHVzaW5n
CmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBvbiBtb3JlIGFyY2hpdGVjdHVyZXMsIHNvIGxlYXZl
IGl0CnRvIHRoZSBhcmNoIGhlYWRlciBmb3Igbm93LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC91bS9pbmNsdWRlL2FzbS90bGIuaCAgICAg
ICAgIHwgMiArKwogYXJjaC94ODYvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMiArKwogaW5j
bHVkZS9hc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggIHwgMyAtLS0KIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvdW0vaW5j
bHVkZS9hc20vdGxiLmggYi9hcmNoL3VtL2luY2x1ZGUvYXNtL3RsYi5oCmluZGV4IDcwZWU2MDM4
MzkwMDYuLmZmOWM2MjgyODk2MmMgMTAwNjQ0Ci0tLSBhL2FyY2gvdW0vaW5jbHVkZS9hc20vdGxi
LmgKKysrIGIvYXJjaC91bS9pbmNsdWRlL2FzbS90bGIuaApAQCAtMiw2ICsyLDggQEAKICNpZm5k
ZWYgX19VTV9UTEJfSAogI2RlZmluZSBfX1VNX1RMQl9ICiAKKyNpbmNsdWRlIDxsaW51eC9tbS5o
PgorCiAjaW5jbHVkZSA8YXNtL3RsYmZsdXNoLmg+CiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvY2Fj
aGVmbHVzaC5oPgogI2luY2x1ZGUgPGFzbS1nZW5lcmljL3RsYi5oPgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vY2Fj
aGVmbHVzaC5oCmluZGV4IDYzZmVhZjJhNWY5M2QuLmIxOTJkOTE3YTZkMGIgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9jYWNoZWZsdXNoLmgKQEAgLTIsNiArMiw4IEBACiAjaWZuZGVmIF9BU01fWDg2X0NBQ0hF
RkxVU0hfSAogI2RlZmluZSBfQVNNX1g4Nl9DQUNIRUZMVVNIX0gKIAorI2luY2x1ZGUgPGxpbnV4
L21tLmg+CisKIC8qIENhY2hlcyBhcmVuJ3QgYnJhaW4tZGVhZCBvbiB0aGUgaW50ZWwuICovCiAj
aW5jbHVkZSA8YXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oPgogI2luY2x1ZGUgPGFzbS9zcGVjaWFs
X2luc25zLmg+CmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBi
L2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oCmluZGV4IDkwNjI3NzQ5MmVjNTkuLmJm
OWJiODNlOWZjOGQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5o
CisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oCkBAIC0yLDkgKzIsNiBAQAog
I2lmbmRlZiBfQVNNX0dFTkVSSUNfQ0FDSEVGTFVTSF9ICiAjZGVmaW5lIF9BU01fR0VORVJJQ19D
QUNIRUZMVVNIX0gKIAotLyogS2VlcCBpbmNsdWRlcyB0aGUgc2FtZSBhY3Jvc3MgYXJjaGVzLiAg
Ki8KLSNpbmNsdWRlIDxsaW51eC9tbS5oPgotCiAjZGVmaW5lIEFSQ0hfSU1QTEVNRU5UU19GTFVT
SF9EQ0FDSEVfUEFHRSAwCiAKIC8qCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

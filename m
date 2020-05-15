Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0231E501B
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2BCC62049C;
	Wed, 27 May 2020 23:19:07 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2CCE720AF3
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TnbCkkwCrUJoVyKDF526uiErLGT3jwDipU5D/anO8xc=; b=Yg/1sGMNgegwbtPN8e3l3mjuT5
 IG+U9qiqX2BpWZW5HdvwsSQA60De/nQt3TpJXPQRKQ7EPXuSZnetBVwuqRDjvblJFfZGHQFJgAnXm
 HexvWXx282zsGkHTgK8V+Kd436i+xu/35S62Ifj7kzJOc63js73HolOH2dm+6DNkeK8wmsVd/pHiv
 pI6ZzdcQKdTw7Q4ycGaIyCQnPUoHk667HjzWtokNqIMMIU2kUM76aQFAk9Q75/oTkTrIldGqYPJbA
 8wZis1cE5a+R1kI7WETW1Wx9A0zLLClKWp+6llj5sI6qEEPPSQR2DPvTvgNP/olc941lb5Mlc9TaE
 L8gNcDBA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSQ-0003wV-8r; Fri, 15 May 2020 14:37:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:22 +0200
Message-Id: <20200515143646.3857579-6-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 05/29] asm-generic: fix the inclusion guards for
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

Y2FjaGVmbHVzaC5oIHVzZXMgYSBzb21ld2hhdCB0byBnZW5lcmljIGluY2x1ZGUgZ3VhcmQgbmFt
ZSB0aGF0IGNsYXNoZXMKd2l0aCB2YXJpb3VzIGFyY2ggZmlsZXMuICBVc2UgYSBtb3JlIHNwZWNp
ZmljIG9uZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgot
LS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIHwgNiArKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9hc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hl
Zmx1c2guaAppbmRleCBjYWM3NDA0YjJiZGQyLi45MDYyNzc0OTJlYzU5IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmlj
L2NhY2hlZmx1c2guaApAQCAtMSw2ICsxLDYgQEAKIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wICovCi0jaWZuZGVmIF9fQVNNX0NBQ0hFRkxVU0hfSAotI2RlZmluZSBfX0FTTV9D
QUNIRUZMVVNIX0gKKyNpZm5kZWYgX0FTTV9HRU5FUklDX0NBQ0hFRkxVU0hfSAorI2RlZmluZSBf
QVNNX0dFTkVSSUNfQ0FDSEVGTFVTSF9ICiAKIC8qIEtlZXAgaW5jbHVkZXMgdGhlIHNhbWUgYWNy
b3NzIGFyY2hlcy4gICovCiAjaW5jbHVkZSA8bGludXgvbW0uaD4KQEAgLTEwOSw0ICsxMDksNCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfdnVubWFwKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgZW5kKQogCW1lbWNweShkc3QsIHNyYywgbGVuKQogI2VuZGlmCiAK
LSNlbmRpZiAvKiBfX0FTTV9DQUNIRUZMVVNIX0ggKi8KKyNlbmRpZiAvKiBfQVNNX0dFTkVSSUNf
Q0FDSEVGTFVTSF9IICovCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 948BD1CD302
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7144320B69;
	Mon, 11 May 2020 09:41:45 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id D573720B10
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3bgjHBt5jDLELtVeoaM1eNLq4RdOdC1sIUbPCNr5dBM=; b=QiS4GFEV1NyB7Ulueat1TS2a8l
 xaIAvA7zTSV4WqI6GVSwN9XzLnd4vSV/OvZJBMoy/t7h+trqYnwcj8SGUJViEVHuqIYKI4C8A6VIr
 2KEtDxeWrLz/f881qk19b71/P89d+Eigg3Q0KySjFuwzEwB4cy3UPiiyAnVJwefksqugeiwcp9j+2
 vrlWF+RL8KWBIw44OcUsYbHWE+XEOh+ZpbBTzXLMhVZIh+wGhuRl0flj9mC4bxfUHN9yT2hcVRQnX
 U5rdGKIbAGbwTqvWr1pM0+Mzie8evSKjd+jYzYhCoczNIJPSRbKirBuEBxhgP8TpCYYqFaVTS4elM
 BDV1bRXQ==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgp0-0000ty-7N; Sun, 10 May 2020 07:56:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:02 +0200
Message-Id: <20200510075510.987823-24-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 23/31] sh: implement flush_icache_user_range
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

VGhlIFN1cGVySCBpbXBsZW1lbnRhdGlvbiBvZiBmbHVzaF9pY2FjaGVfcmFuZ2Ugc2VlbXMgdG8g
YmUgYWJsZSB0bwpjb3BlIHdpdGggdXNlciBhZGRyZXNzZXMuICBKdXN0IGRlZmluZSBmbHVzaF9p
Y2FjaGVfdXNlcl9yYW5nZSB0bwpmbHVzaF9pY2FjaGVfcmFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL3NoL2luY2x1ZGUvYXNtL2Nh
Y2hlZmx1c2guaCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9zaC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3NoL2luY2x1ZGUv
YXNtL2NhY2hlZmx1c2guaAppbmRleCBiOTMyZTQyZWYwMjg0Li5mZTc0MDAwNzliOTdiIDEwMDY0
NAotLS0gYS9hcmNoL3NoL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAorKysgYi9hcmNoL3NoL2lu
Y2x1ZGUvYXNtL2NhY2hlZmx1c2guaApAQCAtNDYsNiArNDYsNyBAQCBleHRlcm4gdm9pZCBmbHVz
aF9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKICNkZWZpbmUgQVJDSF9J
TVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9QQUdFIDEKIGV4dGVybiB2b2lkIGZsdXNoX2RjYWNoZV9w
YWdlKHN0cnVjdCBwYWdlICpwYWdlKTsKIGV4dGVybiB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CisjZGVmaW5lIGZsdXNoX2lj
YWNoZV91c2VyX3JhbmdlIGZsdXNoX2ljYWNoZV9yYW5nZQogZXh0ZXJuIHZvaWQgZmx1c2hfaWNh
Y2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQkJIHN0cnVjdCBwYWdlICpw
YWdlKTsKIGV4dGVybiB2b2lkIGZsdXNoX2NhY2hlX3NpZ3RyYW1wKHVuc2lnbmVkIGxvbmcgYWRk
cmVzcyk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A90611E5039
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 624EC20CAE;
	Wed, 27 May 2020 23:19:29 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id E587B20B31
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+nwO03jcpqZOPZP7BRWxpcr5aqGQrWzDQhhYlZpFczM=; b=mXN1xIL/KCK7MrzsI+7Ig4BsID
 UFxadzg6FIHkLGK7la/QdCMzj6hShPZaFvDMTmf0FJvzeiz238u8uYuWehpIhApmHuRSWA/jdlgD4
 O6FC7je7L4zUVLOXMXlZ/R2RjmmAr9ECjQGQGLjoVnO8LNAtoi3ujQ5W2I4Ma+Ii9x7jsgzvglX1l
 dAYzga+b7Occ0zhksgDq4SrzKkQ+edonAA/CUSwFEGdijbGAmHL6Te57qr4OspA9+5iBZQJbzALhG
 NVDvvmVv2efYyM3fHtmuMz0b2Cs4mq6WqX2cSsoP9KeHAQI1l2PTCmVIMKwDKLcLU2rJMPXbKiEVx
 Fkfgh21A==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSr-0004az-7h; Fri, 15 May 2020 14:37:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:31 +0200
Message-Id: <20200515143646.3857579-15-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 14/29] m68knommu: use asm-generic/cacheflush.h
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

bTY4a25vbW11IG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5lcyBvZiBpdHMg
b3duLiAgUmVseSBvbgphc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggZm9yIHRoZSBkZWZhdWx0cy4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpBY2tlZC1ieTog
R3JlZyBVbmdlcmVyIDxnZXJnQGxpbnV4LW02OGsub3JnPgotLS0KIGFyY2gvbTY4ay9pbmNsdWRl
L2FzbS9jYWNoZWZsdXNoX25vLmggfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9uby5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2hfbm8uaAppbmRleCAxMWU5YTlkY2JmYjI0Li4yNzMxZjA3ZTdiZThjIDEwMDY0
NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9uby5oCisrKyBiL2FyY2gv
bTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmgKQEAgLTksMjUgKzksOCBAQAogI2luY2x1
ZGUgPGFzbS9tY2ZzaW0uaD4KIAogI2RlZmluZSBmbHVzaF9jYWNoZV9hbGwoKQkJCV9fZmx1c2hf
Y2FjaGVfYWxsKCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfbW0obW0pCQkJZG8geyB9IHdoaWxlICgw
KQotI2RlZmluZSBmbHVzaF9jYWNoZV9kdXBfbW0obW0pCQkJZG8geyB9IHdoaWxlICgwKQotI2Rl
ZmluZSBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIHN0YXJ0LCBlbmQpCWRvIHsgfSB3aGlsZSAoMCkK
LSNkZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSh2bWEsIHZtYWRkcikJCWRvIHsgfSB3aGlsZSAoMCkK
ICNkZWZpbmUgZmx1c2hfZGNhY2hlX3JhbmdlKHN0YXJ0LCBsZW4pCQlfX2ZsdXNoX2RjYWNoZV9h
bGwoKQotI2RlZmluZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgMAotI2RlZmlu
ZSBmbHVzaF9kY2FjaGVfcGFnZShwYWdlKQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1
c2hfZGNhY2hlX21tYXBfbG9jayhtYXBwaW5nKQkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBm
bHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGluZykJZG8geyB9IHdoaWxlICgwKQogI2RlZmlu
ZSBmbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGxlbikJCV9fZmx1c2hfaWNhY2hlX2FsbCgpCi0j
ZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZtYSxwZykJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZp
bmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2Uodm1hLHBnLGFkcixsZW4pCWRvIHsgfSB3aGlsZSAo
MCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKQkJZG8geyB9IHdoaWxlICgw
KQotI2RlZmluZSBmbHVzaF9jYWNoZV92dW5tYXAoc3RhcnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAo
MCkKLQotI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZhZGRyLCBkc3QsIHNy
YywgbGVuKSBcCi0JbWVtY3B5KGRzdCwgc3JjLCBsZW4pCi0jZGVmaW5lIGNvcHlfZnJvbV91c2Vy
X3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAotCW1lbWNweShkc3QsIHNy
YywgbGVuKQogCiB2b2lkIG1jZl9jYWNoZV9wdXNoKHZvaWQpOwogCkBAIC05OCw0ICs4MSw2IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBjYWNoZV9jbGVhcih1bnNpZ25lZCBsb25nIHBhZGRyLCBpbnQg
bGVuKQogCV9fY2xlYXJfY2FjaGVfYWxsKCk7CiB9CiAKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9j
YWNoZWZsdXNoLmg+CisKICNlbmRpZiAvKiBfTTY4S05PTU1VX0NBQ0hFRkxVU0hfSCAqLwotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

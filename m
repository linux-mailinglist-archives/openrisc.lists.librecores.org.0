Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 574FA1CD2FC
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3396A20B3B;
	Mon, 11 May 2020 09:41:43 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id DDF1020B06
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zo4317DbiHdABEbyspSMls5FOjemriZZxzncTT51l6w=; b=sJ6aO/AsE/UGH1p5MUgwwiZkdi
 jEhux/ge6iovJh89ymgFYpKfNhK2n5aeMfRRoZNQariQqh/MsK+USQtUBSU8IH/dzWSPE17M3p/fG
 2mhbfsExTVHK4U/tS7rKrvY928nJOF7Iw7REJW1ivUvowAaoHI4uB4ADMFxlpMqQUU0tJDT6HXMuS
 aSrAgFLU+/XhBq4pOLlMpb053tAD83U+9ENyByebv3vLOB3LALQVkSU0pU1rUSHgoybBA1h2mYLtD
 DIo46u0QjH7tJaB5fGycTMakufmInPpID69WNI6IQSmb9IE0GrwQzLwKMw/lSh9nsLLcLX+ZgbBuU
 B2LFNvEQ==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgod-0000KS-GW; Sun, 10 May 2020 07:56:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:55 +0200
Message-Id: <20200510075510.987823-17-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 16/31] m68knommu: use asm-generic/cacheflush.h
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

bTY4a25vbW11IG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5lcyBvZiBpdHMg
b3duLiAgUmVseSBvbgphc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggZm9yIHRoZSBkZWZhdWx0cy4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gv
bTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmggfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9uby5oIGIvYXJjaC9tNjhr
L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2hfbm8uaAppbmRleCAxMWU5YTlkY2JmYjI0Li4yNzMxZjA3
ZTdiZThjIDEwMDY0NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vY2FjaGVmbHVzaF9uby5o
CisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoX25vLmgKQEAgLTksMjUgKzks
OCBAQAogI2luY2x1ZGUgPGFzbS9tY2ZzaW0uaD4KIAogI2RlZmluZSBmbHVzaF9jYWNoZV9hbGwo
KQkJCV9fZmx1c2hfY2FjaGVfYWxsKCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfbW0obW0pCQkJZG8g
eyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9kdXBfbW0obW0pCQkJZG8geyB9IHdo
aWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIHN0YXJ0LCBlbmQpCWRvIHsg
fSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSh2bWEsIHZtYWRkcikJCWRvIHsg
fSB3aGlsZSAoMCkKICNkZWZpbmUgZmx1c2hfZGNhY2hlX3JhbmdlKHN0YXJ0LCBsZW4pCQlfX2Zs
dXNoX2RjYWNoZV9hbGwoKQotI2RlZmluZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BB
R0UgMAotI2RlZmluZSBmbHVzaF9kY2FjaGVfcGFnZShwYWdlKQkJCWRvIHsgfSB3aGlsZSAoMCkK
LSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfbG9jayhtYXBwaW5nKQkJZG8geyB9IHdoaWxlICgw
KQotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGluZykJZG8geyB9IHdoaWxl
ICgwKQogI2RlZmluZSBmbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGxlbikJCV9fZmx1c2hfaWNh
Y2hlX2FsbCgpCi0jZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZtYSxwZykJCWRvIHsgfSB3aGls
ZSAoMCkKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2Uodm1hLHBnLGFkcixsZW4pCWRv
IHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChzdGFydCwgZW5kKQkJZG8g
eyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV92dW5tYXAoc3RhcnQsIGVuZCkJCWRv
IHsgfSB3aGlsZSAoMCkKLQotI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZh
ZGRyLCBkc3QsIHNyYywgbGVuKSBcCi0JbWVtY3B5KGRzdCwgc3JjLCBsZW4pCi0jZGVmaW5lIGNv
cHlfZnJvbV91c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAotCW1l
bWNweShkc3QsIHNyYywgbGVuKQogCiB2b2lkIG1jZl9jYWNoZV9wdXNoKHZvaWQpOwogCkBAIC05
OCw0ICs4MSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjYWNoZV9jbGVhcih1bnNpZ25lZCBsb25n
IHBhZGRyLCBpbnQgbGVuKQogCV9fY2xlYXJfY2FjaGVfYWxsKCk7CiB9CiAKKyNpbmNsdWRlIDxh
c20tZ2VuZXJpYy9jYWNoZWZsdXNoLmg+CisKICNlbmRpZiAvKiBfTTY4S05PTU1VX0NBQ0hFRkxV
U0hfSCAqLwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

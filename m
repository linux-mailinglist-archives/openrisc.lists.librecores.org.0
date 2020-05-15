Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0C52D1E501F
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BDD6820B5C;
	Wed, 27 May 2020 23:19:11 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2AE0920B0E
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9OkRp1p3UvpvhrMloqYZ5BRhhjLRydsct9faQtkGwTk=; b=DdyZcp26/ow147BL9gUGZZnER7
 vcCTRmMp36OtMyz9pn19PFkols5p+Nj3kQQ+jlz3xQh4MH/sjs2KmvQIAZVQQceUPBHHlCJNPsBhE
 +V4VFDQRDsfz4ppjxrPcVC0i3Znl6X0WZ+eB02i4ZAUvjHiteAVQo16H/TU3CzVSOW9lJG0ALia4r
 ovxaKmklN2eUI0ytL0Xzw2pUigOnnXYHm4EAbYD4UjXdBFdaCsw5Eft4WE8hp7WGJOJZgD6A9e+WW
 z7TDLg9mqbBwkpvdSpQOyl6PRMV3rhIGbixYdQJOTjhWvpkxEleX4gG2HEIv1CzggF07ZucRfNtL/
 pgIYQmMA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSe-0004HF-J3; Fri, 15 May 2020 14:37:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:27 +0200
Message-Id: <20200515143646.3857579-11-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 10/29] c6x: use asm-generic/cacheflush.h
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

QzZ4IG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5lcyBvZiBpdHMgb3duLiAg
UmVseSBvbgphc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggZm9yIHRoZSBkZWZhdWx0cy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYzZ4L2lu
Y2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDE5ICstLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9jNngvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC9jNngvaW5jbHVkZS9hc20vY2Fj
aGVmbHVzaC5oCmluZGV4IDQ1NDBiNDA0NzVlNmMuLjEwOTIyZDUyOGRlNmQgMTAwNjQ0Ci0tLSBh
L2FyY2gvYzZ4L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAorKysgYi9hcmNoL2M2eC9pbmNsdWRl
L2FzbS9jYWNoZWZsdXNoLmgKQEAgLTE2LDIxICsxNiw2IEBACiAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4KICNpbmNsdWRlIDxhc20vc3RyaW5nLmg+CiAKLS8qCi0gKiB2aXJ0dWFsbHktaW5kZXhlZCBj
YWNoZSBtYW5hZ2VtZW50IChvdXIgY2FjaGUgaXMgcGh5c2ljYWxseSBpbmRleGVkKQotICovCi0j
ZGVmaW5lIGZsdXNoX2NhY2hlX2FsbCgpCQkJZG8ge30gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNo
X2NhY2hlX21tKG1tKQkJCWRvIHt9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9kdXBf
bW0obW0pCQkJZG8ge30gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3JhbmdlKG1tLCBz
dGFydCwgZW5kKQlkbyB7fSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSh2bWEs
IHZtYWRkciwgcGZuKQlkbyB7fSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChz
dGFydCwgZW5kKQkJZG8ge30gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3Z1bm1hcChz
dGFydCwgZW5kKQkJZG8ge30gd2hpbGUgKDApCi0jZGVmaW5lIEFSQ0hfSU1QTEVNRU5UU19GTFVT
SF9EQ0FDSEVfUEFHRSAwCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9wYWdlKHBhZ2UpCQkJZG8ge30g
d2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFwX2xvY2sobWFwcGluZykJCWRvIHt9
IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGluZykJZG8g
e30gd2hpbGUgKDApCi0KIC8qCiAgKiBwaHlzaWNhbGx5LWluZGV4ZWQgY2FjaGUgbWFuYWdlbWVu
dAogICovCkBAIC00OSwxNCArMzQsMTIgQEAgZG8gewkJCQkJCQkJICBcCiAJCQkodW5zaWduZWQg
bG9uZykgcGFnZV9hZGRyZXNzKHBhZ2UpICsgUEFHRV9TSVpFKSk7IFwKIH0gd2hpbGUgKDApCiAK
LQogI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZhZGRyLCBkc3QsIHNyYywg
bGVuKSBcCiBkbyB7CQkJCQkJICAgICBcCiAJbWVtY3B5KGRzdCwgc3JjLCBsZW4pOwkJCSAgICAg
XAogCWZsdXNoX2ljYWNoZV9yYW5nZSgodW5zaWduZWQpIChkc3QpLCAodW5zaWduZWQpIChkc3Qp
ICsgKGxlbikpOyBcCiB9IHdoaWxlICgwKQogCi0jZGVmaW5lIGNvcHlfZnJvbV91c2VyX3BhZ2Uo
dm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAotCW1lbWNweShkc3QsIHNyYywgbGVu
KQorI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NhY2hlZmx1c2guaD4KIAogI2VuZGlmIC8qIF9BU01f
QzZYX0NBQ0hFRkxVU0hfSCAqLwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

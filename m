Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BC58F1E5038
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8FE2220CA2;
	Wed, 27 May 2020 23:19:28 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 1D42320B2F
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kQS44H8EzM8k3vQYjLlTfkfNkLQiGixe7Bw6b6gouAo=; b=COBcuw2sMnbx8n6F0r04JzqsVZ
 vhsnRV88QAm1MMvzPpni3bCVqECArdsjrwXjVyJYlm/nGqC1AIEq9cWiMnSp/fzU7XIAXjNKwscfM
 nVXUQU9d8CRR7QapoJ62NVVY23Jeq5tRK5o/GjOPHix1T3p4kQIooNVrQb1lQPjHzkliPq6DWjHvC
 Lp1UMyIIXYjsBXTXQnxmhuVUDUq3DYtlyrQTKrhkom10fZQAQQWcBRxs+tdOnyQeZgEK5bq2Q4fZ5
 CRtCX4IisNVhwlDMiN1J96maNni2cVQK6NLAIVY8S5Pb4KwJ0pbABeKSR0rJnkvQQRk7ExsxRZIgo
 vlL7IhMg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSu-0004ga-GD; Fri, 15 May 2020 14:37:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:32 +0200
Message-Id: <20200515143646.3857579-16-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 15/29] openrisc: use asm-generic/cacheflush.h
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

T3BlblJJU0MgbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9mIGl0cyBv
d24uICBSZWx5IG9uCmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBmb3IgdGhlIGRlZmF1bHRzLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9v
cGVucmlzYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCAzMSArKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9h
cmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCA3OWQ1ZDc3NTNmZTRi
Li43NGQxZmNlNGU4ODM5IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2Nh
Y2hlZmx1c2guaAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApA
QCAtNjIsMzEgKzYyLDEyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShz
dHJ1Y3QgcGFnZSAqcGFnZSkKIAljbGVhcl9iaXQoUEdfZGNfY2xlYW4sICZwYWdlLT5mbGFncyk7
CiB9CiAKLS8qCi0gKiBPdGhlciBpbnRlcmZhY2VzIGFyZSBub3QgcmVxdWlyZWQgc2luY2Ugd2Ug
ZG8gbm90IGhhdmUgdmlydHVhbGx5Ci0gKiBpbmRleGVkIG9yIHRhZ2dlZCBjYWNoZXMuIFNvIHdl
IGNhbiB1c2UgdGhlIGRlZmF1bHQgaGVyZS4KLSAqLwotI2RlZmluZSBmbHVzaF9jYWNoZV9hbGwo
KQkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX21tKG1tKQkJCQlkbyB7
IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX2R1cF9tbShtbSkJCQkJZG8geyB9IHdo
aWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9yYW5nZSh2bWEsIHN0YXJ0LCBlbmQpCQlkbyB7
IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3BhZ2Uodm1hLCB2bWFkZHIsIHBmbikJ
CWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfbG9jayhtYXBwaW5n
KQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfdW5sb2NrKG1h
cHBpbmcpCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2ljYWNoZV9yYW5nZShzdGFy
dCwgZW5kKQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3BhZ2Uodm1h
LCBwZykJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3Jhbmdl
KHZtYSwgcGcsIGFkciwgbGVuKQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hl
X3ZtYXAoc3RhcnQsIGVuZCkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hl
X3Z1bm1hcChzdGFydCwgZW5kKQkJCWRvIHsgfSB3aGlsZSAoMCkKLQotI2RlZmluZSBjb3B5X3Rv
X3VzZXJfcGFnZSh2bWEsIHBhZ2UsIHZhZGRyLCBkc3QsIHNyYywgbGVuKSAgICAgICAgICAgXAot
CWRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi0JCW1lbWNweShkc3QsIHNyYywgbGVuKTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAotCQlpZiAodm1hLT52bV9mbGFncyAmIFZNX0VYRUMpICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKLQkJCXN5bmNfaWNhY2hlX2RjYWNoZShwYWdlKTsgICAgICAgICAgICAgICAgICAg
IFwKLQl9IHdoaWxlICgwKQorI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBh
Z2UsIGFkZHIsIGxlbikJXAorZG8gewkJCQkJCQlcCisJaWYgKHZtYS0+dm1fZmxhZ3MgJiBWTV9F
WEVDKQkJCVwKKwkJc3luY19pY2FjaGVfZGNhY2hlKHBhZ2UpOwkJXAorfSB3aGlsZSAoMCkKIAot
I2RlZmluZSBjb3B5X2Zyb21fdXNlcl9wYWdlKHZtYSwgcGFnZSwgdmFkZHIsIGRzdCwgc3JjLCBs
ZW4pICAgICAgICAgXAotCW1lbWNweShkc3QsIHNyYywgbGVuKQorI2luY2x1ZGUgPGFzbS1nZW5l
cmljL2NhY2hlZmx1c2guaD4KIAogI2VuZGlmIC8qIF9fQVNNX0NBQ0hFRkxVU0hfSCAqLwotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

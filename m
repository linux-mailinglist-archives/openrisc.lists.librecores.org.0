Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BE011EAEA7
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 271B420737;
	Thu, 31 Oct 2019 12:21:21 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 980B820727
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:48:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LVEPu9/s1693dWfYlkD3Fqnhr0FkMtGhuRv/aJrvhOg=; b=CjcLLx9Rbn9xuQMHWo3P+/E1sU
 ooM0jF37fYsdGSlXP2KajPZEhNoIBmCi0+Y4FpqQG5IF5PVVNtlzdZih8+hV6/+vU6WexF+5kvadq
 lYFSn+w7a0hwqosU3Pc+47op6H05FK/AoPe6KVqrAmpK9JGSp0bj9b5VjCAnpEcWQmcEtLFLtwv7O
 VsnUQ0jRfffNMMY9HKa7gWQp89V+GI4xSQkkXlreZ4Gp5hPS+If7bae5fBkt6SkBdBc9xz1bZfDrS
 gZK/MGTuxOqLy15pC6TgpC3nfuyLh/IhGZJiHo46oOOZcl9mcx8itxVt2LWLbLh+qwFMetnNSZ2jI
 j8xAzYZQ==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJ5-0003JN-4r; Tue, 29 Oct 2019 06:48:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:15 +0100
Message-Id: <20191029064834.23438-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 02/21] unicore32: remove ioremap_cached
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

Tm8gdXNlcnMgb2YgaW9yZW1hcF9jYWNoZWQgYXJlIGxlZnQsIHJlbW92ZSBpdC4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvdW5pY29yZTMy
L2luY2x1ZGUvYXNtL2lvLmggfCA0ICstLS0KIGFyY2gvdW5pY29yZTMyL21tL2lvcmVtYXAuYyAg
ICAgfCA4IC0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9pby5oIGIv
YXJjaC91bmljb3JlMzIvaW5jbHVkZS9hc20vaW8uaAppbmRleCBjNzFhYTRiOTU5OTYuLjRiNDYw
ZTAxYWNmYSAxMDA2NDQKLS0tIGEvYXJjaC91bmljb3JlMzIvaW5jbHVkZS9hc20vaW8uaAorKysg
Yi9hcmNoL3VuaWNvcmUzMi9pbmNsdWRlL2FzbS9pby5oCkBAIC0xOCwxMCArMTgsOSBAQAogI2lu
Y2x1ZGUgPGFzbS1nZW5lcmljL2lvLmg+CiAKIC8qCi0gKiBfX3VjMzJfaW9yZW1hcCBhbmQgX191
YzMyX2lvcmVtYXBfY2FjaGVkIHRha2VzIENQVSBwaHlzaWNhbCBhZGRyZXNzLgorICogX191YzMy
X2lvcmVtYXAgdGFrZXMgQ1BVIHBoeXNpY2FsIGFkZHJlc3MuCiAgKi8KIGV4dGVybiB2b2lkIF9f
aW9tZW0gKl9fdWMzMl9pb3JlbWFwKHVuc2lnbmVkIGxvbmcsIHNpemVfdCk7Ci1leHRlcm4gdm9p
ZCBfX2lvbWVtICpfX3VjMzJfaW9yZW1hcF9jYWNoZWQodW5zaWduZWQgbG9uZywgc2l6ZV90KTsK
IGV4dGVybiB2b2lkIF9fdWMzMl9pb3VubWFwKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcik7
CiAKIC8qCkBAIC0zMiw3ICszMSw2IEBAIGV4dGVybiB2b2lkIF9fdWMzMl9pb3VubWFwKHZvbGF0
aWxlIHZvaWQgX19pb21lbSAqYWRkcik7CiAgKgogICovCiAjZGVmaW5lIGlvcmVtYXAoY29va2ll
LCBzaXplKQkJX191YzMyX2lvcmVtYXAoY29va2llLCBzaXplKQotI2RlZmluZSBpb3JlbWFwX2Nh
Y2hlZChjb29raWUsIHNpemUpCV9fdWMzMl9pb3JlbWFwX2NhY2hlZChjb29raWUsIHNpemUpCiAj
ZGVmaW5lIGlvcmVtYXBfbm9jYWNoZShjb29raWUsIHNpemUpCV9fdWMzMl9pb3JlbWFwKGNvb2tp
ZSwgc2l6ZSkKICNkZWZpbmUgaW91bm1hcChjb29raWUpCQkJX191YzMyX2lvdW5tYXAoY29va2ll
KQogCmRpZmYgLS1naXQgYS9hcmNoL3VuaWNvcmUzMi9tbS9pb3JlbWFwLmMgYi9hcmNoL3VuaWNv
cmUzMi9tbS9pb3JlbWFwLmMKaW5kZXggY2Y2ZDY1NmYyNDBjLi40NmE2NGJkNjE1NmEgMTAwNjQ0
Ci0tLSBhL2FyY2gvdW5pY29yZTMyL21tL2lvcmVtYXAuYworKysgYi9hcmNoL3VuaWNvcmUzMi9t
bS9pb3JlbWFwLmMKQEAgLTIyMCwxNCArMjIwLDYgQEAgX191YzMyX2lvcmVtYXAodW5zaWduZWQg
bG9uZyBwaHlzX2FkZHIsIHNpemVfdCBzaXplKQogfQogRVhQT1JUX1NZTUJPTChfX3VjMzJfaW9y
ZW1hcCk7CiAKLXZvaWQgX19pb21lbSAqCi1fX3VjMzJfaW9yZW1hcF9jYWNoZWQodW5zaWduZWQg
bG9uZyBwaHlzX2FkZHIsIHNpemVfdCBzaXplKQotewotCXJldHVybiBfX3VjMzJfaW9yZW1hcF9j
YWxsZXIocGh5c19hZGRyLCBzaXplLCBNVF9ERVZJQ0VfQ0FDSEVELAotCQkJX19idWlsdGluX3Jl
dHVybl9hZGRyZXNzKDApKTsKLX0KLUVYUE9SVF9TWU1CT0woX191YzMyX2lvcmVtYXBfY2FjaGVk
KTsKLQogdm9pZCBfX3VjMzJfaW91bm1hcCh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmlvX2FkZHIp
CiB7CiAJdm9pZCAqYWRkciA9ICh2b2lkICopKFBBR0VfTUFTSyAmICh1bnNpZ25lZCBsb25nKWlv
X2FkZHIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

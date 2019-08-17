Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E07A291103
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 92167200E0;
	Sat, 17 Aug 2019 17:02:34 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 593FE20480
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GHc6Yik7xiJpzATFcCLZXqdQpVpnWVpKrNGwCVr+Ge4=; b=aa2Iw1G8i13A7RQ/0VjWsJY9Ex
 DDOL+gOggGuQha4jkIUkidzliYAUfhxFoWCbyj7nf8xw6nLBJjlhJQq4tzQybIRpcKLbjxllHvLLk
 9/h3ZC3odZhlX0L3FP2BQNpdRWSDMJVf0sFxvJxgzHgcaj/PhY5t8YF92zCeEoiS0DUaHet1QKtF8
 Qe90WBkroOt49+SZtE5VnkquqwL3vfQjjEMR3SQc80lPN0DEn0zIn7o9+dpEQCPYUao6yUWa6/acr
 PfVa3PHG7GPLC41ot8QX9nh1teAIUt1pLZTUDLyKt6uAommRf027gectMEWJ9J+AljE0pIpuHcwNZ
 cpwdqsvA==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytRw-0004oo-JJ; Sat, 17 Aug 2019 07:48:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:35 +0200
Message-Id: <20190817073253.27819-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 08/26] m68k: simplify ioremap_nocache
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

SnVzdCBkZWZpbmUgaW9yZW1hcF9ub2NhY2hlIHRvIGlvcmVtYXAgaW5zdGVhZCBvZiBkdXBsaWNh
dGluZyB0aGUKaW5saW5lLiAgQWxzbyBkZWZpbmVkIGlvcmVtYXBfdWMgaW4gdGVybXMgb2YgaW9y
ZW1hcCBpbnN0ZWFkIG9mCnRoZSB1c2luZyBhIGRvdWJsZSBpbmRpcmVjdGlvbi4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvbTY4ay9pbmNs
dWRlL2FzbS9rbWFwLmggfCAxMCArKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9pbmNsdWRlL2Fz
bS9rbWFwLmggYi9hcmNoL202OGsvaW5jbHVkZS9hc20va21hcC5oCmluZGV4IDAzZDkwNGZlNjA4
Ny4uNDIxYjZjOWM3NjlkIDEwMDY0NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20va21hcC5o
CisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9rbWFwLmgKQEAgLTI4LDE0ICsyOCw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c2FkZHIs
IHVuc2lnbmVkIGxvbmcgc2l6ZSkKIAlyZXR1cm4gX19pb3JlbWFwKHBoeXNhZGRyLCBzaXplLCBJ
T01BUF9OT0NBQ0hFX1NFUik7CiB9CiAKLSNkZWZpbmUgaW9yZW1hcF9ub2NhY2hlIGlvcmVtYXBf
bm9jYWNoZQotc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfbm9jYWNoZSh1bnNp
Z25lZCBsb25nIHBoeXNhZGRyLAotCQkJCQkgICAgdW5zaWduZWQgbG9uZyBzaXplKQotewotCXJl
dHVybiBfX2lvcmVtYXAocGh5c2FkZHIsIHNpemUsIElPTUFQX05PQ0FDSEVfU0VSKTsKLX0KLQot
I2RlZmluZSBpb3JlbWFwX3VjIGlvcmVtYXBfbm9jYWNoZQorI2RlZmluZSBpb3JlbWFwX25vY2Fj
aGUgaW9yZW1hcAorI2RlZmluZSBpb3JlbWFwX3VjIGlvcmVtYXAKICNkZWZpbmUgaW9yZW1hcF93
dCBpb3JlbWFwX3d0CiBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcF93dCh1bnNp
Z25lZCBsb25nIHBoeXNhZGRyLAogCQkJCSAgICAgICB1bnNpZ25lZCBsb25nIHNpemUpCi0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

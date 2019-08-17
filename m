Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 54BF4910FF
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 545EF204CA;
	Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 0891C20332
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVa1dlO13VGUAr1yg3sOZ4M4arLVOwQoi05nRfUMCMI=; b=UAFSW5+tlkDmNpbrqdSS4sPWLy
 /2BupHlqIZ500JsJdSVDcvzy7Sh/K5vJygbZlTzELSTKGEp3yT4+XJ3iOfbxplbmvdWRQcjrlsQAn
 7hIqWCaLM5pmdpqwtIshLmPD/nl9vfmrUCCky9UABOsdtl3s+NgW1R8yD7Afqyi6q5jgk+rvFx9fE
 Auk7jPGG5wy5dg6qkbZlRIKw9VqZG7f+V59MKY1OLtNF7OBEqqC+JkggYIUvpgR9DScsMLU3E7wKR
 NjBeVJdN8OZzUkfj5vK6aQY+cRsuY0ivzNOJ2l8iKvA7YPXtphclPGZwRLoZ9OzDwXuu6nTb7yix6
 HKYMj5Yg==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytNX-0001rF-8R; Sat, 17 Aug 2019 07:43:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:31 +0200
Message-Id: <20190817073253.27819-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 04/26] mips: remove ioremap_cachable
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

SnVzdCBkZWZpbmUgaW9yZW1hcF9jYWNoZSBkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9pby5o
IHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9taXBz
L2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggOTdhMjgwNjQwZGFmLi5jMDJkYjk4NmRkZjUgMTAwNjQ0
Ci0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvbWlwcy9pbmNsdWRl
L2FzbS9pby5oCkBAIC0yNjIsMTEgKzI2MiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21l
bSAqaW9yZW1hcF9wcm90KHBoeXNfYWRkcl90IG9mZnNldCwKICNkZWZpbmUgaW9yZW1hcF91YyBp
b3JlbWFwX25vY2FjaGUKIAogLyoKLSAqIGlvcmVtYXBfY2FjaGFibGUgLQltYXAgYnVzIG1lbW9y
eSBpbnRvIENQVSBzcGFjZQorICogaW9yZW1hcF9jYWNoZSAtCW1hcCBidXMgbWVtb3J5IGludG8g
Q1BVIHNwYWNlCiAgKiBAb2Zmc2V0OgkgICAgYnVzIGFkZHJlc3Mgb2YgdGhlIG1lbW9yeQogICog
QHNpemU6CSAgICBzaXplIG9mIHRoZSByZXNvdXJjZSB0byBtYXAKICAqCi0gKiBpb3JlbWFwX25v
Y2FjaGUgcGVyZm9ybXMgYSBwbGF0Zm9ybSBzcGVjaWZpYyBzZXF1ZW5jZSBvZiBvcGVyYXRpb25z
IHRvCisgKiBpb3JlbWFwX2NhY2hlIHBlcmZvcm1zIGEgcGxhdGZvcm0gc3BlY2lmaWMgc2VxdWVu
Y2Ugb2Ygb3BlcmF0aW9ucyB0bwogICogbWFrZSBidXMgbWVtb3J5IENQVSBhY2Nlc3NpYmxlIHZp
YSB0aGUgcmVhZGIvcmVhZHcvcmVhZGwvd3JpdGViLwogICogd3JpdGV3L3dyaXRlbCBmdW5jdGlv
bnMgYW5kIHRoZSBvdGhlciBtbWlvIGhlbHBlcnMuIFRoZSByZXR1cm5lZAogICogYWRkcmVzcyBp
cyBub3QgZ3VhcmFudGVlZCB0byBiZSB1c2FibGUgZGlyZWN0bHkgYXMgYSB2aXJ0dWFsCkBAIC0y
NzYsOSArMjc2LDggQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfcHJvdChw
aHlzX2FkZHJfdCBvZmZzZXQsCiAgKiB0aGUgQ1BVLiAgQWxzbyBlbmFibGVzIGZ1bGwgd3JpdGUt
Y29tYmluaW5nLgkgVXNlZnVsIGZvciBzb21lCiAgKiBtZW1vcnktbGlrZSByZWdpb25zIG9uIEkv
TyBidXNzZXMuCiAgKi8KLSNkZWZpbmUgaW9yZW1hcF9jYWNoYWJsZShvZmZzZXQsIHNpemUpCQkJ
CQlcCisjZGVmaW5lIGlvcmVtYXBfY2FjaGUob2Zmc2V0LCBzaXplKQkJCQkJXAogCV9faW9yZW1h
cF9tb2RlKChvZmZzZXQpLCAoc2l6ZSksIF9wYWdlX2NhY2hhYmxlX2RlZmF1bHQpCi0jZGVmaW5l
IGlvcmVtYXBfY2FjaGUgaW9yZW1hcF9jYWNoYWJsZQogCiAvKgogICogaW9yZW1hcF93YyAgICAg
LSAgIG1hcCBidXMgbWVtb3J5IGludG8gQ1BVIHNwYWNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2C4EAEB5
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68BDE20778;
	Thu, 31 Oct 2019 12:21:29 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 546992073E
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qlJzcnNPhbKTD4rzraxFG78WTWQrEPk5hzQGDgWCawQ=; b=Y+x2zOiatOg5SlYTX5fIO285L6
 e9gR7NlANxUOE2zBvNMRxfIDoWCbfMCRBk6vG9z1+FPPzw1ghvP04BsT8U5iafPimOMgcIxlYieqx
 XHbWRc05j3wQlus+5+bpKavpuuXmg4PQhOyVGgQ0wTToKzFv8HN5Pz3ppIosIDasWQGNqRvhE3907
 dko9p8G9zt32GQo472+E9lt4XkTGMc851892XuB60Fo3nVufVs8zsvnhVcR3a2RiJCr6sY8JWs9C7
 q/2jz+JRDFQO6VT3rY6frJkimmKKghWj1YFz3BjsvTf59RVf3NKYZgbciaZIZ0gSlsKC8omm+yXqm
 YpF86uMQ==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJm-00042z-KQ; Tue, 29 Oct 2019 06:49:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:29 +0100
Message-Id: <20191029064834.23438-17-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:19 +0100
Subject: [OpenRISC] [PATCH 16/21] sh: remove __iounmap
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

Tm8gbmVlZCB0byBpbmRpcmVjdCBpb3VubWFwIGZvciBzaC4KClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvc2gvaW5jbHVkZS9hc20vaW8uaCB8
IDkgKystLS0tLS0tCiBhcmNoL3NoL21tL2lvcmVtYXAuYyAgICAgfCA0ICsrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvc2gvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvc2gvaW5jbHVkZS9hc20vaW8uaAppbmRleCBh
YzA1NjE5NjBjNTIuLjE0OTU0ODkyMjVhYyAxMDA2NDQKLS0tIGEvYXJjaC9zaC9pbmNsdWRlL2Fz
bS9pby5oCisrKyBiL2FyY2gvc2gvaW5jbHVkZS9hc20vaW8uaApAQCAtMjY3LDcgKzI2Nyw3IEBA
IHVuc2lnbmVkIGxvbmcgbG9uZyBwb2tlX3JlYWxfYWRkcmVzc19xKHVuc2lnbmVkIGxvbmcgbG9u
ZyBhZGRyLAogI2lmZGVmIENPTkZJR19NTVUKIHZvaWQgX19pb21lbSAqX19pb3JlbWFwX2NhbGxl
cihwaHlzX2FkZHJfdCBvZmZzZXQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKIAkJCSAgICAgICBwZ3By
b3RfdCBwcm90LCB2b2lkICpjYWxsZXIpOwotdm9pZCBfX2lvdW5tYXAodm9pZCBfX2lvbWVtICph
ZGRyKTsKK3ZvaWQgaW91bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpOwogCiBzdGF0aWMgaW5saW5l
IHZvaWQgX19pb21lbSAqCiBfX2lvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCB1bnNpZ25lZCBs
b25nIHNpemUsIHBncHJvdF90IHByb3QpCkBAIC0zMjgsNyArMzI4LDcgQEAgX19pb3JlbWFwX21v
ZGUocGh5c19hZGRyX3Qgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUsIHBncHJvdF90IHByb3Qp
CiAjZWxzZQogI2RlZmluZSBfX2lvcmVtYXAob2Zmc2V0LCBzaXplLCBwcm90KQkJKCh2b2lkIF9f
aW9tZW0gKikob2Zmc2V0KSkKICNkZWZpbmUgX19pb3JlbWFwX21vZGUob2Zmc2V0LCBzaXplLCBw
cm90KQkoKHZvaWQgX19pb21lbSAqKShvZmZzZXQpKQotI2RlZmluZSBfX2lvdW5tYXAoYWRkcikJ
CQkJZG8geyB9IHdoaWxlICgwKQorI2RlZmluZSBpb3VubWFwKGFkZHIpCQkJCWRvIHsgfSB3aGls
ZSAoMCkKICNlbmRpZiAvKiBDT05GSUdfTU1VICovCiAKIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lv
bWVtICppb3JlbWFwKHBoeXNfYWRkcl90IG9mZnNldCwgdW5zaWduZWQgbG9uZyBzaXplKQpAQCAt
MzcwLDExICszNzAsNiBAQCBzdGF0aWMgaW5saW5lIGludCBpb3VubWFwX2ZpeGVkKHZvaWQgX19p
b21lbSAqYWRkcikgeyByZXR1cm4gLUVJTlZBTDsgfQogI2RlZmluZSBpb3JlbWFwX25vY2FjaGUJ
aW9yZW1hcAogI2RlZmluZSBpb3JlbWFwX3VjCWlvcmVtYXAKIAotc3RhdGljIGlubGluZSB2b2lk
IGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRyKQotewotCV9faW91bm1hcChhZGRyKTsKLX0KLQog
LyoKICAqIENvbnZlcnQgYSBwaHlzaWNhbCBwb2ludGVyIHRvIGEgdmlydHVhbCBrZXJuZWwgcG9p
bnRlciBmb3IgL2Rldi9tZW0KICAqIGFjY2VzcwpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9tbS9pb3Jl
bWFwLmMgYi9hcmNoL3NoL21tL2lvcmVtYXAuYwppbmRleCBkMDlkZGZlNThmZDguLmY2ZDAyMjQ2
ZDY2NSAxMDA2NDQKLS0tIGEvYXJjaC9zaC9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC9zaC9tbS9p
b3JlbWFwLmMKQEAgLTEwMyw3ICsxMDMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBpb21hcHBpbmdf
bm9udHJhbnNsYXRhYmxlKHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQogCXJldHVybiAwOwogfQogCi12
b2lkIF9faW91bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpCit2b2lkIGlvdW5tYXAodm9pZCBfX2lv
bWVtICphZGRyKQogewogCXVuc2lnbmVkIGxvbmcgdmFkZHIgPSAodW5zaWduZWQgbG9uZyBfX2Zv
cmNlKWFkZHI7CiAJc3RydWN0IHZtX3N0cnVjdCAqcDsKQEAgLTEzNCw0ICsxMzQsNCBAQCB2b2lk
IF9faW91bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpCiAKIAlrZnJlZShwKTsKIH0KLUVYUE9SVF9T
WU1CT0woX19pb3VubWFwKTsKK0VYUE9SVF9TWU1CT0woaW91bm1hcCk7Ci0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D0B9591110
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AC336204D0;
	Sat, 17 Aug 2019 17:02:42 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 5EA5320496
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lil/5cEkB/ZCAm17l4nkkVLk0wR2AVyhy52WWrhy+jc=; b=n1VbjRLr/nwQjd5ZfA52ZR3MZ8
 k29dIMFlgP3oYclhmvi9fgmBEis1Z9UVc8+ZboG5zmnh0Kraox4Z4eT+3Q1GmSWh8KpVjv1GwpgZI
 ORwoiM+UKb9lXoq1eBwDsMRpGVfIXQRMa3Z+CWXkE6jxZoN7SjhX6io1bFrcGE4GRuG2p4hLDYANx
 7cQrOaT+B4f6PE5qBTv6euDf8A5i3Q2s4/9h882Lq7GqrbTLWFK2L0fzJ4fj/QrPjxjv44bMyEW2g
 sHocDvCS5K8yzeRTbUNwISrC3XFN8/qVkrkRAt5TIjJDu27jMsU1vRFyK/DR3ho2FQxkPu5j7TtS9
 KMiq2Iaw==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSe-0005Wn-N5; Sat, 17 Aug 2019 07:49:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:48 +0200
Message-Id: <20190817073253.27819-22-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 21/26] nios2: remove __iounmap
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

Tm8gbmVlZCB0byBpbmRpcmVjdCBpb3VubWFwIGZvciBuaW9zMi4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvbmlvczIvaW5jbHVkZS9hc20v
aW8uaCB8IDcgKy0tLS0tLQogYXJjaC9uaW9zMi9tbS9pb3JlbWFwLmMgICAgIHwgNiArKystLS0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvbmlvczIvaW5jbHVkZS9h
c20vaW8uaAppbmRleCBkMTA4OTM3YzMyMWUuLjc0Njg1M2FjN2Q4ZCAxMDA2NDQKLS0tIGEvYXJj
aC9uaW9zMi9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vaW8u
aApAQCAtMjYsMTIgKzI2LDcgQEAKICNkZWZpbmUgd3JpdGVsX3JlbGF4ZWQoeCwgYWRkcikJd3Jp
dGVsKHgsIGFkZHIpCiAKIHZvaWQgX19pb21lbSAqaW9yZW1hcCh1bnNpZ25lZCBsb25nIHBoeXNh
ZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpOwotZXh0ZXJuIHZvaWQgX19pb3VubWFwKHZvaWQgX19p
b21lbSAqYWRkcik7Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAq
YWRkcikKLXsKLQlfX2lvdW5tYXAoYWRkcik7Ci19Cit2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVt
ICphZGRyKTsKIAogLyogUGFnZXMgdG8gcGh5c2ljYWwgYWRkcmVzcy4uLiAqLwogI2RlZmluZSBw
YWdlX3RvX3BoeXMocGFnZSkJdmlydF90b19waHlzKHBhZ2VfdG9fdmlydChwYWdlKSkKZGlmZiAt
LWdpdCBhL2FyY2gvbmlvczIvbW0vaW9yZW1hcC5jIGIvYXJjaC9uaW9zMi9tbS9pb3JlbWFwLmMK
aW5kZXggN2ExYTI3ZjNkYWEzLi5iNTZhZjc1OWRjZGYgMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIv
bW0vaW9yZW1hcC5jCisrKyBiL2FyY2gvbmlvczIvbW0vaW9yZW1hcC5jCkBAIC0xNTcsMTEgKzE1
NywxMSBAQCB2b2lkIF9faW9tZW0gKmlvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVu
c2lnbmVkIGxvbmcgc2l6ZSkKIEVYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAKIC8qCi0gKiBfX2lv
dW5tYXAgdW5tYXBzIG5lYXJseSBldmVyeXRoaW5nLCBzbyBiZSBjYXJlZnVsCisgKiBpb3VubWFw
IHVubWFwcyBuZWFybHkgZXZlcnl0aGluZywgc28gYmUgY2FyZWZ1bAogICogaXQgZG9lc24ndCBm
cmVlIGN1cnJlbnRseSBwb2ludGVyL3BhZ2UgdGFibGVzIGFueW1vcmUgYnV0IGl0CiAgKiB3YXNu
J3QgdXNlZCBhbnl3YXkgYW5kIG1pZ2h0IGJlIGFkZGVkIGxhdGVyLgogICovCi12b2lkIF9faW91
bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpCit2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRy
KQogewogCXN0cnVjdCB2bV9zdHJ1Y3QgKnA7CiAKQEAgLTE3Myw0ICsxNzMsNCBAQCB2b2lkIF9f
aW91bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpCiAJCXByX2VycigiaW91bm1hcDogYmFkIGFkZHJl
c3MgJXBcbiIsIGFkZHIpOwogCWtmcmVlKHApOwogfQotRVhQT1JUX1NZTUJPTChfX2lvdW5tYXAp
OworRVhQT1JUX1NZTUJPTChpb3VubWFwKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2814D91101
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A029D204CE;
	Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 461D82047B
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juqTaRJLAUN8sACpA/ifAvJQqQFz7PwWUU79IVC7rTQ=; b=tE4HzSwuGmt2yt2L5TvlruIjuj
 t0P27yzYCepN/bZo5j5YE+jN4n4reTCWEHjt3fZIGDM/kcK2w4Z02+rNlH4gJQJCeoXVmnDIWcQcm
 NzYNgxNqTdiZAN/dc3AnRFo23b19A8TNkgYMp3ZeydNHcKieL1YYOVghVgZTFH4LUAKE+7Qy+vOMs
 TSieZ/dvv6XzmazukAeD0f34Pl3tZYVlzYuZDc4AHIDWxQBOwcO4rt3zGq9EnYmBrme0eo4WTS4iV
 Qp/C1+7eZwiDbZhaSHj/3CgSZUD3G5AEJWC1E7d2VdIfO4AloobrqCvQLAw0w8hQfYZylj+9cZNR5
 CCRg+ACA==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytRp-0004mg-GT; Sat, 17 Aug 2019 07:48:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:33 +0200
Message-Id: <20190817073253.27819-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 06/26] ia64: rename ioremap_nocache to ioremap_uc
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

T24gaWE2NCBpb3JlbWFwX25vY2FjaGUgZmFpbHMgaWYgYXR0cmlidXRzIGRvbid0IG1hdGNoLiAg
Tm90IG90aGVyCmFyY2hpdGVjdHVyZXMgZG9lcyB0aGlzLCBhbmQgd2UgcGxhbiB0byBnZXQgcmlk
IG9mIGlvcmVtYXBfbm9jYWNoZS4KU28gZ2V0IHJpZCBvZiB0aGUgc3BlY2lhbCBzZW1hbnRpY3Mg
YW5kIGRlZmluZSBpb3JlbWFwX25vY2FjaGUgaW4KdGVybXMgb2YgaW9yZW1hcCBhcyBubyBwb3J0
YWJsZSBkcml2ZXIgY291bGQgcmVseSBvbiB0aGUgYmVoYXZpb3IKYW55d2F5LgoKSG93ZXZlciB4
ODYgaW1wbGVtZW50cyBpb3JlbWFwX3VjIHdpdGggYSBpbiBhIHNpbWlsYXIgd2F5IGFzIHRoZSBp
YTY0CnZlcnNpb24gb2YgaW9yZW1hcF9ub2NhY2hlLCBzbyBpbXBsZW1lbnQgdGhhdCBpbnN0ZWFk
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJj
aC9pYTY0L2luY2x1ZGUvYXNtL2lvLmggfCA2ICsrKy0tLQogYXJjaC9pYTY0L21tL2lvcmVtYXAu
YyAgICAgfCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9p
YTY0L2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggYTUxMWQ2MmQ0NDdhLi5mZWJkMmM2ZWEwYjQgMTAw
NjQ0Ci0tLSBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvaWE2NC9pbmNs
dWRlL2FzbS9pby5oCkBAIC00MTIsMTYgKzQxMiwxNiBAQCBfX3dyaXRlcSAodW5zaWduZWQgbG9u
ZyB2YWwsIHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcikKICMgaWZkZWYgX19LRVJORUxfXwog
CiBleHRlcm4gdm9pZCBfX2lvbWVtICogaW9yZW1hcCh1bnNpZ25lZCBsb25nIG9mZnNldCwgdW5z
aWduZWQgbG9uZyBzaXplKTsKLWV4dGVybiB2b2lkIF9faW9tZW0gKiBpb3JlbWFwX25vY2FjaGUg
KHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUpOworZXh0ZXJuIHZvaWQg
X19pb21lbSAqIGlvcmVtYXBfdWModW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcg
c2l6ZSk7CiBleHRlcm4gdm9pZCBpb3VubWFwICh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIp
Owogc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKiBpb3JlbWFwX2NhY2hlICh1bnNpZ25lZCBs
b25nIHBoeXNfYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQogewogCXJldHVybiBpb3JlbWFwKHBo
eXNfYWRkciwgc2l6ZSk7CiB9CiAjZGVmaW5lIGlvcmVtYXAgaW9yZW1hcAotI2RlZmluZSBpb3Jl
bWFwX25vY2FjaGUgaW9yZW1hcF9ub2NhY2hlCisjZGVmaW5lIGlvcmVtYXBfbm9jYWNoZSBpb3Jl
bWFwCiAjZGVmaW5lIGlvcmVtYXBfY2FjaGUgaW9yZW1hcF9jYWNoZQotI2RlZmluZSBpb3JlbWFw
X3VjIGlvcmVtYXBfbm9jYWNoZQorI2RlZmluZSBpb3JlbWFwX3VjIGlvcmVtYXBfdWMKICNkZWZp
bmUgaW91bm1hcCBpb3VubWFwCiAKIC8qCmRpZmYgLS1naXQgYS9hcmNoL2lhNjQvbW0vaW9yZW1h
cC5jIGIvYXJjaC9pYTY0L21tL2lvcmVtYXAuYwppbmRleCAwYzBkZTJjNGVjNjkuLmEwOWNmYTA2
NDUzNiAxMDA2NDQKLS0tIGEvYXJjaC9pYTY0L21tL2lvcmVtYXAuYworKysgYi9hcmNoL2lhNjQv
bW0vaW9yZW1hcC5jCkBAIC05OSwxNCArOTksMTQgQEAgaW9yZW1hcCAodW5zaWduZWQgbG9uZyBw
aHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIEVYUE9SVF9TWU1CT0woaW9yZW1hcCk7CiAK
IHZvaWQgX19pb21lbSAqCi1pb3JlbWFwX25vY2FjaGUgKHVuc2lnbmVkIGxvbmcgcGh5c19hZGRy
LCB1bnNpZ25lZCBsb25nIHNpemUpCitpb3JlbWFwX3VjKHVuc2lnbmVkIGxvbmcgcGh5c19hZGRy
LCB1bnNpZ25lZCBsb25nIHNpemUpCiB7CiAJaWYgKGtlcm5fbWVtX2F0dHJpYnV0ZShwaHlzX2Fk
ZHIsIHNpemUpICYgRUZJX01FTU9SWV9XQikKIAkJcmV0dXJuIE5VTEw7CiAKIAlyZXR1cm4gX19p
b3JlbWFwX3VjKHBoeXNfYWRkcik7CiB9Ci1FWFBPUlRfU1lNQk9MKGlvcmVtYXBfbm9jYWNoZSk7
CitFWFBPUlRfU1lNQk9MKGlvcmVtYXBfdWMpOwogCiB2b2lkCiBlYXJseV9pb3VubWFwICh2b2xh
dGlsZSB2b2lkIF9faW9tZW0gKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

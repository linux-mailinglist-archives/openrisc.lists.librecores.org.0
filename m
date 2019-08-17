Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83A9491105
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EF64C20429;
	Sat, 17 Aug 2019 17:02:35 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 5356C2042B
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FX04uJGNdq/Yp5y2MJBzjZbPxUQfO+iCaj0twVF6zA4=; b=FqajDALycfb3RLQsUvPVbgMPZz
 dOpsoNefkCkTkLOaUQRGC8tl371AnmtMs6thFxyNwkW1yB+7T0jMHPB65jBRdYz/I80D14AQ6ZpBw
 BDYJQsjgjLlR04v31PZV0oT60nsijEpUHC1RRG+jxHwJlhBqHgVEGMZMTWIYDiOqybAapjylrP6Pq
 /qPcKzZV3rHqe7SwrY7J778iGraDjHz/Z+sErABUK//lsbWGR8mA4dxVHMpkCfqNTFN8YM0E3k+zr
 6pQnG2H5clsP0FQfNouxdRC54eU8Y7E2BTkOKJH/Oagbm2XrsbWa+ET09Ko1zazTtcz1PQzUXJ5qL
 cYcHBYyw==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytS3-0004wM-1D; Sat, 17 Aug 2019 07:48:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:37 +0200
Message-Id: <20190817073253.27819-11-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 10/26] nios2: remove __ioremap
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

VGhlIGNhY2hlZmxhZyBhcmd1bWVudCB0byBfX2lvcmVtYXAgaXMgYWx3YXlzIDAsIHNvIGp1c3Qg
aW1wbGVtZW50CmlvcmVtYXAgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL25pb3MyL2luY2x1ZGUvYXNtL2lvLmggfCAyMCAr
KysrLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9uaW9zMi9tbS9pb3JlbWFwLmMgICAgIHwgMTcgKysr
LS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL25pb3MyL2luY2x1ZGUvYXNtL2lvLmggYi9hcmNo
L25pb3MyL2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggOTAxMDI0MzA3N2FiLi43NGFiMzRhYTY3MzEg
MTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vaW8uaAorKysgYi9hcmNoL25pb3My
L2luY2x1ZGUvYXNtL2lvLmgKQEAgLTI1LDI5ICsyNSwxNyBAQAogI2RlZmluZSB3cml0ZXdfcmVs
YXhlZCh4LCBhZGRyKQl3cml0ZXcoeCwgYWRkcikKICNkZWZpbmUgd3JpdGVsX3JlbGF4ZWQoeCwg
YWRkcikJd3JpdGVsKHgsIGFkZHIpCiAKLWV4dGVybiB2b2lkIF9faW9tZW0gKl9faW9yZW1hcCh1
bnNpZ25lZCBsb25nIHBoeXNhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUsCi0JCQl1bnNpZ25lZCBs
b25nIGNhY2hlZmxhZyk7Cit2b2lkIF9faW9tZW0gKmlvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlz
YWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsKIGV4dGVybiB2b2lkIF9faW91bm1hcCh2b2lkIF9f
aW9tZW0gKmFkZHIpOwogCi1zdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcCh1bnNp
Z25lZCBsb25nIHBoeXNhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCi17Ci0JcmV0dXJuIF9faW9y
ZW1hcChwaHlzYWRkciwgc2l6ZSwgMCk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVt
ICppb3JlbWFwX25vY2FjaGUodW5zaWduZWQgbG9uZyBwaHlzYWRkciwKLQkJCQkJCXVuc2lnbmVk
IGxvbmcgc2l6ZSkKLXsKLQlyZXR1cm4gX19pb3JlbWFwKHBoeXNhZGRyLCBzaXplLCAwKTsKLX0K
LQogc3RhdGljIGlubGluZSB2b2lkIGlvdW5tYXAodm9pZCBfX2lvbWVtICphZGRyKQogewogCV9f
aW91bm1hcChhZGRyKTsKIH0KIAotI2RlZmluZSBpb3JlbWFwX25vY2FjaGUgaW9yZW1hcF9ub2Nh
Y2hlCi0jZGVmaW5lIGlvcmVtYXBfd2MgaW9yZW1hcF9ub2NhY2hlCi0jZGVmaW5lIGlvcmVtYXBf
d3QgaW9yZW1hcF9ub2NhY2hlCisjZGVmaW5lIGlvcmVtYXBfbm9jYWNoZSBpb3JlbWFwCisjZGVm
aW5lIGlvcmVtYXBfd2MgaW9yZW1hcAorI2RlZmluZSBpb3JlbWFwX3d0IGlvcmVtYXAKIAogLyog
UGFnZXMgdG8gcGh5c2ljYWwgYWRkcmVzcy4uLiAqLwogI2RlZmluZSBwYWdlX3RvX3BoeXMocGFn
ZSkJdmlydF90b19waHlzKHBhZ2VfdG9fdmlydChwYWdlKSkKZGlmZiAtLWdpdCBhL2FyY2gvbmlv
czIvbW0vaW9yZW1hcC5jIGIvYXJjaC9uaW9zMi9tbS9pb3JlbWFwLmMKaW5kZXggM2EyODE3N2Ew
MWViLi43YTFhMjdmM2RhYTMgMTAwNjQ0Ci0tLSBhL2FyY2gvbmlvczIvbW0vaW9yZW1hcC5jCisr
KyBiL2FyY2gvbmlvczIvbW0vaW9yZW1hcC5jCkBAIC0xMTIsOCArMTEyLDcgQEAgc3RhdGljIGlu
dCByZW1hcF9hcmVhX3BhZ2VzKHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgdW5zaWduZWQgbG9uZyBw
aHlzX2FkZHIsCiAvKgogICogTWFwIHNvbWUgcGh5c2ljYWwgYWRkcmVzcyByYW5nZSBpbnRvIHRo
ZSBrZXJuZWwgYWRkcmVzcyBzcGFjZS4KICAqLwotdm9pZCBfX2lvbWVtICpfX2lvcmVtYXAodW5z
aWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKLQkJCXVuc2lnbmVkIGxv
bmcgY2FjaGVmbGFnKQordm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c19h
ZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7CiAJc3RydWN0IHZtX3N0cnVjdCAqYXJlYTsKIAl1
bnNpZ25lZCBsb25nIG9mZnNldDsKQEAgLTEzOSwxNSArMTM4LDYgQEAgdm9pZCBfX2lvbWVtICpf
X2lvcmVtYXAodW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKIAkJ
CQlyZXR1cm4gTlVMTDsKIAl9CiAKLQkvKgotCSAqIE1hcCB1bmNhY2hlZCBvYmplY3RzIGluIHRo
ZSBsb3cgcGFydCBvZiBhZGRyZXNzIHNwYWNlIHRvCi0JICogQ09ORklHX05JT1MyX0lPX1JFR0lP
Tl9CQVNFCi0JICovCi0JaWYgKElTX01BUFBBQkxFX1VOQ0FDSEVBQkxFKHBoeXNfYWRkcikgJiYK
LQkgICAgSVNfTUFQUEFCTEVfVU5DQUNIRUFCTEUobGFzdF9hZGRyKSAmJgotCSAgICAhKGNhY2hl
ZmxhZyAmIF9QQUdFX0NBQ0hFRCkpCi0JCXJldHVybiAodm9pZCBfX2lvbWVtICopKENPTkZJR19O
SU9TMl9JT19SRUdJT05fQkFTRSArIHBoeXNfYWRkcik7Ci0KIAkvKiBNYXBwaW5ncyBoYXZlIHRv
IGJlIHBhZ2UtYWxpZ25lZCAqLwogCW9mZnNldCA9IHBoeXNfYWRkciAmIH5QQUdFX01BU0s7CiAJ
cGh5c19hZGRyICY9IFBBR0VfTUFTSzsKQEAgLTE1OCwxNCArMTQ4LDEzIEBAIHZvaWQgX19pb21l
bSAqX19pb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUs
CiAJaWYgKCFhcmVhKQogCQlyZXR1cm4gTlVMTDsKIAlhZGRyID0gYXJlYS0+YWRkcjsKLQlpZiAo
cmVtYXBfYXJlYV9wYWdlcygodW5zaWduZWQgbG9uZykgYWRkciwgcGh5c19hZGRyLCBzaXplLAot
CQljYWNoZWZsYWcpKSB7CisJaWYgKHJlbWFwX2FyZWFfcGFnZXMoKHVuc2lnbmVkIGxvbmcpIGFk
ZHIsIHBoeXNfYWRkciwgc2l6ZSwgMCkpIHsKIAkJdnVubWFwKGFkZHIpOwogCQlyZXR1cm4gTlVM
TDsKIAl9CiAJcmV0dXJuICh2b2lkIF9faW9tZW0gKikgKG9mZnNldCArIChjaGFyICopYWRkcik7
CiB9Ci1FWFBPUlRfU1lNQk9MKF9faW9yZW1hcCk7CitFWFBPUlRfU1lNQk9MKGlvcmVtYXApOwog
CiAvKgogICogX19pb3VubWFwIHVubWFwcyBuZWFybHkgZXZlcnl0aGluZywgc28gYmUgY2FyZWZ1
bAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

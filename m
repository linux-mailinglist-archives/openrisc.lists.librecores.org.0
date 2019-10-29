Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C718DEAEB9
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A468820785;
	Thu, 31 Oct 2019 12:21:30 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 62A492073F
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:49:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QUtbLuIok0WzaA85KbMW98QwwqyFlzMBqi7pB6SmDJs=; b=czHwZLKuFJIPpbN3TBLzvwDue+
 DzHq8hMWsN/t3+FaZLnuCp/pDbMkFOj5t0JDzvpIJ8HEf60zOkFV+dMcnnea0P6KwqmV0mn3zcpmS
 iUiqZB8ejoOWDSoIXmC5aj+Xw3s4AtO0ylaY9QYrq6n05UPVsRJ7pujLDoUZ0WJGX3+QLdZz4bwPQ
 SkbD7uQdpIvvPvvJQ9QLIeFVX7qu5UAKi/h4WJnyVynvV6mbUl81wb4IuirgJVmKiFfoDEJbiQcjO
 UIhgDYy4AfHu1OaDM6Hg1BYTB+4uGsmnXvE0cC3ujBgsPpaeOeKF2cfOP6PaC/h3f1MvF5y84AEzR
 +tg8602w==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJz-0004FI-Vm; Tue, 29 Oct 2019 06:49:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:33 +0100
Message-Id: <20191029064834.23438-21-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:19 +0100
Subject: [OpenRISC] [PATCH 20/21] csky: remove ioremap_cache
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

Tm8gZHJpdmVyIHRoYXQgY2FuIGJlIHVzZWQgb24gY3NreSB1c2VzIGlvcmVtYXBfY2FjaGUsIGFu
ZCB0aGlzCmludGVyZmFjZSBoYXMgYmVlbiBkZXByZWNhdGVkIGluIGZhdm9yIG9mIG1lbXJlbWFw
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkFja2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL2Nza3kvaW5jbHVkZS9hc20v
aW8uaCB8IDIgLS0KIGFyY2gvY3NreS9tbS9pb3JlbWFwLmMgICAgIHwgNyAtLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L2luY2x1
ZGUvYXNtL2lvLmggYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vaW8uaAppbmRleCBhNGI5ZmI2MTZm
YWEuLmY1NzI2MDVkNWFkNSAxMDA2NDQKLS0tIGEvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL2lvLmgK
KysrIGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL2lvLmgKQEAgLTM2LDEzICszNiwxMSBAQAogLyoK
ICAqIEkvTyBtZW1vcnkgbWFwcGluZyBmdW5jdGlvbnMuCiAgKi8KLWV4dGVybiB2b2lkIF9faW9t
ZW0gKmlvcmVtYXBfY2FjaGUocGh5c19hZGRyX3QgYWRkciwgc2l6ZV90IHNpemUpOwogZXh0ZXJu
IHZvaWQgX19pb21lbSAqX19pb3JlbWFwKHBoeXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXplLCBw
Z3Byb3RfdCBwcm90KTsKIGV4dGVybiB2b2lkIGlvdW5tYXAodm9pZCAqYWRkcik7CiAKICNkZWZp
bmUgaW9yZW1hcChhZGRyLCBzaXplKQkJX19pb3JlbWFwKChhZGRyKSwgKHNpemUpLCBwZ3Byb3Rf
bm9uY2FjaGVkKFBBR0VfS0VSTkVMKSkKICNkZWZpbmUgaW9yZW1hcF93YyhhZGRyLCBzaXplKQkJ
X19pb3JlbWFwKChhZGRyKSwgKHNpemUpLCBwZ3Byb3Rfd3JpdGVjb21iaW5lKFBBR0VfS0VSTkVM
KSkKLSNkZWZpbmUgaW9yZW1hcF9jYWNoZQkJCWlvcmVtYXBfY2FjaGUKIAogI2luY2x1ZGUgPGFz
bS1nZW5lcmljL2lvLmg+CiAKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9tbS9pb3JlbWFwLmMgYi9h
cmNoL2Nza3kvbW0vaW9yZW1hcC5jCmluZGV4IGUxM2NkMzQ5NzYyOC4uYWU3ODI1NmE1NmZkIDEw
MDY0NAotLS0gYS9hcmNoL2Nza3kvbW0vaW9yZW1hcC5jCisrKyBiL2FyY2gvY3NreS9tbS9pb3Jl
bWFwLmMKQEAgLTQ0LDEzICs0NCw2IEBAIHZvaWQgX19pb21lbSAqX19pb3JlbWFwKHBoeXNfYWRk
cl90IHBoeXNfYWRkciwgc2l6ZV90IHNpemUsIHBncHJvdF90IHByb3QpCiB9CiBFWFBPUlRfU1lN
Qk9MKF9faW9yZW1hcCk7CiAKLXZvaWQgX19pb21lbSAqaW9yZW1hcF9jYWNoZShwaHlzX2FkZHJf
dCBwaHlzX2FkZHIsIHNpemVfdCBzaXplKQotewotCXJldHVybiBfX2lvcmVtYXBfY2FsbGVyKHBo
eXNfYWRkciwgc2l6ZSwgUEFHRV9LRVJORUwsCi0JCQkJX19idWlsdGluX3JldHVybl9hZGRyZXNz
KDApKTsKLX0KLUVYUE9SVF9TWU1CT0woaW9yZW1hcF9jYWNoZSk7Ci0KIHZvaWQgaW91bm1hcCh2
b2lkIF9faW9tZW0gKmFkZHIpCiB7CiAJdnVubWFwKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKWFk
ZHIgJiBQQUdFX01BU0spKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

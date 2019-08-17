Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7043C910FB
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A23BF204C1;
	Sat, 17 Aug 2019 17:02:32 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 4CA742011C
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8stPQbNrg3B/R2Xd5KO2eeuMSLol2LwoVvz90ca57Uc=; b=W0bwqZTtbBiXb6VnEfyfA9mVE
 9W9bQiZ+oFFnztrtL29HNStHhzgEzKZRwR0Y2Yt9fbTPXro2ana913j8J/x4VOrNIf7Vpp1s5xTBT
 JBBgWHNPJDHxK8YM2EH/1iy4ZFyxsqX/E8MVm9oFi7/haC79fhkUSp31sjsxo5ixN+LjUtq5YiE/H
 JgzEH6lBn4zXt6f6tZUImXk13a1mBaoeUkv03QCkMCv+JI9Ou3L3XpKNVs1qsGQXI8TQioogd4019
 +YKCAK/dGkmyOlN7PU2frQDwzB/jnJxCvAQI78eDWfALqX6NNPVPNQ7KrDd1EV17QZV7xNJeKsN2w
 pL/zibEBg==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytEw-0005B4-6B; Sat, 17 Aug 2019 07:35:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:27 +0200
Message-Id: <20190817073253.27819-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] generic ioremap (and lots of cleanups)
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

SGkgYWxsLAoKdGhlIGxhc3QgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhZGQgYSBnZW5lcmljIGlv
cmVtYXAgaW1wbGVtZW50YXRpb24sCmFuZCBzd2l0Y2ggb3VyIDMgbW9zdCByZWNlbnQgYW5kIHRo
dXMgbW9zdCB0aWR5IGFyY2hpdGV0dXJlIHBvcnRzIG92ZXIKdG8gdXNlIGl0LiAgV2l0aCBhIGxp
dHRsZSB3b3JrIGFuZCBhbiBhZGRpdGlvbmFsIGFyY2ggaG9vayBvciB0d28gdGhlCmltcGxlbWVu
dGF0aW9uIHNob3VsZCBiZSBhYmxlIHRvIGV2ZW50dWFsbHkgY292ZXIgbW9yZSB0aGFuIGhhbGYg
b2YKb3VyIHBvcnRzLgoKVGhlIHBhdGNoZXMgYmVmb3JlIHRoYXQgY2xlYW4gdXAgdmFyaW91cyBs
b3NlIGVuZHMgaW4gdGhlIGlvcmVtYXAKYW5kIGlvdW5tYXAgaW1wbGVtZW50YXRpb25zLgoKQSBn
aXQgdHJlZSBpcyBhbHNvIGF2YWlsYWJsZSBoZXJlOgoKICAgIGdpdDovL2dpdC5pbmZyYWRlYWQu
b3JnL3VzZXJzL2hjaC9taXNjLmdpdCBnZW5lcmljLWlvcmVtYXAKCkdpdHdlYjoKCiAgICBodHRw
Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVh
ZHMvZ2VuZXJpYy1pb3JlbWFwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8846B1CD2F0
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B66B7202E0;
	Mon, 11 May 2020 09:41:32 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id BB9B32077F
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NvlDCJ52IZIXq0+H620wKd1v1G0M5nfx6BSZiQRK5ug=; b=NGBT7Ze+wzfIfeJsuo6D3LAmqC
 On5LQ/nUu5GokPFEn/bHNA6QR2B2+gEbQjCs6LY5hcdxLgPp8fxWD7Acl6JMe4XEeJ0IJbGUDiJVm
 t34DtEvDzzCpX8paEM+Ww56XbmW9GTJKA/z80k/AXQtvb98GSS3x+8olOuFURNUf0tUzd3LJh0dtV
 j5hNfyP2p5c75onJXMhJj6YVCVoGRHUmoi0UsKjHlrQXKzbgCJQK0jiufR8AboGLB7MZa130wVaza
 Tndf4BDbOM+388hCDQeCerJ9pCdswbu+IL4zQ/c4LRCjUV67J70U8+soFFD1tFcI50b2wk7yMHXMN
 uq3olJHg==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgo0-0007vN-Vz; Sun, 10 May 2020 07:55:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:43 +0200
Message-Id: <20200510075510.987823-5-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 04/31] nds32: unexport flush_icache_page
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

Zmx1c2hfaWNhY2hlX3BhZ2UgaXMgb25seSB1c2VkIGJ5IG1tL21lbW9yeS5jLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9uZHMzMi9tbS9j
YWNoZWZsdXNoLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9uZHMzMi9tbS9jYWNoZWZsdXNoLmMgYi9hcmNoL25kczMyL21tL2NhY2hlZmx1
c2guYwppbmRleCAyNTQ3MDM2NTNiNmY1Li44ZjE2OGIzMzA2NWZhIDEwMDY0NAotLS0gYS9hcmNo
L25kczMyL21tL2NhY2hlZmx1c2guYworKysgYi9hcmNoL25kczMyL21tL2NhY2hlZmx1c2guYwpA
QCAtMzUsNyArMzUsNiBAQCB2b2lkIGZsdXNoX2ljYWNoZV9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSkKIAlrdW5tYXBfYXRvbWljKCh2b2lkICopa2Fk
ZHIpOwogCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KLUVYUE9SVF9TWU1CT0woZmx1c2hf
aWNhY2hlX3BhZ2UpOwogCiB2b2lkIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAkgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGFkZHIsIGludCBsZW4pCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

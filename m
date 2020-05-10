Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6E91CD308
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5794F20B75;
	Mon, 11 May 2020 09:41:48 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2FCAC20B14
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9nkBbtmLvQl1eKzV5tIp1XNxgG4m4pb8wLV/D1oxyTY=; b=O3pypQ0niCinVdaZ9ffiZU1syd
 VXGi0lby1eDfmI0p1Pobqc7orXv9Qz0NBSCrS1uuMOYGnE9nMnyWGF0kjDhDci+MQmV/6FqdNJPC8
 r6+FyNnal13r9CkvmViTOvbSPhitWD0divMHhTV1azIuuCQMmNaorsg+QS0DnOqnlWuAgmh6OrOWl
 T0CfWA1ZEjgLBvUnhU1fCyOOODZEYEWMho/6IvLujtRTOT93i/8maVPwGnsZKy/R1UrTzTSOMqIRz
 rSTKirPsEhoTM7ds36NhA4I1kvacErl7YUv4bLy5MsdM7KhxxJDUDSgBKDRExCCrcz8nKST6jvJ4/
 kuq63P0Q==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgpF-0001HQ-95; Sun, 10 May 2020 07:56:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:07 +0200
Message-Id: <20200510075510.987823-29-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 28/31] exec: use flush_icache_user_range in
 read_code
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

cmVhZF9jb2RlIG9wZXJhdGVzIG9uIHVzZXIgYWRkcmVzc2VzLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZnMvZXhlYy5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMv
ZXhlYy5jIGIvZnMvZXhlYy5jCmluZGV4IGE0Zjc2NmYyOTZmOGYuLmM1NDE4NjczMTZhNjMgMTAw
NjQ0Ci0tLSBhL2ZzL2V4ZWMuYworKysgYi9mcy9leGVjLmMKQEAgLTEwMzMsNyArMTAzMyw3IEBA
IHNzaXplX3QgcmVhZF9jb2RlKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIGFkZHIs
IGxvZmZfdCBwb3MsIHNpemVfdCBsZW4pCiB7CiAJc3NpemVfdCByZXMgPSB2ZnNfcmVhZChmaWxl
LCAodm9pZCBfX3VzZXIgKilhZGRyLCBsZW4sICZwb3MpOwogCWlmIChyZXMgPiAwKQotCQlmbHVz
aF9pY2FjaGVfcmFuZ2UoYWRkciwgYWRkciArIGxlbik7CisJCWZsdXNoX2ljYWNoZV91c2VyX3Jh
bmdlKGFkZHIsIGFkZHIgKyBsZW4pOwogCXJldHVybiByZXM7CiB9CiBFWFBPUlRfU1lNQk9MKHJl
YWRfY29kZSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

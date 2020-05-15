Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C79761E5047
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A11BC20716;
	Wed, 27 May 2020 23:19:38 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 162C520B21
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9nkBbtmLvQl1eKzV5tIp1XNxgG4m4pb8wLV/D1oxyTY=; b=PrewDot91eBJtI4CmunBQt8auz
 5Qf471gFdXaMKcMey4uvcCm1/zMSb7AxBI1tT91bJJlRm1ScK54gyxd4uAUXCbf03WqD9x+ol2NOj
 UguMrDDZudEcN4LA49bcHmbdnURGtDw3k2BGxwBkRkR12N8iephTJqGeDSHQWQjM0Ow0WcLkL4gY/
 NvIyYhsyq46MDhXpWE2O/X2e5CfxR+BoufSX/GEsGPR4xUs6W136aHYY0NicjX+NzxB21IB+GLTNj
 zSG37nkB1058MbJlOxd8otsj2ePnMSqxje3+vd1BrLDKVnhnA+TDiS4ToD8fPt86HMsp5w6cR7CE2
 3eV0aDWg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTT-0005Dh-3V; Fri, 15 May 2020 14:38:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:43 +0200
Message-Id: <20200515143646.3857579-27-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 26/29] exec: use flush_icache_user_range in
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

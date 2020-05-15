Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 08E7D1E5019
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:08 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8A3A120C8D;
	Wed, 27 May 2020 23:19:05 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 93C3A20B0D
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z9YRs5dLpbvo98tj/Cgt22OOiGK6aHhMzE6epEWfQXc=; b=ZlhQE/DX4CKjdZl8xexqucGXRW
 ecW0xdoSIe9Gq35tRpeBiirXpnuIuOEEr39MdMGz1PdURhzPLiTO5wahIkK5vw1PmAPLFD99ZDzpT
 KfzkqvYyTU9LhznNbxGajjy8tQzBZAfMQC8HJfqoH5Sirl+L4HEisHonX50JZQe8vvMnXzsqw+8nd
 n6IBEp27INvtNKjvuFTjxPOaCyavRVTpfVxqewr8imN9jFg90CqXRttj3krRvgExHWVSdjYWekCmo
 h0GSVtWiDytYP4TT9HxbBtbdWa/cwt6vJMcpLMC4v/k/iown67sSCkP/8V0MX4v+5BPt/UyLUKy9X
 x8dhpzzg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSK-0003qc-Oh; Fri, 15 May 2020 14:36:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:20 +0200
Message-Id: <20200515143646.3857579-4-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 03/29] powerpc: unexport flush_icache_user_range
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

Zmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgaXMgb25seSB1c2VkIGJ5IGNvcHlfdG9fdXNlcl9wYWdl
LCB3aGljaCBpcwpvbmx5IHVzZWQgYnkgY29yZSBWTSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9wb3dlcnBjL21tL21lbS5jIHwg
MSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9tbS9tZW0uYyBiL2FyY2gvcG93ZXJwYy9tbS9tZW0uYwppbmRleCAwNDFlZDdjZmQzNDFh
Li5mMGQxYmYwYThlMTRmIDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMvbW0vbWVtLmMKKysrIGIv
YXJjaC9wb3dlcnBjL21tL21lbS5jCkBAIC01ODcsNyArNTg3LDYgQEAgdm9pZCBmbHVzaF9pY2Fj
aGVfdXNlcl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IHBhZ2UgKnBh
Z2UsCiAJZmx1c2hfaWNhY2hlX3JhbmdlKG1hZGRyLCBtYWRkciArIGxlbik7CiAJa3VubWFwKHBh
Z2UpOwogfQotRVhQT1JUX1NZTUJPTChmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSk7CiAKIC8qCiAg
KiBTeXN0ZW0gbWVtb3J5IHNob3VsZCBub3QgYmUgaW4gL3Byb2MvaW9tZW0gYnV0IHZhcmlvdXMg
dG9vbHMgZXhwZWN0IGl0Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 886451E503D
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F3D0220C57;
	Wed, 27 May 2020 23:19:32 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 13C2D20B36
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Va/n37rYCuAAoV36whN9eOvE6XYTvehBkXPYj8DvT9g=; b=ctWuRQSQm8rS/ZgMZ0waqIECcz
 aFIM/BWNyMXjvOASfkTGUZOo6vMNbIwK9xYckekBpkm3A/WN6dWsznkOdAfPKu5MpxX285thggSXZ
 CsTaCfCkUqAdKTUoEYv32Cy32lIFjbbKW2lO0V2Dhchc5ceEMRlgo1jG1tsyfNC729JaUejlDZpaH
 dlKt45tjqS89b923xQbaQxHvlWs9q+1IKM7MoVW6tAML+3s8yN/8R18JS9PVQVE1NBtM+lPo5iSN8
 cAPzk2JeV/EHyVwCHFALPhsDk6Mm5DErMd1YkCE3nJTAGCOFOYTr48WcyBKorP6855AyDpzT5xW6d
 CqToPm5g==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbT9-0004uR-Ln; Fri, 15 May 2020 14:37:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:37 +0200
Message-Id: <20200515143646.3857579-21-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 20/29] asm-generic: add a flush_icache_user_range
 stub
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

RGVmaW5lIGZsdXNoX2ljYWNoZV91c2VyX3JhbmdlIHRvIGZsdXNoX2ljYWNoZV9yYW5nZSB1bmxl
c3MgdGhlCmFyY2hpdGVjdHVyZSBwcm92aWRlcyBpdHMgb3duIGltcGxlbWVudGF0aW9uLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogaW5jbHVkZS9h
c20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBi
L2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oCmluZGV4IDJjOTY4NmZlZmI3MTUuLjkw
N2ZhNWQxNjQ5NDQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5o
CisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oCkBAIC02Niw2ICs2NiwxMCBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfaWNhY2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGxvbmcgZW5kKQogfQogI2VuZGlmCiAKKyNpZm5kZWYgZmx1c2hfaWNhY2hl
X3VzZXJfcmFuZ2UKKyNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZmx1c2hfaWNhY2hl
X3JhbmdlCisjZW5kaWYKKwogI2lmbmRlZiBmbHVzaF9pY2FjaGVfcGFnZQogc3RhdGljIGlubGlu
ZSB2b2lkIGZsdXNoX2ljYWNoZV9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQkJ
CSAgICAgc3RydWN0IHBhZ2UgKnBhZ2UpCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

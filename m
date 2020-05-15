Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA0801E5042
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A7ED6206DB;
	Wed, 27 May 2020 23:19:36 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 9980F20B15
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=h1wlmdmJ+SbuSyPJIzXhJQXOtYNYFSmh0yN4ZKBWMKk=; b=TsGexzF/nBSKTeflCmpQ7AM4lm
 3rIWZhkNiNpD8zko+UnbPo36Q6AVQROVGASj/lvKEOW6IY1yk9f/910KXuFJvq9j+zPbZLbYT/rjl
 wi1ZDyBhGfiDLEM2Is94DjD4a6apJDf29da3H1V4xcjl2uLy4VjgF6m8WCld4tim0ySKehc1OkPzf
 FymVvkCowrgY7dvvZk78b3wp8ziIDE9/qHz8Muwp/AYRrY9e8NkVRHuwL0lgt1sDw2VBGPgAYC/ND
 mGKzwvLuw7SC9/RZH8Y/MkwOdPKc83jLEY41mrr4d4DPQ7YfEyYOsGTZuW6GNuyv5G+yK8PIwSTZC
 +WGIjX3w==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTH-00051q-JH; Fri, 15 May 2020 14:37:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:39 +0200
Message-Id: <20200515143646.3857579-23-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 22/29] xtensa: implement flush_icache_user_range
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

VGhlIFh0ZW5zYSBpbXBsZW1lbnRhdGlvbiBvZiBmbHVzaF9pY2FjaGVfcmFuZ2Ugc2VlbXMgdG8g
YmUgYWJsZSB0bwpjb3BlIHdpdGggdXNlciBhZGRyZXNzZXMuICBKdXN0IGRlZmluZSBmbHVzaF9p
Y2FjaGVfdXNlcl9yYW5nZSB0bwpmbHVzaF9pY2FjaGVfcmFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL3h0ZW5zYS9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC94dGVuc2EvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIGIvYXJjaC94
dGVuc2EvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IGEwZDUwYmU1YThjYjEuLjQ2MGU2
NjZhZDA3NjEgMTAwNjQ0Ci0tLSBhL2FyY2gveHRlbnNhL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2gu
aAorKysgYi9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKQEAgLTEwNyw2ICsx
MDcsOCBAQCB2b2lkIGZsdXNoX2NhY2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0KiwKICNk
ZWZpbmUgZmx1c2hfY2FjaGVfcGFnZSAgbG9jYWxfZmx1c2hfY2FjaGVfcGFnZQogI2VuZGlmCiAK
KyNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZmx1c2hfaWNhY2hlX3JhbmdlCisKICNk
ZWZpbmUgbG9jYWxfZmx1c2hfY2FjaGVfYWxsKCkJCQkJCQlcCiAJZG8gewkJCQkJCQkJXAogCQlf
X2ZsdXNoX2ludmFsaWRhdGVfZGNhY2hlX2FsbCgpOwkJCVwKLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

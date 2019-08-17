Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 22A0B91109
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD16C2048F;
	Sat, 17 Aug 2019 17:02:39 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id EEC4E2048E
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZolXZ8rsFjWco4y65Dq8e+uQ+IuvsnlR3mkrv/NJUNM=; b=AicmUXf2eapzVk0zNVPGokBsgG
 FYwHxPxzAL8QeC1bSni7jPrXYJh0A/CHkRADOQhZiOon5jy3SYJxKfVH56jFpFt9oXWiKLdQZGnAc
 ZzsLXUN0WCNSqSRm55iye5+EYMeFx3+PRUVht/l+pMeu8jNt8ltIrNyH3zinVAtJWokdyVwcwxhdJ
 e12HOQFMFzZLrgMUEmCVM77TGclG4/Fe+aWXtO+EhVKHlGDk+o8jPy61/1xhUTf34Dux5YAqa1fee
 suv69UzrZIucK7rYSSPf+uAkjQIEBLvedoBpF/DQ7UW7/WkJgfDBG75WxvZMXy+5yhVBY3Cw2r9e2
 +lMbt/eQ==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSH-00059n-FF; Sat, 17 Aug 2019 07:48:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:41 +0200
Message-Id: <20190817073253.27819-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 14/26] asm-generic: don't provide __ioremap
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

X19pb3JlbWFwIGlzIG5vdCBhIGtlcm5lbCBBUEksIGJ1dCB1c2VkIGZvciBoZWxwZXJzIHdpdGgg
ZGlmZmVyaW5nCnNlbWFudGljcyBpbiBhcmNoIGNvZGUuICBXZSBzaG91bGQgbm90IHByb3ZpZGUg
aXQgaW4gYXMtZ2VuZXJpYy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPgotLS0KIGluY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaCB8IDkgLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5l
cmljL2lvLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKaW5kZXggYjgzZTI4MDJjOTY5Li5k
MDI4MDY1MTM2NzAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvaW8uaAorKysgYi9p
bmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKQEAgLTk2MywxNSArOTYzLDYgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIF9faW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSkK
IH0KICNlbmRpZgogCi0jaWZuZGVmIF9faW9yZW1hcAotI2RlZmluZSBfX2lvcmVtYXAgX19pb3Jl
bWFwCi1zdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqX19pb3JlbWFwKHBoeXNfYWRkcl90IG9m
ZnNldCwgc2l6ZV90IHNpemUsCi0JCQkJICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKLXsKLQly
ZXR1cm4gaW9yZW1hcChvZmZzZXQsIHNpemUpOwotfQotI2VuZGlmCi0KICNpZm5kZWYgaW91bm1h
cAogI2RlZmluZSBpb3VubWFwIGlvdW5tYXAKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

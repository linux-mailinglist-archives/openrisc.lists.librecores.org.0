Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD9E91104
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 27450203AB;
	Sat, 17 Aug 2019 17:02:35 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 7F2532042B
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mY7k88LdHSyLOjPzk/T6g8ct/OJWddzbOrfk0liZR+I=; b=XHFasxajBzEOduBGF2F4Hh+9po
 ANe8eJKc+3gqN4ZnGqlV9LbyZTnJ3W6boG+fyAyMSbGYf1tLuOGZPVTJnn7aZpyz8nixWF9BWBV8+
 qh7I2lllbyz5piJAdAKGpf8YOXlWV0OufY88ET0ooeCJKAr2vqY1G7gShmI7WNzattGtm6ypMhSUd
 ltoQRjch9aLls67klHNxxU7QlRGIaFXnzpdZBl+W1IcbS0rKbObi5HqhC045NMGAPEJusiWSwwWnT
 oAnJkbL3zHrG6Qa4fBSb5bLuLHGo40FUXIgEcbZs/rZz1vtNYOmRj5aXrqw3rx35Yk+nU3QUX60R1
 yRZfJrUQ==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytRz-0004t1-Sm; Sat, 17 Aug 2019 07:48:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:36 +0200
Message-Id: <20190817073253.27819-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 09/26] alpha: remove the unused __ioremap wrapper
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

Tm8gbmVlZCBmb3IgdGhlIGFkZGl0aW9uYWwgbmFtZXNwYWNlIHBvbGx1dGlvbi4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvYWxwaGEvaW5j
bHVkZS9hc20vaW8uaCB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvYXNtL2lvLmggYi9hcmNoL2FscGhhL2lu
Y2x1ZGUvYXNtL2lvLmgKaW5kZXggYWYyYzAwNjNkYzc1Li4xOTg5Yjk0NmEyOGQgMTAwNjQ0Ci0t
LSBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vaW8uaAorKysgYi9hcmNoL2FscGhhL2luY2x1ZGUv
YXNtL2lvLmgKQEAgLTI4MywxMiArMjgzLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0g
KmlvcmVtYXAodW5zaWduZWQgbG9uZyBwb3J0LCB1bnNpZ25lZCBsb25nIHNpemUpCiAJcmV0dXJu
IElPX0NPTkNBVChfX0lPX1BSRUZJWCxpb3JlbWFwKSAocG9ydCwgc2l6ZSk7CiB9CiAKLXN0YXRp
YyBpbmxpbmUgdm9pZCBfX2lvbWVtICpfX2lvcmVtYXAodW5zaWduZWQgbG9uZyBwb3J0LCB1bnNp
Z25lZCBsb25nIHNpemUsCi0JCQkJICAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKLXsKLQlyZXR1
cm4gaW9yZW1hcChwb3J0LCBzaXplKTsKLX0KLQogc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0g
KiBpb3JlbWFwX25vY2FjaGUodW5zaWduZWQgbG9uZyBvZmZzZXQsCiAJCQkJCSAgICAgdW5zaWdu
ZWQgbG9uZyBzaXplKQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7D5F740F
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:41 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 28619207E1;
	Mon, 11 Nov 2019 13:37:41 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 171F1205FA
 for <openrisc@lists.librecores.org>; Thu,  7 Nov 2019 18:40:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dLNx8yX02Kzj1oRWP3mQD5vnGq79lBQ8cwVKhpycAZU=; b=cIm6jVZ03X0FF3ZUZEVUBNxG2
 TzFrLwgk9odu/08Us6Nlkwas9WZ15XFdpPT2mAfyh3/Q3/Jfr87m38La8EyX3BRe/M5B+OsKGdj78
 bLUUAIvM0bNRoeNsydjx3SfAzM8kAGyt4E78aHVnQkSQwU3ifXbxIotnL525AOyqb3r2IXzsDv0K5
 DgvUNXavRIyemwxa8KPa9J6lWpHc9hTtoDxV+ZQrBpoU5JEDCWfOy4WXKCChV1Xw2SXz+QHiTWoLC
 i6PvhObHRRkUQS7SizmzKHusOkrT5aoQyK6Winw83d4cMSqk05qzHLFHvvtU3ShbRr5DoB3Q9XZhg
 sk/4vf4xw==;
Received: from [2001:4bb8:184:e48:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSllt-0002NX-Tu; Thu, 07 Nov 2019 17:40:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Thu,  7 Nov 2019 18:40:33 +0100
Message-Id: <20191107174035.13783-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: [OpenRISC] provide in-place uncached remapping for dma-direct
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgYWxsLAoKdGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcmVtYXBwaW5nIHBsYWNl
cyB1bmNhY2hlZCBpbi1wbGFjZSBpbgp0aGUgZ2VuZXJpYyBkbWEtZGlyZWN0IGNvZGUsIGFuZCBt
b3ZlcyBvcGVucmlzYyBvdmVyIGZyb20gaXRzIG93bgppbi1wbGFjZSByZW1hcHBpbmcgc2NoZW1l
LiAgVGhlIGFybTY0IGZvbGtzIGFsc28gaGFkIGludGVyZXN0IGluIHN1Y2gKYSBzY2hlbWUgdG8g
YXZvaWQgcHJvYmxlbXMgd2l0aCBzcGVjdWxhdGluZyBpbnRvIGNhY2hlIGFsaWFzZXMuCgpBbHNv
IGFsbCBhcmNoaXRlY3R1cmVzIHRoYXQgYWx3YXlzIHVzZSBzbWFsbCBwYWdlIG1hcHBpbmdzIGZv
ciB0aGUKa2VybmVsIGFuZCBoYXZlIG5vbi1jb2hlcmVudCBETUEgc2hvdWxkIGxvb2sgaW50byBl
bmFibGluZyB0aGlzCnNjaGVtZSwgYXMgaXQgaXMgbXVjaCBtb3JlIGVmZmljaWVudCB0aGFuIHRo
ZSB2bWFwIHJlbWFwcGluZy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

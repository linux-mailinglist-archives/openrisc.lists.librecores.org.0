Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 02B8F171762
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3B3DD209C2;
	Thu, 27 Feb 2020 13:35:33 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 1CBC0206AB
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 20:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Gm+CZDA4foMEAz/S+YdRBY9FpP1n0eNdAAovqDbFGNg=; b=kOdWiO2RLPJPCA0ELRlD0fILnT
 Hi17mnHqCr3opBFn3tuitDQ9PxTd5CxA8RrpffuZlpZUQUuTCUbA/BMJ/yAzkokW5xwqVmVQl6DEo
 Hi0W2vxjbyZnTDPXfH7Ijkrysfk6fHLOAzCzJ3e88xupPe+U0VuVbftERt+dg39KCPM8wZZAxckFC
 9KFd7o9hjEIGnP0u6hKYx5GMF3xVd8rv/AS2KPITioAVtYya/wB/YIzTZX0VXITAt1pqDLfdSzekD
 SVtd+sn9CvtDhaY+TIbSPFpU1aQ52j6ym6jqrKZn1g3k+cLllQ2KdXym3e1aIJ/lbzDZw43sVXMFV
 13FNIrsA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Jeo-0006X6-W0; Mon, 24 Feb 2020 19:44:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Mon, 24 Feb 2020 11:44:40 -0800
Message-Id: <20200224194446.690816-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] provide in-place uncached remapping for dma-direct v2
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
ZSB2bWFwIHJlbWFwcGluZy4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIHNoYXJlIHRoZSBhcmNoIGhv
b2sgZm9yIGlubGluZSByZW1hcCBhbmQgdW5jYWNoZWQgc2VnbWVudCBzdXBwb3J0Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

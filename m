Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 820D8171759
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3E8B8209C3;
	Thu, 27 Feb 2020 13:35:28 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 69B6E207EE
 for <openrisc@lists.librecores.org>; Thu, 20 Feb 2020 18:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dLNx8yX02Kzj1oRWP3mQD5vnGq79lBQ8cwVKhpycAZU=; b=uSibnpG4et9iRS/SQKSZvPJsfe
 BNFYB6zM8VxBcUm+5sWKKTywGlUovha7UjiuM6nmUPPtjn97te4EUKaR7o8HMOhU8KQNJSIkj73x4
 hA6CyflXuURlc7KE+Fl9Zmm2pHBliqPY/WIuZpukZjf9cziZ3V5j1TgeZ0uv2MK5na+1VgxBd9ccm
 hXqSYX1MVuq1qT/edFquvfjDnXFvAl8F+TEXDuLz/UHYbJnK1Frlt3UDyuy485gpeeH9doY8Z33+W
 QgS1wyszKEEpVdZ7LTw6mCYUBwEePrRmT5dQSFSOlwxjIjoMPTNO0M7pOpbfZuFLEPLt8ekGXtL/G
 v6wEkOQw==;
Received: from [38.126.112.138] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4pCl-0000Dh-7w; Thu, 20 Feb 2020 17:01:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Thu, 20 Feb 2020 09:01:37 -0800
Message-Id: <20200220170139.387354-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] provide in-place uncached remapping for dma-direct
 (resend)
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

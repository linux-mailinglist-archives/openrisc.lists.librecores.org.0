Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A50B8171768
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5AAF920999;
	Thu, 27 Feb 2020 13:35:37 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 9B43A2091B
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 22:56:59 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C9FFA68B05; Mon, 24 Feb 2020 22:56:57 +0100 (CET)
Date: Mon, 24 Feb 2020 22:56:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20200224215657.GA12618@lst.de>
References: <20200224194446.690816-1-hch@lst.de>
 <20200224194446.690816-5-hch@lst.de>
 <20200224215327.GB11565@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224215327.GB11565@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 4/5] dma-direct: provide a
 arch_dma_clear_uncached hook
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
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMDE6NTM6MjhQTSAtMDgwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+ID4gKwllbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19ETUFfQ0xFQVJfVU5D
QUNIRUQpKQo+ID4gKwkJYXJjaF9kbWFfY2xlYXJfdW5jYWNoZWQoY3B1X2FkZHIsIHNpemUpOwo+
IAo+IElzbid0IHVzaW5nIGFyY2hfZG1hX2NsZWFyX3VuY2FjaGVkKCkgYmVmb3JlIHBhdGNoIDUg
Z29pbmcgdG8gYnJlYWsKPiBiaXNlY3RhYmlsaXR5PwoKT25seSBpZiBBUkNIX0hBU19ETUFfQ0xF
QVJfVU5DQUNIRUQgaXMgc2VsZWN0ZWQgYnkgYW55dGhpbmcsIHdoaWNoCm9ubHkgaGFwcGVucyBp
biBwYXRjaCA1LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7939E171766
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 43413209C9;
	Thu, 27 Feb 2020 13:35:36 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 319322092F
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 20:45:32 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E85268B05; Mon, 24 Feb 2020 20:45:29 +0100 (CET)
Date: Mon, 24 Feb 2020 20:45:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200224194528.GA10155@lst.de>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-3-hch@lst.de>
 <20200221221447.GA7926@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221221447.GA7926@lianli.shorne-pla.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 2/2] openrisc: use the generic in-place
 uncached DMA allocator
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
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBGZWIgMjIsIDIwMjAgYXQgMDc6MTQ6NDdBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDk6MDE6MzlBTSAtMDgwMCwgQ2hyaXN0
b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBTd2l0Y2ggb3BlbnJpc2MgdG8gdXNlIHRoZSBkbWEtZGly
ZWN0IGFsbG9jYXRvciBhbmQganVzdCBwcm92aWRlIHRoZQo+ID4gaG9va3MgZm9yIHNldHRpbmcg
bWVtb3J5IHVuY2FjaGVkIG9yIGNhY2hlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gCj4gUmV2aWV3ZWQtYnk6IFN0YWZmb3JkIEhvcm5l
IDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IEFsc28sIEkgdGVzdCBib290ZWQgb3BlbnJpc2Mgd2l0
aCBsaW51eCA1LjUgKyB0aGVzZSBwYXRjaGVzLiAgVGhhbmtzIGZvcgo+IGNvbnRpbnVpbmcgdG8g
c2hyaW5rIG15IGNvZGUgYmFzZS4KCkkganVzdCByZXNlbnQgYSBuZXcgdmVyc2lvbiB0aGF0IGNo
YW5nZXMgaG93IHRoZSBob29rcyB3b3JrIGJhc2VkIG9uCmZlZWRiYWNrIGZyb20gUm9iaW4uICBF
dmVyeXRoaW5nIHNob3VsZCB3b3JrIGFzLWlzLCBidXQgaWYgeW91IGhhdmUKc29tZSB0aW1lIHRv
IHJldGVzdCB0aGF0IHdvdWxkIGJlIGdyZWF0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

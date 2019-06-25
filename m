Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C6B575592F
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0AB120311;
	Tue, 25 Jun 2019 22:41:53 +0200 (CEST)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id ECF9020116
 for <openrisc@lists.librecores.org>; Tue, 25 Jun 2019 14:28:38 +0200 (CEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 02DC568B05; Tue, 25 Jun 2019 14:28:09 +0200 (CEST)
Date: Tue, 25 Jun 2019 14:28:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Helge Deller <deller@gmx.de>
Message-ID: <20190625122808.GB4421@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-6-hch@lst.de>
 <3eb32e0b-5aa4-fe1e-e581-038750e11cef@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3eb32e0b-5aa4-fe1e-e581-038750e11cef@gmx.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 5/7] dma-direct: handle
 DMA_ATTR_NON_CONSISTENT in common code
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
Cc: Jonas Bonn <jonas@southpole.se>, Vladimir Murzin <vladimir.murzin@arm.com>,
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, linux-snps-arc@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDI6MjM6NDVQTSArMDIwMCwgSGVsZ2UgRGVsbGVyIHdy
b3RlOgo+IE9uIDE0LjA2LjE5IDE2OjQ0LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+IE9u
bHkgY2FsbCBpbnRvIGFyY2hfZG1hX2FsbG9jIGlmIHdlIHJlcXVpcmUgYW4gdW5jYWNoZWQgbWFw
cGluZywKPiA+IGFuZCByZW1vdmUgdGhlIHBhcmlzYyBjb2RlIG1hbnVhbGx5IGRvaW5nIG5vcm1h
bCBjYWNoZWQKPiA+IERNQV9BVFRSX05PTl9DT05TSVNURU5UIGFsbG9jYXRpb25zLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IEFja2Vk
LWJ5OiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+ICMgcGFyaXNjCj4gCj4gQm9vdC10ZXN0
ZWQgMzItYml0IGtlcm5lbCBvbiBQQ1gtTCBhbmQgUENYLVcyIG1hY2hpbmVzIChhbHRob3VnaAo+
IHRoZSBwYXRjaGVzIGRvbid0IGNsZWFubHkgYXBwbHkgYW55IGxvbmdlciBhZ2FpbnN0IGdpdCBo
ZWFkKS4KClRoZSBzZXJpZXMgd2FzIGFnYWluc3QgdGhlIGRtYS1tYXBwaW5nIHRyZWUsIHdoaWNo
IG1pZ2h0IGhhdmUgZGl2ZXJnZWQKYSBiaXQgYWxyZWFkeS4KClRoYW5rcyBmb3IgdGVzdGluZyEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

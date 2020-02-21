Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 89EBC17175D
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6EDBB2097C;
	Thu, 27 Feb 2020 13:35:29 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 81678208C3
 for <openrisc@lists.librecores.org>; Fri, 21 Feb 2020 15:16:59 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 36BC968BFE; Fri, 21 Feb 2020 15:16:57 +0100 (CET)
Date: Fri, 21 Feb 2020 15:16:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200221141656.GF6968@lst.de>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-2-hch@lst.de>
 <502fa745-ddad-f91b-52bc-52edecf8fdbc@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <502fa745-ddad-f91b-52bc-52edecf8fdbc@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH 1/2] dma-mapping: support setting memory
 uncached in place
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, linux-arch@vger.kernel.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDU6MjE6MzVQTSArMDAwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+PiBAQCAtMTk2LDEwICsxOTIsMTUgQEAgdm9pZCAqZG1hX2RpcmVjdF9hbGxvY19wYWdl
cyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHNpemVfdCBzaXplLAo+PiAgICAgCW1lbXNldChyZXQsIDAs
IHNpemUpOwo+PiAgIC0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1VOQ0FDSEVEX1NF
R01FTlQpICYmCj4+IC0JICAgIGRtYV9hbGxvY19uZWVkX3VuY2FjaGVkKGRldiwgYXR0cnMpKSB7
Cj4+ICsJaWYgKGRtYV9hbGxvY19uZWVkX3VuY2FjaGVkKGRldiwgYXR0cnMpKSB7Cj4+ICAgCQlh
cmNoX2RtYV9wcmVwX2NvaGVyZW50KHBhZ2UsIHNpemUpOwo+PiAtCQlyZXQgPSB1bmNhY2hlZF9r
ZXJuZWxfYWRkcmVzcyhyZXQpOwo+PiArCj4+ICsJCWlmIChJU19FTkFCTEVEKENPTkZJR19BUkNI
X0hBU19ETUFfU0VUX1VOQ0FDSEVEKSkgewo+PiArCQkJaWYgKCFhcmNoX2RtYV9zZXRfdW5jYWNo
ZWQocmV0LCBzaXplKSkKPj4gKwkJCQlnb3RvIG91dF9mcmVlX3BhZ2VzOwo+PiArCQl9IGVsc2Ug
aWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfSEFTX1VOQ0FDSEVEX1NFR01FTlQpKSB7Cj4+ICsJ
CQlyZXQgPSB1bmNhY2hlZF9rZXJuZWxfYWRkcmVzcyhyZXQpOwo+Cj4gSG1tLCB3b3VsZCB3ZSBh
Y3R1YWxseSBuZWVkIHRvIGtlZXAgQVJDSF9IQVNfVU5DQUNIRURfU0VHTUVOVD8gSWYgCj4gYXJj
aF9kbWFfc2V0X3VuY2FjaGVkKCkgcmV0dXJuZWQgdm9pZCovRVJSX1BUUiBpbnN0ZWFkLCB0aGVu
IGl0IGNvdWxkIHdvcmsgCj4gZm9yIGJvdGggY2FzZXMgKHdpdGggYXJjaF9kbWFfY2xlYXJfdW5j
YWNoZWQoKSBiZWluZyBhIG5vLW9wIGZvciBzZWdtZW50cykuCgpZZXMsIEkgdGhpbmsgc28uICBJ
IHdhcyBhIGxpdHRsZSB3b3JyaWVkIGFib3V0IHdoYXQgdG8gZG8gd2l0aApjYWNoZWRfa2VybmVs
X2FkZHJlc3MoKSBpbiB0aGF0IHNjaGVtZSwgYnV0IGl0IHR1cm5zIG91dCB3aXRoIHRoZSByZWNl
bnQKcm91bmQgb2YgZG1hLWRpcmVjdCBjbGVhbnVwIHRoYXQgaXMgYWN0dWFsbHkgZW50aXJlbHkg
dW51c2VkIG5vdy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

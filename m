Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 04D635592C
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BC70920308;
	Tue, 25 Jun 2019 22:41:52 +0200 (CEST)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 73A7A200FC
 for <openrisc@lists.librecores.org>; Tue, 25 Jun 2019 08:11:35 +0200 (CEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 413AB68B02; Tue, 25 Jun 2019 08:11:04 +0200 (CEST)
Date: Tue, 25 Jun 2019 08:11:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Message-ID: <20190625061104.GB28986@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614144431.21760-6-hch@lst.de>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-xtensa@linux-xtensa.org,
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, linux-snps-arc@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBKdW4gMTYsIDIwMTkgYXQgMDY6MDg6NDBQTSArMDgwMCwgSGlsbGYgRGFudG9uIHdy
b3RlOgo+IExpdGVyYWxseSwgYW55IGNwdSAoY2FsbCBpdCBjcHVXKSBvdGhlciB0aGFuIHBjeDEy
IGFuZCBwY3gxIHdpbGwgbm8gbG9uZ2VyIGRvCj4gZG1hIGFsbG9jIGZvciBhbnkgZGV2aWNlIHdp
dGggdGhpcyBwYXRjaCBhcHBsaWVkLgoKWWVzLiAgQW5kIHRoYXQgaXMgbm90IGEgY2hhbmNlIGZy
b20gdGhlIHByZXZpb3VzIGNvZGUsIHdoZXJlIG9ubHkKcGN4MSBhbmQgcGN4MTIgY291bGQgZG8g
Y29oZXJlbnQgYWxsb2NhdGlvbnMsCgo+IE9uIHRoZSBvdGhlciBoYW5kLCAKPiAhZGV2X2lzX2Rt
YV9jb2hlcmVudChkZXYpICYmICEoYXR0cnMgJiBETUFfQVRUUl9OT05fQ09OU0lTVEVOVCkgd2ls
bCBhc2sKPiBhbnkgY3B1IHRvIGRvIGRtYSBhbGxvYywgcmVnYXJkbGVzcyBvZiBwY3gxLiBUaGlz
IHBhdGNoIHdvcmtzIGltbyB1bmxlc3MgY3B1Vwo+IHBsYXlzIGdhbWVzIG9ubHkgd2l0aCBkZXZp
Y2VzIHRoYXQgYXJlIGRtYSBjb2hlcmVudC4gSSBkb3VidCBpdCBpcyB0cnVlLgoKSSBjYW4ndCBw
YXJzZSB0aGVzZSB0d28gc2VudGVuY2VzLiAgQnV0IHRvIGV4cGxhaW5zIHRoZSBiaXRzIG1lbnRp
b25lZApoZXJlIC0gZGV2X2lzX2RtYV9jb2hlcmVudCB3aWxsIHJldHVybiBpZiBhIGRldmljZSBp
cyBjb2hlcmVudGx5CmF0dGFjaGVkIHZzIHRoZSBjcHUuICBUaGlzIHdpbGwgbmV2ZXIgYmUgdHJ1
ZSBmb3IgdGhlIHBhcmlzYyBkaXJlY3QKbWFwcGluZy4gIERNQV9BVFRSX05PTl9DT05TSVNURU5U
IGFza3MgZm9yIGEgbm9uLWNvaGVyZW50IG1hcHBpbmcgdGhhdApuZWVkcyB0byBiZSBleHBsaWNp
dGx5IHN5bmNlZC4gIFRoaXMgc3VwcG9ydCBub3cgaXMgaW4gdGhlIGRtYS1kaXJlY3QKY29yZSBj
b2RlLCBhbmQgdGhpcyBpcyB3aGF0IHRoZSBwYXJpc2Mgc3BlY2lmaWMgZGV2aWNlcyB1c2VkIG9u
IHRoZQpub24tcGN4bCBzeXN0ZW1zIHVzZSwgYXMgdGhleSBkbyBub3Qgc3VwcG9ydCBkbWEgY29o
ZXJlbmN5IGF0IGFsbC4KKHRoZSBzdG9yeSBzbGlnaHRseSBjaGFuZ2VzIHdoZW4gdXNpbmcgYW4g
aW9tbXUsIGJ1dCB0aGF0IGlzIGlycmVsZXZhbnQKaGVyZSkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK

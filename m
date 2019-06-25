Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBD75592D
	for <lists+openrisc@lfdr.de>; Tue, 25 Jun 2019 22:41:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1C0E42030A;
	Tue, 25 Jun 2019 22:41:53 +0200 (CEST)
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 0A044202DA
 for <openrisc@lists.librecores.org>; Tue, 25 Jun 2019 08:14:03 +0200 (CEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 4350A68B02; Tue, 25 Jun 2019 08:13:32 +0200 (CEST)
Date: Tue, 25 Jun 2019 08:13:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <20190625061332.GC28986@lst.de>
References: <20190614144431.21760-1-hch@lst.de>
 <20190614144431.21760-2-hch@lst.de>
 <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a017e704-c6c4-7718-7f8b-eb8a0eced14d@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 25 Jun 2019 22:41:44 +0200
Subject: Re: [OpenRISC] [PATCH 1/7] arm-nommu: remove the partial
 DMA_ATTR_NON_CONSISTENT support
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
 linux-parisc@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-snps-arc@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMDM6MjM6MDhQTSArMDEwMCwgVmxhZGltaXIgTXVyemlu
IHdyb3RlOgo+IE9uIDYvMTQvMTkgMzo0NCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4g
PiBUaGUgYXJtLW5vbW11IERNQSBjb2RlIHN1cHBvcnRzIERNQV9BVFRSX05PTl9DT05TSVNURU5U
IGFsbG9jYXRpb25zLCBidXQKPiA+IGRvZXMgbm90IHByb3ZpZGUgYSBjYWNoZV9zeW5jIG9wZXJh
dGlvbi4gIFRoaXMgbWVhbnMgYW55IHVzZXIgb2YgaXQKPiA+IHdpbGwgbmV2ZXIgYmUgYWJsZSB0
byBhY3R1YWxseSB0cmFuc2ZlciBjYWNoZSBvd25lcnNoaXAgYW5kIHRodXMgY2F1c2UKPiA+IGNv
aGVyZW5jeSBidWdzLgo+IAo+IEJ5IHRoZSB3YXksIERvY3VtZW50YXRpb24vRE1BLWF0dHJpYnV0
ZXMudHh0IGRvZXNuJ3Qgc3BlY2lmeSBjYWNoZV9zeW5jKCkgYXMKPiByZXF1aXJlbWVudCBmb3Ig
RE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQgaXQgb25seSBzdGF0ZXMgdGhhdCBpdCBpcyByZXNwb25z
aWJpbGl0eQo+IG9mIHRoZSBkcml2ZXIgdG8gaGF2ZSBhbGwgdGhlIGNvcnJlY3QgYW5kIG5lY2Vz
c2FyeSBzeW5jIHBvaW50cy4KClRydWUuICBkbWFfY2FjaGVfc3luYyBoYXMgYWx3YXlzIGJlZW4g
YSByYXRoZXIgb2RkIGludGVyZmFjZSwgYXMgaXQKZG9lc24ndCBzcGVjaWZ5IGluIHdoYXQgZGly
ZWN0aW9uIHdlIG5lZWQgdG8gc3luYyBhbmQgZG9lc24ndApwYXJ0aWNpcGF0ZSBpbiBvdXIgb3du
ZXJzaGlwIHByb3RvY29sLiAgU28gbXkgbWlkLXRlcm0gcGxhbiBpcyB0byBraWxsCml0IG9mZiBh
bmQgcmVwbGFjZSBpdCB3aXRoIHRoZSBleGlzdGluZyBkbWFfc3luY18qIGhlbHBlcnMuICBUaGlz
CnNlcmllcyBpcyB0aGUgZmlyc3Qgc3RlcCB0b3dhcmRzIHRoYXQuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==

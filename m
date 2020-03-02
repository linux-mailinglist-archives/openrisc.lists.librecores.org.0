Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 538DC177208
	for <lists+openrisc@lfdr.de>; Tue,  3 Mar 2020 10:09:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1856620483;
	Tue,  3 Mar 2020 10:09:28 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 9A11620977
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 17:05:19 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC05FFEC;
 Mon,  2 Mar 2020 08:05:17 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F8D23F534;
 Mon,  2 Mar 2020 08:05:13 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
References: <20200224194446.690816-1-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <4fe14c57-78d4-6590-a4c4-14fbe061238e@arm.com>
Date: Mon, 2 Mar 2020 16:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200224194446.690816-1-hch@lst.de>
Content-Language: en-GB
X-Mailman-Approved-At: Tue, 03 Mar 2020 10:09:23 +0100
Subject: Re: [OpenRISC] provide in-place uncached remapping for dma-direct v2
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 openrisc@lists.librecores.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMjQvMDIvMjAyMCA3OjQ0IHBtLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBIaSBhbGws
Cj4gCj4gdGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcmVtYXBwaW5nIHBsYWNlcyB1
bmNhY2hlZCBpbi1wbGFjZSBpbgo+IHRoZSBnZW5lcmljIGRtYS1kaXJlY3QgY29kZSwgYW5kIG1v
dmVzIG9wZW5yaXNjIG92ZXIgZnJvbSBpdHMgb3duCj4gaW4tcGxhY2UgcmVtYXBwaW5nIHNjaGVt
ZS4gIFRoZSBhcm02NCBmb2xrcyBhbHNvIGhhZCBpbnRlcmVzdCBpbiBzdWNoCj4gYSBzY2hlbWUg
dG8gYXZvaWQgcHJvYmxlbXMgd2l0aCBzcGVjdWxhdGluZyBpbnRvIGNhY2hlIGFsaWFzZXMuCj4g
Cj4gQWxzbyBhbGwgYXJjaGl0ZWN0dXJlcyB0aGF0IGFsd2F5cyB1c2Ugc21hbGwgcGFnZSBtYXBw
aW5ncyBmb3IgdGhlCj4ga2VybmVsIGFuZCBoYXZlIG5vbi1jb2hlcmVudCBETUEgc2hvdWxkIGxv
b2sgaW50byBlbmFibGluZyB0aGlzCj4gc2NoZW1lLCBhcyBpdCBpcyBtdWNoIG1vcmUgZWZmaWNp
ZW50IHRoYW4gdGhlIHZtYXAgcmVtYXBwaW5nLgo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gICAt
IHNoYXJlIHRoZSBhcmNoIGhvb2sgZm9yIGlubGluZSByZW1hcCBhbmQgdW5jYWNoZWQgc2VnbWVu
dCBzdXBwb3J0Cj4gCgpGb3IgdGhlIHdob2xlIHNlcmllczoKClJldmlld2VkLWJ5OiBSb2JpbiBN
dXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgoKSSB0aGluayB3ZSBtaWdodCB1bHRpbWF0ZWx5
IHdhbnQgdG8gZmlkZGxlIGFyb3VuZCBhIGJpdCBtb3JlIGluIApkbWFfZGlyZWN0X2FsbG9jX3Bh
Z2VzKCkgdG8gZ2l2ZSBBUkNIX0hBU19ETUFfU0VUX1VOQ0FDSEVEIGNsZWFyIApwcmVjZWRlbmNl
IG92ZXIgRE1BX0RJUkVDVF9SRU1BUCBpZiB0aGV5IGhhdmUgdG8gY29leGlzdCwgYnV0IGxldCdz
IGxhbmQgCnRoZXNlIHBhdGNoZXMgZmlyc3QgYXMgYSBzb2xpZCBmb3VuZGF0aW9uLgoKVGhhbmtz
LApSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

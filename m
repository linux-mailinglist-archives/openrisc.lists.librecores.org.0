Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4CB1A5630
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0CBCC20548;
	Mon,  2 Sep 2019 14:35:38 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 4EF392010F
 for <openrisc@lists.librecores.org>; Sat, 31 Aug 2019 18:29:47 +0200 (CEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2253522D37;
 Sat, 31 Aug 2019 16:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567268985;
 bh=oCFqDXfnxrqpiBFRCwyD8nHXvoMvSjbxCsJhrxHTYqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vX6b95IdsVrDjTXh55KZNhoPNMKUITWlit4Ldb9kHZhxWpNoqZwiOB5EF5DJcLfuZ
 wmt8nfF1pggofVEAUJWY4K2cI3w83kg0ds8vBO0zGI/+b8iJT5NQEI4dH3G3L57NyD
 AwNlHxXQFvARoZXdkRSB9gHwMtmjWPnHQrjl8Gx4=
Date: Sat, 31 Aug 2019 17:29:38 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190831162937.5ybulvaa4eq7mybs@willie-the-truck>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-20-hch@lst.de>
 <20190819073601.4yxjvmyjtpi7tk56@willie-the-truck>
 <20190830160515.GC26887@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190830160515.GC26887@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 19/26] arm64: remove __iounmap
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQ2hyaXN0b3BoLAoKT24gRnJpLCBBdWcgMzAsIDIwMTkgYXQgMDY6MDU6MTVQTSArMDIwMCwg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDg6MzY6
MDJBTSArMDEwMCwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gPiBPbiBTYXQsIEF1ZyAxNywgMjAxOSBh
dCAwOTozMjo0NkFNICswMjAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+ID4gTm8gbmVl
ZCB0byBpbmRpcmVjdCBpb3VubWFwIGZvciBhcm02NC4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gv
YXJtNjQvaW5jbHVkZS9hc20vaW8uaCB8IDMgKy0tCj4gPiA+ICBhcmNoL2FybTY0L21tL2lvcmVt
YXAuYyAgICAgfCA0ICsrLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBOb3Qgc3VyZSB3aHkgd2UgZGlkIGl0IGxpa2UgdGhp
cy4uLgo+ID4gCj4gPiBBY2tlZC1ieTogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPiAK
PiBDYW4geW91IGp1c3QgcGljayB0aGlzIG9uZSB1cCB0aHJvdWdoIHRoZSBhcm02NCB0cmVlIGZv
ciA1LjQ/CgpVbmZvcnR1bmF0ZWx5LCBpdCBkb2Vzbid0IGFwcGx5IGJlY2F1c2UgdGhlIHRyZWUg
eW91J3ZlIGJhc2VkIGl0IG9uIGhhcwpyZW1vdmVkIGlvcmVtYXBfd3QoKS4gSWYgeW91IHNlbmQg
YSB2ZXJzaW9uIGJhc2VkIG9uIG1haW5saW5lLCBJIGNhbgpxdWV1ZSBpdC4KCkNoZWVycywKCldp
bGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6712E292B
	for <lists+openrisc@lfdr.de>; Fri, 25 Dec 2020 00:15:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 588A820B07;
	Fri, 25 Dec 2020 00:15:25 +0100 (CET)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id AA6AB20C91
 for <openrisc@lists.librecores.org>; Thu,  3 Dec 2020 18:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0lhCxHLgf8TSOAvypxgyZdt6AOtyZg3i7+GSOy69WwU=; b=jeeAqf558AfAqY1ZPTR4HfNgwX
 YopjYarSwRSdQuGeGyjCSNFpvTWHEYq7+8CHvDrMVdGazF9BvP9no40RR9phvvpP85cND+YTv5ln8
 KPsTGbcRveY23zSbT4NayaXcOaWGv8eD84pD4++pebfb9TdeUpWsXFyBzsbMD+4DIqsHk8ZIrsRiW
 I7PtW3gWf5TUhQ5JidDUj/TGspfxPwztfLhtU0q/hd+wkoe4vNNFcR8XRjZIn82vi+bkd0ZTVcg/Z
 fo0RR2g2KJYGfC5KQ9XiTR/EvLYuZJdjOjJWpHZAgMtF0E4z09yRlsVs8vjqzUSCTdzo9+Ps9L8Qg
 SgThpYbg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kks7U-0000Aw-Oc; Thu, 03 Dec 2020 17:10:17 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 71A073059DD;
 Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5647C2029C718; Thu,  3 Dec 2020 18:10:15 +0100 (CET)
Date: Thu, 3 Dec 2020 18:10:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Message-ID: <20201203171015.GN2414@hirez.programming.kicks-ass.net>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
 <20201203145442.GC9994@osiris>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203145442.GC9994@osiris>
X-Mailman-Approved-At: Fri, 25 Dec 2020 00:15:22 +0100
Subject: Re: [OpenRISC] [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix
 arch_cpu_idle() vs tracing
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
Cc: Sasha Levin <sashal@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDM6NTQ6NDJQTSArMDEwMCwgSGVpa28gQ2Fyc3RlbnMg
d3JvdGU6Cj4gT24gVGh1LCBEZWMgMDMsIDIwMjAgYXQgMDg6Mjg6MjFBTSAtMDUwMCwgU2FzaGEg
TGV2aW4gd3JvdGU6Cj4gPiBGcm9tOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5v
cmc+Cj4gPiAKPiA+IFsgVXBzdHJlYW0gY29tbWl0IDU4YzY0NGJhNTEyY2ZiYzJlMzliNzU4ZGQ5
NzllZGQxZDZkMDBlMjcgXQo+ID4gCj4gPiBXZSBjYWxsIGFyY2hfY3B1X2lkbGUoKSB3aXRoIFJD
VSBkaXNhYmxlZCwgYnV0IHRoZW4gdXNlCj4gPiBsb2NhbF9pcnFfe2VuLGRpc31hYmxlKCksIHdo
aWNoIGludm9rZXMgdHJhY2luZywgd2hpY2ggcmVsaWVzIG9uIFJDVS4KPiA+IAo+ID4gU3dpdGNo
IGFsbCBhcmNoX2NwdV9pZGxlKCkgaW1wbGVtZW50YXRpb25zIHRvIHVzZQo+ID4gcmF3X2xvY2Fs
X2lycV97ZW4sZGlzfWFibGUoKSBhbmQgY2FyZWZ1bGx5IG1hbmFnZSB0aGUKPiA+IGxvY2tkZXAs
cmN1LHRyYWNpbmcgc3RhdGUgbGlrZSB3ZSBkbyBpbiBlbnRyeS4KPiA+IAo+ID4gKFhYWDogd2Ug
cmVhbGx5IHNob3VsZCBjaGFuZ2UgYXJjaF9jcHVfaWRsZSgpIHRvIG5vdCByZXR1cm4gd2l0aAo+
ID4gaW50ZXJydXB0cyBlbmFibGVkKQo+ID4gCj4gPiBSZXBvcnRlZC1ieTogU3ZlbiBTY2huZWxs
ZSA8c3ZlbnNAbGludXguaWJtLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJh
IChJbnRlbCkgPHBldGVyekBpbmZyYWRlYWQub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IE1hcmsgUnV0
bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gPiBUZXN0ZWQtYnk6IE1hcmsgUnV0bGFuZCA8
bWFyay5ydXRsYW5kQGFybS5jb20+Cj4gPiBMaW5rOiBodHRwczovL2xrbWwua2VybmVsLm9yZy9y
LzIwMjAxMTIwMTE0OTI1LjU5NDEyMjYyNkBpbmZyYWRlYWQub3JnCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gCj4gVGhpcyBwYXRjaCBicm9rZSBz
MzkwIGlycSBzdGF0ZSB0cmFjaW5nLiBBIHBhdGNoIHRvIGZpeCB0aGlzIGlzCj4gc2NoZWR1bGVk
IHRvIGJlIG1lcmdlZCB1cHN0cmVhbSB0b2RheSAoaG9wZWZ1bGx5KS4KPiBUaGVyZWZvcmUgSSB0
aGluayB0aGlzIHBhdGNoIHNob3VsZCBub3QgeWV0IGdvIGludG8gNS45IHN0YWJsZS4KCkFncmVl
ZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

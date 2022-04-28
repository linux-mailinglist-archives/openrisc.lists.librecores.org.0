Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABA45133FB
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 14:42:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2E7E5248CA;
	Thu, 28 Apr 2022 14:42:29 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id F062E24329
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 14:42:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C1C0B82CC2;
 Thu, 28 Apr 2022 12:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFB2C385A0;
 Thu, 28 Apr 2022 12:42:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hZmprpak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651149742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2K05YkZhpOuMhgr/oncdSXk/GQQMhwmWcgULc5ceX9k=;
 b=hZmprpak9Ywzz2wdBB6rNoLcdPOidG7yeoMlWxICXLsXO1SjNXFzJDPB8cawTsGS7t+V68
 1NQ+l/BryRStpTiKym34Y3Xh6DP6sdoiDwE5n4I/sTftqrLWXDAdUGI/gd30LxXeIk+bV4
 I0RzJy/xurTIn7WcuHcad4veUIXwh9k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d25154e0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 12:42:21 +0000 (UTC)
Date: Thu, 28 Apr 2022 14:42:20 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YmqLrDfbEGP659EO@zx2c4.com>
References: <20220428111139.1330966-1-Jason@zx2c4.com> <YmqAx31dtXCaNn7R@antec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YmqAx31dtXCaNn7R@antec>
Subject: Re: [OpenRISC] [PATCH] openrisc: define nop command for simulator
 reboot
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDg6NTU6NTFQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDE6MTE6MzlQTSArMDIwMCwgSmFzb24g
QS4gRG9uZW5mZWxkIHdyb3RlOgo+ID4gVGhlIHNpbXVsYXRvciBkZWZpbmVzIGBsLm5vcCAxYCBm
b3Igc2h1dGRvd24sIGJ1dCBkb2Vzbid0IGhhdmUgYW55dGhpbmcKPiA+IGZvciByZWJvb3QuIFVz
ZSAxMyBmb3IgdGhpcywgd2hpY2ggaXMgY3VycmVudGx5IHVudXNlZCwgZHViYmVkCj4gPiBgTk9Q
X1JFQk9PVGAuCj4gPiAKPiA+IENjOiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
PiA+IENjOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Cj4gPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvWW1uYURVcFZJNWloZ3ZnNkB6eDJjNC5jb20v
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDIgKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNo
L29wZW5yaXNjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9wcm9jZXNz
LmMKPiA+IGluZGV4IDNjMGM5MWJjZGNiYS4uNGNjZTk1ZmE2ZWI1IDEwMDY0NAo+ID4gLS0tIGEv
YXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gPiArKysgYi9hcmNoL29wZW5yaXNjL2tl
cm5lbC9wcm9jZXNzLmMKPiA+IEBAIC01Miw2ICs1Miw4IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0
KGNoYXIgKmNtZCkKPiA+ICB7Cj4gPiAgCWRvX2tlcm5lbF9yZXN0YXJ0KGNtZCk7Cj4gPiAgCj4g
PiArCV9fYXNtX18oImwubm9wIDEzIik7Cj4gPiArCj4gPiAgCS8qIEdpdmUgYSBncmFjZSBwZXJp
b2QgZm9yIGZhaWx1cmUgdG8gcmVzdGFydCBvZiAxcyAqLwo+ID4gIAltZGVsYXkoMTAwMCk7Cj4g
PiAgCj4gPiAtLSAKPiA+IDIuMzUuMQo+IAo+IFRoaXMgc2VlbXMgZmFpciwgcHJvYmFibHkgaXQg
d291bGQgYmUgZ29vZCB0byBoYXZlIGEgY29tbWVudCBtZW50aW9uaW5tZyB3aGF0Cj4gdGhlIG5v
cCBpcyBmb3IsIGZ5aSBmb3IgY29udGV4dCB0aGVzZSBhcmUgdGhlIG5vcCBudW1iZXJzIHVzZWQg
dG8gY29udHJvbAo+IHNpbXVsYXRpb25zLgo+IAo+ICAgICAjZGVmaW5lIE5PUF9OT1AgICAgICAg
ICAgMHgwMDAwICAgICAgLyogTm9ybWFsIG5vcCBpbnN0cnVjdGlvbiAqLwo+ICAgICAjZGVmaW5l
IE5PUF9FWElUICAgICAgICAgMHgwMDAxICAgICAgLyogRW5kIG9mIHNpbXVsYXRpb24gKi8KPiAg
ICAgI2RlZmluZSBOT1BfUkVQT1JUICAgICAgIDB4MDAwMiAgICAgIC8qIFNpbXBsZSByZXBvcnQg
Ki8KPiAgICAgLyojZGVmaW5lIE5PUF9QUklOVEYgICAgICAgMHgwMDAzICAgICAgIFNpbXByaW50
ZiBpbnN0cnVjdGlvbiAob2Jzb2xldGUpKi8KPiAgICAgI2RlZmluZSBOT1BfUFVUQyAgICAgICAg
IDB4MDAwNCAgICAgIC8qIEpQQjogU2ltcHV0YyBpbnN0cnVjdGlvbiAqLwo+ICAgICAjZGVmaW5l
IE5PUF9DTlRfUkVTRVQgICAgMHgwMDA1ICAgICAgLyogUmVzZXQgc3RhdGlzdGljcyBjb3VudGVy
cyAqLwo+ICAgICAjZGVmaW5lIE5PUF9HRVRfVElDS1MgICAgMHgwMDA2ICAgICAgLyogSlBCOiBH
ZXQgIyB0aWNrcyBydW5uaW5nICovCj4gICAgICNkZWZpbmUgTk9QX0dFVF9QUyAgICAgICAweDAw
MDcgICAgICAvKiBKUEI6IEdldCBwaWNvc2Vjcy9jeWNsZSAqLwo+ICAgICAjZGVmaW5lIE5PUF9U
UkFDRV9PTiAgICAgMHgwMDA4ICAgICAgLyogVHVybiBvbiB0cmFjaW5nICovCj4gICAgICNkZWZp
bmUgTk9QX1RSQUNFX09GRiAgICAweDAwMDkgICAgICAvKiBUdXJuIG9mZiB0cmFjaW5nICovCj4g
ICAgICNkZWZpbmUgTk9QX1JBTkRPTSAgICAgICAweDAwMGEgICAgICAvKiBSZXR1cm4gNCByYW5k
b20gYnl0ZXMgKi8KPiAgICAgI2RlZmluZSBOT1BfT1IxS1NJTSAgICAgIDB4MDAwYiAgICAgIC8q
IFJldHVybiBub24temVybyBpZiB0aGlzIGlzIE9yMWtzaW0gKi8KPiAgICAgI2RlZmluZSBOT1Bf
RVhJVF9TSUxFTlQgIDB4MDAwYyAgICAgIC8qIEVuZCBvZiBzaW11bGF0aW9uLCBxdWlldCB2ZXJz
aW9uICovCj4gICAgIC8qIE5ldyEgKi8KPiAgICAgI2RlZmluZSBOT1BfUkVTRVQgICAgICAgIDB4
MDAwZCAgICAgIC8qIFJlc2V0IHRoZSBjcHUgKi8KClJpZ2h0LCB0aGF0J3Mgd2hlcmUgSSBnb3Qg
MTMgZnJvbS4gQnkgdGhlIHdheSwgdGhlIC50ZXggZmlsZSBvbmx5Cm1lbnRpb25zIG9uZXMgdXAg
dG8gMTEsIHNvIGF0IGZpcnN0IEkgY2hvc2UgMTIsIGFuZCB0aGVuIHNhdyB0aGlzIGZpbGUuCgo+
IAo+IEkgd2lsbCBxdWV1ZSB0aGlzIG9uY2Ugd2UgdXBkYXRlIHRoZSBzcGVjIHRvIGRlZmluZSBz
b21lIG9mIHRoZXNlLCBJIGFtIHRoaW5raW5nCj4gaWYgcWVtdSBzaG91bGQgYWxsb3cgZm9yIHRo
ZSBzaHV0ZG93biB0byB3b3JrIGluIHVzZXIgbW9kZS4KPiAKPiBCVFcsIGFyZSB5b3Ugd29ya2lu
ZyBzcGVjaWZpY2FsbHkgb24gb3BlbnJpc2M/IE9yIGp1c3Qgc2V0dGluZyB1cCB0ZXN0Cj4gZW52
aXJvbm1lbnRzIGZvciBhbGwgYXJjaGl0ZWN0dXJlcz8KClRyeWluZyB0byBnZXQgT3BlblJJU0Mg
dXAgb24gaHR0cHM6Ly9idWlsZC53aXJlZ3VhcmQuY29tLyAuIFRoZSBvdGhlcgphcmNoaXRlY3R1
cmVzIHdlcmUgc2ltcGxlLCBidXQgT3BlblJJU0MgaXMgcmVxdWlyaW5nIHNvbWUgd29yay4uLgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

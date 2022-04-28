Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 682625127EB
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 02:04:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0FE0823F5C;
	Thu, 28 Apr 2022 02:04:37 +0200 (CEST)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 9ABE0211D5
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 02:04:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 10F82B82B35;
 Thu, 28 Apr 2022 00:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503BFC385A7;
 Thu, 28 Apr 2022 00:04:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mpnRn+5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1651104271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kd7wAoTuj7nXl1XjSRaT3ZKgb9iGFejdoNr2nUKHfiY=;
 b=mpnRn+5sOmMTx98ZwUVbP0fHbXRjRdsDPsrijeWrk6VSt8PKNYVsimorXdBCJ9RShH6B8Y
 UFjyLF3UlJyeky5Oo3Sm9UMITa06jS2UKqZauCEZKTqCBs3ZWtZYqugX45hTFxhgJo2IH0
 j++GaRCOoBM6TZAqeMv9m5QVI+OaQ3k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40756fb9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 28 Apr 2022 00:04:31 +0000 (UTC)
Date: Thu, 28 Apr 2022 02:04:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YmnaDUpVI5ihgvg6@zx2c4.com>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ymm6K3DjesAZR0OY@antec>
Subject: Re: [OpenRISC] [Qemu-devel] [PATCH 2/7] target/openrisc: add
 shutdown logic
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
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiBUaHUsIEFwciAyOCwgMjAyMiBhdCAwNjo0ODoyN0FNICswOTAwLCBT
dGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBXZWQsIEFwciAyNywgMjAyMiBhdCAwNzo0NzozM1BN
ICswMTAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOgo+ID4gT24gV2VkLCAyNyBBcHIgMjAyMiBhdCAx
ODo0NiwgSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IHdyb3RlOgo+ID4gPgo+
ID4gPiBIZXkgU3RhZmZvcmQsCj4gPiA+Cj4gPiA+IE9uIE1vbiwgQXByIDE3LCAyMDE3IGF0IDA4
OjIzOjUxQU0gKzA5MDAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gPiA+IEluIG9wZW5yaXNj
IHNpbXVsYXRvcnMgd2UgdXNlIGhvb2tzIGxpa2UgJ2wubm9wIDEnIHRvIGNhdXNlIHRoZQo+ID4g
PiA+IHNpbXVsYXRvciB0byBleGl0LiAgSW1wbGVtZW50IHRoYXQgZm9yIHFlbXUgdG9vLgo+ID4g
PiA+Cj4gPiA+ID4gUmVwb3J0ZWQtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5v
cmc+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5j
b20+Cj4gPiA+Cj4gPiA+IEknbSBjdXJpb3VzIGFzIHRvIHdoeSB0aGlzIG5ldmVyIGdvdCBtZXJn
ZWQuIEkgbm90aWNlZCBJJ20gZW50aXJlbHkgYWJsZQo+ID4gPiB0byBzaHV0ZG93biBvciB0byBy
ZWJvb3QgKHdoaWNoIGlzIG1vc3RseSB3aGF0IEkgY2FyZSBhYm91dCkgTGludXggZnJvbQo+ID4g
PiBPcGVuUklTQy4gSXQganVzdCBoYW5ncy4KPiA+IAo+ID4gVGhpcyBraW5kIG9mIHRoaW5nIG5l
ZWRzIHRvIGJlIGVpdGhlcjoKPiA+ICAoMSkgd2UncmUgbW9kZWxsaW5nIHJlYWwgaGFyZHdhcmUg
YW5kIHRoYXQgcmVhbCBoYXJkd2FyZSBoYXMgYQo+ID4gZGV2aWNlIG9yIG90aGVyIG1lY2hhbmlz
bSBndWVzdCBjb2RlIGNhbiBwcm9kIHRvIGNhdXNlIGEgcG93ZXItb2ZmCj4gPiBvciByZWJvb3Qu
IFRoZW4gd2UgbW9kZWwgdGhhdCBkZXZpY2UsIGFuZCBndWVzdCBjb2RlIHRyaWdnZXJzIGEKPiA+
IHNodXRkb3duIG9yIHJlYm9vdCBleGFjdGx5IGFzIGl0IHdvdWxkIG9uIHRoZSByZWFsIGhhcmR3
YXJlLgo+ID4gICgyKSB0aGVyZSBpcyBhbiBhcmNoaXRlY3R1cmFsbHkgZGVmaW5lZCBBQkkgZm9y
IHNpbXVsYXRvcnMsIGRlYnVnCj4gPiBzdHVicywgZXRjLCB0aGF0IGluY2x1ZGVzIHZhcmlvdXMg
b3BlcmF0aW9ucyB0eXBpY2FsbHkgaW5jbHVkaW5nCj4gPiBhbiAiZXhpdCB0aGUgc2ltdWxhdG9y
IiBmdW5jdGlvbi4gKEFybSBzZW1paG9zdGluZyBpcyBhbiBleGFtcGxlCj4gPiBvZiB0aGlzLikg
SW4gdGhhdCBjYXNlIHdlIGNhbiBpbXBsZW1lbnQgdGhhdCBmdW5jdGlvbmFsaXR5LAo+ID4gZ3Vh
cmRlZCBieSBhbmQgY29udHJvbGxlZCBieSB0aGUgYXBwcm9wcmlhdGUgY29tbWFuZCBsaW5lIG9w
dGlvbnMuCj4gPiAoVGhpcyBpcyBnZW5lcmFsbHkgbm90IGFzIG5pY2UgYXMgb3B0aW9uIDEsIGJl
Y2F1c2UgdGhlIGd1ZXN0IGNvZGUKPiA+IGhhcyB0byBiZSBjb21waWxlZCB0byBoYXZlIHN1cHBv
cnQgZm9yIHNlbWlob3N0aW5nIGFuZCBhbHNvIGJlY2F1c2UKPiA+IHR1cm5pbmcgaXQgb24gaXMg
dXN1YWxseSBhbHNvIGdpdmluZyBpbXBsaWNpdCBwZXJtaXNzaW9uIGZvciB0aGUKPiA+IGd1ZXN0
IGNvZGUgdG8gcmVhZCBhbmQgd3JpdGUgYXJiaXRyYXJ5IGhvc3QgZmlsZXMsIGV0Yy4pCj4gPiAK
PiA+IEVpdGhlciB3YXksIHVuZG9jdW1lbnRlZCByYW5kb20gaGFja3MgYXJlbid0IGEgZ29vZCBp
ZGVhLCB3aGljaAo+ID4gaXMgd2h5IHRoaXMgd2Fzbid0IG1lcmdlZC4KPiAKPiBZZXMsIHRoaXMg
aXMgd2hhdCB3YXMgYnJvdWdodCB1cCBiZWZvcmUuICBBdCB0aGF0IHRpbWUgc2VtaWhvc3Rpbmcg
d2FzIG1lbnRpb25lZAo+IGFuZCBJIHRyaWVkIHRvIHVuZGVyc3RhbmQgd2hhdCBpdCB3YXMgYnV0
IGRpZG4ndCByZWFsbHkgdW5kZXJzdGFuZCBpdCBhcyBhIGdlbmVyYWwKPiBjb25jZXB0LiAgSXMg
dGhpcyBzb21ldGhpbmcgYXJtIHNwZWNpZmljPwo+IAo+IFNpbmNlIHRoZSBxZW11IG9yMWstc2lt
IGRlZmluZXMgb3VyICJzaW11bGF0b3IiLCBJIHN1c3BlY3QgSSBjb3VsZCBhZGQgYQo+IGRlZmlu
aXRpb24gb2Ygb3VyIHNpbXVsYXRvciBBQkkgdG8gdGhlIE9wZW5SSVNDIGFyY2hpdGVjdHVyZSBz
cGVjaWZpY2F0aW9uLiAgVGhlCj4gc2ltdWxhdGlvbiB1c2VzIG9mIGwubm9wIE4gYXMgQUJJIGhv
b2tzIGlzIGEgZGUtZmFjdG8gc3RhbmRhcmQgZm9yIE9wZW5SSVNDLgo+IEZyb20gdGhlIHdheSB5
b3UgZGVzY3JpYmUgdGhpcyBub3cgSSB0YWtlIGl0IGlmIHdlIGRvY3VtZW50IHRoaXMgYXMgYQo+
IGFyY2hpdGVjdHVyZSBzaW11bGF0aW9uIEFCSSB0aGUgcGF0Y2ggd291bGQgYmUgYWNjZXB0ZWQu
CgpJZiB0aGF0J3Mgd2hhdCBpdCB0YWtlcywgdGhlbiB0aGF0J2QgbWFrZSBzZW5zZS4KCkJ5IHRo
ZSB3YXksIHdvdWxkIHRoaXMgYWxzbyBoZWxwIHRoZSByZWJvb3QgY2FzZT8gVGhhdCdzCmByZWJv
b3QoUkJfQVVUT0JPT1QpO2AsIHdoaWNoIGRvZXM6CgptYWNoaW5lX3Jlc3RhcnQoKSAtPgogIGRv
X2tlcm5lbF9yZXN0YXJ0KCkgLT4KICAgIGF0b21pY19ub3RpZmllcl9jaGFpbl9yZWdpc3Rlcigm
cmVzdGFydF9oYW5kbGVyX2xpc3QsIG5iKSAtPgogICAgICA/Pz8KCkFzIGZhciBhcyBJIGNhbiB0
ZWxsLCBub3RoaW5nIGlzIHdpcmVkIGludG8gdGhlIHJlYm9vdCBjYXNlIGZvcgpPcGVuUklTQy4g
SXMgdGhpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBmaXhlZCBpbiB0aGUga2VybmVsIHdpdGhv
dXQKaGF2aW5nIHRvIHBhdGNoIFFFTVU/IElmIHNvLCB0aGVuIEkgY291bGQgZWZmZWN0aXZlbHkg
Z2V0IHNodXRkb3duIGZvcgpteSBDSSB3aXRoIHRoZSAtbm8tcmVib290IG9wdGlvbiwgd2hpY2gg
aXMgd2hhdCBJJ20gYWxyZWFkeSBkb2luZyBmb3IgYQpmZXcgcGxhdGZvcm1zLgoKSmFzb24KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

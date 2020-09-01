Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCB5B2587B4
	for <lists+openrisc@lfdr.de>; Tue,  1 Sep 2020 07:59:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6182E20014;
	Tue,  1 Sep 2020 07:59:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id AC62820014
 for <openrisc@lists.librecores.org>; Tue,  1 Sep 2020 07:59:33 +0200 (CEST)
Received: from kernel.org (unknown [87.70.91.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75D9D2087D;
 Tue,  1 Sep 2020 05:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598939971;
 bh=BJfrClw+C5jaFYlYb2O3GY7/UQ3rsmmQs8RxMwdsSY4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nnLyZ5mDHRUIhha8dkmjwpA51hT6fthUo0yyY3VVOe1s7JbrSYsAlq8d6JAYO1DZN
 MZ++Rx2ECmGTFmGWOWCdO6SdR4ExDt62LEvpZTT9hx77PaIgfnwEnTUviPThaR8lwZ
 vX85aH1lrloWJDrbTGRVNz4jEyqkRQEM/0M5Ms7A=
Date: Tue, 1 Sep 2020 08:59:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200901055924.GC432455@kernel.org>
References: <20200831212102.4014642-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831212102.4014642-1-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH] openrisc: Reserve memblock for initrd
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
Cc: Jonas Bonn <jonas@southpole.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>,
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDY6MjE6MDFBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gUmVjZW50bHkgT3BlblJJU0MgYWRkZWQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgaW5p
dHJkIGltYWdlcywgYnV0IEkgZm91bmQKPiBzb21lIGluc3RhYmlsaXR5IHdoZW4gdXNpbmcgbGFy
Z2VyIGJ1aWxkcm9vdCBpbml0cmQgaW1hZ2VzLiBJdCB0dXJuZWQKPiBvdXQgdGhhdCBJIGZvcmdv
dCB0byByZXNlcnZlIHRoZSBtZW1ibG9jayBzcGFjZSBmb3IgdGhlIGluaXRyZCBpbWFnZS4KPiAK
PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpbnN0YWJpbGl0eSBpc3N1ZSBieSByZXNlcnZpbmcgbWVt
YmxvY2sgc3BhY2UuCj4gCj4gRml4ZXM6IGZmNmM5MjNkYmVjMyAoIm9wZW5yaXNjOiBBZGQgc3Vw
cG9ydCBmb3IgZXh0ZXJuYWwgaW5pdHJkIGltYWdlcyIpCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2Mva2VybmVs
L3NldHVwLmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29w
ZW5yaXNjL2tlcm5lbC9zZXR1cC5jCj4gaW5kZXggYjE4ZTc3NWY4YmUzLi4yYzhhYTUzY2M3YmEg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gv
b3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiBAQCAtODAsNiArODAsMTUgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldHVwX21lbW9yeSh2b2lkKQo+ICAJICovCj4gIAltZW1ibG9ja19yZXNlcnZlKF9f
cGEoX3N0ZXh0KSwgX2VuZCAtIF9zdGV4dCk7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZf
SU5JVFJECj4gKwkvKiBUaGVuIHJlc2VydmUgdGhlIGluaXRyZCwgaWYgYW55ICovCj4gKwlpZiAo
aW5pdHJkX3N0YXJ0ICYmIChpbml0cmRfZW5kID4gaW5pdHJkX3N0YXJ0KSkgewo+ICsJCW1lbWJs
b2NrX3Jlc2VydmUoQUxJR05fRE9XTihfX3BhKGluaXRyZF9zdGFydCksIFBBR0VfU0laRSksCj4g
KwkJCUFMSUdOKGluaXRyZF9lbmQsIFBBR0VfU0laRSkgLQo+ICsJCQlBTElHTl9ET1dOKGluaXRy
ZF9zdGFydCwgUEFHRV9TSVpFKSk7Cj4gKwl9CgpUaGUgY29yZSBtbSB0YWtlcyBjYXJlIG9mIHJl
c2VydmluZyB0aGUgZW50cmlyZSBwYWdlcyBmb3IgdGhlIG1lbW9yeQpyZXNlcnZlZCB3aXRoIG1l
bWJsb2NrLCBzbyBpdCBpcyBub3QgbmVjZXNzYXJ5IHRvIGRvIGl0IGhlcmUuCgo+ICsjZW5kaWYg
LyogQ09ORklHX0JMS19ERVZfSU5JVFJEICovCj4gKwo+ICAJZWFybHlfaW5pdF9mZHRfcmVzZXJ2
ZV9zZWxmKCk7Cj4gIAllYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpOwo+ICAKPiAt
LSAKPiAyLjI2LjIKPiAKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

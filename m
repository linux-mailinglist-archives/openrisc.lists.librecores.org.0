Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CA0BE258DF7
	for <lists+openrisc@lfdr.de>; Tue,  1 Sep 2020 14:11:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 654A920B98;
	Tue,  1 Sep 2020 14:11:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9E40220B98
 for <openrisc@lists.librecores.org>; Tue,  1 Sep 2020 14:11:38 +0200 (CEST)
Received: from kernel.org (unknown [77.127.89.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EDE9206EF;
 Tue,  1 Sep 2020 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598962296;
 bh=p4M/L1yz/ek8/chpzyAF+xMHJfMK5wQCHUgID8EQdmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dEqOWpAz2kvlKimlO8dARzBFcrklfu8cSe+2aBF7CkJogzpcFaPoSG4sCMG8qyzbm
 ZMT4ghik9IujpTvBZZvnOyJQ3FEHNmSceRhtvrncuQUYwdh1STPOtZ5hDvRfEgtVCc
 sCotdF9hRvqJ/eYyBX3v/Yw22a9waEHIR0NqLKK4=
Date: Tue, 1 Sep 2020 15:11:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20200901121130.GA698558@kernel.org>
References: <20200831212102.4014642-1-shorne@gmail.com>
 <20200901055924.GC432455@kernel.org>
 <20200901102044.GB3562056@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901102044.GB3562056@lianli.shorne-pla.net>
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

T24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDc6MjA6NDRQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gVHVlLCBTZXAgMDEsIDIwMjAgYXQgMDg6NTk6MjRBTSArMDMwMCwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDAxLCAyMDIwIGF0IDA2OjIxOjAxQU0gKzA5
MDAsIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4gPiBSZWNlbnRseSBPcGVuUklTQyBhZGRlZCBz
dXBwb3J0IGZvciBleHRlcm5hbCBpbml0cmQgaW1hZ2VzLCBidXQgSSBmb3VuZAo+ID4gPiBzb21l
IGluc3RhYmlsaXR5IHdoZW4gdXNpbmcgbGFyZ2VyIGJ1aWxkcm9vdCBpbml0cmQgaW1hZ2VzLiBJ
dCB0dXJuZWQKPiA+ID4gb3V0IHRoYXQgSSBmb3Jnb3QgdG8gcmVzZXJ2ZSB0aGUgbWVtYmxvY2sg
c3BhY2UgZm9yIHRoZSBpbml0cmQgaW1hZ2UuCj4gPiA+IAo+ID4gPiBUaGlzIHBhdGNoIGZpeGVz
IHRoZSBpbnN0YWJpbGl0eSBpc3N1ZSBieSByZXNlcnZpbmcgbWVtYmxvY2sgc3BhY2UuCj4gPiA+
IAo+ID4gPiBGaXhlczogZmY2YzkyM2RiZWMzICgib3BlbnJpc2M6IEFkZCBzdXBwb3J0IGZvciBl
eHRlcm5hbCBpbml0cmQgaW1hZ2VzIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9y
bmUgPHNob3JuZUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9vcGVucmlzYy9rZXJu
ZWwvc2V0dXAuYyB8IDkgKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0
dXAuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKPiA+ID4gaW5kZXggYjE4ZTc3NWY4
YmUzLi4yYzhhYTUzY2M3YmEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVs
L3NldHVwLmMKPiA+ID4gKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwo+ID4gPiBA
QCAtODAsNiArODAsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21lbW9yeSh2b2lkKQo+
ID4gPiAgCSAqLwo+ID4gPiAgCW1lbWJsb2NrX3Jlc2VydmUoX19wYShfc3RleHQpLCBfZW5kIC0g
X3N0ZXh0KTsKPiA+ID4gIAo+ID4gPiArI2lmZGVmIENPTkZJR19CTEtfREVWX0lOSVRSRAo+ID4g
PiArCS8qIFRoZW4gcmVzZXJ2ZSB0aGUgaW5pdHJkLCBpZiBhbnkgKi8KPiA+ID4gKwlpZiAoaW5p
dHJkX3N0YXJ0ICYmIChpbml0cmRfZW5kID4gaW5pdHJkX3N0YXJ0KSkgewo+ID4gPiArIAltZW1i
bG9ja19yZXNlcnZlKEFMSUdOX0RPV04oX19wYShpbml0cmRfc3RhcnQpLCBQQUdFX1NJWkUpLAo+
ID4gPiArCQlBTElHTihpbml0cmRfZW5kLCBQQUdFX1NJWkUpIC0KPiA+ID4gKwkJQUxJR05fRE9X
Tihpbml0cmRfc3RhcnQsIFBBR0VfU0laRSkpOwo+ID4gPiArCX0KPiA+IAo+ID4gVGhlIGNvcmUg
bW0gdGFrZXMgY2FyZSBvZiByZXNlcnZpbmcgdGhlIGVudHJpcmUgcGFnZXMgZm9yIHRoZSBtZW1v
cnkKPiA+IHJlc2VydmVkIHdpdGggbWVtYmxvY2ssIHNvIGl0IGlzIG5vdCBuZWNlc3NhcnkgdG8g
ZG8gaXQgaGVyZS4KPiAKPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyCj4gCj4gSSBndWVzcyB3aGF0
IHlvdSBtZWFuIGlzIGl0IGlzIG5vdCByZXF1aXJlZCB0byBkbyB0aGUgcGFnZSBhbGlnbm1lbnQu
CgpSaWdodC4gCgo+IEkgdXNlZCBvdGhlciBhcmNoaXRlY3R1cmVzIGFzIGFuIGV4YW1wbGUgYW5k
IG1vc3QgZG8gdGhlIGFsaWdubWVudCwgSQo+IHRoaW5rIGZvciBtb3N0IGFyY2hpdGVjdHVyZXMg
dGhpcyBjYW4gYmUgcHVsbGVkIG91dCB0byBnZW5lcmljIGNvZGUuCgpZb3UgYXJlIG1vcmUgdGhh
biB3ZWxjb21lIDopCldlIGFscmVhZHkgaGF2ZSBhIGdlbmVyaWMgZnJlZV9pbml0cmRfbWVtKCks
IG1heWJlIGl0J3MgdGltZSB0byBoYXZlIGEKZ2VuZXJpYyByZXNlcnZlX2luaXRyZF9tZW0oKS4K
CkknbSBvayB3aXRoIG9wZW5yaXNjIGRvaW5nIHRoZSBhbGlnbm1lbnQsIGJ1dCBJIHRoaW5rIHVz
aW5nIGxvY2FsCnZhcmlhYmxlcyB3b3VsZCBtYWtlIHRoZSBjb3JlIG1vcmUgcmVhZGFibGUsIGUu
ZwoKCWlmIChpbml0ZF9zdGFydCAmJiAoaW5pdHJkX2VuZCkpIHsKCQl1bnNpZ25lZCBsb25nIGFs
aWduZWRfc3RhcnQgPSBBTElHTl9ET1dOKGluaXRyZF9zdGFydCwgUEFHRV9TSVpFKTsKCQl1bnNp
Z25lZCBsb25nIGFsaWduZWRfZW5kID0gQUxJR04oZW5kLCBQQUdFX1NJWkUpOwoKCQltZW1ibG9j
a19yZXNlcnZlKGFsaWduZWRfc3RhcnQsIGFsaWduZWRfZW5kKTsKCX0KCldoYXQgZG8geW91IHNh
eT8KCj4gLVN0YWZmb3JkCj4gCj4gPiA+ICsjZW5kaWYgLyogQ09ORklHX0JMS19ERVZfSU5JVFJE
ICovCj4gPiA+ICsKPiA+ID4gIAllYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKPiA+ID4g
IAllYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpOwo+ID4gPiAgCj4gPiA+IC0tIAo+
ID4gPiAyLjI2LjIKPiA+ID4gCj4gPiAKPiA+IC0tIAo+ID4gU2luY2VyZWx5IHlvdXJzLAo+ID4g
TWlrZS4KCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

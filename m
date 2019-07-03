Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CDFA55E808
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 17:43:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7607820346;
	Wed,  3 Jul 2019 17:43:11 +0200 (CEST)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTPS id F107D20302
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 17:43:09 +0200 (CEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63Fh2D2026488;
 Wed, 3 Jul 2019 10:43:02 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x63Fh1vK026487;
 Wed, 3 Jul 2019 10:43:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 3 Jul 2019 10:43:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190703154301.GY18316@gate.crashing.org>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-5-shorne@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703033351.11924-5-shorne@gmail.com>
User-Agent: Mutt/1.4.2.3i
Subject: Re: [OpenRISC] [PATCH v2 4/5] or1k: Initial support for FPU
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgU3RhZmZvcmQsCgpPbiBXZWQsIEp1bCAwMywgMjAxOSBhdCAxMjozMzo1MFBNICswOTAwLCBT
dGFmZm9yZCBIb3JuZSB3cm90ZToKPiArICAgIGNhc2UgJ2QnOgo+ICsgICAgICBpZiAoUkVHX1Ag
KHgpKQo+ICsJICBpZiAoR0VUX01PREUgKHgpID09IERGbW9kZSB8fCBHRVRfTU9ERSAoeCkgPT0g
REltb2RlKQo+ICsJICAgIGZwcmludGYgKGZpbGUsICIlcywlcyIsIHJlZ19uYW1lc1tSRUdOTyAo
b3BlcmFuZCldLAo+ICsJCQkJICAgIHJlZ19uYW1lc1tSRUdOTyAob3BlcmFuZCkgKyAxXSk7Cj4g
KwkgIGVsc2UKPiArCSAgICBmcHJpbnRmIChmaWxlLCAiJXMiLCByZWdfbmFtZXNbUkVHTk8gKG9w
ZXJhbmQpXSk7Cj4gKyAgICAgIGVsc2UKClRoZSBjb2RpbmcgY29udmVudGlvbnMgc2F5cyB0byB1
c2UgYnJhY2VzIGFyb3VuZCBuZXN0ZWQgY29uZGl0aW9uYWxzLgoKPiBAQCAtMjEyLDYgKzIxNCw3
IEBAIGVudW0gcmVnX2NsYXNzCj4gICNkZWZpbmUgUkVHX0NMQVNTX0NPTlRFTlRTICAgICAgXAo+
ICB7IHsgMHgwMDAwMDAwMCwgMHgwMDAwMDAwMCB9LAlcCj4gICAgeyBTSUJDQUxMX1JFR1NfTUFT
SywgICAwIH0sCVwKPiArICB7IDB4N2ZmZmZlZmUsIDB4MDAwMDAwMDAgfSwJXAoKQWJvdmUgeW91
IHNhaWQgcjAsIHIzMCwgcjMxIGFyZSBleGNsdWRlZCwgYnV0IHRoaXMgaXMgcjAsIHI4LCByMzAs
IG9yCmluIEdDQyByZWdpc3RlciBudW1iZXJzLCAwLCA4LCBhbmQgMzE/ICBZb3UgcHJvYmFibHkg
c2hvdWxkIG1lbnRpb24gcjgKc29tZXdoZXJlIChpdCdzIGJlY2F1c2UgaXQgaXMgdGhlIGxhc3Qg
YXJnLCB0aGlzIGF2b2lkIHByb2JsZW1zLCBJIGd1ZXNzPyksCmFuZCB0aGUgMzAvMzEgdGhpbmcg
aXMgY29uZnVzZWQgc29tZSB3YXkuICBNYXliZSBpdCBpcyBhbGwganVzdCB0aGF0IG9uZQpkb2N1
bWVudGF0aW9uIGxpbmUgOi0pCgo+ICs7ICBkIC0gZG91YmxlIHBhaXIgYmFzZSByZWdpc3RlcnMg
KGV4Y2x1ZGVzIHIwLCByMzAgYW5kIHIzMSB3aGljaCBvdmVyZmxvdykKCgpTZWdoZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

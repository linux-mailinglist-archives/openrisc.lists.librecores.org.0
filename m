Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 694825EF2D
	for <lists+openrisc@lfdr.de>; Thu,  4 Jul 2019 00:35:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 232B52035A;
	Thu,  4 Jul 2019 00:35:24 +0200 (CEST)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTPS id D074820220
 for <openrisc@lists.librecores.org>; Thu,  4 Jul 2019 00:35:22 +0200 (CEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63MZGBL011928;
 Wed, 3 Jul 2019 17:35:16 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x63MZFPt011927;
 Wed, 3 Jul 2019 17:35:15 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 3 Jul 2019 17:35:15 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190703223515.GE18316@gate.crashing.org>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-5-shorne@gmail.com>
 <20190703154301.GY18316@gate.crashing.org>
 <64def15b-f701-4a5e-2724-6fb1e859be9a@twiddle.net>
 <20190703221956.GE2601@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703221956.GE2601@lianli.shorne-pla.net>
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
Cc: Jeff Law <law@redhat.com>, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDc6MTk6NTZBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDk6MDk6NTFQTSArMDIwMCwgUmljaGFy
ZCBIZW5kZXJzb24gd3JvdGU6Cj4gPiBPbiA3LzMvMTkgNTo0MyBQTSwgU2VnaGVyIEJvZXNzZW5r
b29sIHdyb3RlOgo+ID4gPj4gQEAgLTIxMiw2ICsyMTQsNyBAQCBlbnVtIHJlZ19jbGFzcwo+ID4g
Pj4gICNkZWZpbmUgUkVHX0NMQVNTX0NPTlRFTlRTICAgICAgXAo+ID4gPj4gIHsgeyAweDAwMDAw
MDAwLCAweDAwMDAwMDAwIH0sCVwKPiA+ID4+ICAgIHsgU0lCQ0FMTF9SRUdTX01BU0ssICAgMCB9
LAlcCj4gPiA+PiArICB7IDB4N2ZmZmZlZmUsIDB4MDAwMDAwMDAgfSwJXAo+ID4gPiAKPiA+ID4g
QWJvdmUgeW91IHNhaWQgcjAsIHIzMCwgcjMxIGFyZSBleGNsdWRlZCwgYnV0IHRoaXMgaXMgcjAs
IHI4LCByMzAsIG9yCj4gPiA+IGluIEdDQyByZWdpc3RlciBudW1iZXJzLCAwLCA4LCBhbmQgMzE/
ICBZb3UgcHJvYmFibHkgc2hvdWxkIG1lbnRpb24gcjgKPiA+ID4gc29tZXdoZXJlIChpdCdzIGJl
Y2F1c2UgaXQgaXMgdGhlIGxhc3QgYXJnLCB0aGlzIGF2b2lkIHByb2JsZW1zLCBJIGd1ZXNzPyks
Cj4gPiA+IGFuZCB0aGUgMzAvMzEgdGhpbmcgaXMgY29uZnVzZWQgc29tZSB3YXkuICBNYXliZSBp
dCBpcyBhbGwganVzdCB0aGF0IG9uZQo+ID4gPiBkb2N1bWVudGF0aW9uIGxpbmUgOi0pCj4gPiAK
PiA+IC4uLiBhbmQgaWYgcjggaXMgZXhjbHVkZWQgYmVjYXVzZSBvZiBhcmd1bWVudHMsIEkgc3Vz
cGVjdCB0aGF0IHRoaXMgaXMgdGhlCj4gPiB3cm9uZyBmaXgsIGFzIHRoZXJlJ3Mgbm90aGluZyBp
bmhlcmVudGx5IHdyb25nIHdpdGggcjc6cjggb3Igcjg6cjkgYXMgYSBwYWlyLAo+ID4gYXQgbGVh
c3QgdGhhdCBJIGNhbiBzZWUuCj4gPiAKPiA+IFBlcmhhcHMgZnVuY3Rpb25fYXJnIGFuZC9vciBm
dW5jdGlvbl9hcmdfYWR2YW5jZSBpcyB0aGUgcmlnaHQgcGxhY2UgZm9yIGEgZml4Pwo+ID4gVGhl
IGNhbGxpbmcgY29udmVudGlvbiBzYXlzIHRoYXQgNjQtYml0IGFyZ3VtZW50cyBhcmUgbm90IHNw
bGl0IGFjcm9zcwo+ID4gcmVnaXN0ZXJzK3N0YWNrLCBzbyB5b3UgYWxyZWFkeSBzaG91bGRuJ3Qg
aGF2ZSBzZWVuIChyOCwgW3NwKzBdKSBhcyBhIHBhaXIuCj4gCj4gSSB3aWxsIGRvdWJsZSBjaGVj
aywgdGhlIG1hc2sgbWF5IGJlIHdyb25nLiAgSXQgc2hvdWxkIG5vdCBtYXR0ZXIgYWJvdXQgdGhl
Cj4gZnVuY3Rpb24gYXJncy4KPiAKPiBJIGRpZG4ndCBzZWUgYW55IGlzc3VlIHRoYXQgY2F1c2Vk
IG1lIHRvIGFkZCByOC4gIFNvIEkgbWF5IGhhdmUganVzdCBtYXNrZWQgdGh3Cj4gcm9uZyBiaXQg
dGhpbmtpbmcgaXQncyByMzEuICBJcyB0aGVyZSBzb21ldGhpbmcgd29ybmcgd2l0aCB3aGF0IEkg
ZGlkPwo+IAo+IFRoZSBtYXNrIGlzIDB4N2ZmZmZlZmUsIGFuZCBuYW1lcyBzaG91bGQgY29ycmVz
Ym9uZCB0byB0aGlzIG5hbWUgbGlzdD8KPiAKPiAjZGVmaW5lIFJFR0lTVEVSX05BTUVTIHsKPiAg
ICJyMCIsICAgInIxIiwgICAicjIiLCAgICJyMyIsICAgInI0IiwgICAicjUiLCAgICJyNiIsICAg
InI3IiwgICMgN2UsIGV4Y2wgcjAKPiAgICJyOCIsICAgInI5IiwgICAicjEwIiwgICJyMTEiLCAg
InIxMiIsICAicjEzIiwgICJyMTQiLCAgInIxNSIsICMgZmYsIGV4Y2wgbm9uZQo+ICAgInIxNyIs
ICAicjE5IiwgICJyMjEiLCAgInIyMyIsICAicjI1IiwgICJyMjciLCAgInIyOSIsICAicjMxIiwg
IyBmZSwgZXhjbCByMzEKPiAgICJyMTYiLCAgInIxOCIsICAicjIwIiwgICJyMjIiLCAgInIyNCIs
ICAicjI2IiwgICJyMjgiLCAgInIzMCIsICMgZmUsIGV4Y2wgcjMwCj4gICAiP2FwIiwgICI/ZnAi
LCAgIj9zcl9mIiB9Cj4gCj4gRG8gSSBoYXZlIGl0IGJhY2t3YXJkcz8gIFdpdGggYW4gZW5kaWFu
IGlzc3VlPwoKWWVzIDotKSAgMHgwMDAwMDAwMSBpcyByZWcgMCAocjApLCAweDgwMDAwMDAwIGlz
IHJlZyAzMSAocjMwKS4KCgpTZWdoZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

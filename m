Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 98C235EF24
	for <lists+openrisc@lfdr.de>; Thu,  4 Jul 2019 00:27:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4BD8020359;
	Thu,  4 Jul 2019 00:27:06 +0200 (CEST)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTPS id CD2DB20133
 for <openrisc@lists.librecores.org>; Thu,  4 Jul 2019 00:27:04 +0200 (CEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63MQw7R011739;
 Wed, 3 Jul 2019 17:26:59 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x63MQw9k011738;
 Wed, 3 Jul 2019 17:26:58 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 3 Jul 2019 17:26:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190703222658.GD18316@gate.crashing.org>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-4-shorne@gmail.com>
 <20190703144902.GX18316@gate.crashing.org>
 <20190703214917.GB2601@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703214917.GB2601@lianli.shorne-pla.net>
User-Agent: Mutt/1.4.2.3i
Subject: Re: [OpenRISC] [PATCH v2 3/5] or1k: Add mrori option,
 fix option docs
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDY6NDk6MTdBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDk6NDk6MDJBTSAtMDUwMCwgU2VnaGVy
IEJvZXNzZW5rb29sIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6MzM6NDlQ
TSArMDkwMCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gPiA+IEBAIC0xNzksMTEgKzE4MywxMSBA
QAo+ID4gPiAgICBbKHNldCAobWF0Y2hfb3BlcmFuZDpTSSAwICJyZWdpc3Rlcl9vcGVyYW5kIiAi
PXIsciIpCj4gPiA+ICAJKHJvdGF0ZXJ0OlNJIChtYXRjaF9vcGVyYW5kOlNJIDEgInJlZ2lzdGVy
X29wZXJhbmQiICAicixyIikKPiA+ID4gIAkJICAobWF0Y2hfb3BlcmFuZDpTSSAyICJyZWdfb3Jf
dTZfb3BlcmFuZCIgInIsbiIpKSldCj4gPiA+IC0gICJUQVJHRVRfUk9SIgo+ID4gPiArICAiVEFS
R0VUX1JPUiB8fCBUQVJHRVRfUk9SSSIKPiA+ID4gICAgIkAKPiA+ID4gICAgIGwucm9yXHQlMCwg
JTEsICUyCj4gPiA+ICAgICBsLnJvcmlcdCUwLCAlMSwgJTIiCj4gPiA+IC0gIFsoc2V0X2F0dHIg
Imluc25fc3VwcG9ydCIgIiosc2hmdGltbSIpXSkKPiA+ID4gKyAgWyhzZXRfYXR0ciAiaW5zbl9z
dXBwb3J0IiAicm9yLHJvcmkiKV0pCj4gPiAKPiA+IERvZXMgdGhpcyB3b3JrPyAgSWYgeW91IHVz
ZSAtbW5vLXJvciAtbXJvcmk/ICBJdCB3aWxsIHRoZW4gYWxsb3cgZ2VuZXJhdGluZwo+ID4gYSBy
ZWcgZm9yIHRoZSBzZWNvbmQgb3BlcmFuZCwgYW5kIElDRSBsYXRlciBvbiwgYXMgZmFyIGFzIEkg
Y2FuIHNlZT8KPiAKPiBJdCBkb2VzIHNlZW0gdG8gd29yay4gIFdoeSB3b3VsZCBpdCBwcm9kdWNl
IGFuIGludGVybmFsIGNvbXBpbGVyIGVycm9yPwo+IAo+IE9uZSB0aGluZyBJIGhhdmUgaXMgUmVn
ZWN0TmVnYXRpdmUgb24gbXJvciBhbmQgbXJvcmksIHNvIC1tbm8tcm9yIHdpbGwgbm90IGJlCj4g
YWxsb3dlZCBhbmQgY2F1c2UgYW4gZXJyb3IuCgpCdXQgYm90aCBvcHRpb25zIGFyZSBvZmYgYnkg
ZGVmYXVsdCwgYW5kIG5laXRoZXIgaXMgZW5hYmxlZCBvciBkaXNhYmxlZApiYXNlZCBvbiB0aGUg
c2V0dGluZyBvZiB0aGUgb3RoZXIuCgo+IEV4YW1wbGU6IAo+IAo+ICAgICAkIGNhdCAuL2djYy90
ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3Jvci00LmMKPiAKPiAJdW5zaWduZWQgaW50IHJvdGF0
ZTYgKHVuc2lnbmVkIGludCBhKSB7Cj4gCSAgcmV0dXJuICggYSA+PiA2ICkgfCAoIGEgPDwgKCAz
MiAtIDYgKSApOwo+IAl9CgpUaGF0J3MgYSBmaXhlZCBkaXN0YW5jZSByb3RhdGUuICBNeSBxdWVz
dGlvbiBpcyB3aWxsIGl0IHdvcmsgaWYgdGhlCmRpc3RhbmNlIGlzIGEgdmFyaWFibGUuICBUaGUg
b3RoZXIgZGlyZWN0aW9uIHNob3VsZCB3b3JrIGZpbmUsIGFncmVlZC4KClNvLCBkb2VzIHJvci1b
MTJdLmMgd29yayB3aXRoIC1tcm9yaSBhbmQgbm8gLW1yb3I/ICBUaGUgcHJlZGljYXRlcyBzYXkK
dGhpcyBpbnNuIHBhdHRlcm4gaXMganVzdCBmaW5lIGluIHRoYXQgY2FzZSwgYnV0IHRoZSBjb25z
dHJhaW50cyB3aWxsCmRpc2FncmVlLgoKClNlZ2hlcgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

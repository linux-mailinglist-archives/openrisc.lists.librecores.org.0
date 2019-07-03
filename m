Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA9AD5E71F
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 16:49:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 61AAD20343;
	Wed,  3 Jul 2019 16:49:13 +0200 (CEST)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mail.librecores.org (Postfix) with ESMTPS id E9ADC20220
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 16:49:10 +0200 (CEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x63En3lX023962;
 Wed, 3 Jul 2019 09:49:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x63En2pA023961;
 Wed, 3 Jul 2019 09:49:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 3 Jul 2019 09:49:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190703144902.GX18316@gate.crashing.org>
References: <20190703033351.11924-1-shorne@gmail.com>
 <20190703033351.11924-4-shorne@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703033351.11924-4-shorne@gmail.com>
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

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMTI6MzM6NDlQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gQEAgLTE3OSwxMSArMTgzLDExIEBACj4gICAgWyhzZXQgKG1hdGNoX29wZXJhbmQ6
U0kgMCAicmVnaXN0ZXJfb3BlcmFuZCIgIj1yLHIiKQo+ICAJKHJvdGF0ZXJ0OlNJIChtYXRjaF9v
cGVyYW5kOlNJIDEgInJlZ2lzdGVyX29wZXJhbmQiICAicixyIikKPiAgCQkgIChtYXRjaF9vcGVy
YW5kOlNJIDIgInJlZ19vcl91Nl9vcGVyYW5kIiAicixuIikpKV0KPiAtICAiVEFSR0VUX1JPUiIK
PiArICAiVEFSR0VUX1JPUiB8fCBUQVJHRVRfUk9SSSIKPiAgICAiQAo+ICAgICBsLnJvclx0JTAs
ICUxLCAlMgo+ICAgICBsLnJvcmlcdCUwLCAlMSwgJTIiCj4gLSAgWyhzZXRfYXR0ciAiaW5zbl9z
dXBwb3J0IiAiKixzaGZ0aW1tIildKQo+ICsgIFsoc2V0X2F0dHIgImluc25fc3VwcG9ydCIgInJv
cixyb3JpIildKQoKRG9lcyB0aGlzIHdvcms/ICBJZiB5b3UgdXNlIC1tbm8tcm9yIC1tcm9yaT8g
IEl0IHdpbGwgdGhlbiBhbGxvdyBnZW5lcmF0aW5nCmEgcmVnIGZvciB0aGUgc2Vjb25kIG9wZXJh
bmQsIGFuZCBJQ0UgbGF0ZXIgb24sIGFzIGZhciBhcyBJIGNhbiBzZWU/CgoKU2VnaGVyCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

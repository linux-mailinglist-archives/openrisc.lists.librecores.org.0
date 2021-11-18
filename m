Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DB4E54565BF
	for <lists+openrisc@lfdr.de>; Thu, 18 Nov 2021 23:34:19 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 83A40242B9;
	Thu, 18 Nov 2021 23:34:19 +0100 (CET)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mail.librecores.org (Postfix) with ESMTPS id BC2AD242B9
 for <openrisc@lists.librecores.org>; Thu, 18 Nov 2021 23:34:17 +0100 (CET)
IronPort-SDR: jhWRD1aEXaUu96BlOKaHUj4ejbZHxGJ5xd0DVPq+zJn7QoWapye+Gr5LrSF+H8wtSjYz8ThFgr
 51gBNHLwJpRF4dn59WnMyGZfYnFwUAaxL8VCxTVmsr2jB5PrmHxKBiDzVbihjZzq2NikpEudnD
 7mpHpbvXcBGvfp/lfNqlvBVJoK/E1E0tyAu8pWtTZr6jYJPX+yEG7qL4qUKnQGsHM2nv8TtwJH
 eAPJKra+iTH48k1qI+4oFv22iyz2rualKks5CSBExRYjEcLCDCf4ynacv+CEoCUfIyvTePr2v9
 C5thyUx+PHZAEYeyyPnBUMIO
X-IronPort-AV: E=Sophos;i="5.87,246,1631606400"; d="scan'208";a="68678658"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 18 Nov 2021 14:34:16 -0800
IronPort-SDR: IV6TuigdLghxNSaZ4eEvB+unQTG8yP8qj46wF2RbGTj9cFZo9ViTgVmDvKSfSCAznOQb/ah2gc
 HCEojPH8oySPiYSbRji020G5OOOXHTtXuXr58jOP0PcUgAny7CYS6FkDYpQX9XGIoNTcyyTszu
 Zd5jaHK7+SqBZUpixDymbu0ylXhjVe4yO+2cyYbXuTaGyCxB+naN6XHaqynENyNG7rCzSyCC1T
 f2tLYK5wY8f+Zujh+enMEDoFzZJua5T0AiQqvqyqfRk+dNdLw70bWcgKHx2K9aC5JkqESw5D/n
 Nk8=
Date: Thu, 18 Nov 2021 22:34:10 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211113031639.2402161-12-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111182231450.1393807@digraph.polyomino.org.uk>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-12-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-15.mgc.mentorg.com (139.181.222.15) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v2 11/13] or1k: Build Infrastructure
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAxMyBOb3YgMjAyMSwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2NvbmZpZ3VyZS5h
YyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvY29uZmlndXJlLmFjCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kNDM5ZTdmZDUzCj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L29yMWsvY29uZmlndXJlLmFjCj4gQEAg
LTAsMCArMSw0IEBACj4gK0dMSUJDX1BST1ZJREVTIGRubCBTZWUgYWNsb2NhbC5tNCBpbiB0aGUg
dG9wIGxldmVsIHNvdXJjZSBkaXJlY3RvcnkuCj4gKyMgTG9jYWwgY29uZmlndXJlIGZyYWdtZW50
IGZvciBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrLgo+ICsKPiArYXJjaF9taW5pbXVtX2tl
cm5lbD01LjEwLjAKClRoaXMgc2VlbXMgdG8gYmUgYSBsb3QgbW9yZSByZWNlbnQgdGhhbiB3aGVu
IE9wZW5SSVNDIHN1cHBvcnQgd2FzIGFjdHVhbGx5IAphZGRlZCB0byB0aGUgTGludXgga2VybmVs
LCBhbmQgYWxzbyBtb3JlIHJlY2VudCB0aGFuIHdoZW4gNjQtYml0IHRpbWUgCnN1cHBvcnQgd2Fz
IGFkZGVkIGZvciAzMi1iaXQgYXJjaGl0ZWN0dXJlcyAod2hpY2ggbWF5IGJlIGEgY29udmVuaWVu
dCAKbWluaW11bSBrZXJuZWwgZm9yIHNvbWUgbmV3IDMyLWJpdCBhcmNoaXRlY3R1cmVzIGZvciB0
aGF0IHJlYXNvbikuICAKUmVxdWlyaW5nIGEgbmV3ZXIga2VybmVsIGxpa2UgdGhhdCBpcyBjZXJ0
YWlubHkgZmluZSBpZiBjb252ZW5pZW50IGZvciB0aGUgCnBvcnQsIGJ1dCBJIHRoaW5rIHRoZSBj
aG9pY2Ugb2YgbWluaW11bSBrZXJuZWwgdmVyc2lvbiwgYW5kIHRoZSByZWFzb25zIApmb3IgaXQs
IGRlc2VydmUgbWVudGlvbiBhdCBsZWFzdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRoZSBO
RVdTIGZpbGUgCmVudHJ5LgoKLS0gCkpvc2VwaCBTLiBNeWVycwpqb3NlcGhAY29kZXNvdXJjZXJ5
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

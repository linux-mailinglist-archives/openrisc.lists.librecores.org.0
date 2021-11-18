Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4ED845658A
	for <lists+openrisc@lfdr.de>; Thu, 18 Nov 2021 23:22:33 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 68236242C1;
	Thu, 18 Nov 2021 23:22:33 +0100 (CET)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mail.librecores.org (Postfix) with ESMTPS id E8D24242B6
 for <openrisc@lists.librecores.org>; Thu, 18 Nov 2021 23:22:30 +0100 (CET)
IronPort-SDR: JVf1fpJhLl0IsPcM/jfDxkbrjcvZqln+ufYRZJtt+IwZpgTsctw+nDwytehkKS8Z0yAaeHbpLQ
 3opVGChVvGPAcfMpzLp1GNgsSa1r2GYo8L25QGs6AUlqBky6y/1SbZ40eABjmDT95Ymx4ybo/Y
 c0lFHJOmIgruq/nmtyzR0a1O39jlyfxZ06HzBIYQjcAgbPofU8Eklo6W5wgoCLy0M+1L88Ig2O
 4c1Ay5KohBvrJrkWCfCcUXEj7wFpgkKLs0Onm/tFh3Z1THY8oCtN1f2+Ypvco55s43IPUpEflO
 qYVowFF0nwJRdq4iemF1rUCK
X-IronPort-AV: E=Sophos;i="5.87,246,1631606400"; d="scan'208";a="71160973"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 18 Nov 2021 14:22:29 -0800
IronPort-SDR: y3AhfgpzuPrIpY43uLiB80EtxkEyHS7UGGyUTiNR3DK2f7Ck0UzgG6oxI2GnHU9MFgpOnDVSPu
 MZqyMAJY6x7U1o+1723h/5dhlqAdRpDiOe7M7fHXMIZIx0Zk69pVuB/yRd7Q7+VX7zuM81rhoX
 VQhuomHS/u439XPt9J+fINgdPhU+35t1ISAuJLlIvM8O8QMIqiedBgGnXE7zYxvz3d4wg40Vrj
 VE2BxeGa3E4uj+8MqNDiY2kCTm2VonAethQDL6r4OBE3KnZuOu+3zgxV3Ok7fSFOm8PGPY59iR
 MxA=
Date: Thu, 18 Nov 2021 22:22:23 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211113031639.2402161-6-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111182219580.1393807@digraph.polyomino.org.uk>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-6-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v2 05/13] or1k: Thread Local Storage support
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
Cgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvZGwtdGxzLmggYi9zeXNkZXBzL29yMWsvZGwt
dGxzLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmYyNTY0NWM3
MTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3lzZGVwcy9vcjFrL2RsLXRscy5oCj4gQEAgLTAs
MCArMSwyNiBAQAo+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMjEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0
aW9uLCBJbmMuCgpFYWNoIGZpbGUgc2hvdWxkIGhhdmUgYSBvbmUtbGluZSBkZXNjcmlwdGlvbiBv
biB0aGUgbGluZSBiZWZvcmUgdGhlIApjb3B5cmlnaHQgbm90aWNlLgoKPiBkaWZmIC0tZ2l0IGEv
c3lzZGVwcy9vcjFrL2xpYmMtdGxzLmMgYi9zeXNkZXBzL29yMWsvbGliYy10bHMuYwo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNDM1NzE5NDRkZAo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9zeXNkZXBzL29yMWsvbGliYy10bHMuYwo+IEBAIC0wLDAgKzEsMzIgQEAK
PiArLyogQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgoK
TGlrZXdpc2UuCgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL29yMWsvc3RhY2tpbmZvLmggYi9zeXNk
ZXBzL29yMWsvc3RhY2tpbmZvLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjE0ZTc2N2M1YmYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3lzZGVwcy9vcjFrL3N0
YWNraW5mby5oCj4gQEAgLTAsMCArMSwzMyBAQAo+ICsvKiBDb3B5cmlnaHQgKEMpIDIwMjEgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCgpMaWtld2lzZS4KCj4gKy8qIERlZmF1bHQgdG8g
YW4gZXhlY3V0YWJsZSBzdGFjay4gIFBGX1ggY2FuIGJlIG92ZXJyaWRkZW4gaWYgUFRfR05VX1NU
QUNLIGlzCj4gKyAqIHByZXNlbnQsIGJ1dCBpdCBpcyBwcmVzdW1lZCBhYnNlbnQuICAqLwoKV2Ug
ZG9uJ3QgdXNlICcqJyBhdCB0aGUgc3RhcnQgb2Ygc2Vjb25kIGFuZCBzdWJzZXF1ZW50IGxpbmVz
IG9mIGNvbW1lbnRzLgoKKEl0IHNlZW1zIHVuZm9ydHVuYXRlIGZvciBhIG5ldyBwb3J0IHRvIGRl
ZmF1bHQgdG8gZXhlY3V0YWJsZSBzdGFja3MsIGJ1dCAKaXQgbG9va3MgbGlrZSB0aGlzIGlzIGlu
ZGVlZCB3aGF0IHRoZSBMaW51eCBrZXJuZWwgcG9ydCB0byBPcGVuUklTQyBkb2VzLCAKZ2l2ZW4g
dGhlIGxhY2sgb2YgYW4gb3ZlcnJpZGUgb2YgdGhlIGRlZmF1bHQgVk1fREFUQV9ERUZBVUxUX0ZM
QUdTIGFuZCAKVk1fU1RBQ0tfREVGQVVMVF9GTEFHUy4pCgotLSAKSm9zZXBoIFMuIE15ZXJzCmpv
c2VwaEBjb2Rlc291cmNlcnkuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

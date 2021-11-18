Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A30474565B9
	for <lists+openrisc@lfdr.de>; Thu, 18 Nov 2021 23:30:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5E5DD242BF;
	Thu, 18 Nov 2021 23:30:01 +0100 (CET)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mail.librecores.org (Postfix) with ESMTPS id 497F9242B1
 for <openrisc@lists.librecores.org>; Thu, 18 Nov 2021 23:29:59 +0100 (CET)
IronPort-SDR: NxoGCfC45SJrZ6mGexpgBC6PtkPZ8INvg0r94lUgbcub6S47zugNMuAxJc05TAgwTUwir2saBe
 flNY3GhzqfY4hYYWvgRQBpHNgap66sslK0NlDjVGJ/Px1dW/5zJHeUL786/w3ZNmEW78+u9A22
 +E6YdAymjk/HKCkKjteUN2c5fnJh4Kr5dxIdoOaIGdtgEqrCsJa3Lu2NsbCVudJe6RUJ9ShHoH
 6iE9VUS5pHAZGSrz8KxDDZVYDSMPrYt4q3cMflJ7rnzKi75lrHwGgWYoTw2adRX0r7fi0rjEGw
 c2u+EweC9azl9fn8qdL25NBR
X-IronPort-AV: E=Sophos;i="5.87,246,1631606400"; d="scan'208";a="68678543"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa4.mentor.iphmx.com with ESMTP; 18 Nov 2021 14:29:57 -0800
IronPort-SDR: OOUWJSSnUNDWnHbjf5PslpVt4N76BMcdOolH03b22fx8hdKDOSToBiNxd0eEwcdNbTh8NA9q8a
 FdMbctz1i9H+LviGV1kUHSsjQGNdBngkzP3sJKRemrSIczdRLzuzyJf5IY/5hYXLkY+9Dtu5hy
 HLib6ZtsZvZzmziRK2K4RcfN/TslfSK5Y7cEdhoOxmwli/rYn5pyA2hwbonaq81GnGzDqbtTPd
 qY0u0mWU0FdLzmHt/OhLJEbu4FTpKN1rmcdt38GrgiCAKO4sebVZPkjxnSHDL0PES8jM8tspj7
 K1A=
Date: Thu, 18 Nov 2021 22:29:52 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211113031639.2402161-9-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111182228580.1393807@digraph.polyomino.org.uk>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-9-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v2 08/13] or1k: Linux Syscall Interface
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
Cgo+IGRpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2FyY2gtc3lzY2Fs
bC5oIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvb3Ixay9hcmNoLXN5c2NhbGwuaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMGU2N2U1NmFiYQo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2FyY2gtc3lzY2FsbC5o
Cj4gQEAgLTAsMCArMSwzMjAgQEAKPiArLyogQVVUT0dFTkVSQVRFRCBieSB1cGRhdGUtc3lzY2Fs
bC1saXN0cy5weS4gICovCgpUaGlzIGZpbGUgc2VlbXMgdG8gYmUgbWlzc2luZyBhIGRlZmluaXRp
b24gb2YgX19OUl9wcm9jZXNzX21yZWxlYXNlLiAgTWFrZSAKc3VyZSB5b3UgcmVnZW5lcmF0ZSBp
dCB3aXRoIExpbnV4IDUuMTUsIHRoZSBjdXJyZW50IHZlcnNpb24gdXNlZCBmb3IgCnN5c2NhbGwg
bGlzdHMgaW4gZ2xpYmMuCgotLSAKSm9zZXBoIFMuIE15ZXJzCmpvc2VwaEBjb2Rlc291cmNlcnku
Y29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

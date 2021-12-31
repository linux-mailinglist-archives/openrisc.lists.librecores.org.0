Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DBA7C482574
	for <lists+openrisc@lfdr.de>; Fri, 31 Dec 2021 18:45:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 73DF624313;
	Fri, 31 Dec 2021 18:45:15 +0100 (CET)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mail.librecores.org (Postfix) with ESMTPS id 0F243235E9
 for <openrisc@lists.librecores.org>; Fri, 31 Dec 2021 18:45:12 +0100 (CET)
IronPort-SDR: 0vZoHkgQMTqa7ZI6+KS4c88Etr8I/P9lO7nitqz2v55p3eXaw+I4tWNr7UG4eiUAeZyQSsCy/9
 /Okm44ExmVbMekefU3XiXGFVN6f1Nfp4uV6O/uzZ+jXQDoxbqLhIw0kMwrGfhvRSTmmTQVaG9y
 IHf5V9g136Swx2PUeDoPhcrHUwg8MPb/FzGvAnKHwhcRRQiXSWHIk4rYy5phEKwypKWlDwhTGu
 j6JSC3DddCWKiwAYP3GfFHLgx2Czc+aQ1La1lpwDHk9bo9BYo5XGfNLHx+tww1mfu+wxtfq4y6
 bGRtI0G3cVfEhfbsfPjSqfVM
X-IronPort-AV: E=Sophos;i="5.88,252,1635235200"; d="scan'208";a="70128290"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 31 Dec 2021 09:45:11 -0800
IronPort-SDR: hdHeyoOISto8I+TKigNqPuTU9cNk8sNlMLYTb7EP5A1PWjfQrvuNcq1MjI2oHVgB9Qje0nVFiv
 3zGonbIePWEw8ICIBn4ecgVhYbpih/wMt1aT8lwpazG95U2VdpKP93HwrF4k7y8SCeQOQTHv8t
 3/fUS4Oto6WxQ+Sap+raOy0iHJ94UYXvO5Vg7OM2PyVbGx1AKm4PBwWzePMAzDWaYZg93Xo66q
 rmLGez6IEvAhmf7Ziem/cdWaFhH9OQG5LKGWfGIPx0fcsWK9vEsnxIC3u6DIwMDfwsGIg8e212
 0E4=
Date: Fri, 31 Dec 2021 17:45:05 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211229044251.2203653-11-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2112311744180.2293191@digraph.polyomino.org.uk>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-11-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v4 10/13] or1k: ABI lists
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

T24gV2VkLCAyOSBEZWMgMjAyMSwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+ICBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcjFrL2xpYm5zbC5hYmlsaXN0ICAgfCAgMTIx
ICsKCkFzIG5vdGVkIGZvciB0aGUgTG9vbmdBcmNoIHBvcnQgc3VibWlzc2lvbiwgSSBkb24ndCB0
aGluayBuZXcgcG9ydHMgc2hvdWxkIApoYXZlIGxpYm5zbCBvciBhbiBBQkkgdGVzdCBiYXNlbGlu
ZSBmb3IgaXQuCgotLSAKSm9zZXBoIFMuIE15ZXJzCmpvc2VwaEBjb2Rlc291cmNlcnkuY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

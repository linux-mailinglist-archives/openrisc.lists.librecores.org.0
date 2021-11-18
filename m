Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF93456581
	for <lists+openrisc@lfdr.de>; Thu, 18 Nov 2021 23:14:03 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0CA67242BD;
	Thu, 18 Nov 2021 23:14:00 +0100 (CET)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mail.librecores.org (Postfix) with ESMTPS id DE2A2242AE
 for <openrisc@lists.librecores.org>; Thu, 18 Nov 2021 23:13:57 +0100 (CET)
IronPort-SDR: lvZT+9TdRepkw+775QOVn//ThEyeTLGzYJB0RUji1UNsOe17ro5JZQDlDcemz0Ds2ySTYGHIyD
 0XImv6+90gRb4S0NLtJyTZEXK4T1BKoxlOAMTShDLP+K4SZ7KMhmej8ryCwr1NIT44ao5rPBU+
 y99r/cLIP9EI+UWOik5wX7DP8pMR3yR/46B0XbC5wWhXgX8xiUTJYtIZx4Yrxlpv6QCDHt/RFl
 zkm7hNuVbLUzTm4bIdzrAF/8J6qV7GZ0Z50+JVP/Et9Mv9eqBKDLusjIWMVKr1Q6eVCH65UiNv
 8R9z75tX94P8rtN983wXHbU4
X-IronPort-AV: E=Sophos;i="5.87,246,1631606400"; d="scan'208";a="71160807"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 18 Nov 2021 14:13:47 -0800
IronPort-SDR: xWCMLNSUqdmzTd837jVn5gzIlfkQZzHldZWnx3/X4Kde6FcWEIwFkHhFyPt7pEG74S3AXMljxN
 H0d5FcPfG/kfcfqLXzpT0p8V+qWoiT+UDqsHcsCeCcqGJOAb7WgXQ8kC3LasUU8ut7a4rQ9Mx1
 nP7lC4KS39pMGxflUQzE+RWhvt/bLLVZ7VIokc1nIx6JmdFzbehvpW+/aEolNbVd+pLt4j4sO1
 5eQavxsmc3RvQI0TeyoQaeyFyToGfGldOe7XZbTi7ttxXDX8ECmwiOMyvxJdrc254XMEQO4T0b
 7AA=
Date: Thu, 18 Nov 2021 22:13:41 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20211113031639.2402161-4-shorne@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2111182213000.1393807@digraph.polyomino.org.uk>
References: <20211113031639.2402161-1-shorne@gmail.com>
 <20211113031639.2402161-4-shorne@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-13.mgc.mentorg.com (139.181.222.13) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v2 03/13] or1k: ABI Implementation
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
Cgo+ICsvKiBIZWxwZXIgZm9yIGdlbmVyaWMgX19fX2xvbmdqbXBfY2hrKCkuICovCgpEb24ndCB1
c2UgKCkgYWZ0ZXIgYSBmdW5jdGlvbiBuYW1lIGp1c3QgdG8gaW5kaWNhdGUgaXQncyBhIGZ1bmN0
aW9uLCBhcyAKb3Bwb3NlZCB0byBhIGZ1bmN0aW9uIGNhbGwgd2l0aCBubyBhcmd1bWVudHMgKHNl
ZSB0aGUgR05VIENvZGluZyAKU3RhbmRhcmRzKS4KCi0tIApKb3NlcGggUy4gTXllcnMKam9zZXBo
QGNvZGVzb3VyY2VyeS5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

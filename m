Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F2AE0474E08
	for <lists+openrisc@lfdr.de>; Tue, 14 Dec 2021 23:44:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AC7E9242E6;
	Tue, 14 Dec 2021 23:44:00 +0100 (CET)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mail.librecores.org (Postfix) with ESMTPS id 98D5422D3C
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 23:43:57 +0100 (CET)
IronPort-SDR: UDWlbkcvuHrHGIsi4hp+uTJZfkhANIIFviu4/RIYDw0HdsQZ9oyDlq0g1khEyev/7k3+ePZB6r
 RNowaIEDsMJkdGntsJQJgLwd0RDcE2Q5Tv7y5MuPG/NI9kWI/yGWoF22Bf3IqCShkMEYmr/Dpp
 LbdqLkyTXAGuItFS5/tWMD/6q5ZoC2j9QxGv2NtoVQv0bxKgB4Un9gsKB42l29LuZ0/gFLmkaJ
 MC52Uh+ElYrvPRbJvA1N659KIyvDDBpJHpcHdM+qTOlls38LDEeMiiIH1tAdz/IpRV6Z4oN8wL
 yDxYizAfzFykvxS+yyQbFHoB
X-IronPort-AV: E=Sophos;i="5.88,206,1635235200"; d="scan'208";a="69704643"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 14 Dec 2021 14:43:55 -0800
IronPort-SDR: UTbVc154CE/MEuqLPrwvMVGarZr83rjCNlMaCxmdNtosfNgC7mjnjHGPVIsFcxGngz394GQ3l5
 xNxQ8nKMtECcN4y+OslDku1HTcYmXAqCDxSnVgf2NAzu4QLF632ovZzZkny37nCdWysPz08GvD
 LMuU0cqhmRstddrUuJlzF6qLkHbG7rN49zCVpoJJgBIFKRSOwm2RJGXa30+B6cVnahxoVWBT/k
 Jle5IXcAoZiy/OI5fR2orN/ScMhsit/A6L9zEYzMDS0j26KomU2Wv4u3HbHweatKkMrasTQYd+
 iRU=
Date: Tue, 14 Dec 2021 22:43:50 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <a0644ab7-85a5-e22d-607e-4e6761d87610@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2112142242120.1558178@digraph.polyomino.org.uk>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-4-shorne@gmail.com>
 <a0644ab7-85a5-e22d-607e-4e6761d87610@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Subject: Re: [OpenRISC] [PATCH v3 03/13] or1k: ABI Implementation
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

T24gVHVlLCAxNCBEZWMgMjAyMSwgQWRoZW1lcnZhbCBaYW5lbGxhIHZpYSBMaWJjLWFscGhhIHdy
b3RlOgoKPiAraWYgdGVzdCAieCRwcm9maWxlIiAhPSB4bm87IHRoZW4KPiArICBpZiB0ZXN0ICJ4
JHdpdGhfcHJvZmlsZSIgPT0geG5vOyB0aGVuCj4gKyAgICBBQ19NU0dfRVJST1IoW0FCSSBkb2Vz
IG5vdCBzdXBwb3J0IHByb2ZpbGluZ10pCgpVc2luZyA9PSBpbiB0ZXN0IGlzIGEgYmFzaGlzbS4K
CkknZCBleHBlY3Qgc3VjaCBhIGNoYW5nZSB0byByZXF1aXJlIHRoZSBidWlsZC1tYW55LWdsaWJj
cy5weSBjb25maWd1cmF0aW9uIApmb3IgT3BlblJJU0MgdG8gdXNlIC0tZGlzYWJsZS1wcm9maWxl
LgoKLS0gCkpvc2VwaCBTLiBNeWVycwpqb3NlcGhAY29kZXNvdXJjZXJ5LmNvbQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

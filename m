Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76AF93EF4F9
	for <lists+openrisc@lfdr.de>; Tue, 17 Aug 2021 23:29:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9100B2409F;
	Tue, 17 Aug 2021 23:29:23 +0200 (CEST)
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mail.librecores.org (Postfix) with ESMTPS id 2CC7B2409F
 for <openrisc@lists.librecores.org>; Tue, 17 Aug 2021 00:33:06 +0200 (CEST)
IronPort-SDR: LtxVlOhi/eNsT0oy5OIOIMUJikMNpEqEyQXad6VHZDOSbz8idPbwipXB90aVYNluaB7EHtNEaP
 mP3TSwaHg2Lmo5CfZ/+bQZoLhpcBgGhh068cHj1hE/WK2deF8FOwdZvHt0qLci5Yq8kaCjTVvD
 vDtbps2qrinhFgEu4xJ4RplnccpmxVwa+BiToMZvwMV1vGVeMijoc4G52ix02vpVJVjxgQ6GzT
 vu0kxZrWj5a1aa/8sqlZIvFxVvBo8U3DEgBPTont8qM+Km/HgWjiE8ueO64f6/hN1cFFwjDnYi
 ftcbMKrlshjIgs3hrsQvcUME
X-IronPort-AV: E=Sophos;i="5.84,327,1620720000"; d="scan'208";a="64751122"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2021 14:33:04 -0800
IronPort-SDR: +4vJYsUsmpmenL0/N9E+IP5/3SbGF/DdApkg2WWWwCPdYDvTlX27kKFLYfa6upUyWzWFW++P+5
 xgEwuaHQoUO+1Ju64IIdkjWPohLPPYrx8GMdzOfrtdUiSFlz7ZgDhe2W+rvNEzkOIRph9k12Ra
 y3sa9Xk9iT8Qk9LMYvalZz3Nw01b7nT5tH5k1RDAQL+bLFJ8jHc2GxBvhMi342T8tgiv/oFhIr
 3FhAYzMfHeMKpvf2Eph9FGpnilkUGypmI01JENq5Wuecj+jS99VlI22whC4QFhFP3HdPCQeUyj
 upo=
Date: Mon, 16 Aug 2021 22:32:59 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <YRrenWZeh103h3zX@antec>
Message-ID: <alpine.DEB.2.22.394.2108162231010.136350@digraph.polyomino.org.uk>
References: <20210806094217.3227877-1-shorne@gmail.com>
 <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org> <YRhCqNWB1MC++TAO@antec>
 <alpine.DEB.2.22.394.2108161710590.136350@digraph.polyomino.org.uk>
 <YRrenWZeh103h3zX@antec>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-Mailman-Approved-At: Tue, 17 Aug 2021 23:29:22 +0200
Subject: Re: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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

T24gVHVlLCAxNyBBdWcgMjAyMSwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+IFNob3VsZCB3ZSBwcm92aWRlIF9fS0VSTkVMX09MRF9USU1FVkFMX01BVENIRVNfVElNRVZB
TDY0IGZvciBub3QgbGludXggYnVpbGRzLAo+IG9yIHJlbW92ZSBfX0tFUk5FTF9PTERfVElNRVZB
TF9NQVRDSEVTX1RJTUVWQUw2NCBmcm9tIHRoZSBpdGltZXIgdGVzdCBhZ2Fpbj8KPiBUaGUgcmVh
c29uIGZvciB1c2luZyBfX0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2NCBpcyB0
byBwaWNrIHVwIHRoZQo+IHRpbWV2YWwgc2l6ZSB3aGljaCBpcyBkaWZmZXJlbnQgb24gZWFjaCBh
cmNoaXRlY3R1cmUuCgpJJ2Qgc3VnZ2VzdCBoYXZpbmcgYSBtYWNybyB0aGF0IGRvZXNuJ3QgcmVm
ZXIgdG8gZWl0aGVyICJrZXJuZWwiIG9yICJvbGQgCnRpbWV2YWwiIChhbmQgdGhhdCBpcyBkZWZp
bmVkIGZvciBib3RoIExpbnV4IGFuZCBIdXJkKS4gIEFzIGZhciBhcyBJIAp1bmRlcnN0YW5kLCB0
aGUgbG9naWNhbCBjb25jZXB0IHRoYXQncyByZWxldmFudCBmb3IgdGhpcyB0ZXN0IGlzbid0IGVp
dGhlciAKb25lIG9mIHRob3NlLCBpdCdzIG1vcmUgbGlrZSAic2V0aXRpbWVyIHN1cHBvcnRzIHRp
bWVzIHRoYXQgY2Fubm90IGJlIApyZXByZXNlbnRlZCBpbiAzMiBiaXRzIi4KCi0tIApKb3NlcGgg
Uy4gTXllcnMKam9zZXBoQGNvZGVzb3VyY2VyeS5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

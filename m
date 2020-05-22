Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DFF8D1E5058
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ADD0D20CE9;
	Wed, 27 May 2020 23:19:48 +0200 (CEST)
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mail.librecores.org (Postfix) with ESMTPS id E765620B65
 for <openrisc@lists.librecores.org>; Sat, 23 May 2020 00:05:33 +0200 (CEST)
IronPort-SDR: Fyuid4yhLlH02JRwWjINpadYXqjcl4Gi6CsrM+J4oqE5hz6WnSWl77gCke2tXayxRf6TtGeLpc
 iekCBO5mHh2IEgx8DNZ7vHk8O+YIy7Kosn4IuKRHTU7wDUHWvY/pJytm8vLLsHuzalFu308Gzi
 /p4dsbkTrqPXRj5/rxM9kWbqcijUXdw4xbZjSN0ic3w20QGCFDY088SCnaMoqkrtfoO0nl2yzL
 xxWo1EFf1qgWA7+yde65Dr9KGbAXNzYo2Q242eM0I10wwsqerO4Q+D30ec7dfTHF+i9H+DEfyi
 CBQ=
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; d="scan'208";a="51164819"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 22 May 2020 14:05:32 -0800
IronPort-SDR: /IYhNfl+ie2O/uu6W2oog387FGq+N7z3/z81VdVJJsLs5g2QyFPnNcZyfaQ+BUqo1WltCju9pp
 yH16RlGJdiU2fnX2SU/nrTpp8iF4kWpgODyaN3rT5/THQ13APL3fYqjNo3WfupG+1hIoilHnPl
 0IyNn1NqCVznPa1sEE6kSosR8d6wavtGuQdppnnPfT/4Mm6Jfn36ydXIJli51ZYY54gGjfKdsj
 R5CxOZ+PEdeVxjgekIfOPbR0MwtzrnyjPb3txfRuHNQ4z0BCEH58hZADYs8ExLXqc9yoZyJ+94
 8AE=
Date: Fri, 22 May 2020 22:02:54 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Stafford Horne <shorne@gmail.com>
In-Reply-To: <20200522215953.GC75760@lianli.shorne-pla.net>
Message-ID: <alpine.DEB.2.21.2005222201450.10437@digraph.polyomino.org.uk>
References: <20200522113633.209664-1-shorne@gmail.com>
 <20200522113633.209664-2-shorne@gmail.com>
 <87eerc3z7b.fsf@oldenburg2.str.redhat.com>
 <20200522215953.GC75760@lianli.shorne-pla.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH 1/1] Initial support for OpenRISC
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Christian Svensson <blue@cmd.nu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAyMyBNYXkgMjAyMCwgU3RhZmZvcmQgSG9ybmUgdmlhIExpYmMtYWxwaGEgd3JvdGU6
Cgo+IEZvciBiaW51dGlscyBhbmQgZ2NjIHJlcXVpcmUgcGF0Y2hlcyB3aGljaCBhcmUgbWVudGlv
bmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIuCj4gSSB3aWxsIGRvY3VtZW50LgoKSW4gbXkgdmlldyB0
aGUgY2hhbmdlcyBuZWVkIHRvIGJlIHVwc3RyZWFtIGJlZm9yZSB0aGUgcGF0Y2ggY2FuIGdvIGlu
dG8gCmdsaWJjLiAgV2Ugd2FudCB0byBhdm9pZCB0aGUgbWVzcyB3ZSBoYWQgd2l0aCBNaWNyb0Js
YXplIHdoZXJlIHRoZSBwb3J0IAp0dXJuZWQgb3V0IHRvIGRlcGVuZCBvbiBHQ0MgcGF0Y2hlcyB0
aGF0IGhhZG4ndCB5ZXQgYmVlbiB1cHN0cmVhbWVkLgoKLS0gCkpvc2VwaCBTLiBNeWVycwpqb3Nl
cGhAY29kZXNvdXJjZXJ5LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

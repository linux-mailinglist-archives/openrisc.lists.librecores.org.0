Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4705232D1FC
	for <lists+openrisc@lfdr.de>; Thu,  4 Mar 2021 12:49:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BB7F1211C9;
	Thu,  4 Mar 2021 12:49:43 +0100 (CET)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mail.librecores.org (Postfix) with ESMTPS id BC111209D8
 for <openrisc@lists.librecores.org>; Thu,  4 Mar 2021 12:12:34 +0100 (CET)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lHluD-0005iN-Ln; Thu, 04 Mar 2021 12:12:33 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1lHluB-0006m2-Fd; Thu, 04 Mar 2021 12:12:31 +0100
Date: Thu, 4 Mar 2021 12:12:31 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20210304111231.GB12944@pengutronix.de>
References: <20210303201904.3509658-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303201904.3509658-1-shorne@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:12:23 up 14 days, 14:36, 80 users,  load average: 0.28, 0.27, 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openrisc@lists.librecores.org
X-Mailman-Approved-At: Thu, 04 Mar 2021 12:49:41 +0100
Subject: Re: [OpenRISC] [PATCH] openrisc: Define the elf binary entry point
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
Cc: Barebox <barebox@lists.infradead.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBNYXIgMDQsIDIwMjEgYXQgMDU6MTk6MDRBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gRW50cnkgaXMgdXNlZCBieSBxZW11IHRvIGZpbmQgd2hlcmUgdG8gc3RhcnQgYm9v
dGluZywgd2UgZGVmaW5lCj4gdGhpcyB0byB0aGUgMHgxMDAgcmVzZXQgdmVjdG9yIGFzIGlzIGRv
bmUgYnkgZGVmYXVsdCB3aGVuIHRoZSBDUFUKPiByZXNldHMuICBUaGlzIGZpeGVzIHRoZSBxZW11
IGJvb3QgaXNzdWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBn
bWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvb3BlbnJpc2MvY3B1L2JhcmVib3gubGRzLlMgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpBcHBsaWVkLCB0aGFua3MKClNhc2No
YQoKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9jcHUvYmFyZWJveC5sZHMuUyBiL2Fy
Y2gvb3BlbnJpc2MvY3B1L2JhcmVib3gubGRzLlMKPiBpbmRleCBhZGIwYzIyZjguLjQ1YzVmMjU1
MyAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL2NwdS9iYXJlYm94Lmxkcy5TCj4gKysrIGIv
YXJjaC9vcGVucmlzYy9jcHUvYmFyZWJveC5sZHMuUwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICNp
bmNsdWRlIDxhc20tZ2VuZXJpYy9iYXJlYm94Lmxkcy5oPgo+ICAKPiAgT1VUUFVUX0ZPUk1BVCgi
ZWxmMzItb3IxayIsICJlbGYzMi1vcjFrIiwgImVsZjMyLW9yMWsiKQo+ICtFTlRSWShfX3Jlc2V0
KQo+ICBfX0RZTkFNSUMgID0gIDA7Cj4gIAo+ICBNRU1PUlkKPiAtLSAKPiAyLjI2LjIKPiAKPiAK
Ci0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAg
ICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNoZWlt
LCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAg
fApBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5
LTUxMjEtMjA2OTE3LTU1NTUgfApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

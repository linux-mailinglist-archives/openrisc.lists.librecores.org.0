Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B5624A5C00
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 20:01:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 57B0E20553;
	Mon,  2 Sep 2019 20:01:45 +0200 (CEST)
Received: from smtp29.i.mail.ru (smtp29.i.mail.ru [94.100.177.89])
 by mail.librecores.org (Postfix) with ESMTPS id A513D20199
 for <openrisc@lists.librecores.org>; Mon,  2 Sep 2019 20:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Subject:In-Reply-To:References:Cc:To:From:Message-ID;
 bh=jIcdMxjzuhRtC8lIxh0aojPMaAehFCQqaNCGPMUuRRo=; 
 b=nfvtjM7kMZMRWdIbggYEnMMPOzJwUufbPSudBaZLmxf0FCsCS0++ZbVrY4Gkr2BZin/jIpa8VEYZ/wPf7N5eJAGtI0zD1qXc+Ms8Yl3w0mXWQPATGw3cDbplYYqQnWij+jM5dCLXPd5787LPa7oxt9GaR0JqZHARg2HMTCb/OYY=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1i4qe6-0002PM-Jz; Mon, 02 Sep 2019 21:01:42 +0300
Message-ID: <28B006D9DDD5477CB7AA012671DB30F8@BAndViG>
From: "BAndViG" <bandvig@mail.ru>
To: "Stafford Horne" <shorne@gmail.com>
References: <20190831030348.6920-1-shorne@gmail.com>
 <20190831030348.6920-3-shorne@gmail.com>
In-Reply-To: <20190831030348.6920-3-shorne@gmail.com>
Date: Mon, 2 Sep 2019 21:01:39 +0300
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
Importance: Normal
X-Mailer: Microsoft Windows Live Mail 15.4.3555.308
X-MimeOLE: Produced By Microsoft MimeOLE V15.4.3555.308
Authentication-Results: smtp29.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-77F55803: 3FFC80838138E3AB5A78504BD2AC29416D9652E28B35B19727512D7757F0113E11C8CD6588CEFCDE00010668A566AECB
X-7FA49CB5: 0D63561A33F958A575E235A431820D2A3FA0493C9C305323ED555BF0B001F7548941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249E5E764EB5D94DBD43AA81AA40904B5D9CF19DD082D7633A093541453170D46FCD81D268191BDAD3D78DA827A17800CE718289BE68BFB5189EC76A7562686271E2C335E01E33B772C089D37D7C0E48F6C8AA50765F7900637E2F754CEE4CCB3346F916FE947544D96089D37D7C0E48F6C5571747095F342E857739F23D657EF2B6825BDBE14D8E702ABEDDA51113D120200306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF1C1A80A4E7A7BCAD75E2B6A7996D91B05BAC7ED26ADC4723496707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
X-Mras: OK
Subject: Re: [OpenRISC] [PATCH 2/2] or1k: dts: Add ethoc device to SMP
 devicetree
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
Cc: openrisc@lists.librecores.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gQWxsLgpJJ3ZlIHBvcnRlZCB0aGVzZSBldGhlcm5ldCBkZXNjcmlwdGlvbiBmb3IgbXkg
QXRseXMtYmFzZWQgU29DLiBQcmlvciB0byBpdCAKTGludXggd2VyZSBub3QgYWJsZSBldmVuIHRv
IGRldGVjdCBNYXJ2ZWxsJ3MgUEhZLiBXaXRoIHRoZSBtb2RpZmljYXRpb25zIApNYXJ2ZWxsJ3Mg
UEhZIGlzIGRldGVjdGVkIGNvcnJlY3RseS4gSG93ZXZlciwgSSBzdGlsbCBjYW4gbm90ICB1c2Ug
ZXRoZXJuZXQgCmNvbm5lY3Rpb24uIEZvciBleGFtcGxlLCBJZiBJIHRyeSB0byBleGVjdXRlICJw
aW5nIHtpcC1vZi1teS1wY30iIGl0IHJlcG9ydHMgCiJuZXQgZXRoMDogVFg6IGNhcnJpZXIgc2Vu
c2UgbG9zdCIuIFBlcmhhcHMsIEkgaGF2ZSB0byBjb25maWd1cmUgY29ycmVjdGx5IE1ESU8gCmJ1
cyBhbmQgUEhZIGl0c2VsZi4gSGF2ZSBhbnlib2R5IGdvdCBhbiByZWNvbW1lbmRhdGlvbj8KCldC
UgpBbmRyZXkKCi0tLS0t0JjRgdGF0L7QtNC90L7QtSDRgdC+0L7QsdGJ0LXQvdC40LUtLS0tLSAK
RnJvbTogU3RhZmZvcmQgSG9ybmUKU2VudDogU2F0dXJkYXksIEF1Z3VzdCAzMSwgMjAxOSA2OjAz
IEFNClRvOiBMS01MCkNjOiBNYXJrIFJ1dGxhbmQgOyBKb25hcyBCb25uIDsgZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcgOyBSb2IgSGVycmluZyA7IApvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpTdWJqZWN0OiBbT3BlblJJU0NdIFtQQVRDSCAyLzJdIG9yMWs6IGR0czogQWRkIGV0aG9j
IGRldmljZSB0byBTTVAgZGV2aWNldHJlZQoKVGhpcyBwYXRjaCBhZGRzIHRoZSBldGhvYyBkZXZp
Y2UgY29uZmlndXJhdGlvbiB0byB0aGUgT3BlblJJU0MgYmFzaWMgU01QCmRldmljZSB0cmVlIGNv
bmZpZy4gIFRoaXMgd2FzIHRlc3RlZCB3aXRoIHFlbXUuCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9y
ZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCmFyY2gvb3BlbnJpc2MvYm9vdC9kdHMvc2lt
cGxlX3NtcC5kdHMgfCA2ICsrKysrKwoxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9ib290L2R0cy9zaW1wbGVfc21wLmR0cyAKYi9hcmNo
L29wZW5yaXNjL2Jvb3QvZHRzL3NpbXBsZV9zbXAuZHRzCmluZGV4IGRlZmJiOTI3MTRlYy4uNzFh
ZjBlMTE3YmZlIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2Jvb3QvZHRzL3NpbXBsZV9zbXAu
ZHRzCisrKyBiL2FyY2gvb3BlbnJpc2MvYm9vdC9kdHMvc2ltcGxlX3NtcC5kdHMKQEAgLTYwLDQg
KzYwLDEwIEBACiAgY2xvY2stZnJlcXVlbmN5ID0gPDIwMDAwMDAwPjsKICB9OwoKKyBlbmV0MDog
ZXRob2NAOTIwMDAwMDAgeworIGNvbXBhdGlibGUgPSAib3BlbmNvcmVzLGV0aG9jIjsKKyByZWcg
PSA8MHg5MjAwMDAwMCAweDgwMD47CisgaW50ZXJydXB0cyA9IDw0PjsKKyBiaWctZW5kaWFuOwor
IH07Cn07Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C36CC32B886
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 15:15:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C9DD202FD;
	Wed,  3 Mar 2021 15:15:46 +0100 (CET)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mail.librecores.org (Postfix) with ESMTPS id C6A9E2120D
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 15:03:11 +0100 (CET)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lHS5n-0006xF-91; Wed, 03 Mar 2021 15:03:11 +0100
To: Stafford Horne <shorne@gmail.com>, Barebox <barebox@lists.infradead.org>
References: <20210303135026.3450789-1-shorne@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <57222afc-9d92-e52d-34d4-0737eff1ec82@pengutronix.de>
Date: Wed, 3 Mar 2021 15:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303135026.3450789-1-shorne@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openrisc@lists.librecores.org
X-Mailman-Approved-At: Wed, 03 Mar 2021 15:15:44 +0100
Subject: Re: [OpenRISC] [PATCH 0/4] OpenRISC fixes and setjmp/longjmp work
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
Cc: s.hauer@pengutronix.de, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gU3RhZmZvcmQsCgpPbiAwMy4wMy4yMSAxNDo1MCwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gVGhlc2UgYXJlIHRoZSBwYXRjaGVzIEkgY2FtZSB1cCB3aXRoIHRvIGdl
dCB0aGUgc2V0am1wL2xvbmdqbXAgcm91dGluZXMgdG8gd29yawo+IG9uIE9wZW5SSVNDLiAgSXQg
c2VlbXMgdG8gYmUgd29ya2luZyB3ZWxsLgo+IAo+IFRoZSBwYXRjaGVzIGFyZSBvbiBnaXRodWIg
aGVyZToKPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vYmFyZWJveC90cmVlL29wZW5y
aXNjLWJ0aHJlYWQKPiAKPiBJIGhhZCB0byByZXZlcnQgYSBjb21taXQgdG8gcmVtb3ZlIG9wZW5y
aXNjIHRvIGRvIHRoaXMgd29yaywgSSBob3BlIHRoYXQgY2FuIGJlCj4gcmV2ZXJ0ZWQuCgpHcmVh
dC4gVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUhCkNvdWxkIHRoaXMgYmUgdGVzdGVkIG9uIHFl
bXUtc3lzdGVtLW9yMWs/IElmIHNvLCBpdCB3b3VsZCBiZSBncmVhdCB0byBoYXZlIHRoaXMKZG9j
dW1lbnRlZCBpbi10cmVlLCBzbyBmdXR1cmUgY2hhbmdlcyBjb3VsZCBiZSB0ZXN0ZWQuCgpDaGVl
cnMsCkFobWFkCgo+IAo+IFRlc3Qgb3V0cHV0Ogo+IAo+ICAgICBiYXJlYm94QG9yMWtzaW06LyBi
dGhyZWFkIC12Cj4gICAgIGJ0aHJlYWRfcHJpbnRlciB5aWVsZCAjMQo+ICAgICBidGhyZWFkX3By
aW50ZXIgeWllbGQgIzIKPiAgICAgYnRocmVhZF9wcmludGVyIHlpZWxkICMzCj4gICAgIGJ0aHJl
YWRfcHJpbnRlciB5aWVsZCAjNAo+ICAgICAzNjQ0MSBidGhyZWFkIHlpZWxkIGNhbGxzIGluIDFz
Cj4gICAgIGJhcmVib3hAb3Ixa3NpbTovIGJ0aHJlYWQgLXYKPiAgICAgYnRocmVhZF9wcmludGVy
IHlpZWxkICMxCj4gICAgIGJ0aHJlYWRfcHJpbnRlciB5aWVsZCAjMgo+ICAgICBidGhyZWFkX3By
aW50ZXIgeWllbGQgIzMKPiAgICAgYnRocmVhZF9wcmludGVyIHlpZWxkICM0Cj4gICAgIDM2NTA0
IGJ0aHJlYWQgeWllbGQgY2FsbHMgaW4gMXMKPiAgICAgYmFyZWJveEBvcjFrc2ltOi8gYnRocmVh
ZAo+IAo+ICAgICBidGhyZWFkIC0gcHJpbnQgaW5mbyBhYm91dCByZWdpc3RlcmVkIGJ0aHJlYWRz
Cj4gCj4gICAgIHByaW50IGluZm8gYWJvdXQgcmVnaXN0ZXJlZCBiYXJlYm94IHRocmVhZHMKPiAK
PiAgICAgT3B0aW9uczoKPiAJICAgIC1pICAgICAgUHJpbnQgaW5mb3JtYXRpb24gYWJvdXQgcmVn
aXN0ZXJlZCBidGhyZWFkcwo+IAkgICAgLXQgICAgICBtZWFzdXJlIGhvdyBtYW55IGJ0aHJlYWRz
IHdlIGN1cnJlbnRseSBydW4gaW4gMXMKPiAJICAgIC1jICAgICAgY291bnQgbWF4aW11bSBjb250
ZXh0IHN3aXRjaGVzIGluIDFzCj4gCSAgICAtdiAgICAgIHZlcmlmeSBjb3JyZWN0IGJ0aHJlYWQg
b3BlcmF0aW9uCj4gCj4gICAgIGJhcmVib3hAb3Ixa3NpbTovIGJ0aHJlYWQgLWMKPiAgICAgYnRo
cmVhZCAtYwo+ICAgICAyNjk1MzYgYnRocmVhZCBjb250ZXh0IHN3aXRjaGVzIHBvc3NpYmxlIGlu
IDFzCj4gCj4gU3RhZmZvcmQgSG9ybmUgKDQpOgo+ICAgb3BlbnJpc2M6IFVzZSBtb3ZoaSB0byB6
ZXJvIHJlZ2lzdGVycwo+ICAgb3BlbnJpc2M6IEFkZCBnaXRpZ25vcmUgZm9yIGR0YiBmaWxlcwo+
ICAgb3BlbnJpc2M6IEFkZCBsaW5rYWdlLmgKPiAgIG9wZW5yaXNjOiBJbXBsZW1lbnQgc2V0am1w
L2xvbmdqbXAvaW5pdGptcAo+IAo+ICBhcmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgICAg
ICB8ICAxICsKPiAgYXJjaC9vcGVucmlzYy9jcHUvc3RhcnQuUyAgICAgICAgICAgfCAgNiArKy0t
Cj4gIGFyY2gvb3BlbnJpc2MvZHRzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwo+ICBhcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL2xpbmthZ2UuaCB8ICA3ICsrKysKPiAgYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9zZXRqbXAuaCAgfCAxNyArKysrKysrKysKPiAgYXJjaC9vcGVucmlzYy9saWIv
TWFrZWZpbGUgICAgICAgICAgfCAgMSArCj4gIGFyY2gvb3BlbnJpc2MvbGliL3NldGptcC5TICAg
ICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNyBmaWxlcyBjaGFu
Z2VkLCA4NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9vcGVucmlzYy9kdHMvLmdpdGlnbm9yZQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9vcGVucmlzYy9pbmNsdWRlL2FzbS9saW5rYWdlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc2V0am1wLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvb3BlbnJpc2MvbGliL3NldGptcC5TCj4gCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVy
d2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRy
b25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwg
UGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJB
IDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

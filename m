Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7224A1CB8A4
	for <lists+openrisc@lfdr.de>; Fri,  8 May 2020 21:53:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 10A1320B06;
	Fri,  8 May 2020 21:53:09 +0200 (CEST)
Received: from smtp60.i.mail.ru (smtp60.i.mail.ru [217.69.128.40])
 by mail.librecores.org (Postfix) with ESMTPS id 30F31202E3
 for <openrisc@lists.librecores.org>; Fri,  8 May 2020 21:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=vBI9QbyMJJce/NhjQOz/xXaQHD4QJDPaIPp7I//v+kE=; 
 b=epT8mJvI8PN7ewwsKdt5PIStFmUvJUFXpl9RFvBI4JJXkv2X4IMygHk8IG2GiY5jB+7isOqeRUHa4yfiX40KVEz1Frre2RPZZIQQwtdLA90mq41b9s+JdS4O0fS4Qqp4MG+vYSRjjfKz/l7pZ/LzPfSvnQR1lHySRRsY9DI77fo=;
Received: by smtp60.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1jX93S-0006NE-Dq; Fri, 08 May 2020 22:53:06 +0300
To: Stafford Horne <shorne@gmail.com>, Openrisc <openrisc@lists.librecores.org>
References: <20200506220323.GB2550@lianli.shorne-pla.net>
From: Andrey Bacherov <bandvig@mail.ru>
Message-ID: <652e3bb7-93aa-4310-e798-2258b00300af@mail.ru>
Date: Fri, 8 May 2020 22:53:05 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200506220323.GB2550@lianli.shorne-pla.net>
Content-Language: en-US
Authentication-Results: smtp60.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9790EF91ABD66AC66CFCDB32783759D09A0AB88C32690E60B182A05F5380850406A5D1D18785C2C437C85F3AEE3A53C7CE742756B6E2FF439F0ED584CD4233DC3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72AC9FB60380F23AEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063790B55F3E386DB9B28638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FCEEA4102C2F4775314ACD596398241505DB95FCCB1678F9FB389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947C5149A672E96B27E1AD7EC71F1DB884274AD6D5ED66289B5218080C068C56568E6136E347CC761E07725E5C173C3A84C3AFAB59EE9EDCBB1CBA3038C0950A5D36B5C8C57E37DE458B0B4866841D68ED3522CA9DD8327EE4931B544F03EFBC4D57BCC85A7874001769C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojXfUNyb2JlUbZ2h9QuvDgKw==
X-Mailru-Internal-Actual: A:0.82352461190706
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF110EE7E23484F2C927C85F3AEE3A53C7CA0652EAE10B7A9D096707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
X-Mras: Ok
Subject: Re: [OpenRISC] OpenRISC: User mode writing to FPCSR
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGVsbG8gU3RhZmZvcmQsCgpJIGFncmVlIHdpdGggeW91ciBwcm9wb3NhbCAoMSkuCkl0IGxvb2tz
IHJlYXNvbmFibGUuCgpBbmRyZXkKCj4gSGVsbG8sCj4gCj4gTm93IHRoYXQgSSBhbSB3cml0aW5n
IHRoaXMgZW1haWwsIEkgcHJvYmFibHkgc2hvdWxkIGJlIHdyaXRpbmcgYSBzcGVjCj4gY2hhbmdl
IHByb3Bvc2FsIChodHRwczovL29wZW5yaXNjLmlvL2FyY2hpdGVjdHVyZSkuCj4gCj4gQW55d2F5
LCAgd2hpbGUgd29ya2luZyBvbiB0aGUgZ2xpYmMgcG9ydCBmb3IgT3BlblJJU0MgSSBmaW5kIHRo
YXQgcHJldHR5IG11Y2gKPiBldmVyeSBhcmNoaXRlY3R1cmUgYWxsb3dzIHJlYWRpbmcgYW5kIHdy
aXRpbmcgdG8gdGhlIGZsb2F0aW5nIHBvaW50IGNvbnRyb2wKPiByZWdpc3RlciAoaW4gb3BlblJJ
U0MgRlBDU1IpIGluIHVzZXJsYW5kLiAgVGhpcyBpcyB1c2VkIGJ5IHVzZXJsYW5kIHRvIGNvbnRy
b2wKPiB0aGUgcm91bmRpbmcgbW9kZSBhbmQgZXhjZXB0aW9uIHJlYWRpbmcgYW5kIGNvbnRyb2xs
aW5nIG9mIHRoZSBGUFUuCj4gCj4gSG93ZXZlciwgb24gT3BlblJJU0MgdGhpcyBpcyBvbmx5IHdy
aXRhYmxlIGluIHN1cGVydmlzb3IgbW9kZS4gIFdlIGNhbiByZWFkIGl0Cj4gYnkgZW5hYmxpbmcg
YSBmbGFnIGluIHRoZSBTUi4gIEJ1dCBub3Qgd3JpdGUgdG8gaXQuCj4gCj4gSSBwcm9wb3NlIHRo
YXQgd2UgZWl0aGVyOgo+IAo+ICAgIDEuIEFsbG93IGJvdGggcmVhZCBhbmQgd3JpdGUgdG8gRlBD
U1IgaXMgU1JbU1VNUkFdIGlzIHNldC4gKHByZWZlcnJlZCkKPiAgICAyLiBDcmVhdGUgYSBuZXcg
ZmxhZyBpbiBTUiB0byBlbmFibGUgRlBDU1Igd3JpdGluZy4KPiAKPiBUaGlzIHdpbGwgcmVxdWly
ZSBjaGFuZ2VzIHRvOgo+IAo+ICAgLSBUaGUgU1BFQwo+ICAgLSBMaW51eCBLZXJuZWwgcHJlc2Vy
dmUgRlBDU1IgZHVyaW5nIGNvbnRleHQgc3dpdGNoZXMKPiAgIC0gUWVtdSB0byBhbGxvdyB3cml0
ZXMgdG8gRlBDU1IgKEkgaGF2ZSBkb25lIHBhcnQgb2YgdGhpcyBhbHJlYWR5LCBhcyBpdHMKPiAg
ICAgbmVlZGVkIGZvciBnbGliYyB0ZXN0aW5nKQo+ICAgLSBPdGhlciBzaW11bGF0b3JzLgo+ICAg
LSBNb3Ixa3ggYW5kIE1hcm9jY2hpbm8gdmVyaWxvZyBjb3Jlcwo+IAo+IERvZXMgdGhpcyBzb3Vu
ZCByZWFzb25hYmxlPwo+IAo+IHAucy4gYW5vdGhlciBhcHByb2FjaCB3b3VsZCBiZSB0byBhZGQg
YSBzeXNjYWxsIGZvciBzZXR0aW5nIHRoZSBmcGNzciwgYnV0IEkKPiBkb24ndCB0aGluayB0aGF0
IGlzIHZlcnkgZ29vZCwgYXMgd2Ugd291bGQgc3RpbGwgbmVlZCB0byBzdXBwb3J0IHNhdmluZyBm
cGNzcgo+IGR1cmluZyBjb250ZXh0IHN3aXRjaGVzIGZvciBpdCB0byB3b3JrLgo+IAo+IC1TdGFm
Zm9yZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
T3BlblJJU0MgbWFpbGluZyBsaXN0Cj4gT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKPiBo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

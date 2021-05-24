Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86CEC38F606
	for <lists+openrisc@lfdr.de>; Tue, 25 May 2021 01:03:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 10555235FC;
	Tue, 25 May 2021 01:03:40 +0200 (CEST)
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by mail.librecores.org (Postfix) with ESMTP id 51FB421246
 for <openrisc@lists.librecores.org>; Tue, 25 May 2021 01:03:38 +0200 (CEST)
Received: from [192.168.126.129] ([146.241.165.237])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lJbllxjNClMvAlJbllNfIV; Tue, 25 May 2021 01:03:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1621897418; bh=hwXlY5O7Fas4zs+wxdsqPpXldZZp3sfsXKG8eaQJAhE=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HrWXvRoGwGpI7yRWkvQPfffPpqzKARAjj18kuo4Gb3LtkydpIczLZj+2de8N2hrIy
 2u28uI7LAcLKPYvFhIQbQOt6Cr3snjbHZ2ILs1/9o4aExHw640dvJf+IcRO+7SbT6/
 BxqCbiDHImkbnrbwvFla3Eyrk2vnB+l1EK1SBGcv0R4MpZeP6i9O0/cxiHQedtU7au
 4i1crbbql0SefPq7kCXEbH4xj/z29TYVQdHaWhegfImr8qbf0bxxFwJlKKCzmwDj3m
 SdAfkjzQBP10i1/tTd23liLPMvpYm7uaO50LQCyBDsDUKuQdjE82wt6aJMuI4tHwgG
 /fzXQQ95Y8e5g==
To: Stafford Horne <shorne@gmail.com>
References: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
 <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <6bc67759-18c2-bca5-bdb2-c637e873b8ab@benettiengineering.com>
Date: Tue, 25 May 2021 01:03:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfKq7sjqSHMXkRWZPeTYDjS5uzay1SPwsywrD1J+6+oMIJSWlNB2Z1iJU9t4CsSlisnAYma/iNgjC0YR+oJLxy841ILDIfN00GJQAyWPW4PJgrPWhKlUK
 Ntkyytr7r3Q0/9PhMP+5iuYhR50ZNXhXjE/MVl7hGrFwrFJ/UhYCIlaVEwLtAAI/COEV4RUbYrYWb7dcE2Rro3WDNp4yd+xyXz2ncOV43BlFjsSdkS3RGiwX
 VtdQQgJesRpiIFosovKUaA==
Subject: Re: [OpenRISC] Maybe another or1k bug
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNS8yNS8yMSAxMjozNCBBTSwgU3RhZmZvcmQgSG9ybmUgd3JvdGU6Cj4gSSdtIGNjJ2luZyB0
aGUgbGlzdCBzbyB0aGVyZSBpcyBhIHJlY29yZCwgYW5kIG90aGVyIGV4cGVydHMgY291bGQgY29t
ZSAKPiBpbiBpZiB0aGV5IGxpa2UuCgpBaCB5ZXMsIHBhcmRvbgoKPiBPaywgSSdsbCB0YWtlIGEg
bG9vay4KPiAKPiBUaGFua3MswqAgdGhlc2UgYXJlIGFsd2F5cyBmdW4gZm9yIG1lLgoKVGhhdCdz
IGdyZWF0IDotKQoKPiBBbHNvIEkgZm9yZ290IHRvIHJlc3BvbmQgYWJvdXQgbmlvczIgYnVncy4g
SSBjb3VsZCBoZWxwIGlmIHRoZSBidWcgCj4gbG9va2VkIHRoZSBzYW1lLiBCdXQgdG8gbWUgaXQg
bG9va2VkIGRpZmZlcmVudC7CoCBTbyBJJ2xsIGhvbGQgb2ZmIGZvciBub3cuCgpPaywgbm8gcHJv
YmxlbS4gVGhhbmsgeW91IGZvciBmaXhpbmcgaGUgT3BlblJpc2Mgb25lcy4KCkJlc3QgcmVnYXJk
cwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gT24gVHVlLCBN
YXkgMjUsIDIwMjEsIDc6MTAgQU0gR2l1bGlvIEJlbmV0dGkgCj4gPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20gCj4gPG1haWx0bzpnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5n
aW5lZXJpbmcuY29tPj4gd3JvdGU6Cj4gCj4gICAgIEhpIFN0YWZmb3JkLAo+IAo+ICAgICBJIHRo
aW5rIEkndmUgZm91bmQgYW5vdGhlciBvcjFrIGxkIGJ1Zy4gSGVyZSBpcyB0aGUgYnVpbGQgZmFp
bHVyZSBsb2c6Cj4gICAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Nh
My9jYTMyODEyOTQzOTJkYTFhNWVhODRkYmI5Y2M0YzViZmVhMGM0Y2NmL2J1aWxkLWVuZC5sb2cK
PiAgICAgPGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2NhMy9jYTMyODEy
OTQzOTJkYTFhNWVhODRkYmI5Y2M0YzViZmVhMGM0Y2NmL2J1aWxkLWVuZC5sb2c+Cj4gCj4gICAg
IEl0IGNvbXBsYWlucyBhYm91dDoKPiAgICAgcGMtcmVsYXRpdmUgcmVsb2NhdGlvbiBhZ2FpbnN0
IGR5bmFtaWMgc3ltYm9sCj4gCj4gICAgIHRoZXJlIGlzIGFuIGFyY2hpdmUgb2Ygc29tZSBmaWxl
cyhsaWJjb21tb24uYSkgY29tcGlsZWQgaW4gdGhlCj4gICAgIGJlZ2lubmluZwo+ICAgICB0aGF0
IGdldHMgbGlua2VkIHdpdGggdGhlIHJlc3Qgb2YgLm8gZmlsZXMuIEV2ZXJ5IGZpbGUgaXMgY29t
cGlsZWQgd2l0aAo+ICAgICAtZlBJQyBvcHRpb24gc28gdGhpcyBzaG91bGQgYWxsb3cgdG8gbGlu
ayBhIC5vIHdpdGggLmEgYnV0IGl0IHRocm93cwo+ICAgICB0aGF0IGVycm9yLgo+IAo+ICAgICBJ
IG9ubHkgc2VlIHRoYXQgZXJyb3IgaW4gb3IxayBhbmQgYWxwaGEuIE1heWJlIEknbSBtaXNzaW5n
IHNvbWV0aGluZy4KPiAgICAgV2hlbiB5b3UgaGF2ZSB0aW1lIGFuZCBpZiB5b3Ugd2FudCwgY2Fu
IHlvdSBoZWxwIG1lIHdpdGggdGhhdD8KPiAKPiAgICAgSWYgeW91IHdhbnQgdG8gcmVwcm9kdWNl
IGl0IGl0J3MgdGhlIHNhbWUgcHJvY2VkdXJlIG9mIHByZXZpb3VzIGJ1Z3MKPiAgICAgYnV0Cj4g
ICAgIHlvdSBuZWVkIHRvIHNwZWNpZnkgY2EzMjgxMjk0MzkyZGExYTVlYTg0ZGJiOWNjNGM1YmZl
YTBjNGNjZiB0bwo+ICAgICBici1yZXByb2R1Y2UtYnVpbGQuCj4gCj4gICAgIFRoYW5rcyBpbiBh
ZHZhbmNlCj4gICAgIGFuZAo+ICAgICBCZXN0IHJlZ2FyZHMKPiAgICAgLS0gCj4gICAgIEdpdWxp
byBCZW5ldHRpCj4gICAgIEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

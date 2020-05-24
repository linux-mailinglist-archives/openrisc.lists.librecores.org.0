Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 246781E01D6
	for <lists+openrisc@lfdr.de>; Sun, 24 May 2020 21:12:58 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B08DE20BC9;
	Sun, 24 May 2020 21:12:57 +0200 (CEST)
Received: from smtp44.i.mail.ru (smtp44.i.mail.ru [94.100.177.104])
 by mail.librecores.org (Postfix) with ESMTPS id 10BDC20BC0
 for <openrisc@lists.librecores.org>; Sun, 24 May 2020 21:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=nAQtp/7GF6D1V1E6umR0MW+6aUZVUfbrnfhr9uJWXsA=; 
 b=eIwpno9Z57PFWtAVl5Ukbwu5+QJxc7at5YZo6bpud1O0rPplmFF1gs5HJe+Xeu79rSVlSJ1SXn7162qOlITjkg/xCu0o37VjxRKB04MDBCY7bXPfplgPTke1IsZ1sM4W48GS0p2ITSWrjObM0oFd8T2fY6zHNdL2gBan+zV810k=;
Received: by smtp44.i.mail.ru with esmtpa (envelope-from <bandvig@mail.ru>)
 id 1jcw3L-0005ZH-9o; Sun, 24 May 2020 22:12:55 +0300
To: Stafford Horne <shorne@gmail.com>
References: <20200506220323.GB2550@lianli.shorne-pla.net>
 <652e3bb7-93aa-4310-e798-2258b00300af@mail.ru>
 <20200508221759.GB4359@lianli.shorne-pla.net>
 <CAAfxs74qCX4HnA04XcSN1DxbAotNX4iLqUP5m5c-pvP5pn0z8g@mail.gmail.com>
From: Andrey Bacherov <bandvig@mail.ru>
Message-ID: <96a984da-4053-6d83-423e-7c327e12c8d7@mail.ru>
Date: Sun, 24 May 2020 22:12:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAfxs74qCX4HnA04XcSN1DxbAotNX4iLqUP5m5c-pvP5pn0z8g@mail.gmail.com>
Content-Language: en-US
Authentication-Results: smtp44.i.mail.ru; auth=pass smtp.auth=bandvig@mail.ru
 smtp.mailfrom=bandvig@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD98895A71D0BFB19F39F83BB832FB1DAAF2C15481359BB3642182A05F538085040E83A5B64C7CFE163E1D4BE1893AABA507C0952E71045511AA27094AF858C3501
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE757AEC41D7AA04458EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DB576DCB83B448D28638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FCA58C66306C491618201C112BF691C54B37104891E3445E27389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C34964A708C60C975A117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947CE6BDB36F057AC83C6E0066C2D8992A164AD6D5ED66289B5218080C068C56568E6136E347CC761E07725E5C173C3A84C3B5866341AF7824C2BA3038C0950A5D36B5C8C57E37DE458B0B4866841D68ED3522CA9DD8327EE4931B544F03EFBC4D5789C8E7BF4648B176C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2AF38021CC9F462D574AF45C6390F7469DAA53EE0834AAEE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj6sWv1+yaA37Z5lFJOV7y4A==
X-Mailru-Internal-Actual: A:0.82972986859665
X-Mailru-Sender: 7B480EB95D2632CA6A331C8845DC6BF11C01DF6FFF67B571E1D4BE1893AABA508F834780009727FC96707CC21FDCAFE23DDE9B364B0DF28976DB2FCCB23CBB8B481B2AED7BCCC0A4AE208404248635DF
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Cj4gRllJLCBJIHBvc3RlZCB0aGUgcHJvcG9zYWwgb24gdGhlIHdlYnNpdGUgaGVyZToKPiAKPiBo
dHRwczovL29wZW5yaXNjLmlvL3Byb3Bvc2Fscy9wMTctdXNlci1tb2RlLWZwY3NyCgpJJ3ZlIGdv
dCBhIG5vdGUgYWJvdXQgY3VycmVudCBTUFJzIGFjY2VzcyBpbXBsZW1lbnRhdGlvbiBpbiBDQVBQ
VUNDSU5PIAphbmQgTUFST0NDSU5PLiBJbiBmYWN0OgoxKSBBbnkgU1BSIGNvdWxkIGJlIHJlYWQg
aW4gdXNlciBtb2RlIGV4Y2x1ZGluZyBTUFJzIGluIENBUFBVQ0NJTk8ncyBQQ1UuCjIpIE9ubHkg
RlBDU1IgYW5zIFNSIHdyaXRlcyBhcmUgcHJvdGVjdGVkIGJ5IFNSW1NNXSBleGNsdWRpbmcgU1BS
cyBpbiAKQ0FQUFVDQ0lOTydzIFBDVSBhZ2Fpbi4KCkluaXRpYWxseSB3ZSBjb3VsZCBpbXBsZW1l
bnQgdXNlciBtb2RlIHdyaXRlIGFjY2VzcyBqdXN0IGZvciBGUENTUiBhcyAKaG90LWZpeC4KCkRv
ZXMgaXQgbWFrZSBzZW5zZSB0byByZW5hbWUgU1VNUkEgdG8gU1VNQSAoU1BScyBVc2VyIE1vZGUg
QWNjZXNzKT8gVG8gCnJlZmxlY3QgdGhlIGZhY3Qgc3VjaCBhY2Nlc3MgY291bGRuJ3QganVzdCBm
b3IgcmVhZC4KCldCUgpBbmRyZXkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

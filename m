Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6D95E435497
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 22:27:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F36F62420F;
	Wed, 20 Oct 2021 22:27:53 +0200 (CEST)
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.143.46])
 by mail.librecores.org (Postfix) with ESMTPS id AA52F240F4
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 19:33:43 +0200 (CEST)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 95043BC7EF
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 12:33:42 -0500 (CDT)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with SMTP
 id dFTCmz5Yzgm2UdFTCmrYxY; Wed, 20 Oct 2021 12:33:42 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pMDh/gBEmdYrpdFhxet8HvhLRnkS+tCP8Fru8d6BEZc=; b=TbQaglbE9+GE1uMYvXpXlmbMjX
 +W8trcETQL/4nXdVCyWoeViOU55qkKwNfHEo+MFdWvT2vfep5rzMXm90GK1ubkltTvK2/lrQjIgJg
 TgWjdP46SvrEND14CHA6WPTnv;
Received: from 174-16-0-219.hlrn.qwest.net ([174.16.0.219]:54014
 helo=murgatroyd) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1mdFTC-000KWN-45; Wed, 20 Oct 2021 11:33:42 -0600
From: Tom Tromey <tom@tromey.com>
To: Stafford Horne via Gdb-patches <gdb-patches@sourceware.org>
References: <20210913124800.471680-1-shorne@gmail.com>
 <20210913124800.471680-2-shorne@gmail.com>
X-Attribution: Tom
Date: Wed, 20 Oct 2021 11:33:41 -0600
In-Reply-To: <20210913124800.471680-2-shorne@gmail.com> (Stafford Horne via
 Gdb-patches's message of "Mon, 13 Sep 2021 21:47:56 +0900")
Message-ID: <87mtn3vbwq.fsf@tromey.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - lists.librecores.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 174.16.0.219
X-Source-L: No
X-Exim-ID: 1mdFTC-000KWN-45
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 174-16-0-219.hlrn.qwest.net (murgatroyd) [174.16.0.219]:54014
X-Source-Auth: tom+tromey.com
X-Email-Count: 4
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Wed, 20 Oct 2021 22:27:52 +0200
Subject: Re: [OpenRISC] [PATCH 1/5] gdb: or1k: implement gdb server
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Pj4+Pj4gIj4iID09IFN0YWZmb3JkIEhvcm5lIHZpYSBHZGItcGF0Y2hlcyA8Z2RiLXBhdGNoZXNA
c291cmNld2FyZS5vcmc+IHdyaXRlczoKCj4+IFRoaXMgcGF0Y2ggYWRkcyBnZGJzZXJ2ZXIgc3Vw
cG9ydCBmb3IgT3BlblJJU0MuICBUaGlzIGhhcyBiZWVuIHVzZWQgZm9yCj4+IGRlYnVnZ2luZyB0
aGUgZ2xpYmMgcG9ydCB0aGF0IGluIGJlaW5nIHdvcmtlZCBvbiBoZXJlOgoKPj4gICBodHRwczov
L2dpdGh1Yi5jb20vb3BlbnJpc2Mvb3Ixay1nbGliYy90cmVlL29yMWstcG9ydC0yCgo+PiBIZW5j
ZSB0aGUgY29tbWVudCBhYm91dCByZWdpc3RlcnMgZGVmaW5pdGlvbnMgYmVpbmcgaW5saW5lIHdp
dGggZ2xpYmMuCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gIEkgaGFkIG9uZSBtaW5vciBjb21tZW50
LgoKPj4gKyNkZWZpbmUgb3Ixa19icmVha3BvaW50X2xlbiA0Cgo+PiArYm9vbAo+PiArb3Ixa190
YXJnZXQ6Omxvd19icmVha3BvaW50X2F0IChDT1JFX0FERFIgd2hlcmUpCj4+ICt7Cj4+ICsgIHVu
c2lnbmVkIGludCBpbnNuOwo+PiArCj4+ICsgIHJlYWRfbWVtb3J5ICh3aGVyZSwgKHVuc2lnbmVk
IGNoYXIgKikgJmluc24sIDQpOwoKUGVyaGFwcyB0aGlzIG91Z2h0IHRvIHVzZSBvcjFrX2JyZWFr
cG9pbnRfbGVuIGhlcmUuCgo+PiArLyogRmV0Y2ggdGhlIHRocmVhZC1sb2NhbCBzdG9yYWdlIHBv
aW50ZXIgZm9yIGxpYnRocmVhZF9kYi4gICovCj4+ICsKPj4gK3BzX2Vycl9lCj4+ICtwc19nZXRf
dGhyZWFkX2FyZWEgKHN0cnVjdCBwc19wcm9jaGFuZGxlICpwaCwKPj4gKwkJICAgIGx3cGlkX3Qg
bHdwaWQsIGludCBpZHgsIHZvaWQgKipiYXNlKQo+PiArewoKTm90IHlvdXIgcHJvYmxlbSBidXQg
aXQgc2VlbXMgbGlrZSBhIHNoYW1lIHRoYXQgdGhpcyBleGFjdAppbXBsZW1lbnRhdGlvbiBpcyBy
ZXBlYXRlZCBzZXZlcmFsIHRpbWVzIGluIGdkYnNlcnZlci4KClRvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

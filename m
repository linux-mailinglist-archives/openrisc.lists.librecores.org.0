Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C0001435498
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 22:27:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 27F9E24213;
	Wed, 20 Oct 2021 22:27:54 +0200 (CEST)
Received: from gateway32.websitewelcome.com (gateway32.websitewelcome.com
 [192.185.145.12])
 by mail.librecores.org (Postfix) with ESMTPS id 9928C2420E
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 20:20:40 +0200 (CEST)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 4000215488
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 13:20:36 -0500 (CDT)
Received: from box5379.bluehost.com ([162.241.216.53]) by cmsmtp with SMTP
 id dGCZmf4WutL6edGCZmvRAu; Wed, 20 Oct 2021 13:20:36 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com; 
 s=default;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References
 :Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=24NZkfUPOQDbtfLrexupswuWLGAAk1a4BMDOpOj/A5E=; b=IO6yFyGFUv+Hrp2lIJ6pApg8Dy
 wuoRvhqqYQSgD19ze9AXBTXVaIXjgKPoSIRVF98UEN7poSk2quGo0loD8YM+N9paIUXKHoJorpzDY
 WXVQy6SGTnXTZ+NMSDtfKYry3;
Received: from 174-16-0-219.hlrn.qwest.net ([174.16.0.219]:54022
 helo=murgatroyd) by box5379.bluehost.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tom@tromey.com>)
 id 1mdGCZ-0015J7-Ey; Wed, 20 Oct 2021 12:20:35 -0600
From: Tom Tromey <tom@tromey.com>
To: Stafford Horne via Gdb-patches <gdb-patches@sourceware.org>
References: <20210913124800.471680-1-shorne@gmail.com>
X-Attribution: Tom
Date: Wed, 20 Oct 2021 12:20:34 -0600
In-Reply-To: <20210913124800.471680-1-shorne@gmail.com> (Stafford Horne via
 Gdb-patches's message of "Mon, 13 Sep 2021 21:47:55 +0900")
Message-ID: <87ee8fv9ql.fsf@tromey.com>
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
X-Exim-ID: 1mdGCZ-0015J7-Ey
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 174-16-0-219.hlrn.qwest.net (murgatroyd) [174.16.0.219]:54022
X-Source-Auth: tom+tromey.com
X-Email-Count: 3
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Wed, 20 Oct 2021 22:27:52 +0200
Subject: Re: [OpenRISC] [PATCH 0/5] OpenRISC Linux Native and GDBServer
 Support
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
c291cmNld2FyZS5vcmc+IHdyaXRlczoKCj4+IEhlbGxvLAo+PiBBcyBJIGhhdmUgYmVlbiB3b3Jr
aW5nIG9uIHRoZSBPcGVuUklTQyBnbGliYyBwb3J0IG92ZXIgdGhlIGxhc3QgZmV3IHllYXJzIG5v
dyBJCj4+IGhhdmUgaGFkIHRoZSBuZWVkIHRvIGhhdmUgTGludXggbmF0aXZlIGRlYnVnZ2luZy4g
IEF0IGZpcnN0IEkgc3RhcnRlZCB3aXRoIHRoZQo+PiBnZGJzZXJ2ZXIsIGJ1dCBxdWlja2x5IGdy
ZXcgb3V0IG9mIHRoYXQgYW5kIGp1c3Qgc2V0dGxlZCBvbiBydW5uaW5nIGdkYiBuYXRpdmUKPj4g
b24gdGhlIHBsYXRmb3JtLgoKSSByZWFkIHRocm91Z2ggdGhlc2UgYW5kIGl0IHNlZW1lZCBiYXNp
Y2FsbHkgb2sgdG8gbWUuICBJIHNlbnQgb25lCmxpdHRsZSBuaXQuICBJIGRvbid0IHRoaW5rIGl0
IG5lZWRzIHJlLXJldmlldyBpZiB5b3Ugd2FudCB0byBmaXggdGhhdC4KCnRoYW5rcywKVG9tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C208E438440
	for <lists+openrisc@lfdr.de>; Sat, 23 Oct 2021 18:05:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 74C2520CDA;
	Sat, 23 Oct 2021 18:05:19 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 54DFE20B5D
 for <openrisc@lists.librecores.org>; Sat, 23 Oct 2021 18:05:17 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5467261139
 for <openrisc@lists.librecores.org>; Sat, 23 Oct 2021 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635005115;
 bh=a0FullCysk1UJY/SuwNW+JkwKz1DX5zFsZR7u65jCCk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YcA0X7ZJT9KPq++0vy4Zc9YPjW55ngCXT3XYqy0oc0V32YWSyFzKjWH46Wfk6JUB6
 PCIDwfEBeDkcsFDGtdhqthdSSccuQ4eBo6P/LqmrXl9bChhrw5voAlYoYh7iNIzAji
 I/i5bgtEUMvO3AEqG3qlH4MZ1DNT15pXqUIREZ0Yj9fWIMtdEKWa5Dl0hx2Av4mXBx
 aZYfYYaL5Ja4lDViVX9MnZlv3E1cOX3kebEmYI6h4HSEkK5Cu3dI3EbNPUElSQ0S/m
 arVBv2qit0AEO2JDL2ItsVAj0xcsKg0bg0oX/nPHGUknfGsiTy2YfqGtAARZUCZBYT
 WlW6qCwcUiNFA==
Received: by mail-wm1-f41.google.com with SMTP id j205so5372764wmj.3
 for <openrisc@lists.librecores.org>; Sat, 23 Oct 2021 09:05:15 -0700 (PDT)
X-Gm-Message-State: AOAM53359IH+EAiU4yw4myeLWrqWfCy5+oDZ5YI45Ia2wOUszqroOdZd
 EJenCYtQYeuHCSmn1YDjHO749tmrWp3cNpsszlc=
X-Google-Smtp-Source: ABdhPJzw9bHMXdBR8sTpnXzuM1z62QqWWvXCArLgXmJmvR/CFzjvKRNvYnRPFIYed1aqogH5ms1MCPnMvzTwp0uq874=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr36618604wmq.82.1635005113773; 
 Sat, 23 Oct 2021 09:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
In-Reply-To: <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 23 Oct 2021 18:04:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
Message-ID: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [OpenRISC] [PATCH] locking: remove spin_lock_flags() etc
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBPY3QgMjMsIDIwMjEgYXQgMzozNyBBTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRo
YXQuY29tPiB3cm90ZToKPj4gT24gMTAvMjIvMjEgNzo1OSBBTSwgQXJuZCBCZXJnbWFubiB3cm90
ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gQXMgdGhp
cyBpcyBhbGwgZGVhZCBjb2RlLCBqdXN0IHJlbW92ZSBpdCBhbmQgdGhlIGhlbHBlciBmdW5jdGlv
bnMgYnVpbHQKPiA+IGFyb3VuZCBpdC4gRm9yIGFyY2gvaWE2NCwgdGhlIGlubGluZSBhc20gY291
bGQgYmUgY2xlYW5lZCB1cCwgYnV0Cj4gPiBpdCBzZWVtcyBzYWZlciB0byBsZWF2ZSBpdCB1bnRv
dWNoZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KPgo+IERvZXMgdGhhdCBtZWFuIHdlIGNhbiBhbHNvIHJlbW92ZSB0aGUgR0VORVJJQ19MT0NL
QlJFQUsgY29uZmlnIG9wdGlvbgo+IGZyb20gdGhlIEtjb25maWcgZmlsZXMgYXMgd2VsbD8KCiBJ
IGNvdWxkbid0IGZpZ3VyZSB0aGlzIG91dC4KCldoYXQgSSBzZWUgaXMgdGhhdCB0aGUgb25seSBh
cmNoaXRlY3R1cmVzIHNldHRpbmcgR0VORVJJQ19MT0NLQlJFQUsgYXJlCm5kczMyLCBwYXJpc2Ms
IHBvd2VycGMsIHMzOTAsIHNoIGFuZCBzcGFyYzY0LCB3aGlsZSB0aGUgb25seSBhcmNoaXRlY3R1
cmVzCmltcGxlbWVudGluZyBhcmNoX3NwaW5faXNfY29udGVuZGVkKCkgYXJlIGFybTMyLCBjc2t5
IGFuZCBpYTY0LgoKVGhlIHBhcnQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdoZXRoZXIgdGhlIG9w
dGlvbiBhY3R1YWxseSBkb2VzIGFueXRoaW5nCnVzZWZ1bCBhbnkgbW9yZSBhZnRlciBjb21taXQg
ZDg5YzcwMzU2YWNmICgibG9ja2luZy9jb3JlOiBSZW1vdmUgYnJlYWtfbG9jawpmaWVsZCB3aGVu
IENPTkZJR19HRU5FUklDX0xPQ0tCUkVBSz15IikuCgogICAgICBBcm5kCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

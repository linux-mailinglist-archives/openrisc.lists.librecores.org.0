Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BB9804398C6
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 16:38:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 635ED24226;
	Mon, 25 Oct 2021 16:38:59 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by mail.librecores.org (Postfix) with ESMTPS id 8821A2419E
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 16:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I97oc9kS0hxonuSgC18bwLyEuuHyR5BjA3g3cz+StFk=; b=fFKP9rs4D2Npzo47cjKm17xnDL
 mnZs+FfL6mBbrPRwuacU8oISILWxsnNi7ZuMz61CuSJ1QMPl2TQreluUzhkqRRUI4lBbEZXeaBO1s
 ZXMdk9jHBpFCtwxGqrYPvonpw/OV3jLOkrbqXgilnq7SCHNPEsrwy1fXol7lzJe2UqoHGQO447vOu
 QKLAo22Qs5t9oHPVsqjpMqrhsIEiimGViYptsdGGD98azVSz512YvOHfRB/OU7Vyn1E/bXZmZy5gf
 4k6cm+wWoq9NTCPkDo7Ma1V4LZuHP2S5ly8dVZqHdFX+ziR3TjYBNCJOOiY8z6Bt0rs6ou4GLgxIt
 c0F3H/XQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf12c-00GBQq-5S; Mon, 25 Oct 2021 14:34:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8B8163002AE;
 Mon, 25 Oct 2021 16:33:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6DE4F20C6C153; Mon, 25 Oct 2021 16:33:32 +0200 (CEST)
Date: Mon, 25 Oct 2021 16:33:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgMDM6MDY6MjRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBNb24sIE9jdCAyNSwgMjAyMSBhdCAxMTo1NyBBTSBQZXRlciBaaWpsc3RyYSA8
cGV0ZXJ6QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gT24gU2F0LCBPY3QgMjMsIDIwMjEgYXQg
MDY6MDQ6NTdQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4gT24gU2F0LCBPY3Qg
MjMsIDIwMjEgYXQgMzozNyBBTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90
ZToKPiA+ID4gPj4gT24gMTAvMjIvMjEgNzo1OSBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+
ID4gPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQXMgdGhpcyBpcyBhbGwgZGVhZCBjb2RlLCBqdXN0IHJlbW92ZSBpdCBhbmQgdGhlIGhl
bHBlciBmdW5jdGlvbnMgYnVpbHQKPiA+ID4gPiA+IGFyb3VuZCBpdC4gRm9yIGFyY2gvaWE2NCwg
dGhlIGlubGluZSBhc20gY291bGQgYmUgY2xlYW5lZCB1cCwgYnV0Cj4gPiA+ID4gPiBpdCBzZWVt
cyBzYWZlciB0byBsZWF2ZSBpdCB1bnRvdWNoZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4gPgo+ID4gPiA+IERv
ZXMgdGhhdCBtZWFuIHdlIGNhbiBhbHNvIHJlbW92ZSB0aGUgR0VORVJJQ19MT0NLQlJFQUsgY29u
ZmlnIG9wdGlvbgo+ID4gPiA+IGZyb20gdGhlIEtjb25maWcgZmlsZXMgYXMgd2VsbD8KPiA+ID4K
PiA+ID4gIEkgY291bGRuJ3QgZmlndXJlIHRoaXMgb3V0Lgo+ID4gPgo+ID4gPiBXaGF0IEkgc2Vl
IGlzIHRoYXQgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlcyBzZXR0aW5nIEdFTkVSSUNfTE9DS0JSRUFL
IGFyZQo+ID4gPiBuZHMzMiwgcGFyaXNjLCBwb3dlcnBjLCBzMzkwLCBzaCBhbmQgc3BhcmM2NCwg
d2hpbGUgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlcwo+ID4gPiBpbXBsZW1lbnRpbmcgYXJjaF9zcGlu
X2lzX2NvbnRlbmRlZCgpIGFyZSBhcm0zMiwgY3NreSBhbmQgaWE2NC4KPiA+ID4KPiA+ID4gVGhl
IHBhcnQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdoZXRoZXIgdGhlIG9wdGlvbiBhY3R1YWxseSBk
b2VzIGFueXRoaW5nCj4gPiA+IHVzZWZ1bCBhbnkgbW9yZSBhZnRlciBjb21taXQgZDg5YzcwMzU2
YWNmICgibG9ja2luZy9jb3JlOiBSZW1vdmUgYnJlYWtfbG9jawo+ID4gPiBmaWVsZCB3aGVuIENP
TkZJR19HRU5FUklDX0xPQ0tCUkVBSz15IikuCj4gPgo+ID4gVXJnaCwgd2hhdCBhIG1lc3MuLiBB
RkFJQ1QgdGhlcmUncyBzdGlsbCBjb2RlIGluCj4gPiBrZXJuZWwvbG9ja2luZy9zcGlubG9jay5j
IHRoYXQgcmVsaWVzIG9uIGl0LiBTcGVjaWZpY2FsbHkgd2hlbgo+ID4gR0VORVJJQ19MT0NLQlJF
QUs9eSB3ZSBzZWVtIHRvIGNyZWF0ZSBfbG9jayooKSB2YXJpYW50cyB0aGF0IGFyZQo+ID4gYmFz
aWNhbGx5IFRhUyBsb2NrcyB3aGljaCBkcm9wIHByZWVtcHQvaXJxIGRpc2FibGUgd2hpbGUgc3Bp
bm5pbmcuCj4gPgo+ID4gQW55Ym9keSBoYXZpbmcgdGhpcyBvbiBhbmQgbm90IGhhdmluZyBuYXRp
dmUgVGFTIGxvY2tzIGlzIGluIGZvciBhIHJ1ZGUKPiA+IHN1cnByaXNlIEkgc3VwcG9zZS4uLiBz
cGFyYzY0IGJlaW5nIHRoZSBvYnZpb3VzIGNhbmRpZGF0ZSB0aGVyZSA6Lwo+IAo+IElzIHRoaXMg
YSBwcm9ibGVtIG9uIHMzOTAgYW5kIHBvd2VycGMsIHRob3NlIHR3byBiZWluZyB0aGUgb25lcwo+
IHRoYXQgbWF0dGVyIGluIHByYWN0aWNlPwo+IAo+IE9uIHMzOTAsIHdlIHBpY2sgYmV0d2VlbiB0
aGUgY21weGNoZygpIGJhc2VkIGRpcmVjdGVkLXlpZWxkIHdoZW4KPiBydW5uaW5nIG9uIHZpcnR1
YWxpemVkIENQVXMsIGFuZCBhIG5vcm1hbCBxc3BpbmxvY2sgd2hlbiBydW5uaW5nIG9uIGEKPiBk
ZWRpY2F0ZWQgQ1BVLgo+IAo+IE9uIFBvd2VyUEMsIHdlIHBpY2sgYXQgY29tcGlsZS10aW1lIGJl
dHdlZW4gZWl0aGVyIHRoZSBxc3BpbmxvY2sKPiAoZGVmYXVsdC1lbmFibGVkIG9uIEJvb2szUy02
NCwgaS5lLiBhbGwgc2VydmVyIGNoaXBzKSBvciBhIGxsL3NjIGJhc2VkCj4gc3BpbmxvY2sgcGx1
cyB2bV95aWVsZCgpIChkZWZhdWx0IG9uIGVtYmVkZGVkIGFuZCAzMi1iaXQgbWFjKS4KClVyZ2gs
IHllYWgsIHNvIHRoaXMgY3J1ZCB1bmRlcm1pbmVzIHRoZSB3aG9sZSBwb2ludCBvZiBoYXZpbmcg
YSBmYWlyCmxvY2suIEknbSB0aGlua2luZyBzMzkwIGFuZCBQb3dlciB3YW50IHRvIGhhdmUgdGhp
cyBmaXhlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

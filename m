Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 24B8B43932C
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 11:57:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C2F8E2421F;
	Mon, 25 Oct 2021 11:57:50 +0200 (CEST)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by mail.librecores.org (Postfix) with ESMTPS id 35B0B24149
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 11:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kBcBoUwV55Vzzvl24KD3p0ArPNxglJAR5S99vkQU21A=; b=MBCIXeXhf6eTBncr2QpHLUaYS7
 6G6hOzIwUql2vqiXbPvPa9A34kSeid/gzxP9EN8BQVKIOSUqesYOAciHBywhpFV3bEqT11li2ezNu
 zXx9DIsxagTnN0sBGW93C3YbKy15aQnc8uqykO8jv9JtgA7VFmGzMn4I4p3JH8gdxJP7oqeAJkvZK
 9hy4dbsx6zYQT7WBZKaHuQoTx6ibgTsFc6MJcGaipDs9afWbC+XldzOHN6X5mUvDpqD4/OWFj24A9
 qTxIRw6JiXreO28PuVyy/+uQk7JTwDJ6Zg/u5Y+Y7ul3SpvRSdBp1gBelToDOuKySSBC3ttwob/pS
 /4/6lXZQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewjU-00C7ZM-Sf; Mon, 25 Oct 2021 09:57:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9A95B3002AE;
 Mon, 25 Oct 2021 11:57:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 74DE220C6C150; Mon, 25 Oct 2021 11:57:28 +0200 (CEST)
Date: Mon, 25 Oct 2021 11:57:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
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

T24gU2F0LCBPY3QgMjMsIDIwMjEgYXQgMDY6MDQ6NTdQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTYXQsIE9jdCAyMywgMjAyMSBhdCAzOjM3IEFNIFdhaW1hbiBMb25nIDxsb25n
bWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4+IE9uIDEwLzIyLzIxIDc6NTkgQU0sIEFybmQgQmVy
Z21hbm4gd3JvdGU6Cj4gPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4g
PiA+Cj4gPiA+IEFzIHRoaXMgaXMgYWxsIGRlYWQgY29kZSwganVzdCByZW1vdmUgaXQgYW5kIHRo
ZSBoZWxwZXIgZnVuY3Rpb25zIGJ1aWx0Cj4gPiA+IGFyb3VuZCBpdC4gRm9yIGFyY2gvaWE2NCwg
dGhlIGlubGluZSBhc20gY291bGQgYmUgY2xlYW5lZCB1cCwgYnV0Cj4gPiA+IGl0IHNlZW1zIHNh
ZmVyIHRvIGxlYXZlIGl0IHVudG91Y2hlZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+Cj4gPiBEb2VzIHRoYXQgbWVhbiB3ZSBjYW4g
YWxzbyByZW1vdmUgdGhlIEdFTkVSSUNfTE9DS0JSRUFLIGNvbmZpZyBvcHRpb24KPiA+IGZyb20g
dGhlIEtjb25maWcgZmlsZXMgYXMgd2VsbD8KPiAKPiAgSSBjb3VsZG4ndCBmaWd1cmUgdGhpcyBv
dXQuCj4gCj4gV2hhdCBJIHNlZSBpcyB0aGF0IHRoZSBvbmx5IGFyY2hpdGVjdHVyZXMgc2V0dGlu
ZyBHRU5FUklDX0xPQ0tCUkVBSyBhcmUKPiBuZHMzMiwgcGFyaXNjLCBwb3dlcnBjLCBzMzkwLCBz
aCBhbmQgc3BhcmM2NCwgd2hpbGUgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlcwo+IGltcGxlbWVudGlu
ZyBhcmNoX3NwaW5faXNfY29udGVuZGVkKCkgYXJlIGFybTMyLCBjc2t5IGFuZCBpYTY0Lgo+IAo+
IFRoZSBwYXJ0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyB3aGV0aGVyIHRoZSBvcHRpb24gYWN0dWFs
bHkgZG9lcyBhbnl0aGluZwo+IHVzZWZ1bCBhbnkgbW9yZSBhZnRlciBjb21taXQgZDg5YzcwMzU2
YWNmICgibG9ja2luZy9jb3JlOiBSZW1vdmUgYnJlYWtfbG9jawo+IGZpZWxkIHdoZW4gQ09ORklH
X0dFTkVSSUNfTE9DS0JSRUFLPXkiKS4KClVyZ2gsIHdoYXQgYSBtZXNzLi4gQUZBSUNUIHRoZXJl
J3Mgc3RpbGwgY29kZSBpbgprZXJuZWwvbG9ja2luZy9zcGlubG9jay5jIHRoYXQgcmVsaWVzIG9u
IGl0LiBTcGVjaWZpY2FsbHkgd2hlbgpHRU5FUklDX0xPQ0tCUkVBSz15IHdlIHNlZW0gdG8gY3Jl
YXRlIF9sb2NrKigpIHZhcmlhbnRzIHRoYXQgYXJlCmJhc2ljYWxseSBUYVMgbG9ja3Mgd2hpY2gg
ZHJvcCBwcmVlbXB0L2lycSBkaXNhYmxlIHdoaWxlIHNwaW5uaW5nLgoKQW55Ym9keSBoYXZpbmcg
dGhpcyBvbiBhbmQgbm90IGhhdmluZyBuYXRpdmUgVGFTIGxvY2tzIGlzIGluIGZvciBhIHJ1ZGUK
c3VycHJpc2UgSSBzdXBwb3NlLi4uIHNwYXJjNjQgYmVpbmcgdGhlIG9idmlvdXMgY2FuZGlkYXRl
IHRoZXJlIDovCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

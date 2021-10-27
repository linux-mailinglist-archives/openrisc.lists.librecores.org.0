Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 45F6F43C924
	for <lists+openrisc@lfdr.de>; Wed, 27 Oct 2021 14:02:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 98CA52422C;
	Wed, 27 Oct 2021 14:02:03 +0200 (CEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by mail.librecores.org (Postfix) with ESMTPS id 36A8924149
 for <openrisc@lists.librecores.org>; Wed, 27 Oct 2021 14:02:02 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfS3D6fVvz4xbG;
 Wed, 27 Oct 2021 23:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635336108;
 bh=eZo4L/VYResFxnSjYMuAe6p73rb/55QbmAx/d4+9tG4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JQ5dRRYao96n2QjnD9F5FAugsZopemn7Y8YqAmL2meL1PnI4mYsKSjfuExzvZpuA5
 fo98C/+hhHVxXiymFsgVUaNNU2OXZOe+c6bLZFJtrn3hoVRsK8UVbP9gK878GEbfPD
 VDvIrUapL3PKDDjCdUgv6N8Ux67vWT8CizDcTwrTHynUtV9jf15u69Gl+rLY036ixg
 zeY96EVJi9rErgfmwBI6fcGPd1tomYN/VkCpDGNVYTfs0wOrl9IkcGEvhuiGpQKYnb
 nfU4vnXu2gWqpvtG5V7u9/EXKXYSjwtZbh/n8+Hk2z9uQ9E8oJ+OXVuNanRAXRdn+r
 +hzmwqKHzlS9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
Date: Wed, 27 Oct 2021 23:01:41 +1100
Message-ID: <87r1c6ad7e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cml0ZXM6Cj4gT24gTW9uLCBP
Y3QgMjUsIDIwMjEgYXQgMDM6MDY6MjRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4g
T24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgMTE6NTcgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPj4gPiBPbiBTYXQsIE9jdCAyMywgMjAyMSBhdCAwNjowNDo1
N1BNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiA+ID4gT24gU2F0LCBPY3QgMjMsIDIw
MjEgYXQgMzozNyBBTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPj4g
PiA+ID4+IE9uIDEwLzIyLzIxIDc6NTkgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+ID4gPiA+
ID4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gPiA+ID4gPgo+PiA+ID4g
PiA+IEFzIHRoaXMgaXMgYWxsIGRlYWQgY29kZSwganVzdCByZW1vdmUgaXQgYW5kIHRoZSBoZWxw
ZXIgZnVuY3Rpb25zIGJ1aWx0Cj4+ID4gPiA+ID4gYXJvdW5kIGl0LiBGb3IgYXJjaC9pYTY0LCB0
aGUgaW5saW5lIGFzbSBjb3VsZCBiZSBjbGVhbmVkIHVwLCBidXQKPj4gPiA+ID4gPiBpdCBzZWVt
cyBzYWZlciB0byBsZWF2ZSBpdCB1bnRvdWNoZWQuCj4+ID4gPiA+ID4KPj4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+PiA+ID4gPgo+PiA+ID4g
PiBEb2VzIHRoYXQgbWVhbiB3ZSBjYW4gYWxzbyByZW1vdmUgdGhlIEdFTkVSSUNfTE9DS0JSRUFL
IGNvbmZpZyBvcHRpb24KPj4gPiA+ID4gZnJvbSB0aGUgS2NvbmZpZyBmaWxlcyBhcyB3ZWxsPwo+
PiA+ID4KPj4gPiA+ICBJIGNvdWxkbid0IGZpZ3VyZSB0aGlzIG91dC4KPj4gPiA+Cj4+ID4gPiBX
aGF0IEkgc2VlIGlzIHRoYXQgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlcyBzZXR0aW5nIEdFTkVSSUNf
TE9DS0JSRUFLIGFyZQo+PiA+ID4gbmRzMzIsIHBhcmlzYywgcG93ZXJwYywgczM5MCwgc2ggYW5k
IHNwYXJjNjQsIHdoaWxlIHRoZSBvbmx5IGFyY2hpdGVjdHVyZXMKPj4gPiA+IGltcGxlbWVudGlu
ZyBhcmNoX3NwaW5faXNfY29udGVuZGVkKCkgYXJlIGFybTMyLCBjc2t5IGFuZCBpYTY0Lgo+PiA+
ID4KPj4gPiA+IFRoZSBwYXJ0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyB3aGV0aGVyIHRoZSBvcHRp
b24gYWN0dWFsbHkgZG9lcyBhbnl0aGluZwo+PiA+ID4gdXNlZnVsIGFueSBtb3JlIGFmdGVyIGNv
bW1pdCBkODljNzAzNTZhY2YgKCJsb2NraW5nL2NvcmU6IFJlbW92ZSBicmVha19sb2NrCj4+ID4g
PiBmaWVsZCB3aGVuIENPTkZJR19HRU5FUklDX0xPQ0tCUkVBSz15IikuCj4+ID4KPj4gPiBVcmdo
LCB3aGF0IGEgbWVzcy4uIEFGQUlDVCB0aGVyZSdzIHN0aWxsIGNvZGUgaW4KPj4gPiBrZXJuZWwv
bG9ja2luZy9zcGlubG9jay5jIHRoYXQgcmVsaWVzIG9uIGl0LiBTcGVjaWZpY2FsbHkgd2hlbgo+
PiA+IEdFTkVSSUNfTE9DS0JSRUFLPXkgd2Ugc2VlbSB0byBjcmVhdGUgX2xvY2sqKCkgdmFyaWFu
dHMgdGhhdCBhcmUKPj4gPiBiYXNpY2FsbHkgVGFTIGxvY2tzIHdoaWNoIGRyb3AgcHJlZW1wdC9p
cnEgZGlzYWJsZSB3aGlsZSBzcGlubmluZy4KPj4gPgo+PiA+IEFueWJvZHkgaGF2aW5nIHRoaXMg
b24gYW5kIG5vdCBoYXZpbmcgbmF0aXZlIFRhUyBsb2NrcyBpcyBpbiBmb3IgYSBydWRlCj4+ID4g
c3VycHJpc2UgSSBzdXBwb3NlLi4uIHNwYXJjNjQgYmVpbmcgdGhlIG9idmlvdXMgY2FuZGlkYXRl
IHRoZXJlIDovCj4+IAo+PiBJcyB0aGlzIGEgcHJvYmxlbSBvbiBzMzkwIGFuZCBwb3dlcnBjLCB0
aG9zZSB0d28gYmVpbmcgdGhlIG9uZXMKPj4gdGhhdCBtYXR0ZXIgaW4gcHJhY3RpY2U/Cj4+IAo+
PiBPbiBzMzkwLCB3ZSBwaWNrIGJldHdlZW4gdGhlIGNtcHhjaGcoKSBiYXNlZCBkaXJlY3RlZC15
aWVsZCB3aGVuCj4+IHJ1bm5pbmcgb24gdmlydHVhbGl6ZWQgQ1BVcywgYW5kIGEgbm9ybWFsIHFz
cGlubG9jayB3aGVuIHJ1bm5pbmcgb24gYQo+PiBkZWRpY2F0ZWQgQ1BVLgo+PiAKPj4gT24gUG93
ZXJQQywgd2UgcGljayBhdCBjb21waWxlLXRpbWUgYmV0d2VlbiBlaXRoZXIgdGhlIHFzcGlubG9j
awo+PiAoZGVmYXVsdC1lbmFibGVkIG9uIEJvb2szUy02NCwgaS5lLiBhbGwgc2VydmVyIGNoaXBz
KSBvciBhIGxsL3NjIGJhc2VkCj4+IHNwaW5sb2NrIHBsdXMgdm1feWllbGQoKSAoZGVmYXVsdCBv
biBlbWJlZGRlZCBhbmQgMzItYml0IG1hYykuCj4KPiBVcmdoLCB5ZWFoLCBzbyB0aGlzIGNydWQg
dW5kZXJtaW5lcyB0aGUgd2hvbGUgcG9pbnQgb2YgaGF2aW5nIGEgZmFpcgo+IGxvY2suIEknbSB0
aGlua2luZyBzMzkwIGFuZCBQb3dlciB3YW50IHRvIGhhdmUgdGhpcyBmaXhlZC4KCk91ciBLY29u
ZmlnIGhhczoKCiAgY29uZmlnIEdFTkVSSUNfTE9DS0JSRUFLCiAgCWJvb2wKICAJZGVmYXVsdCB5
CiAgCWRlcGVuZHMgb24gU01QICYmIFBSRUVNUFRJT04KCkFuZCB3ZSBoYXZlIGV4YWN0bHkgb25l
IGRlZmNvbmZpZyB0aGF0IGVuYWJsZXMgYm90aCBTTVAgYW5kIFBSRUVNUFQsCmFyY2gvcG93ZXJw
Yy9jb25maWdzLzg1eHgvZ2VfaW1wM2FfZGVmY29uZmlnLCB3aGljaCBpcyBzb21lIH4xMCB5ZWFy
IG9sZApQQ0kgY2FyZCBlbWJlZGRlZCB0aGluZyBJJ3ZlIG5ldmVyIGhlYXJkIG9mLiBIaWdoIGNo
YW5jZSBhbnlvbmUgd2hvIGhhcwp0aG9zZSBpcyBub3QgcnVubmluZyB1cHN0cmVhbSBrZXJuZWxz
IG9uIHRoZW0uCgpTbyBJIHRoaW5rIHdlJ2QgYmUgaGFwcHkgZm9yIHlvdSByaXAgR0VORVJJQ19M
T0NLQlJFQUsgb3V0LCBpdCdzIGFsbW9zdAplbnRpcmVseSB1bnVzZWQgb24gcG93ZXJwYyBhbnl3
YXkuCgpjaGVlcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

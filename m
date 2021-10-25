Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DF9ED439A6F
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 17:29:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8897024223;
	Mon, 25 Oct 2021 17:29:02 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 85D0F24221
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 17:29:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635175739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l1cYYIVh+xGjWZ5+lH9xxF7m8Jg6vgobu0WCRcUUQ6o=;
 b=FIHPYV15WG8rTHgoBFowzxABAzemgooGoOV+dDJpCpk3XSSIzdaRKqqQzDg/wGZIfGW0P0
 5HIAQMqy5oKSySX+MM2j27lkMcsCsO1AL11Mq9qpuY/qtC5EBtidNiM5jNKzp1FbdnTM+f
 H8w65ykNPynWXKt8cn3RtM34l05D/wI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-x4xQsDwWOV62UjcxFemc8Q-1; Mon, 25 Oct 2021 11:28:47 -0400
X-MC-Unique: x4xQsDwWOV62UjcxFemc8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDC93362FD;
 Mon, 25 Oct 2021 15:28:43 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.18.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E34335D6D5;
 Mon, 25 Oct 2021 15:28:37 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
Message-ID: <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
Date: Mon, 25 Oct 2021 11:28:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDEwLzI1LzIxIDk6MDYgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24gTW9uLCBPY3Qg
MjUsIDIwMjEgYXQgMTE6NTcgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3Jn
PiB3cm90ZToKPj4gT24gU2F0LCBPY3QgMjMsIDIwMjEgYXQgMDY6MDQ6NTdQTSArMDIwMCwgQXJu
ZCBCZXJnbWFubiB3cm90ZToKPj4+IE9uIFNhdCwgT2N0IDIzLCAyMDIxIGF0IDM6MzcgQU0gV2Fp
bWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0LmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIDEwLzIyLzIxIDc6
NTkgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+Pj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4+Pj4+Cj4+Pj4+IEFzIHRoaXMgaXMgYWxsIGRlYWQgY29kZSwganVzdCBy
ZW1vdmUgaXQgYW5kIHRoZSBoZWxwZXIgZnVuY3Rpb25zIGJ1aWx0Cj4+Pj4+IGFyb3VuZCBpdC4g
Rm9yIGFyY2gvaWE2NCwgdGhlIGlubGluZSBhc20gY291bGQgYmUgY2xlYW5lZCB1cCwgYnV0Cj4+
Pj4+IGl0IHNlZW1zIHNhZmVyIHRvIGxlYXZlIGl0IHVudG91Y2hlZC4KPj4+Pj4KPj4+Pj4gU2ln
bmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4+PiBEb2VzIHRoYXQg
bWVhbiB3ZSBjYW4gYWxzbyByZW1vdmUgdGhlIEdFTkVSSUNfTE9DS0JSRUFLIGNvbmZpZyBvcHRp
b24KPj4+PiBmcm9tIHRoZSBLY29uZmlnIGZpbGVzIGFzIHdlbGw/Cj4+PiAgIEkgY291bGRuJ3Qg
ZmlndXJlIHRoaXMgb3V0Lgo+Pj4KPj4+IFdoYXQgSSBzZWUgaXMgdGhhdCB0aGUgb25seSBhcmNo
aXRlY3R1cmVzIHNldHRpbmcgR0VORVJJQ19MT0NLQlJFQUsgYXJlCj4+PiBuZHMzMiwgcGFyaXNj
LCBwb3dlcnBjLCBzMzkwLCBzaCBhbmQgc3BhcmM2NCwgd2hpbGUgdGhlIG9ubHkgYXJjaGl0ZWN0
dXJlcwo+Pj4gaW1wbGVtZW50aW5nIGFyY2hfc3Bpbl9pc19jb250ZW5kZWQoKSBhcmUgYXJtMzIs
IGNza3kgYW5kIGlhNjQuCj4+Pgo+Pj4gVGhlIHBhcnQgSSBkb24ndCB1bmRlcnN0YW5kIGlzIHdo
ZXRoZXIgdGhlIG9wdGlvbiBhY3R1YWxseSBkb2VzIGFueXRoaW5nCj4+PiB1c2VmdWwgYW55IG1v
cmUgYWZ0ZXIgY29tbWl0IGQ4OWM3MDM1NmFjZiAoImxvY2tpbmcvY29yZTogUmVtb3ZlIGJyZWFr
X2xvY2sKPj4+IGZpZWxkIHdoZW4gQ09ORklHX0dFTkVSSUNfTE9DS0JSRUFLPXkiKS4KPj4gVXJn
aCwgd2hhdCBhIG1lc3MuLiBBRkFJQ1QgdGhlcmUncyBzdGlsbCBjb2RlIGluCj4+IGtlcm5lbC9s
b2NraW5nL3NwaW5sb2NrLmMgdGhhdCByZWxpZXMgb24gaXQuIFNwZWNpZmljYWxseSB3aGVuCj4+
IEdFTkVSSUNfTE9DS0JSRUFLPXkgd2Ugc2VlbSB0byBjcmVhdGUgX2xvY2sqKCkgdmFyaWFudHMg
dGhhdCBhcmUKPj4gYmFzaWNhbGx5IFRhUyBsb2NrcyB3aGljaCBkcm9wIHByZWVtcHQvaXJxIGRp
c2FibGUgd2hpbGUgc3Bpbm5pbmcuCj4+Cj4+IEFueWJvZHkgaGF2aW5nIHRoaXMgb24gYW5kIG5v
dCBoYXZpbmcgbmF0aXZlIFRhUyBsb2NrcyBpcyBpbiBmb3IgYSBydWRlCj4+IHN1cnByaXNlIEkg
c3VwcG9zZS4uLiBzcGFyYzY0IGJlaW5nIHRoZSBvYnZpb3VzIGNhbmRpZGF0ZSB0aGVyZSA6Lwo+
IElzIHRoaXMgYSBwcm9ibGVtIG9uIHMzOTAgYW5kIHBvd2VycGMsIHRob3NlIHR3byBiZWluZyB0
aGUgb25lcwo+IHRoYXQgbWF0dGVyIGluIHByYWN0aWNlPwo+Cj4gT24gczM5MCwgd2UgcGljayBi
ZXR3ZWVuIHRoZSBjbXB4Y2hnKCkgYmFzZWQgZGlyZWN0ZWQteWllbGQgd2hlbgo+IHJ1bm5pbmcg
b24gdmlydHVhbGl6ZWQgQ1BVcywgYW5kIGEgbm9ybWFsIHFzcGlubG9jayB3aGVuIHJ1bm5pbmcg
b24gYQo+IGRlZGljYXRlZCBDUFUuCgpJIGFtIG5vdCBhd2FyZSB0aGF0IHMzOTAgaXMgdXNpbmcg
cXNwaW5sb2NrcyBhdCBhbGwgYXMgSSBkb24ndCBzZWUgCkFSQ0hfVVNFX1FVRVVFRF9TUElOTE9D
S1MgYmVpbmcgc2V0IGFueXdoZXJlIHVuZGVyIGFyY2gvczM5MC4gSSBvbmx5IHNlZSAKdGhhdCBp
dCB1c2VzIGEgY21weGNoZyBiYXNlZCBzcGlubG9jay4KCkNoZWVycywKTG9uZ21hbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1781C439E78
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 20:25:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A81D424235;
	Mon, 25 Oct 2021 20:25:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id AD9B4209D6
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 20:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635186345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WmLX7TLtZ9IDJ1JQ+2m7C+nUTKDcem4HGFPTzsvzRlk=;
 b=Wv+Bn4dxhZd55LviAVyViBWcPOU0Rp9ilELfxoHmfPRFMsMTnWyr1KV+vnUb7HxdBQFDfC
 8u0icaeLpBJuKsHO4IauhD6FqbM2usvJnAy9dRHnG8kAyJQ3OJOmAhBHBf4caR9CwOQhVl
 MPkAtyhKscX5eicRiWleuN3BY3eHf84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-pXULrgXMNu2BFbQqJnWKPA-1; Mon, 25 Oct 2021 14:25:40 -0400
X-MC-Unique: pXULrgXMNu2BFbQqJnWKPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3722410B3959;
 Mon, 25 Oct 2021 18:25:37 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.18.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28C21100763D;
 Mon, 25 Oct 2021 18:25:33 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <2413f412-a390-bbc0-e848-e2a77d1f0ab3@redhat.com>
 <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
Message-ID: <d7af2422-3264-b9bb-b515-da4351743448@redhat.com>
Date: Mon, 25 Oct 2021 14:25:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3JEBF-dEg0iVThMMRNK3CDxY+mRtTeStMusycnethO_g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMTAvMjUvMjEgMTE6NDQgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24gTW9uLCBPY3Qg
MjUsIDIwMjEgYXQgNToyOCBQTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90
ZToKPj4gT24gMTAvMjUvMjEgOTowNiBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4+IE9uIHMz
OTAsIHdlIHBpY2sgYmV0d2VlbiB0aGUgY21weGNoZygpIGJhc2VkIGRpcmVjdGVkLXlpZWxkIHdo
ZW4KPj4+IHJ1bm5pbmcgb24gdmlydHVhbGl6ZWQgQ1BVcywgYW5kIGEgbm9ybWFsIHFzcGlubG9j
ayB3aGVuIHJ1bm5pbmcgb24gYQo+Pj4gZGVkaWNhdGVkIENQVS4KPj4gSSBhbSBub3QgYXdhcmUg
dGhhdCBzMzkwIGlzIHVzaW5nIHFzcGlubG9ja3MgYXQgYWxsIGFzIEkgZG9uJ3Qgc2VlCj4+IEFS
Q0hfVVNFX1FVRVVFRF9TUElOTE9DS1MgYmVpbmcgc2V0IGFueXdoZXJlIHVuZGVyIGFyY2gvczM5
MC4gSSBvbmx5IHNlZQo+PiB0aGF0IGl0IHVzZXMgYSBjbXB4Y2hnIGJhc2VkIHNwaW5sb2NrLgo+
IFNvcnJ5LCBJIHNob3VsZCBub3QgaGF2ZSBzYWlkICJub3JtYWwiIGhlcmUuIFNlZSBhcmNoL3Mz
OTAvbGliL3NwaW5sb2NrLmMKPiBmb3IgdGhlaXIgY3VzdG9tIHF1ZXVlZCBzcGlubG9ja3MgYXMg
aW1wbGVtZW50ZWQgaW4gYXJjaF9zcGluX2xvY2tfcXVldWVkKCkuCj4gSSBkb24ndCBrbm93IGlm
IHRoYXQgY29kZSBhY3R1YWxseSBkb2VzIHRoZSBzYW1lIHRoaW5nIGFzIHRoZSBnZW5lcmljIHFz
cGlubG9jaywKPiBidXQgaXQgc2VlbXMgYXQgbGVhc3Qgc2ltaWxhci4KClllcywgeW91IGFyZSBy
aWdodC4gVGhlaXIgcXVldWVkIGxvY2sgY29kZSBsb29rcyBsaWtlIGEgY3VzdG9tIHZlcnNpb24g
Cm9mIHRoZSBwdnFzcGlubG9jayBjb2RlLgoKQ2hlZXJzLApMb25nbWFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

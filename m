Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 63CE7438149
	for <lists+openrisc@lfdr.de>; Sat, 23 Oct 2021 03:37:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F35F424218;
	Sat, 23 Oct 2021 03:37:40 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 9EA6B21331
 for <openrisc@lists.librecores.org>; Sat, 23 Oct 2021 03:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634953057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMIfEUdyS7S9YycGnN8abTq0K/b0QBW0FaCGofvAkWQ=;
 b=EbypiSI9eB9R+zSYI6XR191es+Ud0mwi4d9uVzZyW42UnBW+xjVwL+UzxFcWdQ7zbI0Tv9
 v+k9YhEwjzeXX/IM6qWIYk4ip9sZzL/FPqnzRNhNHYuldpp8PhoUL7uNyrPOqcS4+TBnIr
 VTlLaYuGno34WY9NKuCT2SDtzJQAnqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-dGKLLbnsONGXIqdLVyqF3w-1; Fri, 22 Oct 2021 21:37:31 -0400
X-MC-Unique: dGKLLbnsONGXIqdLVyqF3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FC5362F8;
 Sat, 23 Oct 2021 01:37:27 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.16.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1F817CEE;
 Sat, 23 Oct 2021 01:37:23 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
From: Waiman Long <longman@redhat.com>
Message-ID: <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
Date: Fri, 22 Oct 2021 21:37:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022120058.1031690-1-arnd@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-ia64@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, linux-parisc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>,
 Heiko Carstens <hca@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gMTAvMjIvMjEgNzo1OSBBTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBGcm9tOiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+Cj4gcGFyaXNjLCBpYTY0IGFuZCBwb3dlcnBjMzIgYXJl
IHRoZSBvbmx5IHJlbWFpbmluZyBhcmNoaXRlY3R1cmVzIHRoYXQKPiBwcm92aWRlIGN1c3RvbSBh
cmNoX3tzcGluLHJlYWQsd3JpdGV9X2xvY2tfZmxhZ3MoKSBmdW5jdGlvbnMsIHdoaWNoIGFyZQo+
IG1lYW50IHRvIHJlLWVuYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHdhaXRpbmcgZm9yIGEgc3Bpbmxv
Y2suCj4KPiBIb3dldmVyLCBub25lIG9mIHRoZXNlIGNhbiBhY3R1YWxseSBydW4gaW50byB0aGlz
IGNvZGVwYXRoLCBiZWNhdXNlCj4gaXQgaXMgb25seSBjYWxsZWQgb24gYXJjaGl0ZWN0dXJlcyB3
aXRob3V0IENPTkZJR19HRU5FUklDX0xPQ0tCUkVBSywKPiBvciB3aGVuIENPTkZJR19ERUJVR19M
T0NLX0FMTE9DIGlzIHNldCB3aXRob3V0IENPTkZJR19MT0NLREVQLCBhbmQgbm9uZQo+IG9mIHRo
b3NlIGNvbWJpbmF0aW9ucyBhcmUgcG9zc2libGUgb24gdGhlIHRocmVlIGFyY2hpdGVjdHVyZXMu
Cj4KPiBHb2luZyBiYWNrIGluIHRoZSBnaXQgaGlzdG9yeSwgaXQgYXBwZWFycyB0aGF0IGFyY2gv
bW4xMDMwMCBtYXkgaGF2ZQo+IGJlZW4gYWJsZSB0byBydW4gaW50byB0aGlzIGNvZGUgcGF0aCwg
YnV0IHRoZXJlIGlzIGEgZ29vZCBjaGFuY2UgdGhhdAo+IGl0IG5ldmVyIHdvcmtlZC4gT24gdGhl
IGFyY2hpdGVjdHVyZXMgdGhhdCBzdGlsbCBleGlzdCwgaXQgd2FzCj4gYWxyZWFkeSBpbXBvc3Np
YmxlIHRvIGhpdCBiYWNrIGluIDIwMDggYWZ0ZXIgdGhlIGludHJvZHVjdGlvbiBvZgo+IENPTkZJ
R19HRU5FUklDX0xPQ0tCUkVBSywgYW5kIHBvc3NpYmx5IGVhcmxpZXIuCj4KPiBBcyB0aGlzIGlz
IGFsbCBkZWFkIGNvZGUsIGp1c3QgcmVtb3ZlIGl0IGFuZCB0aGUgaGVscGVyIGZ1bmN0aW9ucyBi
dWlsdAo+IGFyb3VuZCBpdC4gRm9yIGFyY2gvaWE2NCwgdGhlIGlubGluZSBhc20gY291bGQgYmUg
Y2xlYW5lZCB1cCwgYnV0Cj4gaXQgc2VlbXMgc2FmZXIgdG8gbGVhdmUgaXQgdW50b3VjaGVkLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCkRvZXMgdGhh
dCBtZWFuIHdlIGNhbiBhbHNvIHJlbW92ZSB0aGUgR0VORVJJQ19MT0NLQlJFQUsgY29uZmlnIG9w
dGlvbiAKZnJvbSB0aGUgS2NvbmZpZyBmaWxlcyBhcyB3ZWxsPwoKQ2hlZXJzLApMb25nbWFuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

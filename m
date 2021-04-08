Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 17B01358D23
	for <lists+openrisc@lfdr.de>; Thu,  8 Apr 2021 21:01:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8F1DF21314;
	Thu,  8 Apr 2021 21:01:12 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by mail.librecores.org (Postfix) with ESMTP id 59402211BC
 for <openrisc@lists.librecores.org>; Thu,  8 Apr 2021 21:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617908469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYj2NbbPHdZxWOqVjXDc+Fhrs0vHkYF53Hr5bnrf7Wk=;
 b=bujTuDwtqUbac9TaJkgVoNGOV7ArZULDtwOBux/apvqbk7jteL+QPtExtDqk/ofWsMy9Dw
 b9aahehhVH5G+CqdYD8BxmIWAFzA4S3ZtiDNX2gEXubOtMRCh7YmEpMltEkfmJu8Sv3PaS
 Y55bKabPj7TSxNCrq9KcCf9hXNkEvL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-nv9j8raePK-o-0Web69C_A-1; Thu, 08 Apr 2021 15:01:04 -0400
X-MC-Unique: nv9j8raePK-o-0Web69C_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25331883527;
 Thu,  8 Apr 2021 19:01:02 +0000 (UTC)
Received: from llong.remote.csb (ovpn-119-36.rdu2.redhat.com [10.10.119.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12A63101F501;
 Thu,  8 Apr 2021 19:00:59 +0000 (UTC)
To: Stafford Horne <shorne@gmail.com>, Boqun Feng <boqun.feng@gmail.com>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
 <YGyRrBjomDCPOBUd@boqun-archlinux>
 <20210406235208.GG3288043@lianli.shorne-pla.net>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <1199af5f-275a-5812-fc73-f1d33449036b@redhat.com>
Date: Thu, 8 Apr 2021 15:00:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210406235208.GG3288043@lianli.shorne-pla.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Subject: Re: [OpenRISC] [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org, guoren@kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNC82LzIxIDc6NTIgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+Cj4gRm9yIE9wZW5SSVND
IEkgZGlkIGFjayB0aGUgcGF0Y2ggdG8gY29udmVydCB0bwo+IENPTkZJR19BUkNIX1VTRV9RVUVV
RURfU1BJTkxPQ0tTX1hDSEczMj15LiAgQnV0IEkgdGhpbmsgeW91IGFyZSByaWdodCwgdGhlCj4g
Z2VuZXJpYyBjb2RlIGluIHhjaGdfdGFpbCBhbmQgdGhlIHhjaGcxNiBlbXVsYXRpb24gY29kZSBp
biBwcm9kdWNlZCBieSBPcGVuUklTQwo+IHVzaW5nIHhjaGczMiB3b3VsZCBwcm9kdWNlIHZlcnkg
c2ltaWxhciBjb2RlLiAgSSBoYXZlIG5vdCBjb21wYXJlZCBpbnN0cnVjdGlvbnMsCj4gYnV0IGl0
IGRvZXMgc2VlbSBsaWtlIGR1cGxpY2F0ZSBmdW5jdGlvbmFsaXR5Lgo+Cj4gV2h5IGRvZXNuJ3Qg
UklTQy1WIGFkZCB0aGUgeGNoZzE2IGVtdWxhdGlvbiBjb2RlIHNpbWlsYXIgdG8gT3BlblJJU0M/
ICBGb3IKPiBPcGVuUklTQyB3ZSBhZGRlZCB4Y2hnMTYgYW5kIHhjaGc4IGVtdWxhdGlvbiBjb2Rl
IHRvIGVuYWJsZSBxc3BpbmxvY2tzLiAgU28KPiBvbmUgdGhvdWdodCBpcyB3aXRoIENPTkZJR19B
UkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTX1hDSEczMj15LCBjYW4gd2UgcmVtb3ZlIG91cgo+IHhj
aGcxNi94Y2hnOCBlbXVsYXRpb24gY29kZT8KCkZvciB0aGUgcmVjb3JkLCB0aGUgbGF0ZXN0IHFz
cGlubG9jayBjb2RlIGRvZXNuJ3QgdXNlIHhjaGc4IGFueW1vcmUuIEl0IApzdGlsbCBuZWVkIHhj
aGcxNiwgdGhvdWdoLgoKQ2hlZXJzLApMb25nbWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

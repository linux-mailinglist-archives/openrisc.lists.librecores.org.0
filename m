Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D7A521FECC1
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 32A4B2028A;
	Thu, 18 Jun 2020 09:47:20 +0200 (CEST)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by mail.librecores.org (Postfix) with ESMTPS id 63A3120CA0
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 02:54:53 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mmn31DRrz9sRR;
 Wed, 17 Jun 2020 10:54:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592355289;
 bh=Tt4ck1L8nY61ACyfCaQSk9IvU7WHJrdCNXj+0siSSyg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X9ymJOnvys9Xta0MkoWBUczKpvqc1UyN/Q9aQyWmLXe1VKUTEmNDQSj0rsR9Q534F
 p6Cep2OQrqfnlebt9PQxQzVrQBhhGf8vxbnkZ2KkloITdv6wE3e3fWf2KzjAQ/3rHv
 4Rf2KtyRVAUQ0TfXasgP2KtS5MyWwwXfSxOEHZFxwBGwJ77QG/uKkxjIM9la7HY3Yo
 s6mWsZ+5Aa9gVpDy6HW9lFlvnILbbuGiSBVRHnfji5SIv8PgYQDi4XcBz//pG5rD8Z
 yHLXPGR8ugwb3hM4yDbup0N8aruEnPrwavrRY0cCsW8tvoiEuDekDUjg2hB93vQcq9
 r0IQCg06h+QGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Xu <peterx@redhat.com>
In-Reply-To: <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
References: <20200615221607.7764-1-peterx@redhat.com>
 <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
Date: Wed, 17 Jun 2020 10:55:14 +1000
Message-ID: <87imfqecjx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH 00/25] mm: Page fault accounting cleanups
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cml0ZXM6Cj4g
T24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMzoxNiBQTSBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5j
b20+IHdyb3RlOgo+PiBUaGlzIHNlcmllcyB0cmllcyB0byBhZGRyZXNzIGFsbCBvZiB0aGVtIGJ5
IGludHJvZHVjaW5nIG1tX2ZhdWx0X2FjY291bnRpbmcoKQo+PiBmaXJzdCwgc28gdGhhdCB3ZSBt
b3ZlIGFsbCB0aGUgcGFnZSBmYXVsdCBhY2NvdW50aW5nIGludG8gdGhlIGNvbW1vbiBjb2RlIGJh
c2UsCj4+IHRoZW4gY2FsbCBpdCBwcm9wZXJseSBmcm9tIGFyY2ggcGYgaGFuZGxlcnMganVzdCBs
aWtlIGhhbmRsZV9tbV9mYXVsdCgpLgo+Cj4gSG1tLgo+Cj4gU28gaGF2aW5nIGxvb2tlZCBhdCB0
aGlzIGEgYml0IG1vcmUsIEknZCBhY3R1YWxseSBsaWtlIHRvIGdvIGV2ZW4KPiBmdXJ0aGVyLCBh
bmQganVzdCBnZXQgcmlkIG9mIHRoZSBwZXItYXJjaGl0ZWN0dXJlIGNvZGUgX2VudGlyZWx5Xy4K
CjxzbmlwPgoKPiBPbmUgZGV0YWlsIHdvcnRoIG5vdGluZzogSSBkbyB3b25kZXIgaWYgd2Ugc2hv
dWxkIHB1dCB0aGUKPgo+ICAgICBwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVM
VFMsIDEsIHJlZ3MsIGFkZHIpOwo+Cj4ganVzdCBpbiB0aGUgYXJjaCBjb2RlIGF0IHRoZSB0b3Ag
b2YgdGhlIGZhdWx0IGhhbmRsaW5nLCBhbmQgY29uc2lkZXIKPiBpdCBlbnRpcmVseSB1bnJlbGF0
ZWQgdG8gdGhlIG1ham9yL21pbm9yIGZhdWx0IGhhbmRsaW5nLiBUaGUKPiBtYWpvci9taW5vciBm
YXVsdHMgZnVuZGFtbmV0YWxseSBhcmUgYWJvdXQgc3VjY2Vzc2VzLiBCdXQgdGhlIHBsYWluCj4g
UEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUUyBjb3VsZCBiZSBhYm91dCB0aGluZ3MgdGhhdCBmYWls
LCBpbmNsdWRpbmcKPiB0aGluZ3MgdGhhdCBuZXZlciBldmVuIGdldCB0byB0aGlzIHBvaW50IGF0
IGFsbC4KClllYWggSSB0aGluayB3ZSBzaG91bGQga2VlcCBpdCBpbiB0aGUgYXJjaCBjb2RlIGF0
IHJvdWdobHkgdGhlIHRvcC4KCklmIGl0J3MgbW92ZWQgdG8gdGhlIGVuZCB5b3UgY291bGQgaGF2
ZSBhIHByb2Nlc3Mgc3Bpbm5pbmcgdGFraW5nIGJhZApwYWdlIGZhdWx0cyAoYW5kIGZpeGluZyB0
aGVtIHVwKSwgYW5kIHNlZSBubyBzaWduIG9mIGl0IGZyb20gdGhlIHBlcmYKcGFnZSBmYXVsdCBj
b3VudGVycy4KCmNoZWVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

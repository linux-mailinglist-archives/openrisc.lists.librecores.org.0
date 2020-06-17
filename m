Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DDB9A1FECC2
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8DA4D20BB4;
	Thu, 18 Jun 2020 09:47:21 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id AABE220CAD
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 10:04:13 +0200 (CEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91CE021475;
 Wed, 17 Jun 2020 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592381051;
 bh=MjCLvKpmywtlENNu3L8WcjVAZUYXfsV93TDu3ReXKuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JTiufBj0BMszSpkVUzi+gNk/qprMzw2wYVoJRieWtNmkrCUlTJiL+eUPkxjEPJZ7D
 Pl+CdboZUILER+bWki4NgM0L7KE262coRqRGnhsGEroSN9Uf1CdlIdoIHJwTchzbUV
 5UjKXESI9ZrCTGdCfmJKt9pER0l8tsQDgS//NF2k=
Date: Wed, 17 Jun 2020 09:04:06 +0100
From: Will Deacon <will@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Message-ID: <20200617080405.GA3208@willie-the-truck>
References: <20200615221607.7764-1-peterx@redhat.com>
 <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
 <87imfqecjx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87imfqecjx.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Peter Xu <peterx@redhat.com>, openrisc@lists.librecores.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMTA6NTU6MTRBTSArMTAwMCwgTWljaGFlbCBFbGxlcm1h
biB3cm90ZToKPiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+
IHdyaXRlczoKPiA+IE9uIE1vbiwgSnVuIDE1LCAyMDIwIGF0IDM6MTYgUE0gUGV0ZXIgWHUgPHBl
dGVyeEByZWRoYXQuY29tPiB3cm90ZToKPiA+PiBUaGlzIHNlcmllcyB0cmllcyB0byBhZGRyZXNz
IGFsbCBvZiB0aGVtIGJ5IGludHJvZHVjaW5nIG1tX2ZhdWx0X2FjY291bnRpbmcoKQo+ID4+IGZp
cnN0LCBzbyB0aGF0IHdlIG1vdmUgYWxsIHRoZSBwYWdlIGZhdWx0IGFjY291bnRpbmcgaW50byB0
aGUgY29tbW9uIGNvZGUgYmFzZSwKPiA+PiB0aGVuIGNhbGwgaXQgcHJvcGVybHkgZnJvbSBhcmNo
IHBmIGhhbmRsZXJzIGp1c3QgbGlrZSBoYW5kbGVfbW1fZmF1bHQoKS4KPiA+Cj4gPiBIbW0uCj4g
Pgo+ID4gU28gaGF2aW5nIGxvb2tlZCBhdCB0aGlzIGEgYml0IG1vcmUsIEknZCBhY3R1YWxseSBs
aWtlIHRvIGdvIGV2ZW4KPiA+IGZ1cnRoZXIsIGFuZCBqdXN0IGdldCByaWQgb2YgdGhlIHBlci1h
cmNoaXRlY3R1cmUgY29kZSBfZW50aXJlbHlfLgo+IAo+IDxzbmlwPgo+IAo+ID4gT25lIGRldGFp
bCB3b3J0aCBub3Rpbmc6IEkgZG8gd29uZGVyIGlmIHdlIHNob3VsZCBwdXQgdGhlCj4gPgo+ID4g
ICAgIHBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19QQUdFX0ZBVUxUUywgMSwgcmVncywgYWRk
cik7Cj4gPgo+ID4ganVzdCBpbiB0aGUgYXJjaCBjb2RlIGF0IHRoZSB0b3Agb2YgdGhlIGZhdWx0
IGhhbmRsaW5nLCBhbmQgY29uc2lkZXIKPiA+IGl0IGVudGlyZWx5IHVucmVsYXRlZCB0byB0aGUg
bWFqb3IvbWlub3IgZmF1bHQgaGFuZGxpbmcuIFRoZQo+ID4gbWFqb3IvbWlub3IgZmF1bHRzIGZ1
bmRhbW5ldGFsbHkgYXJlIGFib3V0IHN1Y2Nlc3Nlcy4gQnV0IHRoZSBwbGFpbgo+ID4gUEVSRl9D
T1VOVF9TV19QQUdFX0ZBVUxUUyBjb3VsZCBiZSBhYm91dCB0aGluZ3MgdGhhdCBmYWlsLCBpbmNs
dWRpbmcKPiA+IHRoaW5ncyB0aGF0IG5ldmVyIGV2ZW4gZ2V0IHRvIHRoaXMgcG9pbnQgYXQgYWxs
Lgo+IAo+IFllYWggSSB0aGluayB3ZSBzaG91bGQga2VlcCBpdCBpbiB0aGUgYXJjaCBjb2RlIGF0
IHJvdWdobHkgdGhlIHRvcC4KCkkgYWdyZWUuIEl0J3MgYSBuaWNlIGlkZWEgdG8gY29uc29saWRh
dGUgdGhlIGNvZGUsIGJ1dCBJIGRvbid0IHNlZSB0aGF0Cml0J3MgcmVhbGx5IHBvc3NpYmxlIGZv
ciBQRVJGX0NPVU5UX1NXX1BBR0VfRkFVTFRTIHdpdGhvdXQgc2lnbmlmaWNhbnRseQpjaGFuZ2lu
ZyB0aGUgc2VtYW50aWNzIChhbmQgYSBwb3RlbnRpYWxseSBsZXNzIHVzZWZ1bCB3YXkuIE9mIGNv
dXJzZSwKbW92aW5nIG1vcmUgb2YgZG9fcGFnZV9mYXVsdCgpIG91dCBvZiB0aGUgYXJjaCBjb2Rl
IHdvdWxkIGJlIGdyZWF0LCBidXQKdGhhdCdzIGEgbXVjaCBiaWdnZXIgZWZmb3J0LgoKPiBJZiBp
dCdzIG1vdmVkIHRvIHRoZSBlbmQgeW91IGNvdWxkIGhhdmUgYSBwcm9jZXNzIHNwaW5uaW5nIHRh
a2luZyBiYWQKPiBwYWdlIGZhdWx0cyAoYW5kIGZpeGluZyB0aGVtIHVwKSwgYW5kIHNlZSBubyBz
aWduIG9mIGl0IGZyb20gdGhlIHBlcmYKPiBwYWdlIGZhdWx0IGNvdW50ZXJzLgoKVGhlIGN1cnJl
bnQgYXJtNjQgYmVoYXZpb3VyIGlzIHRoYXQgd2UgcmVjb3JkIFBFUkZfQ09VTlRfU1dfUEFHRV9G
QVVMVFMKaWYgX2FsbF8gb2YgdGhlIGZvbGxvd2luZyBhcmUgdHJ1ZToKCiAgMS4gVGhlIGZhdWx0
IGlzbid0IGhhbmRsZWQgYnkga3Byb2JlcwogIDIuIFRoZSBwYWdlZmF1bHQgaGFuZGxlciBpcyBl
bmFibGVkCiAgMy4gV2UgaGF2ZSBhbiBtbSAoY3VycmVudC0+bW0pCiAgNC4gVGhlIGZhdWx0IGlz
bid0IGFuIHVuZXhwZWN0ZWQga2VybmVsIGZhdWx0IG9uIGEgdXNlciBhZGRyZXNzICh3ZSBvb3Bz
CiAgICAgYW5kIGtpbGwgdGhlIHRhc2sgaW4gdGhpcyBjYXNlKQoKV2hpY2ggbG9vc2VseSBjb3Jy
ZXNwb25kcyB0byAid2UgdG9vayBhIGZhdWx0IG9uIGEgdXNlciBhZGRyZXNzIHRoYXQgaXQKbG9v
a3MgbGlrZSB3ZSBjYW4gaGFuZGxlIi4KClRoYXQgc2FpZCwgSSdtIGhhcHB5IHRvIHR3ZWFrIHRo
aXMgaWYgaXQgYnJpbmdzIHVzIGludG8gbGluZSB3aXRoIG90aGVyCmFyY2hpdGVjdHVyZXMuCgpX
aWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE3439729
	for <lists+openrisc@lfdr.de>; Mon, 25 Oct 2021 15:06:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD3E123CBB;
	Mon, 25 Oct 2021 15:06:45 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id AF4862419D
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 15:06:44 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F30006108D
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635167203;
 bh=ZCuob8BZrhlG+EmJNscDR7p2oOKkE8Oq9/x5u4oFHEA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rjOPvUdJRFt+C9UNBEWqTe13JML4EB3zOwhCKERYPTuYIBCm/KanC0F8RaQduPrwV
 klq+bcLolRr9EV7XsqzAmolFYphiSWru24h6VEOLGs83iKRzsUfUDBqTnGm3Pik+c2
 ozYkc3H57UBl/Z+aThlgXRcvE+SI5/0MPsloo3IswAWMA6vfF9K+iVUPFleyhCoYsK
 erur4poO81/SfZJuaF7vy9Gb7SXgFWs44y7WHlUrfvcFIzyjGdYpJ4sm7cR+O50BK0
 ePMEwGIhpx+Eb/C4NNBwMUwqcxY2nzTAZD32gCk7H1xBMA3LMCcZ6HiaOmFasKK6KT
 haSe42j1LD+cQ==
Received: by mail-wm1-f47.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so13117511wme.0
 for <openrisc@lists.librecores.org>; Mon, 25 Oct 2021 06:06:42 -0700 (PDT)
X-Gm-Message-State: AOAM533ZvKW26Ijod7c13b04ERhamRsZOD2doNi12DRDKCEBxpcK1bcp
 3JxLc62UTLiMFZEf2+8NvhFvEieoOUAj11pwouo=
X-Google-Smtp-Source: ABdhPJzvjBncUZE2QFv7r8anYBis3Hwxw5+smqgbcmZGe49Rh+5b7Sf365AJDO4MLIyZVs8sWDAX066taTW3DQLxG28=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr19963769wmg.35.1635167201284; 
 Mon, 25 Oct 2021 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
In-Reply-To: <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Oct 2021 15:06:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
Message-ID: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
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

T24gTW9uLCBPY3QgMjUsIDIwMjEgYXQgMTE6NTcgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiBPbiBTYXQsIE9jdCAyMywgMjAyMSBhdCAwNjowNDo1N1BN
ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gT24gU2F0LCBPY3QgMjMsIDIwMjEgYXQg
MzozNyBBTSBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4+IE9u
IDEwLzIyLzIxIDc6NTkgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiA+ID4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4gPgo+ID4gPiA+IEFzIHRoaXMgaXMgYWxs
IGRlYWQgY29kZSwganVzdCByZW1vdmUgaXQgYW5kIHRoZSBoZWxwZXIgZnVuY3Rpb25zIGJ1aWx0
Cj4gPiA+ID4gYXJvdW5kIGl0LiBGb3IgYXJjaC9pYTY0LCB0aGUgaW5saW5lIGFzbSBjb3VsZCBi
ZSBjbGVhbmVkIHVwLCBidXQKPiA+ID4gPiBpdCBzZWVtcyBzYWZlciB0byBsZWF2ZSBpdCB1bnRv
dWNoZWQuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5k
QGFybmRiLmRlPgo+ID4gPgo+ID4gPiBEb2VzIHRoYXQgbWVhbiB3ZSBjYW4gYWxzbyByZW1vdmUg
dGhlIEdFTkVSSUNfTE9DS0JSRUFLIGNvbmZpZyBvcHRpb24KPiA+ID4gZnJvbSB0aGUgS2NvbmZp
ZyBmaWxlcyBhcyB3ZWxsPwo+ID4KPiA+ICBJIGNvdWxkbid0IGZpZ3VyZSB0aGlzIG91dC4KPiA+
Cj4gPiBXaGF0IEkgc2VlIGlzIHRoYXQgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlcyBzZXR0aW5nIEdF
TkVSSUNfTE9DS0JSRUFLIGFyZQo+ID4gbmRzMzIsIHBhcmlzYywgcG93ZXJwYywgczM5MCwgc2gg
YW5kIHNwYXJjNjQsIHdoaWxlIHRoZSBvbmx5IGFyY2hpdGVjdHVyZXMKPiA+IGltcGxlbWVudGlu
ZyBhcmNoX3NwaW5faXNfY29udGVuZGVkKCkgYXJlIGFybTMyLCBjc2t5IGFuZCBpYTY0Lgo+ID4K
PiA+IFRoZSBwYXJ0IEkgZG9uJ3QgdW5kZXJzdGFuZCBpcyB3aGV0aGVyIHRoZSBvcHRpb24gYWN0
dWFsbHkgZG9lcyBhbnl0aGluZwo+ID4gdXNlZnVsIGFueSBtb3JlIGFmdGVyIGNvbW1pdCBkODlj
NzAzNTZhY2YgKCJsb2NraW5nL2NvcmU6IFJlbW92ZSBicmVha19sb2NrCj4gPiBmaWVsZCB3aGVu
IENPTkZJR19HRU5FUklDX0xPQ0tCUkVBSz15IikuCj4KPiBVcmdoLCB3aGF0IGEgbWVzcy4uIEFG
QUlDVCB0aGVyZSdzIHN0aWxsIGNvZGUgaW4KPiBrZXJuZWwvbG9ja2luZy9zcGlubG9jay5jIHRo
YXQgcmVsaWVzIG9uIGl0LiBTcGVjaWZpY2FsbHkgd2hlbgo+IEdFTkVSSUNfTE9DS0JSRUFLPXkg
d2Ugc2VlbSB0byBjcmVhdGUgX2xvY2sqKCkgdmFyaWFudHMgdGhhdCBhcmUKPiBiYXNpY2FsbHkg
VGFTIGxvY2tzIHdoaWNoIGRyb3AgcHJlZW1wdC9pcnEgZGlzYWJsZSB3aGlsZSBzcGlubmluZy4K
Pgo+IEFueWJvZHkgaGF2aW5nIHRoaXMgb24gYW5kIG5vdCBoYXZpbmcgbmF0aXZlIFRhUyBsb2Nr
cyBpcyBpbiBmb3IgYSBydWRlCj4gc3VycHJpc2UgSSBzdXBwb3NlLi4uIHNwYXJjNjQgYmVpbmcg
dGhlIG9idmlvdXMgY2FuZGlkYXRlIHRoZXJlIDovCgpJcyB0aGlzIGEgcHJvYmxlbSBvbiBzMzkw
IGFuZCBwb3dlcnBjLCB0aG9zZSB0d28gYmVpbmcgdGhlIG9uZXMKdGhhdCBtYXR0ZXIgaW4gcHJh
Y3RpY2U/CgpPbiBzMzkwLCB3ZSBwaWNrIGJldHdlZW4gdGhlIGNtcHhjaGcoKSBiYXNlZCBkaXJl
Y3RlZC15aWVsZCB3aGVuCnJ1bm5pbmcgb24gdmlydHVhbGl6ZWQgQ1BVcywgYW5kIGEgbm9ybWFs
IHFzcGlubG9jayB3aGVuIHJ1bm5pbmcgb24gYQpkZWRpY2F0ZWQgQ1BVLgoKT24gUG93ZXJQQywg
d2UgcGljayBhdCBjb21waWxlLXRpbWUgYmV0d2VlbiBlaXRoZXIgdGhlIHFzcGlubG9jawooZGVm
YXVsdC1lbmFibGVkIG9uIEJvb2szUy02NCwgaS5lLiBhbGwgc2VydmVyIGNoaXBzKSBvciBhIGxs
L3NjIGJhc2VkCnNwaW5sb2NrIHBsdXMgdm1feWllbGQoKSAoZGVmYXVsdCBvbiBlbWJlZGRlZCBh
bmQgMzItYml0IG1hYykuCgogICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

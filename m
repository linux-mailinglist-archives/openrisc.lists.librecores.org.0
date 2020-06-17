Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 982911FECC5
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6378120BD3;
	Thu, 18 Jun 2020 09:47:24 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by mail.librecores.org (Postfix) with ESMTP id 9F88D20AEF
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 18:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592410256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pwPndLdm35gmxUTd/yGdLqQ8FsjkAPP7/6FDJCdV2mM=;
 b=TpgYFouB6byzj0UZaYcyVj2ABeZTbSlcx9sqseBKczj7HB6+cAXYDJGNAewBEZOusq9ag8
 RUnwDzH3PZ8yCQHr+9Kg/q4YqPyMUUSdsRMdn5zAKxWd7VGw/Q3yihpd1Dd5XKk/bxVkPA
 CwDX+93Mm3KzfV4bZ9HpUCSrnkJAgt4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-91uI-oWrOuOzLJgu5M9tTg-1; Wed, 17 Jun 2020 12:10:52 -0400
X-MC-Unique: 91uI-oWrOuOzLJgu5M9tTg-1
Received: by mail-qt1-f200.google.com with SMTP id y5so2085435qto.10
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 09:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pwPndLdm35gmxUTd/yGdLqQ8FsjkAPP7/6FDJCdV2mM=;
 b=KVsO5n3ahWRwNtyGXxg0Gt071sqnytxy0HYwzfyjOlJDLjZDH/RiPUo6vfc42u6s33
 8GnEtn3MSirrQUjIfS4gnLXnI6RGtIBw8/W+Lbd8GuOvpEg4cAauhRlIwzK5InI3rf3r
 8ttR2OyT76Koef/udRaac41nf59FBRg2sKHOsEPVcEzsg+9St4imxkY/GqNQPSSozW4E
 2/HNEGoJHaJjjz+40VgUv9/2aiB6lQGUpH9G1/uAPZfTr4lYptUrf0WOdReN+ht94SDt
 jEWBgcG3fVuCkh4fWAornJUhaEqBRJ9LKsDqo3uxivk4wTFimzbpmpwVYJ5zIkRv7cyX
 eJ7Q==
X-Gm-Message-State: AOAM530A2tQlf1jrGgyfk35PMsRrwggCf+ie73BquLLMLRT1inotRGJl
 vzkvIo1ly6O5S7DWfhq0A49e2H7VvwQ5hWKO/D77Vwl1DG8smgrnSytSo83WY/0t71VvnLlMMEr
 aPbBymCZT+yyqK/gjw2ytZh+HZQ==
X-Received: by 2002:ac8:fb4:: with SMTP id b49mr27502925qtk.323.1592410252161; 
 Wed, 17 Jun 2020 09:10:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHPvRTdazh3ByXAbV1+DQb3IK/Hxo+xAXMp5hAEJHzAOp6L2Jx/mkBgpOD51Mg4XUcXd/11g==
X-Received: by 2002:ac8:fb4:: with SMTP id b49mr27502878qtk.323.1592410251778; 
 Wed, 17 Jun 2020 09:10:51 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id b4sm265252qka.133.2020.06.17.09.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 09:10:51 -0700 (PDT)
Date: Wed, 17 Jun 2020 12:10:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Will Deacon <will@kernel.org>
Message-ID: <20200617161049.GE76766@xz-x1>
References: <20200615221607.7764-1-peterx@redhat.com>
 <CAHk-=wiTjaXHu+uxMi0xCZQOm4KVr0MucECAK=Zm4p4YZZ1XEg@mail.gmail.com>
 <87imfqecjx.fsf@mpe.ellerman.id.au>
 <20200617080405.GA3208@willie-the-truck>
MIME-Version: 1.0
In-Reply-To: <20200617080405.GA3208@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
 linux-s390 <linux-s390@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openrisc@lists.librecores.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMDk6MDQ6MDZBTSArMDEwMCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gT24gV2VkLCBKdW4gMTcsIDIwMjAgYXQgMTA6NTU6MTRBTSArMTAwMCwgTWljaGFlbCBF
bGxlcm1hbiB3cm90ZToKPiA+IExpbnVzIFRvcnZhbGRzIDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0
aW9uLm9yZz4gd3JpdGVzOgo+ID4gPiBPbiBNb24sIEp1biAxNSwgMjAyMCBhdCAzOjE2IFBNIFBl
dGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+PiBUaGlzIHNlcmllcyB0cmll
cyB0byBhZGRyZXNzIGFsbCBvZiB0aGVtIGJ5IGludHJvZHVjaW5nIG1tX2ZhdWx0X2FjY291bnRp
bmcoKQo+ID4gPj4gZmlyc3QsIHNvIHRoYXQgd2UgbW92ZSBhbGwgdGhlIHBhZ2UgZmF1bHQgYWNj
b3VudGluZyBpbnRvIHRoZSBjb21tb24gY29kZSBiYXNlLAo+ID4gPj4gdGhlbiBjYWxsIGl0IHBy
b3Blcmx5IGZyb20gYXJjaCBwZiBoYW5kbGVycyBqdXN0IGxpa2UgaGFuZGxlX21tX2ZhdWx0KCku
Cj4gPiA+Cj4gPiA+IEhtbS4KPiA+ID4KPiA+ID4gU28gaGF2aW5nIGxvb2tlZCBhdCB0aGlzIGEg
Yml0IG1vcmUsIEknZCBhY3R1YWxseSBsaWtlIHRvIGdvIGV2ZW4KPiA+ID4gZnVydGhlciwgYW5k
IGp1c3QgZ2V0IHJpZCBvZiB0aGUgcGVyLWFyY2hpdGVjdHVyZSBjb2RlIF9lbnRpcmVseV8uCj4g
PiAKPiA+IDxzbmlwPgo+ID4gCj4gPiA+IE9uZSBkZXRhaWwgd29ydGggbm90aW5nOiBJIGRvIHdv
bmRlciBpZiB3ZSBzaG91bGQgcHV0IHRoZQo+ID4gPgo+ID4gPiAgICAgcGVyZl9zd19ldmVudChQ
RVJGX0NPVU5UX1NXX1BBR0VfRkFVTFRTLCAxLCByZWdzLCBhZGRyKTsKPiA+ID4KPiA+ID4ganVz
dCBpbiB0aGUgYXJjaCBjb2RlIGF0IHRoZSB0b3Agb2YgdGhlIGZhdWx0IGhhbmRsaW5nLCBhbmQg
Y29uc2lkZXIKPiA+ID4gaXQgZW50aXJlbHkgdW5yZWxhdGVkIHRvIHRoZSBtYWpvci9taW5vciBm
YXVsdCBoYW5kbGluZy4gVGhlCj4gPiA+IG1ham9yL21pbm9yIGZhdWx0cyBmdW5kYW1uZXRhbGx5
IGFyZSBhYm91dCBzdWNjZXNzZXMuIEJ1dCB0aGUgcGxhaW4KPiA+ID4gUEVSRl9DT1VOVF9TV19Q
QUdFX0ZBVUxUUyBjb3VsZCBiZSBhYm91dCB0aGluZ3MgdGhhdCBmYWlsLCBpbmNsdWRpbmcKPiA+
ID4gdGhpbmdzIHRoYXQgbmV2ZXIgZXZlbiBnZXQgdG8gdGhpcyBwb2ludCBhdCBhbGwuCj4gPiAK
PiA+IFllYWggSSB0aGluayB3ZSBzaG91bGQga2VlcCBpdCBpbiB0aGUgYXJjaCBjb2RlIGF0IHJv
dWdobHkgdGhlIHRvcC4KPiAKPiBJIGFncmVlLiBJdCdzIGEgbmljZSBpZGVhIHRvIGNvbnNvbGlk
YXRlIHRoZSBjb2RlLCBidXQgSSBkb24ndCBzZWUgdGhhdAo+IGl0J3MgcmVhbGx5IHBvc3NpYmxl
IGZvciBQRVJGX0NPVU5UX1NXX1BBR0VfRkFVTFRTIHdpdGhvdXQgc2lnbmlmaWNhbnRseQo+IGNo
YW5naW5nIHRoZSBzZW1hbnRpY3MgKGFuZCBhIHBvdGVudGlhbGx5IGxlc3MgdXNlZnVsIHdheS4g
T2YgY291cnNlLAo+IG1vdmluZyBtb3JlIG9mIGRvX3BhZ2VfZmF1bHQoKSBvdXQgb2YgdGhlIGFy
Y2ggY29kZSB3b3VsZCBiZSBncmVhdCwgYnV0Cj4gdGhhdCdzIGEgbXVjaCBiaWdnZXIgZWZmb3J0
Lgo+IAo+ID4gSWYgaXQncyBtb3ZlZCB0byB0aGUgZW5kIHlvdSBjb3VsZCBoYXZlIGEgcHJvY2Vz
cyBzcGlubmluZyB0YWtpbmcgYmFkCj4gPiBwYWdlIGZhdWx0cyAoYW5kIGZpeGluZyB0aGVtIHVw
KSwgYW5kIHNlZSBubyBzaWduIG9mIGl0IGZyb20gdGhlIHBlcmYKPiA+IHBhZ2UgZmF1bHQgY291
bnRlcnMuCj4gCj4gVGhlIGN1cnJlbnQgYXJtNjQgYmVoYXZpb3VyIGlzIHRoYXQgd2UgcmVjb3Jk
IFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVMVFMKPiBpZiBfYWxsXyBvZiB0aGUgZm9sbG93aW5nIGFy
ZSB0cnVlOgo+IAo+ICAgMS4gVGhlIGZhdWx0IGlzbid0IGhhbmRsZWQgYnkga3Byb2Jlcwo+ICAg
Mi4gVGhlIHBhZ2VmYXVsdCBoYW5kbGVyIGlzIGVuYWJsZWQKPiAgIDMuIFdlIGhhdmUgYW4gbW0g
KGN1cnJlbnQtPm1tKQo+ICAgNC4gVGhlIGZhdWx0IGlzbid0IGFuIHVuZXhwZWN0ZWQga2VybmVs
IGZhdWx0IG9uIGEgdXNlciBhZGRyZXNzICh3ZSBvb3BzCj4gICAgICBhbmQga2lsbCB0aGUgdGFz
ayBpbiB0aGlzIGNhc2UpCj4gCj4gV2hpY2ggbG9vc2VseSBjb3JyZXNwb25kcyB0byAid2UgdG9v
ayBhIGZhdWx0IG9uIGEgdXNlciBhZGRyZXNzIHRoYXQgaXQKPiBsb29rcyBsaWtlIHdlIGNhbiBo
YW5kbGUiLgo+IAo+IFRoYXQgc2FpZCwgSSdtIGhhcHB5IHRvIHR3ZWFrIHRoaXMgaWYgaXQgYnJp
bmdzIHVzIGludG8gbGluZSB3aXRoIG90aGVyCj4gYXJjaGl0ZWN0dXJlcy4KCkkgc2VlLiAgSSds
bCBrZWVwIHRoZSBzZW1hbnRpY3MgZm9yIFBFUkZfQ09VTlRfU1dfUEFHRV9GQVVMVFMgaW4gdGhl
IG5leHQKdmVyc2lvbi4gIFRoYW5rcyBmb3IgYWxsIHRoZSBjb21tZW50cyEKCi0tIApQZXRlciBY
dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

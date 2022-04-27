Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A0B595124C4
	for <lists+openrisc@lfdr.de>; Wed, 27 Apr 2022 23:48:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 535A32431D;
	Wed, 27 Apr 2022 23:48:33 +0200 (CEST)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mail.librecores.org (Postfix) with ESMTPS id 4C95523F5C
 for <openrisc@lists.librecores.org>; Wed, 27 Apr 2022 23:48:31 +0200 (CEST)
Received: by mail-pj1-f41.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so2770809pjm.1
 for <openrisc@lists.librecores.org>; Wed, 27 Apr 2022 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FOKnnxCQ0DAVONl3XqngNyqax8O1G6N9sD/nAz2EBgk=;
 b=YldZ6eZs8Bh1Cc9nhbsWjnRSrdtBiXGk6ThGW+qsTvZDTf29cF5z5yoKRLYTgsgAxJ
 zKOqMkX701m48Rln9Is13vDQ/MdGu3755kRYKlO0xPhdab5qRe4FQ8OxlgkfqLje8QCw
 DMrDdxCyWIloSDGgmcePWAL7tm0SgjSopoksTaAWcvx+4a1tklkCrkZrLkgR72ehSRA7
 JrirxEs12amkEc7q1OfOBaLGQYYxE0nNqOse63mOP4YAYKVvSqbvE4ePm7dftAizJi31
 YBhKTZeyYOLjyzOoNo0K9WTLjnui7Q1Bm2Qs0GnWnC5eNbFTyW9H8bIOl4tscETN/5cT
 1q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FOKnnxCQ0DAVONl3XqngNyqax8O1G6N9sD/nAz2EBgk=;
 b=VxJk9fdJD+2ChNf3996PV7P0gAesG7ZO49qiVvoWk/ff+RmpeCIVHsyo6YJpeUthdC
 HlBqV5mv0b02eLrYoWeIqmWCml5cq8v8ANb7FLqx4RtQsCjY6AkC3TXSkFv/nTZqsk/d
 H6lAYihMEDyYbSIPhRbQ0N/Y+L5brvGHTh/GAqUaILgbnJhnZIu3ksIGfxVQVlnRakki
 cP9AE+0RDgSp8k5WGyNMBUb/Z2PBBj2d0jwGdHX5+XPEliqwXURYpn+P9Es6/NGO7AwO
 gg3qfN/i5qJ7y4uriKBtrFHJV5SHhuZTvE5MjdKB4tOAjaLJ+aBxAKY7wCQ9Au7TWcBL
 Ig1g==
X-Gm-Message-State: AOAM532HumzQdCZcO6hBEL9FJEBvqfmRleB+Ip5wqv8AdkuS7YlKnY+e
 jtuFP14hKG46hG8k+SDK+YY=
X-Google-Smtp-Source: ABdhPJzL4n4rDtMINCXp7DvCIqF20skSN3jDofPH84CjWyKXe6UK92NmfgfZT6xUP4w4WzKO+TeY0g==
X-Received: by 2002:a17:902:f685:b0:15e:538:3736 with SMTP id
 l5-20020a170902f68500b0015e05383736mr2329719plg.135.1651096109676; 
 Wed, 27 Apr 2022 14:48:29 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b00505da6251ebsm19657399pfn.154.2022.04.27.14.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 14:48:29 -0700 (PDT)
Date: Thu, 28 Apr 2022 06:48:27 +0900
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <Ymm6K3DjesAZR0OY@antec>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
Subject: Re: [OpenRISC] [Qemu-devel] [PATCH 2/7] target/openrisc: add
 shutdown logic
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMjcsIDIwMjIgYXQgMDc6NDc6MzNQTSArMDEwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBPbiBXZWQsIDI3IEFwciAyMDIyIGF0IDE4OjQ2LCBKYXNvbiBBLiBEb25lbmZlbGQg
PEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5IFN0YWZmb3JkLAo+ID4KPiA+IE9u
IE1vbiwgQXByIDE3LCAyMDE3IGF0IDA4OjIzOjUxQU0gKzA5MDAsIFN0YWZmb3JkIEhvcm5lIHdy
b3RlOgo+ID4gPiBJbiBvcGVucmlzYyBzaW11bGF0b3JzIHdlIHVzZSBob29rcyBsaWtlICdsLm5v
cCAxJyB0byBjYXVzZSB0aGUKPiA+ID4gc2ltdWxhdG9yIHRvIGV4aXQuICBJbXBsZW1lbnQgdGhh
dCBmb3IgcWVtdSB0b28uCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiBXYWxkZW1hciBCcm9ka29y
YiA8d2J4QG9wZW5hZGsub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8
c2hvcm5lQGdtYWlsLmNvbT4KPiA+Cj4gPiBJJ20gY3VyaW91cyBhcyB0byB3aHkgdGhpcyBuZXZl
ciBnb3QgbWVyZ2VkLiBJIG5vdGljZWQgSSdtIGVudGlyZWx5IGFibGUKPiA+IHRvIHNodXRkb3du
IG9yIHRvIHJlYm9vdCAod2hpY2ggaXMgbW9zdGx5IHdoYXQgSSBjYXJlIGFib3V0KSBMaW51eCBm
cm9tCj4gPiBPcGVuUklTQy4gSXQganVzdCBoYW5ncy4KPiAKPiBUaGlzIGtpbmQgb2YgdGhpbmcg
bmVlZHMgdG8gYmUgZWl0aGVyOgo+ICAoMSkgd2UncmUgbW9kZWxsaW5nIHJlYWwgaGFyZHdhcmUg
YW5kIHRoYXQgcmVhbCBoYXJkd2FyZSBoYXMgYQo+IGRldmljZSBvciBvdGhlciBtZWNoYW5pc20g
Z3Vlc3QgY29kZSBjYW4gcHJvZCB0byBjYXVzZSBhIHBvd2VyLW9mZgo+IG9yIHJlYm9vdC4gVGhl
biB3ZSBtb2RlbCB0aGF0IGRldmljZSwgYW5kIGd1ZXN0IGNvZGUgdHJpZ2dlcnMgYQo+IHNodXRk
b3duIG9yIHJlYm9vdCBleGFjdGx5IGFzIGl0IHdvdWxkIG9uIHRoZSByZWFsIGhhcmR3YXJlLgo+
ICAoMikgdGhlcmUgaXMgYW4gYXJjaGl0ZWN0dXJhbGx5IGRlZmluZWQgQUJJIGZvciBzaW11bGF0
b3JzLCBkZWJ1Zwo+IHN0dWJzLCBldGMsIHRoYXQgaW5jbHVkZXMgdmFyaW91cyBvcGVyYXRpb25z
IHR5cGljYWxseSBpbmNsdWRpbmcKPiBhbiAiZXhpdCB0aGUgc2ltdWxhdG9yIiBmdW5jdGlvbi4g
KEFybSBzZW1paG9zdGluZyBpcyBhbiBleGFtcGxlCj4gb2YgdGhpcy4pIEluIHRoYXQgY2FzZSB3
ZSBjYW4gaW1wbGVtZW50IHRoYXQgZnVuY3Rpb25hbGl0eSwKPiBndWFyZGVkIGJ5IGFuZCBjb250
cm9sbGVkIGJ5IHRoZSBhcHByb3ByaWF0ZSBjb21tYW5kIGxpbmUgb3B0aW9ucy4KPiAoVGhpcyBp
cyBnZW5lcmFsbHkgbm90IGFzIG5pY2UgYXMgb3B0aW9uIDEsIGJlY2F1c2UgdGhlIGd1ZXN0IGNv
ZGUKPiBoYXMgdG8gYmUgY29tcGlsZWQgdG8gaGF2ZSBzdXBwb3J0IGZvciBzZW1paG9zdGluZyBh
bmQgYWxzbyBiZWNhdXNlCj4gdHVybmluZyBpdCBvbiBpcyB1c3VhbGx5IGFsc28gZ2l2aW5nIGlt
cGxpY2l0IHBlcm1pc3Npb24gZm9yIHRoZQo+IGd1ZXN0IGNvZGUgdG8gcmVhZCBhbmQgd3JpdGUg
YXJiaXRyYXJ5IGhvc3QgZmlsZXMsIGV0Yy4pCj4gCj4gRWl0aGVyIHdheSwgdW5kb2N1bWVudGVk
IHJhbmRvbSBoYWNrcyBhcmVuJ3QgYSBnb29kIGlkZWEsIHdoaWNoCj4gaXMgd2h5IHRoaXMgd2Fz
bid0IG1lcmdlZC4KClllcywgdGhpcyBpcyB3aGF0IHdhcyBicm91Z2h0IHVwIGJlZm9yZS4gIEF0
IHRoYXQgdGltZSBzZW1paG9zdGluZyB3YXMgbWVudGlvbmVkCmFuZCBJIHRyaWVkIHRvIHVuZGVy
c3RhbmQgd2hhdCBpdCB3YXMgYnV0IGRpZG4ndCByZWFsbHkgdW5kZXJzdGFuZCBpdCBhcyBhIGdl
bmVyYWwKY29uY2VwdC4gIElzIHRoaXMgc29tZXRoaW5nIGFybSBzcGVjaWZpYz8KClNpbmNlIHRo
ZSBxZW11IG9yMWstc2ltIGRlZmluZXMgb3VyICJzaW11bGF0b3IiLCBJIHN1c3BlY3QgSSBjb3Vs
ZCBhZGQgYQpkZWZpbml0aW9uIG9mIG91ciBzaW11bGF0b3IgQUJJIHRvIHRoZSBPcGVuUklTQyBh
cmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbi4gIFRoZQpzaW11bGF0aW9uIHVzZXMgb2YgbC5ub3Ag
TiBhcyBBQkkgaG9va3MgaXMgYSBkZS1mYWN0byBzdGFuZGFyZCBmb3IgT3BlblJJU0MuCkZyb20g
dGhlIHdheSB5b3UgZGVzY3JpYmUgdGhpcyBub3cgSSB0YWtlIGl0IGlmIHdlIGRvY3VtZW50IHRo
aXMgYXMgYQphcmNoaXRlY3R1cmUgc2ltdWxhdGlvbiBBQkkgdGhlIHBhdGNoIHdvdWxkIGJlIGFj
Y2VwdGVkLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

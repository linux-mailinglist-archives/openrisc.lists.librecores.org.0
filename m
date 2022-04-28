Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E1A4A512F62
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 11:19:29 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 92F8F247D8;
	Thu, 28 Apr 2022 11:19:29 +0200 (CEST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mail.librecores.org (Postfix) with ESMTPS id B35EA211B2
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 11:19:27 +0200 (CEST)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2f7d621d1caso45600037b3.11
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 02:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vlJ5tZ82jdFNtNZPTiRXn0qlMgQFZyJANdIL6uPwMR8=;
 b=vCr7HPWwbX2BpAX9VP9zSH4LhJJ87vD63WvVO+CRo8WyLrmORW+2HTSXNz5wTKFddB
 EDMlg/0ZXqARyNIwk7v0t9nU9bfm97jpmem+HjzyVIfoJjAQGQWw2yvQob+FwRD9Icpo
 hQI3HVXHNC6veeyFh/gbVTkHgUQmkASV5tyivJCQUCTZuL60ihaZ2mTpbg0v/men077v
 Q0wdy8ywl7wyvaDkyTUkhQ0tEesed2axR1C8ZpS7IJGq4qipeOnG4MqPfbtEBhcNcCDJ
 5ba98kVKjuTYhnqNuspA0kwW2/rKJqFwCN2UjCL9SVGVOUmMpxZvH2HwdWp8ewGARIKg
 YfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlJ5tZ82jdFNtNZPTiRXn0qlMgQFZyJANdIL6uPwMR8=;
 b=M11fxMzURoXRD8W6cxh4K+RcGYttEPA5auj4GBS31BawcNb3NA/gfstkIOotbRgPU5
 bsFoxDsGi4nEEMNzF+ctHZwBE1w8eiML5WRpZIDVYdb6F1BMhqFZqBlMlyqmA9r5Ljfq
 54VhygBGA03nw1KjehmYQECdwYU7whewcx2Au3eI3Q7NSe+FzfAntMFPQrBBJQHyqmhQ
 dCF67b60UtiEsJPd1uLEDZwC7saJg7vJW66EYNI8eR//kTQDwYPJ0sKvWnVcylTPiTiz
 mlHTDO2pULUkD4xJIA/A7iLTXTa/Wi9X6UzpqK2LMddxG1GYW3qJqZ5CH16J7vTImAeD
 6sRQ==
X-Gm-Message-State: AOAM531eXBVSZOJn5nwNgu569d9/tSjLeZZbJyGsUgIAOgj5aGfIHjan
 QZBW1f8nyKH8QKBJcXS+073VVx+6xzxSX9eUUzfb/A==
X-Google-Smtp-Source: ABdhPJwtTv4J92SxpvEuOfTtMap/l5BCeyD09efoH9l1t6ohMMM1wHmT80VS3StfydtQvs6ZhekwWHBB9+oo0RO63xM=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr22847608ywb.469.1651137566560; Thu, 28
 Apr 2022 02:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec>
In-Reply-To: <Ymm6K3DjesAZR0OY@antec>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:19:15 +0100
Message-ID: <CAFEAcA-vPRHLPUi1ELET8eNMdZHk3Ftp35QmjZ2NX8B_ytiVfg@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
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

T24gV2VkLCAyNyBBcHIgMjAyMiBhdCAyMzoyNywgU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFp
bC5jb20+IHdyb3RlOgo+IFllcywgdGhpcyBpcyB3aGF0IHdhcyBicm91Z2h0IHVwIGJlZm9yZS4g
IEF0IHRoYXQgdGltZSBzZW1paG9zdGluZyB3YXMgbWVudGlvbmVkCj4gYW5kIEkgdHJpZWQgdG8g
dW5kZXJzdGFuZCB3aGF0IGl0IHdhcyBidXQgZGlkbid0IHJlYWxseSB1bmRlcnN0YW5kIGl0IGFz
IGEgZ2VuZXJhbAo+IGNvbmNlcHQuICBJcyB0aGlzIHNvbWV0aGluZyBhcm0gc3BlY2lmaWM/CgpR
RU1VIHVzZXMgInNlbWlob3N0aW5nIiBmb3IgdGhlIGdlbmVyYWwgY29uY2VwdCBvZiBhIHN5c2Nh
bGwtbGlrZQpBQkkgcHJvdmlkZWQgYnkgdGhlIG1vZGVsIHRoYXQgYWxsb3dzIGd1ZXN0IGNvZGUg
d3JpdHRlbiB0byB1c2UgaXQKdG8gYWNjZXNzIHNvbWUgZmFjaWxpdGllcyBhcyBpZiBpdCB3ZXJl
IGEgcHJvZ3JhbSBydW5uaW5nIG9uIHRoZSBob3N0CnJhdGhlciB0aGFuIHJ1bm5pbmcgb24gYmFy
ZSBtZXRhbC4gKEkgdGhpbmsgdGhlIHRlcm0gZGVyaXZlcyBvcmlnaW5hbGx5CmZyb20gdGhlIEFy
bSB0ZXJtIGZvciB0aGlzIGtpbmQgb2YgZnVuY3Rpb25hbGl0eSwgYnV0IHRoZSBjb25jZXB0IGlz
Cm5vdCBBcm0tc3BlY2lmaWMuKQoKQXJtIGRlZmluZXMgYW4gQUJJIHdoaWNoIGxvb2tzIGJhc2lj
YWxseSBsaWtlIGEgc2V0IG9mIHN5c2NhbGxzOgpjb2RlIHNldHMgdXAgc29tZSByZWdpc3RlcnMg
YW5kIGV4ZWN1dGVzIGEgc3BlY2lmaWMgU1ZDIG9yIEhMVApvciBvdGhlciBtYWdpYyBpbnN0cnVj
dGlvbiwgYW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyBzdXBwb3NlZCB0bwp0aGVuIGFjdCBvbiB0
aGF0LiBZb3UgY2FuIGRvIHRoaW5ncyBsaWtlICJvcGVuIGZpbGUiLCAicmVhZCBmaWxlIiwKImV4
aXQiLCBldGMuCiBodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2FiaS1hYS9ibG9iL21h
aW4vc2VtaWhvc3Rpbmcvc2VtaWhvc3RpbmcucnN0ClRoZSBpZGVhIGlzIHRoYXQgc2ltdWxhdG9y
cyBhbmQgYWxzbyBkZWJ1ZyBzdHVicyBvciBkZWJ1Z2dlcnMgY2FuCmltcGxlbWVudCB0aGlzLCBh
bmQgdGhlbiBiYXJlLW1ldGFsIGNvZGUgY2FuIGJlIHdyaXR0ZW4gdG8gdXNlIGl0LAptYWlubHkg
Zm9yIGRlYnVnZ2luZyBhbmQgdGVzdCBjYXNlIHB1cnBvc2VzLgoKVGhlIHJpc2MtdiBmb2xrcyBk
ZWNpZGVkIHRoZXkgbmVlZGVkIHNpbWlsYXIgZnVuY3Rpb25hbGl0eSwgYW5kCnRoYXQgdGhlIGVh
c2llc3Qgd2F5IHRvIGRvIHRoaXMgd2FzIHRvIGFsaWduIHdpdGggdGhlIEFybSBzcGVjaWZpY2F0
aW9uCmFuZCBkb2N1bWVudCB0aGUgcmlzYy12IHNwZWNpZmljIGJpdHM6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1zZW1paG9zdGluZy1zcGVjCgpTb21lIG90aGVyIGFyY2hpdGVjdHVy
ZXMgaGF2ZSBhbiBlcXVpdmFsZW50IHRoaW5nIGJ1dCB3aGljaCBpc24ndAp0aGUgc2FtZSBzZXQg
b2YgZnVuY3Rpb25zIGFzIHRoZSBBcm0gdmVyc2lvbjsgZWcgdGhlIG5pb3MyIHZlcnNpb24KaXMg
ZG9jdW1lbnRlZCBoZXJlOgpodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dpP3A9
bmV3bGliLWN5Z3dpbi5naXQ7YT1ibG9iO2Y9bGliZ2xvc3MvbmlvczIvbmlvczItc2VtaS50eHQ7
aGI9SEVBRAoKPiBTaW5jZSB0aGUgcWVtdSBvcjFrLXNpbSBkZWZpbmVzIG91ciAic2ltdWxhdG9y
IiwgSSBzdXNwZWN0IEkgY291bGQgYWRkIGEKPiBkZWZpbml0aW9uIG9mIG91ciBzaW11bGF0b3Ig
QUJJIHRvIHRoZSBPcGVuUklTQyBhcmNoaXRlY3R1cmUgc3BlY2lmaWNhdGlvbi4gIFRoZQo+IHNp
bXVsYXRpb24gdXNlcyBvZiBsLm5vcCBOIGFzIEFCSSBob29rcyBpcyBhIGRlLWZhY3RvIHN0YW5k
YXJkIGZvciBPcGVuUklTQy4KPiBGcm9tIHRoZSB3YXkgeW91IGRlc2NyaWJlIHRoaXMgbm93IEkg
dGFrZSBpdCBpZiB3ZSBkb2N1bWVudCB0aGlzIGFzIGEKPiBhcmNoaXRlY3R1cmUgc2ltdWxhdGlv
biBBQkkgdGhlIHBhdGNoIHdvdWxkIGJlIGFjY2VwdGVkLgoKSWYgaXQncyBzb21ldGhpbmcgdGhh
dCAoYSkgaXMgZG9jdW1lbnRlZCBvZmZpY2lhbGx5IHNvbWV3aGVyZSBhbmQKKGIpIGV2ZXJ5Ym9k
eSBpcyB1c2luZyBjb25zaXN0ZW50bHkgKGllIGd1ZXN0IGNvZGUgc3VjaCBhcyBHTlUgbmV3bGli
LApRRU1VLCBvdGhlciBzaW11bGF0b3JzLCBldGMpLCB0aGVuIHllcywgdGhhdCdzIE9LLiBJdCBz
b3VuZHMgbGlrZQp5b3UganVzdCBuZWVkIHRvIHdyaXRlIGRvd24gdGhlIGRldGFpbHMgb2YgeW91
ciBkZS1mYWN0byBzdGFuZGFyZAp0byB0dXJuIGl0IGludG8gYSBkZS1qdXJlIG9uZSA6LSkKCldl
IHdvdWxkIHdhbnQgdG8gZ3VhcmQgaXQgYmVoaW5kIHRoZSBleGlzdGluZyBzZW1paG9zdGluZyBj
b21tYW5kCmxpbmUgb3B0aW9uLCByYXRoZXIgdGhhbiBoYXZpbmcgaXQgZW5hYmxlZCBhbGwgdGhl
IHRpbWUsIGJ1dCB0aGF0CnBhcnQgc2hvdWxkIGJlIHN0cmFpZ2h0Zm9yd2FyZC4KCi0tIFBNTQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 811434E4727
	for <lists+openrisc@lfdr.de>; Tue, 22 Mar 2022 21:03:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1F24524867;
	Tue, 22 Mar 2022 21:03:02 +0100 (CET)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 2312D242E3
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 21:03:00 +0100 (CET)
Received: by mail-pl1-f171.google.com with SMTP id w4so16380707ply.13
 for <openrisc@lists.librecores.org>; Tue, 22 Mar 2022 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9z2OhjirVkz2pUbqaGLshsVzbhbV6ISeuMuKyH7hsWQ=;
 b=K2Z9Zm7zGkxEMQYec2pWhgy2XOQfPvprN/HESKZHkKo7Ap1wOflyxcYFVKuQSFNTtJ
 b9eFHIu5L4AWWJc2rbAjlYQK/tgMamITSdBIPTLzdCBvH8/DXHUfNKDYKSV7uYAznF90
 5FxANI/+CMn1ACq4S2PDBARc6QZrHnYt+JDhpLr4w8ewc+e7OZeymUewObip6OUr83bx
 ISHC6wAzK0V580zpUIfhQ0ipyyDhSG+fqlhmjqKrcby6Xp2j4oPkxHvlbuOTiWi5cEHr
 onyxLF1gkS/IltPtPUFuIQ6wdwtukxWWzPL22YWYSAJ3n74leqv6DMiSscTz9OOEhs1N
 LAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9z2OhjirVkz2pUbqaGLshsVzbhbV6ISeuMuKyH7hsWQ=;
 b=0TGmVyg9d+NH4efy7l23Rgzp9ZXeoK5U+fi6wBFLd0mMqYkgmFS9cfjNyvg5G9s0QJ
 4tptuXpZUnhZJ9JlSKvEMOnDcsC2aedSHShQxSjUQVKrCmCgBMZ4Unm7kLNIeFo6Lo4b
 E1gaY+l5SJONqDaqysk70WE2EDh/U+h8hD76oiu4U54TICQEghIV3Ausp6olZ2xWa0t1
 s4Vbcd3JkkjoFV95HAy/+Hm1RWawTfH9hyXbbnJ9f8eMQhHlYnlGid1PmQj/IQPsSnGJ
 iqLV18x4cycQCqVGEq0E3DL/XSTLxnCUlVxXOn4CEhismbiIjMay9pvPEK45ZwBPjJJ7
 Tvlw==
X-Gm-Message-State: AOAM530tIwFPirDuOIFg02lgyUKrXPO1xH73g6ySlqEV5GIdNdF92XYX
 Ug1Xt968I/Uyck/hdJDKM+nUnA==
X-Google-Smtp-Source: ABdhPJxGBLZF1jlZKcKbjlOflMXaW/vAHBWu7fR9pPGvxm7TO7lO3LkOEzMtr4yuUNUKm16mJIbDEQ==
X-Received: by 2002:a17:902:e88e:b0:154:7562:176d with SMTP id
 w14-20020a170902e88e00b001547562176dmr8166892plg.13.1647979378618; 
 Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00218200b004f6519ce666sm24451135pfi.170.2022.03.22.13.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
Date: Tue, 22 Mar 2022 13:02:58 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 13:02:56 PDT (-0700)
In-Reply-To: <c0328672-6dd1-b65b-1e2f-6f2562084f2d@conchuod.ie>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: mail@conchuod.ie
Message-ID: <mhng-f97b1e7d-1523-4ae5-923b-e73a8db48824@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Subject: Re: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
Cc: jonas@southpole.se, linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org,
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
 jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 longman@redhat.com, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, openrisc@lists.librecores.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCAyMiBNYXIgMjAyMiAxMToxODoxOCBQRFQgKC0wNzAwKSwgbWFpbEBjb25jaHVvZC5p
ZSB3cm90ZToKPiBPbiAxNi8wMy8yMDIyIDIzOjI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4g
UGV0ZXIgc2VudCBhbiBSRkMgb3V0IGFib3V0IGEgeWVhciBhZ28KPj4gPGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvWUhiQkJ1VkZObkk0a2pqM0BoaXJlei5wcm9ncmFtbWluZy5raWNrcy1h
c3MubmV0Lz4sCj4+IGJ1dCBhZnRlciBhIHNwaXJpdGVkIGRpc2N1c3Npb24gaXQgbG9va3MgbGlr
ZSB3ZSBsb3N0IHRyYWNrIG9mIHRoaW5ncy4KPj4gSUlSQyB0aGVyZSB3YXMgYnJvYWQgY29uc2Vu
c3VzIG9uIHRoaXMgYmVpbmcgdGhlIHdheSB0byBnbywgYnV0IHRoZXJlCj4+IHdhcyBhIGxvdCBv
ZiBkaXNjdXNzaW9uIHNvIEkgd2Fzbid0IHN1cmUuICBHaXZlbiB0aGF0IGl0J3MgYmVlbiBhIHll
YXIsCj4+IEkgZmlndXJlZCBpdCdkIGJlIGJlc3QgdG8ganVzdCBzZW5kIHRoaXMgb3V0IGFnYWlu
IGZvcm1hdHRlZCBhIGJpdCBtb3JlCj4+IGV4cGxpY2l0bHkgYXMgYSBwYXRjaC4KPj4KPj4gVGhp
cyBoYXMgaGFkIGFsbW9zdCBubyB0ZXN0aW5nIChqdXN0IGEgYnVpbGQgdGVzdCBvbiBSSVNDLVYg
ZGVmY29uZmlnKSwKPj4gYnV0IEkgd2FudGVkIHRvIHNlbmQgaXQgb3V0IGxhcmdlbHkgYXMtaXMg
YmVjYXVzZSBJIGRpZG4ndCBoYXZlIGEgU09CCj4+IGZyb20gUGV0ZXIgb24gdGhlIGNvZGUuICBJ
IGhhZCBzZW50IGFyb3VuZCBzb21ldGhpbmcgc29ydCBvZiBzaW1pbGFyIGluCj4+IHNwaXJpdCwg
YnV0IHRoaXMgbG9va3MgY29tcGxldGVseSByZS13cml0dGVuLiAgSnVzdCB0byBwbGF5IGl0IHNh
ZmUgSQo+PiB3YW50ZWQgdG8gc2VuZCBvdXQgYWxtb3N0IGV4YWN0bHkgYXMgaXQgd2FzIHBvc3Rl
ZC4gIEknZCBwcm9iYWJseSByZW5hbWUKPj4gdGhpcyB0c3BpbmxvY2sgYW5kIHRzcGlubG9ja190
eXBlcywgYXMgdGhlIG1pcy1tYXRjaCBraW5kIG9mIG1ha2VzIG15Cj4+IGV5ZXMgZ28gZnVubnks
IGJ1dCBJIGRvbid0IHJlYWxseSBjYXJlIHRoYXQgbXVjaC4gIEknbGwgYWxzbyBnbyB0aHJvdWdo
Cj4+IHRoZSBvdGhlciBwb3J0cyBhbmQgc2VlIGlmIHRoZXJlJ3MgYW55IG1vcmUgY2FuZGlkYXRl
cywgSSBzZWVtIHRvCj4+IHJlbWVtYmVyIHRoZXJlIGhhdmluZyBiZWVuIG1vcmUgdGhhbiBqdXN0
IE9wZW5SSVNDIGJ1dCBpdCdzIGJlZW4gYQo+PiB3aGlsZS4KPj4KPj4gSSdtIGluIG5vIGJpZyBy
dXNoIGZvciB0aGlzIGFuZCBnaXZlbiB0aGUgY29tcGxleCBIVyBkZXBlbmRlbmNpZXMgSQo+PiB0
aGluayBpdCdzIGJlc3QgdG8gdGFyZ2V0IGl0IGZvciA1LjE5LCB0aGF0J2QgZ2l2ZSB1cyBhIGZ1
bGwgbWVyZ2UKPj4gd2luZG93IGZvciBmb2xrcyB0byB0ZXN0L2JlbmNobWFyayBpdCBvbiB0aGVp
ciBzeXN0ZW1zIHRvIG1ha2Ugc3VyZSBpdCdzCj4+IE9LLgo+Cj4gSXMgdGhlcmUgYSBzcGVjaWZp
YyB3YXkgeW91IGhhdmUgYmVlbiB0ZXN0aW5nL2JlbmNoaW5nIHRoaW5ncywgb3IgaXMgaXQKPiBq
dXN0IGEgY2FzZSBvZiB0ZXN0IHdoYXQgd2Ugb3Vyc2VsdmVzIGNhcmUgYWJvdXQ/CgpJIGRvIGEg
YnVuY2ggb2YgZnVuY3Rpb25hbCB0ZXN0aW5nIGluIFFFTVUgKGl0J3MgYWxsIGluIG15IApyaXNj
di1zeXN0ZW1zLWNpIHJlcG8sIGJ1dCB0aGF0J3Mgbm90IHJlYWxseSBmaXQgZm9yIGh1bWFuIGNv
bnN1bXB0aW9uIApzbyBJIGRvbid0IHRlbGwgZm9sa3MgdG8gdXNlIGl0KS4gIFRoYXQncyBwcmV0
dHkgbXVjaCB1c2VsZXNzIGZvciAKc29tZXRoaW5nIGxpa2UgdGhpczogc3VyZSBpdCdkIGZpbmQg
c29tZXRoaW5nIGp1c3Qgc3RyYWlnaHQtdXAgYnJva2VuIGluIAp0aGUgbG9jayBpbXBsZW1lbnRh
dGlvbiwgYnV0IHRoZSBzdHVmZiBJJ20gcmVhbGx5IHdvcnJpZWQgYWJvdXQgaGVyZSAKd291bGQg
YmUgcG9vciBpbnRlcmFjdGlvbnMgd2l0aCBoYXJkd2FyZSB0aGF0IHdhc24ndCBkZXNpZ25lZC90
ZXN0ZWQgCmFnYWluc3QgdGhpcyBmbGF2b3Igb2YgbG9ja3MuCgpJIGRvbid0IGN1cnJlbnRseSBk
byBhbnkgcmVndWxhciB0ZXN0aW5nIG9uIEhXLCBidXQgdGhlcmUncyBhIGhhbmRmdWwgb2YgCmZv
bGtzIHdobyBkby4gIElmIHlvdSd2ZSBnb3QgSFcgeW91IGNhcmUgYWJvdXQgdGhlbiB0aGUgYmVz
dCBiZXQgaXMgdG8gCmdpdmUgdGhpcyBhIHNob3Qgb24gaXQuICBUaGVyZSdzIGFscmVhZHkgYmVl
biBzb21lIGJvb3QgdGVzdCByZXBvcnRzLCBzbyAKaXQncyBhdCBsZWFzdCBtb3N0bHkgdGhlcmUg
KG9uIFJJU0MtViwgbGFzdCBJIHNhdyBpdCB3YXMgYnJlYWtpbmcgCk9wZW5SSVNDIHNvIHRoZXJl
J3MgcHJvYmFibHkgc29tZSBsdXJraW5nIGlzc3VlIHNvbWV3aGVyZSkuICBJIHdhcyAKaG9waW5n
IHdlJ2QgZ2V0IGVub3VnaCBjb3ZlcmFnZSB0aGF0IHdheSB0byBoYXZlIGNvbmZpZGVuY2UgaW4g
dGhpcywgYnV0IAppZiBub3QgdGhlbiBJJ3ZlIGdvdCBhIGJ1bmNoIG9mIFJJU0MtViBoYXJkd2Fy
ZSBseWluZyBhcm91bmQgdGhhdCBJIGNhbiAKc3BpbiB1cCB0byBmaWxsIHRoZSBnYXBzLgoKQXMg
ZmFyIGFzIHdoYXQgd29ya2xvYWRzLCBJIHJlYWxseSBkb24ndCBrbm93IGhlcmUuICBBdCBsZWFz
dCBvbiBSSVNDLVYsIApJIHRoaW5rIGFueSBsb2NrIG1pY3JvYmVuY2htYXJrcyB3b3VsZCBiZSBl
c3NlbnRpYWxseSBtZWFuaW5nbGVzczogdGhpcyAKaXMgZmFpciwgc28gZXZlbiBpZiBsb2NrL3Vu
bG9jayBpcyBhIGJpdCBzbG93ZXIgdGhhdCdzIHByb2JhYmx5IGEgd2luIApmb3IgcmVhbCB3b3Jr
bG9hZHMuICBUaGF0IHNhaWQsIEknbSBub3Qgc3VyZSBhbnkgb2YgdGhlIGV4aXN0aW5nIApoYXJk
d2FyZSBydW5zIGFueSB3b3JrbG9hZHMgdGhhdCBJJ20gcGVyc29uYWxseSBpbnRlcmVzdGVkIGlu
IHNvIHVubGVzcyAKdGhpcyBpcyBzb21lIG1hc3NpdmUgaGl0IHRvIGp1c3QgZ2VuZXJhbCBzeXN0
ZW0gcmVzcG9uc2l2ZW5lc3Mgb3IgCm1ha2UvR0NDIHRoZW4gSSdtIHByb2JhYmx5IG5vdCBnb2lu
ZyB0byBmaW5kIGFueXRoaW5nLgoKSGFwcHkgdG8gaGVhciBpZiBhbnlvbmUgaGFzIGlkZWFzLCB0
aG91Z2guCgo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4+IFJJU0MtViBoYXMgYSBmb3J3YXJkIHBy
b2dyZXNzIGd1YXJhbnRlZSBzbyB3ZSBzaG91bGQgYmUgc2FmZSwgYnV0Cj4+IHRoZXNlIGNhbiBh
bHdheXMgdHJpcCB0aGluZ3MgdXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

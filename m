Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 92E345140D2
	for <lists+openrisc@lfdr.de>; Fri, 29 Apr 2022 05:12:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4528B2124D;
	Fri, 29 Apr 2022 05:12:14 +0200 (CEST)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mail.librecores.org (Postfix) with ESMTPS id 27B9424329
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 22:19:54 +0200 (CEST)
Received: by mail-qt1-f179.google.com with SMTP id t16so4327923qtr.9
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pix4bAbtBonBJFdQI1SHNnNCM4gjGW5FCW9PlRzukX0=;
 b=VingNmxTSmzZGNLz67wUqFVQTRZOYHmg/bHb+2Z64nJRCjid1fAAjEfW+W5mmgQJoA
 hXKWSkVDrML9KDLmdPDPPJKrx5pvKTpXTU+s+J5kACgOBle6f/KAkFEokiV6PFzqhomK
 MmxQW8WsF7yNQLwTqdccUwDsTK8qx3BYvj+I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pix4bAbtBonBJFdQI1SHNnNCM4gjGW5FCW9PlRzukX0=;
 b=BLs72C/QZYgawarp7kK78+JA6S4ycH/xWiCw0xfwYbew6IC4WNywWaStuHqpUCr8Vs
 3Hdl5gtqHwn2ir/Zife2IUtf383Ou2eLm9c8KZ+tKAWdR/Gj7wnup/cfTb7BW3oF36+d
 sDmWhcdqXXx9EpskK4Mv7UBp6SLr8PfM5ftrk6ihP9in+nYL8YeLlvpC7906QoAv/oHX
 ImcRa85PJl31yTT1ubNHfDky0nfpqFci/gc6RWeGcT10lCBjIt9amycRcBeEtwPYkTta
 RidkO/dZlHizWHwnU1pMhshPbyRO8/dPviZzfN3iT+TLs6r0mWAyTIyxcBxMsqW+p2HU
 MeIQ==
X-Gm-Message-State: AOAM53159LlLwl6ywCWARtJ1HEvYYSgreX/2ujbw9YI5uOno632zj24f
 kD2PWw3Xsax8C2x8y3Ko2wPpHA==
X-Google-Smtp-Source: ABdhPJwPHh/ucGlrH7aV97RjtQj796Nn8usVwbufKCY9crd6nrIY6kGcO8VJcFbQLKyzTeR6PqmImA==
X-Received: by 2002:ac8:5dd0:0:b0:2f3:87d9:dede with SMTP id
 e16-20020ac85dd0000000b002f387d9dedemr4605838qtx.351.1651177193036; 
 Thu, 28 Apr 2022 13:19:53 -0700 (PDT)
Received: from nitro.local
 (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
 by smtp.gmail.com with ESMTPSA id
 y189-20020a37afc6000000b0069ede17247csm449748qke.86.2022.04.28.13.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 13:19:52 -0700 (PDT)
Date: Thu, 28 Apr 2022 16:19:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20220428201950.6emdw5i2fvyktt2i@nitro.local>
References: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9ooFW5unm1AOWU5738_GHkYqVZ0whEgfKn6RH6k=SCm5g@mail.gmail.com>
X-Mailman-Approved-At: Fri, 29 Apr 2022 05:12:13 +0200
Subject: Re: [OpenRISC] Add openrisc@lists.librecores.org to lore.kernel.org
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
Cc: openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDE6MTU6MDlQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IEhpIGZvbGtzLAo+IAo+IEFueSBpbnRlcmVzdCBpbiBnZXR0aW5nIHRoaXMg
bWFpbGluZyBsaXN0IHVwIG9uIGxvcmUua2VybmVsLm9yZz8gVGhpcwo+IHdvdWxkIG1ha2Ugc2Vu
c2Ugc2luY2UgaXQncyB0aGUgbWFpbGluZyBsaXN0IHNwZWNpZmllZCBpbiB0aGUgTGludXgKPiBN
QUlOVEFJTkVSUyBmaWxlIGZvciBPcGVuUklTQyBkZXZlbG9wbWVudC4gSXQnZCByZXF1aXJlIHRo
ZSBsaXN0Cj4gYWRtaW5pc3RyYXRvciB0byBzZW5kIHRoZSBjdXJyZW50IGxpc3QgYXJjaGl2ZXMg
dG8gS29uc3RhbnRpbiBhbmQgdGhlbgo+IGFkZCBzb21lIGFyY2hpdmVyIGFzIGEgc3Vic2NyaWJl
ci4gR2l2ZW4gdGhpcyBpcyBhIGZhaXJseSBub3JtYWwKPiBtYWlsbWFuIGxpc3QsIHRoYXQgZG9l
c24ndCBzZWVtIHRvbyBoYXJkLgoKV2UgY2FuIGFkZCBpdCwgYnV0IGl0IHdvdWxkIGJlIGdyZWF0
IGlmIHRoZSBsaXN0IGNhbiBiZSBtYWRlIERLSU0tY29tcGxpYW50CmZpcnN0OgoKMS4gdHVybiBv
ZmYgc3ViamVjdCBtb2RpZmljYXRpb24sIGlmIHBvc3NpYmxlCjIuIHJlbW92ZSBib2R5IG1vZGlm
aWNhdGlvbiwgaWYgcHJlc2VudCAobWFpbG1hbiBsaXN0IGZvb3RlcnMsIGV0YykKClRoaXMgd2F5
IGFueSBtZXNzYWdlcyBzZW50IHRvIHRoaXMgbGlzdCBhbmQgdG8gYW55IG90aGVyIGxpc3RzIGFy
ZSBwcm9wZXJseQpkZWR1cGxpY2F0ZWQuCgotSwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

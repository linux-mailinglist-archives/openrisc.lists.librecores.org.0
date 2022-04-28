Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 75F575132CB
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 13:48:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0BA12248C9;
	Thu, 28 Apr 2022 13:48:04 +0200 (CEST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mail.librecores.org (Postfix) with ESMTPS id 9DE5924165
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 13:48:02 +0200 (CEST)
Received: by mail-pl1-f181.google.com with SMTP id q8so4137578plx.3
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5QhcIJoJFpwZZ9y5sGb15PYJ4tqQpvnSV2qPERe1X7s=;
 b=QNNcn3Xzue+RIEwiYhKmQam+68pSKo2Uu3926ibp1LTkqEemRZdZZWxK6fm/ExWHpI
 ooHeVIqzi+UuRvvZptrDeBmBYDKbdv2UkQ7cc2mkU1qyjcniePW/M/ZG6V1Nq8CSFeEB
 C2refY2LlCK7Zg3gLEIIZnKneE2n/Egdf2JdHiibmEvWmvluJ+yTlsEo+vZYVcBKV1tl
 GRW9GuKkYlGsZk9u0K9X5/bLIHxKV5qVO+Vu+eCupAxbPlJ1FYHvYD/adtcnsa4O3Nr6
 GcFdWuaA6gsSHTK7MABLSe+Bv4ZySuWTaW7NFDRvE2Y30skL16Z02TdbIJ096Sr8CF9H
 lmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QhcIJoJFpwZZ9y5sGb15PYJ4tqQpvnSV2qPERe1X7s=;
 b=BDVSvMwasZUGcBn8JYLuBj3n5p2o9gzoUyJuOfHjk9y1xkemCtN/myNjJy6M8JjNrH
 YZXTlgs1b96/Zw4qeOVgqMiF5k1pjX97g85i4+KdQCxOmz9Gq9Mc2xj2CwgXJP31zjWw
 zzpe7/mV+AwTbBK15sKwzwlLX71Ga/jjKfsE0UtkoDNLXkoAL1uP07pJRkbITb6DTW9/
 9y/UF2kfx1xMa7dP+1IyjxqLNgdMazG4mU2gP5Lg1We/aWLRydUPXfUnYfYyTglahMV4
 g33RC+TGO/CeSQvNVJNs3sigQ+8BaKTUvWN0o5bBKoAcGrGXwsEisMRjBMbHKuHiUPI4
 E5iQ==
X-Gm-Message-State: AOAM533trGBOtXML5BNAT1/jSfJGsXA81nJmyqvvsbCk1Fn+jow8JxIS
 IDdRJM8Tz0uKbVhBw5lGgXY=
X-Google-Smtp-Source: ABdhPJxSCwcJAk38aDcM6BAVoyj0UfQT2/DiFNDU3lEe3r+PLSGb+v33eWlonYezQD61mu4oQYkuLw==
X-Received: by 2002:a17:902:6bc2:b0:158:a26b:5884 with SMTP id
 m2-20020a1709026bc200b00158a26b5884mr33146065plt.38.1651146480851; 
 Thu, 28 Apr 2022 04:48:00 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa78487000000b00505d9277cb3sm21593998pfn.38.2022.04.28.04.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:48:00 -0700 (PDT)
Date: Thu, 28 Apr 2022 20:47:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <Ymp+7vYQvA0Wr4sl@antec>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec> <YmnaDUpVI5ihgvg6@zx2c4.com>
 <Ymp3owBiSQIimgSy@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ymp3owBiSQIimgSy@zx2c4.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMDE6MTY6NTFQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IEhleSBhZ2FpbiwKPiAKPiBPbiBUaHUsIEFwciAyOCwgMjAyMiBhdCAwMjow
NDoyOUFNICswMjAwLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gPiBCeSB0aGUgd2F5LCB3
b3VsZCB0aGlzIGFsc28gaGVscCB0aGUgcmVib290IGNhc2U/IFRoYXQncwo+ID4gYHJlYm9vdChS
Ql9BVVRPQk9PVCk7YCwgd2hpY2ggZG9lczoKPiA+IAo+ID4gbWFjaGluZV9yZXN0YXJ0KCkgLT4K
PiA+ICAgZG9fa2VybmVsX3Jlc3RhcnQoKSAtPgo+ID4gICAgIGF0b21pY19ub3RpZmllcl9jaGFp
bl9yZWdpc3RlcigmcmVzdGFydF9oYW5kbGVyX2xpc3QsIG5iKSAtPgo+ID4gICAgICAgPz8/Cj4g
PiAKPiA+IEFzIGZhciBhcyBJIGNhbiB0ZWxsLCBub3RoaW5nIGlzIHdpcmVkIGludG8gdGhlIHJl
Ym9vdCBjYXNlIGZvcgo+ID4gT3BlblJJU0MuIElzIHRoaXMgc29tZXRoaW5nIHRoYXQgY291bGQg
YmUgZml4ZWQgaW4gdGhlIGtlcm5lbCB3aXRob3V0Cj4gPiBoYXZpbmcgdG8gcGF0Y2ggUUVNVT8g
SWYgc28sIHRoZW4gSSBjb3VsZCBlZmZlY3RpdmVseSBnZXQgc2h1dGRvd24gZm9yCj4gPiBteSBD
SSB3aXRoIHRoZSAtbm8tcmVib290IG9wdGlvbiwgd2hpY2ggaXMgd2hhdCBJJ20gYWxyZWFkeSBk
b2luZyBmb3IgYQo+ID4gZmV3IHBsYXRmb3Jtcy4KPiAKPiBJIGFkZGVkIDEzIGZvciB0aGlzOiBo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL3BpcGVybWFpbC9vcGVucmlzYy8yMDIyLUFwcmls
LzAwMzg4NC5odG1sCj4gCj4gV2hlbiB5b3UgZ28gYWRkIHRoZXNlIG5vcHMgdG8gdGhlIHNwZWNp
ZmljYXRpb24sIHBsZWFzZSByZW1lbWJlciB0byBhZGQKPiBvbmUgZm9yIHJlYm9vdCB0b28uIFRo
ZW4sIG9uY2UgdGhhdCBrZXJuZWwgY29kZSBpcyBtZXJnZWQgYW5kIHRoZQo+IHNwZWNpZmljYXRp
b24gcHVibGlzaGVkLCBpdCdsbCBiZSBzZW5zaWJsZSB0byBhZGQgc2h1dGRvd24gYW5kIHJlYm9v
dAo+IHN1cHBvcnQgdG8gUUVNVSwgcGVyIFBldGVyJ3MgZGVzY3JpcHRpb24uCgpUaGlzIHNvdW5k
cyBmYWlyLgoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

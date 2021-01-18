Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EED032F9F24
	for <lists+openrisc@lfdr.de>; Mon, 18 Jan 2021 13:09:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 670832109F;
	Mon, 18 Jan 2021 13:09:00 +0100 (CET)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mail.librecores.org (Postfix) with ESMTPS id 6E9FB208C2
 for <openrisc@lists.librecores.org>; Mon, 18 Jan 2021 13:08:58 +0100 (CET)
Received: by mail-pl1-f171.google.com with SMTP id r4so8532008pls.11
 for <openrisc@lists.librecores.org>; Mon, 18 Jan 2021 04:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3v2cH7W2qE6kJHWq1MaPOhEvBwAyXgPklbh+UIScQBU=;
 b=cxJI/Xa4o5tz3je0WDqKhxjNXMl/s+4bBu9FsB5SPRt3EF5AmdTeJbXdceC6kC1h1b
 Rj+/X9Ml3Xb74y0g6ysAkcQhY+Ms+Ysjze2vEWselQeZPg6smSoWCOMXMS/8fwmfDlIU
 xeiyBT/0Uw8W09p8zjFjwh6+uydGX6MidiP3VOGj/0u5b9qe6pPAAeRK3XDfVfyvevd0
 vTuS7FrpZJrvTCm5/a/bFvj3tlaWSQHDhBoB+5T9PqPE+e1NQgg60Y6bRzqrhsOgkbHK
 c29oobQjC2Tx/XVg9mGzdHc7fhEtSoPjna9u+WpxnVyvtj98729f+ZuSI2r+O87YVVyy
 Ofog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3v2cH7W2qE6kJHWq1MaPOhEvBwAyXgPklbh+UIScQBU=;
 b=hajCM87VRYf6kn/mdQw9KfseU0gp4mvBM/l3eriDO1isXjWFOEGbk5TJYi+GB8NZwD
 VNGX/R2sXUB3z9St+7gvvMq+poimX2Jj/QFm766EjOu8al3RGoX49Gbev0BUWNiva2v1
 RP4s4GVKSFNcPa42gYGjPonI+yMpTzuYqCvDHiytMR4IHwRbTCqhoaGaFL1wX3RFOoan
 aEtuseyuno+UqBqY3fX4En+mJ0NNfXIR2jZpg3N1MKWlzLWs7WJeVuUYf7UnCQaKD3f+
 inRhhZosvFJ3UAH8ioPevV2TS3kunr+v9WAts+6t64s0Sm3/hKMa3MasE/1HkXK1tDAJ
 kmeA==
X-Gm-Message-State: AOAM532Gi2gEbRdePfYc1V25d/TipYNhjNktKJ7BnnGKm74BkjFXU4GU
 Mtahuo0SguuP9iBr4PU7I/U=
X-Google-Smtp-Source: ABdhPJwrftUf2lEYlkvTpSgnkJsd7tQf5BJiHa2zU9T/GHCXKcFCn4uYE5i0hB2sJIgvb+ZGV+f0eQ==
X-Received: by 2002:a17:903:1c2:b029:de:ad0a:2dbf with SMTP id
 e2-20020a17090301c2b02900dead0a2dbfmr5216275plh.44.1610971736571; 
 Mon, 18 Jan 2021 04:08:56 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 a198sm15887522pfa.7.2021.01.18.04.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:08:55 -0800 (PST)
Date: Mon, 18 Jan 2021 21:08:53 +0900
From: Stafford Horne <shorne@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <20210118120853.GG2002709@lianli.shorne-pla.net>
References: <20210117080332.2289077-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210117080332.2289077-1-masahiroy@kernel.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: add arch/openrisc/Kbuild
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBKYW4gMTcsIDIwMjEgYXQgMDU6MDM6MzJQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IERlc2NyaWJlIHRoZSBzdWJkaXJlY3RvcmllcyB1bmRlciBhcmNoL29wZW5yaXNj
LyBpbiBhcmNoL29wZW5yaXNjL0tidWlsZAo+IHNvIHlvdSBjYW4gdXNlIHRoZSBzdGFuZGFyZCBv
YmoteSBzeW50YXguCj4gCj4gSSByZW1vdmVkIHRoZSBDT05GSUdfT1BFTlJJU0NfQlVJTFRJTl9E
VEIgY29uZGl0aW9uYWwgYmVjYXVzZSBpdCBpcwo+IGFscmVhZHkgY29udHJvbGxlZCBieSBhcmNo
L29wZW5yaXNjL2Jvb3QvZHRzL01ha2VmaWxlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hc2FoaXJv
IFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+CgpUaGFuayB5b3UsIFRoaXMgbG9va3MgT0sg
dG8gbWUsIEkgaGF2ZSBxdWV1ZWQgdGhpcyBmb3IgbmV4dC4KClRoZXJlIHdhcyBhIHNtYWxsIGNv
bmZsaWN0IHdpdGggdGhlIHZtbGludXguYmluIGNoYW5nZXMgeW91IHJldmlld2VkIGVhcmxpZXIu
CkkgcmVzb2x2ZWQgdGhlbSBhbmQgZGlkIGEgdGVzdCBiaWxkIGFuZCBpdCBzZWVtcyB0byBhbGwg
YmUgZmluZS4KCi1TdGFmZm9yZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

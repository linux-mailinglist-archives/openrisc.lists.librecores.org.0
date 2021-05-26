Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 956F53921B6
	for <lists+openrisc@lfdr.de>; Wed, 26 May 2021 22:58:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EF1472392B;
	Wed, 26 May 2021 22:58:48 +0200 (CEST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mail.librecores.org (Postfix) with ESMTPS id 2735A21320
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 22:58:47 +0200 (CEST)
Received: by mail-ed1-f54.google.com with SMTP id r11so3103931edt.13
 for <openrisc@lists.librecores.org>; Wed, 26 May 2021 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yxvQKtZKgfB1Kc/ZBGkGO2GsOusk98KpoN7ZFStbLR4=;
 b=Lq7v9aT605UOrfcdY/VTQs4rUcADhS6pnURPhtOlc4M59UtKLHsoS4+jZkFH6MbHIx
 4voFpSLbd6pQsn6c+/amPcwZHXOFUL67dZhZV9oBWcAhj09jxnzBfTyXLkPJ1VQh+XsY
 zlAuD+3sOhFWF2LdhTSb1yZhUGoZv64IABUMAYO9KHfq9Evc6q7KfxtcE4s1RZrdBzj7
 Zx/c2zHNwr0Fx/F4svyVy3HaL9XMV7binjnrsurOQrHR1HCc/nkiOu8kF6gKQvHBBdq0
 W2N1368XYf2Bderk4boxhsyDWP6OVjSFajBVg4PeC1UUruy6YjSp/niLd2QuJkTkEpoD
 3qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yxvQKtZKgfB1Kc/ZBGkGO2GsOusk98KpoN7ZFStbLR4=;
 b=IMPn6lAS7nM3xFO9+jHJR+Q2XS3CWMC+U5kAD/ONznqYO2RP9rUYPRsDWVaAYeKfRk
 bOVCB01hUGBRrMvUhYPyVxCC4qecj2sFAeVzzk8JuZWzeEU3rTfI8YAdo3oc49QsdnV2
 9ytZs5MNHiwHKVznkrtvMIAZf60H2MJRXdBoIskvUXP513iLl8LPQ5iPMDUNio8xg/E5
 BinPYJNu3/nGSRKeY2iiHtcWldmOHWg8lwwfcZaTO5tt3X8G6Ik8vqN89pDVG907U3m/
 fSG9Sduu8/bdCOmEczMwleXNAm2IbYHoXLeTHyvN0Ds6W7nc50ZjR1RisaxeSxr7kKcI
 kdpA==
X-Gm-Message-State: AOAM531SzcCIY2hOIRs+6Vo3LzM27GjzYKEotwhU8BtOh1trvK2N/W6R
 X+g819YnSZICtaYW251pEaGRtI10Q6sL9opfZyo=
X-Google-Smtp-Source: ABdhPJyXy9JMpSdIwTFo3LeW0gbkTyw+/6iSMoLoTCkBcowgwOuv+/WJbF1aI/NJWCIhz12gEIPID6UVMn1/lVw3AeI=
X-Received: by 2002:a05:6402:51ce:: with SMTP id
 r14mr139646edd.151.1622062726710; 
 Wed, 26 May 2021 13:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMzHeO13bW0i7JFGGtJRcUpGcPW+WxNzqKXRDWLLPFv-eA@mail.gmail.com>
In-Reply-To: <CADGJwMzHeO13bW0i7JFGGtJRcUpGcPW+WxNzqKXRDWLLPFv-eA@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 27 May 2021 05:58:35 +0900
Message-ID: <CAAfxs75w_+9R_87uz6i0pkahaydzR7+if4JqRRQ5s_feZhVLgQ@mail.gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>, 
 Openrisc <openrisc@lists.librecores.org>
Subject: Re: [OpenRISC] Error found in mor1kx cache lru
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
Cc: Stefan Wallentowitz <stefan@fossi-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQWxsLAoKVGhlIGdpdGh1YiBpc3N1ZSB3YXMgYWRkZWQgaGVyZToKCmh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVucmlzYy9tb3Ixa3gvaXNzdWVzLzExOQoKSGFyc2hpdGEgdGhhbmtzIGZvciB5b3Ug
aW52ZXN0aWdhdGlvbiBhbmQgc3RhcnRpbmcgZWFybHkgb24gR1NvQyB5b3UKYXJlIGFscmVhZHkg
Z2V0dGluZyBpbnRvIHNvbWUgaW50ZXJlc3RpbmcgcGFydHMuCgpPbiBXZWQsIE1heSAyNiwgMjAy
MSBhdCA2OjIxIFBNIEhhcnNoaXRoYSBTCjxoYXJzaGl0aGFzcmlkaGFyMTcyMDAwQGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBIZWxsbyBTaXIsCj4KPiBJJ20gSGFyc2hpdGhhLCBJIHdhcyBsb29raW5n
IGludG8gdGhlIGZvcm1hbCB2ZXJpZmljYXRpb24gb2YgbW9yMWt4J3MgY2FjaGUgTFJVIG1vZHVs
ZSBhbmQgSSBmb3VuZCBhIGJ1ZyB0aGVyZS4KPgo+IEkgd2FzIGV4cGVjdGluZyB0aGF0IHRoZSB2
YXJpYWJsZSBhY2Nlc3MgcmVxdWVzdCB3b3VsZCBiZSB0aGUgbmV3IGxydV9wb3N0IHZhbHVlLCBi
dXQgaXQncyBub3QgdGhlIGNhc2UuIGxydV9wb3N0IGlzIGNhbGN1bGF0ZWQgYXMgQU5EIG9mIHJv
d3MgYnV0IEkgdGhpbmsgaXQgaGFzIHRvIGJlIGNvbnNpZGVyZWQgYXMgQU5EIG9mIGNvbHVtbnMu
IEkgY29uc2lkZXJlZCB0aGUgc2FtZSBleGFtcGxlIGFzIHBlciB5b3VyIGRlc2NyaXB0aW9uLCB3
cm90ZSBhIHRlc3QgYmVuY2ggdG8gdmVyaWZ5IGl0LiBJIGdvdCBkaWZmZXJlbnQgdXBkYXRlIHZh
cmlhYmxlIHZhbHVlcyB0aGF0IHRoZSBjb2RlIGZ1bmN0aW9uYWxseSBleGVjdXRlcy4gSSBjb3Jy
ZWN0ZWQgdGhlIGNvZGUgYnkgbW9kaWZ5aW5nIHRoZSBscnVfcG9zdCBjb21wdXRhdGlvbiwgdGhl
biBJIHdhcyBhYmxlIHRvIGdldCB0aGUgYWNjZXNzIHNhbWUgYXMgdGhlIGxydV9wb3N0LgoKSSB0
aGluayBpdHMgbm90IGNvcnJlY3QsIHRoZSBscnVfcG9zdCBpcyB0aGUgbGVhc3QgcmVjZW50bHkg
dXNlZCBmcm9tCmhpc3RvcnkuICBUaGUgYWNjZXNzIHJlcXVlc3QgaXMgdGhlICJtb3N0IHJlY2Vu
dGx5IHVzZWQiLCBzbyBpdCB3aWxsCm5vdCBiZSBpbiBscnVfcG9zdC4KCj4KPiBJIGNhbWUgYWNy
b3NzIGFub3RoZXIgdW51c3VhbCB0aGluZy4gSW4gdGhlIGNvZGUgc25pcHBldCB3aGVyZSB0aGUg
ZXhwYW5kIG1hdHJpeCBpcyB1cGRhdGVkLCB0aGUgcm93IG51bWJlciBmb3IgZXhjaGFuZ2UgaXMg
bm90IGNvbXB1dGVkIGJlZm9yZSBiZWNhdXNlIG9mIHdoaWNoIHRoZSBsYXN0IHJvdyBvZiB0aGUg
ZXhwYW5kIG1hdHJpeCBpcyBjb25zaWRlcmVkIGFzIG9uZSBiaXQgbGVzcyBieSB0aGUgZm9ybWFs
IHRvb2wuIFlvdSBjYW4gY2hlY2sgdGhlIGV4cGFuZF9lcnJvciBpbWFnZSBmb3IgdGhpcyBlcnJv
ciB3aGVyZSB0aGUgdGhpcmQgcm93IG9mIHRoZSBtYXRyaXggaGFzIG9ubHkgMyBiaXRzIGluc3Rl
YWQgb2YgNC4gIEkgdHJpZWQgdG8gcHJlY29tcHV0ZSB0aGUgcm93IG51bWJlciBmb3IgZXhjaGFu
Z2UgdGhlbiBJIGRpZG4ndCBmYWNlIHRoaXMgZXJyb3IuIFlvdSBjYW4gbG9vayBpbnRvIG5vX2V4
cGFuZF9lcnJvciAgd2hlcmUgdGhpcyBpc3N1ZSB3YXMgcmVzb2x2ZWQuCj4KClRoYXQgc291bmRz
IHN0cmFuZ2UsIGNhbiB5b3UgcG9zdCBhIFBSIGZvciB0aGlzIGNoYW5nZT8gIG9yIGEgcGF0Y2gK
dXNpbmcgJ2dpdCBkaWZmYCBpdHMgZWFzaWVyIHRvIGV4cGxhaW4gY29kZSBjaGFuZ2VzIHVzaW5n
IHBhdGNoZXMuCgo+IEkgcmVxdWVzdCB5b3UgdG8gbG9vayBpbnRvIHRoaXMgZXJyb3IuIExldCBt
ZSBrbm93IHdoYXQgeW91IHRoaW5rLgo+Cj4gUmVnYXJkcwo+IC1IYXJzaGl0aGEKPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

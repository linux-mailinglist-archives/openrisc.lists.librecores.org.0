Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 69C59460A76
	for <lists+openrisc@lfdr.de>; Sun, 28 Nov 2021 22:54:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1F013240C7;
	Sun, 28 Nov 2021 22:54:49 +0100 (CET)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mail.librecores.org (Postfix) with ESMTPS id 694C820A95
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 22:54:46 +0100 (CET)
Received: by mail-ua1-f47.google.com with SMTP id p37so29945992uae.8
 for <openrisc@lists.librecores.org>; Sun, 28 Nov 2021 13:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vUBWg6MmKewXjb31Wa8PVUespuXcltC71Pt6IEXQtiE=;
 b=cJiOnLjLg74NQ6JHCZ7CaVnGgLZAnJthAMlv2GHTerUEhXjYgrL7xopUjBTozpXLNz
 8Vw21v2cg3DOe3qu/2GJKCwT3zDjgf7K72PV2sDTVlrhmcYjHFV25EKS9nqmY/JGkOJv
 vg3S7NWSvSD+0rIfK+MwIX6sD9w3rkQ0kKQu1A4C+N/VNoleV9FY99hcYVsvftPshPhB
 o64xwJdU+yaBVT6zZFHA8bmi8X8J8xiIwGzvv+89Nt8mFipaskTvgQfa+koe4aMO5KL4
 bYJkgWM+q0SsBbuP82rWrkVkX1i/Ys/e3ZtGMT9trbKb3HOfRWEKKcKsNtu9qLsjSfDS
 A+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vUBWg6MmKewXjb31Wa8PVUespuXcltC71Pt6IEXQtiE=;
 b=vGbVO0p0YcEY34Z5GI7F0yOQ710Qne99snXxRlUH9pgY1GATUXkOPN/0jVVEpJp+yW
 Ks7Wrx7RoRtXI6OUrd3WapCU5rwvaViuHoi3dOv5TIyWf+C3Xd8mfwFFUW5Hnwmd6wYh
 BjcRZFFhsrlU3+jPO3ABtM2ubJUTPm2Aq4/0yk/8JF99gWeM+1cIL15aXxcV1swrAtVM
 Qx+HTQ+wbL1snnuwZ2JJuMGsnFIv59LbXft25yoB2mJeTuFzwEBo5cDFIylLAl/mXUIq
 ATIFkkgaDDOWgaDTwTrJPOGw5fv4LPi5NjlOm3X3Hwh8eHhAwta+xaNfuVm6tSeGNyt0
 7d8Q==
X-Gm-Message-State: AOAM533cPONzrzp+X0yhe9sJnue/BWdLgvsuMtASazi6RbZRdq0h9eWY
 nE7gTAAOn9Xcm4IAheccgZ3sSlpDUlyeHvkQ4JA=
X-Google-Smtp-Source: ABdhPJwoPulARsQPGfm+knBROzCQI3zpCDHJj9MR6zMNQ6JWBvIi7bgl8xxkq4Mmr6ZsuArNu/8dakX4dHLlMwVo1KQ=
X-Received: by 2002:a67:7105:: with SMTP id m5mr27538381vsc.81.1638136485165; 
 Sun, 28 Nov 2021 13:54:45 -0800 (PST)
MIME-Version: 1.0
References: <CAF6YiZ5=4+bGKipC0-cScNsd2s+4PGwTchXAJTtETF47AukpLQ@mail.gmail.com>
 <CAF6YiZ5f=LsBeMTF1+8q9697qNHbE57rjdftAQ4H0ackpt-u2Q@mail.gmail.com>
 <6122161a-80ea-7fbe-4fb1-4763410dbdcc@gmx.net>
In-Reply-To: <6122161a-80ea-7fbe-4fb1-4763410dbdcc@gmx.net>
From: Julius Baxter <juliusbaxter@gmail.com>
Date: Mon, 29 Nov 2021 08:54:34 +1100
Message-ID: <CAF6YiZ52NVpSVuqcbPpW0kwEfG_P-+=qeLGyPiH3R7Mx=+-Hhg@mail.gmail.com>
To: Jidan Al-Eryani <jidan@gmx.net>
Subject: Re: [OpenRISC] FPU licensing request
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
Cc: BAndViG <bandvig@mail.ru>, Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCAyOSBOb3YgMjAyMSBhdCAwMTo0NiwgSmlkYW4gQWwtRXJ5YW5pIDxqaWRhbkBnbXgu
bmV0PiB3cm90ZToKPgo+IEhpIEp1bGl1cywKPgo+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgbXkg
cGVybWlzc2lvbiBmb3IgdGhpcywgYnV0IHRoYW5rcyBhbnl3YXkgZm9yCj4gYXNraW5nLiBQbGVh
c2UgZG8gYXMgeW91IHdpc2guCj4gSXQncyBhbWF6aW5nIGhvdyA+MTAgeWVhcnMgcGFzcyBzbyBm
YXN0Li4uCj4KPiBXaXNoIHlvdSBhbGwgdGhlIGJlc3QgYW5kIHRha2UgY2FyZSEKPiBKaWRhbgoK
VGhhdCdzIGFwcHJlY2lhdGVkIEppZGFuLCB0aGFua3MgdmVyeSBtdWNoLgoKQWdyZWVkLCB0aW1l
IGZsaWVzIGh1aD8KCkNoZWVycywKSnVsaXVzCgo+Cj4gT24gMjgvMTEvMjAyMSAwNDozOSwgSnVs
aXVzIEJheHRlciB3cm90ZToKPiA+IE9uIFN1biwgMjggTm92IDIwMjEgYXQgMTQ6MjUsIEp1bGl1
cyBCYXh0ZXIgPGp1bGl1c2JheHRlckBnbWFpbC5jb20+IHdyb3RlOgo+ID4+IEhpIEppZGFuLAo+
ID4+Cj4gPj4gSSdtIGdldHRpbmcgaW4gdG91Y2ggYmVjYXVzZSBJIHdhbnQgdG8gYXNrIHlvdXIg
cGVybWlzc2lvbiB0bwo+ID4+IHJlbGljZW5zZSBzb21lIG9mIHlvdXIgRlBVIGNvZGUuCj4gPj4K
PiA+PiBJIHBvcnRlZCB5b3VyIFZIREwgRlBVIGRlc2lnbiB0byBWZXJpbG9nIG1hbnkgeWVhcnMg
YWdvICgyMDEwIEkgdGhpbmspCj4gPj4gYW5kIGl0J3Mgc2luY2UgYmVlbiBpbmNsdWRlZCBpbiB0
aGUgbW9yMWt4IE9wZW5SSVNDIENQVSBwcm9qZWN0IGJ5Cj4gPj4gQW5kcmV5IEJhY2hlcm92IChD
QydlZCkuCj4gPj4KPiA+PiBFeGFtcGxlOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbnJpc2MvbW9y
MWt4L2Jsb2IvbWFzdGVyL3J0bC92ZXJpbG9nL3BmcHUzMi9wZnB1MzJfYWRkc3ViLnYKPiA+Pgo+
ID4+IEl0J3MgY3VycmVudGx5IGdvdCB3aGF0IGxvb2tzIGxpa2UgYSBwZXJtaXNzaXZlIGxpY2Vu
Y2UgKGFzIHlvdSBjYW4KPiA+PiBzZWUgaW4gdGhlIGxpbmsgYWJvdmUpIGJ1dCBJIHdvdWxkIGxp
a2UgdG8gYXNrIGlmIHdlIGNhbiByZWxpY2Vuc2UgdGhlCj4gPj4gY29kZSB1bmRlciB0aGUgQ0VS
TiBPSEwgVjIgd2Vha2x5IHBlcm1pc3NpdmUgbGljZW5jZS4KPiA+IENvcnJlY3Rpb246IHJlbGlj
ZW5zZSB0aGUgY29kZSB1bmRlciB0aGUgQ0VSTiBPSEwgdjIgd2Vha2x5Cj4gPiBfcmVjaXByb2Nh
bF8gbGljZW5jZS4KPiA+Cj4gPj4gSW4gc3VtbWFyeSwgdGhpcyBsaWNlbmNlIGlzIGEgZmlsZS1s
ZXZlbCBjb3B5cmlnaHQgZm9yIGhhcmR3YXJlCj4gPj4gZGVzaWducy4gVGhlIEZBUSBvbiBDRVJO
J3Mgc2l0ZSBhYm91dCB0aGUgT0hMIGlzIGdyZWF0IGZvciBleHBsYW5pbmcKPiA+PiB3aGF0IHRo
ZSBPSEwgdjIgaXMgd2hhdCB0aGUgVyB2YXJpYW50IG1lYW5zOgo+ID4+IGh0dHBzOi8vb2h3ci5v
cmcvcHJvamVjdC9jZXJub2hsL3dpa2lzL2ZhcSNxLXdoYXQtYXJlLWFsbC10aGVzZS1zdWZmaXhl
cwo+ID4+Cj4gPj4gVGhpcyB3b3VsZCBvbmx5IGFwcGx5IHRvIHRoaXMgY29weSBvZiB0aGUgc291
cmNlLiBJdCBkb2VzIG5vdCBhZmZlY3QKPiA+PiB0aGUgb3RoZXIgY29waWVzIHdoaWNoIGFyZSBv
dXQgdGhlcmUgb24gdGhlIGludGVybmV0LiBJIG9ubHkgYXNrIHRoaXMKPiA+PiBmb3IgY29uc2lz
dGVuY3kgYWNyb3NzIHRoZSBtb3Ixa3ggQ1BVIHByb2plY3QuCj4gPj4KPiA+PiBZb3VyIHBlcm1p
c3Npb24gdG8gZG8gdGhpcyB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgo+ID4+Cj4gPj4g
SGFwcHkgdG8gYW5zd2VyIGFueSBvdGhlciBxdWVzdGlvbnMgeW91IGhhdmUuCj4gPj4KPiA+PiBD
aGVlcnMsCj4gPj4gSnVsaXVzCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

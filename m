Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9B23FDD27
	for <lists+openrisc@lfdr.de>; Wed,  1 Sep 2021 15:26:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 526F723EFF;
	Wed,  1 Sep 2021 15:26:44 +0200 (CEST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mail.librecores.org (Postfix) with ESMTPS id D936E22C28
 for <openrisc@lists.librecores.org>; Wed,  1 Sep 2021 15:26:42 +0200 (CEST)
Received: by mail-io1-f51.google.com with SMTP id e186so3925425iof.12
 for <openrisc@lists.librecores.org>; Wed, 01 Sep 2021 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2X46ZsTRoqQksPKNTfKJxPomt8docMRyF/tKV1rT2U=;
 b=SHTIg35N0jy3YSQDgjCv70l5RHDpLvJ4VN8mEVDDlV4zstpqd/r34zDLVKv2sXCLJ2
 dsHzeYJCCEez3B0coPz7UIl2gWv3s+pU2wXANaIzagl4N6VBMhv04jgGuq583VYWvEXM
 gx0RnK1INWI52eFPhbhOIiM1wR/ltQ4Wow2T4jdasE54FBGuSvmqlLTCOiQUFspxGRLn
 7CUZiTN4nSj9P5QlABRGlXO5dWuQjb6nf9U7dOxDTeTGlZ7lhTOhCq4jiYmp0k6ph854
 +6mnA5SCHBCtETRoZsFjF0V9ES5K9+bUZKaxOgJ0tfEyy7z50tEgcHNhXEhQ4lL9u1gE
 o26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2X46ZsTRoqQksPKNTfKJxPomt8docMRyF/tKV1rT2U=;
 b=WP5alStwAZhwkd8Wh2gHV/X2/oBny5+eC8wiii3IbI5mkmsZIZfd6vRtZwbSVhi8U+
 VmNKJ9YLEh61DZSmlZJxdeO0QOtBsUBj99K2r5h6h/Vsgs0w7xMokiWjq4ZET9OO8262
 IDJfII7QvAVKNMhspvaio5GyEZ+xRAVJeqI85PW7JK0NjCilP6mjRPZa3XMbiwdPIFN2
 empGJPBwc70K7W2eTkvbnfU/DN7lEO4E34Nc7VNa2PQ/4+ah1Gmav3tw/dhq7VmTlECK
 FDBG0CNmQyM1by8hssOF78O/2o7ijr5+/OEboFE52otIHfUggLxrX4QPl9CHIp7RUzsP
 5lew==
X-Gm-Message-State: AOAM531/kynXQtiHDMT8ZXmJS0Ao90d/30XIQShV38UOUxS/Aiu6sT6k
 sqRY746PyPSxvKzm0S2yDgkYkleEumoVplK82so=
X-Google-Smtp-Source: ABdhPJztU5VxgOLfRkzlpR6LM93qeHk1QJmYbJHTgt2ACeTkaKDcyZFvvHcusN9sAk1uWY3eoHsfthx5d8dhPARQdug=
X-Received: by 2002:a02:860d:: with SMTP id e13mr8113059jai.12.1630502801560; 
 Wed, 01 Sep 2021 06:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
In-Reply-To: <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Wed, 1 Sep 2021 22:26:30 +0900
Message-ID: <CAAfxs74_+W_dTa-yjx=+jJ3fm9R1hzS1_QVWJTPvn3fEgXaEng@mail.gmail.com>
To: Harshitha S <harshithasridhar172000@gmail.com>
Subject: Re: [OpenRISC] Continue OpenRISC contibution
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
Cc: Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SW4gdGVybXMgb2YgZGVidWdnaW5nIEkgcHV0IHRoaXMgdG9nZXRoZXIgYSB3aGlsZSBiYWNrIGZv
ciBob3cgdG8Kc2V0dXAgYW5kIHVzZSB0aGUgT3Blbk9DRCAvIEdEQiBkZWJ1ZyBlbnZpcm9ubWVu
dCBmb3Igb3BlbnJpc2MuCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy90dXRvcmlhbHMvYmxv
Yi9tYXN0ZXIvZG9jcy9EZWJ1Z2dpbmcubWQKClRoaXMgYXNzdW1lcyB5b3UgaGF2ZSBhbiBGUEdB
IGJvYXJkIGxpa2UgdGhlIGRlMCBuYW5vIGFuZCBhcmUgYWJsZSB0bwpwcm9ncmFtIG9uZSBvZiB0
aGUgZnVzZXNvYyBtb3Ixa3ggd2l0aCBhZHZfZGVidWdfc3lzIGJpdHN0cmVhbXMgb250bwppdC4g
IEFsbCB0aGF0IGNhbiBiZSBkb25lIHZpYSBmdXNlc29jIHdoaWNoIHdyYXBzIHRoZSBwcm9jZXNz
LiAgVGhlcmUKYXJlIGRvY3VtZW50cyBhYm91dCBkb2luZyB0aGF0IG9uIHRoZSB3ZWIsIGFsc28g
b25lIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVucmlzYy90dXRvcmlhbHMvdHJlZS9tYXN0
ZXIvZGUwX25hbm8KCkRvIHlvdSBoYXZlIGFuIEZQR0EgYm9hcmQgeW91IGNhbiB1c2U/CgotU3Rh
ZmZvcmQKCk9uIFN1biwgQXVnIDI5LCAyMDIxIGF0IDI6MTYgQU0gSGFyc2hpdGhhIFMKPGhhcnNo
aXRoYXNyaWRoYXIxNzIwMDBAZ21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIFN0YWZmb3JkLAo+
Cj4gSSB3YW50IHRvIHN0YXJ0IHdpdGggYSBzaW1wbGUgb25lLiBJIGhhdmUgdXBkYXRlZCB0aGUg
TW9yMWt4IEZvcm1hbCBpbiB0aGUgcmVhZG1lLgo+IExldCBtZSBrbm93IGlmIGFueXRoaW5nIGVs
c2UgdG8gYmUgaW5jbHVkZWQuCj4gaHR0cHM6Ly9naXRodWIuY29tL0hhcnNoaXRoYTE3MjAwMC9t
b3Ixa3gvY29tbWl0L2UxOTJiODNjZTAxY2Q0YjQ2N2NlNzRmZTY1YjJmM2E3Y2VkN2EyMmQKPgo+
IEkgd2lsbCB0cnkgZml4aW5nIHRoZSBidWdzIGFuZCBhbHNvIHdvcmsgb24gb3Ixa3gtZm9ybWFs
LiBNZWFud2hpbGUsIEknbSB0aGlua2luZyBvZiBleHBsb3JpbmcgT3Blbk9DRC9HREIKPiBmb3Ig
bW9yMWt4IENQVSBkZWJ1Z2dpbmcgYnV0IGhhdmluZyBubyBpZGVhIHdoZXJlIHRvIHN0YXJ0LiBD
YW4geW91IGd1aWRlIG1lIGJlZ2lubmluZyB3aXRoIENQVSBkZWJ1Z2dpbmc/Cj4KPiAtSGFyc2hp
dGhhCj4KPiBPbiBGcmksIEF1ZyAyNywgMjAyMSBhdCA1OjExIEFNIFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBBdWcgMjYsIDIwMjEgYXQgMTA6
MTc6MTdQTSArMDUzMCwgSGFyc2hpdGhhIFMgd3JvdGU6Cj4+ID4gSGVsbG8sCj4+ID4KPj4gPiBJ
J20gdGhpbmtpbmcgb2YgY29udGludWluZyBteSBjb250cmlidXRpb24gdG8gdGhlIE9wZW5SSVND
IHByb2plY3QuIFdpdGggbXkKPj4gPiBHU29DIHByb2plY3QsIEkgaGF2ZSBsZWFybmVkIHRvbyBt
YW55IG5ldyBza2lsbHMgYW5kIHdpc2ggdG8ga2VlcCB0aGlzCj4+ID4gbGVhcm5pbmcgcGFjZS4g
SSB3b3VsZCBiZSBoYXBweSB0byBsZWFybiBhbmQgZXhwbG9yZSBuZXcgc2tpbGxzLiBQbGVhc2Ug
bGV0Cj4+ID4gbWUga25vdyB3aGF0IEkgY2FuIHdvcmsgdXBvbi4KPj4KPj4gSGkgSGFyc2hpdGEs
Cj4+Cj4+IChDQ2luZyBsaXN0KQo+Pgo+PiBHbGFkIHRvIGhlYXIgeW91IGFyZSBzdGlsbCBpbnRl
cmVzdGVkLiAgSSB0aGluayB0aGVyZSBhcmUgYWx3YXlzIHBsZW50eSBvZgo+PiB0aGluZ3MsIHNv
bWUgdGhpbmdzIG9uIHRoZSB0b3Agb2YgbXkgaGVhZDoKPj4gICAtIFNpbXBsZSAtIHVwZGF0ZSB0
aGUgbW9yMWt4L3JlYWRtZS5tZCB0byBleHBsYWluIHdlIHN1cHBvcnQgZm9ybWFsCj4+ICAgLSBN
ZWRpdW0gLSBmaXggdGhlIGJ1Z3MgdGhhdCB5b3UgcmFpc2VkCj4+ICAgLSBCaWdnZXIgLSBvcjFr
LWZvcm1hbCAobGlrZSByaXNjdi1mb3JtYWwsIGZvcm1hbGx5IHZlcmlmeSBlYWNoIGluc3RydWN0
aW9uKQo+Pgo+PiAtU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

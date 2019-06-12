Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2075A43178
	for <lists+openrisc@lfdr.de>; Wed, 12 Jun 2019 23:25:45 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CB3D020286;
	Wed, 12 Jun 2019 23:25:44 +0200 (CEST)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by mail.librecores.org (Postfix) with ESMTPS id 3AFA620155
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 23:25:43 +0200 (CEST)
Received: by mail-ua1-f65.google.com with SMTP id f20so6518681ual.0
 for <openrisc@lists.librecores.org>; Wed, 12 Jun 2019 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cHRgmowSmopHw9sfm9TH3coyQuY/MBoK/BU155eg8vk=;
 b=Rj+MdTXiXotNM5Gl/hU85C6RUcRP9NmYJZe4Blto1H1hrY9vudpEUX/uhWSueWtzlJ
 S8hxERN03ydfjK4pdWszDyOoJXEGXE9uaCPFBrQ28fNXBSeSQSpJQ4BLm8KuDywHiosZ
 GxkdHqHYYZRzQ+UL2th5basNc+VsSyQ6nO8xOLo3lrsVwf9GyDmDZK+OsUxL2+mL0rIY
 du5rEJ4mUKsdm3J4fEt8E7hpjPtNsPq4ZZWzYXYbGLC1sSvtKC0CeFx0DLokkAAR1Jgt
 bPUyIr/EBNnQAomOeTwdYqFRXPjl8i/2VVi/3eBSrf8AOZSjHnpsel4fpwmYa3OMTUZi
 /xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cHRgmowSmopHw9sfm9TH3coyQuY/MBoK/BU155eg8vk=;
 b=U8bkdYANa1Rn30dfvkm2/3IqdG5FHZpEOdRVCF8/gZOW8A/jCamFdAfdclIThTEwHN
 yjPJJfmrx5/Vk4Nqzpn5QfaDBhxlMTwKZtvfRbwOk9v5aXCjXiOMGHtgoegE/of/ir/w
 3DGj5E/a5w3tzkZHH837o9R5NQtqywFwESItdPVKngzRAVepZVheujy3Mmxj1r4c9l1P
 PpBXwfgcVbavtl5GGWd0Z0jbyYbr2upSd9AyTFpQaXA90rZg7XLMvCJkqgtxTqArSdSO
 j9yEubyPvjWI2k1GZjFnkHDMy3ztz34svjvx9zuq8xQ519fkzZZ1rdUfzDvU4lHDIWgj
 NYfw==
X-Gm-Message-State: APjAAAUcrKH/qovMzgoYJUqZs6BSLh7fSJDtYYB5nfqj52bANjn1Q+HE
 QZlFBortHo7uXGj3Lv+YIwpWZZzhOAZtBaesNng=
X-Google-Smtp-Source: APXvYqyF6fNE3P5XxhUN2A2Xs69MsWmtpvlQfJfGVBNYAuv0/+F2uJnACmzAkOUMY6QtbnysTQBulRxsVWnJl+1dwIg=
X-Received: by 2002:ab0:208c:: with SMTP id r12mr28985934uak.27.1560374741817; 
 Wed, 12 Jun 2019 14:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190608213225.3230-1-shorne@gmail.com>
 <a597b99a-bf5c-0c6b-bc8a-c81faf856f1d@redhat.com>
 <20190612131212.GD2358@lianli.shorne-pla.net>
In-Reply-To: <20190612131212.GD2358@lianli.shorne-pla.net>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 13 Jun 2019 06:25:30 +0900
Message-ID: <CAAfxs77s50LRn3XtmMhJA9aj7wPtZ9uFg=f_+WLUFc_ywoJKUg@mail.gmail.com>
To: Nick Clifton <nickc@redhat.com>
Subject: Re: [OpenRISC] [PATCH v3 0/11] OpenRISC orfpx64a32 and openrisc
 spec 1.3 support
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>, Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>,
 GDB patches <gdb-patches@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6MTIgUE0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDU6MDI6NDNQTSAr
MDEwMCwgTmljayBDbGlmdG9uIHdyb3RlOgo+ID4gSGkgU3RhZmZvcmQsCj4gPgo+ID4gPiBJdHMg
YmVlbiBhIHdoaWxlIHNpbmNlIHYyLCBidXQgd2UgaGF2ZSBiZWVuIGJ1c3kgY2hhbmdpbmcgZGly
ZWN0aW9uIGEgYml0Lgo+ID4gPiBJbnN0ZWFkIG9mIGp1c3QgYWRkaW5nIHRoZSBvcmZweDY0YTMy
IGV4dGVuc2lvbiBzdXBwb3J0IHdlIGhhdmUgY3JlYXRlZCBhIG5ldwo+ID4gPiBhcmNoaXRlY3R1
cmUgc3BlY2lmaWNhdGlvbiBbMF0gYW5kIHRoaXMgc2VyaWVzIGluY2x1ZGVzIHNvbWUgb2YgdGhv
c2UgY2hhbmdlcy4KPiA+Cj4gPiBUaGUgYmludXRpbHMgcGFydHMgb2YgdGhlIHBhdGNoIHNlcmll
cyBhcmUgYXBwcm92ZWQgLSBwbGVhc2UgYXBwbHkuCj4KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcs
Cj4KPiBJIHdpbGwgYXBwbHkgb25jZSBJIGdldCB0aGUgZ28gYWhlYWQgb24gdGhlIGNnZW4gcGF0
Y2hlcy4KCk5vdGUsIHRoZSBjZ2VuIGNoYW5nZXMgd2VyZSBhcHBsaWVkIGluIGNnZW4uICBUaGUg
YmludXRpbHMgcG9ydGlvbiBoYXMKYmVlbiBhcHBsaWVkCm5vdy4KClRoYW5rcywKCi1TdGFmZm9y
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

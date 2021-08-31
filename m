Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B85053FC8A7
	for <lists+openrisc@lfdr.de>; Tue, 31 Aug 2021 15:47:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3CD7824136;
	Tue, 31 Aug 2021 15:47:55 +0200 (CEST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mail.librecores.org (Postfix) with ESMTPS id A061C22C28
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 15:47:53 +0200 (CEST)
Received: by mail-ej1-f48.google.com with SMTP id bt14so38904950ejb.3
 for <openrisc@lists.librecores.org>; Tue, 31 Aug 2021 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C+7SHdno8G/pY85+XwsBVr3RrF5OpNtJWKrVxSWKkHQ=;
 b=c7MekNTHAElmOd0prsfWL7bDEPrdUKOdJ6tJr/OIGPk9gyZpJY/9aCrFMJLlER+Pmw
 56Uj8cjYrEoyks5dwqK7vAReYwXbGxO+d3bMdrBkVVIATeie4GS9+gNc0ZRn/0aX57QY
 JwhSrAqG+04xlyymb9iz8jrBP5kVAS2rA9DPnMwF7Xxio3phtocquk1De6jbL0PClz07
 NlFNOkHoY8wu1jvBW6ugzOx0z/MKcN4etkQTr9h18Y7GGuDDnLYKmSrEBxEGNHLnYkiY
 Ko0OKNUgmoT2FmWssoGxAf2832j/cLTF8Q0N6UeJftK1sMJfilCaZOA93+5BeaQL/Qc9
 rDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C+7SHdno8G/pY85+XwsBVr3RrF5OpNtJWKrVxSWKkHQ=;
 b=FwbLoq2+ej2XdF2pIiXn3y1kkKDdw43QK2bwdNecPni4onZtOCvAOHkO4uhRd0ew26
 N0CgofRtWKcWdnvLGxXQECZpn+3BesETYbM+0r6e8Pz8gSNgp0FBDqy1IvSRRkXYCtK9
 bPLYTZqbeXnf9xxbaC8Hvpltb6s/z8z1QBh3FSFAAZO1g2YJWrT4T3qvXHg0FoMbhcAH
 eusJZpSy1yA4Fg2YNGNxQexWMOvzERWStTNJvKKEugBwladrSgcaB8HlCYaL/uTJiPMd
 w2hchPGPbsgwHrZsmWtmHvRajhh/PlZR0JbBbhSxARrKWUwYIJZqI5Z27fz8ZKguYDqr
 LjKg==
X-Gm-Message-State: AOAM531BB7jZklMMDWW32Kb2YWFzYrkFrZnexzn2ezVY9x/xSsmQBBPd
 zjyKpmc7OI/N9+AeN3kfufrSo1pavdkwyrI5t/c=
X-Google-Smtp-Source: ABdhPJzTDUCXh2OsE6lObt0U8xCT4lk/Mhs3cjvRYt1nAHD6YADTAUffKBgvg2BzLhIApCQWQ2tmMdO+75Hx/NVuPU4=
X-Received: by 2002:a17:906:9747:: with SMTP id
 o7mr31007126ejy.486.1630417673240; 
 Tue, 31 Aug 2021 06:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADGJwMwapL_eB_ZqKmaDsoFxCY_3qvKu=0BfdSGQZaC5GEjP1Q@mail.gmail.com>
 <YSgmu/bnzRnI7AGI@antec>
 <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
In-Reply-To: <CADGJwMzBfYmkXPAuTuPtEmMruuTydmW1h--YQJjWTmHyiDOv6Q@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Tue, 31 Aug 2021 22:47:41 +0900
Message-ID: <CAAfxs769RLG-qTuezZYiv+Pze-sqxRAokw6pT3ecYrpn8Len4g@mail.gmail.com>
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

VGhlIGNvbW1pdCBsb29rcyBnb29kLCBjYW4geW91IG1ha2UgYSBQUiBmb3IgaXQ/CgpPbiBTdW4s
IEF1ZyAyOSwgMjAyMSBhdCAyOjE2IEFNIEhhcnNoaXRoYSBTCgo8aGFyc2hpdGhhc3JpZGhhcjE3
MjAwMEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gU3RhZmZvcmQsCj4KPiBJIHdhbnQgdG8g
c3RhcnQgd2l0aCBhIHNpbXBsZSBvbmUuIEkgaGF2ZSB1cGRhdGVkIHRoZSBNb3Ixa3ggRm9ybWFs
IGluIHRoZSByZWFkbWUuCj4gTGV0IG1lIGtub3cgaWYgYW55dGhpbmcgZWxzZSB0byBiZSBpbmNs
dWRlZC4KPiBodHRwczovL2dpdGh1Yi5jb20vSGFyc2hpdGhhMTcyMDAwL21vcjFreC9jb21taXQv
ZTE5MmI4M2NlMDFjZDRiNDY3Y2U3NGZlNjViMmYzYTdjZWQ3YTIyZAo+Cj4gSSB3aWxsIHRyeSBm
aXhpbmcgdGhlIGJ1Z3MgYW5kIGFsc28gd29yayBvbiBvcjFreC1mb3JtYWwuIE1lYW53aGlsZSwg
SSdtIHRoaW5raW5nIG9mIGV4cGxvcmluZyBPcGVuT0NEL0dEQgo+IGZvciBtb3Ixa3ggQ1BVIGRl
YnVnZ2luZyBidXQgaGF2aW5nIG5vIGlkZWEgd2hlcmUgdG8gc3RhcnQuIENhbiB5b3UgZ3VpZGUg
bWUgYmVnaW5uaW5nIHdpdGggQ1BVIGRlYnVnZ2luZz8KPgo+IC1IYXJzaGl0aGEKPgo+IE9uIEZy
aSwgQXVnIDI3LCAyMDIxIGF0IDU6MTEgQU0gU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIEF1ZyAyNiwgMjAyMSBhdCAxMDoxNzoxN1BNICswNTMw
LCBIYXJzaGl0aGEgUyB3cm90ZToKPj4gPiBIZWxsbywKPj4gPgo+PiA+IEknbSB0aGlua2luZyBv
ZiBjb250aW51aW5nIG15IGNvbnRyaWJ1dGlvbiB0byB0aGUgT3BlblJJU0MgcHJvamVjdC4gV2l0
aCBteQo+PiA+IEdTb0MgcHJvamVjdCwgSSBoYXZlIGxlYXJuZWQgdG9vIG1hbnkgbmV3IHNraWxs
cyBhbmQgd2lzaCB0byBrZWVwIHRoaXMKPj4gPiBsZWFybmluZyBwYWNlLiBJIHdvdWxkIGJlIGhh
cHB5IHRvIGxlYXJuIGFuZCBleHBsb3JlIG5ldyBza2lsbHMuIFBsZWFzZSBsZXQKPj4gPiBtZSBr
bm93IHdoYXQgSSBjYW4gd29yayB1cG9uLgo+Pgo+PiBIaSBIYXJzaGl0YSwKPj4KPj4gKENDaW5n
IGxpc3QpCj4+Cj4+IEdsYWQgdG8gaGVhciB5b3UgYXJlIHN0aWxsIGludGVyZXN0ZWQuICBJIHRo
aW5rIHRoZXJlIGFyZSBhbHdheXMgcGxlbnR5IG9mCj4+IHRoaW5ncywgc29tZSB0aGluZ3Mgb24g
dGhlIHRvcCBvZiBteSBoZWFkOgo+PiAgIC0gU2ltcGxlIC0gdXBkYXRlIHRoZSBtb3Ixa3gvcmVh
ZG1lLm1kIHRvIGV4cGxhaW4gd2Ugc3VwcG9ydCBmb3JtYWwKPj4gICAtIE1lZGl1bSAtIGZpeCB0
aGUgYnVncyB0aGF0IHlvdSByYWlzZWQKPj4gICAtIEJpZ2dlciAtIG9yMWstZm9ybWFsIChsaWtl
IHJpc2N2LWZvcm1hbCwgZm9ybWFsbHkgdmVyaWZ5IGVhY2ggaW5zdHJ1Y3Rpb24pCj4+Cj4+IC1T
dGFmZm9yZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5A13EC5C8
	for <lists+openrisc@lfdr.de>; Sun, 15 Aug 2021 00:24:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3A9832407E;
	Sun, 15 Aug 2021 00:24:47 +0200 (CEST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mail.librecores.org (Postfix) with ESMTPS id 1A71822C28
 for <openrisc@lists.librecores.org>; Sun, 15 Aug 2021 00:24:45 +0200 (CEST)
Received: by mail-pj1-f52.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so21456059pjb.0
 for <openrisc@lists.librecores.org>; Sat, 14 Aug 2021 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8WtPm9NI5GdaHRgA7s2MZNqj0fqOuPG+X6x+Vpot22E=;
 b=map+aK/MUz8qmDrRxIKgaXGLGhh0Jf156nmahRVx2cH3KDX6C4YLwb4euXJlNp8xGM
 MRluf9jLT6G6lfTXBBD5dHj4BkD/sbdtWslj9qsx+DIZgEU8/cCM9LE+cJboIoD7RSTA
 ZE2RlvCqLxW3bMjIc+pRxKSrqEgljNwT9E8sqX3fe9SmzWM981HEUsucqE1x4V4ptsu9
 UgxaMH2oi8DxWYyGGPwqUeGuVnV088PKw049csC4Lp2Em0drpEp/Euvb1CQnWJqT9b+u
 jZHuqqoMmy7xghwxOTjCkpHpFbmmSw86pQvLRLeNDW1uS/ug+hckVPG/Hqya+HqPd0CN
 HtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8WtPm9NI5GdaHRgA7s2MZNqj0fqOuPG+X6x+Vpot22E=;
 b=CYeIORvd+lYS9npZuzdQ9HtTmPkjv3i6+cnkrcei7WZA8hXQOgnu6W5PfBbWgPVxk8
 ms/Z99O7XOBsOrrHwkkLJKcCe4Ts02U1HStKLGW4CILHr6u4rCKK5b2K2HUXVNQ3aFIZ
 1powsbBHhe6oZeL0t0VBeUiWaHURuTm0hrGV/cpdzv2jfevIPdKBwso7kiuXsb5pFCsA
 fmzyA6Vrw49/dgCtb4CpwKScaqiG+HJS1/prmBey2mgBJrbQF2cn7WfDGhzFViYKkCxy
 DKmghnaMqog1q9MygNuHvvrBjMPMxiviN2Hfn/nuHUpNzJp/bDgCrwusb3VRxfs4rN8n
 Er6Q==
X-Gm-Message-State: AOAM5303fvdAn3OzUurzX0QihD+ZQfTbx9oK0i2uN8pbgYt8I5SeR3Xh
 +i9NMRATlRNwNpuZ6/A19Sg=
X-Google-Smtp-Source: ABdhPJxxk0En9CSxotCwKpvncGUc5VJBHXFWsCsPfOS8TegmqOT3FotqFTvywexe5W9eaOpGXcvoeA==
X-Received: by 2002:a17:902:7c87:b029:12c:8f2d:4238 with SMTP id
 y7-20020a1709027c87b029012c8f2d4238mr7292676pll.50.1628979883659; 
 Sat, 14 Aug 2021 15:24:43 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id b6sm7235523pgs.94.2021.08.14.15.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 15:24:42 -0700 (PDT)
Date: Sun, 15 Aug 2021 07:24:40 +0900
From: Stafford Horne <shorne@gmail.com>
To: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Message-ID: <YRhCqNWB1MC++TAO@antec>
References: <20210806094217.3227877-1-shorne@gmail.com>
 <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f577bc8-bef8-6c06-aaa9-57bf16d8443b@linaro.org>
Subject: Re: [OpenRISC] [PATCH v2] time: Fix overflow itimer tests on 32-bit
 systems
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
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBdWcgMTEsIDIwMjEgYXQgMDU6MzA6NDBQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+IAo+IAo+IE9uIDA2LzA4LzIwMjEgMDY6NDIsIFN0YWZmb3JkIEhvcm5lIHdy
b3RlOgo+ID4gT24gdGhlIHBvcnQgb2YgT3BlblJJU0MgSSBhbSB3b3JraW5nIG9uIGFuZCBpdCBh
cHBlYXJzIHRoZSBydjMyIHBvcnQKPiA+IHdlIGhhdmUgc2V0cyBfX1RJTUVTSVpFID09IDY0ICYm
IF9fV09SRFNJWkUgPT0gMzIuICBUaGlzIGNhdXNlcyB0aGUKPiA+IHNpemUgb2YgdGltZV90IHRv
IGJlIDggYnl0ZXMsIGJ1dCB0aGUgdHZfc2VjIGluIHRoZSBrZXJuZWwgaXMgc3RpbGwgMzItYml0
Cj4gPiBjYXVzaW5nIHRydW5jYXRpb24uCj4gPiAKPiA+IFRoZSB0cnVuY2F0aW9ucyBhcmUgdW5h
dm9pZGFibGUgb24gdGhlc2Ugc3lzdGVtcyBzbyBza2lwIHRoZQo+ID4gdGVzdGluZy9mYWlsdXJl
cyBieSBndWFyZGluZyB3aXRoIF9fS0VSTkVMX09MRF9USU1FVkFMX01BVENIRVNfVElNRVZBTDY0
Lgo+ID4gCj4gPiBBbHNvLCBmdXRoZXIgaW4gdGhlIHRlc3RzIGFuZCBpbiBvdGhlciBwYXJ0cyBv
ZiBjb2RlIGNoZWNraW5nIGZvciB0aW1lX3QKPiA+IG92ZXJmbG93IGRvZXMgbm90IHdvcmsgb24g
MzItYml0IHN5c3RlbXMgd2hlbiB0aW1lX3QgaXMgNjQtYml0LiAgQXMKPiA+IHN1Z2dlc3RlZCBi
eSBBZGhlbWVydmFsLCB1cGRhdGUgdGhlIGluX3RpbWVfdF9yYW5nZSBmdW5jdGlvbiB0byBhc3N1
bWUKPiA+IDMyLWJpdHMgYnkgdXNpbmcgaW50MzJfdC4KPiA+IAo+ID4gVGhpcyBhbHNvIGJyaW5n
cyBpbiB0aGUgaGVhZGVyIGZvciBzdGRpbnQuaCBzbyB3ZSBjYW4gdXBkYXRlIG90aGVyCj4gPiB1
c2FnZXMgb2YgX19pbnQzMl90IHRvIGludDMyX3QgYXMgc3VnZ2VzdGVkIGJ5IEFkaGVtZXJ2YWwu
Cj4gPiAtLS0KPiA+IAo+ID4gSGVsbG8sCj4gPiAKPiA+IFNvcnJ5IGZvciB0aGUgZGVsYXkgdG8g
Z2V0IHRoaXMgb3V0IEkgaGF2ZSBiZWVuIGJ1c3kgb24gdGhlIGhhcmR3YXJlIHNpZGUgb2YKPiA+
IG9wZW5yaXNjIHRoZSBsYXN0IG1vbnRoIHNvIEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gc3BlbmQg
dGltZSBvbiBnZXR0aW5nIHRoaXMKPiA+IG91dC4KPiA+IAo+ID4gVGhlIHBhdGNoIGVuZHMgdXAg
ZG9pbmcgYSB0ZXN0IGZpeCBhbmQgc29tZSBsaWIgY29kZSBmaXhlcywgSSBjYW4gc3BsaXQgaXQg
dG8KPiA+IHNlcGFyYXRlIHNtYWxsIHBhdGNoZXMuICBCdXQgc2luY2UgYXMgYSB3aG9sZSBpdCdz
IHNtYWxsIEkgZmVlbCBsZWF2aW5nIGl0Cj4gPiB0b2dldGhlciBpcyBiZXN0Lgo+IAo+IExHVE0s
IHRoYW5rcy4KPiAKPiBSZXZpZXdlZC1ieTogQWRoZW1lcnZhbCBaYW5lbGxhICA8YWRoZW1lcnZh
bC56YW5lbGxhQGxpbmFyby5vcmc+CgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgo+ID4gCj4gPiAt
U3RhZmZvcmQKPiA+IAo+ID4gIGluY2x1ZGUvdGltZS5oICAgIHwgMTAgKysrKysrLS0tLQo+ID4g
IHRpbWUvdHN0LWl0aW1lci5jIHwgIDQgKystLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS90
aW1lLmggYi9pbmNsdWRlL3RpbWUuaAo+ID4gaW5kZXggNDM3MmJmYmQ5Ni4uYmEzYzUxMTZjZiAx
MDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvdGltZS5oCj4gPiArKysgYi9pbmNsdWRlL3RpbWUuaAo+
ID4gQEAgLTExLDYgKzExLDcgQEAKPiA+ICAjIGluY2x1ZGUgPHN5cy90aW1lLmg+Cj4gPiAgIyBp
bmNsdWRlIDx0aW1lLWNsb2NraWQuaD4KPiA+ICAjIGluY2x1ZGUgPHN5cy90aW1lLmg+Cj4gPiAr
IyBpbmNsdWRlIDxzdGRpbnQuaD4KPiA+ICAKPiA+ICBleHRlcm4gX190eXBlb2YgKHN0cmZ0aW1l
X2wpIF9fc3RyZnRpbWVfbDsKPiA+ICBsaWJjX2hpZGRlbl9wcm90byAoX19zdHJmdGltZV9sKQo+
ID4gQEAgLTMzNCwxMSArMzM1LDEyIEBAIGxpYmNfaGlkZGVuX3Byb3RvIChfX3RpbWU2NCkKPiA+
ICAgICBhY3R1YWwgY2xvY2sgSUQuICAqLwo+ID4gICNkZWZpbmUgQ0xPQ0tfSURGSUVMRF9TSVpF
CTMKPiA+ICAKPiA+IC0vKiBDaGVjayB3aGV0aGVyIFQgZml0cyBpbiB0aW1lX3QuICAqLwo+ID4g
Ky8qIENoZWNrIHdoZXRoZXIgVCBmaXRzIGluIGludDMyX3QsIGFzc3VtZSBhbGwgdXNhZ2VzIGFy
ZSBmb3IKPiA+ICsgICBzaXplb2YodGltZV90KSA9PSAzMi4gICovCj4gPiAgc3RhdGljIGlubGlu
ZSBib29sCj4gPiAgaW5fdGltZV90X3JhbmdlIChfX3RpbWU2NF90IHQpCj4gPiAgewo+ID4gLSAg
dGltZV90IHMgPSB0Owo+ID4gKyAgaW50MzJfdCBzID0gdDsKPiA+ICAgIHJldHVybiBzID09IHQ7
Cj4gPiAgfQo+ID4gIAo+ID4gQEAgLTQ0NSw4ICs0NDcsOCBAQCB0aW1lc3BlYzY0X3RvX3RpbWV2
YWw2NCAoY29uc3Qgc3RydWN0IF9fdGltZXNwZWM2NCB0czY0KQo+ID4gICAgIGFuZCBzdXNlY29u
ZHNfdC4gICovCj4gPiAgc3RydWN0IF9fdGltZXZhbDMyCj4gPiAgewo+ID4gLSAgX19pbnQzMl90
IHR2X3NlYzsgICAgICAgICAvKiBTZWNvbmRzLiAgKi8KPiA+IC0gIF9faW50MzJfdCB0dl91c2Vj
OyAgICAgICAgLyogTWljcm9zZWNvbmRzLiAgKi8KPiA+ICsgIGludDMyX3QgdHZfc2VjOyAgICAg
ICAgIC8qIFNlY29uZHMuICAqLwo+ID4gKyAgaW50MzJfdCB0dl91c2VjOyAgICAgICAgLyogTWlj
cm9zZWNvbmRzLiAgKi8KPiA+ICB9Owo+ID4gIAo+ID4gIC8qIENvbnZlcnNpb24gZnVuY3Rpb25z
IGZvciBjb252ZXJ0aW5nIHRvL2Zyb20gX190aW1ldmFsMzIgICovCj4gPiBkaWZmIC0tZ2l0IGEv
dGltZS90c3QtaXRpbWVyLmMgYi90aW1lL3RzdC1pdGltZXIuYwo+ID4gaW5kZXggOTI5YzJiNzRj
Ny4uYmQ3ZDdhZmU4MyAxMDA2NDQKPiA+IC0tLSBhL3RpbWUvdHN0LWl0aW1lci5jCj4gPiArKysg
Yi90aW1lL3RzdC1pdGltZXIuYwo+ID4gQEAgLTEwMCw3ICsxMDAsNyBAQCBkb190ZXN0ICh2b2lk
KQo+ID4gIAo+ID4gICAgICAgIC8qIExpbnV4IGRvZXMgbm90IHByb3ZpZGUgNjQgYml0IHRpbWVf
dCBzdXBwb3J0IGZvciBnZXRpdGltZXIgYW5kCj4gPiAgCSBzZXRpdGltZXIgb24gYXJjaGl0ZWN0
dXJlcyB3aXRoIDMyIGJpdCB0aW1lX3Qgc3VwcG9ydC4gICovCj4gPiAtICAgICAgaWYgKHNpemVv
ZiAoX190aW1lX3QpID09IDgpCj4gPiArICAgICAgaWYgKF9fS0VSTkVMX09MRF9USU1FVkFMX01B
VENIRVNfVElNRVZBTDY0KQo+ID4gIAl7Cj4gPiAgCSAgVEVTVF9DT01QQVJFIChzZXRpdGltZXIg
KHRpbWVyc1tpXSwgJml0LCBOVUxMKSwgMCk7Cj4gPiAgCSAgVEVTVF9DT01QQVJFIChzZXRpdGlt
ZXIgKHRpbWVyc1tpXSwgJihzdHJ1Y3QgaXRpbWVydmFsKSB7IDAgfSwKPiA+IEBAIC0xMzEsNyAr
MTMxLDcgQEAgZG9fdGVzdCAodm9pZCkKPiA+ICAgICAgICBpdC5pdF9pbnRlcnZhbC50dl91c2Vj
ID0gMjA7Cj4gPiAgICAgICAgaXQuaXRfdmFsdWUudHZfc2VjID0gMzA7Cj4gPiAgICAgICAgaXQu
aXRfdmFsdWUudHZfdXNlYyA9IDQwOwo+ID4gLSAgICAgIGlmIChzaXplb2YgKF9fdGltZV90KSA9
PSA4KQo+ID4gKyAgICAgIGlmIChfX0tFUk5FTF9PTERfVElNRVZBTF9NQVRDSEVTX1RJTUVWQUw2
NCkKPiA+ICAJewo+ID4gIAkgIFRFU1RfQ09NUEFSRSAoc2V0aXRpbWVyICh0aW1lcnNbaV0sICZp
dCwgTlVMTCksIDApOwo+ID4gIAo+ID4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

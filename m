Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE173E0BEB
	for <lists+openrisc@lfdr.de>; Thu,  5 Aug 2021 03:00:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C24C32403A;
	Thu,  5 Aug 2021 03:00:06 +0200 (CEST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mail.librecores.org (Postfix) with ESMTPS id E2C5921390
 for <openrisc@lists.librecores.org>; Thu,  5 Aug 2021 03:00:04 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id qk33so6527788ejc.12
 for <openrisc@lists.librecores.org>; Wed, 04 Aug 2021 18:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OzPZeHwF/DOC1TQzaudXRZBVjBqnfMVIjg67KQaP9wg=;
 b=SEGEH83uBeyWPEqCDhy5vjQNsXuVrYS7GrPDcjZs2eSgQEyrXdOUbmCA6hFLPT50Ty
 cyKgnP61I5PRm04j9wnXiCO6C09rYYuLBVreyvs2rOHdRplzV0RyKz/OvuAbRA1GIlWY
 BKv3OwlfVvwbA1Cy1xuW8StJD7Q1q9z5fvDhSGuPBUuUDDIKeG1dPOz5stlT2vQCP4vJ
 AIzTedd7l9NaYbmLBeuY6AqgYcnlzqCJc02roGPJRQ4+FsG11SoTasW41h/TGX7+/y5l
 RNH8d7MfdAKTTJI+Bq4BoFeg7R2zG/3yMMhrFMf5XH4PmV8glledazqpfRebdZwSMBw0
 H/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OzPZeHwF/DOC1TQzaudXRZBVjBqnfMVIjg67KQaP9wg=;
 b=fXgfZ2U2p+Ge5R9SnPJT6BjDeUyEKj3UdDS+TcUnMdtS2gc8G6SpOhO+TIBMbOFdCt
 p+gsCKsTV8VcjxomHyJurlV6JM200abiPhCNVD6wsvjiwOvqxN2MbJd5tCcG58RBl1Cc
 g2cCyhSOOjzvchpb7NCTrVBkaaJIfc1NKNly6Cl1sFH18uOqMedw+dmdlXDb4mT2VSSQ
 2WGYQ546h6NEKv5n2NvkKSdT5OYDjdlxysHhkZGTU4e3+jk4OyVna8RkjXPoh8iQMVlj
 XJu1RfMm1FHtf4wZKml177sdl51Ffrs5kC5ptwydI2Ip6sQ/cJRKnBk0VBztePCGO8VU
 eUzw==
X-Gm-Message-State: AOAM531Nmx6AlTB+HwEGkoJo9Jygq4oKUFneO4HUWXtYF3dzH/j+7YSt
 9QvAC8WzZBiqLP8iGMpG0p2MIqOFhXZIT593+Qg=
X-Google-Smtp-Source: ABdhPJy26oSnQWGpqMCJ5JGO+kWQHqbPnrVSJ0r2UXPbUQLgLhkg9k092pW0pzv1A9d+FivsgIYWy/u6hx/NG92J6Bs=
X-Received: by 2002:a17:906:c155:: with SMTP id
 dp21mr1937154ejc.9.1628125204547; 
 Wed, 04 Aug 2021 18:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6YiZ5Hsc-mf_s5bBVQ5+gRQ1++rC=HP5XT2mwyygEjs_1gqw@mail.gmail.com>
 <CADzBsGPE=YaKcR9_37iPHk=hwapDar1tV8mkxudmh1v6H4j+EA@mail.gmail.com>
In-Reply-To: <CADzBsGPE=YaKcR9_37iPHk=hwapDar1tV8mkxudmh1v6H4j+EA@mail.gmail.com>
From: Stafford Horne <shorne@gmail.com>
Date: Thu, 5 Aug 2021 10:00:01 +0900
Message-ID: <CAAfxs77xhSeM-QPYsEr7t-gEVO2+w9EchESAE44XMUcJp37=8Q@mail.gmail.com>
To: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Subject: Re: [OpenRISC] mor1kx licensing
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
Cc: BAndViG <bandvig@mail.ru>,
 Stefan Wallentowitz <stefan.wallentowitz@gmail.com>,
 Julius Baxter <juliusbaxter@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SSBhZ3JlZSBhcyB3ZWxsLCBDRVJOLU9ITC1XIHNvdW5kcyByaWdodC4gIEFsc28sIHRvIGRvIHRo
ZSBjaGFuZ2UgYSBQUgp1cGRhdGluZyBhbGwgdGhlIGZpbGVzIGhlYWRlcnMgYW5kIHRoZSBsaWNl
bnNlIGZpbGUgd291bGQgYmUgdGhlIHdheQp0byBkbyBpdC4KCkNDaW5nIEFuZHJleSBhcyB3ZWxs
IGFuZCBoZSBkaWQgYSBsb3Qgb2Ygd29yayBvbiBtb3Ixa3ggRlBVIGFuZCBvdGhlciBwYXJ0cy4K
Ck9uIFdlZCwgQXVnIDQsIDIwMjEgYXQgMTozMiBQTSBTdGVmYW4gS3Jpc3RpYW5zc29uCjxzdGVm
YW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFodGkuZmk+IHdyb3RlOgo+Cj4gSSdtIGluIGZhdm9yLCBh
bmQgSSBhZ3JlZSB0aGF0IENFUk4tT0hMLVcgc291bmRzIGxpa2UgdGhlIHJpZ2h0IGZsYXZvci4K
Pgo+IE9uIFdlZCwgQXVnIDQsIDIwMjEgYXQgNjo1MCBBTSBKdWxpdXMgQmF4dGVyIDxqdWxpdXNi
YXh0ZXJAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gSGVsbG8gZmVsbG93IG1vcjFreCBkZXZlbG9w
ZXJzLAo+Pgo+PiBJJ3ZlIGJlZW4gbWVhbmluZyB0byBkbyB0aGlzIGZvciBhIHdoaWxlLCBidXQg
SSdkIGxpa2UgdG8gcHJvcG9zZSB3ZSBzd2l0Y2ggdGhlIGxpY2VuY2Ugb2YgdGhlIG1vcjFreCB0
byB0aGUgQ0VSTiBPSEwgdjIsIGFuZCB0aGVuIEkgY2FuIEVPTCB0aGUgT0hETC4KPj4KPj4gVGhl
cmUgYXJlIDMgdHlwZXMgb2YgdGhlIE9ITCB2MiBsaWNlbmNlLCBiYXNpY2FsbHkgMSkgc3Ryb25n
bHkgcmVjaXByb2NhbCwgMikgd2Vha2x5IHJlY2lwcm9jYWwsIGFuZCAzKSBwZXJtaXNzaXZlLgo+
Pgo+PiBJbiB0aGUgc3Bpcml0IG9mIHRoZSBPSERMIHRoZSBtb3Ixa3ggaXMgY3VycmVudGx5IGxp
Y2Vuc2VkIHVuZGVyLCBJJ2Qgc3VnZ2VzdCB3ZSBnbyB3aXRoIHRoZSB3ZWFrbHktcmVjaXByb2Nh
bCBsaWNlbmNlLCB0aGUgQ0VSTi1PSEwtVy4KPj4KPj4gVGhlIE9IV1Igc2l0ZSBoYXMgYSBuaWNl
IEZBUSBkZXNjcmliaW5nIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlc2UgdjIgZmxhdm91cnM6
Cj4+IGh0dHBzOi8vb2h3ci5vcmcvcHJvamVjdC9jZXJub2hsL3dpa2lzL2ZhcSNxLXdoYXQtYXJl
LWFsbC10aGVzZS1zdWZmaXhlcwo+Pgo+PiBUaGUgaWRlYSBiZWhpbmQgdGhlIE9IREwgd2FzIHRo
YXQgaXQnZCBiZSBmaWxlLWxldmVsIGNvcHlsZWZ0LCBqdXN0IGxpa2UgdGhlIE1QTCAob3IgYXQg
bGVhc3QgYXMgSSBpbnRlcnByZXRlZCBpdCkgaXQgd2FzIGJhc2VkIG9uICh2aWEgbS14IHF1ZXJ5
LXJlcGxhY2UgaW4gRW1hY3MgOi1QICkuIEkgdGhpbmsgaXQnZCBiZSBnb29kIHRvIGJhY2sgdGhl
IHdvcmsgSmF2aWVyIGFuZCBBbmRyZXcgYW5kIE1pcmlhbSBoYXZlIGRvbmUgd2l0aCBvdXIgb3du
IHdvcmsuCj4+Cj4+IEknbSBjb3B5aW5nIHRoZSBPcGVuUklTQyBsaXN0IGJlY2F1c2UgSSBndWVz
cyBJIHdhbnQgdG8gbWFrZSBzdXJlIGFueSBjb250cmlidXRvciBmcm9tIHRoZSBwYXN0IGdldHMg
YSBoZWFkcyB1cCwgdG9vLgo+Pgo+PiBUaGlzIGlzIHRoZSBmaXJzdCB0aW1lIEkndmUgZG9uZSBz
b21ldGhpbmcgbGlrZSB0aGlzLCBzbyBhbSBub3QgdG9vIGZhbWlsaWFyIHdpdGggdGhlIHByb2Nl
c3MuIFNob3VsZCBJIGp1c3QgZG8gYSBQUiBvbiBnaXRodWIgYW5kIHdlIGNhbiBkZWJhdGUgaXQg
b24gdGhlcmU/Cj4+Cj4+IEFueXdheSwgSSdtIGludGVyZXN0ZWQgaW4geW91ciB0aG91Z2h0cy4g
RmVlbCBmcmVlIHRvIGNvbnRhY3QgbWUgb2ZmIGxpc3QgaWYgeW91IHByZWZlci4gVW5sZXNzIGFu
eW9uZSBvYmplY3RzLCBJJ2xsIGRvIGEgUFIgcmVsaWNlbnNpbmcgdGhlIElQIGluIHRoZSBjb21p
bmcgd2VlayBvciBzby4KPj4KPj4gQ2hlZXJzLAo+PiBKdWxpdXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

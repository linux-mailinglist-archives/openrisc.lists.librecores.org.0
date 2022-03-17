Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC1B04DC276
	for <lists+openrisc@lfdr.de>; Thu, 17 Mar 2022 10:17:09 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9AC43247D7;
	Thu, 17 Mar 2022 10:17:09 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by mail.librecores.org (Postfix) with ESMTPS id F3D8F247C4
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 10:17:07 +0100 (CET)
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhDIw-1nys8f27tq-00eNue for <openrisc@lists.librecores.org>; Thu, 17 Mar
 2022 10:17:07 +0100
Received: by mail-wr1-f46.google.com with SMTP id u16so5410501wru.4
 for <openrisc@lists.librecores.org>; Thu, 17 Mar 2022 02:17:07 -0700 (PDT)
X-Gm-Message-State: AOAM532mIUIdLe65L25pVJ9EIrRMXtuAu3MXCwysEXLhobz89fEtx8LR
 JG7yR6YN5BTOIUoHUwYxQ6Vu9PpD8FfddJSdLu0=
X-Google-Smtp-Source: ABdhPJzHxRGEWXDlBot3JUsd9DgwDJ6ivxcLghivZobZjz3wwreUXbJML8BPLrLgeRbd4dSRRrBLY4hc87aaQUXL1EU=
X-Received: by 2002:a05:6000:1e0d:b0:203:e950:7b74 with SMTP id
 bj13-20020a0560001e0d00b00203e9507b74mr1946333wrb.219.1647508627012; Thu, 17
 Mar 2022 02:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Mar 2022 10:16:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0J3ViDWserQew2wt95Hnu6AHT5gmSxtUz0x5W2fWdxBA@mail.gmail.com>
Message-ID: <CAK8P3a0J3ViDWserQew2wt95Hnu6AHT5gmSxtUz0x5W2fWdxBA@mail.gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
X-Provags-ID: V03:K1:b8h8Hxnna84iycH+b74WlZSvsdey/7RgeGZJHY56jphrWLt27VS
 Zn9vV2ymUxme1ihGor4aySWcr0tWnVAjzDIyvUnV9quSeBz8HCg06onafSQFxusyfbO4/2A
 asm8HWp6oT41C89upn2N3cyVOjxpsHa34awMVS1cbjIIxHqLTVRVl/7uLEveKjJJtilqASi
 LsafGiG1kawxeZvZZBV5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bYz4yuFTzcU=:tLlzmNCtMhM355AMGHKdYd
 KR88wguvR5neRdnRtj8VS9JoVlzteB5HwHCS41erCWerGgIYtm6sbrjhNRlQYPGDxanQ7ZPJU
 H8U8DhTwdSCQO/jKgOjHnVd/Zabf0Vn2RqeCi8PAu/XMOCBMr+ofiH3FI+fjIWzTWC6IMBF59
 WcWAGUxGXgtNbMeWG/PSq3fen3F0HwXKLBoiELZrrdwRFNhYvOOaoaJy0VdrfAzsPkYKFcFBs
 JudD95oTq0Q1UA86smQDJVD3szUpZAbJurBsdPDXZSlQzG7DB+U2mkb3+KAJrEp07j1ZqoEKW
 JgwRh023m61vHFsdRItUseB3fYoGLw2+GZuv6FAUIJ2HWFj3vqLH6OgSvPYbj+IwTYAtg3ct7
 +SWmjnBdx6cuUY9pCMghgwpNXd8McM/6JsgRrML8xPQ61O9tzmfIgtKgLpQy/5zhtkQHQevxv
 chTp2nUB9ORQBNOH8rhMCY/2VBNtEzCEPnOep9Ir0MiACmdoZLXD8nHCq+CKlZgAMOa299mOi
 KkeLCOrnFM2cwOjCV5JAdrz4odQs1VQ3e5fRajNoIevKRc0rA48Uk5he7QOkTSJ0HV2832CZC
 nZAgvzqEIRi2iZKfSYuW8ZYfMYrGBJchQf3CkLkMM3oWZDrtO0KNssoJCxRPZqh0ezqS6G3By
 V2XzuY8TJ1I1/bXFbaOG6BjKpTvC4mF0NOXlpnBVXul//9rhpXcFfstrEvHyuNwl6eHKtGVN5
 Qpvu5HIs17DhqX5Ivqe4fqFqIwOwTlUopzaNrQjWqHXnIZuvdk3beNGmrTjaBBswYJ0OqJSch
 XMTt6Akr9WxGhvVmpW9hJ7ltA1XgGuU8jVYYRgvWQbigVK6tEw=
Subject: Re: [OpenRISC] [PATCH 0/5] Generic Ticket Spinlocks
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-arch <linux-arch@vger.kernel.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Waiman Long <longman@redhat.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMTI6MjUgQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBy
aXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gUGV0ZXIgc2VudCBhbiBSRkMgb3V0IGFib3V0IGEgeWVh
ciBhZ28KPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramozQGhp
cmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPiwKPiBidXQgYWZ0ZXIgYSBzcGlyaXRlZCBk
aXNjdXNzaW9uIGl0IGxvb2tzIGxpa2Ugd2UgbG9zdCB0cmFjayBvZiB0aGluZ3MuCj4gSUlSQyB0
aGVyZSB3YXMgYnJvYWQgY29uc2Vuc3VzIG9uIHRoaXMgYmVpbmcgdGhlIHdheSB0byBnbywgYnV0
IHRoZXJlCj4gd2FzIGEgbG90IG9mIGRpc2N1c3Npb24gc28gSSB3YXNuJ3Qgc3VyZS4gIEdpdmVu
IHRoYXQgaXQncyBiZWVuIGEgeWVhciwKPiBJIGZpZ3VyZWQgaXQnZCBiZSBiZXN0IHRvIGp1c3Qg
c2VuZCB0aGlzIG91dCBhZ2FpbiBmb3JtYXR0ZWQgYSBiaXQgbW9yZQo+IGV4cGxpY2l0bHkgYXMg
YSBwYXRjaC4KPgo+IFRoaXMgaGFzIGhhZCBhbG1vc3Qgbm8gdGVzdGluZyAoanVzdCBhIGJ1aWxk
IHRlc3Qgb24gUklTQy1WIGRlZmNvbmZpZyksCj4gYnV0IEkgd2FudGVkIHRvIHNlbmQgaXQgb3V0
IGxhcmdlbHkgYXMtaXMgYmVjYXVzZSBJIGRpZG4ndCBoYXZlIGEgU09CCj4gZnJvbSBQZXRlciBv
biB0aGUgY29kZS4gIEkgaGFkIHNlbnQgYXJvdW5kIHNvbWV0aGluZyBzb3J0IG9mIHNpbWlsYXIg
aW4KPiBzcGlyaXQsIGJ1dCB0aGlzIGxvb2tzIGNvbXBsZXRlbHkgcmUtd3JpdHRlbi4gIEp1c3Qg
dG8gcGxheSBpdCBzYWZlIEkKPiB3YW50ZWQgdG8gc2VuZCBvdXQgYWxtb3N0IGV4YWN0bHkgYXMg
aXQgd2FzIHBvc3RlZC4gIEknZCBwcm9iYWJseSByZW5hbWUKPiB0aGlzIHRzcGlubG9jayBhbmQg
dHNwaW5sb2NrX3R5cGVzLCBhcyB0aGUgbWlzLW1hdGNoIGtpbmQgb2YgbWFrZXMgbXkKPiBleWVz
IGdvIGZ1bm55LCBidXQgSSBkb24ndCByZWFsbHkgY2FyZSB0aGF0IG11Y2guICBJJ2xsIGFsc28g
Z28gdGhyb3VnaAo+IHRoZSBvdGhlciBwb3J0cyBhbmQgc2VlIGlmIHRoZXJlJ3MgYW55IG1vcmUg
Y2FuZGlkYXRlcywgSSBzZWVtIHRvCj4gcmVtZW1iZXIgdGhlcmUgaGF2aW5nIGJlZW4gbW9yZSB0
aGFuIGp1c3QgT3BlblJJU0MgYnV0IGl0J3MgYmVlbiBhCj4gd2hpbGUuCj4KPiBJJ20gaW4gbm8g
YmlnIHJ1c2ggZm9yIHRoaXMgYW5kIGdpdmVuIHRoZSBjb21wbGV4IEhXIGRlcGVuZGVuY2llcyBJ
Cj4gdGhpbmsgaXQncyBiZXN0IHRvIHRhcmdldCBpdCBmb3IgNS4xOSwgdGhhdCdkIGdpdmUgdXMg
YSBmdWxsIG1lcmdlCj4gd2luZG93IGZvciBmb2xrcyB0byB0ZXN0L2JlbmNobWFyayBpdCBvbiB0
aGVpciBzeXN0ZW1zIHRvIG1ha2Ugc3VyZSBpdCdzCj4gT0suICBSSVNDLVYgaGFzIGEgZm9yd2Fy
ZCBwcm9ncmVzcyBndWFyYW50ZWUgc28gd2Ugc2hvdWxkIGJlIHNhZmUsIGJ1dAo+IHRoZXNlIGNh
biBhbHdheXMgdHJpcCB0aGluZ3MgdXAuCgpUaGlzIGFsbCBsb29rcyBnb29kIHRvIG1lLCBmZWVs
IGZyZWUgdG8gbWVyZ2UgdGhlIGFzbS1nZW5lcmljCmJpdHMgdGhyb3VnaCB0aGUgcmlzY3YgdHJl
ZS4KClJlZ2FyZGluZyB0aGUgbmFtaW5nLCBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGp1c3Qg
dXNlCnRoaXMgdmVyc2lvbiBpbiBwbGFjZSBvZiB0aGUgKGN1cnJlbnRseSB1c2VsZXNzKSBhc20t
Z2VuZXJpYy9zcGlubG9jay5oLAphbmQganVzdCBuYW1pbmcgaXQgYXJjaF9zcGluX2xvY2soKSBl
dGMuCgpUaGlzIHdheSwgY29udmVydGluZyBhbiBhcmNoaXRlY3R1cmUgdG8gdGhlIGdlbmVyaWMg
dGlja2V0IGxvY2sgY2FuCmJlIGRvbmUgc2ltcGx5IGJ5IHJlbW92aW5nIGl0cyBjdXN0b20gYXNt
L3NwaW5sb2NrLmguIE9yIGl0CmNvdWxkIHN0YXkgd2l0aCB0aGUgY3VycmVudCBuYW1lLCBidXQg
dGhlbiBoYXZlIGEgbmV3CmFzbS1nZW5lcmljL3NwaW5sb2NrLmggdGhhdCBqdXN0IGluY2x1ZGVz
IGJvdGggYXNtL3RpY2tldF9sb2NrLmgKYW5kIGFzbS9xcndsb2NrLmguCgogICAgICBBcm5kCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

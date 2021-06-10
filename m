Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1A24D3A33EE
	for <lists+openrisc@lfdr.de>; Thu, 10 Jun 2021 21:24:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C277621016;
	Thu, 10 Jun 2021 21:24:03 +0200 (CEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id 8B9AE2056D
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 21:24:01 +0200 (CEST)
Received: by mail-pf1-f173.google.com with SMTP id p13so2475697pfw.0
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 12:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E8oyLkSLkVnLi+uA1dwoZ78qR6i0NJlSvANJmmXPQFs=;
 b=a6aZ7ohPXfrUv/R23M4CxxlOjbcdWzWPtAxnYSIvBxFdNlw9SbCFfqH6jJHRWa22YE
 LruvELd+nMxu7/dRYUBXOnYJIxz7qLgfdljxWuBWrbc0tUkuqPJ7m2qIDFCNWPc7rXWc
 xN+YPvexFLZq6n99pq9JoekOM7v5PKYS4AHFYonB9C/WsRrPFMpoPEic7z98JGKeU1iG
 8N36NRrXwdKdoM12pNdYPXtcAq3nI7DTL/fHZ2S5nu0xaxAMnvnuPJJkNhxc5EYYoEAr
 W94VcVOAj7Kor1FKH4d/4hODXzFgXG6fQCgRc/TwjEE/JO0KGVVJg+aRWrtgtl7qJVMh
 RcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E8oyLkSLkVnLi+uA1dwoZ78qR6i0NJlSvANJmmXPQFs=;
 b=TyiUxtGkGiISolS0codMB6uMwsL2KjeVyzMHhZGLB9vxRe8cJI9wrIUrIf8U3TnF6C
 NyJ4O8322NjBOrHVaWidZjEjRBwbWCHxxomUs62YQSasx/E3qa/3x3g52rZfb7Iu0KyQ
 cQJ9kWS68izGBi1Q7AjNnKXKKdqqjTMGzXBNUULF33rWNLlYLgCbtH9AtkB/pt7WVcz1
 Hvt2nfWzoOB0oFu0DNcUdxNyAbtNgX+0jU89FLKZInln43fdeH+vJf4P/rZ/szj6Xn1p
 gA5aZNwE4kDfxKLzOb+0rq1RoKdBTdWMD2XQybXsw2p6/AxV8yAEdGUORLxUO7D8+TG9
 8U/Q==
X-Gm-Message-State: AOAM532NsDILB3g3gnGlVnTo9/mx9FGklTubmcqVVpF9CgY8p5s+QF83
 VdABNYQku8UXb1BtxF23UTE=
X-Google-Smtp-Source: ABdhPJx4o7AkR0LqtgWPatoWF3AdJKYz3VH+W8fldk5HfckjMgcuNzIKNmGCCgYRsps9dcPX3BdPOg==
X-Received: by 2002:a65:6487:: with SMTP id e7mr6374877pgv.27.1623353039641;
 Thu, 10 Jun 2021 12:23:59 -0700 (PDT)
Received: from localhost (g151.115-65-219.ppp.wakwak.ne.jp. [115.65.219.151])
 by smtp.gmail.com with ESMTPSA id
 c21sm3064277pfi.44.2021.06.10.12.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 12:23:58 -0700 (PDT)
Date: Fri, 11 Jun 2021 04:23:55 +0900
From: Stafford Horne <shorne@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YMJmywxwS/HY7Xbl@antec>
References: <YME2SzQdpj/AVz/2@antec>
 <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
 <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
 <3ef9acac-9f1a-2aab-1c9e-a0d4aaae6ccd@benettiengineering.com>
 <YMIOVK3h+AooX4DR@bubble.grove.modra.org>
 <b84656ba-bbae-b5ea-c61f-08230b324102@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b84656ba-bbae-b5ea-c61f-08230b324102@benettiengineering.com>
Subject: Re: [OpenRISC] [PATCH v2] bfd/elf32-or1k: fix building with gcc
 version < 5
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
 GNU Binutils <binutils@sourceware.org>, Alan Modra <amodra@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBKdW4gMTAsIDIwMjEgYXQgMDQ6NDg6NDZQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gSGVsbG8gQWxhbiwgQWxsLAo+IAo+IE9uIDYvMTAvMjEgMzowNiBQTSwgQWxhbiBN
b2RyYSB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDEwLCAyMDIxIGF0IDExOjA3OjEzQU0gKzAyMDAs
IEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+ID4gPiBIZWxsbyBBbGFuLCBBbGwsCj4gPiA+IAo+ID4g
PiBPbiA2LzEwLzIxIDM6MTkgQU0sIEFsYW4gTW9kcmEgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBK
dW4gMDksIDIwMjEgYXQgMTE6NTI6MzNQTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4g
PiA+ID4gPiBHY2MgdmVyc2lvbiA+PSA1IGhhcyBzdGFuZGFyZCBDIG1vZGUgbm90IHNldCB0byAt
c3RkPWdudTExLCBzbyBpZiB3ZSB1c2UKPiA+ID4gPiA+IGFuIG9sZCBjb21waWxlcihpLmUuIGdj
YyA0LjkpIGJ1aWxkIGZhaWxzIG9uOgo+ID4gPiA+ID4gYGBgCj4gPiA+ID4gPiBlbGYzMi1vcjFr
LmM6MjI1MTozOiBlcnJvcjogJ2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBhcmUgb25s
eSBhbGxvd2VkIGluCj4gPiA+ID4gPiBDOTkgb3IgQzExIG1vZGUKPiA+ID4gPiA+ICAgICAgIGZv
ciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsgaSsrKQo+ID4gPiA+ID4gICAgICAgXgo+
ID4gPiA+ID4gYGBgCj4gPiA+ID4gCj4gPiA+ID4gRGlkIHlvdSBmaW5kIHRoaXMgcHJvYmxlbSBv
biBjdXJyZW50IG1haW5saW5lIGJpbnV0aWxzPyAgVGhlIGNvbmZpZ3VyZQo+ID4gPiA+IG1hY2hp
bmVyeSBpcyBzdXBwb3NlZCB0byBzdXBwbHkgdGhlIGFwcHJvcHJpYXRlIC1zdGQ9Yzk5IG9yIC1z
dGQ9Z251OTkKPiA+ID4gPiB3aGVuIHVzaW5nIG9sZGVyIGNvbXBpbGVycy4gIFRoYXQgaGFwcGVu
cyBmb3IgbWUgd2hlbiBJIGJ1aWxkIHdpdGgKPiA+ID4gPiBnY2MtNC45LiAgSSBkb24ndCB0aGlu
ayBhbnkgcGF0Y2ggaXMgbmVlZGVkIGZvciBtYWlubGluZS4KPiA+ID4gPiAKPiA+ID4gCj4gPiA+
IE9uIEJ1aWxkcm9vdCB0aGV5IGRvbid0IHBhc3MgLXN0ZD1jOTkvZzk5IGFuZCB0aGlzIGlzIHRo
ZSByZXN1bHQ6Cj4gPiA+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rvb2xjaGFpbnMtYnVp
bGRlci8tL2pvYnMvMTMyNTY0NjI5OAo+ID4gCj4gPiBUaGF0IGFwcGVhcnMgdG8gYmUgYnVpbGRp
bmcgYmludXRpbHMgMi4zNS4yCj4gPiAKPiA+ID4gVGhpcyBwYXRjaCBzZWVtcyB0byBmb2xsb3cg
YWxsIHRoZSByZXN0IGNvZGUgc3R5bGUgb2YgYmludXRpbHMKPiA+IAo+ID4gVHJ1ZSwgd2UndmUg
b25seSBqdXN0IHN3aXRjaGVkIG92ZXIgdG8gcmVxdWlyaW5nIEM5OS4KPiAKPiBPayBzby4uLgo+
IAo+ID4gPiBzaW5jZSBubwo+ID4gPiBvdGhlciBwYXJ0IG9mIGl0IGZhaWxzIGFuZCB0aGlzIGhh
cHBlbnMgb25seSBhZnRlciBwYXRjaCBbMV0gaGFzIGJlZW4KPiA+ID4gdXBzdHJlYW1lZC4KPiA+
ID4gCj4gPiA+IEhlcmUgWzJdIHlvdSBjYW4gc2VlIGFsbCB0aGUgb3RoZXIgdG9vbGNoYWlucyBi
dWlsdCBzdWNjZXNmdWxseSBhbmQgb25seQo+ID4gPiBPcGVucmlzYyBmYWlscyBhZnRlciB0aGUg
cGF0Y2ggcHJvdmlkZWQgYnkgU3RhZmZvcmQoWzFdKS4KPiA+ID4gCj4gPiA+IFsxXTogaHR0cDov
L3BhdGNoZXMtdGN3Zy5saW5hcm8ub3JnL3BhdGNoLzUzMTUxLwo+ID4gPiBbMl06IGh0dHBzOi8v
Z2l0bGFiLmNvbS9ib290bGluL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMKPiA+IAo+ID4gT0ss
IHNvIHRoZSByZWFsIHByb2JsZW0gaXMgaW4gYSBiYWNrcG9ydC4gIEl0IGlzbid0IGN1cnJlbnQg
bWFpbmxpbmUKPiA+IGJpbnV0aWxzIGNvbmZpZ3VyZSwgd2hpY2ggaXMgd2hhdCBJIHdhcyB3b3Jy
aWVkIGFib3V0Lgo+IAo+IC4uLml0IGhhcHBlbnMgb24gbWFpbmxpbmUgdG9vIGJ1dCBpdCBjYW4g
YmUgc29sdmVkIGJ5IGFkZGluZyAtc3RkPWM5OSB0bwo+IENGTEFHUy4KCkRvIHlvdSBoYXZlIGFu
IGV4YW1wbGUgb2YgaXQgaGFwcGVuaW5nIG9uIG1haW5saW5lPyBBY2NvcmRpbmcgdG8gQWxhbiwg
bWFpbmxpbmUKc2hvdWxkIG5vdCBoYXBwZW4gYXMgd2Ugc2hvdWxkIGJlIGFwcGx5aW5nIC1zdGQ9
Yzk5IGF1dG9tYXRpY2FsbHkuICBJZiBub3Qgd2UKY2FuIGZpeCB0aGF0LgoKPiA+IEJUVywgdGhh
bmsgeW91IGZvciBwb3N0aW5nIGEgZml4IGhlcmUsIGV2ZW4gaWYgaXQgaXNuJ3Qgc3RyaWN0bHkK
PiA+IG5lY2Vzc2FyeSBmb3IgbWFpbmxpbmUuICBQbGVhc2Ugbm90ZSB0aGF0IEknbSBub3QgYWR2
b2NhdGluZyBhZ2FpbnN0Cj4gPiB5b3VyIHBhdGNoLiAgSWYgdGFyZ2V0IG1haW50YWluZXJzIHdh
bnQgdG8ga2VlcCB0aGVpciBjb2RlIGNvbXBhdGlibGUKPiA+IHdpdGggQzg5IHRoYXQncyBmaW5l
IGJ5IG1lLgo+ID4gCj4gSSBkaWRuJ3Qga25vdyBhYm91dCB0aGlzIHNpbmNlIG5vIG90aGVyIGZp
bGUgZmFpbGVkIGJ1aWxkaW5nIG9uIEM5OS4gV2hhdCBpdAo+IHNlZW1zIHN0cmFuZ2UgdG8gbWUg
aXMgdGhhdCBvbiBidWlsZHJvb3QgYmludXRpbHMgc2VlbSB0byBiZSBidWlsdCB3aXRob3V0Cj4g
LXN0ZD1jOTkKCkFzIG1haW5saW5lIGJpbnV0aWxzIGlzIHN1cHBvc2VkIHRvIHJlcXVpcmUgYzk5
IG5vdy4gIEkgcmF0aGVyIG5vdCBjaGFuZ2UgdGhlCmNvZGUgYnV0IGZpeCBhbnkgaXNzdWVzIHdp
dGggY29uZmlndXJlIG5vdCBzZXR0aW5nIGZsYWdzLgoKSSBsb29rZWQgYXQgLi9jb25maWd1cmUu
YWMgYW5kIEkgY29uZmlybSB0aGF0IHdlIGhhdmUgc2V0dXAgYzk5IGZsYWdzLiAgQnV0IEkKYWxz
byBub3RpY2UgaW4gYmZkL2NvbmZpZ3VyZS5hYyB0aGF0IHdlIGRlZmluZSBpdCBhZ2FpbiB3aXRo
b3V0IGM5OSwgYnV0IHRoYXQKc2hvdWxkIG5vdCBtYXR0ZXIgYXMgQ0Mgc2hvdWxkIGFscmVhZHkg
YmUgZGVmaW5lZC4gIEVpdGhlciB3YXkgZG9lcyB0aGUgYmVsb3cKcGF0Y2ggaGVscD8KCmRpZmYg
LS1naXQgYS9iZmQvY29uZmlndXJlLmFjIGIvYmZkL2NvbmZpZ3VyZS5hYwppbmRleCAwN2E3NWVk
MTYyNi4uMzg3Yzc0MTUyZDAgMTAwNjQ0Ci0tLSBhL2JmZC9jb25maWd1cmUuYWMKKysrIGIvYmZk
L2NvbmZpZ3VyZS5hYwpAQCAtMzQsNyArMzQsNyBAQCBkbmwgRGVmYXVsdCB0byBhIG5vbiBzaGFy
ZWQgbGlicmFyeS4gIFRoaXMgbWF5IGJlIG92ZXJyaWRkZW4KYnkgdGhlCiBkbmwgY29uZmlndXJl
IG9wdGlvbiAtLWVuYWJsZS1zaGFyZWQuCiBBQ19ESVNBQkxFX1NIQVJFRAogCi1BQ19QUk9HX0ND
CitBQ19QUk9HX0NDX0M5OQogQUNfR05VX1NPVVJDRQogQUNfVVNFX1NZU1RFTV9FWFRFTlNJT05T
CgotLQoKLVN0YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

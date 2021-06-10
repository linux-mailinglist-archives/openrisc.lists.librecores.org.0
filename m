Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE2F3A33BC
	for <lists+openrisc@lfdr.de>; Thu, 10 Jun 2021 21:11:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8D1FF213A6;
	Thu, 10 Jun 2021 21:11:37 +0200 (CEST)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mail.librecores.org (Postfix) with ESMTPS id 899B420BDE
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 15:06:34 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id t17so5974551pga.5
 for <openrisc@lists.librecores.org>; Thu, 10 Jun 2021 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QpUPo0yOhI8lDZjJFpDZ7JJa7Q2lqa5vK8godiDo+ek=;
 b=aJ6MZ5aoTkVibB6GfPwp2JJhCrvR85eExLDsJGqaE95uJ9FA7O7MfBCXg97qxKcuel
 VFbvzoFlj5McUrIBJOlsOiD2W9WCifyKVhvInyfOqCtTSBK3+1GpNChC/8gr0tsjWmDa
 nUkbVy1GQhlNcECSteaA53Y7Dt7z4u8KpTwlAFXiBRTqVsjOipA8QNCwsOqu0louvmHn
 RNm44lDrByjzjKzFcZOGNxBdB8MRfLZQ0zWMxy1GrcnDmmFvzury1BYAbQ68FiXkx/oX
 RAdJIxzgLM82MTLtx14Ec1T3GhP2ruYav7ll52x1s2Ech85GUnLwsSNZqM/Vlov0/8Dn
 kLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QpUPo0yOhI8lDZjJFpDZ7JJa7Q2lqa5vK8godiDo+ek=;
 b=aGeDsgJpDmq7HZzJXFwBic2HPSW1Ke7VXkKoKpZEeNvKD7qdPtBuFQlVQWMFg6uWtJ
 JdcsPXtd3q7pM61R1MzN+95KfgVyC+4nH6MlAyFOjYdsrb/6tBbBds8pZ/Qpelysg61I
 O4f0YubaUvP7LFZbowTDKaLp/ieaVfQSi246c2O2SCtzRPAOtqs6faBaomiwgKkwXkYQ
 6P3SpZ78zlqFiQCzxCFJWxo/UXTR/8dDHVyt0v/m2vjWaQr652a3LHhO6PnoOTbxr90w
 h+zeqxLxaoUJsLZwmt+W6RlItw8J2R9gOTtFlqnK2Q6Mij0VlavkP7icbVHc+0IWfX+Q
 Xs8A==
X-Gm-Message-State: AOAM530S+pngCoRuivAgcbbzSdt1GHqyTnxe6humRROWyAZZKaT8Sv29
 X5nRsTMs+VoAYXCOi9oLctM=
X-Google-Smtp-Source: ABdhPJwYrAgOBf2fow5uXg2Jr8YOqZxUJBsQb7EoY3bCe/7r2WLTyqG2OMruuLWD41gjGzuhWt0C6Q==
X-Received: by 2002:a63:485a:: with SMTP id x26mr4864877pgk.159.1623330392880; 
 Thu, 10 Jun 2021 06:06:32 -0700 (PDT)
Received: from bubble.grove.modra.org ([2406:3400:51d:8cc0:bbf7:2942:6a1:d38e])
 by smtp.gmail.com with ESMTPSA id f18sm2295729pfv.79.2021.06.10.06.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:06:32 -0700 (PDT)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id 6DD27BB00090; Thu, 10 Jun 2021 22:36:28 +0930 (ACST)
Date: Thu, 10 Jun 2021 22:36:28 +0930
From: Alan Modra <amodra@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YMIOVK3h+AooX4DR@bubble.grove.modra.org>
References: <YME2SzQdpj/AVz/2@antec>
 <20210609215233.1611478-1-giulio.benetti@benettiengineering.com>
 <YMFosi4vsWnxf9Sj@bubble.grove.modra.org>
 <3ef9acac-9f1a-2aab-1c9e-a0d4aaae6ccd@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ef9acac-9f1a-2aab-1c9e-a0d4aaae6ccd@benettiengineering.com>
X-Mailman-Approved-At: Thu, 10 Jun 2021 21:11:34 +0200
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
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBKdW4gMTAsIDIwMjEgYXQgMTE6MDc6MTNBTSArMDIwMCwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gSGVsbG8gQWxhbiwgQWxsLAo+IAo+IE9uIDYvMTAvMjEgMzoxOSBBTSwgQWxhbiBN
b2RyYSB3cm90ZToKPiA+IE9uIFdlZCwgSnVuIDA5LCAyMDIxIGF0IDExOjUyOjMzUE0gKzAyMDAs
IEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+ID4gPiBHY2MgdmVyc2lvbiA+PSA1IGhhcyBzdGFuZGFy
ZCBDIG1vZGUgbm90IHNldCB0byAtc3RkPWdudTExLCBzbyBpZiB3ZSB1c2UKPiA+ID4gYW4gb2xk
IGNvbXBpbGVyKGkuZS4gZ2NjIDQuOSkgYnVpbGQgZmFpbHMgb246Cj4gPiA+IGBgYAo+ID4gPiBl
bGYzMi1vcjFrLmM6MjI1MTozOiBlcnJvcjogJ2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9u
cyBhcmUgb25seSBhbGxvd2VkIGluCj4gPiA+IEM5OSBvciBDMTEgbW9kZQo+ID4gPiAgICAgIGZv
ciAoc2l6ZV90IGkgPSAwOyBpIDwgaW5zbl9jb3VudDsgaSsrKQo+ID4gPiAgICAgIF4KPiA+ID4g
YGBgCj4gPiAKPiA+IERpZCB5b3UgZmluZCB0aGlzIHByb2JsZW0gb24gY3VycmVudCBtYWlubGlu
ZSBiaW51dGlscz8gIFRoZSBjb25maWd1cmUKPiA+IG1hY2hpbmVyeSBpcyBzdXBwb3NlZCB0byBz
dXBwbHkgdGhlIGFwcHJvcHJpYXRlIC1zdGQ9Yzk5IG9yIC1zdGQ9Z251OTkKPiA+IHdoZW4gdXNp
bmcgb2xkZXIgY29tcGlsZXJzLiAgVGhhdCBoYXBwZW5zIGZvciBtZSB3aGVuIEkgYnVpbGQgd2l0
aAo+ID4gZ2NjLTQuOS4gIEkgZG9uJ3QgdGhpbmsgYW55IHBhdGNoIGlzIG5lZWRlZCBmb3IgbWFp
bmxpbmUuCj4gPiAKPiAKPiBPbiBCdWlsZHJvb3QgdGhleSBkb24ndCBwYXNzIC1zdGQ9Yzk5L2c5
OSBhbmQgdGhpcyBpcyB0aGUgcmVzdWx0Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9ib290bGluL3Rv
b2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMTMyNTY0NjI5OAoKVGhhdCBhcHBlYXJzIHRvIGJlIGJ1
aWxkaW5nIGJpbnV0aWxzIDIuMzUuMgoKPiBUaGlzIHBhdGNoIHNlZW1zIHRvIGZvbGxvdyBhbGwg
dGhlIHJlc3QgY29kZSBzdHlsZSBvZiBiaW51dGlscwoKVHJ1ZSwgd2UndmUgb25seSBqdXN0IHN3
aXRjaGVkIG92ZXIgdG8gcmVxdWlyaW5nIEM5OS4KCj4gc2luY2Ugbm8KPiBvdGhlciBwYXJ0IG9m
IGl0IGZhaWxzIGFuZCB0aGlzIGhhcHBlbnMgb25seSBhZnRlciBwYXRjaCBbMV0gaGFzIGJlZW4K
PiB1cHN0cmVhbWVkLgo+IAo+IEhlcmUgWzJdIHlvdSBjYW4gc2VlIGFsbCB0aGUgb3RoZXIgdG9v
bGNoYWlucyBidWlsdCBzdWNjZXNmdWxseSBhbmQgb25seQo+IE9wZW5yaXNjIGZhaWxzIGFmdGVy
IHRoZSBwYXRjaCBwcm92aWRlZCBieSBTdGFmZm9yZChbMV0pLgo+IAo+IFsxXTogaHR0cDovL3Bh
dGNoZXMtdGN3Zy5saW5hcm8ub3JnL3BhdGNoLzUzMTUxLwo+IFsyXTogaHR0cHM6Ly9naXRsYWIu
Y29tL2Jvb3RsaW4vdG9vbGNoYWlucy1idWlsZGVyLy0vam9icwoKT0ssIHNvIHRoZSByZWFsIHBy
b2JsZW0gaXMgaW4gYSBiYWNrcG9ydC4gIEl0IGlzbid0IGN1cnJlbnQgbWFpbmxpbmUKYmludXRp
bHMgY29uZmlndXJlLCB3aGljaCBpcyB3aGF0IEkgd2FzIHdvcnJpZWQgYWJvdXQuCgpCVFcsIHRo
YW5rIHlvdSBmb3IgcG9zdGluZyBhIGZpeCBoZXJlLCBldmVuIGlmIGl0IGlzbid0IHN0cmljdGx5
Cm5lY2Vzc2FyeSBmb3IgbWFpbmxpbmUuICBQbGVhc2Ugbm90ZSB0aGF0IEknbSBub3QgYWR2b2Nh
dGluZyBhZ2FpbnN0CnlvdXIgcGF0Y2guICBJZiB0YXJnZXQgbWFpbnRhaW5lcnMgd2FudCB0byBr
ZWVwIHRoZWlyIGNvZGUgY29tcGF0aWJsZQp3aXRoIEM4OSB0aGF0J3MgZmluZSBieSBtZS4KCi0t
IApBbGFuIE1vZHJhCkF1c3RyYWxpYSBEZXZlbG9wbWVudCBMYWIsIElCTQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

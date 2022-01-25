Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC47349B9A5
	for <lists+openrisc@lfdr.de>; Tue, 25 Jan 2022 18:07:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8176624764;
	Tue, 25 Jan 2022 18:07:37 +0100 (CET)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mail.librecores.org (Postfix) with ESMTPS id 61D4924256
 for <openrisc@lists.librecores.org>; Tue, 25 Jan 2022 18:07:36 +0100 (CET)
Received: by mail-oi1-f175.google.com with SMTP id q186so32242384oih.8
 for <openrisc@lists.librecores.org>; Tue, 25 Jan 2022 09:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HKaqfCPTNYcHT/RiwbsAV17D8JCm78x24Uk7XgQFX8E=;
 b=f+BVjf8u6YKIP5cBrNhMmaENSZCgXFaqBbi5aVnY/St+CwxF4hnIz+ysIBu1Tul2US
 QW3WLXr79Q/s19SE6PfC+vuq17yCnx1cdPOY37cz7IvUIXxZXiKysDEWjpvb2Qd2XJMd
 K638UTeDYmIf11+xOj6KHsrOeQ3cRht6wyATToQbw8y5hgj2lYVsVfd8Bex88JB+i+Wr
 1eoKF+qb3+BghYZDulY4iT25R4CZu1TqjlVfGq1TrfNMd77WRefT5PIdWR5JF3VKia2N
 Xu25sQrEu2n2IxLF5OI6QcuUiw6zcvA1bnQyXas5OHVqexvB2LGGMOxDfTb01LUs4adG
 j8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKaqfCPTNYcHT/RiwbsAV17D8JCm78x24Uk7XgQFX8E=;
 b=hHjXs4TK/ModrfSrhh8eaoNJhpnxgX3HNXwSGwndkVwjuWA+9WyZEkCm79oVl1zCgk
 7K7/H0SvQF08o3lsBtLQw7ouwAXpCBZnHdmc1aNxHaXnPPaK4QK4xS6b8k1y283I52vt
 1bX+e0gS2lcUVcJqlGlz93kvbLtJcaJ0mKgo9wzG3VcC2oiHFiuTBHgtT/QHiaxJDpZc
 SvyPsft9EHzf4SwasfTwWf+PukHDBFfnjnV9whbqKLlUy7zNOg/7qw2nfMU5BpZwFtFE
 QDPhYnsOI7/M+9cGUp1YIDdLzxxOTJT8nUygQQ/0A9FUCrKLi1MAdGZBHIhiQqntw18H
 Mnow==
X-Gm-Message-State: AOAM53232mDMWnW2hKyz5B/TrWIxGnKRmm3AmmhYeQW/yfyjlWdupMCe
 lH9LwPfHmoodmoWyORWAd+Rjew==
X-Google-Smtp-Source: ABdhPJweb6mB+RGerCd6Pm6zMmYPlBUnorJRqynJJ7yTzQfbl9aVJQhEF+g7nPY7yF1Pe2v12AY7jQ==
X-Received: by 2002:a05:6808:2012:: with SMTP id
 q18mr1172166oiw.246.1643130455134; 
 Tue, 25 Jan 2022 09:07:35 -0800 (PST)
Received: from ?IPV6:2804:431:c7cb:27f8:5bed:1499:268c:5587?
 ([2804:431:c7cb:27f8:5bed:1499:268c:5587])
 by smtp.gmail.com with ESMTPSA id n4sm3331180otr.76.2022.01.25.09.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 09:07:34 -0800 (PST)
Message-ID: <121ae1cd-87c5-399f-8a1e-f9d2e4618be0@linaro.org>
Date: Tue, 25 Jan 2022 14:07:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
 <87tudt2rpg.fsf@oldenburg.str.redhat.com>
 <d3bbc7eb-348f-872c-32ef-fcff7d2f4153@linaro.org> <Ye9QLX3znGzPdDDF@antec>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <Ye9QLX3znGzPdDDF@antec>
Subject: Re: [OpenRISC] [PATCH v5 00/13] Glibc OpenRISC port
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
Cc: Florian Weimer <fweimer@redhat.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GLIBC patches <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyNC8wMS8yMDIyIDIyOjE5LCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBNb24sIEph
biAyNCwgMjAyMiBhdCAxMDo1NDo1OEFNIC0wMzAwLCBBZGhlbWVydmFsIFphbmVsbGEgd3JvdGU6
Cj4+Cj4+Cj4+IE9uIDI0LzAxLzIwMjIgMTA6MjMsIEZsb3JpYW4gV2VpbWVyIHZpYSBMaWJjLWFs
cGhhIHdyb3RlOgo+Pj4gKiBTdGFmZm9yZCBIb3JuZToKPj4+Cj4+Pj4gVGhpcyBpcyB0aGUgT3Bl
blJJU0MgcG9ydCBmb3IgZ2xpYmMgdGhhdCBJIGhhdmUgYmVlbiB3b3JraW5nIG9uLgo+Pj4KPj4+
IFRoZSBwb3J0IGRvZXMgbm90IGRlZmluZSBQSV9TVEFUSUNfQU5EX0hJRERFTi4gIElzIHRoaXMg
cmVhbGx5Cj4+PiBuZWNlc3NhcnksIG9yIGp1c3QgYW4gb3ZlcnNpZ2h0IGR1ZSB0byB0aGUgd2F5
IHRoZSBwb3J0IHdhcyBjb25zdHJ1Y3RlZAo+Pj4gKHByZXN1bWFibHkgd2l0aCBNSVBTIGFzIHRo
ZSB0ZW1wbGF0ZSk/Cj4+Pgo+Pj4gUElfU1RBVElDX0FORF9ISURERU4gbWVhbnMgdGhhdCByZWZl
cmVuY2VzIHRvIHN0YXRpYyBmdW5jdGlvbnMgYW5kIGRhdGEKPj4+IGFuZCBzeW1ib2xzIHdpdGgg
aGlkZGVuIHZpc2liaWxpdHkgZG8gbm90IG5lZWQgYW55IHJ1bi10aW1lIHJlbG9jYXRpb25zCj4+
PiBhZnRlciB0aGUgZmluYWwgbGluaywgd2l0aCB0aGUgYnVpbGQgZmxhZ3MgdXNlZCBieSBnbGli
Yy4KPj4KPj4gQXQgbGVhc3QgdGhlIGxvYWRlciB3aXRoIGEgc2ltcGxlIGhlbGxvIHdvcmxkIGRv
ZXMgbm90IGZhaWwgd2l0aCBxZW11IHdpdGggCj4+IFBJX1NUQVRJQ19BTkRfSElEREVOIHNldC4K
Pj4KPj4gU3RhZmZvcmssIGNvdWxkIHlvdSBjb25maXJtIGl0IGlzIG9rIHRvIG1ha2Ugb3IxayB1
c2UgUElfU1RBVElDX0FORF9ISURERU4/Cj4gCj4gWWVzLCB0aGlzIHdhcyBqdXN0IGFuIG92ZXJz
aWdodCBhbmQgaXQgZGlkbid0IHNob3cgdXAgZHVyaW5nIHRlc3RpbmcuIEkgdGhpbmsKPiB0aGlz
IGlzIE9LIGFzIGRlc2NyaWJlZCBvcjFrIGRvZXMgbm90IG5lZWQgcnVudGltZSByZWxvY2F0aW9u
cyBmb3IgaGlkZGVuCj4gc3ltYm9scyBhZnRlciB0aGUgZmluYWwgbGluay4KPiAKPiBTaGFsbCBJ
IG1ha2UgdGhlIHBhdGNoIHRvIGFkZCBjb25maWd1cmUuYWM/ICBPciBkbyB5b3UgaGF2ZSB0aGF0
IHJlYWR5IHRvIGdvCj4gYWxyZWFkeT8KCkkgd291bGQgdGVzdGVkIGJyaWVmbHkgd2l0aCBxZW11
LXN5c3RlbSwgSSB3aWxsIHNlbmQgYSBwYXRjaCBzbyB5b3UgY2FuCnJldmlldy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

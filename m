Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86224484173
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 13:05:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 21B9024312;
	Tue,  4 Jan 2022 13:05:34 +0100 (CET)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mail.librecores.org (Postfix) with ESMTPS id 35C8924105
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 13:05:32 +0100 (CET)
Received: by mail-qv1-f43.google.com with SMTP id kk22so34101641qvb.0
 for <openrisc@lists.librecores.org>; Tue, 04 Jan 2022 04:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+8ZoqZWpIuRaDPdpQlKEgM459LwDbzHlHajsirvytOo=;
 b=anGn9R3Zx+y7PSgwYcOXx1d0VNW9z5+tsXWgu0iD1MN2FmguioyoM7obH2ilNKn4H5
 mh+MAD9lOZTL6xqc+du2WQAgitSjexOjYJhorHZcU/P14KOcl2rS97dxahVLFdG9Cdkr
 TRTpMvipefd+xdxuEoV9QJsdqHEU1gKS/zlcKytJ3wLUYDwqHwH85cHjvzxwhZHm2oi4
 EYRA3qSaPc5tDEbFmP2hc3eqwW3daUzpE1BaPHd3ZNwU6XER34ZhHEBN0UGgrkEyVN/Y
 bPj1f+Yrro2x6dfJ8ubbb6FV/9sejN5kRKEy8ab476YVz1UuyfBcgi4OB/21OHOUhoOh
 6IPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+8ZoqZWpIuRaDPdpQlKEgM459LwDbzHlHajsirvytOo=;
 b=4KbVJHhddW1fx6+LqFz+GrSyLMDcGm6N55pQkbBFnItPn9it8ng84TXz/6pPpwPfZB
 W6UWFwLWL8i7beDOzCfwD7uvEscKNUtOqyCW27EOHt4Cd9ZJO1V2LJnv5D5arMj2vio0
 A8f5MADJUlf7vk9pqQyc8gsT37tgaoUMbSsHlhLHIldsU70mwQkLBc95k9GGmaQTkQNy
 LS7LwrtUMUvvP4azVj9gF4seGEXi1hdg8KgrkiYY8DmX635yhbBxgT8Gu4pfHw/CKoQg
 8JyhG0i+G+eHzhPsUliF3eFSGE9RueUrCJBRzT/ZVoYIuzEzSF815Q8jBNVHoeSJKwlS
 Ln6g==
X-Gm-Message-State: AOAM530bm5r/mwKDxHhL1lRGy2giDci66E2CYhUlGoFimMMbLZ8lu0UX
 3Hm1zvjliZztXaXm7Acp3zhomQ==
X-Google-Smtp-Source: ABdhPJw+oKVNThKibXkvU3dhVBfw+X+8Zg3rRI27rb6Jx8R4imtOzKQP1YZZl2ylTOI79dQixJu/rA==
X-Received: by 2002:a05:6214:2b0c:: with SMTP id
 jx12mr23060032qvb.84.1641297930925; 
 Tue, 04 Jan 2022 04:05:30 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:a350:1960:9a87:fba4:a664?
 ([2804:431:c7ca:a350:1960:9a87:fba4:a664])
 by smtp.gmail.com with ESMTPSA id bs16sm31597180qkb.45.2022.01.04.04.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 04:05:30 -0800 (PST)
Message-ID: <d3679ca1-8632-1b15-e54e-4c42fddae5dd@linaro.org>
Date: Tue, 4 Jan 2022 09:05:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-5-shorne@gmail.com>
 <152802e5-0bac-e450-3898-016fc00bdd4f@linaro.org> <YdOir8IbYTzs/Opy@antec>
 <YdO6GmOcafGR1t9Z@antec>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <YdO6GmOcafGR1t9Z@antec>
Subject: Re: [OpenRISC] [PATCH v4 04/13] or1k: startup and dynamic linking
 code
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

CgpPbiAwNC8wMS8yMDIyIDAwOjA4LCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBUdWUsIEph
biAwNCwgMjAyMiBhdCAxMDoyODoxNUFNICswOTAwLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPj4g
T24gTW9uLCBKYW4gMDMsIDIwMjIgYXQgMDM6MTc6MTVQTSAtMDMwMCwgQWRoZW1lcnZhbCBaYW5l
bGxhIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAyOS8xMi8yMDIxIDAxOjQyLCBTdGFmZm9yZCBIb3Ju
ZSB2aWEgTGliYy1hbHBoYSB3cm90ZToKPj4+PiArLyogUmV0dXJuIG5vbnplcm8gaWZmIEVMRiBo
ZWFkZXIgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBydW5uaW5nIGhvc3QuICAqLwo+Pj4+ICtzdGF0
aWMgaW5saW5lIGludCBfX2F0dHJpYnV0ZV9fICgodW51c2VkKSkKPj4+PiArZWxmX21hY2hpbmVf
bWF0Y2hlc19ob3N0IChjb25zdCBFbGYzMl9FaGRyICplaGRyKQo+Pj4+ICt7Cj4+Pj4gKyAgcmV0
dXJuIGVoZHItPmVfbWFjaGluZSA9PSBFTV9PUEVOUklTQzsKPj4+PiArfQo+Pj4+ICsKPj4+PiAr
c3RhdGljIGlubGluZSBFbGYzMl9BZGRyICoKPj4+PiArb3Ixa19nZXRfZ290ICh2b2lkKQo+Pj4+
ICt7Cj4+Pj4gKyAgRWxmMzJfQWRkciAqZ290Owo+Pj4+ICsKPj4+PiArICBhc20gKCJsLmphbCAg
ICAweDhcbiIKPj4+PiArICAgICAgICIgbC5tb3ZoaSAlMCwgZ290cGNoaShfR0xPQkFMX09GRlNF
VF9UQUJMRV8tNClcbiIKPj4+PiArICAgICAgICJsLm9yaSAgICAlMCwgJTAsIGdvdHBjbG8oX0dM
T0JBTF9PRkZTRVRfVEFCTEVfKzApXG4iCj4+Pj4gKyAgICAgICAibC5hZGQgICAgJTAsICUwLCBy
OVxuIgo+Pj4+ICsgICAgICAgOiAiPXIiIChnb3QpIDogOiAicjkiKTsKPj4+Cj4+Pgo+Pj4gSSB0
aGluayB0aGlzIHJlcXVpcmVzIGEgIm1lbW9yeSIgY2xvYmJlci4KPj4KPj4gV2h5IHdvdWxkIGl0
PyAgVGhpcyBkb2VzIG5vdCBkbyBhbnkgbWVtb3J5IGxvYWRzIG9yIHN0b3Jlcy4KPj4KPj4gTGV0
IG1lIHRlc3Qgd2l0aCAibWVtb3J5IiBjbG9iYmVyIGFuZCBzZWUgd2hhdCB0aGUgZGlmZmVyZW5j
ZSBpcy4KPiAKPiBJZiBzZWVtIHRoYXQgd2l0aCB0aGUgIm1lbW9yeSIgY2xvYmJlciB0aGUgY29t
cGlsZXIgY2FuIG5vIGxvbmdlciBvcHRpbWl6ZSBhd2F5Cj4gY2FsbGluZyBvcjFrX2dldF9nb3Qg
dGhlIHNlY29uZCB0aW1lIGluIGVsZl9tYWNoaW5lX2xvYWRfYWRkcmVzcy4KPiAKPiBJIHdpbGwg
bGVhdmUgaXQgb3V0IHVubGVzcyB0aGVyZSBpcyBhIGdvb2QgcmVhc29uIGZvciBpdC4KCkZhaXIg
ZW5vdWdoLCBJIGhhZCB0aGUgaW1wcmVzc2lvbiBpdCBkb2VzIGFjY2VzcyBtZW1vcnkgYnV0IGl0
IHNlZW1zIGl0Cmp1c3QgbXkgbGFjayBvZiBvcjFrIGFzc2VtYmx5IGtub3dsZWRnZS4gU29ycnkg
Zm9yIHRoZSBub2lzZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

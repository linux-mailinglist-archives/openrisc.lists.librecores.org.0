Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DAE30517B14
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 01:59:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 89C41248F2;
	Tue,  3 May 2022 01:59:52 +0200 (CEST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mail.librecores.org (Postfix) with ESMTPS id 55397248ED
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 01:59:51 +0200 (CEST)
Received: by mail-pj1-f45.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so724301pjf.0
 for <openrisc@lists.librecores.org>; Mon, 02 May 2022 16:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=/6N++rATlhaiduQ5L4IVlX1V3UnUUWIZkgivu1sR6+o=;
 b=TSUVEt5+y0GYQeCPB+KzUroXeA3qF7rWPajL3EVKOVVPlgWRqkDmYB0zHWjyVvTs1E
 1BcISM8QhgwY8DkZ+d3G1AV+So1oyLFlNrEgk7RfKMdzQ8c5sCe7zvWZ3jbOrk7yLedM
 J2GzpVJiZ7NK3tmnPWRS3EE0ZMqnLXukz7Na/BbLuRr86HkGjgIYdHaQdWridC8BwU2n
 2JKsjuZzlQtdWxvQqpo66T0Mpyoh0GM8ARbRdNmgtF6PvVR+aVL/iC75aeAX9RvzDO2K
 PNO8MWjqa5e3XQPQWL/t+Zck/u2lqvkfDkt/d8OGqaV+pyuXT+/PFN+16IB75XrRu3HE
 /RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/6N++rATlhaiduQ5L4IVlX1V3UnUUWIZkgivu1sR6+o=;
 b=V30qkKSPN2pxD0T/OLRpSiP1ix3jpp2kGtEzbxVYJgvhOaJX+AJ1uwLkDEUfMoC4dN
 4JrCz0IUFTj2Ee+AUh2FJRHSpKo7nJV88NFgMMq8dsI25UHVra4RzS5WSTfLVhJ4CtNt
 K+N+lShy0cLVBgLLPpNVX8D95EHNc3hEkvIX9ZSh6/dJ/C0xalyyIOTD+NTcd/Memb/1
 wuGErlp4B7ygYeIWPd0AAXgNEGeW2e8ntvSkhtCdsLh4Og1YF2OFfn9ULda5ORiF+Wnp
 +AJjjyWKBjHfgtuDww1lTs8MeTsfPpZrZjRuRplEp3/2HEOOJYS13DQdWiKrfEMXJROe
 2ygA==
X-Gm-Message-State: AOAM531v0nGTGZ1Wc314c3XaPqzc1xoV8MRQHQuPQWxX1ZyhqQQEQT6S
 FT456YwFHVqflaY/PSAOaQ30rw==
X-Google-Smtp-Source: ABdhPJyZNLVYBzrIbVDpJ4kAU5ca83wjlSTupbeFWXXPrsZWpfnFaJFHPigr6fQ9KtfAygkHzeh0PA==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id
 oo6-20020a17090b1c8600b001bf2a7e5c75mr1783870pjb.145.1651535989894; 
 Mon, 02 May 2022 16:59:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902dacb00b0015e8d4eb27dsm5209548plx.199.2022.05.02.16.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 16:59:49 -0700 (PDT)
Message-ID: <c6d3a823-b9a4-411a-b4b8-5fb1f1c9c214@linaro.org>
Date: Mon, 2 May 2022 16:59:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org, shorne@gmail.com
References: <20220502232800.259036-1-Jason@zx2c4.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502232800.259036-1-Jason@zx2c4.com>
Subject: Re: [OpenRISC] [PATCH] hw/openrisc: use right OMPIC size variable
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNS8yLzIyIDE2OjI4LCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gVGhpcyBhcHBlYXJz
IHRvIGJlIGEgY29weSBhbmQgcGFzdGUgZXJyb3IuIFRoZSBVQVJUIHNpemUgd2FzIHVzZWQKPiBp
bnN0ZWFkIG9mIHRoZSBtdWNoIHNtYWxsZXIgT01QSUMgc2l6ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBBLiBEb25lbmZlbGQ8SmFzb25AengyYzQuY29tPgo+IC0tLQo+ICAgaHcvb3BlbnJp
c2Mvb3BlbnJpc2Nfc2ltLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFy
ZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KCnJ+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1534D474CA8
	for <lists+openrisc@lfdr.de>; Tue, 14 Dec 2021 21:29:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E8176242ED;
	Tue, 14 Dec 2021 21:29:42 +0100 (CET)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mail.librecores.org (Postfix) with ESMTPS id 798B9242E8
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 21:29:41 +0100 (CET)
Received: by mail-qt1-f179.google.com with SMTP id o17so19671133qtk.1
 for <openrisc@lists.librecores.org>; Tue, 14 Dec 2021 12:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PQvIEEKb8J+zsoABCg2nAvB3/1WLR1t8At03o+PbkTY=;
 b=JlVP/JvaKq1uaySIgTnBG99Yiw52i2obdU4uj05uQgDT1rfygF2eoqIq0HvKfWXy5H
 z3Qhf7VA8wCrC4irwvm5dAV8PjMQWo8CsFFizmfBRpjdHOkIRNlRwa6+z/Quh+kwcbmM
 +TB9rvTFMyWHg2HhXzGBU6dJnzFqQIZLAJx7uEDAYZZhhaTAQ346S6ajHAx+Q933rRXt
 o2/bolYUNMpm1tkNpMQ0sqlZ6RZMaSx5XnRARSPQNBlRnP3eHa/ApnIsxtI6dbPdW+Kz
 AaNvy+JoMFJ/mbjcv9GVXVl+kUDvvpd+Xg3Z/7lOsvCCgu212EUqjCyRcaYtpiEysp0Y
 Vm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PQvIEEKb8J+zsoABCg2nAvB3/1WLR1t8At03o+PbkTY=;
 b=Zv5K773h3CnJmwlyvMkugDqmPXglcfnjvKHtzT+mzubG/vjT2IbNKf7bh9znzlKh02
 fxBvTwIQUZ5VKZRhqey25t2WFYrwxgakm/r6IITVhtLKaAt02Rrq6RaabAjdpGpDiT4F
 WMsnjkq74cn6UwAfAZqhzML2pMfbA7R9obb2KiwgCv8r0XDmwfF3eAmiuJhgGjTKL+pB
 o/gDFF8rngoZ59XgvH+ONPTtqwUExCGjCx+VMDqsvEE5iJ01eDrklUUVlMik5KorrDJx
 o2g+JDWJ0dpHdvRdv4He3tMvq87tjAjW5dt6xR1blRfC37kOyHyLB3ZSNbqSfHixrQ1V
 2u9w==
X-Gm-Message-State: AOAM531S2EqJY+qHdUn2VzzrBtpzxxaRo+Cv2hlgadXa+yJyCLXNlWZb
 Aaj8udk0phzpHEUMoiQ2IqWY0BTfLeb/NA==
X-Google-Smtp-Source: ABdhPJymrbbl++TyGHM5FiYBZrVb6xIS1b3FB/NIM23BPNUtBq+xVvfG2Y313Uo+qQlHxYBs8azf4g==
X-Received: by 2002:a05:622a:3d4:: with SMTP id
 k20mr8740146qtx.385.1639513780366; 
 Tue, 14 Dec 2021 12:29:40 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:1000:c46d:a2d6:9bed?
 ([2804:431:c7ca:103f:1000:c46d:a2d6:9bed])
 by smtp.gmail.com with ESMTPSA id b9sm717274qtb.53.2021.12.14.12.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:29:40 -0800 (PST)
Message-ID: <cc9a6327-dcf4-8d2a-6a63-29d70c6bbb34@linaro.org>
Date: Tue, 14 Dec 2021 17:29:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-3-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211210233456.4146479-3-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v3 02/13] linux/syscalls: Add or1k_atomic
 syscall for OpenRISC
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

SXQgbWF0Y2hlcyBrZXJuZWwgZGVmaW5pdGlvbi4KCkxHVE0sIHRoYW5rcy4KClJldmlld2VkLWJ5
OiBBZGhlbWVydmFsIFphbmVsbGEgIDxhZGhlbWVydmFsLnphbmVsbGFAbGluYXJvLm9yZz4KCk9u
IDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+
IC0tLQo+ICBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3N5c2Rl
cHMvdW5peC9zeXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdCBiL3N5c2RlcHMvdW5peC9zeXN2
L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdAo+IGluZGV4IDFhNzRkMDkwYjcuLmE3MmRlZTYyNzUg
MTAwNjQ0Cj4gLS0tIGEvc3lzZGVwcy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0
Cj4gKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0Cj4gQEAg
LTMwNCw2ICszMDQsNyBAQCBvcGVuX2J5X2hhbmRsZV9hdAo+ICBvcGVuX3RyZWUKPiAgb3BlbmF0
Cj4gIG9wZW5hdDIKPiArb3Ixa19hdG9taWMKPiAgb3NmX2FkanRpbWUKPiAgb3NmX2Fmc19zeXNj
YWxsCj4gIG9zZl9hbHRfcGxvY2sKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

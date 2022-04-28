Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4F30A513348
	for <lists+openrisc@lfdr.de>; Thu, 28 Apr 2022 14:01:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C640C248CA;
	Thu, 28 Apr 2022 14:01:58 +0200 (CEST)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mail.librecores.org (Postfix) with ESMTPS id 76A8B24329
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 14:01:56 +0200 (CEST)
Received: by mail-pl1-f177.google.com with SMTP id k4so4157940plk.7
 for <openrisc@lists.librecores.org>; Thu, 28 Apr 2022 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oqgxivLYi5BUgSGj1DqJZXiNhi/GYiWLJcQntaRw7OQ=;
 b=X3qak8Gru9iT1tyK111h51BUpVgcEMSGBY8p8CnIhlwvJ/lOGMoXaLH9kdJ7ZjIjWg
 n17mNwUcoDJWmJ4xlpwcNozLMOqBbl+ZDbHnWCwfVaJCaSg2ECQWsWTUx2B4HKGyZeoQ
 xt97EfYtoQ2oRnyRKTOJCH7Icd4U/9nEhWImdq8MagvBAKV2Aj3w7vFbeHB8rVBkH5Js
 RPopTEkuYSFLicdq9nqhW3q+IJLr9OSsw3vLYntmkVuAYodo+BXi7ZxWm/F1wBmnOf4g
 mU8rH8yGDy34FRLmSTwT40ApG0uw9cINEzmnzIZfjnTOoMK6yTtu0GhGMXVzgMYnT6f2
 k0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oqgxivLYi5BUgSGj1DqJZXiNhi/GYiWLJcQntaRw7OQ=;
 b=DQ1ZE/JN0zzu117dhqEjf+8e4zB061EtaiSCNohjKZHazTK2CPfb7KrJT4QWR8rzPW
 sekvq7zuIl8zEtUFlxeF1hMPQGOSSaMWSqwVxWHslD6Y/boqo3xFyIJenzLHI0EDvOn1
 O2yIJdSKxEcM03qWt35LLL5MWlAnerslPKS0aanKy0noTrmggrEPMStX3snDvymAd8yD
 E2LHzyBJX3TC5vB7RnlXPWawZ29puDYqL8YEfChY3VnUghgbCw+TzaWBp//6OO2ndknO
 eKdBniWWyyE/V2veON/QbqIHZANVZwyeaHXfMRCPW8Mf2v+7hIRG/u7rsHw5/SE1TiTd
 l3cA==
X-Gm-Message-State: AOAM532ULtPor3kmudysi+oJhSqJsxuxsaA9gUvVGOgXtk6QXY00aMIE
 rq4rAajNV3AdPLlm31xRqiw=
X-Google-Smtp-Source: ABdhPJzY83hafTI6yBJ6SxBjkxIyoijMdP45Z5bi/063RZb4CAQovSBVK2thtedJveQVIMNCx55N4A==
X-Received: by 2002:a17:902:e051:b0:15c:e5dd:c1c0 with SMTP id
 x17-20020a170902e05100b0015ce5ddc1c0mr26926343plx.1.1651147315044; 
 Thu, 28 Apr 2022 05:01:55 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090a290100b001d840f4eee0sm10605961pjd.20.2022.04.28.05.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 05:01:54 -0700 (PDT)
Date: Thu, 28 Apr 2022 21:01:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <YmqCMNHhFCMqjjVF@antec>
References: <20220428103516.1149436-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428103516.1149436-1-Jason@zx2c4.com>
Subject: Re: [OpenRISC] [PATCH] hw/openrisc: page-align FDT address
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBcHIgMjgsIDIwMjIgYXQgMTI6MzU6MTZQTSArMDIwMCwgSmFzb24gQS4gRG9uZW5m
ZWxkIHdyb3RlOgo+IFRoZSBRRU1VLXByb3ZpZGVkIEZEVCB3YXMgb25seSBiZWluZyByZWNvZ25p
emVkIGJ5IHRoZSBrZXJuZWwgd2hlbiBpdAo+IHdhcyB1c2VkIGluIGNvbmp1bmN0aW9uIHdpdGgg
LWluaXRyZC4gV2l0aG91dCBpdCwgdGhlIG1hZ2ljIGJ5dGVzCj4gd291bGRuJ3QgYmUgdGhlcmUg
YW5kIHRoZSBrZXJuZWwgY291bGRuJ3QgbG9hZCBpdC4gVGhpcyBwYXRjaCBmaXhlcyB0aGUKPiBp
c3N1ZSBieSBwYWdlIGFsaWduaW5nIHRoZSBwcm92aWRlZCBGRFQuCj4gCj4gQ2M6IFN0YWZmb3Jk
IEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IENjOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNv
bkB6eDJjNC5jb20+Cj4gLS0tCj4gIGh3L29wZW5yaXNjL29wZW5yaXNjX3NpbS5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvaHcvb3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMgYi9ody9vcGVucmlzYy9vcGVucmlz
Y19zaW0uYwo+IGluZGV4IDgxODRjYWE2MGIuLjk5YjE0OTQwZjQgMTAwNjQ0Cj4gLS0tIGEvaHcv
b3BlbnJpc2Mvb3BlbnJpc2Nfc2ltLmMKPiArKysgYi9ody9vcGVucmlzYy9vcGVucmlzY19zaW0u
Ywo+IEBAIC0zNTYsNyArMzU2LDcgQEAgc3RhdGljIHVpbnQzMl90IG9wZW5yaXNjX2xvYWRfZmR0
KE9yMWtzaW1TdGF0ZSAqc3RhdGUsIGh3YWRkciBsb2FkX3N0YXJ0LAo+ICAgICAgfQo+ICAKPiAg
ICAgIC8qIFdlIHB1dCBmZHQgcmlnaHQgYWZ0ZXIgdGhlIGtlcm5lbCBhbmQvb3IgaW5pdHJkLiAq
Lwo+IC0gICAgZmR0X2FkZHIgPSBST1VORF9VUChsb2FkX3N0YXJ0LCA0KTsKPiArICAgIGZkdF9h
ZGRyID0gVEFSR0VUX1BBR0VfQUxJR04obG9hZF9zdGFydCk7Cj4gIAo+ICAgICAgcmV0ID0gZmR0
X3BhY2soZmR0KTsKPiAgICAgIC8qIFNob3VsZCBvbmx5IGZhaWwgaWYgd2UndmUgYnVpbHQgYSBj
b3JydXB0ZWQgdHJlZSAqLwo+IC0tIAo+IDIuMzUuMQoKVGhpcyBsb29rcyBPSyB0byBtZSwganVz
dCBmb3IgY2xhcml0eSB3ZSBjdXJyZW50bHkgYXJlIGxvYWRpbmc6CiAgLSAweDEwMCAgICAgICAg
LSBLZXJuZWwKICAtIHBhZ2UgYWxpZ25lZCAtIEluaXRyZAogIC0gd29yZCBhbGlnbmVkIC0gRkRU
CgpJbiB0aGUgYWJzZW5zZSBvZiB0aGUgaW5pdHJkIHdlIG5lZWQgdG8gZW5zdXJlIHRoZSBGRFQg
aXMgcGFnZSBhbGlnbmVkLgoKSWYgc29tZW9uZSBlbHNlIHdhbnRzIHRvIHBpY2sgdGhpcyB1cCB0
byBwdXNoIHRvIHFlbXUgaWYgd291bGQgaGVscCwgSSBkb24ndApoYXZlIGFueXRoaW5nIHBsYW5u
ZWQgYXQgdGhlIG1vbWVudC4KCklmIG5vdCBJIHdpbGwgc3RhcnQgYSBxdWV1ZSBpbiBhIGZldyBk
YXlzLgoKQWNrZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

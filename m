Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BCC093662EE
	for <lists+openrisc@lfdr.de>; Wed, 21 Apr 2021 02:12:31 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7F47C21358;
	Wed, 21 Apr 2021 02:12:31 +0200 (CEST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mail.librecores.org (Postfix) with ESMTPS id EFA6A21327
 for <openrisc@lists.librecores.org>; Wed, 21 Apr 2021 01:20:46 +0200 (CEST)
Received: by mail-pf1-f175.google.com with SMTP id y62so3011572pfg.4
 for <openrisc@lists.librecores.org>; Tue, 20 Apr 2021 16:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ftDQYZM0u1ypT8N79wtfqfjKnOTw7tOAg2nevKUoN2c=;
 b=M5YaRvvN94l7yiH+SnnIUMrPoF0ulX5gUbvLZ08W3PUtpwptJFYoDvhaD+1htcaVcG
 ZWC2jBF32ITgXxp+aw8a2Ft5rO6fnTSUj++qiZwDy5Ol9Q9QIShM//uINeffldMpmG6A
 39mz9/EbBkqhMT8rbCK+TtSvhc/P0eLLCNuPOsZmu6bbakZNiReoQ7QnIqM45J1jAHSx
 7/o+CVl8GoeVUJrHFy4+Jrl9AnSINH5QqeVRt09H3Toarb+j7hxYUhcQXh0YlYyfuIP9
 u56qWCqKI6qBlFOm4wki89MHj1HGVfRR2GZTnKzT5M6BsXqrcVO4Xdt6zrRhxCgZoyoP
 f/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ftDQYZM0u1ypT8N79wtfqfjKnOTw7tOAg2nevKUoN2c=;
 b=Dr6KWTZcfSU8NNnOLfo5dTJsSOs+jhFbIxlQhz19vDV+lAng4BqBubKWye8h/sLbzc
 di6Q9gz0+I2QlcH5HqGqM4l1/8BG8vhwhXvmXYgjwaafaOjjjn2YHnLd4g5sThU1CepY
 tDRFh2RFA/3TSOx/igZNYvIe34qmHok4QqSIAEJ9U1Pl3X7W1o9GnppZLowj7kWq17Pn
 +WDB2et2Rie4t2ZABgj2iGxtyPZqsl6xLxbbnvJMK99zuBMQTRoDJEwVuZRGbIa6fJBQ
 LRJCRrrF6oNcIapw20xC5I5glG5aH9yqnWgR4+gxHl1OMrCwc3igWa8ZJRRQp4xDYPgB
 1eoA==
X-Gm-Message-State: AOAM533HfWmgV+fWqupOtz0y9rIJbZT9jhlWFxIF44d9qUqkvmzv4Obz
 FjB+6mELRr/BiON8BXkBRxve/TDx71MHOw==
X-Google-Smtp-Source: ABdhPJy2HSHZT9kTCqO6k8ytdh5Uk+MC3JOjXgJiXkllAcunf8MSlDinMxUH8WWjGDaK58dw2lEbtg==
X-Received: by 2002:a62:1a4a:0:b029:25f:3159:78ea with SMTP id
 a71-20020a621a4a0000b029025f315978eamr13156988pfa.41.1618960845219; 
 Tue, 20 Apr 2021 16:20:45 -0700 (PDT)
Received: from [192.168.1.2] (c-98-202-48-222.hsd1.ut.comcast.net.
 [98.202.48.222])
 by smtp.gmail.com with ESMTPSA id h9sm104774pgl.67.2021.04.20.16.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 16:20:44 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>, GCC patches <gcc-patches@gcc.gnu.org>
References: <20210419001034.3626375-1-shorne@gmail.com>
From: Jeff Law <jeffreyalaw@gmail.com>
Message-ID: <9b45b7ef-fce1-84dc-3a86-76801b26de08@gmail.com>
Date: Tue, 20 Apr 2021 17:20:39 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419001034.3626375-1-shorne@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 21 Apr 2021 02:12:30 +0200
Subject: Re: [OpenRISC] [PATCH] or1k: Add mcmodel option to handle large GOTs
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDQvMTgvMjAyMSA2OjEwIFBNLCBTdGFmZm9yZCBIb3JuZSB2aWEgR2NjLXBhdGNoZXMgd3Jv
dGU6Cj4gV2hlbiBidWlsZGluZyBsaWJnZW9zIHdlIGdldCBhbiBlcnJvciB3aXRoOgo+Cj4gICAg
ICBsaW51eC11Y2xpYmMvOS4zLjAvY3J0YmVnaW5TLm86IGluIGZ1bmN0aW9uIGBfX2RvX2dsb2Jh
bF9kdG9yc19hdXgnOgo+ICAgICAgY3J0c3R1ZmYuYzooLnRleHQrMHgxMTgpOiByZWxvY2F0aW9u
IHRydW5jYXRlZCB0byBmaXQ6IFJfT1IxS19HT1QxNiBhZ2FpbnN0IHN5bWJvbCBgX19jeGFfZmlu
YWxpemUnIGRlZmluZWQgaW4gLnRleHQgc2VjdGlvbiBpbgo+ICAgICAgL2hvbWUvc2hvcm5lL3dv
cmsvb3BlbnJpc2MvM2ViOWY5ZDBmNmQ4Mjc0YjJkMTk3NTNjMDA2YmQ4M2Y3ZDUzNmUzYy9vdXRw
dXQvaG9zdC9vcjFrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdC9saWIvbGliYy5zby4K
Pgo+IFRoaXMgaXMgY2F1c2VkIGJ5IEdPVCBjb2RlIGhhdmluZyBhIGxpbWl0IG9mIDY0ay4gIElu
IE9wZW5SSVNDIHRoaXMKPiBsb29rcyB0byBiZSB0aGUgb25seSByZWxvY2F0aW9uIGNvZGUgcGF0
dGVybiB0byBiZSBsaW1pdGVkIHRvIDY0ay4KPgo+IFRoaXMgcGF0Y2ggYWxsb3dzIHNwZWNpZnlp
bmcgYSBuZXcgb3B0aW9uIC1tY21vZGVsPWxhcmdlIHdoaWNoIGNhbiBiZQo+IHVzZWQgdG8gZ2Vu
ZXJhdGUgMiBtb3JlIGluc3RydWN0aW9ucyB0byBjb25zdHJ1Y3QgMzItYml0IGFkZHJlc3NlcyBm
b3IKPiB1cCB0byA0RyBHT1RzLgo+Cj4gZ2NjL0NoYW5nZUxvZzoKPgo+IAlQUiA5OTc4Mwo+IAkq
IGNvbmZpZy9vcjFrL29yMWstb3B0cy5oOiBOZXcgZmlsZS4KPiAJKiBjb25maWcvb3Ixay9vcjFr
LmMgKG9yMWtfbGVnaXRpbWl6ZV9hZGRyZXNzXzEsIHByaW50X3JlbG9jKToKPiAJU3VwcG9ydCBn
ZW5lcmF0aW5nIGdvdGhhIHJlbG9jYXRpb25zIGlmIC1tY21vZGVsPWxhcmdlIGlzCj4gCXNwZWNp
ZmllZC4KPiAJKiBjb25maWcvb3Ixay9vcjFrLmggKFRBUkdFVF9DTU9ERUxfU01BTEwsIFRBUkdF
VF9DTU9ERUxfTEFSR0UpOgo+IAlOZXcgbWFjcm9zLgo+IAkqIGNvbmZpZy9vcjFrL29yMWsub3B0
IChtY21vZGVsPSk6IE5ldyBvcHRpb24uCj4gCSogZG9jL2ludm9rZS50ZXh0IChPcGVuUklTQyBP
cHRpb25zKTogRG9jdW1lbnQgbWNtb2RlbC4KCk5vdGUgeW91J3JlIHRoZSBwb3J0IG1haW50YWlu
ZXIsIHNvIHlvdSBkb24ndCBuZWVkIGFwcHJvdmFsIHRvIGNvbW1pdCAKdGhpcyB0byBHQ0MuCgpK
ZWZmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

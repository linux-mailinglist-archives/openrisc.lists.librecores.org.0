Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 52A563C3CCF
	for <lists+openrisc@lfdr.de>; Sun, 11 Jul 2021 15:24:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 09DCB213F3;
	Sun, 11 Jul 2021 15:24:56 +0200 (CEST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mail.librecores.org (Postfix) with ESMTPS id 7756821370
 for <openrisc@lists.librecores.org>; Sun, 11 Jul 2021 15:24:53 +0200 (CEST)
Received: by mail-pg1-f178.google.com with SMTP id h4so15219734pgp.5
 for <openrisc@lists.librecores.org>; Sun, 11 Jul 2021 06:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HqzZjXCDRJTBmnQjxnRNUHPHJHKhgX7WMafOByAPQxA=;
 b=GW5Yn8YWLoCu77PgdB9rQMmvPYWxq8GFkddK/5f8Dv1JtGI8BXM8MOWm6Tjy2SGjCr
 zpyyjMbk3toVnZ7N+Nt2fSOqtcaBkDXj1AvSlBashpRfYyX8XMbbF/3k8e8uEUQKAPKH
 idKVI56hsI+nmPTO2VRL/X0yuGyxmrUVlGTVfK/T5U6y5sgc2ZyBbzFt9APjZjGhgwXi
 EP3oiUw1EgRCdeXGRsr+zBHx7fNz2Rdxm7tMaSwGOa3ZMFOxEfg6uAtHQuEpUEkkW/TK
 2ESI6fKK1ashk/pvFZEnMm28eyXiCPqEVSK4UN1pujpw2W2NWJ9lhZIGP3WPJYhBHIW6
 vlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HqzZjXCDRJTBmnQjxnRNUHPHJHKhgX7WMafOByAPQxA=;
 b=jsEq9Juhx8mlcoDP7WxDlMDHG/Zun6d9fGUZp95LFpnDUmr9VVOfVkW7AtKim1HRqG
 bDyZzuk+ygBlt1sgypLA9I9d3hk0cbN/wf9W9NJPlBSshJkqbJN9mEvJ3kfhCGt5VSG9
 2wAJASBvcCHAAT2lvtwNsjcrjrNF+F23HT0l2qmGj0NyP1gHnJ9tVAluKZLgoTstQ9Bq
 xbqWDDYuFh94ErpjXDuD1zThP/lxDYhnimel8W7maIcqtQe6gFd39K1XuRDA3nboc1so
 yA7Fu0hFdm71Kk7cLPIaZZQZ0Kkel9jlApIyx1RB5usiGr7gARpgzUqKASyfHTrw4niq
 rDcg==
X-Gm-Message-State: AOAM533XwOZdigghU+HnmHqtlZ4iDw3VVC6AwH5VGk+Tfb5N/PiKlDCn
 qfBlOcp0hfMc7t7yFKyvKPmeJQ==
X-Google-Smtp-Source: ABdhPJwq+X7L9Eb5ZKK6Pp7VJFRUO4IU4crSCA5AxoZeYMhpAV2JCW2FPEmPY76k1bVn4FvEynCR3Q==
X-Received: by 2002:aa7:96f0:0:b029:312:8eda:61e1 with SMTP id
 i16-20020aa796f00000b02903128eda61e1mr48372345pfq.42.1626009891950; 
 Sun, 11 Jul 2021 06:24:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t5sm14720651pgb.58.2021.07.11.06.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 06:24:51 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Stafford Horne <shorne@gmail.com>
References: <YOdxwtNeQ2eUr+L3@antec>
 <D68EB4FF-538F-4FF1-ACFC-24AFEB098314@benettiengineering.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16b3a02d-f749-0806-ed0f-df3ad7050bb3@linaro.org>
Date: Sun, 11 Jul 2021 06:24:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <D68EB4FF-538F-4FF1-ACFC-24AFEB098314@benettiengineering.com>
Content-Language: en-US
Subject: Re: [OpenRISC] Maybe another or1k bug
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gNy8xMS8yMSAxOjM2IEFNLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBTdWJzdGl0dXRpbmcg
U1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgd2l0aCBTWU1CT0xfQ0FMTFNfTE9DQUwgZml4ZXMgdGhl
IHByb2JsZW0uCj4gT25seSBvbmUgdGhpbmcsIGlzIGl0IHZhbGlkIGZvciBldmVyeSBjYXNlIGlu
IHRoYXQgc3dpdGNoIG9yIG11c3QgaXQgYmUgb25seSBmb3IgUl9PUjFLX0lOU05fUkVMXzI2PwoK
T25seSBmb3IgSU5TTl9SRUxfMjYuCgoKcn4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

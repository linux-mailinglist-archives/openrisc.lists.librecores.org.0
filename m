Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFA5517B12
	for <lists+openrisc@lfdr.de>; Tue,  3 May 2022 01:57:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 37451248EF;
	Tue,  3 May 2022 01:57:48 +0200 (CEST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mail.librecores.org (Postfix) with ESMTPS id 09D9F248E3
 for <openrisc@lists.librecores.org>; Tue,  3 May 2022 01:57:47 +0200 (CEST)
Received: by mail-pj1-f44.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so686189pjh.4
 for <openrisc@lists.librecores.org>; Mon, 02 May 2022 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PVKCeA2S5bqJLUfn5MnkPfC5WHn7lSJvrMZRexRldH0=;
 b=XaHBpuX8lBt8utCqfXpmo0ePeA4QCK94Kprd90irVhRbM4pUViuABYrRM6Guhqe0HG
 QEqHYl2N5WHtT4ZVSaak6/whdtJyANf3EcJCV5KuWyRaj6V6Zolz27VchVs7aWfAOeJ0
 IVmNCZnQxZQrYCK/Y40WQ0g9JSq4mRH0itt1RwOWAB5aAjHZT3wiiEAbXMAV612GvXKh
 DzksmPTE0JTCdp6BMG47PZtruHDwvOY8cSgJ+nF8uYU2ne/HptR19UNGknXE4EGpQVKR
 psD+FkgYvgRB0nl3izj1RH6oA3nX5RBUZaiTvMKua27SDSnhm/DdSxWVnFJ3Ms9QOdMm
 UARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PVKCeA2S5bqJLUfn5MnkPfC5WHn7lSJvrMZRexRldH0=;
 b=Um+h7VngYokP1vaT7KGZjOrXaEzH6jIvjkj8PsCzkJLlpikj1qUUjxsfUeHApso4UB
 62HMGZwTtliEpgB/EmZswcAlCp5ZiBvs31PDCDWebsAk0JAwmHZl9wXKW5c2CWMRN9Qa
 wPZu0pkUWhjmENYdLvTDHp8PxIAxo3oRI+oz9jWmhJdSnAgSVo6edbkPv6xXrl3hwgy8
 bGacorIYB7hmFi1a8xsXqUj0zZMkYcp7dBjQjw3wvnFAFTmWF4lkHLwgsMqkKtJ1mQUC
 Bae0okNS3Hrtzs0+6jh0CkFcOIXCVQECcfaelSisgOUw3iJwEYFkqXx63HxJK6KRhiuQ
 M4GA==
X-Gm-Message-State: AOAM531iFadQA3fJ8sFo03pOfpixjLmNbk4c1oVC0Uxc53cTOTcNSV00
 zRjWIDADYRrWRNEvLnukazGPcw==
X-Google-Smtp-Source: ABdhPJyd0ofEhf4i7+W3CKCai0H7y2rl0KIAKkAEBMHWktD5pArQ6vJMH7/dpKiCj0iNuFdSpK49hQ==
X-Received: by 2002:a17:902:7e06:b0:159:6c1:ea2b with SMTP id
 b6-20020a1709027e0600b0015906c1ea2bmr13797960plm.105.1651535865559; 
 Mon, 02 May 2022 16:57:45 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170903108400b0015e8d4eb2e1sm5156467pld.299.2022.05.02.16.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 16:57:44 -0700 (PDT)
Message-ID: <b1cf3942-115c-bca3-81cf-1f7bfd66dc5a@linaro.org>
Date: Mon, 2 May 2022 16:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 openrisc@lists.librecores.org, shorne@gmail.com
References: <20220502225230.237369-1-Jason@zx2c4.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502225230.237369-1-Jason@zx2c4.com>
Subject: Re: [OpenRISC] [PATCH] target/openrisc: implement shutdown and
 reset helpers
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

T24gNS8yLzIyIDE1OjUyLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6Cj4gT3BlblJJU0MgZGVm
aW5lcyB2YXJpb3VzIG5vcCBpbnN0cnVjdGlvbnMgaW4gb3IxayBhcyBtZWFuaW5nIHNodXRkb3du
IG9yCj4gcmVzZXQuIEltcGxlbWVudCB0aGVzZSBpbiBUQ0cuIFRoaXMgaGFzIGJlZW4gdGVzdGVk
IHdpdGggTGludXggYW5kCj4gY29uZmlybWVkIHRvIHdvcmsuCgpObywgT3BlblJJU0MgZG9lcyBu
b3QgZGVmaW5lIHZhcmlvdXMgbm9wIGluc3RydWN0aW9ucywgZXRjLgoKT3BlblJJU0MgZGVmaW5l
cyBhIFBvd2VyIE1hbmFnZW1lbnQgUmVnaXN0ZXIgdG8gaGFuZGxlIGRvemUgYW5kIHN1c3BlbmQ7
IHRoZXJlIGlzIG5vIApzcGVjaWZpY2F0aW9uIGZvciBzaHV0ZG93biBvciByZXNldC4KClNlZSBo
dHRwczovL29wZW5yaXNjLmlvL2FyY2hpdGVjdHVyZQoKCnJ+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

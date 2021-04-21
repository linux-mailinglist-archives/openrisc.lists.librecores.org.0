Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 01505366311
	for <lists+openrisc@lfdr.de>; Wed, 21 Apr 2021 02:23:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 955092135A;
	Wed, 21 Apr 2021 02:23:06 +0200 (CEST)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mail.librecores.org (Postfix) with ESMTPS id 9133B21327
 for <openrisc@lists.librecores.org>; Wed, 21 Apr 2021 02:23:04 +0200 (CEST)
Received: by mail-pg1-f175.google.com with SMTP id j7so18633167pgi.3
 for <openrisc@lists.librecores.org>; Tue, 20 Apr 2021 17:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SsQtJtm5DfGQ1qu4S/LYZh9Y9NcWDv3xtF+1cS2y/Z4=;
 b=QIKSgqfGWoiqAXsCkZ0Jl1HzZ1YgsXN4CpFIFPkg6PPwUHmsdiqosCXHomSpqwBd3y
 Hu1lQzSe7C3a+in0OAEF2LU1EXihSczo8sttYV8JNPU863PN+I5RrqHHQHorBwEJx3EG
 xh5h5f/1SMAAUQ4tZ0bMxXt0w9gI8rwGOqs/8R2yW/4Bc8GGPevP3zvpgPTZbgycdKUD
 77h3JSiGw6YpBIm8MQWC9U8KU5vBMPpN7wjL85dqdlcTn4fAH3zsICotumW07YrhxJgp
 hW8jCmFkDlBGmaBljNFeQAbWzIQx6UuWQXl1E0Yk0koVXQpfKxI2aHHelViBSbvZ17DV
 8nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SsQtJtm5DfGQ1qu4S/LYZh9Y9NcWDv3xtF+1cS2y/Z4=;
 b=ZWGQFgUh30XvBxtVCMIMkoq7UR9lzZY34bWk5GjRJDCjBMxywUWEceumjXyCr7wELF
 w7n7fzbiWoIDV9ufOMvEVNDFOReIXPJSSv8+zFzaHvUXJCOXHD8LrlqRhfszkwiUdmcR
 3zWeuI4tgaOirvML9vzuxcHUhEm4o1B+ppWaTsECTg/pS+M6Ob787JBb4N1gk5YgQQj0
 YbToDzZg6kItjnjI5zLCAqQNNyoYVOi5c2bQ4GwqPRSNyTHsclmDR3uXlBxO79wrdL+b
 EzKi2rLht/foAmya7MrRpwHXUIwfH3fTEvvLrfxXNjUQwX5cfYYjZzScYvWpQG0E7J9B
 HmoQ==
X-Gm-Message-State: AOAM530f3+5f1q5djHhIRAUTl0Ty/neTwoyuehGO6o7h4oWUxHU0gvLj
 SawhvR19PhzbAm1P8OBFbJ6+mAXInJRUKQ==
X-Google-Smtp-Source: ABdhPJz918cVOsNU2gKI/cuHf+u+t/KJC7kukoKL8rB10lR7L3F4QrqEIZMGq04afZ41LXOoFWXXLA==
X-Received: by 2002:a17:90a:5911:: with SMTP id
 k17mr1978324pji.73.1618964582811; 
 Tue, 20 Apr 2021 17:23:02 -0700 (PDT)
Received: from [192.168.1.2] (c-98-202-48-222.hsd1.ut.comcast.net.
 [98.202.48.222])
 by smtp.gmail.com with ESMTPSA id k13sm155613pfc.50.2021.04.20.17.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 17:23:02 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>
References: <20210419001034.3626375-1-shorne@gmail.com>
 <9b45b7ef-fce1-84dc-3a86-76801b26de08@gmail.com>
 <20210421001209.GO3288043@lianli.shorne-pla.net>
From: Jeff Law <jeffreyalaw@gmail.com>
Message-ID: <9e13030f-f0fb-9da9-5889-63ae55f057df@gmail.com>
Date: Tue, 20 Apr 2021 18:22:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421001209.GO3288043@lianli.shorne-pla.net>
Content-Language: en-US
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
 Openrisc <openrisc@lists.librecores.org>,
 GCC patches <gcc-patches@gcc.gnu.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDQvMjAvMjAyMSA2OjEyIFBNLCBTdGFmZm9yZCBIb3JuZSB3cm90ZToKPiBPbiBUdWUsIEFw
ciAyMCwgMjAyMSBhdCAwNToyMDozOVBNIC0wNjAwLCBKZWZmIExhdyB3cm90ZToKPj4gT24gNC8x
OC8yMDIxIDY6MTAgUE0sIFN0YWZmb3JkIEhvcm5lIHZpYSBHY2MtcGF0Y2hlcyB3cm90ZToKPj4+
IFdoZW4gYnVpbGRpbmcgbGliZ2VvcyB3ZSBnZXQgYW4gZXJyb3Igd2l0aDoKPj4+Cj4+PiAgICAg
ICBsaW51eC11Y2xpYmMvOS4zLjAvY3J0YmVnaW5TLm86IGluIGZ1bmN0aW9uIGBfX2RvX2dsb2Jh
bF9kdG9yc19hdXgnOgo+Pj4gICAgICAgY3J0c3R1ZmYuYzooLnRleHQrMHgxMTgpOiByZWxvY2F0
aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfT1IxS19HT1QxNiBhZ2FpbnN0IHN5bWJvbCBgX19jeGFf
ZmluYWxpemUnIGRlZmluZWQgaW4gLnRleHQgc2VjdGlvbiBpbgo+Pj4gICAgICAgL2hvbWUvc2hv
cm5lL3dvcmsvb3BlbnJpc2MvM2ViOWY5ZDBmNmQ4Mjc0YjJkMTk3NTNjMDA2YmQ4M2Y3ZDUzNmUz
Yy9vdXRwdXQvaG9zdC9vcjFrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdC9saWIvbGli
Yy5zby4KPj4+Cj4+PiBUaGlzIGlzIGNhdXNlZCBieSBHT1QgY29kZSBoYXZpbmcgYSBsaW1pdCBv
ZiA2NGsuICBJbiBPcGVuUklTQyB0aGlzCj4+PiBsb29rcyB0byBiZSB0aGUgb25seSByZWxvY2F0
aW9uIGNvZGUgcGF0dGVybiB0byBiZSBsaW1pdGVkIHRvIDY0ay4KPj4+Cj4+PiBUaGlzIHBhdGNo
IGFsbG93cyBzcGVjaWZ5aW5nIGEgbmV3IG9wdGlvbiAtbWNtb2RlbD1sYXJnZSB3aGljaCBjYW4g
YmUKPj4+IHVzZWQgdG8gZ2VuZXJhdGUgMiBtb3JlIGluc3RydWN0aW9ucyB0byBjb25zdHJ1Y3Qg
MzItYml0IGFkZHJlc3NlcyBmb3IKPj4+IHVwIHRvIDRHIEdPVHMuCj4+Pgo+Pj4gZ2NjL0NoYW5n
ZUxvZzoKPj4+Cj4+PiAJUFIgOTk3ODMKPj4+IAkqIGNvbmZpZy9vcjFrL29yMWstb3B0cy5oOiBO
ZXcgZmlsZS4KPj4+IAkqIGNvbmZpZy9vcjFrL29yMWsuYyAob3Ixa19sZWdpdGltaXplX2FkZHJl
c3NfMSwgcHJpbnRfcmVsb2MpOgo+Pj4gCVN1cHBvcnQgZ2VuZXJhdGluZyBnb3RoYSByZWxvY2F0
aW9ucyBpZiAtbWNtb2RlbD1sYXJnZSBpcwo+Pj4gCXNwZWNpZmllZC4KPj4+IAkqIGNvbmZpZy9v
cjFrL29yMWsuaCAoVEFSR0VUX0NNT0RFTF9TTUFMTCwgVEFSR0VUX0NNT0RFTF9MQVJHRSk6Cj4+
PiAJTmV3IG1hY3Jvcy4KPj4+IAkqIGNvbmZpZy9vcjFrL29yMWsub3B0IChtY21vZGVsPSk6IE5l
dyBvcHRpb24uCj4+PiAJKiBkb2MvaW52b2tlLnRleHQgKE9wZW5SSVNDIE9wdGlvbnMpOiBEb2N1
bWVudCBtY21vZGVsLgo+PiBOb3RlIHlvdSdyZSB0aGUgcG9ydCBtYWludGFpbmVyLCBzbyB5b3Ug
ZG9uJ3QgbmVlZCBhcHByb3ZhbCB0byBjb21taXQgdGhpcwo+PiB0byBHQ0MuCj4gVGhhbmtzIGZv
ciBjb25maXJtaW5nLCBJIGtub3cgdGhhdCBhZnRlciBTZWdoZXIgdG9sZCBtZSB3aXRoIHNvbWUg
cHJldmlvdXMKPiBwYXRjaGVzLiA6KQo+Cj4gRm9yIHRoaXMgc2VyaWVzIEdpdWxpbyBwaWNrZWQg
aXQgdXAgYW5kIHRlc3RlZCBpdC4gIFdlIGZvdW5kIHNvbWUgaXNzdWVzIGFuZCBJCj4gYW0gZ29p
bmcgdG8gZml4IHdpdGggYSBWMi4gIEkgc2hvdWxkIGNvbW1pdCB0aGF0IHZlcnNpb24sIGFmdGVy
IHRoZSBiaW51dGlscwo+IGNoYW5nZXMgYXJlIGluLgoKU291bmRzIGdvb2QuwqAgVGhhbmtzLsKg
IEdpdmVuIHdlJ3JlIG1ha2luZyBnY2MtMTEgUkNzIHlvdSdsbCBoYXZlIHRvIApkZWNpZGUgaWYg
aXRzIHdvcnRoIHRoZSByaXNrIG9mIGludHJvZHVjaW5nIHRob3NlIGNoYW5nZXMgdGhpcyBsYXRl
IGluIAp0aGUgY3ljbGUgaXMgc2FmZSBvciBub3QuCgpqZWZmCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

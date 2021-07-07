Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C96333BF42D
	for <lists+openrisc@lfdr.de>; Thu,  8 Jul 2021 05:04:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7949720305;
	Thu,  8 Jul 2021 05:04:28 +0200 (CEST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 2ED5F20B5B
 for <openrisc@lists.librecores.org>; Wed,  7 Jul 2021 23:25:43 +0200 (CEST)
Received: by mail-pj1-f50.google.com with SMTP id
 oj11-20020a17090b4d8bb029017338c124dcso296678pjb.0
 for <openrisc@lists.librecores.org>; Wed, 07 Jul 2021 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZCJNvNPcavVxWf/ozzSFn5w/b906fsfJwldfKXRue24=;
 b=oksg5GDVCsBn8OgflNPwiHGVkl80UkJinrwoxAar/N1p3ptvL2m4smvsSfqBT37BS/
 8HXZb6t1QiOuyjshnzZEtXmfifXz7w1bSohVxVh2jb4OcZ8gOr38Pef2jmo2Bal1J7KO
 g4NdWZAreaDKV/L1Wvos4T3dI8/MDsYdE7/X43Ln26JYpdVfZrQRoesspCPM4B5mMyll
 wh1o3Jy+Ikrq5FtZtRKval2LZQP+qEqSgFFRYm5UzHlaawn7/pGBMf0k8Uim8ldwYtC9
 5LaKLOppRKlv+cKgIAVkl6/mnhN6A/2l9diSX7aXp8GHVnrY35zWGfIMIKoB+2W7nb28
 ycEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCJNvNPcavVxWf/ozzSFn5w/b906fsfJwldfKXRue24=;
 b=YTF6GYsoeiP9IZ1kAfrbGXmTnaKjQc/8ZVW2Iqn+AvynNtT/Q3XeAy2+Ap7dXVzGFj
 gEhmushEQ5oA70Pu8mGVbi3vbzC4+2ZV/bF9qkfT/2EGMWT7tNXvklOLUpEJT+rCc5Yd
 O1ZdnUhf5gkoGSTutJBcdmvuF1RbTMZrU3dtPvufSQNQxcXx73cVT1xhkWnLEhgVWPjA
 rLXvN/lscO6Xsy62j2I6tgzENnOAgi4De5YI+SEemvfKUV3jnVO7lIMAPHts/TJDrMom
 bUTuEgUyHPYkENchHFnffB7SlDMbFSj5KDq3NzZaXslyTVimNG5KUY3WodTzEz1CVbSc
 WNvg==
X-Gm-Message-State: AOAM532uLjCB17OBXrIE32bDa+/TCxXfagCnYedblKpsMpQOfoj7US1e
 qeAkerhh5C4vpesf5OF4K6T6aA==
X-Google-Smtp-Source: ABdhPJxg+WkpHg7gggcL2MmYc0RZNuP9yBvRmB1iQDOCtgUCoZXIuSujxf3NWiO1cSqlrJMHEcJjkw==
X-Received: by 2002:a17:90b:683:: with SMTP id
 m3mr25878985pjz.151.1625693141730; 
 Wed, 07 Jul 2021 14:25:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z141sm139860pfc.146.2021.07.07.14.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:25:41 -0700 (PDT)
To: Stafford Horne <shorne@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
 <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
 <6bc67759-18c2-bca5-bdb2-c637e873b8ab@benettiengineering.com>
 <YMvdpzYqcwNzAeQ/@antec> <YOYXPQENdaFWobWO@antec>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <942dec94-e7e6-33d6-84e6-715e5e368c98@linaro.org>
Date: Wed, 7 Jul 2021 14:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOYXPQENdaFWobWO@antec>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 08 Jul 2021 05:04:26 +0200
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

T24gNy83LzIxIDI6MDYgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ICtDQyBSaWNoYXJkcyBv
dGhlciBhY2NvdW50Cj4gCj4gSGkgUmljaGFyZCwKPiAKPiBJIENjZWQgdGhpcyB0byB5b3UgdHdp
ZGRsZS5uZXQgYWNjb3VudCB5b3Ugb24gdGhpcyBvbmUgb3JpZ2luYWxseS4gRG8geW91IHJlY2Fs
bAo+IHdoeSB3ZSBhZGRlZCB0aGUgYmVsb3cgY2hlY2sgaW4gb3IxayBiZmQ/ICBJdCBzZWVtcyB0
byBiZSBvdmVybHkgcmVzdHJpY3RpdmUgYW5kCj4gY2F1c2luZyBzb21lIGlzc3VlcyBiZWxvdy4K
PiAKPiAgIGNhc2UgUl9PUjFLX0lOU05fUkVMXzI2Ogo+ICAgICBpZiAoYmZkX2xpbmtfcGljIChp
bmZvKSAmJiAhU1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgKGluZm8sIGgpKQo+ICAgICAgIEVSUk9S
Ci4uLgo+PiA0LiBUaGUgc3ltYm9scyBhcmUgZnJvbSBgcmVhZGVsZiAtc2A6Cj4+Cj4+ICAgICAy
MjE6IDAwMDA4Y2U0ICAgNzE2IEZVTkMgICAgR0xPQkFMIFBST1RFQ1RFRCAgIDI0IGFsU291cmNl
UGF1c2V2Cj4+ICAgICAyMjI6IDAwMDA4ZmIwICAgIDM2IEZVTkMgICAgR0xPQkFMIFBST1RFQ1RF
RCAgIDI0IGFsU291cmNlUGF1c2UKPj4gICAgIDIyMzogMDAwMDhmZDQgICA3ODQgRlVOQyAgICBH
TE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VTdG9wdgo+PiAgICAgMjI0OiAwMDAwOTJlNCAg
ICAzNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBhbFNvdXJjZVN0b3AKPj4gICAgIDIy
NTogMDAwMDkzMDggICA3MjAgRlVOQyAgICBHTE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VS
ZXdpbmR2Cj4+ICAgICAyMjY6IDAwMDA5NWQ4ICAgIDM2IEZVTkMgICAgR0xPQkFMIFBST1RFQ1RF
RCAgIDI0IGFsU291cmNlUmV3aW5kCgpBaCwgU1RWX1BST1RFQ1RFRC4gIFVudXN1YWwuCgpJdCBs
b29rcyBsaWtlIHRoaXMgc2hvdWxkIGJlIFNZTUJPTF9DQUxMU19MT0NBTC4gIFRoZSBvbmx5IGRp
ZmZlcmVuY2UgZnJvbSAKU1lNQk9MX1JFRkVSRU5DRVNfTE9DQUwgaXMgdmVyc3VzIHByb3RlY3Rl
ZCBzeW1ib2xzLgoKCnJ+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

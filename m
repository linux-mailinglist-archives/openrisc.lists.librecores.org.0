Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 468394836CC
	for <lists+openrisc@lfdr.de>; Mon,  3 Jan 2022 19:26:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2B4572432F;
	Mon,  3 Jan 2022 19:26:06 +0100 (CET)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mail.librecores.org (Postfix) with ESMTPS id 5482F2432D
 for <openrisc@lists.librecores.org>; Mon,  3 Jan 2022 19:26:04 +0100 (CET)
Received: by mail-qt1-f181.google.com with SMTP id j17so31282631qtx.2
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 10:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zj7gh6cI8n9QdEhvr8VZxOMeqzosSa5P9eXXifr6Y58=;
 b=uL5QxKYIkU8DpSH98003jJl6PEU1RNxxaKbcTEV1dz1G7o76lGsoDYNqnmoY0Y3Q5y
 oeyNnJsW3MaqX/v+4HtNPyyHvKxpMV1mejwXx0APnY4Z47Ws82+tOspW30qhunOB0V1r
 h6499oSt0KqpCy+KADoO5TaufNe+m6xFjUgKcKtJg/rwPqdNSobTLD8fJWjHBBc6c/73
 7NTnSVu84Ar5PajVZB3iIqtXkWekP9NHyfBC6ewhvS4yDC4NCqcNjy3WMx0wj64ZK0V/
 WqKDc3yV1Sf0qNDDieI0kJD6t/pzUrb0xFAfs3F4v5q8is4ThLd3AycZPFC8eaF3WY7d
 W92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zj7gh6cI8n9QdEhvr8VZxOMeqzosSa5P9eXXifr6Y58=;
 b=Hb1XkhPvaPjnTvw3niWEqmaXAxWHKHwYy5LOWEqJotBBLY83f6XlkX6RjNfYUkW/Tz
 VsJcb8z2/wwEZky2KGpF3yXz+EEjI5Ejmae5EJgu/7/ziq4qKSt0mluoud6iI+18dIu/
 LBJzeORr86YRTXSOfTS+QhnQz+TmzUAlZAJBsb81+LOZ0kIq+Zd8e/upvDiuqsd47qvO
 8aLd/L7razxlfd5/PhEOcugfoFc0p7Urhb+1XYwvxW0tp2n8BZ/7y9aa+Dt1CaWQ+Wjs
 IcFV7n/YX3MBlh9s7qLbnBHFs1DgLBcBcfBNQB11WCbe5WSwkkLfR5Q/iKuzCV9Ru2/2
 kpTA==
X-Gm-Message-State: AOAM533Ri0Hizf9sdgRHjNUf6XCAmeEPkqcG4ULS4rYLAthhIGKvTzEN
 BDyGS6Jj/USCp07jL/XG91gAKA==
X-Google-Smtp-Source: ABdhPJzW2dSQven3kNDy/lSHV0VBJR+BlaaCFysLY7kvsBS6opeWz+P5T8wezM+puI7BPXA6logXJA==
X-Received: by 2002:ac8:5e0a:: with SMTP id h10mr41413571qtx.241.1641234363344; 
 Mon, 03 Jan 2022 10:26:03 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:a350:6969:50a8:eab8:8f2f?
 ([2804:431:c7ca:a350:6969:50a8:eab8:8f2f])
 by smtp.gmail.com with ESMTPSA id q27sm22697377qki.100.2022.01.03.10.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:26:03 -0800 (PST)
Message-ID: <a853a130-09c9-68a0-0029-74b859a7af35@linaro.org>
Date: Mon, 3 Jan 2022 15:26:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211229044251.2203653-1-shorne@gmail.com>
 <20211229044251.2203653-13-shorne@gmail.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
In-Reply-To: <20211229044251.2203653-13-shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH v4 12/13] build-many-glibcs.py: add OpenRISC
 support
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

CkxHVE0sIHRoYW5rcy4KClJldmlld2VkLWJ5OiBBZGhlbWVydmFsIFphbmVsbGEgIDxhZGhlbWVy
dmFsLnphbmVsbGFAbGluYXJvLm9yZz4KCk9uIDI5LzEyLzIwMjEgMDE6NDIsIFN0YWZmb3JkIEhv
cm5lIHZpYSBMaWJjLWFscGhhIHdyb3RlOgo+IC0tLQo+ICBzY3JpcHRzL2J1aWxkLW1hbnktZ2xp
YmNzLnB5IHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkgYi9zY3JpcHRzL2J1aWxk
LW1hbnktZ2xpYmNzLnB5Cj4gaW5kZXggYjgzYmMxNTlmZC4uYWQ2ZTU5MTNlNCAxMDA3NTUKPiAt
LS0gYS9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5Cj4gKysrIGIvc2NyaXB0cy9idWlsZC1t
YW55LWdsaWJjcy5weQo+IEBAIC0zMzUsNiArMzM1LDEwIEBAIGNsYXNzIENvbnRleHQob2JqZWN0
KToKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ2Njb3B0cyc6ICctbWFiaT02
NCd9XSkKPiAgICAgICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0nbmlvczInLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnKQo+ICsgICAgICAgIHNlbGYuYWRk
X2NvbmZpZyhhcmNoPSdvcjFrJywKPiArICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0n
bGludXgtZ251JywKPiArICAgICAgICAgICAgICAgICAgICAgICAgdmFyaWFudD0nc29mdCcsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIGdjY19jZmc9WyctLXdpdGgtbXVsdGlsaWItbGlzdD1t
Y21vdiddKQo+ICAgICAgICAgIHNlbGYuYWRkX2NvbmZpZyhhcmNoPSdwb3dlcnBjJywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0nbGludXgtZ251JywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgZ2NjX2NmZz1bJy0tZGlzYWJsZS1tdWx0aWxpYicsICctLWVuYWJsZS1zZWN1
cmVwbHQnXSwKPiBAQCAtMTI3MSw2ICsxMjc1LDcgQEAgZGVmIGluc3RhbGxfbGludXhfaGVhZGVy
cyhwb2xpY3ksIGNtZGxpc3QpOgo+ICAgICAgICAgICAgICAgICAgJ21pY3JvYmxhemUnOiAnbWlj
cm9ibGF6ZScsCj4gICAgICAgICAgICAgICAgICAnbWlwcyc6ICdtaXBzJywKPiAgICAgICAgICAg
ICAgICAgICduaW9zMic6ICduaW9zMicsCj4gKyAgICAgICAgICAgICAgICAnb3Ixayc6ICdvcGVu
cmlzYycsCj4gICAgICAgICAgICAgICAgICAncG93ZXJwYyc6ICdwb3dlcnBjJywKPiAgICAgICAg
ICAgICAgICAgICdzMzkwJzogJ3MzOTAnLAo+ICAgICAgICAgICAgICAgICAgJ3Jpc2N2MzInOiAn
cmlzY3YnLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

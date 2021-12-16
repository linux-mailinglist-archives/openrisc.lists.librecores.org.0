Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 68405477CB8
	for <lists+openrisc@lfdr.de>; Thu, 16 Dec 2021 20:43:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1D34D242EC;
	Thu, 16 Dec 2021 20:43:58 +0100 (CET)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mail.librecores.org (Postfix) with ESMTPS id 86843242E7
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 20:43:56 +0100 (CET)
Received: by mail-qt1-f178.google.com with SMTP id t34so329423qtc.7
 for <openrisc@lists.librecores.org>; Thu, 16 Dec 2021 11:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ipqp2ss9wsFtgs2Zf9MrnBAOfpfLIZ9MjCxS9DZTteQ=;
 b=javsNcaziOTduRjq7/5Xro/dFtq9s9O0VWnu4a/VkSue95CgiyufP5dJ2ZIFWxLqYM
 rAnEWvymqr22c95Tw95ADhhYLKyi1AZUBzlepoKw5pA0EcZ9DtxziKNx9w5KbSoaSrw+
 t1fUvEUielKRu35ju1vL9RKj/PacBM++fA5Fh6rzb51apX5voKGiw2DQvMf3SIiwKlDn
 bOico5isVclUJhjTYwHjnaVXjSvbE4Jsey4WTZSyKIH2fRcg9H2lNPLnvDAEqxQ6RgUF
 TKUwGssfSf4s5R+ImEvfwGHiwROYcKAXHqzK5U8weXS5op8CTGOt9tg99Z9wJmCdEayd
 tozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ipqp2ss9wsFtgs2Zf9MrnBAOfpfLIZ9MjCxS9DZTteQ=;
 b=6f6sBFUZVgYZ9zKC5IDZ8qvUDaIMYHL55TzgF3XtkitZiJsk10J8KuiRxQKv+7GjgI
 WTPjarukesgNRBpF/yJOPRhN6mkhthUrYtRtAmAZrepRk26tEmZ3f9VrVD2sIQa/6ebM
 vfOmWNPw2XDeOSrNAOy5QT2Sfqf6KMxDUo2Ni5FCyDuYtnQekRG1NHdhejzESMmWa0Wc
 ltG8UfC92U/vuW0AH7QrkWsOJmX1s9v6f3+STHkavnRGhBZGGJUkcP5MOTclCBM/HCKO
 r3lBxm7v3dmlhrSmcdhQwW8aoxKa+hb7aO7HR8Xa1t3Upw5h8edx06ao574jtdCF9k8a
 3Y2Q==
X-Gm-Message-State: AOAM532NPhIdjaditzbmt/ur0pJfWGNZS8RiI8wUQipiKIBGx3NdhnT/
 hg8AoBPMKIQ3BX7gTluGSnrjaw==
X-Google-Smtp-Source: ABdhPJwE0pIp0jXDAZ+YPA+CDfcg4734s5MsV7uuXruicPVl686O0y8O6R9EAyROfPwusZr+hjOR/A==
X-Received: by 2002:ac8:5e12:: with SMTP id h18mr18710927qtx.143.1639683835374; 
 Thu, 16 Dec 2021 11:43:55 -0800 (PST)
Received: from ?IPV6:2804:431:c7ca:103f:96e9:fe91:2aff:a44d?
 ([2804:431:c7ca:103f:96e9:fe91:2aff:a44d])
 by smtp.gmail.com with ESMTPSA id g5sm3554295qko.12.2021.12.16.11.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:43:54 -0800 (PST)
Message-ID: <3facf07d-85b9-7ccc-eee5-78be8dc69f45@linaro.org>
Date: Thu, 16 Dec 2021 16:43:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
To: Stafford Horne <shorne@gmail.com>,
 GLIBC patches <libc-alpha@sourceware.org>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <20211210233456.4146479-7-shorne@gmail.com>
 <39803fe3-ab39-524a-c678-1b74d092c436@linaro.org>
In-Reply-To: <39803fe3-ab39-524a-c678-1b74d092c436@linaro.org>
Subject: Re: [OpenRISC] [PATCH v3 06/13] or1k: Atomics and Locking primitives
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

CgpPbiAxNi8xMi8yMDIxIDA5OjUyLCBBZGhlbWVydmFsIFphbmVsbGEgd3JvdGU6Cj4gTEdUTSwg
dGhhbmtzLgo+IAo+IE9uIDEwLzEyLzIwMjEgMjA6MzQsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJj
LWFscGhhIHdyb3RlOgo+PiAtLS0KPj4gIHN5c2RlcHMvb3Ixay9hdG9taWMtbWFjaGluZS5oIHwg
NzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3OSBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3lzZGVwcy9vcjFrL2F0
b21pYy1tYWNoaW5lLmgKPj4KPj4gZGlmZiAtLWdpdCBhL3N5c2RlcHMvb3Ixay9hdG9taWMtbWFj
aGluZS5oIGIvc3lzZGVwcy9vcjFrL2F0b21pYy1tYWNoaW5lLmgKPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMWUzMDZhZTRlZgo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL3N5c2RlcHMvb3Ixay9hdG9taWMtbWFjaGluZS5oCj4+IEBAIC0wLDAgKzEsNzkgQEAK
Pj4gKy8qIEF0b21pYyBvcGVyYXRpb25zLiAgT3BlblJJU0MgdmVyc2lvbi4KPj4gKyAgIENvcHly
aWdodCAoQykgMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KPj4gKyAgIFRoaXMg
ZmlsZSBpcyBwYXJ0IG9mIHRoZSBHTlUgQyBMaWJyYXJ5Lgo+PiArCj4+ICsgICBUaGUgR05VIEMg
TGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IK
Pj4gKyAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJh
bCBQdWJsaWMKPj4gKyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247IGVpdGhlcgo+PiArICAgdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UsIG9y
IChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4+ICsKPj4gKyAgIFRoZSBHTlUg
QyBMaWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2Vm
dWwsCj4+ICsgICBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1w
bGllZCB3YXJyYW50eSBvZgo+PiArICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEg
UEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKPj4gKyAgIExlc3NlciBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4+ICsKPj4gKyAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKPj4gKyAg
IExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeS4gIElmIG5vdCwgc2VlCj4+ICsg
ICA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KPj4gKwo+PiArI2lmbmRlZiBf
X09SMUtfQVRPTUlDX0hfCj4+ICsjZGVmaW5lIF9fT1IxS19BVE9NSUNfSF8KPj4gKwo+PiArI2lu
Y2x1ZGUgPHN0ZGludC5oPgo+PiArCj4+ICt0eXBlZGVmIGludDMyX3QgYXRvbWljMzJfdDsKPj4g
K3R5cGVkZWYgdWludDMyX3QgdWF0b21pYzMyX3Q7Cj4+ICsKPj4gK3R5cGVkZWYgaW50cHRyX3Qg
YXRvbWljcHRyX3Q7Cj4+ICt0eXBlZGVmIHVpbnRwdHJfdCB1YXRvbWljcHRyX3Q7Cj4+ICt0eXBl
ZGVmIGludG1heF90IGF0b21pY19tYXhfdDsKPj4gK3R5cGVkZWYgdWludG1heF90IHVhdG9taWNf
bWF4X3Q7Cj4gCj4gU2lnaCwgdGhlc2UgZGVmaW5pdGlvbiBhcmUgdXNlZCBzb2xlbHkgaW4gb25s
eSBmaWxlLCBtZW11c2FnZS5jLiAgQW5vdGhlciB0aGluZwo+IEkgd2lsbCBjbGVhbnVwLgoKSSBq
dXN0IHNlbmQgYSBwYXRjaHNldCB0aGF0IGFpbXMgdG8gc2ltcGxpZnkgdGhpcyBib2lsZXJwbGF0
ZSBbMV0uICBJdCBzaG91bGQKYWxzbyBzaW1wbGlmeSBvdGhlciBwYXJ0cyBvZiBPcGVuUklTQyBz
dWJtaXNzaW9uLgoKWzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2xpYmMtYWxw
aGEvMjAyMS1EZWNlbWJlci8xMzQyODUuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

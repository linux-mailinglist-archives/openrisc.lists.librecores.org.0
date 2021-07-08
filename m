Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8787D3C1B2C
	for <lists+openrisc@lfdr.de>; Thu,  8 Jul 2021 23:44:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 40B2823F0B;
	Thu,  8 Jul 2021 23:44:41 +0200 (CEST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id E5B8E211E4
 for <openrisc@lists.librecores.org>; Thu,  8 Jul 2021 23:44:38 +0200 (CEST)
Received: by mail-pj1-f47.google.com with SMTP id
 b8-20020a17090a4888b02901725eedd346so4862297pjh.4
 for <openrisc@lists.librecores.org>; Thu, 08 Jul 2021 14:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yU1IcWvsLcuOjJ2vDcsLCX0JhDPlJVpMrHBlrG06dNc=;
 b=C+TA5FGe4jPnyD/YpHDcIXX1mFW42XkduOVKxIb3OcfHjTt8Ns6/AUeUsi4p6ByO1c
 aUg69hEY7ZV/zlbFGH7HwOsosi9KHXq2M6qcB9tPoGfKbJYwJuXziIXKq7unFlPM5RuQ
 RU9g0h4Kh36kW6/glZMnsXkry79Cll80gV16UO+a3pUYkjdBGnf8+/HIHv6VvQdXJMM6
 XSk9U+IYdrZ7zHWNnxu6JFfcjSZg93guhh7yEre6jvw3/u2HX7N5tqEBppirG5ikLfLT
 1VMIYZT4ERjgbjzwB7HCauY83nUxBCOQ7iZ/K1PEJisDSvFJVoztLrVa5tLn9j73/PnZ
 Lb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yU1IcWvsLcuOjJ2vDcsLCX0JhDPlJVpMrHBlrG06dNc=;
 b=Be8odY3CcMJ4dT9iRFE9KJvc9E9D6zPh1l96IPjk6A4PdtfZ9Kscns5FGNNuwQNT4v
 5MdRqRyngOWxDYnVGrnMTTKXRztGEoZqyIdf4PPUgTkxmAq1xWaXX5bxT7LIStumLLPz
 Wm+Mg+yF9DzLdS9Aj8BA8n8huJMF45ZNb8/WCab+LQ0zURoUDFIKhv2uUKaoCL6ySVjK
 IxLMMHiVXjM8S/b+Hl5uiZwSVFiv0X5pG+6Dk5GpgQxL0RN6Eg1f8i6mRv72rEFmDOSv
 7UZ9tkMRI5mRMuEz3MUxvGaQamfXRnSBw++TUNXqCgDpRdN4qPqkjXYKI93fvSy3S8Rz
 AMtQ==
X-Gm-Message-State: AOAM531o7gvnZt3G3CsZmsMYDvFzfVvyr+j63ex2RblUmCnhWZR2T0+K
 YwigQpOsfAGmzhY89PKE988=
X-Google-Smtp-Source: ABdhPJzrWmnPFYiMXobrxdQ23F1vaatYEfWuNvZJTQdnHVgSaOBBsfzL+Zg8UTf30VnHsSEgn5WZjg==
X-Received: by 2002:a17:90a:a107:: with SMTP id s7mr6878663pjp.1.1625780677281; 
 Thu, 08 Jul 2021 14:44:37 -0700 (PDT)
Received: from localhost (g164.115-65-218.ppp.wakwak.ne.jp. [115.65.218.164])
 by smtp.gmail.com with ESMTPSA id
 u2sm3789633pfh.61.2021.07.08.14.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:44:36 -0700 (PDT)
Date: Fri, 9 Jul 2021 06:44:34 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <YOdxwtNeQ2eUr+L3@antec>
References: <dbcce22d-b288-2451-4a8d-681f802c6f49@benettiengineering.com>
 <CAAfxs77Y1qOzex=Bkn5c_4Zxt6nzZP2cpG6qJ85eXnrAm18FgA@mail.gmail.com>
 <6bc67759-18c2-bca5-bdb2-c637e873b8ab@benettiengineering.com>
 <YMvdpzYqcwNzAeQ/@antec> <YOYXPQENdaFWobWO@antec>
 <942dec94-e7e6-33d6-84e6-715e5e368c98@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <942dec94-e7e6-33d6-84e6-715e5e368c98@linaro.org>
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Openrisc <openrisc@lists.librecores.org>,
 GNU Binutils <binutils@sourceware.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBKdWwgMDcsIDIwMjEgYXQgMDI6MjU6MzlQTSAtMDcwMCwgUmljaGFyZCBIZW5kZXJz
b24gd3JvdGU6Cj4gT24gNy83LzIxIDI6MDYgUE0sIFN0YWZmb3JkIEhvcm5lIHdyb3RlOgo+ID4g
K0NDIFJpY2hhcmRzIG90aGVyIGFjY291bnQKPiA+IAo+ID4gSGkgUmljaGFyZCwKPiA+IAo+ID4g
SSBDY2VkIHRoaXMgdG8geW91IHR3aWRkbGUubmV0IGFjY291bnQgeW91IG9uIHRoaXMgb25lIG9y
aWdpbmFsbHkuIERvIHlvdSByZWNhbGwKPiA+IHdoeSB3ZSBhZGRlZCB0aGUgYmVsb3cgY2hlY2sg
aW4gb3IxayBiZmQ/ICBJdCBzZWVtcyB0byBiZSBvdmVybHkgcmVzdHJpY3RpdmUgYW5kCj4gPiBj
YXVzaW5nIHNvbWUgaXNzdWVzIGJlbG93Lgo+ID4gCj4gPiAgIGNhc2UgUl9PUjFLX0lOU05fUkVM
XzI2Ogo+ID4gICAgIGlmIChiZmRfbGlua19waWMgKGluZm8pICYmICFTWU1CT0xfUkVGRVJFTkNF
U19MT0NBTCAoaW5mbywgaCkpCj4gPiAgICAgICBFUlJPUgo+IC4uLgo+ID4gPiA0LiBUaGUgc3lt
Ym9scyBhcmUgZnJvbSBgcmVhZGVsZiAtc2A6Cj4gPiA+IAo+ID4gPiAgICAgMjIxOiAwMDAwOGNl
NCAgIDcxNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBhbFNvdXJjZVBhdXNldgo+ID4g
PiAgICAgMjIyOiAwMDAwOGZiMCAgICAzNiBGVU5DICAgIEdMT0JBTCBQUk9URUNURUQgICAyNCBh
bFNvdXJjZVBhdXNlCj4gPiA+ICAgICAyMjM6IDAwMDA4ZmQ0ICAgNzg0IEZVTkMgICAgR0xPQkFM
IFBST1RFQ1RFRCAgIDI0IGFsU291cmNlU3RvcHYKPiA+ID4gICAgIDIyNDogMDAwMDkyZTQgICAg
MzYgRlVOQyAgICBHTE9CQUwgUFJPVEVDVEVEICAgMjQgYWxTb3VyY2VTdG9wCj4gPiA+ICAgICAy
MjU6IDAwMDA5MzA4ICAgNzIwIEZVTkMgICAgR0xPQkFMIFBST1RFQ1RFRCAgIDI0IGFsU291cmNl
UmV3aW5kdgo+ID4gPiAgICAgMjI2OiAwMDAwOTVkOCAgICAzNiBGVU5DICAgIEdMT0JBTCBQUk9U
RUNURUQgICAyNCBhbFNvdXJjZVJld2luZAo+IAo+IEFoLCBTVFZfUFJPVEVDVEVELiAgVW51c3Vh
bC4KPiAKPiBJdCBsb29rcyBsaWtlIHRoaXMgc2hvdWxkIGJlIFNZTUJPTF9DQUxMU19MT0NBTC4g
IFRoZSBvbmx5IGRpZmZlcmVuY2UgZnJvbQo+IFNZTUJPTF9SRUZFUkVOQ0VTX0xPQ0FMIGlzIHZl
cnN1cyBwcm90ZWN0ZWQgc3ltYm9scy4KClRoYW5rcyBSaWNoYXJkLgoKSSB3aWxsIHBvc3QgYSBw
YXRjaCBmb3IgdGhpcyBpbiBhIGZldyBkYXlzLiAgT3IsIG1heWJlIEdpdWxpbyBjYW4gZG8gaXQg
aWYgaGUKaGFzIHRpbWUuCgotU3RhZmZvcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

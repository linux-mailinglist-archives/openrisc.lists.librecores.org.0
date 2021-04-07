Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B321135785F
	for <lists+openrisc@lfdr.de>; Thu,  8 Apr 2021 01:19:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 46958212CF;
	Thu,  8 Apr 2021 01:19:24 +0200 (CEST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mail.librecores.org (Postfix) with ESMTPS id DD36B20300
 for <openrisc@lists.librecores.org>; Thu,  8 Apr 2021 01:19:21 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id l123so426122pfl.8
 for <openrisc@lists.librecores.org>; Wed, 07 Apr 2021 16:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FWMwcIAIJpvhQyQCMu0Mqo4A8mr/mzl3+J4HHQRQ77A=;
 b=u+Y0Gx42rEMkV3t48J6/oy9C8tSLdWmpGNqDjhxkyFbjDf1eVGRZlqzW8+uHD2C9RW
 ARuyDyW0Hy3qU2Qc4ARD1o0idJZJKfMH6G+qMEd5wZpalsQ9HiWQiL/tz/NSficJnPRg
 KlZsWskLIePQ5l7vVMgMjxU/gmDmrKOacZRPSvlgq/15r8r30cfnoY42LHV22azc8+qP
 aIl5986Rdqg7BvTHsr1yyXusx4Qc1+Ti63D5vTy2UGkz1cCscqHqLsMLpOEl75C18s6b
 9hHk5UlnKrGK37npCOCHOioZMJs5ESAakVXx50x7REAsMuZUJ5PAFdj+cN3zSdOls6hG
 s5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FWMwcIAIJpvhQyQCMu0Mqo4A8mr/mzl3+J4HHQRQ77A=;
 b=kmDyffzDl6Jrngpio7haMOnbg8gPW2K6i3nWpSVNEOp2Ogf6AH/7h8+mM3HFp3zJPf
 XNDMya2DB5IiDqoLEGe4Y086us4ha46ZbjD2wvuaaB6jRjECqAyKrWZKG9nzZN0m+4YD
 RPHSETDdnCZ6mE0DP0PyD5Yd5XIHMdIK8LfYXkISDKiNRNBOeTc4IKw+R0OW4xGNGbIk
 yxJhK1oOZBvOKnrMQ/C0JaBH/aTL54O7IdrCRnhg46D6y5VjIm8qor538/0Dbavhka21
 e3J0A0ViDgT+IIIRRUqp9huPvLeRP/h4Y5Ns6e9anBpKhEk9lyyDJbGfxGJ7Q1uldqXK
 nrEQ==
X-Gm-Message-State: AOAM531FXLY/Ir0sIG2LfgmMmZlV1onmkNRwTExrjt5e/R9aym3u0kqb
 vjEDXrW4ndLQfDmLt5/omJA=
X-Google-Smtp-Source: ABdhPJxFnfDJZuD4i3ilQsCfrF2TCcnhLu1yQYYZyXKLAeSs1oO1/4b5BhRKAJXwsSnGb2vCWaTl2g==
X-Received: by 2002:a05:6a00:214d:b029:218:4f9:d5ba with SMTP id
 o13-20020a056a00214db029021804f9d5bamr5034341pfk.3.1617837560230; 
 Wed, 07 Apr 2021 16:19:20 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 b140sm23230734pfb.98.2021.04.07.16.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 16:19:19 -0700 (PDT)
Date: Thu, 8 Apr 2021 08:19:17 +0900
From: Stafford Horne <shorne@gmail.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20210407231917.GI3288043@lianli.shorne-pla.net>
References: <20210304210747.3679483-1-shorne@gmail.com>
 <bd106f14-c773-a4a8-2f43-2e269f4f04e4@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd106f14-c773-a4a8-2f43-2e269f4f04e4@pengutronix.de>
Subject: Re: [OpenRISC] [PATCH] Documentation: Add qemu instructions for
 OpenRISC
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
Cc: Barebox <barebox@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBBcHIgMDQsIDIwMjEgYXQgMDg6NDY6MDRQTSArMDIwMCwgQWhtYWQgRmF0b3VtIHdy
b3RlOgo+IEhlbGxvIFNhc2NoYSwKPiAKPiBPbiAwNC4wMy4yMSAyMjowNywgU3RhZmZvcmQgSG9y
bmUgd3JvdGU6Cj4gPiBNb3N0IGRldmVsb3BlcnMgaGF2ZSBxZW11IGFuZCByYXRoZXIgbm90IGRv
d25sb2FkIGFuZCBpbnN0YWxsIHRoZQo+ID4gb3Ixa3NpbS4gIEFsc28sIHRoaXMgYWRkcyBkZXRh
aWxzIG9uIGhvdyB0byBnZXQgYSBvcGVucmlzYyB0b29sY2hhaW4uCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IAo+IEkgZG9uJ3Qgc2Vl
IHRoaXMgaW4gbmV4dC4KPiAKPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vYm9hcmRzL29wZW5y
aXNjLnJzdCB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9ib2FyZHMvb3BlbnJpc2MucnN0IGIvRG9jdW1lbnRhdGlvbi9ib2FyZHMvb3BlbnJpc2Mu
cnN0Cj4gPiBpbmRleCBmOWQ2N2Y5NjUuLjM0NTg2YjRhNyAxMDA2NDQKPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vYm9hcmRzL29wZW5yaXNjLnJzdAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9ib2Fy
ZHMvb3BlbnJpc2MucnN0Cj4gPiBAQCAtMSw2ICsxLDc0IEBACj4gPiAgT3BlblJJU0MKPiA+ICA9
PT09PT09PQo+ID4gIAo+ID4gK09wdGFpbmluZyBhbiBPcGVuUklTQyB0b29sY2hhaW4KPiAKPiBD
b3VsZCB5b3UgZml4IHVwIHMvT3B0YWluaW5nL09idGFpbmluZy8gd2hpbGUgYXQgaXQ/CgpJdCBs
b29rcyBsaWtlIHlvdSBndXlzIGFyZSBoYW5kbGluZyBpdCwgYnV0IHBsZWFzZSBsZXQgbWUga25v
dyBpZiB0aGVyZSBpcwphbnl0aGluZyBlbHNlIEkgY2FuIGRvLgoKLVN0YWZmb3JkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

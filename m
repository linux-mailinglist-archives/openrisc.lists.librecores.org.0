Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E348F3CCD25
	for <lists+openrisc@lfdr.de>; Mon, 19 Jul 2021 06:38:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A1E4B211CC;
	Mon, 19 Jul 2021 06:38:20 +0200 (CEST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mail.librecores.org (Postfix) with ESMTPS id D6A8E211CC
 for <openrisc@lists.librecores.org>; Mon, 19 Jul 2021 06:38:17 +0200 (CEST)
Received: by mail-pg1-f178.google.com with SMTP id a6so10468778pgw.3
 for <openrisc@lists.librecores.org>; Sun, 18 Jul 2021 21:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nRiPjpHg8p/fI+JBr5UGxn/81/0ZwiuSlfZGEmNldAM=;
 b=fLdEDtA6uh3yfIM/JL1hdXhuMOh8XsGkXWhbuiRJMzjwf76dgBOJV4APlr/5Giy5gY
 ZhSMYctYE+RbXvrnESdksrVYx2Z1AUQWiXBc6u5ov721th1+drCFo0PyYerMBcQiIhLZ
 K9P571JObcfRRaGQ8ZcMm9ldqkURJJ7WRsOF62euZ2WSmo5hQfk5jrYqjxslKG+AWjSn
 yWJ7U491Gs7dkbHo3gY/KNEc7kW66cO/wU2XaYXNN1QCNh4TN/2uUWK6aXeoKLnUDITJ
 9BdN0X2wcSxG/C1vMgNCK44ECdkqIUhREyYAorRQC66OgymqS9AhGzX5lTobV5oHNs65
 AAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nRiPjpHg8p/fI+JBr5UGxn/81/0ZwiuSlfZGEmNldAM=;
 b=lDkKYN4IjnCjt1O8OAXMaMxA9QF2gAAo9/EAfpAljK6Bl9NAVC6s2B1cpYGgCQNbNx
 I+4ZKCVGtlosVnAiVo8BH+IiT41SKXIFgGOW7gqqYw6BR68+mktkMqo2luVmUcUWitN8
 Zbfl7aB2WpuVDWfAwaZDiyLuuc7E4o/8NH+7wsCvj48gzGRKSBQdgiq92JYFhw11OUQp
 6c2xTxHu9yuwmUJflZf76N3yzW1hxhOZ2Ul2in2oSnmqU3mht1E08CF1rzV6h6b3hWSl
 mapEqqv5Tf1oBObH7A2Kmm0paaNVbj9avNV62wEt12urGZOYr3nxb/705I0fSsFlVOjt
 gTdQ==
X-Gm-Message-State: AOAM533lXk6o/958Q6AYMHcYEdMo9TTLXSeFFA0vIHfJoSPSVjOIfwza
 KJ+rwbgO2XAJ6QKzP8KB91Y=
X-Google-Smtp-Source: ABdhPJzlcLQwXaGWEF3q8oEEpv1Sb+88fgtObzKglj42hW5K06OZ0OaO77yQhbPswNPIUCeq9lwfAA==
X-Received: by 2002:a63:5809:: with SMTP id m9mr7460587pgb.342.1626669496154; 
 Sun, 18 Jul 2021 21:38:16 -0700 (PDT)
Received: from localhost (g142.61-125-55.ppp.wakwak.ne.jp. [61.125.55.142])
 by smtp.gmail.com with ESMTPSA id e30sm20659037pga.63.2021.07.18.21.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 21:38:15 -0700 (PDT)
Date: Mon, 19 Jul 2021 13:38:13 +0900
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <YPUBtf2OvD9Y017n@antec>
References: <20210719023309.15808-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719023309.15808-1-rdunlap@infradead.org>
Subject: Re: [OpenRISC] [PATCH] openrisc: don't printk() unconditionally
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMDc6MzM6MDlQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOgo+IERvbid0IGNhbGwgcHJpbnRrKCkgd2hlbiBDT05GSUdfUFJJTlRLIGlzIG5vdCBzZXQu
Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnM6Cj4gCj4gb3Ixay1saW51eC1sZDog
YXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkubzogaW4gZnVuY3Rpb24gYF9leHRlcm5hbF9pcnFf
aGFuZGxlcic6Cj4gKC50ZXh0KzB4ODA0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgcHJpbnRr
Jwo+ICgudGV4dCsweDgwNCk6IHJlbG9jYXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9PUjFLX0lO
U05fUkVMXzI2IGFnYWluc3QgdW5kZWZpbmVkIHN5bWJvbCBgcHJpbnRrJwo+IAo+IEZpeGVzOiA5
ZDAyYTQyODNlOWMgKCJPcGVuUklTQzogQm9vdCBjb2RlIikKPiBTaWduZWQtb2ZmLWJ5OiBSYW5k
eSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KClRoYW5rcyEKClRoaXMgbG9va3MgT0sg
dG8gbWUsIEkgd2lsbCBxdWV1ZSBpdCBmb3IgNS4xNSB1bmxlc3MgYW55b25lIHRoaW5rcyBpdCBz
aG91bGQgZ28KaW4gbm93LgoKLVN0YWZmb3JkCgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4KPiBDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNl
Pgo+IENjOiBTdGVmYW4gS3Jpc3RpYW5zc29uIDxzdGVmYW4ua3Jpc3RpYW5zc29uQHNhdW5hbGFo
dGkuZmk+Cj4gQ2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+IENjOiBvcGVu
cmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IC0tLQo+ICBhcmNoL29wZW5yaXNjL2tlcm5lbC9l
bnRyeS5TIHwgICAgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4g
LS0tIGxpbnV4LW5leHQtMjAyMTA3MTYub3JpZy9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5T
Cj4gKysrIGxpbnV4LW5leHQtMjAyMTA3MTYvYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUwo+
IEBAIC01NDcsNiArNTQ3LDcgQEAgRVhDRVBUSU9OX0VOVFJZKF9leHRlcm5hbF9pcnFfaGFuZGxl
cikKPiAgCWwuYm5mCTFmCQkJLy8gZXh0IGlycSBlbmFibGVkLCBhbGwgb2suCj4gIAlsLm5vcAo+
ICAKPiArI2lmZGVmIENPTkZJR19QUklOVEsKPiAgCWwuYWRkaSAgcjEscjEsLTB4OAo+ICAJbC5t
b3ZoaSByMyxoaSg0MmYpCj4gIAlsLm9yaQlyMyxyMyxsbyg0MmYpCj4gQEAgLTU2MCw2ICs1NjEs
NyBAQCBFWENFUFRJT05fRU5UUlkoX2V4dGVybmFsX2lycV9oYW5kbGVyKQo+ICAJCS5zdHJpbmcg
IlxuXHJFU1IgaW50ZXJydXB0IGJ1ZzogaW4gX2V4dGVybmFsX2lycV9oYW5kbGVyIChFU1IgJXgp
XG5cciIKPiAgCQkuYWxpZ24gNAo+ICAJLnByZXZpb3VzCj4gKyNlbmRpZgo+ICAKPiAgCWwub3Jp
CXI0LHI0LFNQUl9TUl9JRUUJLy8gZml4IHRoZSBidWcKPiAgLy8JbC5zdwlQVF9TUihyMSkscjQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A37C847E910
	for <lists+openrisc@lfdr.de>; Thu, 23 Dec 2021 22:26:57 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 23239242EB;
	Thu, 23 Dec 2021 22:26:57 +0100 (CET)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mail.librecores.org (Postfix) with ESMTPS id 405B324126
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 22:26:55 +0100 (CET)
Received: by mail-pg1-f174.google.com with SMTP id 2so5921026pgb.12
 for <openrisc@lists.librecores.org>; Thu, 23 Dec 2021 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HXDOjTIN+3v5iXMAJwjckqsAXorP+FtuEpepV7jIPxw=;
 b=Zm+yzMAN/+kQuJYdcbku8Pd7YnpGFJ+7IqUQU+PCMw7yFiBSsYj1FFJ7BbpVAuFo1Z
 Q+EcelnsCMU9kXJlhQ9OAnRbht0PifR4iWsy8apsZjbSmkTw9pyjtel8h9nx6wrax22U
 jXzJJAyZBv5mFM4fWUYDiMvrBYRscIH8jNzG7nr/mktTWEqnuTVz1dLEXuN3AOy0fcap
 ApMbt+9GSmSornYQK38JZmAgfSzeCUdMdASPs7QFXxXXfYHfj1xy85YHpSfIZC7raEzF
 jlhM7HQDjp9QgFdvpzHAVHafVtKmN6ofLe/rcTFPd1tKKEYmtcQOWTbnyp/C4IzEogp6
 fcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HXDOjTIN+3v5iXMAJwjckqsAXorP+FtuEpepV7jIPxw=;
 b=mufIs2ywhm7VKpBaWJRKVxIobNxBbBUCP+GXGQNEwy5+M3T4Q1ZH4ThFGLT64EbhwY
 I9UK3Cu1nHoNgBGvRX2TENviRnoQnCwJbWNuXciaNYB0Ib0hIH+cjOOrGXo8qvDX2aDc
 9yhj72PHP1xuiyIcu0ZPz15xfh4E7L4c2GQ2LEoeo+DVT8KCxXf3XVuFBpO4KgDAtWp1
 29pC2bSzjHMwHxOkTzNmIGvWkC0qopeE8cZn7tDnh3746czZlnTZIej5S4Nia4JxYwxx
 c80iObFf6njDoojfgDf05MPOjDrj5aBb+PvCL1W4h9sp1myXy7SQtJ/nlLz3oS+lt9HV
 KnBw==
X-Gm-Message-State: AOAM533HWzvgi66cNdwqTwFo9jkMhN3l2YlKnC1YhV78VhgKPO+urspG
 wcJQRl5mfB3uVQXb4rBLCOc=
X-Google-Smtp-Source: ABdhPJxy7Tg0KN5mSURO97DBFGpHe9fgYN8VZkR+eNBirJ/qW04STaXhA6lTPk/uOdTLJMB4VRzQ2A==
X-Received: by 2002:a63:5b4f:: with SMTP id l15mr3591687pgm.369.1640294813374; 
 Thu, 23 Dec 2021 13:26:53 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id x2sm5642664pgo.2.2021.12.23.13.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 13:26:52 -0800 (PST)
Date: Fri, 24 Dec 2021 06:26:50 +0900
From: Stafford Horne <shorne@gmail.com>
To: Andreas Schwab <schwab@linux-m68k.org>
Message-ID: <YcTpmhHaqS5KaFTG@antec>
References: <20211210233456.4146479-1-shorne@gmail.com>
 <cedcb34e-36e3-3bb8-07b7-8412c052b81d@linaro.org>
 <Ybl/E2BWBGRMwF0G@antec> <YcSZ0iyC6STzh9uP@antec>
 <87pmpnnwjf.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pmpnnwjf.fsf@igel.home>
Subject: Re: [OpenRISC] [PATCH v3 00/13] Glibc OpenRISC port
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
 Stafford Horne via Libc-alpha <libc-alpha@sourceware.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBEZWMgMjMsIDIwMjEgYXQgMDQ6NTc6NTZQTSArMDEwMCwgQW5kcmVhcyBTY2h3YWIg
d3JvdGU6Cj4gT24gRGV6IDI0IDIwMjEsIFN0YWZmb3JkIEhvcm5lIHZpYSBMaWJjLWFscGhhIHdy
b3RlOgo+IAo+ID4gSXQgc2VlbXMgdGhlIHdyaXRlIHRvIHRoZSB0bXAgZmlsZSB3YXMgZmFpbGlu
ZyBkdWUgdGhlIHJlLW9wZW4gbm90IHBhc3NpbmcKPiA+IE9fTEFSR0VGSUxFLgo+IAo+IG9wZW42
NCBpbXBsaWVzIE9fTEFSR0VGSUxFLCBzbyBpZiB0aGF0IGlzIG1ha2luZyBhIGRpZmZlcmVuY2Us
IHRoZW4geW91cgo+IG9wZW42NCBpcyBicm9rZW4uCgpSaWdodCwgdGhhdCBpcyB3aGF0IHRoZSBk
b2NzIHNheS4gIFRoaXMgYXJjaGl0ZWN1dHVyZSBpcyAzMi1iaXRzLgoKQW5kIHRoZSBvcGVuNjQg
cGF0aCBpcyBnZW5lcmljLgoKUG9zc2libHkgdGhpcyBiaXQgcmVtb3ZpbmcgT19MQVJHRUZJTEUg
aXMgd3Jvbmc/CgpJbiBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9vcGVuNjQuYzoKCiAgMjcgI2lm
ZGVmIF9fT0ZGX1RfTUFUQ0hFU19PRkY2NF9UCiAgMjggIyBkZWZpbmUgRVhUUkFfT1BFTl9GTEFH
UyAwCiAgMjkgI2Vsc2UKICAzMCAjIGRlZmluZSBFWFRSQV9PUEVOX0ZMQUdTIE9fTEFSR0VGSUxF
CiAgMzEgI2VuZGlmCgpPdGhlcndpc2UgdGhlcmUgaXMgc29tZXRoaW5nIGlzIHdyb25nIG9uIGxp
bnV4LiAgSXQgaXMgZXhwbGljaXRseSBjaGVja2luZwpmb3IgdGhlIHByZWNlbnNlIG9mIE9fTEFS
R0VGSUxFLgoKaW4gZnMvcmVhZF93cml0ZS5jIGluIGdlbmVyaWNfd3JpdGVfY2hlY2tfbGltaXRz
OgoKICAgICAgICBpZiAoIShmaWxlLT5mX2ZsYWdzICYgT19MQVJHRUZJTEUpKQogICAgICAgICAg
ICAgICAgbWF4X3NpemUgPSBNQVhfTk9OX0xGUzsKCj4gLS0gCj4gQW5kcmVhcyBTY2h3YWIsIHNj
aHdhYkBsaW51eC1tNjhrLm9yZwo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSA3NTc4IEVCNDcgRDRF
NSA0RDY5IDI1MTAgIDI1NTIgREY3MyBFNzgwIEE5REEgQUVDMQo+ICJBbmQgbm93IGZvciBzb21l
dGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

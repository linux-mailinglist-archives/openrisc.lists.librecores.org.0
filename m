Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4962121EDA1
	for <lists+openrisc@lfdr.de>; Tue, 14 Jul 2020 12:06:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DEABD20BAD;
	Tue, 14 Jul 2020 12:06:11 +0200 (CEST)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by mail.librecores.org (Postfix) with ESMTPS id DE2582090C
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 12:06:09 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id gc9so1347368pjb.2
 for <openrisc@lists.librecores.org>; Tue, 14 Jul 2020 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eYpCQfk/q2dXlOvqggXDmkrAf68vEnrgzdjskwoJL6M=;
 b=skKTE+CpIsdKXt3/0nlblro53GUANKxqNtTyG/+IjykwtXnPLWN2ztxla7THEHgzH7
 uGA61QgHlK6eFYdNEtt05P9FNTsqwXikvAR1Ha+CP/QySTYvzeYrAnHwE5yjRheYfkO/
 3BEh2FAMbrPvrpuECImvgbgZ1V5H1FpUGVxoZp2KucYUsnHYB4PLIulj4r4ENMZDvtJ8
 vV7uzdGS0DQcmvh9J7T0xybMq5uPoaoQP0Vevf+QkaRjV8Ou3Qz+9/sRjvMOuUjhtCGw
 0Qnud8/LutL7ucYLB4wlJBDecFp7+rv6x36+NC858rm/VBy1Rp3nADTExX47SdkXqxZJ
 hCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eYpCQfk/q2dXlOvqggXDmkrAf68vEnrgzdjskwoJL6M=;
 b=czVhXfo8a+CgNschwSQSne6ElyvU1gXSuihUMzVEAJFA/gatr98qjM4W0cacsAHaR4
 j4vq+M2+z7zI2RaIWOc7lOIS6B/nnZO6OEWsJSrfneWma1+vETj5Sa+epOZjdUYozHDV
 +E6ML8jd2Pfr0UCu8TwGlpo0X1n9K9Kxb0OeDlVpfbNjHtBaDsovb1+v1H6BtoCoOBdT
 5F4UkMWqMarWZNOncJBJpggD0FATnQrFib4qTEp6bsBY2ntecAWbh+z+LdURPV91+zbV
 QfSzZAjaIXbqQWKy+0VlXN8wP+T9hCu5udrJNy+2k+n07K1sZSsfjVIVX6hD/A98JbPT
 pazg==
X-Gm-Message-State: AOAM533HaPIwLE5RGgTSijpnEC3Sc0e91uwgEnd8kcyG35pX2021GOtG
 Pr76Wtffe53Q9G7OyUIELFc=
X-Google-Smtp-Source: ABdhPJztQv0rhQk5gYPwf/IdL9QA4paHfVHV8Ckv+UiFjvEVBFFyA/8krZQ1RQWQcTOCzHtMwAZ6UA==
X-Received: by 2002:a17:90a:ea0f:: with SMTP id
 w15mr3999097pjy.138.1594721167865; 
 Tue, 14 Jul 2020 03:06:07 -0700 (PDT)
Received: from localhost (g175.219-103-161.ppp.wakwak.ne.jp. [219.103.161.175])
 by smtp.gmail.com with ESMTPSA id l9sm2084386pjy.2.2020.07.14.03.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:05:55 -0700 (PDT)
Date: Tue, 14 Jul 2020 19:05:45 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200714100545.GD437393@lianli.shorne-pla.net>
References: <20200710062019.28755-1-grandmaster@al2klimov.de>
 <20200713113430.1c1777bb@lwn.net>
 <CAMuHMdXoUME_dCOZP1N0tXyMv61edfNECM4-n4NPa56YbBCncw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXoUME_dCOZP1N0tXyMv61edfNECM4-n4NPa56YbBCncw@mail.gmail.com>
Subject: Re: [OpenRISC] [PATCH] OPENRISC ARCHITECTURE: Replace HTTP links
 with HTTPS ones
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
Cc: Jonas Bonn <jonas@southpole.se>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdWwgMTQsIDIwMjAgYXQgMDk6MjI6MzlBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIE1vbiwgSnVsIDEzLCAyMDIwIGF0IDc6MzcgUE0gSm9uYXRoYW4gQ29y
YmV0IDxjb3JiZXRAbHduLm5ldD4gd3JvdGU6Cj4gPiBPbiBGcmksIDEwIEp1bCAyMDIwIDA4OjIw
OjE5ICswMjAwCj4gPiAiQWxleGFuZGVyIEEuIEtsaW1vdiIgPGdyYW5kbWFzdGVyQGFsMmtsaW1v
di5kZT4gd3JvdGU6Cj4gPiA+ICBEb2N1bWVudGF0aW9uL29wZW5yaXNjL29wZW5yaXNjX3BvcnQu
cnN0IHwgMiArLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL29wZW5yaXNjL29w
ZW5yaXNjX3BvcnQucnN0IGIvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVucmlzY19wb3J0LnJz
dAo+ID4gPiBpbmRleCA0YjJjNDM3OTQyYTAuLjY1N2FjNGFmN2JlNiAxMDA2NDQKPiA+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9vcGVucmlzYy9vcGVucmlzY19wb3J0LnJzdAo+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL29wZW5yaXNjL29wZW5yaXNjX3BvcnQucnN0Cj4gPiA+IEBAIC04LDcgKzgs
NyBAQCB0YXJnZXQgYXJjaGl0ZWN0dXJlLCBzcGVjaWZpY2FsbHksIGlzIHRoZSAzMi1iaXQgT3Bl
blJJU0MgMTAwMCBmYW1pbHkgKG9yMWspLgo+ID4gPiAgRm9yIGluZm9ybWF0aW9uIGFib3V0IE9w
ZW5SSVNDIHByb2Nlc3NvcnMgYW5kIG9uZ29pbmcgZGV2ZWxvcG1lbnQ6Cj4gPiA+Cj4gPiA+ICAg
ICAgID09PT09PT0gICAgICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gPiAt
ICAgICB3ZWJzaXRlICAgICAgICAgaHR0cDovL29wZW5yaXNjLmlvCj4gPiA+ICsgICAgIHdlYnNp
dGUgICAgICAgICBodHRwczovL29wZW5yaXNjLmlvCj4gPiA+ICAgICAgIGVtYWlsICAgICAgICAg
ICBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+ID4gPiAgICAgICA9PT09PT09ICAgICAg
ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+Cj4gPiBBcHBsaWVkLCB0aGFua3Mu
Cj4gCj4gSXMgdGhhdCBzaXRlIGFjY2Vzc2libGUgZm9yIGFueW9uZT8gSXQgdGltZXMgb3V0IGZv
ciBtZS4KPiAKCkl0IHNob3VsZCBiZSwgIEl0IHdhcyB3b3JraW5nIGEgZmV3IGRheXMgYWdvIHdo
ZW4gSSB1cGRhdGVkIGl0IGxhc3QuICBQZXJoYXBzCnRoZXJlIGlzIGFuIGlzc3VlIGNhdXNlZCBi
eSB0aGUgZ2l0aHViIG91dGFnZSB5ZXN0ZXJkYXkuICBJIHdpbGwgbG9vayBpbnRvIGl0LgoKLVN0
YWZmb3JkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

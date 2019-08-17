Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 685E697198
	for <lists+openrisc@lfdr.de>; Wed, 21 Aug 2019 07:30:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 94E92204C1;
	Wed, 21 Aug 2019 07:30:44 +0200 (CEST)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by mail.librecores.org (Postfix) with ESMTPS id 224D320264
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 23:22:17 +0200 (CEST)
Received: by mail-io1-f68.google.com with SMTP id o9so13245439iom.3
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
 b=CJVuNDGu30vfZIQhNtyqH+dgEouyhowB/pqTopdU55GkSITlHL0uKSvYQI8xfwB4KF
 b/uCqqA3AXKBIdWSBL/bm8atFw/BTbw6zCCCzTTokg/rSqwXa1cCfQMW6iusHpscU8Il
 0ZqX+tec6msmO1pwyfGqBVymy0nWOHfws7CGDoh79Fg0fctZqQK8Mql9QboplE1l26jI
 c7lYq5mvTGfbdlGkY9/A+2cUa+UcDH5vprCBHPJps3g09zIR/90rJ1p5sEuvA/RhvAOH
 Ua8oYgLyyo0AHKEUE5W/NGenZReiOCrCvLJt/QdP2CD/U0d1u2yrDe5h1Bhkwwdzihi3
 +qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
 b=HuKn3u5/2ouFSQMjfBtixXHpRutKNiW1++NsulwM9rDXyGtut2DhISRF+qeDWgFTgt
 l+0rQwqAbzXhsBr6Ubms47rz19IQPZUTUjy0MStkni25dwUOm5hQ+auTTR7OJJmmkoM0
 DJHZQysveN3XhyUcKL4uOjgmsWtQQmaryYJxgfH60kNah3zWp+0Ihqeo6boV+gldw/Aw
 ENjZoUdbzN0W/tXPZea/9v1nX7sD3JZmcjUzjapWYAfhHlcKx7zyYfDwi5uhmd34WbUz
 XupBqrjwgYsszqg2vVDtHX4muKNKl4FCIKEvbx09ed6dQ31Q7qpxh4UgS/Nbj/4D/79J
 cBnA==
X-Gm-Message-State: APjAAAUK6XBhKBl3yqhXymU1452VqMiaXYRovzU755fsAjeSGTboFnc9
 fzV5NYYw1AHVVTtknso8KWnZsmcbA/g=
X-Google-Smtp-Source: APXvYqyWkWAJ5sPsUpqbWAy71qmGXtDWPCrfasxRd8m0NdlFhlF6iU5nZ24EPromxMFk1aH65Eky+w==
X-Received: by 2002:a5d:8e16:: with SMTP id e22mr18276290iod.171.1566076936091; 
 Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 j25sm13091311ioj.67.2019.08.17.14.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
Date: Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190817073253.27819-25-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-25-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:30:43 +0200
Subject: Re: [OpenRISC] [PATCH 24/26] riscv: use the generic ioremap code
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCAxNyBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IFVzZSB0aGUg
Z2VuZXJpYyBpb3JlbWFwIGNvZGUgaW5zdGVhZCBvZiBwcm92aWRpbmcgYSBsb2NhbCB2ZXJzaW9u
Lgo+IE5vdGUgdGhhdCB0aGlzIHJlbGllcyBvbiB0aGUgYXNtLWdlbmVyaWMgbm8tb3AgZGVmaW5p
dGlvbiBvZgo+IHBncHJvdF9ub25jYWNoZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAg
ICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmggICAgICB8ICAzIC0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDYgKysrCj4gIGFyY2gvcmlz
Y3YvbW0vTWFrZWZpbGUgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL3Jpc2N2L21tL2lvcmVtYXAu
YyAgICAgICAgICB8IDg0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDUgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4OCBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbW0vaW9yZW1hcC5jCgpSZXZpZXdlZC1ieTogUGF1bCBXYWxt
c2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpUZXN0ZWQtYnk6IFBhdWwgV2FsbXNsZXkg
PHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gIyBydjMyLCBydjY0IGJvb3QKQWNrZWQtYnk6IFBh
dWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4gIyBhcmNoL3Jpc2N2CgoKLSBQ
YXVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

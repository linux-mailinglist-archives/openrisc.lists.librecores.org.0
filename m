Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D864E258365
	for <lists+openrisc@lfdr.de>; Mon, 31 Aug 2020 23:21:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5B9E120D74;
	Mon, 31 Aug 2020 23:21:22 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 7B8072074A
 for <openrisc@lists.librecores.org>; Mon, 31 Aug 2020 23:21:20 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id g207so1407680pfb.1
 for <openrisc@lists.librecores.org>; Mon, 31 Aug 2020 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcxQD2Sn/2bUGUgYSdbw9/nm0Vv2nDYXnd0y7jH8pec=;
 b=RnCAH4XIYXFutKK+MrfQTe25TGSO7ZeTBeo27ijs0y0ym14WJ4YUkp0Qa0tlOfZrfu
 d6h8HxDPQsjvBIZbtjC0KFDIPPae741UZABCuIJHLMLsW20MseA4EdHjL/MndQKvwGvZ
 y6kV5POE49Bu+TO7Oy3cfmEQXv9t/k5j7OmmxhmW5zkdDAcrPjIBPlwX55xMSJd4nh7B
 mjqv/YBlp98PD7WXqcswgqhg+21wLH98QUcfMidWgacAxa0or2nKjdtmnUJNJVHKmRh6
 JsxUOsI9IGZ19tl3jhSP8+quIUalEQt2j3ur1ExOdLdFIwDZ6HJ1L9gRqojTCQBBpXwK
 rdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcxQD2Sn/2bUGUgYSdbw9/nm0Vv2nDYXnd0y7jH8pec=;
 b=Ki9XQRZbkIm96VnS2GK0VKyiVGts8Lg6eFJcLH2MumPof4gtUg+uCIRyahXgNNtVSn
 guYkot7L5zq7SOOhFaNVpFYAWcMT7r0fThQVRVlepLO5IwqivQpNTy/f6KqKbTZ2YjuY
 lS5gHTWcXlDoBY7iiioySyMCzY4bzkOyrQp0zmPZ+2cVOdZvzjn8k7mWjg3l2quIAxle
 //7ladC0CW4+9Y1UreNnGU26GKSeCgWVTDAaqtAItA/Dfb3yn1U4N7Bjd2ne0wqbt3Z6
 oQbyjxUE8SZMMH7lXBk/9mK6ShX91fCBzWm+/b5QQ//OvNRgh3O+nG8divmhOSGeubbr
 rNRQ==
X-Gm-Message-State: AOAM530pgkpqXFPN8r/5Knhy2mJsMGEzUG3/bwHzIGvy53vw6atYFNKs
 m1RXx35stqmGYIrGbs4qyuA=
X-Google-Smtp-Source: ABdhPJyZQ3xkdg7sLV2Kx4H8hS0SzKfHcYEtbNbzcy7L1p8EP8DE98CQkZ26JHkoK4iuuXPd1auMNw==
X-Received: by 2002:aa7:9569:: with SMTP id x9mr2815283pfq.16.1598908878426;
 Mon, 31 Aug 2020 14:21:18 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id y7sm540803pjm.3.2020.08.31.14.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 14:21:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  1 Sep 2020 06:21:01 +0900
Message-Id: <20200831212102.4014642-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Reserve memblock for initrd
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmVjZW50bHkgT3BlblJJU0MgYWRkZWQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgaW5pdHJkIGltYWdl
cywgYnV0IEkgZm91bmQKc29tZSBpbnN0YWJpbGl0eSB3aGVuIHVzaW5nIGxhcmdlciBidWlsZHJv
b3QgaW5pdHJkIGltYWdlcy4gSXQgdHVybmVkCm91dCB0aGF0IEkgZm9yZ290IHRvIHJlc2VydmUg
dGhlIG1lbWJsb2NrIHNwYWNlIGZvciB0aGUgaW5pdHJkIGltYWdlLgoKVGhpcyBwYXRjaCBmaXhl
cyB0aGUgaW5zdGFiaWxpdHkgaXNzdWUgYnkgcmVzZXJ2aW5nIG1lbWJsb2NrIHNwYWNlLgoKRml4
ZXM6IGZmNmM5MjNkYmVjMyAoIm9wZW5yaXNjOiBBZGQgc3VwcG9ydCBmb3IgZXh0ZXJuYWwgaW5p
dHJkIGltYWdlcyIpClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwu
Y29tPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgfCA5ICsrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCmluZGV4IGIxOGU3
NzVmOGJlMy4uMmM4YWE1M2NjN2JhIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9z
ZXR1cC5jCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKQEAgLTgwLDYgKzgwLDE1
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAkgKi8KIAltZW1ibG9j
a19yZXNlcnZlKF9fcGEoX3N0ZXh0KSwgX2VuZCAtIF9zdGV4dCk7CiAKKyNpZmRlZiBDT05GSUdf
QkxLX0RFVl9JTklUUkQKKwkvKiBUaGVuIHJlc2VydmUgdGhlIGluaXRyZCwgaWYgYW55ICovCisJ
aWYgKGluaXRyZF9zdGFydCAmJiAoaW5pdHJkX2VuZCA+IGluaXRyZF9zdGFydCkpIHsKKwkJbWVt
YmxvY2tfcmVzZXJ2ZShBTElHTl9ET1dOKF9fcGEoaW5pdHJkX3N0YXJ0KSwgUEFHRV9TSVpFKSwK
KwkJCUFMSUdOKGluaXRyZF9lbmQsIFBBR0VfU0laRSkgLQorCQkJQUxJR05fRE9XTihpbml0cmRf
c3RhcnQsIFBBR0VfU0laRSkpOworCX0KKyNlbmRpZiAvKiBDT05GSUdfQkxLX0RFVl9JTklUUkQg
Ki8KKwogCWVhcmx5X2luaXRfZmR0X3Jlc2VydmVfc2VsZigpOwogCWVhcmx5X2luaXRfZmR0X3Nj
YW5fcmVzZXJ2ZWRfbWVtKCk7CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

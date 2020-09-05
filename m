Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6B25E7D1
	for <lists+openrisc@lfdr.de>; Sat,  5 Sep 2020 15:20:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4FA7520D6E;
	Sat,  5 Sep 2020 15:20:12 +0200 (CEST)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id BD27C2086C
 for <openrisc@lists.librecores.org>; Sat,  5 Sep 2020 15:20:10 +0200 (CEST)
Received: by mail-pl1-f195.google.com with SMTP id m15so1299048pls.8
 for <openrisc@lists.librecores.org>; Sat, 05 Sep 2020 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djsLOAj49I3V2rEQOLHM4U+3AfJWXtqzZzZwC5xLBeA=;
 b=nQIR8dUFvevjZjwwDnA9GNxfMR0FcpxmEwiHHELuOnjDpHhFzg9q12KR8ID7CMxl4R
 z5UtyjDoZ+4hkT5Ux8Qs/fh/3XaqcPWszHLjb+KTobb6rcSb2/hWi9DaJSeIyVRctOPL
 dcVxYVWcnfjhvDtPzLHk89rYs7Cs5ZscUV49nu16nBcUCztHnGzc7xPiOm29zfgnTkFI
 vroFIjRRVnDs2rdhQSRk943rVPHsSeTZ0lNLLEM/KFhgY4aY/rshETTEPp6PYr3NSxTa
 PiPTe0D3JTN+AQBSuge4af3CbfsvTHr+0x44h11kutmOyXxB4nKach/ahLJ1QVEgSEPb
 ighw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djsLOAj49I3V2rEQOLHM4U+3AfJWXtqzZzZwC5xLBeA=;
 b=XdaAwvPOAlCzX6ufx3i1QbEgo9A82HahTHYVNWVHfPLPFZ+hKsMJ20EsH8t0X9AyX/
 WhftKLCyvJCZgb4mJvlUYjB9a8x4Fy4EYq6cqt0w6RzpVu4J6KqQiKj1Job9MIfYN8ZJ
 NMxIOgUcif30g5soFVYIvtwlxlaJotvzU2TjCJ1WgiGy7bo4CUL5a4p3KNLF28x7DPEn
 iLiyRywI9mxOG1u/rel6bywWPi/MThXa/7Vk2ZFuQJCWFAQlIvVUyF2A8HXW4TeLWHwW
 UqrY9xcxOueX2NPD6t/wxMJylCNAN7i7fFN5b91HPLIyYxf5NSlzkorx05WpM905Lcyk
 0dHQ==
X-Gm-Message-State: AOAM533m0xbswMiHrP0qMgzWDZez5Gbv66RE49X2jgedPuKdR6sDSbLm
 yZOyeD/zJACuH7Y9R1jOxVU=
X-Google-Smtp-Source: ABdhPJxdbchpxF4VNi6l4PJPZ13DplwdNunYtZocl7Debwv1KvQfsC61gpYcC4p7wj9hNkRN2Gt5vQ==
X-Received: by 2002:a17:902:e789:: with SMTP id
 cp9mr12639308plb.215.1599312008821; 
 Sat, 05 Sep 2020 06:20:08 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id q193sm10093224pfq.127.2020.09.05.06.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 06:20:07 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  5 Sep 2020 22:19:33 +0900
Message-Id: <20200905131935.972386-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905131935.972386-1-shorne@gmail.com>
References: <20200905131935.972386-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 1/3] openrisc: Reserve memblock for initrd
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
Y29tPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgfCAxMCArKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJp
c2Mva2VybmVsL3NldHVwLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCmluZGV4IGIx
OGU3NzVmOGJlMy4uMTNjODdmMWY4NzJiIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5l
bC9zZXR1cC5jCisrKyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKQEAgLTgwLDYgKzgw
LDE2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAkgKi8KIAltZW1i
bG9ja19yZXNlcnZlKF9fcGEoX3N0ZXh0KSwgX2VuZCAtIF9zdGV4dCk7CiAKKyNpZmRlZiBDT05G
SUdfQkxLX0RFVl9JTklUUkQKKwkvKiBUaGVuIHJlc2VydmUgdGhlIGluaXRyZCwgaWYgYW55ICov
CisJaWYgKGluaXRyZF9zdGFydCAmJiAoaW5pdHJkX2VuZCA+IGluaXRyZF9zdGFydCkpIHsKKwkJ
dW5zaWduZWQgbG9uZyBhbGlnbmVkX3N0YXJ0ID0gQUxJR05fRE9XTihpbml0cmRfc3RhcnQsIFBB
R0VfU0laRSk7CisJCXVuc2lnbmVkIGxvbmcgYWxpZ25lZF9lbmQgPSBBTElHTihpbml0cmRfZW5k
LCBQQUdFX1NJWkUpOworCisJCW1lbWJsb2NrX3Jlc2VydmUoX19wYShhbGlnbmVkX3N0YXJ0KSwg
YWxpZ25lZF9lbmQgLSBhbGlnbmVkX3N0YXJ0KTsKKwl9CisjZW5kaWYgLyogQ09ORklHX0JMS19E
RVZfSU5JVFJEICovCisKIAllYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKIAllYXJseV9p
bml0X2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpOwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

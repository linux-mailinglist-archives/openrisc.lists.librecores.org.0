Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 69C4131A10
	for <lists+openrisc@lfdr.de>; Sat,  1 Jun 2019 09:26:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 028D120166;
	Sat,  1 Jun 2019 09:26:46 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 6A11A2014F
 for <openrisc@lists.librecores.org>; Sat,  1 Jun 2019 09:26:44 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id u17so7560191pfn.7
 for <openrisc@lists.librecores.org>; Sat, 01 Jun 2019 00:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xEjESQ4Nmxptm1eKKuUso6+SwNA47Wbs2HC9HNs2LwY=;
 b=tIdDDM5uxA1OYcG5/j+xaQO+HE1HVtZD13NC/DOE+LMLjpGo/ryPi1TzpyYIlivWie
 dHkVjkgbEr9oN4NKDbqVXmoVDfDzOJFJL/pZXevz6Qz27Sl/MeHnhY0j5r0D2OEz6kEP
 ADWIXF8tVyRsWSswekcqiL5jFqkzo9lAJfIYpkQYKJvHrXxYOF+rrXMLYvzN3LiaDgcW
 xYorR+ONi5jV+OesrAAkAzbQpA8P41VFj9D3o3+YUVD4IE9MIbSBPDC6PDqEJiGYd3GN
 CTtus/wrNG5F4uC+HgP8KDJ2djfKsoO8zz6/RXulzocZIZadLIEe34LHgEuFmYOfka0E
 nA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xEjESQ4Nmxptm1eKKuUso6+SwNA47Wbs2HC9HNs2LwY=;
 b=AdX9OEkLVIiK8OTE6WpbWMf61AQyyRXDGUw9/oRrWXS0UYfOtY9EWivDLITLv+/rBX
 nqq/UGDCY4hRmd7meh28FwUUUftfYOoB81A/Rl9RNhmSH4Cve2RgZcRNOe0YPmaDm81s
 xhPI+q9Bmh4FXlgwueEiMMRePYLoqmQ8nyxacP64kcUPVed1sMnrPEilA2Wx1Asohs4Z
 IY5OKIPwgBnIUzvFOxs5khWq3+Q41R4A+yaGGV1BdlRMqyZr+XoVhqsRJDIPMaRJB6Zr
 6mNE9ubQ3r5Pr99DkYqIgxT7M4PTiQbv7TuGNjUffQlcnoEbbSlfqJnlNv7vO7azRhrv
 FtOA==
X-Gm-Message-State: APjAAAUK8DBRVBUaWH3LwtUsh3RtL2ZIgQhGSkuOIVAd19aUgSN/mxXX
 XfMVRQtJqt9nZWUBUX9z+40=
X-Google-Smtp-Source: APXvYqxE/Wony9uK7ZGRZ4Q4FnF6nB+AG7LzGWa/sXkGl4RvIgC5z1/2LuE8b1P+C9XYHJ5wzGVizA==
X-Received: by 2002:a17:90a:be0b:: with SMTP id
 a11mr14191226pjs.88.1559374000051; 
 Sat, 01 Jun 2019 00:26:40 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id x16sm7826463pff.30.2019.06.01.00.26.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 01 Jun 2019 00:26:39 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: cgen@sourceware.org
Date: Sat,  1 Jun 2019 16:26:27 +0900
Message-Id: <20190601072629.4070-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/2] CGEN unordered fpu compares + fixes
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

SGVsbG8sCgpBcyBJIGFtIHdvcmtpbmcgb24gb3BlbnJpc2Mgd2hpY2ggdXNlcyBjZ2VuIGluIGJp
bnV0aWxzIEkgaGF2ZSBuZWVkZWQgdG8gbWFrZQp0aGVzZSBjaGFuZ2VzLgoKVGhlIFVub3JkZXJl
ZCBjb21wYXJlcyBpcyBuZWVkZWQgZm9yIEZQVSB1bm9yZGVyZWQgKE5hTiBkZXRlY3RpbmcpIGNv
bXBhcmlzb25zLgpUaGVzZSBoYXZlIGJlZW4gaW1wbGVtZW50ZWQgYW5kIHRlc3RlZCBpbiBPcGVu
UklTQyAoYm90aCBzaW11bGF0aW9uIGFuZAphc3NlbWJsZXIgKHJ1bm5pbmcgb24gRlBHQSBoYXJk
d2FyZSkpLgoKVGhlIGdlbi1kb2MgY2hhbmdlcyBjb21lIGZyb20gbWUgbm90aWNpbmcgdGhlIGRv
Y3MgWzBdIG9uIHRoZSBjZ2VuIHdlYnNpdGUgYXJlCnZlcnkgbXVjaCBvdXQgb2YgZGF0ZS4KCkRv
ZXMgYW55b25lIGtub3cgdGhlIHByb2Nlc3MgdG8gZ2V0IHRoZSByZWdlbmVyYXRlZCBkb2NzIHBv
c3RlZD8gIEkgdGhpbmsgdGhleQphcmUgYmVuZWZpY2lhbCBhbmQgd2l0aCBzb21lIG1vcmUgdXBk
YXRlcyB0aGV5IGNvdWxkIGJlIHJlYWxseSBnb29kLgoKWzBdIGh0dHBzOi8vc291cmNld2FyZS5v
cmcvY2dlbi9nZW4tZG9jLwoKU3RhZmZvcmQgSG9ybmUgKDIpOgogIGNnZW46IEFkZCB1bm9yZGVy
ZWQgY29tcGFyZSBvcGVyYXRpb24KICBnZW4tZG9jOiBVcGRhdGVzIGZvciBsYXRlc3QgY3B1IGRl
ZmluaXRpb25zCgogZ2VuLWFsbC1kb2MgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0KIGh0bWwuc2NtICAgICAgfCAgMiArLQogcnRsLWMuc2NtICAg
ICB8ICA0ICsrKysKIHJ0eC1mdW5jcy5zY20gfCAgNyArKysrKysrCiA0IGZpbGVzIGNoYW5nZWQs
IDQ0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQogbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+
IDEwMDc1NSBnZW4tYWxsLWRvYwoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

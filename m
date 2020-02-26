Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B7E27170C00
	for <lists+openrisc@lfdr.de>; Wed, 26 Feb 2020 23:56:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9449E20979;
	Wed, 26 Feb 2020 23:56:52 +0100 (CET)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 0A57C2089B
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 23:56:51 +0100 (CET)
Received: by mail-pj1-f65.google.com with SMTP id q39so290648pjc.0
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ohmIu4XqdwwoGOhxHZxWRSxu96xnb4vm9jRlxB7Rk4=;
 b=o2oR2jPevA8x/8UCrV1EgrGE3AdJ+mc/EDnisAEwLf1+dC0nr+f6eotTgRm7T+Z7oc
 mkrFlGEqZobJMMQXcKPlFRL8Thl9nqWAo/KaId7bkyLJv+hcxpjxTkE9y09g2taDz3DO
 Y3sJ+9SMdjgEldumApxzkxT8DXFcnq7M6wEiRJK7xpPUANBKP42OMFDYYo3R3RghOT/j
 x0KyWy3ZIqxMqhwGh9MnFYCRPpvkc5wCkmfF5ibJEKDcJnAmbgsodQgo4sTOdpHEGlaT
 ywxGjgh7s8CBSYwBndo8//PKsIDrv0J+hCaTJNrB8QQoJhMOPp5Ye5HCuqwv/xGeJr4n
 +eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ohmIu4XqdwwoGOhxHZxWRSxu96xnb4vm9jRlxB7Rk4=;
 b=CVI3yK0O+1VEO7vl+iV6eEGXc9Y90h3xm0jB58yntzhmMfMeBWhlD0VLOelnOHCQX/
 7fPJHHrTqYelkup6IW9u8+MBailfe1vefqglgOC0ClsLkSHqibcfUmobKV5K9SbBA+pd
 XE4R2t5sUzqz3II5+8UxYsjdjdmBolbq2Mntf6oZLBHyH4jKsk/JDPGpympK2PafUW3q
 W6K62xq+57sOWKAbCyF+2U5WEkjsSf0raLP/yAteL89zmq15yj93z1XZw+6MTNIvck2R
 XKbjOyd7JYYwuflAecl+glW+wkQzBCX7rOcIzXzB/eVOFK/UHQRTNFqmWA0eTWf5g97w
 idvw==
X-Gm-Message-State: APjAAAXDQR+4FyP0bIvFri7Pfnw9oqjRvygiOp9jF0u/2yM1l7ocejje
 4Bsn//DNxMFxuoVEemt+D2g=
X-Google-Smtp-Source: APXvYqyXIDUoVSh1xIbmqRleT9ipQIwFfAFOCOxSOCNOljpXoL9fKKWk7ldO6qo96r/BqC4LOs4qpg==
X-Received: by 2002:a17:90a:c78b:: with SMTP id
 gn11mr1471893pjb.97.1582757809594; 
 Wed, 26 Feb 2020 14:56:49 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id x190sm4277665pfb.96.2020.02.26.14.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:56:49 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Date: Thu, 27 Feb 2020 07:56:23 +0900
Message-Id: <20200226225625.28935-2-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200226225625.28935-1-shorne@gmail.com>
References: <20200226225625.28935-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/3] openrisc: Convert copy_thread to
 copy_thread_tls
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
 Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBpcyByZXF1aXJlZCBmb3IgY2xvbmUzIHdoaWNoIHBhc3NlcyB0aGUgVExTIHZhbHVlIHRo
cm91Z2ggYQpzdHJ1Y3QgcmF0aGVyIHRoYW4gYSByZWdpc3Rlci4KClNpZ25lZC1vZmYtYnk6IFN0
YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvS2NvbmZp
ZyAgICAgICAgICB8ICAxICsKIGFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyB8IDE1ICsr
KysrLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZyBiL2FyY2gvb3BlbnJp
c2MvS2NvbmZpZwppbmRleCAxOTI4ZTA2MWZmOTYuLjVkZWJkYmU2ZmMzNSAxMDA2NDQKLS0tIGEv
YXJjaC9vcGVucmlzYy9LY29uZmlnCisrKyBiL2FyY2gvb3BlbnJpc2MvS2NvbmZpZwpAQCAtMTQs
NiArMTQsNyBAQCBjb25maWcgT1BFTlJJU0MKIAlzZWxlY3QgSEFORExFX0RPTUFJTl9JUlEKIAlz
ZWxlY3QgR1BJT0xJQgogCXNlbGVjdCBIQVZFX0FSQ0hfVFJBQ0VIT09LCisJc2VsZWN0IEhBVkVf
Q09QWV9USFJFQURfVExTCiAJc2VsZWN0IFNQQVJTRV9JUlEKIAlzZWxlY3QgR0VORVJJQ19JUlFf
Q0hJUAogCXNlbGVjdCBHRU5FUklDX0lSUV9QUk9CRQpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4
IGIwNmY4NGY2Njc2Zi4uNjY5NWYxNjdlMTI2IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tl
cm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0x
MTcsMTIgKzExNywxMyBAQCB2b2lkIHJlbGVhc2VfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAq
ZGVhZF90YXNrKQogZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrKHZvaWQpOwog
CiAvKgotICogY29weV90aHJlYWQKKyAqIGNvcHlfdGhyZWFkX3RscwogICogQGNsb25lX2ZsYWdz
OiBmbGFncwogICogQHVzcDogdXNlciBzdGFjayBwb2ludGVyIG9yIGZuIGZvciBrZXJuZWwgdGhy
ZWFkCiAgKiBAYXJnOiBhcmcgdG8gZm4gZm9yIGtlcm5lbCB0aHJlYWQ7IGFsd2F5cyBOVUxMIGZv
ciB1c2Vyc3BhY2UgdGhyZWFkCiAgKiBAcDogdGhlIG5ld2x5IGNyZWF0ZWQgdGFzawogICogQHJl
Z3M6IENQVSBjb250ZXh0IHRvIGNvcHkgZm9yIHVzZXJzcGFjZSB0aHJlYWQ7IGFsd2F5cyBOVUxM
IGZvciBrdGhyZWFkCisgKiBAdGxzOiB0aGUgVGhyZWFkIExvY2FsIFN0b3JhdGUgcG9pbnRlciBm
b3IgdGhlIG5ldyBwcm9jZXNzCiAgKgogICogQXQgdGhlIHRvcCBvZiBhIG5ld2x5IGluaXRpYWxp
emVkIGtlcm5lbCBzdGFjayBhcmUgdHdvIHN0YWNrZWQgcHRfcmVnCiAgKiBzdHJ1Y3R1cmVzLiAg
VGhlIGZpcnN0ICh0b3Btb3N0KSBpcyB0aGUgdXNlcnNwYWNlIGNvbnRleHQgb2YgdGhlIHRocmVh
ZC4KQEAgLTE0OCw4ICsxNDksOCBAQCBleHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zv
cmsodm9pZCk7CiAgKi8KIAogaW50Ci1jb3B5X3RocmVhZCh1bnNpZ25lZCBsb25nIGNsb25lX2Zs
YWdzLCB1bnNpZ25lZCBsb25nIHVzcCwKLQkgICAgdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCB0
YXNrX3N0cnVjdCAqcCkKK2NvcHlfdGhyZWFkX3Rscyh1bnNpZ25lZCBsb25nIGNsb25lX2ZsYWdz
LCB1bnNpZ25lZCBsb25nIHVzcCwKKwkJdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCB0YXNrX3N0
cnVjdCAqcCwgdW5zaWduZWQgbG9uZyB0bHMpCiB7CiAJc3RydWN0IHB0X3JlZ3MgKnVzZXJyZWdz
OwogCXN0cnVjdCBwdF9yZWdzICprcmVnczsKQEAgLTE4MCwxNSArMTgxLDkgQEAgY29weV90aHJl
YWQodW5zaWduZWQgbG9uZyBjbG9uZV9mbGFncywgdW5zaWduZWQgbG9uZyB1c3AsCiAKIAkJLyoK
IAkJICogRm9yIENMT05FX1NFVFRMUyBzZXQgInRwIiAocjEwKSB0byB0aGUgVExTIHBvaW50ZXIg
cGFzc2VkIHRvIHN5c19jbG9uZS4KLQkJICoKLQkJICogVGhlIGtlcm5lbCBlbnRyeSBpczoKLQkJ
ICoJaW50IGNsb25lIChsb25nIGZsYWdzLCB2b2lkICpjaGlsZF9zdGFjaywgaW50ICpwYXJlbnRf
dGlkLAotCQkgKgkJaW50ICpjaGlsZF90aWQsIHN0cnVjdCB2b2lkICp0bHMpCi0JCSAqCi0JCSAq
IFRoaXMgbWFrZXMgdGhlIHNvdXJjZSByNyBpbiB0aGUga2VybmVsIHJlZ2lzdGVycy4KIAkJICov
CiAJCWlmIChjbG9uZV9mbGFncyAmIENMT05FX1NFVFRMUykKLQkJCXVzZXJyZWdzLT5ncHJbMTBd
ID0gdXNlcnJlZ3MtPmdwcls3XTsKKwkJCXVzZXJyZWdzLT5ncHJbMTBdID0gdGxzOwogCiAJCXVz
ZXJyZWdzLT5ncHJbMTFdID0gMDsJLyogUmVzdWx0IGZyb20gZm9yaygpICovCiAKLS0gCjIuMjEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

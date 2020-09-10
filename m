Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 51E09267C91
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D63D32058E;
	Sat, 12 Sep 2020 23:22:11 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id 9D32B20B1F
 for <openrisc@lists.librecores.org>; Fri, 11 Sep 2020 01:39:57 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id d9so5795437pfd.3
 for <openrisc@lists.librecores.org>; Thu, 10 Sep 2020 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7hSJYPLUCOtHHvd64Ozpw8tkzTrrz5bb+74FUJ2a40=;
 b=k52S/3xv/KKfN7vYTMe1vCAOcShgd9nF/l2ZCY7NdmH4EbTMSNFk5Wz5WXpWVivmn+
 UoiC4BsdSVyJl2SnkSmVsIXgQn7BBBhxZrcb67RjiAyxI5GgfLQhCThQmcZ8HADVyxPw
 7RU6r9vOhBseBTYpCYqxHu77z3tWCdjfxUy5p5npu2Pxfk1aeJQNeveHZyoFl8ywWkK3
 qoSNRn78WT6efJTS7DKQ6egpFq5SNDIK5mNLxOd1v2sUxSJ2uWgvTXVTgCac71hgA5IN
 kl3/qjduOmKraYlwnlZmDO2m5NTq7HhXzUT2dPZuHGdUREj6su7fwiCQnVjQgh5+c9xz
 lYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7hSJYPLUCOtHHvd64Ozpw8tkzTrrz5bb+74FUJ2a40=;
 b=aQKpcjNitpHfylXAaoU4FdbbVDb1rFh/5Qx/r6jyQuMnhG2lDEYt7Isn4MaMoivrXG
 3pD0inD6jKTP0yaZI/OWWwuLNnp+skpc3i8rgapIXs4o43ZMjwU5gGxUpZv0NfbpMbo2
 SV1n6gzJd8u7HuhRVRUKP3hxcgpkc0jfAmhMtutQFyE5iYDW+tuHDmakHKFpLASJXg1l
 oTaKi+X2YAmcwxlO1F+I8Vm7ylfPRcD9E1EvEIAqvE2jBgfPIvaxOw/ydw97pjWHFGfo
 ethDiYjunFRF87FFTsNFAkIZ2FEcGRh7xly6QJUyg3vxlj+SY1L3cNdOMg7VnZgflWFA
 wIPQ==
X-Gm-Message-State: AOAM532qyRYP6Y9UI/6p+9XypAxtYFGsZ7iugvp9JeJiDRr7V2ua0+Ks
 P39KZLbB0I0HKuBqw0N+ugI=
X-Google-Smtp-Source: ABdhPJwxQOMbNrAwl0ZI8QAfxOi/eX3wo5m1enZWETRIbSDvBbK2Pmykk7rpssTjKhnRabGSXA4a3w==
X-Received: by 2002:a62:ab06:: with SMTP id p6mr7726622pff.131.1599781195637; 
 Thu, 10 Sep 2020 16:39:55 -0700 (PDT)
Received: from localhost (g168.115-65-169.ppp.wakwak.ne.jp. [115.65.169.168])
 by smtp.gmail.com with ESMTPSA id
 h9sm191767pfc.28.2020.09.10.16.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 16:39:55 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Fri, 11 Sep 2020 08:39:38 +0900
Message-Id: <20200910233940.2132107-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910233940.2132107-1-shorne@gmail.com>
References: <20200910233940.2132107-1-shorne@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: [OpenRISC] [PATCH v3 1/3] openrisc: Reserve memblock for initrd
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
 Mike Rapoport <rppt@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
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
Y29tPgpSZXZpZXdlZC1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0K
Q2hhbmdlcyBzaW5jZSB2MjoKIC0gTm9uZQoKQ2hhbmdlcyBzaW5jZSB2MToKIC0gVXBkYXRlZCB0
byB1c2Ugc2VwYXJhdGUgdmFyaWFibGVzIGFzIHN1Z2dlc3RlZCBieSBNaWtlLgoKIGFyY2gvb3Bl
bnJpc2Mva2VybmVsL3NldHVwLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCmluZGV4IGIxOGU3NzVmOGJlMy4uMTNjODdm
MWY4NzJiIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCisrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKQEAgLTgwLDYgKzgwLDE2IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAkgKi8KIAltZW1ibG9ja19yZXNlcnZlKF9fcGEo
X3N0ZXh0KSwgX2VuZCAtIF9zdGV4dCk7CiAKKyNpZmRlZiBDT05GSUdfQkxLX0RFVl9JTklUUkQK
KwkvKiBUaGVuIHJlc2VydmUgdGhlIGluaXRyZCwgaWYgYW55ICovCisJaWYgKGluaXRyZF9zdGFy
dCAmJiAoaW5pdHJkX2VuZCA+IGluaXRyZF9zdGFydCkpIHsKKwkJdW5zaWduZWQgbG9uZyBhbGln
bmVkX3N0YXJ0ID0gQUxJR05fRE9XTihpbml0cmRfc3RhcnQsIFBBR0VfU0laRSk7CisJCXVuc2ln
bmVkIGxvbmcgYWxpZ25lZF9lbmQgPSBBTElHTihpbml0cmRfZW5kLCBQQUdFX1NJWkUpOworCisJ
CW1lbWJsb2NrX3Jlc2VydmUoX19wYShhbGlnbmVkX3N0YXJ0KSwgYWxpZ25lZF9lbmQgLSBhbGln
bmVkX3N0YXJ0KTsKKwl9CisjZW5kaWYgLyogQ09ORklHX0JMS19ERVZfSU5JVFJEICovCisKIAll
YXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKTsKIAllYXJseV9pbml0X2ZkdF9zY2FuX3Jlc2Vy
dmVkX21lbSgpOwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

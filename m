Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF0A170C03
	for <lists+openrisc@lfdr.de>; Wed, 26 Feb 2020 23:57:01 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 14DE22097C;
	Wed, 26 Feb 2020 23:57:01 +0100 (CET)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id 8DAF52089B
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 23:56:58 +0100 (CET)
Received: by mail-pg1-f193.google.com with SMTP id u12so374569pgb.10
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 14:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pdWVOw3XbP9rnJNpBWicc5Lm1aX3lGrV8mP9d8FqVX4=;
 b=a/A6/rCoSO3AEeorvAoIiFDSyMkth38Q4wbPm8ZYRKFJdpUCBdxKiywuOmA4pC3tvc
 pAILl6lTGpIICjVWMjx83+oF5QjalA4G6ShShcVbMn7Cipge8d3ufWtqdTInYoLBfmeE
 cpHZrcprqeqMzTEgcQqdkNXsBa/QbbvqsjLnyFSlGVoDZbVGEKLGdcNfXGxOod3AWBVg
 fIvtCWfrJ/c3HPblRDEK0l2RBmtc1M2b78uvos4GRTBfknLjUSjFZ6bC5KZteXc3n45/
 vP51Yye8a2jur90D7nDUDLdsjBxPKbcmwgla87aPIkxHhrN7emRr0tDiqE9QhFlsNrfS
 F25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pdWVOw3XbP9rnJNpBWicc5Lm1aX3lGrV8mP9d8FqVX4=;
 b=DsPdgOVUw/nz61l4YE2yyd6NQABR2oH/XaMQtcOWTzXlrlMiuZv4l9u9jnHZrNZvZx
 FCV05RkUxxa570SCP3aa7gFWdWM6rAjDj/Oul1Dv9cx9kWfCngO/POxgOKjaFQUzBU0Q
 tvymVBvxaEYj8eh9gqQ+LePWNZ2eTEYiS1sifNByB810VF+b+wjfxi+Pf8J4zZLpTTjk
 8h0y9MenNr/6370Tsiy3YYO7XCQy0qLF/ZkaQ9iy57tXCn+o0NY4RIjgWAFyyAghK7I4
 nQIiJmar+wG0i4mbAD6SROGG+ou+YZvJ2e+NBoXyo3qgPQe7H/WlgwCRodM8khZiamFF
 jIzw==
X-Gm-Message-State: APjAAAWvTLtQw+AQ0DcYT6mCVn4tv10d9bbL7hDnVeK17F9nYiB76pG5
 rE3hAnHvSVO1ioiS1b+mzQI=
X-Google-Smtp-Source: APXvYqwsYxZKJyp01pvqLvjYh0AU2nXwiOUIbz6J3L7PEiflTZJNw2/fDMVEX0Dz5/wpKy5R3T3ILg==
X-Received: by 2002:a63:3c46:: with SMTP id i6mr1060690pgn.413.1582757817192; 
 Wed, 26 Feb 2020 14:56:57 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id v7sm3979771pfn.61.2020.02.26.14.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:56:56 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Date: Thu, 27 Feb 2020 07:56:25 +0900
Message-Id: <20200226225625.28935-4-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200226225625.28935-1-shorne@gmail.com>
References: <20200226225625.28935-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/3] openrisc: Cleanup copy_thread_tls docs and
 comments
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

UHJldmlvdXNseSBjb3B5X3RocmVhZF90bHMgd2FzIGNvcHlfdGhyZWFkIGFuZCBiZWZvcmUgdGhh
dCBzb21ldGhpbmcKZWxzZS4gIFJlbW92ZSB0aGUgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgcmVn
cyBwYXJhbWV0ZXIgdGhhdCBkaWRuJ3QKZXhpc3QgaW4gZWl0aGVyIHZlcnNpb24uCgpOZXh0LCBm
aXggY29tbWVudCB3cmFwcGluZyBhbmQgZGV0YWlscyBhYm91dCBob3cgVExTIHBvaW50ZXIgZ2V0
cyB0byB0aGUKY29weV90aHJlYWRfdGxzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogU3RhZmZv
cmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJv
Y2Vzcy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYwppbmRleCA2Njk1ZjE2N2UxMjYuLmI0NDJlN2I1
OWUxNyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYwpAQCAtMTIyLDcgKzEyMiw2IEBAIGV4dGVybiBh
c21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9yayh2b2lkKTsKICAqIEB1c3A6IHVzZXIgc3RhY2sg
cG9pbnRlciBvciBmbiBmb3Iga2VybmVsIHRocmVhZAogICogQGFyZzogYXJnIHRvIGZuIGZvciBr
ZXJuZWwgdGhyZWFkOyBhbHdheXMgTlVMTCBmb3IgdXNlcnNwYWNlIHRocmVhZAogICogQHA6IHRo
ZSBuZXdseSBjcmVhdGVkIHRhc2sKLSAqIEByZWdzOiBDUFUgY29udGV4dCB0byBjb3B5IGZvciB1
c2Vyc3BhY2UgdGhyZWFkOyBhbHdheXMgTlVMTCBmb3Iga3RocmVhZAogICogQHRsczogdGhlIFRo
cmVhZCBMb2NhbCBTdG9yYXRlIHBvaW50ZXIgZm9yIHRoZSBuZXcgcHJvY2VzcwogICoKICAqIEF0
IHRoZSB0b3Agb2YgYSBuZXdseSBpbml0aWFsaXplZCBrZXJuZWwgc3RhY2sgYXJlIHR3byBzdGFj
a2VkIHB0X3JlZwpAQCAtMTgwLDcgKzE3OSw4IEBAIGNvcHlfdGhyZWFkX3Rscyh1bnNpZ25lZCBs
b25nIGNsb25lX2ZsYWdzLCB1bnNpZ25lZCBsb25nIHVzcCwKIAkJCXVzZXJyZWdzLT5zcCA9IHVz
cDsKIAogCQkvKgotCQkgKiBGb3IgQ0xPTkVfU0VUVExTIHNldCAidHAiIChyMTApIHRvIHRoZSBU
TFMgcG9pbnRlciBwYXNzZWQgdG8gc3lzX2Nsb25lLgorCQkgKiBGb3IgQ0xPTkVfU0VUVExTIHNl
dCAidHAiIChyMTApIHRvIHRoZSBUTFMgcG9pbnRlciBwYXNzZWQKKwkJICogaW4gY2xvbmVfYXJn
cyB0byBzeXNfY2xvbmUzLgogCQkgKi8KIAkJaWYgKGNsb25lX2ZsYWdzICYgQ0xPTkVfU0VUVExT
KQogCQkJdXNlcnJlZ3MtPmdwclsxMF0gPSB0bHM7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

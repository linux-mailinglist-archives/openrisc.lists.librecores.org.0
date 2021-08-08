Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0669C3E3AAC
	for <lists+openrisc@lfdr.de>; Sun,  8 Aug 2021 15:54:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A5AD724043;
	Sun,  8 Aug 2021 15:54:49 +0200 (CEST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mail.librecores.org (Postfix) with ESMTPS id A434621010
 for <openrisc@lists.librecores.org>; Sun,  8 Aug 2021 15:54:47 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id d17so13568949plr.12
 for <openrisc@lists.librecores.org>; Sun, 08 Aug 2021 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4jJTmlBzRU0ND63u5HHl3oJLU0L0pdpsLtQJ3hM5kc=;
 b=T2/Bo6n2/GBuMQzYIqOLtfm69DsWGu/581saZcNmgC7Pn1ysgEgazrNaPJaMOpzheV
 WNyf/jvokCkw2U7vQa/ry7GYX3/R64pA2Wj/6tkylf4t6ERG3QZtIfu35GgEzqo26jO9
 bQidAbZ2CWFO4XWZRpSMN3GoHkIbf0Dl15jncCfzeQmryvbSaFJVvRfhxmR3zwD7y0t9
 16a7mqYU5GBJ459pvaZ1LlrWBEURwYBgIMCZlgu/smvPEziqIRbdlP4n0PXc/wt5iF9H
 tDEsEHpVLLfPmuiwCMZ52nBMxAnSV82NQAcuuluUKWwOExs92qAJGHDWzzr9JnaMeVfm
 LN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B4jJTmlBzRU0ND63u5HHl3oJLU0L0pdpsLtQJ3hM5kc=;
 b=ZOH1xFPHbKghlOGLXjA5LB+Hk800i1VR169tvtHWrTurxH1imetODfNoEBChc1KsoN
 72j7xhBW5zP0aSmdXOkax289tOTNnL1g6XcCkaVurI0FmDE2ogEu8suMnJ2jEr3jX63m
 WwmQFIRXnBIfyM8qi86c7tkVcgKVI3Q3784B+ZlCNZ6e8TFvBGwYN2E7i4NchlGfIp2f
 V/biPJN2ZsuLkeCiEIw7BCV2pWI6ofxHkaw3J9VqKoQbsmEsOsVgmWHtKgG+sdgbMi1K
 c7brkgd/j/s1k92CjS46HLd0Z+J6mQDu6wVE0v6eU08RbVVTgsUvPMRjvj7Y3RZxDyvS
 DQ/A==
X-Gm-Message-State: AOAM530RV0E02pq7Wm4dZjzVJbHMrFf6vnlmI+FzDCTBDf3QQXuTvIuf
 BOw/abt+u/RqfOJGhYUWqas=
X-Google-Smtp-Source: ABdhPJxqH79LAB77AR8WWELiOieSKx0Y40V6NvBxMfmYH1f1QA5Mxf2fQ3jbWa6iJuK5QIKSD9r4Og==
X-Received: by 2002:a05:6a00:216f:b029:3c8:4705:f9fd with SMTP id
 r15-20020a056a00216fb02903c84705f9fdmr11253671pff.76.1628430886102; 
 Sun, 08 Aug 2021 06:54:46 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id o127sm17346047pfb.48.2021.08.08.06.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 06:54:45 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  8 Aug 2021 22:54:36 +0900
Message-Id: <20210808135437.3640549-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2] openrisc: Fix compiler warnings in setup
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyB3YXMgcG9pbnRlZCBvdXQgd2l0aCB0aGUgcmVjZW50IG5hbWUgY2hhbmdlIG9mIG9yMzJf
ZWFybHlfc2V0dXAgdG8Kb3Ixa19lYXJseV9zZXR1cC4gIEludmVzdGlnYXRpbmcgdGhlIGZpbGUg
SSBmb3VuZCBhIGZldyBvdGhlciB3YXJuaW5ncwpzbyBjbGVhbmluZyB0aGVtIHVwIGhlcmUuCgog
ICAgYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyMjA6MTM6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3IgJ29yMWtfZWFybHlfc2V0dXAnIFstV21pc3NpbmctcHJvdG90eXBl
c10KICAgICAgMjIwIHwgdm9pZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2b2lkICpmZHQpCgkg
IHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgoKRml4IHRoaXMgdGhlIG1pc3Npbmcgb3Ix
a19lYXJseV9zZXR1cCBwcm90b3R5cGUgd2FybmluZyBieSBhZGRpbmcgYW4KYXNtL3NldHVwLmgg
ZmlsZSB0byBkZWZpbmUgdGhlIHByb3RvdHlwZS4KCiAgICBhcmNoL29wZW5yaXNjL2tlcm5lbC9z
ZXR1cC5jOjI0NjoxMzogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciAnZGV0ZWN0
X3VuaXRfY29uZmlnJyBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiAgICAgIDI0NiB8IHZvaWQgX19p
bml0IGRldGVjdF91bml0X2NvbmZpZyh1bnNpZ25lZCBsb25nIHVwciwgdW5zaWduZWQgbG9uZyBt
YXNrLAoJICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgoKVGhlIGZ1bmN0aW9uIGRl
dGVjdF91bml0X2NvbmZpZyBpcyBub3QgdXNlZCwganVzdCByZW1vdmUgaXQuCgogICAgYXJjaC9v
cGVucmlzYy9rZXJuZWwvc2V0dXAuYzoyMjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2ZkdCcgbm90IGRlc2NyaWJlZCBpbiAnb3Ixa19lYXJseV9zZXR1cCcKCkFkZCBA
ZmR0IGRvY3MgdG8gdGhlIGZ1bmN0aW9uIGNvbW1lbnQgdG8gc3VwcHJlc3MgdGhpcyB3YXJuaW5n
LgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCgpDaGFuZ2VzIHNp
bmNlIHYxOgogLSBBZGQgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4gdG8gZml4IGNvbXBpbGUgZmFp
bHVyZS4gIFBvaW50ZWQgb3V0IGJ5IHJvYm90IGFuZAogICByYW5keS4KCiBhcmNoL29wZW5yaXNj
L2luY2x1ZGUvYXNtL3NldHVwLmggfCAxNSArKysrKysrKysrKysrKysKIGFyY2gvb3BlbnJpc2Mv
a2VybmVsL3NldHVwLmMgICAgICB8IDE2ICstLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVu
cmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1
cC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uOWFjYmM1ZGVkYTY5
Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zZXR1cC5oCkBA
IC0wLDAgKzEsMTUgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisv
KgorICogQ29weXJpZ2h0IChDKSAyMDIxIFN0YWZmb3JkIEhvcm5lCisgKi8KKyNpZm5kZWYgX0FT
TV9PUjFLX1NFVFVQX0gKKyNkZWZpbmUgX0FTTV9PUjFLX1NFVFVQX0gKKworI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4KKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9zZXR1cC5oPgorCisjaWZuZGVmIF9f
QVNTRU1CTFlfXwordm9pZCBfX2luaXQgb3Ixa19lYXJseV9zZXR1cCh2b2lkICpmZHQpOworI2Vu
ZGlmCisKKyNlbmRpZiAvKiBfQVNNX09SMUtfU0VUVVBfSCAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9v
cGVucmlzYy9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKaW5k
ZXggN2VkZGNhYzBlZjJmLi4wY2QwNGQ5MzZhN2EgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3NldHVwLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwpAQCAtMjEw
LDYgKzIxMCw3IEBAIHZvaWQgX19pbml0IHNldHVwX2NwdWluZm8odm9pZCkKIAogLyoqCiAgKiBv
cjFrX2Vhcmx5X3NldHVwCisgKiBAZmR0OiBwb2ludGVyIHRvIHRoZSBzdGFydCBvZiB0aGUgZGV2
aWNlIHRyZWUgaW4gbWVtb3J5IG9yIE5VTEwKICAqCiAgKiBIYW5kbGVzIHRoZSBwb2ludGVyIHRv
IHRoZSBkZXZpY2UgdHJlZSB0aGF0IHRoaXMga2VybmVsIGlzIHRvIHVzZQogICogZm9yIGVzdGFi
bGlzaGluZyB0aGUgYXZhaWxhYmxlIHBsYXRmb3JtIGRldmljZXMuCkBAIC0yNDMsMjEgKzI0NCw2
IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBleHRyYWN0X3ZhbHVlKHVuc2lnbmVkIGxv
bmcgcmVnLCB1bnNpZ25lZCBsb25nIG1hc2spCiAJcmV0dXJuIG1hc2sgJiByZWc7CiB9CiAKLXZv
aWQgX19pbml0IGRldGVjdF91bml0X2NvbmZpZyh1bnNpZ25lZCBsb25nIHVwciwgdW5zaWduZWQg
bG9uZyBtYXNrLAotCQkJICAgICAgIGNoYXIgKnRleHQsIHZvaWQgKCpmdW5jKSAodm9pZCkpCi17
Ci0JaWYgKHRleHQgIT0gTlVMTCkKLQkJcHJpbnRrKCIlcyIsIHRleHQpOwotCi0JaWYgKHVwciAm
IG1hc2spIHsKLQkJaWYgKGZ1bmMgIT0gTlVMTCkKLQkJCWZ1bmMoKTsKLQkJZWxzZQotCQkJcHJp
bnRrKCJwcmVzZW50XG4iKTsKLQl9IGVsc2UKLQkJcHJpbnRrKCJub3QgcHJlc2VudFxuIik7Ci19
Ci0KIC8qCiAgKiBjYWxpYnJhdGVfZGVsYXkKICAqCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

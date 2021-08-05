Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F1D473E0C97
	for <lists+openrisc@lfdr.de>; Thu,  5 Aug 2021 05:00:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9847724043;
	Thu,  5 Aug 2021 05:00:59 +0200 (CEST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mail.librecores.org (Postfix) with ESMTPS id 0FA5324034
 for <openrisc@lists.librecores.org>; Thu,  5 Aug 2021 05:00:58 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id q2so5337615plr.11
 for <openrisc@lists.librecores.org>; Wed, 04 Aug 2021 20:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMF6ZUuA0W1rsM+bv9FkawHAOaFfXZd6kN3VeluJtLc=;
 b=BmF817DA6Q3QLNl1ii8wC0qXYSTgw4m+WIjKLnyBufWdh1Q8M7i9OAcV8Av1TB3vqy
 6Dik9WMmaR6FeDgBB1VxF+1XcvY3FsAZFgUMXimMzZncyCDwLwrUxn+TW4v5oSQI9mOF
 EbHRqfW/aRt4UPf40sDuqKTIYCPbhDLwmhZqecKHeuinuItLrEwMOPhprKzC4kTM9BN+
 2TvuVhLwUK/QjVgFMgWIbQidnXNj3X29Zfu9lCYedxRNsSmx8uK83Pdl3dCreIju2QWN
 xw+T3NIAa3pxU5EKaNgOe8I8qFq7ibmDa34UpF/BiZFPcvZ1bauIafCOytJIgWYf0cqC
 b5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YMF6ZUuA0W1rsM+bv9FkawHAOaFfXZd6kN3VeluJtLc=;
 b=M70R2ssMxkxU97iZjtqIQZk13sLo2UcK90zMVCUvSUgIO4+LtK1iERsHyrn2b8Fjwa
 TdATyPBp04EMAxSV5RzJbADp1cH0TdciBU+QMVAaPDteiWZnNxtsBtKpUFYk7CV+EuwM
 A1bPef6pBRwP0H3wvFFY1ln8HcRcchDOtnMSPGmJ4VYaxVzDGDFZ25E0pyx/Ay4MLkLz
 pib++3LljcEeYt+gwKLrzIcxY2rY5tIezJoEPtDL3seLoSi+7cpIPYTQHa/0ANw9xAqt
 yFaUG3PBQ7XaGtXNWxS8GCDjaWHAoZJg/UFsatWzfcEeBDjq1m3GR+76ua1COoUFp+4Y
 fiGw==
X-Gm-Message-State: AOAM532q4/+W6xrrMXbdWGRj39uG/Qkhja8V8b+hDVKKu8M0Qm4nMja3
 sRXWoYmkGLsk0F8Ax6rFwt8=
X-Google-Smtp-Source: ABdhPJwBa0siibV3F4DJSz7FN3pQpMtJ4n35ql8G4X1YKi2Xy3U7L4yXU33gNBuOSub1yU0qSUH9wQ==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id
 c6-20020a056a000ac6b0290374a33b0a74mr2565791pfl.51.1628132456110; 
 Wed, 04 Aug 2021 20:00:56 -0700 (PDT)
Received: from localhost (g195.61-45-49.ppp.wakwak.ne.jp. [61.45.49.195])
 by smtp.gmail.com with ESMTPSA id x4sm336669pff.126.2021.08.04.20.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 20:00:55 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  5 Aug 2021 12:00:33 +0900
Message-Id: <20210805030035.2994973-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Fix compiler warnings in setup
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
b2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5y
aXNjL2luY2x1ZGUvYXNtL3NldHVwLmggfCAxNCArKysrKysrKysrKysrKwogYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc2V0dXAuYyAgICAgIHwgMTYgKy0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgKCmRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL3NldHVwLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3Nl
dHVwLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5iNmQwOTZlZWIx
MWMKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NldHVwLmgK
QEAgLTAsMCArMSwxNCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8K
Ky8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjEgU3RhZmZvcmQgSG9ybmUKKyAqLworI2lmbmRlZiBf
QVNNX09SMUtfU0VUVVBfSAorI2RlZmluZSBfQVNNX09SMUtfU0VUVVBfSAorCisjaW5jbHVkZSA8
YXNtLWdlbmVyaWMvc2V0dXAuaD4KKworI2lmbmRlZiBfX0FTU0VNQkxZX18KK3ZvaWQgX19pbml0
IG9yMWtfZWFybHlfc2V0dXAodm9pZCAqZmR0KTsKKyNlbmRpZgorCisjZW5kaWYgLyogX0FTTV9P
UjFLX1NFVFVQX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMg
Yi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCmluZGV4IDdlZGRjYWMwZWYyZi4uMGNkMDRk
OTM2YTdhIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCisrKyBiL2Fy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKQEAgLTIxMCw2ICsyMTAsNyBAQCB2b2lkIF9faW5p
dCBzZXR1cF9jcHVpbmZvKHZvaWQpCiAKIC8qKgogICogb3Ixa19lYXJseV9zZXR1cAorICogQGZk
dDogcG9pbnRlciB0byB0aGUgc3RhcnQgb2YgdGhlIGRldmljZSB0cmVlIGluIG1lbW9yeSBvciBO
VUxMCiAgKgogICogSGFuZGxlcyB0aGUgcG9pbnRlciB0byB0aGUgZGV2aWNlIHRyZWUgdGhhdCB0
aGlzIGtlcm5lbCBpcyB0byB1c2UKICAqIGZvciBlc3RhYmxpc2hpbmcgdGhlIGF2YWlsYWJsZSBw
bGF0Zm9ybSBkZXZpY2VzLgpAQCAtMjQzLDIxICsyNDQsNiBAQCBzdGF0aWMgaW5saW5lIHVuc2ln
bmVkIGxvbmcgZXh0cmFjdF92YWx1ZSh1bnNpZ25lZCBsb25nIHJlZywgdW5zaWduZWQgbG9uZyBt
YXNrKQogCXJldHVybiBtYXNrICYgcmVnOwogfQogCi12b2lkIF9faW5pdCBkZXRlY3RfdW5pdF9j
b25maWcodW5zaWduZWQgbG9uZyB1cHIsIHVuc2lnbmVkIGxvbmcgbWFzaywKLQkJCSAgICAgICBj
aGFyICp0ZXh0LCB2b2lkICgqZnVuYykgKHZvaWQpKQotewotCWlmICh0ZXh0ICE9IE5VTEwpCi0J
CXByaW50aygiJXMiLCB0ZXh0KTsKLQotCWlmICh1cHIgJiBtYXNrKSB7Ci0JCWlmIChmdW5jICE9
IE5VTEwpCi0JCQlmdW5jKCk7Ci0JCWVsc2UKLQkJCXByaW50aygicHJlc2VudFxuIik7Ci0JfSBl
bHNlCi0JCXByaW50aygibm90IHByZXNlbnRcbiIpOwotfQotCiAvKgogICogY2FsaWJyYXRlX2Rl
bGF5CiAgKgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

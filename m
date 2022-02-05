Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4D14AA95F
	for <lists+openrisc@lfdr.de>; Sat,  5 Feb 2022 15:20:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D4EB623FA3;
	Sat,  5 Feb 2022 15:20:22 +0100 (CET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id E473C24166
 for <openrisc@lists.librecores.org>; Sat,  5 Feb 2022 15:20:20 +0100 (CET)
Received: by mail-pj1-f47.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so8908398pjl.2
 for <openrisc@lists.librecores.org>; Sat, 05 Feb 2022 06:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXpUWimVQCvLi12RE7G95TNrEuugIM/jhy8DgSTBsu8=;
 b=qLWx413D4IciL39NYeWr8qU1KR5zagd8EE38Tq5GVf3hMtZW9LxygN0yy4Sa4G3nK5
 o7XjAajXRMf22xa6ELrr0cEaDEXotb5UzArukoNtgfGjDRUSdt+7iyJXwik0SHr9Wodh
 yljY+pGNwNds9QoYnXSPvr51dv6aOyDrGAhTYjB8BrhXAFdzEi1BB/kqxntwvbR2GUeY
 b9ZEp1bPcveeUhL+pWpSX54NZ/noE5QErwkq5YbhW788sNH/8JdQx4bZ/H1DqmzfaZfU
 IXI+p9FgouIgMakWQ0kSdXK+ETMqZybLhlyTcP+2my+FKNPyJmA5vcuryETrXoHZjX+w
 PZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXpUWimVQCvLi12RE7G95TNrEuugIM/jhy8DgSTBsu8=;
 b=fSX1y553LUpw2VXMZYLY98NfvhWjsd7KJKl1Wa6DLZdlXVNqvct4V12zpj1qZx7az2
 jLTIb4f86yqfqHs9uVWsdAK3jn0sXWzm8gF5oatzk963f29heFmNu1OB1K3au8a1rvjx
 REBmpnLLYgFnJu0D0YovZBx3YpZcrKUv55MpnHE+kMXN/Rt6tyedPxcWJxoOeYyZB9lv
 GkV4AuH4Q/Dvn/MNBOYQ75d4TFYTb+peppx523A1iX3dQTtn2IKonuq34oOJWu3ZaN3A
 pwK+7mgEdkgijIhHslv/cZVUIRKtucyhneba/lZLlfthtFPtlO+iHfpQWDAOjlBAb4oX
 /T+g==
X-Gm-Message-State: AOAM532B9OUGDJK6K7Crd6YGY5PvDyE6bvEWpKc5J24mIOUnsQzOwg37
 5gRb/ulrWebKAdiiYu1BsHo=
X-Google-Smtp-Source: ABdhPJyXegnm+lnzB5nkdEiKy52n6ZgRIAHvhTy7NkETaaV3Ff/WvmUvrYGZRioCcZJITPM0NbegOw==
X-Received: by 2002:a17:90b:1e07:: with SMTP id
 pg7mr8738115pjb.97.1644070819294; 
 Sat, 05 Feb 2022 06:20:19 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id lx4sm5795622pjb.44.2022.02.05.06.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:20:17 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  5 Feb 2022 23:19:53 +0900
Message-Id: <20220205141956.3315419-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] mm: Remove mmu_gathers storage from remaining
 architectures
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
Cc: Jonas Bonn <jonas@southpole.se>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Brian Cain <bcain@codeaurora.org>,
 Nick Hu <nickhu@andestech.com>, David Hildenbrand <david@redhat.com>,
 linux-hexagon@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T3JpZ2luYWxseSB0aGUgbW11X2dhdGhlcnMgd2VyZSByZW1vdmVkIGluIGNvbW1pdCAxYzM5NTE3
Njk2MjEgKCJtbTogbm93CnRoYXQgYWxsIG9sZCBtbXVfZ2F0aGVyIGNvZGUgaXMgZ29uZSwgcmVt
b3ZlIHRoZSBzdG9yYWdlIikuICBIb3dldmVyLAp0aGUgb3BlbnJpc2MgYW5kIGhleGFnb24gYXJj
aGl0ZWN0dXJlIHdlcmUgbWVyZ2VkIGFyb3VuZCB0aGUgc2FtZSB0aW1lCmFuZCBtbXVfZ2F0aGVy
cyB3YXMgbm90IHJlbW92ZWQuCgpUaGlzIHBhdGNoIHJlbW92ZXMgdGhlbSBmcm9tIG9wZW5yaXNj
LCBoZXhhZ29uIGFuZCBuZHMzMjoKCk5vdGljZWQgd2hpbGUgY2xlYW5pbmcgdGhpcyB3YXJuaW5n
OgoKICAgIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jOjQxOjE6IHdhcm5pbmc6IHN5bWJvbCAnbW11
X2dhdGhlcnMnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/CgpTaWduZWQt
b2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL2hleGFn
b24vbW0vaW5pdC5jICB8IDIgLS0KIGFyY2gvbmRzMzIvbW0vaW5pdC5jICAgIHwgMSAtCiBhcmNo
L29wZW5yaXNjL21tL2luaXQuYyB8IDIgLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2hleGFnb24vbW0vaW5pdC5jIGIvYXJjaC9oZXhhZ29uL21t
L2luaXQuYwppbmRleCBmMDFlOTFlMTBkOTUuLjMxNjdhM2I1Yzk3YiAxMDA2NDQKLS0tIGEvYXJj
aC9oZXhhZ29uL21tL2luaXQuYworKysgYi9hcmNoL2hleGFnb24vbW0vaW5pdC5jCkBAIC0yOSw4
ICsyOSw2IEBAIGludCBtYXhfa2VybmVsX3NlZyA9IDB4MzAzOwogLyogIGluZGljYXRlIHBmbidz
IG9mIGhpZ2ggbWVtb3J5ICAqLwogdW5zaWduZWQgbG9uZyBoaWdoc3RhcnRfcGZuLCBoaWdoZW5k
X3BmbjsKIAotREVGSU5FX1BFUl9DUFUoc3RydWN0IG1tdV9nYXRoZXIsIG1tdV9nYXRoZXJzKTsK
LQogLyogRGVmYXVsdCBjYWNoZSBhdHRyaWJ1dGUgZm9yIG5ld2x5IGNyZWF0ZWQgcGFnZSB0YWJs
ZXMgKi8KIHVuc2lnbmVkIGxvbmcgX2RmbHRfY2FjaGVfYXR0ID0gQ0FDSEVERUY7CiAKZGlmZiAt
LWdpdCBhL2FyY2gvbmRzMzIvbW0vaW5pdC5jIGIvYXJjaC9uZHMzMi9tbS9pbml0LmMKaW5kZXgg
ZjYzZjgzOTczOGM0Li44MjVjODVjYWIxYTEgMTAwNjQ0Ci0tLSBhL2FyY2gvbmRzMzIvbW0vaW5p
dC5jCisrKyBiL2FyY2gvbmRzMzIvbW0vaW5pdC5jCkBAIC0xOCw3ICsxOCw2IEBACiAjaW5jbHVk
ZSA8YXNtL3RsYi5oPgogI2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAKLURFRklORV9QRVJfQ1BVKHN0
cnVjdCBtbXVfZ2F0aGVyLCBtbXVfZ2F0aGVycyk7CiBERUZJTkVfU1BJTkxPQ0soYW5vbl9hbGlh
c19sb2NrKTsKIGV4dGVybiBwZ2RfdCBzd2FwcGVyX3BnX2RpcltQVFJTX1BFUl9QR0RdOwogCmRp
ZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL21tL2luaXQuYyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jCmluZGV4IDk3MzA1YmRlMWIxNi4uM2EwMjFhYjZmMWFlIDEwMDY0NAotLS0gYS9hcmNoL29w
ZW5yaXNjL21tL2luaXQuYworKysgYi9hcmNoL29wZW5yaXNjL21tL2luaXQuYwpAQCAtMzgsOCAr
MzgsNiBAQAogCiBpbnQgbWVtX2luaXRfZG9uZTsKIAotREVGSU5FX1BFUl9DUFUoc3RydWN0IG1t
dV9nYXRoZXIsIG1tdV9nYXRoZXJzKTsKLQogc3RhdGljIHZvaWQgX19pbml0IHpvbmVfc2l6ZXNf
aW5pdCh2b2lkKQogewogCXVuc2lnbmVkIGxvbmcgbWF4X3pvbmVfcGZuW01BWF9OUl9aT05FU10g
PSB7IDAgfTsKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

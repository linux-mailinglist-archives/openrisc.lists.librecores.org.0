Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 109A23A238
	for <lists+openrisc@lfdr.de>; Sat,  8 Jun 2019 23:33:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EBE8A20260;
	Sat,  8 Jun 2019 23:33:02 +0200 (CEST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mail.librecores.org (Postfix) with ESMTPS id A62C520106
 for <openrisc@lists.librecores.org>; Sat,  8 Jun 2019 23:33:00 +0200 (CEST)
Received: by mail-pg1-f178.google.com with SMTP id l19so367599pgh.9
 for <openrisc@lists.librecores.org>; Sat, 08 Jun 2019 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asTTb+baUiXyfqNTosMs5RO/0ojfRs1BQxAtcDHt+gY=;
 b=GqzSKWWvpdTfSqZBAbm+RTutwgOcea3bnqvaH8vVgrPHFK4WGkXRREpVsQaA1OEPWG
 OkW1mEP5rVyIg4JHA9tvVW2E9ay/MIHHIUDtOJt6v/ZYsnT6G46QXvS5GLVM3rccpE3R
 dHYfpcrfVm2ZqaucX8wWvSm4/oAH64Curt5kT5RHcB8Zg+EIIBYuN3hvKkP34i9VSr3M
 6aI1mdU+0KG26QI601moWiBXEMIwPBvbRwrAkMQFZCxCGNLREv4StNpXoWKVKDP7ATVs
 J9RV1wU1k74qEqkg/RrWHfotQDoGegNQwecS9qnM1GPd+5NyoawMqa0DAQRg089KE6rI
 0iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asTTb+baUiXyfqNTosMs5RO/0ojfRs1BQxAtcDHt+gY=;
 b=kWmIy+Lby6WVcS7W2G9MmTqUJqDWuDg50YxD9rxZEJJick1Ot1VNpaWW5lj0HBEffV
 1M0E4OH1khZzSrzWp863FxO0ndbHFv2P9RVMVmRUTjb3sP5icEu7Q+giP3X5b48goixG
 HDS6Q+YqI5FjK9/tYRWq3QtScxZQLusGmeigrfORSOMo2/ESFDKwvRcg8OyZ7M8IsZ31
 j6Gx23+0wl04IBcWwKi8yFRLlcqNAph2J2NaMd43MaRtlpt1oz7U+B46+I5VVqFVSJzl
 v55qUukbAA1nmuokFSf3SIgyfx2V+f7tf2AsAJpjEGLZOB2OTh8BhxmnOkU2WfNkc51S
 /iAg==
X-Gm-Message-State: APjAAAW3L0ExoE8g8LBF6wQ+dlkAnHhFeAP5LrBWw7Aee1O5EGFcCfVl
 zve2kktQgjGXnWKo02xj23g=
X-Google-Smtp-Source: APXvYqx3zv8rADi9eZkrd+/RGUMCBEEcwgOGhkMR4TdJWVW8hAXzD/CvoBR5X/zyEf6xyo4udj4q5A==
X-Received: by 2002:a62:3287:: with SMTP id
 y129mr60302871pfy.101.1560029579309; 
 Sat, 08 Jun 2019 14:32:59 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id i6sm2463860pfc.55.2019.06.08.14.32.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 14:32:58 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Sun,  9 Jun 2019 06:32:24 +0900
Message-Id: <20190608213225.3230-9-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608213225.3230-1-shorne@gmail.com>
References: <20190608213225.3230-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 08/11] sim/common: wire up new unordered
 comparisons
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RGVmaW5lIGFuZCB3aXJlIHVwIHVub3JkZXJlZCBmbG9hdGluZyBwb2ludCBjb21wYXJpc29uIG9w
ZXJhdGlvbnMgZm9yIGNnZW4KdGFyZ2V0cy4gIFRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBteSBwb3N0
ZWQgY2dlbiBwYXRjaGVzWzBdLgoKWzBdIGh0dHBzOi8vd3d3LnNvdXJjZXdhcmUub3JnL21sL2Nn
ZW4vMjAxOS1xMi9tc2cwMDAxMy5odG1sCgpzaW0vY29tbW9uL0NoYW5nZUxvZzoKCnl5eXktbW0t
ZGQgIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWlsLmNvbT4KCgkqIGNnZW4tYWNjZnAuYyAo
dW5vcmRlcmVkc2YsIHVub3JkZXJlZGRmKTogTmV3IGZ1bmN0aW9ucy4KCShjZ2VuX2luaXRfYWNj
dXJhdGVfZnB1KTogV2lyZSB1cCB1bm9yZGVyZWRzZiBhbmQgdW5vcmRlcmVkZGYuCgkqIGNnZW4t
ZnB1LmggKGNnZW5fZnBfb3BzKTogRGVmaW5lIGZpZWxkcyB1bm9yZGVyZWRzZiBhbmQgdW5vcmRl
cmVkZGYuCi0tLQpDaGFuZ2VzIGZyb20gdjI6CiAtIG5ldyBwYXRjaAoKIHNpbS9jb21tb24vY2dl
bi1hY2NmcC5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrKwogc2ltL2NvbW1vbi9jZ2Vu
LWZwdS5oICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvc2ltL2NvbW1vbi9jZ2VuLWFjY2ZwLmMgYi9zaW0vY29tbW9uL2NnZW4tYWNjZnAu
YwppbmRleCA1MWY1YTI5ZmUyLi5iODk4ZGUzOTM1IDEwMDY0NAotLS0gYS9zaW0vY29tbW9uL2Nn
ZW4tYWNjZnAuYworKysgYi9zaW0vY29tbW9uL2NnZW4tYWNjZnAuYwpAQCAtMzAzLDYgKzMwMywx
OCBAQCBnZXNmIChDR0VOX0ZQVSogZnB1LCBTRiB4LCBTRiB5KQogICByZXR1cm4gc2ltX2ZwdV9p
c19nZSAoJm9wMSwgJm9wMik7CiB9CiAKK3N0YXRpYyBpbnQKK3Vub3JkZXJlZHNmIChDR0VOX0ZQ
VSogZnB1LCBTRiB4LCBTRiB5KQoreworICBzaW1fZnB1IG9wMTsKKyAgc2ltX2ZwdSBvcDI7CisK
KyAgc2ltX2ZwdV8zMnRvICgmb3AxLCB4KTsKKyAgc2ltX2ZwdV8zMnRvICgmb3AyLCB5KTsKKyAg
cmV0dXJuIHNpbV9mcHVfaXNfbmFuICgmb3AxKSB8fCBzaW1fZnB1X2lzX25hbiAoJm9wMik7Cit9
CisKKwogc3RhdGljIERGCiBmZXh0c2ZkZiAoQ0dFTl9GUFUqIGZwdSwgaW50IGhvdyBVTlVTRUQs
IFNGIHgpCiB7CkBAIC03MDMsNiArNzE1LDE3IEBAIGdlZGYgKENHRU5fRlBVKiBmcHUsIERGIHgs
IERGIHkpCiAgIHNpbV9mcHVfNjR0byAoJm9wMiwgeSk7CiAgIHJldHVybiBzaW1fZnB1X2lzX2dl
ICgmb3AxLCAmb3AyKTsKIH0KKworc3RhdGljIGludAordW5vcmRlcmVkZGYgKENHRU5fRlBVKiBm
cHUsIERGIHgsIERGIHkpCit7CisgIHNpbV9mcHUgb3AxOworICBzaW1fZnB1IG9wMjsKKworICBz
aW1fZnB1XzY0dG8gKCZvcDEsIHgpOworICBzaW1fZnB1XzY0dG8gKCZvcDIsIHkpOworICByZXR1
cm4gc2ltX2ZwdV9pc19uYW4gKCZvcDEpIHx8IHNpbV9mcHVfaXNfbmFuICgmb3AyKTsKK30KIAwK
IC8qIEluaXRpYWxpemUgRlBfT1BTIHRvIHVzZSBhY2N1cmF0ZSBsaWJyYXJ5LiAgKi8KIApAQCAt
NzM4LDYgKzc2MSw3IEBAIGNnZW5faW5pdF9hY2N1cmF0ZV9mcHUgKFNJTV9DUFUqIGNwdSwgQ0dF
Tl9GUFUqIGZwdSwgQ0dFTl9GUFVfRVJST1JfRk4qIGVycm9yKQogICBvLT5sZXNmID0gbGVzZjsK
ICAgby0+Z3RzZiA9IGd0c2Y7CiAgIG8tPmdlc2YgPSBnZXNmOworICBvLT51bm9yZGVyZWRzZiA9
IHVub3JkZXJlZHNmOwogCiAgIG8tPmFkZGRmID0gYWRkZGY7CiAgIG8tPnN1YmRmID0gc3ViZGY7
CkBAIC03NTcsNiArNzgxLDcgQEAgY2dlbl9pbml0X2FjY3VyYXRlX2ZwdSAoU0lNX0NQVSogY3B1
LCBDR0VOX0ZQVSogZnB1LCBDR0VOX0ZQVV9FUlJPUl9GTiogZXJyb3IpCiAgIG8tPmxlZGYgPSBs
ZWRmOwogICBvLT5ndGRmID0gZ3RkZjsKICAgby0+Z2VkZiA9IGdlZGY7CisgIG8tPnVub3JkZXJl
ZGRmID0gdW5vcmRlcmVkZGY7CiAgIG8tPmZleHRzZmRmID0gZmV4dHNmZGY7CiAgIG8tPmZ0cnVu
Y2Rmc2YgPSBmdHJ1bmNkZnNmOwogICBvLT5mbG9hdHNpc2YgPSBmbG9hdHNpc2Y7CmRpZmYgLS1n
aXQgYS9zaW0vY29tbW9uL2NnZW4tZnB1LmggYi9zaW0vY29tbW9uL2NnZW4tZnB1LmgKaW5kZXgg
NWY5YjU1ZDMyZS4uY2M1ZDM1NjllMSAxMDA2NDQKLS0tIGEvc2ltL2NvbW1vbi9jZ2VuLWZwdS5o
CisrKyBiL3NpbS9jb21tb24vY2dlbi1mcHUuaApAQCAtODcsNiArODcsNyBAQCBzdHJ1Y3QgY2dl
bl9mcF9vcHMgewogICBpbnQgKCpsZXNmKSAoQ0dFTl9GUFUqLCBTRiwgU0YpOwogICBpbnQgKCpn
dHNmKSAoQ0dFTl9GUFUqLCBTRiwgU0YpOwogICBpbnQgKCpnZXNmKSAoQ0dFTl9GUFUqLCBTRiwg
U0YpOworICBpbnQgKCp1bm9yZGVyZWRzZikgKENHRU5fRlBVKiwgU0YsIFNGKTsKIAogICAvKiBi
YXNpYyBERiBvcHMgKi8KIApAQCAtMTEyLDYgKzExMyw3IEBAIHN0cnVjdCBjZ2VuX2ZwX29wcyB7
CiAgIGludCAoKmxlZGYpIChDR0VOX0ZQVSosIERGLCBERik7CiAgIGludCAoKmd0ZGYpIChDR0VO
X0ZQVSosIERGLCBERik7CiAgIGludCAoKmdlZGYpIChDR0VOX0ZQVSosIERGLCBERik7CisgIGlu
dCAoKnVub3JkZXJlZGRmKSAoQ0dFTl9GUFUqLCBERiwgREYpOwogCiAgIC8qIFNGL0RGIGNvbnZl
cnNpb24gb3BzICovCiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

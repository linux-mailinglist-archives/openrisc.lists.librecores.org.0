Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8944D3638B6
	for <lists+openrisc@lfdr.de>; Mon, 19 Apr 2021 02:05:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E03DB21340;
	Mon, 19 Apr 2021 02:05:35 +0200 (CEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mail.librecores.org (Postfix) with ESMTPS id CD678210A9
 for <openrisc@lists.librecores.org>; Mon, 19 Apr 2021 02:05:33 +0200 (CEST)
Received: by mail-pf1-f173.google.com with SMTP id m11so22006224pfc.11
 for <openrisc@lists.librecores.org>; Sun, 18 Apr 2021 17:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRV5sKEgAy7cXZXMfpF2Xm1chK2owS0mkZb78yB7fYc=;
 b=OdYlPVbSPsfeDsvdwr4EYBH91OMzLIJKJtdJ6AGxFO/TXXEiNacbg9H/aUG8+V6UIf
 X3us7FCZyRA7OrSdif27/8nQRHdPWDkaqHbA9UcLfHHBmfJNSbmqXIjBN4HudQPbY4Ik
 u1EPac5uo5Foahr61Yt5dtke3zhgAC8WPwrHXSE2BTEr6dqKY7QkL4U9+h/Ysk1xS2U+
 V4xNstQwp0Qos6opmvlYY7kWLNgPS+RTZowBrRHmckIkT7OhWv8qXHis0uOufEZAkiJk
 Yo9e7QQJywY94yp8AS3FWdCQaiMmWsW7+uVwsWF+zzOIYXmJQQ9kqUX+6MJmgPGaDk2J
 WxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRV5sKEgAy7cXZXMfpF2Xm1chK2owS0mkZb78yB7fYc=;
 b=SCZV0w1Za7Zf0yZgXJbUjPJowmYJprb4+TJBqcoLWVrzjWvkt2jcI5NBsQEcRd30y8
 uJW1eFQSF+r6ZKOjaD0dQJpaIZkLT4JEbklsb94F8LS6NSt4T12iYKh9JvLGQhrK6i/P
 df6XcKIfXJ0ztQDnCAhWfJaWfj5kjR4WKJJtykMXM/OMqJkTPnSa3+mO//E0+Bl4R5CU
 yHlu1iEAqEQ+bo7QasS8DDveDkBa9JwtAL7p/DanBilpd+YpUU1ZcZEvmMqq91ExxUdo
 yQoGaqYugn7Xl3gY5EK2+i9sCx3XjZUiLO6h2aa5w3oQ7igcqMg0UaOHzx4Dtu1mYQu5
 luCw==
X-Gm-Message-State: AOAM53020w7cfdRmOZe1j8frYVU4nhgfHFQIWAhmBdJAna8+tZ6P7uDq
 L5+6aOR8EAkoPgNum62Sfwc=
X-Google-Smtp-Source: ABdhPJz+k3/KJaisNQVs4cIPDwogqvfaTRV2PXOHlN0zoA39rt4kkbwD8wzbIho2S4m5hFOH5F9J9g==
X-Received: by 2002:a63:330b:: with SMTP id z11mr9084755pgz.32.1618790732017; 
 Sun, 18 Apr 2021 17:05:32 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 j7sm10578293pfd.129.2021.04.18.17.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 17:05:31 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Mon, 19 Apr 2021 09:05:20 +0900
Message-Id: <20210419000524.3625897-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/4] OpenRISC large binary fixes
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlc2UgYXJlIHNldmVyYWwgZml4ZXMgdG8gT3BlblJJU0MgQkZEIHRvIGhhbmRsZSBpc3N1ZXMg
bW9zdGx5IHJlbGF0ZWQgdG8KbGlua2luZyBsYXJnZSBmaWxlcy4KClRoZXJlIHdpbGwgYmUgYSBH
Q0MgcGF0Y2ggdGhlbiBkZXBlbmRzIG9uIHRoaXMsIGEgbmV3IC1tY21vZGVsPWxhcmdlIGFyZ3Vt
ZW50IGlzCmFkZGVkIHRvIEdDQyB0byBhbGxvdyBjcmVhdGluZyBHT1QgcmVsb2NhdGlvbiB2YWx1
ZXMgbGFyZ2VyIHRoYW4gNjRrLgoKVGhlIHNlcmllcyBmaXhlcyAzIGlzc3VlczoKCiAqIFBSIDI3
NjI0IC0gQXNzZXJ0aW9uIGZhaWx1cmUgd2hlbiBkeW5hbWljIHN5bW9sIGlzIGxvY2FsaXplZAog
KiBQUiAyMTQ2NCAtIEdPVCByZWxvY2F0aW9uIHRydW5jYXRpb24uCiAqIFBSIDI3NzQ2IC0gSXNz
dWUgd2l0aCBzaWxlbnQgb3Zlcmxvd3MgaW4gUExUIGNvZGUuCgpTdGFmZm9yZCBIb3JuZSAoNCk6
CiAgb3IxazogRml4IGlzc3VlIHdpdGggcGx0IGxpbmsgZmFpbHVyZSBmb3IgbG9jYWwgY2FsbHMK
ICBvcjFrOiBJbXBsZW1lbnQgcmVsb2NhdGlvbiBSX09SMUtfR09UX0FISTE2IGZvciBnb3RoYSgp
CiAgb3IxazogU3VwcG9ydCBjbW9kZWw9bGFyZ2Ugd2hlbiBnZW5lcmF0aW5nIHBsdCBjb2RlCiAg
b3IxazogRmFpbCBsaW5rIGlmIHRoZSBQTFQgcmVsb2NhdGlvbiBvdmVyZmxvd3MKCiBiZmQvYmZk
LWluMi5oICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogYmZkL2VsZjMyLW9yMWsuYyAgICAg
ICAgICAgICAgICAgIHwgMTgyICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogYmZkL2xp
YmJmZC5oICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGJmZC9yZWxvYy5jICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMiArCiBjcHUvb3Ixay5vcGMgICAgICAgICAgICAgICAgICAgICAg
fCAgIDcgKy0KIGdhcy90ZXN0c3VpdGUvZ2FzL29yMWsvcmVsb2MtMS5kICB8ICAgNCArLQogZ2Fz
L3Rlc3RzdWl0ZS9nYXMvb3Ixay9yZWxvYy0xLnMgIHwgICA0ICsKIGluY2x1ZGUvZWxmL29yMWsu
aCAgICAgICAgICAgICAgICB8ICAgMSArCiBsZC90ZXN0c3VpdGUvbGQtb3Ixay9vcjFrLmV4cCAg
ICAgfCAgIDggKysKIGxkL3Rlc3RzdWl0ZS9sZC1vcjFrL3BsdGxhcmdlMS5kZCB8ICAzOCArKysr
KysrCiBsZC90ZXN0c3VpdGUvbGQtb3Ixay9wbHRsYXJnZTEucyAgfCAgMjQgKysrKwogbGQvdGVz
dHN1aXRlL2xkLW9yMWsvcGx0bGFyZ2UyLmRkIHwgIDM5ICsrKysrKysKIGxkL3Rlc3RzdWl0ZS9s
ZC1vcjFrL3BsdGxhcmdlMi5zICB8ICAyNSArKysrCiBsZC90ZXN0c3VpdGUvbGQtb3Ixay9wbHRs
aWIucyAgICAgfCAgIDEgKwogb3Bjb2Rlcy9vcjFrLWFzbS5jICAgICAgICAgICAgICAgIHwgICA3
ICstCiAxNSBmaWxlcyBjaGFuZ2VkLCAyOTYgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbGQvdGVzdHN1aXRlL2xkLW9yMWsvcGx0bGFyZ2UxLmRkCiBj
cmVhdGUgbW9kZSAxMDA2NDQgbGQvdGVzdHN1aXRlL2xkLW9yMWsvcGx0bGFyZ2UxLnMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBsZC90ZXN0c3VpdGUvbGQtb3Ixay9wbHRsYXJnZTIuZGQKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBsZC90ZXN0c3VpdGUvbGQtb3Ixay9wbHRsYXJnZTIucwoKLS0gCjIuMjYuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

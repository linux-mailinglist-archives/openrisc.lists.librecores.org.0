Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7946A3638B8
	for <lists+openrisc@lfdr.de>; Mon, 19 Apr 2021 02:05:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5937D21342;
	Mon, 19 Apr 2021 02:05:41 +0200 (CEST)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mail.librecores.org (Postfix) with ESMTPS id EA864210C8
 for <openrisc@lists.librecores.org>; Mon, 19 Apr 2021 02:05:39 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id h20so16783221plr.4
 for <openrisc@lists.librecores.org>; Sun, 18 Apr 2021 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LxT/xk3MPCrck93gZToy9MdlkNQbkk6rM7l5v7DG3OY=;
 b=nc/ovLdSguE7I46EFBWa2kmQ3SFYdUKJk4fqajxKR7n7oNw/T8KNNLxxudma/AG6Il
 Xz9QaPJSJwWVc8TLrNDt/+k/p1h599buSkWz+6KqkrxQzQEeuVyzsc5qT5+pvMB7NJAU
 0/NEQ7ei34LDJ0LQC42GAMT035OexBZkbulVaaCnmhtTD45dGhMfIAE3gYY2+owCXc/i
 GGnuxpo/65Sltim8wIQdwS4oCfi1DvbZTIsp3/R8SF8Cu4DdvDMc2S9FeXDHupgIXxyw
 FUZqmtQ4bK+8HL7FYzo9crAPIWgXKayLFzechvFaXqQgMcK0yY7pI0uAoO5dmqeowPpW
 uoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LxT/xk3MPCrck93gZToy9MdlkNQbkk6rM7l5v7DG3OY=;
 b=IAko3UWuzulwRQw9JH9OgdD2b5EUKzltt3dmeWYRBzetbph2zt/cegx9qbXlyGEPcU
 FUVFAJIA8f5T+XLwBdGsJXEneymNwjqM1Ky4Lk/Tg+5DIdIMDtqfmj783ar/MwOb/zq5
 9dmyDH4whZaavh3fQBmPwNeNq07KJ22JT+HtTtAwKaXxm3mhn2Vl48U4tivGIWElE0ZT
 U0zG63N1abALve7sjdKBY8hXqhsEEkcOKcHDCGvuSAa3P7d3tPvdln/zHC9GbucecoKp
 hxDKwgvoNRLPU3AS0LHi8DiLnceyH1V7yKHcM0vlgC8DCMXRuCIJNAsUyoir/0NwGs4A
 NXUA==
X-Gm-Message-State: AOAM533FFqEAshaJc3wsGet/2uHIcYE4zQPE2GJpabw3m5MWq4JHM2VK
 IOx6wZAu7vRTP45im0U9tt8=
X-Google-Smtp-Source: ABdhPJySOJ43fdwkpMK5ihTqCwSdXnxUcePvVRy77ePVq230kQRGpjVY7bWyt8LHotSAKg3/hJEbKA==
X-Received: by 2002:a17:90a:4890:: with SMTP id
 b16mr13921925pjh.33.1618790737940; 
 Sun, 18 Apr 2021 17:05:37 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 l191sm11440889pfd.36.2021.04.18.17.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 17:05:37 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Mon, 19 Apr 2021 09:05:21 +0900
Message-Id: <20210419000524.3625897-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419000524.3625897-1-shorne@gmail.com>
References: <20210419000524.3625897-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/4] or1k: Fix issue with plt link failure for
 local calls
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

V2hlbiBidWlsZGluZyBwcm90b2J1ZiB3ZSB3ZXJlIHNlZWluZyB0aGUgYXNzZXJ0IGZhaWx1cmU6
CgogICAgL2hvbWUvZ2l1bGlvYmVuZXR0aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2
LjEvaG9zdC9saWIvZ2NjL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8u
Li8uLi9vcjFrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmlu
dXRpbHMpIDIuMzYuMSBhc3NlcnRpb24gZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgL2hvbWUv
Z2l1bGlvYmVuZXR0aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2LjEvaG9zdC9saWIv
Z2NjL29yMWstYnVpbGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1
aWxkcm9vdC1saW51eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmludXRpbHMpIDIuMzYu
MSBhc3NlcnRpb24gZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgL2hvbWUvZ2l1bGlvYmVuZXR0
aS9naXQvdXBzdHJlYW0vb3Ixay1iaW51dGlscy0yLjM2LjEvaG9zdC9saWIvZ2NjL29yMWstYnVp
bGRyb290LWxpbnV4LXVjbGliYy85LjMuMC8uLi8uLi8uLi8uLi9vcjFrLWJ1aWxkcm9vdC1saW51
eC11Y2xpYmMvYmluL2xkOgogICAgQkZEIChHTlUgQmludXRpbHMpIDIuMzYuMSBhc3NlcnRpb24g
ZmFpbCBlbGYzMi1vcjFrLmM6MjM3NwogICAgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAx
IGV4aXQgc3RhdHVzCgpUaGlzIGZhaWx1cmUgaGFwcGVucyB3aGlsZSB3cml0aW5nIG91dCBQTFQg
ZW50cmllcywgdGhlcmUgaXMgYSBjaGVjawoiQkZEX0FTU0VSVCAoaC0+ZHluaW5keCAhPSAtMSki
IHRvIGNvbmZpcm0gYWxsIHBsdCBlbnRyaWVzIGhhdmUgZHluYW1pYwpzeW1ib2wgYXR0cmlidXRl
cy4gIFRoaXMgd2FzIGZhaWxpbmcgZm9yIHN5bWJvbHMgdGhhdCB3ZXJlCiJmb3JjZWRfbG9jYWwi
IGluIHByZXZpb3VzIGxpbmtpbmcgY29kZS4KClRoZSBmaXggYWRkcyBsb2dpYyB0byBvcjFrX2Vs
Zl9hZGp1c3RfZHluYW1pY19zeW1ib2wgdG8gaWRlbnRpZnkKImZvcmNlZF9sb2NhbCIgc3ltYm9s
cyBhbmQgZXhjbHVkZSB0aGVtIGZyb20gdGhlIHRoZSBQTFQuCgpiZmQvQ2hhbmdlTG9nOgoKCVBS
IDI3NjI0CgkqIGVsZjMyLW9yMWsuYyAob3Ixa19lbGZfYWRqdXN0X2R5bmFtaWNfc3ltYm9sKTog
Q2hhbmdlCgljb25kaXRpb24gdXNlZCB0byBjbGVhbnVwIHBsdCBlbnRyaWVzIHRvIGNsZWFudXAg
Zm9yY2VkIGxvY2FsCgllbnRyaWVzLgoKQ2M6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCA5ICsrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9iZmQvZWxmMzItb3Ixay5jIGIvYmZkL2VsZjMyLW9yMWsuYwppbmRleCAwMTNk
ZWI0MDZmOC4uY2M2YzUxMjIwZTUgMTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIv
YmZkL2VsZjMyLW9yMWsuYwpAQCAtMjU2NiwxMSArMjU2NiwxMCBAQCBvcjFrX2VsZl9hZGp1c3Rf
ZHluYW1pY19zeW1ib2wgKHN0cnVjdCBiZmRfbGlua19pbmZvICppbmZvLAogICBpZiAoaC0+dHlw
ZSA9PSBTVFRfRlVOQwogICAgICAgfHwgaC0+bmVlZHNfcGx0KQogICAgIHsKLSAgICAgIGlmICgh
IGJmZF9saW5rX3BpYyAoaW5mbykKLQkgICYmICFoLT5kZWZfZHluYW1pYwotCSAgJiYgIWgtPnJl
Zl9keW5hbWljCi0JICAmJiBoLT5yb290LnR5cGUgIT0gYmZkX2xpbmtfaGFzaF91bmRlZndlYWsK
LQkgICYmIGgtPnJvb3QudHlwZSAhPSBiZmRfbGlua19oYXNoX3VuZGVmaW5lZCkKKyAgICAgIGlm
IChoLT5wbHQucmVmY291bnQgPD0gMAorCSAgfHwgKFNZTUJPTF9DQUxMU19MT0NBTCAoaW5mbywg
aCkKKwkgIHx8IChFTEZfU1RfVklTSUJJTElUWSAoaC0+b3RoZXIpICE9IFNUVl9ERUZBVUxUCisJ
ICAgICAgJiYgaC0+cm9vdC50eXBlID09IGJmZF9saW5rX2hhc2hfdW5kZWZ3ZWFrKSkpCiAJewog
CSAgLyogVGhpcyBjYXNlIGNhbiBvY2N1ciBpZiB3ZSBzYXcgYSBQTFQgcmVsb2MgaW4gYW4gaW5w
dXQKIAkgICAgIGZpbGUsIGJ1dCB0aGUgc3ltYm9sIHdhcyBuZXZlciByZWZlcnJlZCB0byBieSBh
IGR5bmFtaWMKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

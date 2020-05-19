Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4741DA2DE
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:20 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0043D20B7B;
	Tue, 19 May 2020 22:38:19 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 1364620B76
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:17 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id v63so437141pfb.10
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTUFYwWDvOiJCsEUoawAAeSkrNPZW6mfc23MYkaJV30=;
 b=PLZGGAGKAs0QctNA1oZ00Gb+MpXRbvsY8EE1OHOD81Tl/dh8FT2O9SW/iGscPh9r2l
 qn3bYQms4d2QsoB4zT91XFiWiDF+hxRU0/O+jaEWDSwEjch3Yc9X6oh+vAHvyaP+iYOF
 rlzAc3D0NiNoll5op6UUGb6vgmyYEAJCcaGDkLXKsKlPaeBO2/bM0PWKEy90wpnPh4mr
 2h3pvX4QzKYKSTj7y9qxPsyaiqWLaUt1gOgsiVVAZbFM+Mv4/icS/vvz31UxbIHeKCE7
 P3/mbMcnRH1gkaelQsXjhwMe+ZKiEtmueK6WCEHqPuBK/s/p0BUykPtsaErwVzQl+zTs
 vmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTUFYwWDvOiJCsEUoawAAeSkrNPZW6mfc23MYkaJV30=;
 b=YD6aAzr92AIe+8Kw5GEbbFIiHI4HzSh/LWPGfcaF2Bo+c2haisSYtPVaTI8vaFctUo
 W5Wgm+SoT+wIyJa8nUjmt78I3Keup8P9QhTX9E3vaBauXcvbWdyTmmW3rKHjObnCda1z
 QmNZ7VjKyypYsVORoOyXR3pdwNyDIBtCN7MKfMbQzi/xTGvCwqva9uTIMIGfKA7DAoQu
 NmZTfnCF1u1wG9ZXghJ2glOSJ4Skq9vH3y9cCPH+/hX+m/R2LjLNXGxYPPVnA2SDoUg5
 SuTlPD+jK3fTgY4LV7Ow5bzBI2wSrZenBMQ2EoQzETHPW5unm3i/EjsM/CxNjt0DD4L6
 70lA==
X-Gm-Message-State: AOAM532Y69KHNBmS7j1SxMVDKCj0dZdZFpYQcuKYgPIxz72MYNJi0ncw
 Qb77ZEKaV4nAHGO2bFhpEkg=
X-Google-Smtp-Source: ABdhPJyagXQbDCS7D5qNOMHIoTrI37TLAGcDmruP959RAHC2VQga9DE379E79rk1KcSj926Cb2HX0g==
X-Received: by 2002:aa7:85da:: with SMTP id z26mr844925pfn.25.1589920694461;
 Tue, 19 May 2020 13:38:14 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id w7sm296734pfw.82.2020.05.19.13.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:13 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:47 +0900
Message-Id: <20200519203750.401593-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519203750.401593-1-shorne@gmail.com>
References: <20200519203750.401593-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/5] or1k: Add builtin define to detect hard float
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

VGhpcyBpcyB1c2VkIGluIGxpYmdjYyBhbmQgbm93IGdsaWJjIHRvIGRldGVjdCB3aGVuIGhhcmR3
YXJlIGZsb2F0aW5nCnBvaW50IG9wZXJhdGlvbnMgYXJlIHN1cHBvcnRlZCBieSB0aGUgdGFyZ2V0
LgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFrL29yMWsuaCAoVEFSR0VUX0NQVV9DUFBf
QlVJTFRJTlMpOiBBZGQgYnVpbHRpbgoJICBkZWZpbmUgZm9yIF9fb3Ixa19oYXJkX2Zsb2F0X18u
Ci0tLQogZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9nY2MvY29uZmlnL29yMWsvb3Ixay5oIGIvZ2NjL2Nv
bmZpZy9vcjFrL29yMWsuaAppbmRleCBiZTA4OTkwMGZkNC4uMGQ2ZmVkNWY0Y2EgMTAwNjQ0Ci0t
LSBhL2djYy9jb25maWcvb3Ixay9vcjFrLmgKKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaApA
QCAtMzAsNiArMzAsOCBAQAogICAgICAgYnVpbHRpbl9kZWZpbmUgKCJfX29yMWtfXyIpOwkJXAog
ICAgICAgaWYgKFRBUkdFVF9DTU9WKQkJCQlcCiAJYnVpbHRpbl9kZWZpbmUgKCJfX29yMWtfY21v
dl9fIik7CVwKKyAgICAgIGlmIChUQVJHRVRfSEFSRF9GTE9BVCkJCQlcCisJYnVpbHRpbl9kZWZp
bmUgKCJfX29yMWtfaGFyZF9mbG9hdF9fIik7CVwKICAgICAgIGJ1aWx0aW5fYXNzZXJ0ICgiY3B1
PW9yMWsiKTsJCVwKICAgICAgIGJ1aWx0aW5fYXNzZXJ0ICgibWFjaGluZT1vcjFrIik7CQlcCiAg
ICAgfQkJCQkJCVwKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

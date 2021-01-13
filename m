Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F21BE2F5547
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:50:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D561F210A6;
	Thu, 14 Jan 2021 00:50:52 +0100 (CET)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mail.librecores.org (Postfix) with ESMTPS id 299D320CA6
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:50:51 +0100 (CET)
Received: by mail-pf1-f179.google.com with SMTP id d2so2263077pfq.5
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUTm83yRPEnjBhuGgNvm8aYlri5fi3kDaJSpursn2y0=;
 b=sGmvUlxVuin9CLnQoNvPwo0jPTzLMbkhHAo2ibTPsm5G9HT3+iIP4nZxOIx7JhOhln
 yT/TD58DuKm61pKoJwBlGMjY8cil962nrdMFMi0qG/X+XrX5erpHs4tcTfdqjRd8g5R9
 F770+upAZkeCfHN/E1mgqOSmUZzNLj0Pu89APvQ+LcTH1jBbp6KF0WA1DkYhs6aoA/gb
 bQYVTawAIo3e0LH6fAwb6/MYKYJhIwI3OkfverOaUhNJy0koj2noSrScqnkdx5fXIag3
 CTFt2O86xC9qFxRz6YI3Jg6yYSsUkYSbZaeQ+hckEATvVqq0wjXiZh2Ew5mbt6+3l/lT
 nGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kUTm83yRPEnjBhuGgNvm8aYlri5fi3kDaJSpursn2y0=;
 b=jmtmkOJselzZJRNuLIBtjQDZPqzyXDWWZ0ndCsZzKcfsOSgihTeRT80tzhMN0YSL6+
 6+Vc7BM/Hla/2g1nIOWn8XaWuKfaqRfO4wLLrT3y2TWotIV1Py+a8HuGX+Lp838/BwOD
 7pdD86fs01fuU3U8orszCNSuU4bdVcY4LxIvQNPW+/sjv+ussmix45UA3737aaSVFH1C
 /bB4t/LSLkSK5agznbaEDSDWDIEbrdSUBunoCotcthh/DJczuvnUzBGEJYOrYSFVj0cz
 nTGykUnu8fF+8DrOlwZ/MfiOodNtXT7kbTZtqZ/9IdwG6i8WHazost52K9jpXYhtQHgW
 GSeQ==
X-Gm-Message-State: AOAM5315WxtRrxBfeDo2fpqjHLPD3ENcpxbrzL5mTNlE53lEeFlFxYy/
 lhrhNhRgI0sCtV8ISUhI7UtyRFF3K9U=
X-Google-Smtp-Source: ABdhPJyWTG1c/COd1W1ZMPw5VaeOFG+PZEBQLJtlR4pudaMqZmOKa5Ssy7/TZVYJfeFkoMOpfW/WIA==
X-Received: by 2002:a63:1965:: with SMTP id 37mr4424703pgz.349.1610581849885; 
 Wed, 13 Jan 2021 15:50:49 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 b11sm3202675pjg.27.2021.01.13.15.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:49 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:29 +0900
Message-Id: <20210113235032.2821155-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113235032.2821155-1-shorne@gmail.com>
References: <20210113235032.2821155-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/5] or1k: Add builtin define to detect hard
 float
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
bmZpZy9vcjFrL29yMWsuaAppbmRleCBkYzU3OWU0YTM4OC4uYjY4NmYxYmQxNTkgMTAwNjQ0Ci0t
LSBhL2djYy9jb25maWcvb3Ixay9vcjFrLmgKKysrIGIvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaApA
QCAtMzAsNiArMzAsOCBAQAogICAgICAgYnVpbHRpbl9kZWZpbmUgKCJfX29yMWtfXyIpOwkJXAog
ICAgICAgaWYgKFRBUkdFVF9DTU9WKQkJCQlcCiAJYnVpbHRpbl9kZWZpbmUgKCJfX29yMWtfY21v
dl9fIik7CVwKKyAgICAgIGlmIChUQVJHRVRfSEFSRF9GTE9BVCkJCQlcCisJYnVpbHRpbl9kZWZp
bmUgKCJfX29yMWtfaGFyZF9mbG9hdF9fIik7CVwKICAgICAgIGJ1aWx0aW5fYXNzZXJ0ICgiY3B1
PW9yMWsiKTsJCVwKICAgICAgIGJ1aWx0aW5fYXNzZXJ0ICgibWFjaGluZT1vcjFrIik7CQlcCiAg
ICAgfQkJCQkJCVwKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

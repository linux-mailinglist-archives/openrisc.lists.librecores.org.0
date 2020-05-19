Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 248921DA2E2
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:27 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E084320B83;
	Tue, 19 May 2020 22:38:26 +0200 (CEST)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by mail.librecores.org (Postfix) with ESMTPS id B8EC820B78
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:25 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id v63so437300pfb.10
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1eS04HQIrseje/Q4T6o8uHgDrYxqZKme96HxdkpBXa4=;
 b=lQ0zEDCLY3BS0QNmcH/7WZc4Q2beiCLJiCC6jWDGrNUhyNX/iDPn3gcbvR40VASZE+
 m8p/7S0O8P2rwi6KUmEbxwkFWB1PN0ia2Hgcs1uup2JXn4cT3HQLB0VLMtZ5d1ZpwsRY
 eeEPQCwCjyXYFsfmSXOY1aCeht9NcnFIchHJubnM6dC4dTChm2HoOERfK1sXRJnTVWPw
 0NGBpJP6y+vRtbGrjJaxTZoreHERAFpDU5UR62mBk6j/YUO0gRfQzYmyYJ4wOVFJU0dl
 FQO6IwJp40zcNLTx/XpT7agscHkXTTO3QMvJbLfAwNPiyu5K72bF2ckjve7f6O6Lv+au
 nBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1eS04HQIrseje/Q4T6o8uHgDrYxqZKme96HxdkpBXa4=;
 b=ZXOkJeBlpTX82EVIAyn0UNxSHPNI4MZjEQLl1I67kHRLiOxuSulW8Lz0OhaSpMx5Fy
 l0xo60EarIrA6RfbfFvBR3Onw1ze+7Bl35gJwiiJh/OaPWlT6WzORMpBw/30W3JbegPM
 khVcW0/xvpiinRHjzONCUS1X5rR1a56nPLJ6pWChUI+gpUvWMYzhrx2gpH7WXkBdI7IV
 /11VkmAO/TKSQ5E7nruunOBADT2rGPsvZmIrAafCk0DNjcg4ucshjEl1Tggk472q9SlS
 /DbV9wgvnEek2Bn+/1754IEapqpeRowJCFBu7pPOURsFG9OY4ZAQVrApDjKccQz/5IUN
 Ph1Q==
X-Gm-Message-State: AOAM531vhRqESK4A/eP7c0dd6ZNy8s4qWO5ewwrvhZqxmZVxmwBlvt+m
 bLr+RHD/0ZTSbh4FQDEOHIY=
X-Google-Smtp-Source: ABdhPJzXtVcvvi+QZNY4+c4tQolyJJbB0rLBt8tUwady0uW+SQtRQn/w8eS3GGpklG+i/hbA4yFEoQ==
X-Received: by 2002:a63:f958:: with SMTP id q24mr931203pgk.338.1589920704353; 
 Tue, 19 May 2020 13:38:24 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id h17sm313111pfr.25.2020.05.19.13.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:23 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:50 +0900
Message-Id: <20200519203750.401593-6-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519203750.401593-1-shorne@gmail.com>
References: <20200519203750.401593-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 5/5] or1k: Fixup exception header data encodings
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

V2hpbGUgcnVubmluZyBnbGliYyB0ZXN0cyBzZXZlcmFsICotdGV4dHJlbCB0ZXN0cyBmYWlsZWQg
c2hvd2luZyB0aGF0CnJlbG9jYXRpb25zIHJlbWFpbmVkIGFnYWluc3QgcmVhZCBvbmx5IHNlY3Rp
b25zLiAgSXQgdHVybmVkIG91dCB0aGlzIHdhcwpyZWxhdGVkIHRvIGV4Y2VwdGlvbiBoZWFkZXJz
IGRhdGEgZW5jb2RpbmcgYmVpbmcgd3JvbmcuCgpCeSBkZWZhdWx0IHBvaW50ZXIgZW5jb2Rpbmcg
d2lsbCBhbHdheXMgdXNlIHRoZSBEV19FSF9QRV9hYnNwdHIgZm9ybWF0LgoKVGhpcyBwYXRjaCB1
c2VzIGZvcm1hdCBEV19FSF9QRV9wY3JlbCBhbmQgRFdfRUhfUEVfc2RhdGE0LiAgT3B0aW9uYWxs
eQpEV19FSF9QRV9pbmRpcmVjdCBpcyBpbmNsdWRlZCBmb3IgZ2xvYmFsIHN5bWJvbHMuICBUaGlz
IGVsaW1pbmF0ZXMgdGhlCnJlbG9jYXRpb25zLgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9v
cjFrL29yMWsuaCAoQVNNX1BSRUZFUlJFRF9FSF9EQVRBX0ZPUk1BVCk6IE5ldyBtYWNyby4KLS0t
CiBnY2MvY29uZmlnL29yMWsvb3Ixay5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZ2NjL2NvbmZpZy9vcjFrL29yMWsuaCBiL2djYy9jb25m
aWcvb3Ixay9vcjFrLmgKaW5kZXggMGQ2ZmVkNWY0Y2EuLjJmZTYyZjBiOTBjIDEwMDY0NAotLS0g
YS9nY2MvY29uZmlnL29yMWsvb3Ixay5oCisrKyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmgKQEAg
LTQwOCw0ICs0MDgsOCBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAoKE4pIDwgNCA/IEhXX1RPX0dDQ19SRUdOTyAoMjUpICsg
KE4pIDogSU5WQUxJRF9SRUdOVU0pCiAjZGVmaW5lIEVIX1JFVFVSTl9TVEFDS0FESl9SVFggZ2Vu
X3J0eF9SRUcgKFBtb2RlLCBFSF9SRVRVUk5fUkVHTlVNKQogCisvKiBTZWxlY3QgYSBmb3JtYXQg
dG8gZW5jb2RlIHBvaW50ZXJzIGluIGV4Y2VwdGlvbiBoYW5kbGluZyBkYXRhLiAgKi8KKyNkZWZp
bmUgQVNNX1BSRUZFUlJFRF9FSF9EQVRBX0ZPUk1BVChDT0RFLCBHTE9CQUwpIFwKKyAgKCgoR0xP
QkFMKSA/IERXX0VIX1BFX2luZGlyZWN0IDogMCkgfCBEV19FSF9QRV9wY3JlbCB8IERXX0VIX1BF
X3NkYXRhNCkKKwogI2VuZGlmIC8qIEdDQ19PUjFLX0ggKi8KLS0gCjIuMjYuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

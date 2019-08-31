Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 04D4BA41DF
	for <lists+openrisc@lfdr.de>; Sat, 31 Aug 2019 05:04:24 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E124C204E5;
	Sat, 31 Aug 2019 05:04:23 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id 71D68202DD
 for <openrisc@lists.librecores.org>; Sat, 31 Aug 2019 05:04:22 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id b24so5793170pfp.1
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 20:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYGiEbsiokKiZ5MvOpc0AKjBaUE0xFO3Aa5RPowPPwY=;
 b=PshT8ZytHxwcPCOM5tGaZycAo+7DMB9o6X2TuilJu8qmJuu+lDO5EThVnwX/fFyz02
 U2ZEbBmvDNLFkmvXpGG5XjZACUvpt5QFpAcP58QitjZNBbQRIobrE8lKH/k2Y0OwDOhX
 rfym6+ye7SMnGQp1YkF6TZJOxFPr/ciO8RREHtxTDFz8ZJtdTu+xER2AauuANEqyN/uK
 eZY1/Y9inZxd2lEiWwygFQN5mzHRwmWfIHXqjTbpd/kpw5qu+HRWZOW4prwgJ9pHHt0x
 SSvCWMOEHcPcCTK33W3xHcYYF6P1ac6/GWijr1HgQDgf84et4J7M0MvDxTW/HFTzG5fd
 0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MYGiEbsiokKiZ5MvOpc0AKjBaUE0xFO3Aa5RPowPPwY=;
 b=H1qKR4Gps78M2F0N5CbZuiTNjqgjiXmiuRUTbBSYkTq1Dcdr9R4Yh8S/T6GDxfOQQI
 JmxxGHVFGqKSq09cgtUlfXM2N//TPm0NzE9F3dthsONKBHSlIcHxfZ6sxgEzVOOCVfqq
 v945BATwFzdxDCsSDr+6ulF4CGrVkHvyjOtto+7BX844QZQkYWUeaK4ZVWDW4GExjUqh
 KK9eeQcvgnLkCk2Kz24xMFWXArLcXcK5R7dHpCKoQ2fATIBIxGCxWQ/YlFmm41GNm+e4
 b0cZGuDyBPJQEEso0jiRCuZtloEdWVvExEItITvXjZWpg+GwssB9e0h/d25D2Mw0x/qt
 df6g==
X-Gm-Message-State: APjAAAW0t6uK5ydUZYwnJ80Gwq8SqVQ5akydvi2xhviB4iJQ1Wmop4wj
 v++aw741GbdTVLBz1Kdvwdo=
X-Google-Smtp-Source: APXvYqw908NMPegI5hirfkJRriAJql5dmlJKaNWGJ3VRrMbz/82bw4TzQpwpgyUD4S41HAFgtSrnSw==
X-Received: by 2002:a63:c0d:: with SMTP id b13mr15380450pgl.420.1567220660925; 
 Fri, 30 Aug 2019 20:04:20 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 c13sm9423439pfi.17.2019.08.30.20.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 20:04:20 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat, 31 Aug 2019 12:03:48 +0900
Message-Id: <20190831030348.6920-3-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190831030348.6920-1-shorne@gmail.com>
References: <20190831030348.6920-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/2] or1k: dts: Add ethoc device to SMP devicetree
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonas Bonn <jonas@southpole.se>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBwYXRjaCBhZGRzIHRoZSBldGhvYyBkZXZpY2UgY29uZmlndXJhdGlvbiB0byB0aGUgT3Bl
blJJU0MgYmFzaWMgU01QCmRldmljZSB0cmVlIGNvbmZpZy4gIFRoaXMgd2FzIHRlc3RlZCB3aXRo
IHFlbXUuCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4K
LS0tCiBhcmNoL29wZW5yaXNjL2Jvb3QvZHRzL3NpbXBsZV9zbXAuZHRzIHwgNiArKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNj
L2Jvb3QvZHRzL3NpbXBsZV9zbXAuZHRzIGIvYXJjaC9vcGVucmlzYy9ib290L2R0cy9zaW1wbGVf
c21wLmR0cwppbmRleCBkZWZiYjkyNzE0ZWMuLjcxYWYwZTExN2JmZSAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9ib290L2R0cy9zaW1wbGVfc21wLmR0cworKysgYi9hcmNoL29wZW5yaXNjL2Jv
b3QvZHRzL3NpbXBsZV9zbXAuZHRzCkBAIC02MCw0ICs2MCwxMCBAQAogCQljbG9jay1mcmVxdWVu
Y3kgPSA8MjAwMDAwMDA+OwogCX07CiAKKwllbmV0MDogZXRob2NAOTIwMDAwMDAgeworCQljb21w
YXRpYmxlID0gIm9wZW5jb3JlcyxldGhvYyI7CisJCXJlZyA9IDwweDkyMDAwMDAwIDB4ODAwPjsK
KwkJaW50ZXJydXB0cyA9IDw0PjsKKwkJYmlnLWVuZGlhbjsKKwl9OwogfTsKLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

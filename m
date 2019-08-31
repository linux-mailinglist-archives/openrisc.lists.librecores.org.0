Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0B456A41DB
	for <lists+openrisc@lfdr.de>; Sat, 31 Aug 2019 05:04:16 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BE78C204E3;
	Sat, 31 Aug 2019 05:04:15 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id CD3D7202DD
 for <openrisc@lists.librecores.org>; Sat, 31 Aug 2019 05:04:14 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id az1so3207388plb.6
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 20:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3eYb4+6SsdvBfSijyDeAJEqJyXxATKZLhU6gQW/pUAc=;
 b=gNjQm5Dtamz9eBrmYZ8uV7PQ6AYvGvXnal90ibmz0M0hzSlr39EHpOCj5ronLeRZ+L
 MvTDUHMp0l2zzvLWrXu/Hq5ENinizdOR6/dR3PCN0JQdfXRvQHa6TMLG9Y+QBVk2wbIc
 IOLDetBCJjFQD8Fv1/9QWQ+9O2j/E0B4UDB5yiWEYp/T4AhXUCE0hXgIwRu1k58isj7l
 EyhDx3MnqyfWpxYtu1HPuJpMVNCaISZL0shzJf7206xGn9PxQh0z0eQA9vEdXYD06V+f
 qmbz19DBjWilfTgDS/3v8u+U5entQpXORBKJ7OUpHoootbRmhwwtkVaGG47XeM8aHPaC
 4vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3eYb4+6SsdvBfSijyDeAJEqJyXxATKZLhU6gQW/pUAc=;
 b=G/X4rF2762OuOAevL9ja+5+y4tg8H/U9vRg9Oqudf/ShUsJVwpsMUyaqFu//EG4AWc
 8nYwcKniV6pv4A/dUxOqNaFGp/RSt14nhQOmlZXv1okgAsF+CgedYZPASPYNNmBsFXV/
 wVjp3VDeh3oUXbmSTFzj8LEYAcMdzpr8c/OPI7gsDQ/LIJBrGgphPKwSfGS9BeKsWcRA
 aVBEWubBWBaMHxU/mcu7vcvfZsiU3CDXbuMFKFpPp4iwgcBV0AMplyQ+RSjRm7Nm6hrF
 g3aM3G1WEzmie4CPADQdD+aGsXDmQhCqqywqIkeWc8k1XO8o4x0qVar9yrXzxq5vRlY4
 ovUQ==
X-Gm-Message-State: APjAAAVj3pr7jz0oJj3dOmDSn0gXJCRna7GNQZ3KXKyv85pOBHRJF+6O
 dzOQHYmy48NrDAe84SIK8sY=
X-Google-Smtp-Source: APXvYqx37ESP3WGLV45DmZKhwMPWYD0yOSFWuZrWapQYBZWi5aZEcWv/g8nJrt/0rVD5qkTTpaXOBA==
X-Received: by 2002:a17:902:e83:: with SMTP id
 3mr17731303plx.319.1567220653007; 
 Fri, 30 Aug 2019 20:04:13 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 d20sm8211024pfo.90.2019.08.30.20.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 20:04:12 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat, 31 Aug 2019 12:03:47 +0900
Message-Id: <20190831030348.6920-2-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190831030348.6920-1-shorne@gmail.com>
References: <20190831030348.6920-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/2] or1k: dts: Fix ethoc network configuration
 in or1ksim devicetree
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

VGhpcyBmaXhlcyBzZXZlcmFsIGlzc3VlcyB3aXRoIHRoZSBldGhvYyBuZXR3b3JrIGRldmljZSBj
b25maWcuCgpGaXNydCBvZmYsIHRoZSBjb21wYXRpYmxlIHByb3BlcnR5IHVzZWQgYW4gb2Jzb2xl
dGUgY29tcGF0aWJpbGl0eQpzdHJpbmc7IHRoaXMgY2F1c2VkIHRoZSBpbml0aWFsaXphdGlvbiB0
byBiZSBza2lwcGVkLiAgTmV4dCwgdGhlCnJlZ2lzdGVyIG1hcCB3YXMgbm90IGdpdmVuIGVub3Vn
aCBzcGFjZSB0byBhbGxvY2F0ZSByaW5nIGRlc2NyaXB0b3JzLAp0aGlzIGNhdXNlZCBtb2R1bGUg
aW5pdGlhbGl6YXRpb24gdG8gYWJvcnQuICBGaW5hbGx5LCB3ZSBuZWVkIHRvIG1hcmsKdGhpcyBk
ZXZpY2UgYXMgYmlnLWVuZGlhbiBhcyBuZWVkZWQgYnkgb3BlbnJpc2MuCgpUaGlzIHdhcyB0ZXN0
ZWQgYnkgbWUgaW4gcWVtdSwgdGhlIHNldHVwIGlzIGRvY3VtZW50ZWQgb24gdGhlIHFlbXUgd2lr
aToKCiAgaHR0cHM6Ly93aWtpLnFlbXUub3JnL0RvY3VtZW50YXRpb24vUGxhdGZvcm1zL09wZW5S
SVNDCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0t
CiBhcmNoL29wZW5yaXNjL2Jvb3QvZHRzL29yMWtzaW0uZHRzIHwgNSArKystLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L29wZW5yaXNjL2Jvb3QvZHRzL29yMWtzaW0uZHRzIGIvYXJjaC9vcGVucmlzYy9ib290L2R0cy9v
cjFrc2ltLmR0cwppbmRleCBkOGFhODMwOWM5ZDMuLmMwY2I3NGU1MmY5NSAxMDA2NDQKLS0tIGEv
YXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrc2ltLmR0cworKysgYi9hcmNoL29wZW5yaXNjL2Jv
b3QvZHRzL29yMWtzaW0uZHRzCkBAIC00OSw4ICs0OSw5IEBACiAJfTsKIAogCWVuZXQwOiBldGhv
Y0A5MjAwMDAwMCB7Ci0JCWNvbXBhdGlibGUgPSAib3BlbmNvcmVzLGV0aG1hYy1ydGxzdm4zMzgi
OwotCQlyZWcgPSA8MHg5MjAwMDAwMCAweDEwMD47CisJCWNvbXBhdGlibGUgPSAib3BlbmNvcmVz
LGV0aG9jIjsKKwkJcmVnID0gPDB4OTIwMDAwMDAgMHg4MDA+OwogCQlpbnRlcnJ1cHRzID0gPDQ+
OworCQliaWctZW5kaWFuOwogCX07CiB9OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

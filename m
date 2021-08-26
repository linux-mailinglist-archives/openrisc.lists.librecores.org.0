Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 235023F88F7
	for <lists+openrisc@lfdr.de>; Thu, 26 Aug 2021 15:30:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F0D59213F3;
	Thu, 26 Aug 2021 15:29:59 +0200 (CEST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mail.librecores.org (Postfix) with ESMTPS id CFF6220D48
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 15:29:58 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id 18so2761186pfh.9
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LoLO1M4+QB+q2rsvGYbdf/T5USS23kElc9PZhkYyxM=;
 b=q+7zG5oZRWCTcfUjkCkBkprxotYrBiGWK1kdfs4WY/yY5ERaszNTJQ0qG2UuMCC4o9
 YQvjayWXCwsH9bHMU87evauTv66bYJ4z6E51JZdKSWz85RnXtDql02XdtdmjMETYoWD5
 Hezd3P1aR3lQDpfT1vbzAgU5X8bCHwoGc+taGBiRneJau0JRtasL0rcBFEBmQMLUOFA8
 +3S8K++kzjoh9wQoK/1sKMU7emtdvCQedFg7WOJJozqEV8IRktV4CcFl9bjoS+NVNFFp
 cM8+Dsi3cEplHnJGVgRznVTUOtlrlWFDO6gm5rh84NzYmvMgckYaiSIHFJvBfD0Q/iZq
 KxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+LoLO1M4+QB+q2rsvGYbdf/T5USS23kElc9PZhkYyxM=;
 b=N8fF/e/2G+Jr/LxRU3d3qYZeZayNVkSleznMUHe5OtgddVe40xF5Bs4NLLT2/gJ+6P
 O3gCLCnlIkJKes6zTSUDrzmemfnCxRcpdYld02ZELChTEkZx5yA0+HRitZHtxeA3tvgF
 6t9RTr/Rt0zRsiWLDtJYlSJdbLfFs+BV557l+a+U7orm/V9sRqiR42kTtLp1Ov0aCtRM
 Tx9kf0vaTIT18NTG5Rk4vUoUtCnOf0raMSvcvr6uEmguZhjQw7GnbsgnKLaFowXMJCJg
 Sues89K5wnet37PPFtXCx6A28W3GBficuQBFonIc4R2/A4z3HsnjpSsU76MH6UG/5urD
 CnSA==
X-Gm-Message-State: AOAM5321t/O4LliIK1a1e754oLiblctEe7FdnBOgy9opiGREYO4IkpEN
 AU2kl2dcms4wGd3gwCshuyE=
X-Google-Smtp-Source: ABdhPJyIIDSvk072nKRS5xd/3OaR0yLI18mTOtlLdnEwy1XJTW+8VdKvVifbbSoNWJVKIhDUVzi5bg==
X-Received: by 2002:aa7:8685:0:b0:3e1:76d8:922e with SMTP id
 d5-20020aa78685000000b003e176d8922emr3811341pfo.45.1629984597420; 
 Thu, 26 Aug 2021 06:29:57 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w186sm3359693pfw.78.2021.08.26.06.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:29:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stafford Horne <shorne@gmail.com>
Date: Thu, 26 Aug 2021 22:59:44 +0930
Message-Id: <20210826132946.3324593-2-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826132946.3324593-1-joel@jms.id.au>
References: <20210826132946.3324593-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/3] openrisc/litex: Update uart address
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmVjZW50IGxpdGV4IHNvY3Mgd2lsbCBwbGFjZSB0aGUgVUFSVCBhdCAweGUwMDA2ODAwLgoKU2ln
bmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KLS0tCiBhcmNoL29wZW5y
aXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9i
b290L2R0cy9vcjFrbGl0ZXguZHRzIGIvYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0ZXgu
ZHRzCmluZGV4IDNmOTg2N2FhMzg0NC4uYmFiYTRmNDlmYTZiIDEwMDY0NAotLS0gYS9hcmNoL29w
ZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMKKysrIGIvYXJjaC9vcGVucmlzYy9ib290L2R0
cy9vcjFrbGl0ZXguZHRzCkBAIC00MSwxMCArNDEsMTAgQEAgcGljOiBwaWMgewogCQlpbnRlcnJ1
cHQtY29udHJvbGxlcjsKIAl9OwogCi0Jc2VyaWFsMDogc2VyaWFsQGUwMDAyMDAwIHsKKwlzZXJp
YWwwOiBzZXJpYWxAZTAwMDY4MDAgewogCQlkZXZpY2VfdHlwZSA9ICJzZXJpYWwiOwogCQljb21w
YXRpYmxlID0gImxpdGV4LGxpdGV1YXJ0IjsKLQkJcmVnID0gPDB4ZTAwMDIwMDAgMHgxMDA+Owor
CQlyZWcgPSA8MHhlMDAwNjgwMCAweDEwMD47CiAJfTsKIAogCXNvY19jdHJsMDogc29jX2NvbnRy
b2xsZXJAZTAwMDAwMDAgewotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

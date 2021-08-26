Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 58F743F88F8
	for <lists+openrisc@lfdr.de>; Thu, 26 Aug 2021 15:30:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3726A209D6;
	Thu, 26 Aug 2021 15:30:03 +0200 (CEST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mail.librecores.org (Postfix) with ESMTPS id C123C240E1
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 15:30:01 +0200 (CEST)
Received: by mail-pf1-f177.google.com with SMTP id v123so2757622pfb.11
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 06:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wrvpFTSxP6HC2hI5yw+6G74dP3xB/sdGF5ca/iz2uZg=;
 b=PSyPUMySQ272wCedf3L7LMw2fgz26+HTzsV4qnMo5wekkx9eLAXscV+7Es2Flz8jXR
 OunYwFk2d9oigiQPcky7fi5a1+wUo0PGiPnAvOjmOEaaCLczeYVviAIXI4ZBshCzx84L
 5dn+BJQE/FRSbCJ41f2ZxHvQNwOt2auQ/gXgvE4zlNCWs45TZhOrhuxLY5YKStswEcOG
 4+bnrw327o2hAZ1ypgLdnc/YYeQhQ23ERU89SuWuuNwj5bgTpPQT04EPTfQrmGFwRna7
 fsZuISZUcMC9Wj8tbebRgV8mfFU4QxQTvuvClgUSsHjWZQxJlx2F8MZdDWzx3GPXlQX2
 yfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wrvpFTSxP6HC2hI5yw+6G74dP3xB/sdGF5ca/iz2uZg=;
 b=ucqfDlrn68UoT0ejV1MGbOa9R4zgFg29n/ovsv2z8yOCdApiWzmkuD3wKurfTzdzQY
 XOJjjtedz4nzlAyGAx2u1Qqe1mwJkXmG8xiNEmm9k2uptiziiEufuzc23IGzUxZefptF
 PvgB/8Izo8bkMSNNGGhpLeQN2PxZUv4H0kK0k6/kkxxAf7e4OMPt2PvjWgUu81M2c/gb
 XV0avB8MNDlrHwRxMH1zTXF/fhCTMwXXhFF1OKKAJK3PYz+gKRG/ctUx7wTslZOiFXBP
 fwf+3BMmNUi4s9Rau4qs/ND/NBO3V4GF4KOAoWzRm2emUTxMgrdnin8LQj3ADMszUrqa
 NUgA==
X-Gm-Message-State: AOAM532qKUv4qG5TQqa359RcPsNKzj4tTeVstPzxk7Dp+snkkh8OxfLS
 y/xiUPsD2SyhkaWTK5OO8q0=
X-Google-Smtp-Source: ABdhPJyqR3mcchVS+Vw70cjzEDXYGU9iGVMMKeiGJel65hq2L74vF6ub7bnRf7BXcY9iAhFAwccZww==
X-Received: by 2002:aa7:86c3:0:b0:3eb:1857:8ae9 with SMTP id
 h3-20020aa786c3000000b003eb18578ae9mr3761399pfo.52.1629984600436; 
 Thu, 26 Aug 2021 06:30:00 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w186sm3359693pfw.78.2021.08.26.06.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:29:59 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stafford Horne <shorne@gmail.com>
Date: Thu, 26 Aug 2021 22:59:45 +0930
Message-Id: <20210826132946.3324593-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826132946.3324593-1-joel@jms.id.au>
References: <20210826132946.3324593-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/3] openrisc/litex: Add ethernet device
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

QWRkIHRoZSBsaXRlZXRoIGV0aGVybmV0IGRldmljZS4KClNpZ25lZC1vZmYtYnk6IEpvZWwgU3Rh
bmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQogYXJjaC9vcGVucmlzYy9ib290L2R0cy9vcjFrbGl0
ZXguZHRzIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMgYi9hcmNoL29w
ZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMKaW5kZXggYmFiYTRmNDlmYTZiLi45MWM3MTcz
YzUwZTYgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2MvYm9vdC9kdHMvb3Ixa2xpdGV4LmR0cwor
KysgYi9hcmNoL29wZW5yaXNjL2Jvb3QvZHRzL29yMWtsaXRleC5kdHMKQEAgLTUyLDQgKzUyLDEz
IEBAIHNvY19jdHJsMDogc29jX2NvbnRyb2xsZXJAZTAwMDAwMDAgewogCQkJcmVnID0gPDB4ZTAw
MDAwMDAgMHhjPjsKIAkJCXN0YXR1cyA9ICJva2F5IjsKIAl9OworCisJZXRoZXJuZXRAZTAwMDEw
MDAgeworCQljb21wYXRpYmxlID0gImxpdGV4LGxpdGVldGgiOworCQlyZWcgPSA8MHhlMDAwMTAw
MCAweDdjPiwKKwkJICAgICAgPDB4ZTAwMDE4MDAgMHgwYT4sCisJCSAgICAgIDwweDgwMDAwMDAw
IDB4MjAwMD47CisJCXJlZy1uYW1lcyA9ICJtYWMiLCAibWRpbyIsICJidWZmZXIiOworCQlpbnRl
cnJ1cHRzID0gPDI+OworCX07CiB9OwotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

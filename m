Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5979844F0FF
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:17:24 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 412DC242D7;
	Sat, 13 Nov 2021 04:17:24 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 50307242BF
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:17:22 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so8661913pja.1
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDOoVMoL0EiKtwumnKUVKWo2KGfZN6Ez9FVUb2hA8yg=;
 b=U/N99X4HrPdkGYBDl0MZ8aSbkSMnvFLeN6qnJy7Vw1mxaXmiol5qQLl2/f2vEfX3TG
 ImXZuJDMvp05MYEtNJGw5HofIalCkeRhHojZOpNFyD3I8jtJMV15f6PGasHURPsA2oIV
 OY/Rr5IZinJuzLjC07E1r9bteLijytbcdrCVMWVEJHuE2fx06bGFc2P4D/biWnp9AlsP
 i+InLt3i+6GWsiMRM9HPgXYj8YvDnA1QPN4kTH/BmZG9orEfoXU0RE0bLqnGjgqV2ysb
 gq/9wr2hr4ei2x+zFzK+7oPyHLiH2ysVuLnQsdzHFUeC+tArISHG6T7tujRdM09q9EgE
 Ws7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LDOoVMoL0EiKtwumnKUVKWo2KGfZN6Ez9FVUb2hA8yg=;
 b=E4TqHVckdUkDdxZadgecbUPnU9vMEUr+klhH7c++JE4BPJ6s0vJwebcWMYKcK19Tpr
 Dy+calkxYBFolNHuCTNw2H8/2ZHicLptAIImB4Y6mf5pQuLetKF8ws55WFSAD7+DsHB/
 ArlnHZ4i5xD9KnnOS8jYSrTuOexq+LhdEsOViKUAae6VWYbMSyeSA/YzB/fi0tiHa29R
 0oJXSrtdh5Yzp11OLfPy9GQm4JIIlRpZ8ikP3wnbd6kEYZCJ99d/wIW+DVH29RysV8I0
 xPVqT/H1S6hL1d15wpFGkxA8LbmJqGJ+5ADUzJG7wdi7HGXd4y46yrOrYp+ThRw+ejXh
 af/Q==
X-Gm-Message-State: AOAM533IfQx9qPr5m1XQth6P20Bctd2PJB2Fw2R6cT8WqiMLAfaanB3X
 SFR4MQyp+Nq1DXFIL2tdltY=
X-Google-Smtp-Source: ABdhPJzf4KV6J6Ky/SvXcC/0U2njvhZgbZvz4KxSi5s8EPvVnUG/hMv+pysn+DnI54VW/EClCx7Z+w==
X-Received: by 2002:a17:902:784c:b0:138:f4e5:9df8 with SMTP id
 e12-20020a170902784c00b00138f4e59df8mr13819922pln.14.1636773440914; 
 Fri, 12 Nov 2021 19:17:20 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id a10sm5736459pgw.25.2021.11.12.19.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:17:20 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:39 +0900
Message-Id: <20211113031639.2402161-14-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 13/13] Documentation for OpenRISC port
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

T3BlblJJU0MgYXJjaGl0ZWN0dXJlIHNwZWNpZmljYXRpb246CgogaHR0cHM6Ly9yYXcuZ2l0aHVi
dXNlcmNvbnRlbnQuY29tL29wZW5yaXNjL2RvYy9tYXN0ZXIvb3BlbnJpc2MtYXJjaC0xLjMtcmV2
MS5wZGYKCkN1cnJlbnRseSB0aGUgcG9ydCBhcyBvZiB0aGUgMjAyMS0xMC0xNiByZWJhc2luZyBo
YXMgdGhlIGZvbGxvd2luZyB0ZXN0CmZhaWx1cmVzOgoKIEZBSUw6IHRpbWV6b25lL3RzdC10enNl
dCAgICAgIyBOb3QgZW5vdWdoIHNwYWNlIHRvIGNyZWF0ZSA0R2lCIGZpbGUKCldyaXRpbmcgY3Jl
ZGl0cyBmb3IgdGhlIHBvcnQgYXJlOgoKIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWlsLmNv
bT4KIENocmlzdGlhbiBTdmVuc3NvbiAgPGJsdWVAY21kLm51PgotLS0KIE5FV1MgICB8IDIgKysK
IFJFQURNRSB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9ORVdTIGIvTkVXUwppbmRleCBmMTA5NzFiMTgwLi5lOGQ4OGE3OTM0IDEwMDY0NAotLS0g
YS9ORVdTCisrKyBiL05FV1MKQEAgLTQ4MSw2ICs0ODEsOCBAQCBNYWpvciBuZXcgZmVhdHVyZXM6
CiAgIFRoZSBsYXRlc3QgR0NDIGF2YWlsYWJsZSBhdCB0aGlzIHRpbWUgKDEwLjIpIGRvZXMgbm90
IHN1cHBvcnQgdGhpcyBsZXZlbCBvZgogICBmb3J0aWZpY2F0aW9uLgogCisqIFN1cHBvcnQgZm9y
IE9wZW5SSVNDIG9uIExpbnV4IGhhcyBiZWVuIGFkZGVkLgorCiBEZXByZWNhdGVkIGFuZCByZW1v
dmVkIGZlYXR1cmVzLCBhbmQgb3RoZXIgY2hhbmdlcyBhZmZlY3RpbmcgY29tcGF0aWJpbGl0eToK
IAogKiBUaGUgbWFsbGluZm8gZnVuY3Rpb24gaXMgbWFya2VkIGRlcHJlY2F0ZWQuICBDYWxsZXJz
IHNob3VsZCBjYWxsCmRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKaW5kZXggZDBmMGVkYjM5
My4uM2Q1YTc4Y2NmZiAxMDA2NDQKLS0tIGEvUkVBRE1FCisrKyBiL1JFQURNRQpAQCAtMzUsNiAr
MzUsNyBAQCBUaGUgR05VIEMgTGlicmFyeSBzdXBwb3J0cyB0aGVzZSBjb25maWd1cmF0aW9ucyBm
b3IgdXNpbmcgTGludXgga2VybmVsczoKIAltaWNyb2JsYXplKi0qLWxpbnV4LWdudQogCW1pcHMt
Ki1saW51eC1nbnUKIAltaXBzNjQtKi1saW51eC1nbnUKKwlvcjFrLSotbGludXgtZ251CiAJcG93
ZXJwYy0qLWxpbnV4LWdudQlIYXJkd2FyZSBvciBzb2Z0d2FyZSBmbG9hdGluZyBwb2ludCwgQkUg
b25seS4KIAlwb3dlcnBjNjQqLSotbGludXgtZ251CUJpZy1lbmRpYW4gYW5kIGxpdHRsZS1lbmRp
YW4uCiAJczM5MC0qLWxpbnV4LWdudQotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

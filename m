Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 817EC480FAC
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 05:43:39 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5E8A524301;
	Wed, 29 Dec 2021 05:43:39 +0100 (CET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mail.librecores.org (Postfix) with ESMTPS id 3AEC924307
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 05:43:37 +0100 (CET)
Received: by mail-pj1-f47.google.com with SMTP id gj24so17604602pjb.0
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 20:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tf0G1Y5sPbJuIlwDbZswkeEeCWTuDHUtOsPg+jAN3hw=;
 b=iEXtzZ42h6evqADsEsHwz1MwBhfsHOv/AtbksDVR6w24puAH7aloOvNoscrrDuEAUc
 SvPAg7/epJKa3e8P84uDUI30cE5WM9nVLuIiZr8a/+7TNyHu+p/r2dF7lYCP3DTqEZ0J
 QAeRGy6FOHwL2ebbyfIPZALFQYfK1eU8RGhRy6A2Pfxua6K7J3oVJ3Kb2FqjclA92zwU
 2TRviMlMmQqzQEIBSyBQngLSFQJPEDxePBDJe/TQ2S+I3W7+TIvtpeHcrpYxD1o4++c+
 W+3GdV8dJcCecqTAylK9JrdmSzXwuJ2gRY95dP46VcTnf6+h69epFkBUtb8CMqXiJdpq
 vOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tf0G1Y5sPbJuIlwDbZswkeEeCWTuDHUtOsPg+jAN3hw=;
 b=gcEbNfTV52sUrsRxkxP/heELANwUCTVGCmKrvDXvSSH9wzj+weeSxVeDMBTosonsJB
 1d2o53/FBreaPLcZj17HK6RMyIGke0es1k1ObdsuWNHMjOtHAKxMuM2snNqGXCN6fx0d
 sjNYWffhaGpBVaNifUNaKPu8Piqbf5OWwB9fZsvBd3kq+qaDAg313G9OJ0ctxFMAr36M
 eIlipsHKWbfIiqVFQJ6NaoJS+DGPqgJRuihQGzyCQ3Oe7af7xqSE63QDfmP42q6XjrAc
 ds+nAyeINIdyBuvlv6foFD/A5SxaB+4mPu/hL6dpNTIT1CgPButpI6enXmUzCgpX97PJ
 XlsQ==
X-Gm-Message-State: AOAM530UOJlOQeQ7AnA096ygkPR1Ehu8KPs9X9EFzgwWKjO/wHt8q7Nm
 ZITtkuT55ea68FzSHodTFZw=
X-Google-Smtp-Source: ABdhPJx0WUBrP0PrvjHTYGLb5ay9AFJHc6gmHAFezT5SGI21JpuUQYBjGznUXYaGrJ324BY0qMoxUA==
X-Received: by 2002:a17:902:f68b:b0:148:a2e8:275c with SMTP id
 l11-20020a170902f68b00b00148a2e8275cmr24493538plg.99.1640753015869; 
 Tue, 28 Dec 2021 20:43:35 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id e20sm22547207pfv.219.2021.12.28.20.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 20:43:35 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Wed, 29 Dec 2021 13:42:51 +0900
Message-Id: <20211229044251.2203653-14-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229044251.2203653-1-shorne@gmail.com>
References: <20211229044251.2203653-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v4 13/13] Documentation for OpenRISC port
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
MS5wZGYKCkN1cnJlbnRseSB0aGUgcG9ydCBhcyBvZiB0aGUgMjAyMS0xMi0yMyByZWJhc2luZyB0
aGVyZSBhcmUgbm8ga25vd24gYXJjaGl0ZWN0dXJlCnNlcGNpZmljIHRlc3QgZmFpbHVyZXMuCgpX
cml0aW5nIGNyZWRpdHMgZm9yIHRoZSBwb3J0IGFyZToKCiBTdGFmZm9yZCBIb3JuZSAgPHNob3Ju
ZUBnbWFpbC5jb20+CiBDaHJpc3RpYW4gU3ZlbnNzb24gIDxibHVlQGNtZC5udT4KLS0tCiBORVdT
ICAgfCA1ICsrKysrCiBSRUFETUUgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTkVXUyBiL05FV1MKaW5kZXggOTI5NGE3Yjk1My4uMDRiMTFkMzU4
OSAxMDA2NDQKLS0tIGEvTkVXUworKysgYi9ORVdTCkBAIC01MjcsNiArNTI3LDExIEBAIE1ham9y
IG5ldyBmZWF0dXJlczoKICAgVGhlIGxhdGVzdCBHQ0MgYXZhaWxhYmxlIGF0IHRoaXMgdGltZSAo
MTAuMikgZG9lcyBub3Qgc3VwcG9ydCB0aGlzIGxldmVsIG9mCiAgIGZvcnRpZmljYXRpb24uCiAK
KyogU3VwcG9ydCBmb3IgT3BlblJJU0Mgb24gTGludXggaGFzIGJlZW4gYWRkZWQuCisKKyAgVGhl
IE9wZW5SSVNDIHBvcnQgcmVxdWlyZXMgYXQgbGVhc3QgTGludXggNS40LCBHQ0MgMTEgYW5kIGJp
bnV0aWxzIDIuMzUuCisgIEN1cnJlbnRseSBvbmx5IHNvZnQtZmxvYXQgaXMgc3VwcG9ydGVkLgor
CiBEZXByZWNhdGVkIGFuZCByZW1vdmVkIGZlYXR1cmVzLCBhbmQgb3RoZXIgY2hhbmdlcyBhZmZl
Y3RpbmcgY29tcGF0aWJpbGl0eToKIAogKiBUaGUgbWFsbGluZm8gZnVuY3Rpb24gaXMgbWFya2Vk
IGRlcHJlY2F0ZWQuICBDYWxsZXJzIHNob3VsZCBjYWxsCmRpZmYgLS1naXQgYS9SRUFETUUgYi9S
RUFETUUKaW5kZXggZDBmMGVkYjM5My4uM2Q1YTc4Y2NmZiAxMDA2NDQKLS0tIGEvUkVBRE1FCisr
KyBiL1JFQURNRQpAQCAtMzUsNiArMzUsNyBAQCBUaGUgR05VIEMgTGlicmFyeSBzdXBwb3J0cyB0
aGVzZSBjb25maWd1cmF0aW9ucyBmb3IgdXNpbmcgTGludXgga2VybmVsczoKIAltaWNyb2JsYXpl
Ki0qLWxpbnV4LWdudQogCW1pcHMtKi1saW51eC1nbnUKIAltaXBzNjQtKi1saW51eC1nbnUKKwlv
cjFrLSotbGludXgtZ251CiAJcG93ZXJwYy0qLWxpbnV4LWdudQlIYXJkd2FyZSBvciBzb2Z0d2Fy
ZSBmbG9hdGluZyBwb2ludCwgQkUgb25seS4KIAlwb3dlcnBjNjQqLSotbGludXgtZ251CUJpZy1l
bmRpYW4gYW5kIGxpdHRsZS1lbmRpYW4uCiAJczM5MC0qLWxpbnV4LWdudQotLSAKMi4zMS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

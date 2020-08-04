Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A223B3DD
	for <lists+openrisc@lfdr.de>; Tue,  4 Aug 2020 06:24:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 82C1220D9D;
	Tue,  4 Aug 2020 06:24:35 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id 2831420D95
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 06:24:33 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id t6so21416977pgq.1
 for <openrisc@lists.librecores.org>; Mon, 03 Aug 2020 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EcaRclfd0NpwDQkcLxmVNZSW1Z0kqxgpCzRoAu48M1w=;
 b=Q913rhBuAyO0+o60xPFJW8wXg5ZGqcIWEXeCz7RiId05lFNkXDJ1auQO6qwHL22ddS
 HYG3qOGO/VlnsSMATSISis4CbCxnYJNbpCvOzH1rH6+1FEmnWPrf7ziw+lN+Ltq9Hj06
 Xp78/F6OYdjbecx/AI6LxXrCQAws+A9x91HLi/S9ervmpAoa8EbMmZDYtiFexsmF9/Ke
 lmJPvQcI6bkFGspcHQsOt/fp3LljJIy7s1cJs5dWrg/bqRzoM9EOXJBgci6Q7QZhJVcT
 UD/SdZNbTOG9pRZ07Arw3hyGUH1hiRrbH/LjJeQXA7Uk7ifC38OrgCWSrl8JcwiYDqn9
 mjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcaRclfd0NpwDQkcLxmVNZSW1Z0kqxgpCzRoAu48M1w=;
 b=LOC3+Evcv7CvPUhR3AHX96zvThLGHfWuYI0cH5zs+YUzCnbRRuDsHwsu10DF+URE5H
 xtiMUv6cZ+LjGyJfAnaKQxgSzx9fGBdHbDkgSKZwfW991Ta1LuyKYMqAeAJih6RTIgMm
 Qw/Gkr1LDbACAcPbKGcuWtT6rvT82AkoT/WTqQo2FftWfXrmp6LRkj1rR1wrefTEhvh8
 7N3PCB9vjFcKBMc7Lk/NkLahBRsHBke5Lt5mxX/6ILDzdH3XZRSzxBx/JJkna8ff6sDN
 gdp/7Ub5s+D3iP2dDtEr8eeSW+f85phPIQCQX/em3AwXNvNtcFNqGNPLhi5CY5SgXSGH
 UOAw==
X-Gm-Message-State: AOAM533MsuK/wceUHyQtnKB48U0MLWZWM7+PC0VsN9427assTRgKs7Y5
 +ieyAWmr/ZLixeQLZiCs0+U=
X-Google-Smtp-Source: ABdhPJwWb3dqAl/1suQswntoOlM/h/C2wqZtYp/uBvMj6jLbSp2K7zuoxskw05OjhWkIknVd+Inkiw==
X-Received: by 2002:a63:4861:: with SMTP id x33mr17010551pgk.448.1596515071039; 
 Mon, 03 Aug 2020 21:24:31 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id x9sm21164602pff.145.2020.08.03.21.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 21:24:30 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  4 Aug 2020 13:23:54 +0900
Message-Id: <20200804042354.3930694-7-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804042354.3930694-1-shorne@gmail.com>
References: <20200804042354.3930694-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 6/6] openrisc: uaccess: Add user address space
 check to access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Tm93IHRoYXQgX191c2VyIGFubm90YXRpb25zIGFyZSBmaXhlZCBmb3Igb3BlbnJpc2MgdWFjY2Vz
cyBhcGkncyB3ZSBjYW4KYWRkIGNoZWNraW5nIHRvIHRoZSBhY2Nlc3Nfb2sgbWFjcm8uICBUaGlz
IHBhdGNoIGFkZHMgdGhlIF9fY2hrX3VzZXJfcHRyCmNoZWNrLCBvbiBub3JtYWwgYnVpbGRzIHRo
ZSBhZGRlZCBjaGVjayBpcyBhIG5vcC4KClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
IHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gv
b3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IDg1YTU1MzU5YjI0NC4uNTNkZGM2
NmFiYjNmIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAor
KysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNTcsNyArNTcsOCBA
QCBzdGF0aWMgaW5saW5lIGludCBfX3JhbmdlX29rKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWdu
ZWQgbG9uZyBzaXplKQogCiAjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKICh7
IAkJCQkJCQkJCVwKLQlfX3JhbmdlX29rKCh1bnNpZ25lZCBsb25nKShhZGRyKSwgKHNpemUpKTsJ
CQlcCisJX19jaGtfdXNlcl9wdHIoYWRkcik7CQkJCQkJXAorCV9fcmFuZ2Vfb2soKF9fZm9yY2Ug
dW5zaWduZWQgbG9uZykoYWRkciksIChzaXplKSk7CQlcCiB9KQogCiAvKgotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

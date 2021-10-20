Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A20E4434B1C
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 14:25:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 32B632412D;
	Wed, 20 Oct 2021 14:25:02 +0200 (CEST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mail.librecores.org (Postfix) with ESMTPS id 92838213F3
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 14:16:51 +0200 (CEST)
Received: by mail-wm1-f51.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso1220248wmc.1
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-powerpc-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=7l9tEWjt9gALSo8nOYC6O9qSCG4oZkj1aRklRrycs50=;
 b=Fof2wvLGAKuIiW29+HHTWkLBFPW4iXCrhlQcaqttB6SQa3lgfpCzV2PUgY6BxqCGd/
 81ZfSzgngwpaPkKKokZKksjkmp+YaR08flLXgEBJr+1PdDbgMxJjTMtbOYjxo29tKqN7
 N26u9u4H9pi+homsuL4cFUTLkK/Guo4a2PSuHmGvj5XS/LAU8X1VOdfrvxPwO0R1TdMr
 mr75QyGkejwiI9TdDBiRXCYB5zcDK2MZpxSg8ay2PJsxBkqW+9WsnL2ko4wwUYz6zPFv
 oII9yKXIDMoC/MdwoMhnQt/0FLSKkU9hspm4+Z795VtB1kRWUJcglAhy9slVHH8hUziG
 NHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7l9tEWjt9gALSo8nOYC6O9qSCG4oZkj1aRklRrycs50=;
 b=lrZAwbnTqbsjue3PD11K5MMul/i1ZBPw6p6k6OUrBIYySo/ZvbIVe7rF10+Ez0Sxwo
 v50m7PWBT2gA2LD1YnXtvQUQheAxXVlpgsLMNR9YsKUEjjA4rTlpdQPLadOhOZcADiNE
 9faKjNuE4y9X9j8wpPTz09Mcp1b053BI0CFbEbY1o+QxiJWa7QCW51CBBq7fqSGDItfY
 2WCB7QLAgEN5R3TPq0FHnfN7JRWQiUx+oC3fphneWHmdHZJkJjPf2HWfej2gaopNUKB6
 UXVsYpHAtFViicLLvTf7DnHllmJzfqmddP/ybfC971uT46ITocL6jHjxc4Ghnk9aK9MP
 HMRQ==
X-Gm-Message-State: AOAM533AEZD6Lay6wJrBbZDw6gf8PGvGXzd0V5YM0rpH4irLGUTtEOmi
 ckSeixrv70h2bdigtSTzMfnA2cdE5EvxopnSRdo=
X-Google-Smtp-Source: ABdhPJwzjJQEVCqWc6084GfyiSimLpaX5n6bziJNORcmiw+BzY2n9QG9kfvkvwttu+N8oAfXjE4RtA==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr12745984wmi.103.1634732211178; 
 Wed, 20 Oct 2021 05:16:51 -0700 (PDT)
Received: from localhost.localdomain ([5.35.48.193])
 by smtp.gmail.com with ESMTPSA id g25sm1889491wrc.88.2021.10.20.05.16.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:16:50 -0700 (PDT)
From: Denis Kirjanov <kda@linux-powerpc.org>
To: openrisc@lists.librecores.org
Date: Wed, 20 Oct 2021 15:16:37 +0300
Message-Id: <20211020121637.6629-1-kda@linux-powerpc.org>
X-Mailer: git-send-email 2.16.4
X-Mailman-Approved-At: Wed, 20 Oct 2021 14:25:01 +0200
Subject: [OpenRISC] [PATCH] openrisc: signal: remove unused DEBUG_SIG macro
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U2lnbmVkLW9mZi1ieTogRGVuaXMgS2lyamFub3YgPGtkYUBsaW51eC1wb3dlcnBjLm9yZz4KLS0t
CiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zaWduYWwuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5j
IGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2lnbmFsLmMKaW5kZXggMWViY2ZmMjcxMDk2Li45OTUx
NmM5MTkxYzcgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCisrKyBi
L2FyY2gvb3BlbnJpc2Mva2VybmVsL3NpZ25hbC5jCkBAIC0yOCw4ICsyOCw2IEBACiAjaW5jbHVk
ZSA8YXNtL3Vjb250ZXh0Lmg+CiAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgogCi0jZGVmaW5l
IERFQlVHX1NJRyAwCi0KIHN0cnVjdCBydF9zaWdmcmFtZSB7CiAJc3RydWN0IHNpZ2luZm8gaW5m
bzsKIAlzdHJ1Y3QgdWNvbnRleHQgdWM7Ci0tIAoyLjE2LjQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

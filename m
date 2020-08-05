Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A643423D36D
	for <lists+openrisc@lfdr.de>; Wed,  5 Aug 2020 23:08:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86CFF20DBC;
	Wed,  5 Aug 2020 23:08:06 +0200 (CEST)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 7D04320DB1
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 23:08:05 +0200 (CEST)
Received: by mail-pf1-f196.google.com with SMTP id 74so15354029pfx.13
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EcaRclfd0NpwDQkcLxmVNZSW1Z0kqxgpCzRoAu48M1w=;
 b=ADuhkSVaDTRtiX+a/A4HRrnX5wdPewQRO4PVUtaEa6sLvhaNXyC1A75D6NJO8ujR9R
 A5qauA/huCD7MSpwS4JHRYjIef9Do4aCI1Y9HDctfxPU4dr6EGyeWYbuQ9kWUoilKJ6s
 8khxjHRPj1RHfkem/eleQ8AUDG3vIP4n+o2lQbZxOr2JaSN0ZZcO/+PDRtNn8KEQ3f35
 jLAQOIngNG6pbVYVslCA7Tgt7fW+PWI1EhBqT0JMkG07nJ66bheMAOvFiWW2kYBX/TGy
 Nuu/CtMQ9oMjiMZnyW0wwXl7fB7DCouXMneP8gV5fw76UcEj6w7zG5v5dejTn6wpie9a
 g8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcaRclfd0NpwDQkcLxmVNZSW1Z0kqxgpCzRoAu48M1w=;
 b=UcrHWD2i/tiFRhjrH0iRXhsBIs6ueVxtIUXXW5bhU0IPaPzd8Vtqaqg4tNqubQsuJs
 mbtEDUsi70dwtzuy2AItN8nDMkYr+fC1O1Sdw6C84GB/t5Fu1gzgnVpeCAR3jqXVr1Un
 iETy5Lu5ZuYID7R5utllFjREASsTmF4Wom7yDeGjl/VLajk40I8BcU03YOGsQalFPfne
 mY9PnZN7EhCLlX8A5sciWSYAD3GWj9+NvWdl7EEXhkZJ2CQ122ohIyTiN9dHkpfOE5vg
 jabJ0G3lXTag21qmgQqpGIXSLIgPOctXhe3EVa/nbOqXZQvc42HnIRegMwtLiZaBulDT
 O3RQ==
X-Gm-Message-State: AOAM533GmqZrKMqw7YSEY43rw3MPh41rwokQypNMEo+OIbv8cguwR1vk
 jFmiqfNcO65BkYKvUqaqUyw=
X-Google-Smtp-Source: ABdhPJyc1IRz+k1a9ZVeVghgxqQ7jnpmtKsUqeaQgqyVbIwZlNtxpP3qjnfIajH51JP52Nj6WDK2zw==
X-Received: by 2002:a65:64c7:: with SMTP id t7mr4426410pgv.89.1596661683856;
 Wed, 05 Aug 2020 14:08:03 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id b13sm4694633pgd.36.2020.08.05.14.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:08:03 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  6 Aug 2020 06:07:25 +0900
Message-Id: <20200805210725.310301-7-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805210725.310301-1-shorne@gmail.com>
References: <20200805210725.310301-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 6/6] openrisc: uaccess: Add user address space
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

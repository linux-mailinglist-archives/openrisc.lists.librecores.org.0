Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CBCED32B857
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 14:50:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9656C2120F;
	Wed,  3 Mar 2021 14:50:46 +0100 (CET)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mail.librecores.org (Postfix) with ESMTPS id 7115021200
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 14:50:44 +0100 (CET)
Received: by mail-pj1-f49.google.com with SMTP id
 i4-20020a17090a7184b02900bfb60fbc6bso2924577pjk.0
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 05:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oqp8UirvceWnYqQOXPgsoX+mFS/UDFVfBs/vPdo73c0=;
 b=jF4g7WAwvP0bWOIc5kwecTeTwP88A7J0S+Q0VSdH4EO8pSLF4XvC1dopaPgAkF5efX
 UirRGGAAAg+bA0aKk4Gr0nmsyVIgJvBvXxo3Lls06roJlBYWQHl31jDiyYErjIJZ9+Bq
 pe//4AYQIb9F8fCjvYjPH8yOz4M/vpolYkHsOKIIqqTzCRK6qrqd82G0suVsBtsYAuHy
 7ZvAK/Rk8wkGT0ZS+AxTRHTfNMROiv/bW9t/FmU6TfI2kWOPx+N/7Enl33JMDkm502pz
 /iE223RmN7MJUBOQv+8tIKiOb1U7HmG4iPcTUUROx/Hm7HLU86HW7td3rxrkWVhbaF8y
 Bruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqp8UirvceWnYqQOXPgsoX+mFS/UDFVfBs/vPdo73c0=;
 b=JIkuA5WMKv3VyUh/nichE/XyfDjArEWW5qdcbWzUOF1OzJ5Ek+hsJzqOFN98AlH6tt
 rcKpoyxY7wakBvpPAQjNpInvcj5yFEfhvKMHBSIaul51QlqZ7UPT7b6QGUILvFdMeeuQ
 dIsYaVw8ESEDgs+nafv/jenDZYYzn1dNfDBH1oSpv7V/gU3NovzRinjIdXKOML/h/VWA
 F/UqLYe2+b1CDvOurv+CMJqYGmbKEbJqFab+LqHxX7sHMP0kgAtDQuDmLV4H4N0mGGhb
 kD6DfITBPNzu2R0WmrObrbtxDobXFv5EtCw0joCmkIs/wjU40jsD3Rwtlh1+x6Z2abXl
 jGzQ==
X-Gm-Message-State: AOAM530j346ZSUOQhivhkKyepMDvDHIshn9/p6facevWDtJLLyfLsKpc
 J1v1HzBN7EtKboMg+hMqSEQ=
X-Google-Smtp-Source: ABdhPJzngJXZKiH4vgqMF/OK4kgkcWPPMKV+vidA91Ga0CAZ9c43FbfL2UMAf2KFghi3Y0xN3vWJGQ==
X-Received: by 2002:a17:90a:71ca:: with SMTP id
 m10mr9618008pjs.2.1614779443057; 
 Wed, 03 Mar 2021 05:50:43 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id d24sm24485028pfr.139.2021.03.03.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:50:42 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Wed,  3 Mar 2021 22:50:24 +0900
Message-Id: <20210303135026.3450789-3-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303135026.3450789-1-shorne@gmail.com>
References: <20210303135026.3450789-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/4] openrisc: Add gitignore for dtb files
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
Cc: s.hauer@pengutronix.de, Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJj
aC9vcGVucmlzYy9kdHMvLmdpdGlnbm9yZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9kdHMvLmdpdGlnbm9yZQoK
ZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvZHRzLy5naXRpZ25vcmUgYi9hcmNoL29wZW5yaXNj
L2R0cy8uZ2l0aWdub3JlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uMDc3
OTAzYzUwCi0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9kdHMvLmdpdGlnbm9yZQpA
QCAtMCwwICsxIEBACisqZHRiKgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

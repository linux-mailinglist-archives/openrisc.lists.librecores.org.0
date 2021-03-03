Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4783B32B856
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 14:50:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 02468211F2;
	Wed,  3 Mar 2021 14:50:43 +0100 (CET)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mail.librecores.org (Postfix) with ESMTPS id 94D9C21200
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 14:50:41 +0100 (CET)
Received: by mail-pl1-f170.google.com with SMTP id c16so4597217ply.0
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwtyh/9//FqwfK3T8xlQfkzXCQ/XE4sDAP3QlTIiPsg=;
 b=NZYCw1YaIkZ2HYLaT1aqoZLiWmgUh61xr5JYO/AKk54X5TQ3qskRBhFfKXnFR7OJxt
 anahZPBfkCUd8+2MYb4iD2bzK6Qh8h0j0A4HpNGrq5BJTvnq4gcJN/fq9tRTCT3vmUnD
 T7rJ+f0JxAf/2uHl/Wa7oAGn7tSy6jUYDUTvhN8denOQy4+gX1/uiMWODRmhBvBrRIuh
 Onuk5LEmC+yo/s/3bzOnfCXw6YJsICYY/cq8s4JkXxkyTLPMR4/ZaT9QOcFMmjosS/UG
 DF7H1POI7P4QaYOHH4T69kFCz6v9OviCvReNzMxKHhsneMWttWoLL8wFqHR3bVjdZor7
 M8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwtyh/9//FqwfK3T8xlQfkzXCQ/XE4sDAP3QlTIiPsg=;
 b=bbpIRMbPjSOWwHcLDB6Fso+rai/68ami0FtTQigpqbu8YCU+djESPT9WwMoJjvFUBw
 inm9fEiYeLUOyxcbV/3PjqxtyvEgA5KrpNbcXUnMCcfMuWI0IteMFsDZHNNMd/1c4Fr2
 yDGLF8eijpik2LenBaFabGjQfhRjEKCqt1i0jeum3lB33aS/t6QGZmEcuivKxeyK+Ykw
 v6278tooLiS0i+Ttd5c5QO3WACD/ktkDM+azeQQiovj6muhcrNMTrJryuGPZGM0osGEV
 DNpPYcJeGUaKKPqlC0o5CpgvN+Sl4BQNTNsWjRktFn1d+oo2S2kO4ym+rMf+szz0BTDm
 QThQ==
X-Gm-Message-State: AOAM532gsQVZ3MyBYwjIA53i/hEYMZ/nVX+15WUpi4frQtxYyjPdcPBJ
 3PF/CVrVBspmkQ7GCWVkArtpm29jKhk=
X-Google-Smtp-Source: ABdhPJy2SjVDWfxSV7JYXXXX/UCONgKAoHmp5NJ2GqKqYoIEqmIctA75emwyfPY2d9S6N4pJ1YqcZQ==
X-Received: by 2002:a17:902:70c5:b029:e4:4ce3:90f5 with SMTP id
 l5-20020a17090270c5b02900e44ce390f5mr2798299plt.58.1614779440236; 
 Wed, 03 Mar 2021 05:50:40 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id 142sm18611200pfz.196.2021.03.03.05.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:50:39 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Wed,  3 Mar 2021 22:50:23 +0900
Message-Id: <20210303135026.3450789-2-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303135026.3450789-1-shorne@gmail.com>
References: <20210303135026.3450789-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 1/4] openrisc: Use movhi to zero registers
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

VGhpcyBpcyBuZWVkZWQgd2hlbiBydW5uaW5nIG9uIEZQR0EgYXMgcmVnaXN0ZXJzIGFyZSBub3Qg
Z3VhcmFudGVlZAp0byBiZSBpbml0aWFsaXplZCB0byAwLiAgVXNpbmcgbW92aGkgYWxsb3dzIHRv
IGV4cGxpY2l0bHkgc2V0IDAuCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5l
QGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2NwdS9zdGFydC5TIHwgNiArKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9vcGVucmlzYy9jcHUvc3RhcnQuUyBiL2FyY2gvb3BlbnJpc2MvY3B1L3N0YXJ0LlMK
aW5kZXggN2FjNzkwYjA1Li5jNDQ4ZDM3NzUgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2MvY3B1
L3N0YXJ0LlMKKysrIGIvYXJjaC9vcGVucmlzYy9jcHUvc3RhcnQuUwpAQCAtMzcsMTAgKzM3LDEw
IEBACiAJLm9yZwkweDEwMAogX19yZXNldDoKIAkvKiB0aGVyZSBpcyBubyBndWFyYW50ZWUgcjAg
aXMgaGFyZHdpcmVkIHRvIHplcm8sIGNsZWFyIGl0IGhlcmUgKi8KLQlsLmFuZGkJcjAsIHIwLCAw
CisJbC5tb3ZoaQlyMCwgMHgwCiAJLyogcmVzZXQgc3RhY2sgYW5kIGZyYW1lIHBvaW50ZXJzICov
Ci0JbC5hbmRpCXIxLCByMCwgMAotCWwuYW5kaQlyMiwgcjAsIDAKKwlsLm1vdmhpCXIxLCAweDAK
KwlsLm1vdmhpCXIyLCAweDAKIAogCS8qIHNldCBzdXBlcnZpc29yIG1vZGUgKi8KIAlsLm9yaQly
MyxyMCxTUFJfU1JfU00KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

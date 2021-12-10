Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E9509470EC0
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D2421242B9;
	Sat, 11 Dec 2021 00:35:12 +0100 (CET)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mail.librecores.org (Postfix) with ESMTPS id 96BA7242B6
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:11 +0100 (CET)
Received: by mail-pl1-f170.google.com with SMTP id z6so7278305plk.6
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8GsNqbjvYHQu72z/T07/fwt7FqlbtOKQz+GJxUDBeQ=;
 b=TX5+ahsPiZHOAvuvsiXRCO/XJnJPDDYYccEyHoeUGwQKD40Atg6/dPBJ6heOJgD9Kw
 nuaYiZrDkHDEKLAVGb8FcBPVg/Pnvyv4D9eMPreH4xAorhd4r4ACn5fPk1zDtGwRNx2x
 o3TvURR67ZAGflV/VG54syX1yMMLPSdSWeB5hZ27x5Inld8SvI/qAX7RW+Vu3JChQTeb
 NJXk75bO13RNKnx1kv+pUrflJfdntYvaQLMLD1MgVCTimHlmRwDhKa3TFmeFQQRW8+Ky
 afNjQEcQ+hArmG9mAh2Y3kvPgjnoRqOizuuIY44XVdr1JQsGi9cUliH7osqxzWhmYjRI
 o6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8GsNqbjvYHQu72z/T07/fwt7FqlbtOKQz+GJxUDBeQ=;
 b=pauUEVfeyIoNgsD/cyp+GIStNA92fCtYbPK4YoLRlpazSJMEBthDam6hPCEuGZ+nPx
 F2laIPvnEjo61nqV6kGNEDR5CdDLTWlTDLi91xarFwz9ztIpa1yFcgocqwtXWCbGhf4G
 L5gEix1HPeyJ69nUcqURqwz4GnD1FH0Ci5fjbFJjcW9AwL2AFzrH51+sPf8sRylQ+uZA
 WUAKwRgttpFno/vXGj1B3y6QT4JWWj3LzpdrWBqS4AsOfXZvGic2xE4WxxcHOFhxpcCn
 gHuzpdPP9Q9afgvXGBFP81V6DoqkqKG7xjSxYRpQMvd90ekej249kw78zO01LI0CEpRC
 ZmiA==
X-Gm-Message-State: AOAM533XjvMmI1xYMqw2F46FBHFC8Baev70E1uE0qOk5NXg+bZEaWLg8
 k2D7lYldN8vxsahvC6/rueUnyDugir4=
X-Google-Smtp-Source: ABdhPJw8mWq+bh6wE3oamKdXoZGPBYmhlW3Lv+9JgsfcjiKz95cyQpgVK7tdILzO8z4XHke+ftcaUg==
X-Received: by 2002:a17:902:ab94:b0:143:beb5:b6a7 with SMTP id
 f20-20020a170902ab9400b00143beb5b6a7mr80650768plr.30.1639179310185; 
 Fri, 10 Dec 2021 15:35:10 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id nn4sm88646pjb.38.2021.12.10.15.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:09 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:45 +0900
Message-Id: <20211210233456.4146479-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 02/13] linux/syscalls: Add or1k_atomic syscall
 for OpenRISC
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

LS0tCiBzeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3N5c2RlcHMvdW5peC9z
eXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdCBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5
c2NhbGwtbmFtZXMubGlzdAppbmRleCAxYTc0ZDA5MGI3Li5hNzJkZWU2Mjc1IDEwMDY0NAotLS0g
YS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QKKysrIGIvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0CkBAIC0zMDQsNiArMzA0LDcgQEAg
b3Blbl9ieV9oYW5kbGVfYXQKIG9wZW5fdHJlZQogb3BlbmF0CiBvcGVuYXQyCitvcjFrX2F0b21p
Ywogb3NmX2FkanRpbWUKIG9zZl9hZnNfc3lzY2FsbAogb3NmX2FsdF9wbG9jawotLSAKMi4zMS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklT
QyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0
cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

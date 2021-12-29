Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 87D59480F9F
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 05:43:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6C57B20A95;
	Wed, 29 Dec 2021 05:43:04 +0100 (CET)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mail.librecores.org (Postfix) with ESMTPS id 4E9E520A95
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 05:43:03 +0100 (CET)
Received: by mail-pj1-f43.google.com with SMTP id
 v13-20020a17090a088d00b001b0e3a74cf7so13966921pjc.1
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 20:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJM/+yfU0wNw/mCB6qsWVAgsBJI0ZcLZ4LCdC/R1GQc=;
 b=ML6RI3/QsVgnyHJaX0G2vA+9fBpNpUldui59Q8PmWFfKmLMeD31o6aRguXLGmw0DSy
 GqGqMKBRaDiTDmHLad2a3nnWZnv7Ydps+WsAA0Mc/CWEAWbJXFuvEnfQTTr9JHd7bqE+
 EIoz6wNfPRun8VcMvjmyPriVTgKYfg6Ch/orlVAJByML2IQH02q6MRRmKdeHvzu76dUq
 nCuZFmVlFE/ER2p3/SfgFb2Cbbf8Q/G3SMZCVpLpVM+01Zm204AkiTnEQ1tVIBjNA6nS
 1c4mOIW+XUbJw/SYcRTwpVT1qLckrFy1z0nTLlNuBaS9uIL6VFPvSxXvr19VtbXxHldM
 3+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJM/+yfU0wNw/mCB6qsWVAgsBJI0ZcLZ4LCdC/R1GQc=;
 b=gfL1+0ub1zLaki+TPqLWqAh2kJcZX1a7gHcSvvMZXKe0Obsm/KHnYQ55vBOwhtV0Ny
 iG4Q8ru1VXEnrm/i1Pn4N/VpwqW+2c24rB85PYNIT73Cpd7a97qCoSu/MN4a+4+aG9SA
 58G+gxLzRPeaXjFcXo+Amq6P8/YHWn8HywQeMYhTQuYqS7tMhN82WCEg5PwJqSoR85P/
 oUFKuAV/wznebnDLUiOODcHD+ZtTowdRJTg9ertm8U7UakSZmHIWcLkOsG+U+DyX4Tx9
 Lx3Ls85BcsgvG9k8+T9o9oGCfjnGeViF/eg7E8J19JyGwAXgw9qPEwcZ1uKST5ea85XS
 NI5Q==
X-Gm-Message-State: AOAM532m1kWpOa21Gg6gtDz7+MWwP2S1i+Y6WcKfABdTghFlZDwKzsAM
 KkwIShR61/Hup4FFQvFrusc=
X-Google-Smtp-Source: ABdhPJxuYreBGwROppN5KjGEDIEYWfi3tD1nqfPGH3qsjR5kWSbvZyKeV3DZLkhqCika8VDDq90nfg==
X-Received: by 2002:a17:90a:5b06:: with SMTP id
 o6mr30441321pji.54.1640752981932; 
 Tue, 28 Dec 2021 20:43:01 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s34sm23831285pfg.198.2021.12.28.20.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 20:43:01 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Wed, 29 Dec 2021 13:42:40 +0900
Message-Id: <20211229044251.2203653-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229044251.2203653-1-shorne@gmail.com>
References: <20211229044251.2203653-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v4 02/13] linux/syscalls: Add or1k_atomic syscall
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmV2aWV3ZWQtYnk6IEFkaGVtZXJ2YWwgWmFuZWxsYSAgPGFkaGVtZXJ2YWwuemFuZWxsYUBsaW5h
cm8ub3JnPgotLS0KIHN5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdCB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvc3lzZGVw
cy91bml4L3N5c3YvbGludXgvc3lzY2FsbC1uYW1lcy5saXN0IGIvc3lzZGVwcy91bml4L3N5c3Yv
bGludXgvc3lzY2FsbC1uYW1lcy5saXN0CmluZGV4IDFhNzRkMDkwYjcuLmE3MmRlZTYyNzUgMTAw
NjQ0Ci0tLSBhL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L3N5c2NhbGwtbmFtZXMubGlzdAorKysg
Yi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9zeXNjYWxsLW5hbWVzLmxpc3QKQEAgLTMwNCw2ICsz
MDQsNyBAQCBvcGVuX2J5X2hhbmRsZV9hdAogb3Blbl90cmVlCiBvcGVuYXQKIG9wZW5hdDIKK29y
MWtfYXRvbWljCiBvc2ZfYWRqdGltZQogb3NmX2Fmc19zeXNjYWxsCiBvc2ZfYWx0X3Bsb2NrCi0t
IAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 332CF4681EC
	for <lists+openrisc@lfdr.de>; Sat,  4 Dec 2021 03:19:06 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BF51B2427D;
	Sat,  4 Dec 2021 03:19:05 +0100 (CET)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id B5C532412D
 for <openrisc@lists.librecores.org>; Sat,  4 Dec 2021 03:19:03 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so6561478pjb.2
 for <openrisc@lists.librecores.org>; Fri, 03 Dec 2021 18:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=119nixz5wqDPjb6GHxuJGyOiwK7q6RFXR3RKZpsye+A=;
 b=BUVmAmsbLsSXqaFbJ+8sF+JGLxzz81tfarondwu2O/bcl5T2KS14wAK+9TrcW/4m7A
 f+DoQyQyPjFZYETvdxd3WPeiqoHfejJQd9ZxYbLy+nHCGBYosddmge5oLpWuUcze7BKh
 /djOlLnRZUk4bAcB6SIg7hoRKo0bnZUH+mqOR96IrZBlgWY7fbKI8go43By6UEZj2yVr
 wpfNFYkEdw+zf7QRDxt8R4U/Pv8jcLeFAauTdyZf13uMmSnhqfavLjBqSzBekhTLcN3l
 E2x/Pbg2Wci3WLcDJCT1stF+0t5lznSPleW7LLHRBdCBujZldiL6c2h+yBp0IRqQ+hbp
 BjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=119nixz5wqDPjb6GHxuJGyOiwK7q6RFXR3RKZpsye+A=;
 b=FpGSLeCMDoPZiNEpNA3HtRNV9bkDouVBII/j86YKvcW8JshH6Likgt2OMN432ej548
 gGK+VSixEvdW3vKQCD3E6sqhIvdrmxIBlJCB0EpOj1J3S9DL4EYBEKjQcqdUT2R2ER6S
 cqIZZ9DDYnqmg6Q5a3unPhBwC3vjaYZ0CCdPN85dYtiGiBCLkP13kamiaq1gKPoa+GyW
 h9qbC2ozAhZcCOIsmaoRpBfRnCr66WpMik0Pq7jV6cHib3BKZe/kWBY6MQv+EHhVNW5B
 DtKVLTHIhAi5dR3wnD+dMd0dvJOBRMi4MXCOTO6/CXGlzy5/NjjZZ+pFi5j/L9ojF8qW
 K5sA==
X-Gm-Message-State: AOAM530JvGFrhqZ3fCBIKnVfHy1hRLDwRg4Zntvb3MGPSfseqnIjrCse
 hrLteGnALXlk6GrYN1gkvZE=
X-Google-Smtp-Source: ABdhPJz/aOjP+uKqlWX8Ogmjv8dFSRlrGGhFV6K2vsQ9J79rq+tVUn1oU5Hcui6dZW5ZtogqRLDdeQ==
X-Received: by 2002:a17:902:f209:b0:141:99d1:7cef with SMTP id
 m9-20020a170902f20900b0014199d17cefmr27407930plc.70.1638584342206; 
 Fri, 03 Dec 2021 18:19:02 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id m10sm3396102pgv.75.2021.12.03.18.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 18:19:01 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  4 Dec 2021 11:18:39 +0900
Message-Id: <20211204021842.1853549-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/3] OpenRISC Switch and Clone cleanups
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
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlc2UgYXJlIGEgZmV3IHBhdGNoZXMgdGhhdCBjYW1lIGFmdGVyIGF1ZGl0aW5nIHRoZSBPcGVu
UklTQyBzd2l0Y2ggY29kZQpyZWNlbnRseSBmb2xsb3dpbmcgdGhlIGRpc2N1c3Npb24gd2l0aCBS
b2IgYW5kIEFybmQgYW5kIHRoZSBjbG9uZSBhbmQgY2xvbmUzCndyYXBwZXJzIFswXS4KCkkgbm90
aWNlZCBhIGZldyBwbGFjZXMgd2hlcmUgT3BlblJJU0MgY291bGQgc2hhdmUgYSBmZXcgaW5zdHJ1
Y3Rpb25zIGFuZCBhbHNvCnRoYXQgd2UgbmVlZCBhIEFCSSB3cmFwcGVyIGZvciBjbG9uZTMuCgpb
MF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzQxMjA2ZmM3LWY4Y2UtOThhYS0zNzE4LWJh
M2UxNDMxZTMyMEBsYW5kbGV5Lm5ldC9ULyNtOWMwY2RiMjcwMzgxM2I5ZGY0ZGEwNGNmNmIzMGRl
MWYxYWE4OTk0NAoKU3RhZmZvcmQgSG9ybmUgKDMpOgogIG9wZW5yaXNjOiBDbGVhbnVwIHN3aXRj
aCBjb2RlIGFuZCBjb21tZW50cwogIG9wZW5yaXNjOiBVc2UgZGVsYXkgc2xvdCBmb3IgY2xvbmUg
YW5kIGZvcmsgd3JhcHBlcnMKICBvcGVucmlzYzogQWRkIGNsb25lMyBBQkkgd3JhcHBlcgoKIGFy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMuaCB8ICAyICsrCiBhcmNoL29wZW5yaXNj
L2tlcm5lbC9lbnRyeS5TICAgICAgICAgfCAyNyArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgotLSAK
Mi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

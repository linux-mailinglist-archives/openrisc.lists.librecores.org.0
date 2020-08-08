Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7E01E23F974
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 01:07:23 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6206A20DBA;
	Sun,  9 Aug 2020 01:07:23 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id E9BDA20DB3
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:07:20 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id e4so2774357pjd.0
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pDz8Q0LmiAvmhRqG8qC/282Sb6uJp9Qz6LidATVCB/U=;
 b=Nf0dY76R58uGzD6j3/28zS3w3KIIQTf+muQl7PjVubwID4qK3JWF/9uoawz9K+B3cV
 6mwPMHZTcKgnC3MqMrija8j3xlZRRlX49fmrdoNZ0+bbr2c/JeoglNRA3febJPBHHWIc
 gziUJ3Z9alJH4y6c2m3wCdXWTd5YuQ3BE5200BmqAzzPzCmQEcUZ/lWGzhvfE18Dy6Zv
 Vzj4kjzScpnL+WBZLDRHOF3SQBQxR/b6wBtCu6WjADq2f85Crt/axQ3fErfA/lvIRX07
 8aBpGst0tzKazlBzIYSFoWyFC4PYw38G6iS9Vo13uOiHbC6aTfTZq2IFlOJITVHxXglj
 AyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pDz8Q0LmiAvmhRqG8qC/282Sb6uJp9Qz6LidATVCB/U=;
 b=chUdUSmynx3dtH13pYfw75uhFrbv5Jm1o5aSP9GcLddYvH50V0dMdWPSMM3GS47g5Q
 9VK8Cp1wPi5SpFwOMhkbIBjnhsHT590Vk8AAbOCGTDkc3Q/c+gCqVz0Oo2yN9N7QQj5w
 6GaHfEBf+KXBjF5aHccxPgZeYMlY0XdeHFubyni/ha6IMhxeF1FZ/mkN7pWTrUYCMJt7
 aOP5uKS04lDJRMBA7C+9uOgdXdOiDEMqNR7q8uc1C8MJvMe70yHoLUhxRemUOtt83ryR
 pJanj6oTDJoYx8giOUL0334Iwq1FJSmCcQO9wYiwhzvLY1pkS2ugzjqas5dADqWfvn2J
 L5pA==
X-Gm-Message-State: AOAM530CO+ecCOR9uxW0SUrTmqrSqcjWVqER2kw7U+cqh1GASvFJ4xKP
 6CHxM8qZ49fYtqYM2OgcV/E=
X-Google-Smtp-Source: ABdhPJw4mZcO6/c/sZmbEOqLUZYbhxa/R/06dhxQLiRlUbbhXF5nO4l2YsheTFXOH0vcPx03Is/n9g==
X-Received: by 2002:a17:90a:2224:: with SMTP id
 c33mr19383534pje.56.1596928039642; 
 Sat, 08 Aug 2020 16:07:19 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id j8sm9324330pfh.90.2020.08.08.16.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:07:19 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  9 Aug 2020 08:06:47 +0900
Message-Id: <20200808230647.833047-7-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808230647.833047-1-shorne@gmail.com>
References: <20200808230647.833047-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 6/6] openrisc: uaccess: Add user address space
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
aG9ybmVAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogTHVjIFZhbiBPb3N0ZW5yeWNrIDxsdWMudmFu
b29zdGVucnlja0BnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgogLSBSZW1vdmUgX19m
b3JjZSBpbiBjYXN0IHN1Z2dzdGVkIGJ5IEx1YwoKIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvb3BlbnJpc2Mv
aW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IDg1YTU1MzU5YjI0NC4uN2M1ODkyZjU2NzY1IDEw
MDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAorKysgYi9hcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNTcsNiArNTcsNyBAQCBzdGF0aWMg
aW5saW5lIGludCBfX3JhbmdlX29rKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBz
aXplKQogCiAjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKICh7IAkJCQkJCQkJ
CVwKKwlfX2Noa191c2VyX3B0cihhZGRyKTsJCQkJCQlcCiAJX19yYW5nZV9vaygodW5zaWduZWQg
bG9uZykoYWRkciksIChzaXplKSk7CQkJXAogfSkKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

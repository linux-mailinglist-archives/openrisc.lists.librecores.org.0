Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E723123F96C
	for <lists+openrisc@lfdr.de>; Sun,  9 Aug 2020 01:07:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C637320DBB;
	Sun,  9 Aug 2020 01:07:14 +0200 (CEST)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by mail.librecores.org (Postfix) with ESMTPS id 973CD20D69
 for <openrisc@lists.librecores.org>; Sun,  9 Aug 2020 01:07:13 +0200 (CEST)
Received: by mail-pj1-f66.google.com with SMTP id ep8so2849589pjb.3
 for <openrisc@lists.librecores.org>; Sat, 08 Aug 2020 16:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=UHGfQeunoKI8TNjHKhq6SxtCDj5fRbVumwksNu3M9FGkMO6gL1/x0kIzB8W7Cd6xvC
 Z2Oimsgnq86gMnsjsqtv02x+WZh7c8Ac8OBbb4t0WL06XnuAoslC0tlV3FKYbTAdVFYx
 UByIxR5jVfnlE4BeNlWoopWo2DclOAZ4iK7++jE3Yu44JPdr8B0pi7IBODNeyJZcM1Ip
 CoZp9SADztLGROWzKjp6Argqzxcu6f3GjCMYxQR1dL6Lo83QnnlqKaId+S21rHh33Pd5
 qF5QwOtS633lncxiwnnkIencIZBK53Z00++fFNoNawpu6vc6OexGut+plnUdgyKLjTY/
 7fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=CREBYkELdkOGjmTqjmlf7HzHaLeW61C6F7OnR+JPc0S6cfW8WLXyGVtUPHFfU9EJm7
 Bj26ZZh6lIiaIO9kJGZPxqEwqncuIT86cdQueUGUaNgw04cs+HvrFatZqRrDD6Ln3sMs
 klOOQc5eASKEY+KydPaKuGY1cuwJAyANfsuHDpWL/3BL+OYLCv+jZFlaSg2mLcpma6ea
 1TCi9sfC/bF59mpqX0YqgPpiSB8iuX7Yxg8ZanIdL9OXSMtu6fLsfkGZY9e1pVxCdYWw
 7iOlV+iWm5MQi2rSnbRsjyWxdnY/d/ZH5pTo3wE4zVm0tJbq8bzT3WsN1Te10YYkHfCc
 zClg==
X-Gm-Message-State: AOAM532KibiKN+HSrHsemn4nkci1AuL20NNixJ2ij1UjlW83RoWtSpZg
 OXX6++M8lVH9ju2cfNOzpj4=
X-Google-Smtp-Source: ABdhPJxfxpXKG4evtY3F05L1qrOvO5+c1PsTIaEV4Zb/OkJutfClX/gf4pKFJ0ihIvJEGSrLf2F42g==
X-Received: by 2002:a17:90a:8a90:: with SMTP id
 x16mr19978495pjn.89.1596928032077; 
 Sat, 08 Aug 2020 16:07:12 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id 144sm17368728pfu.114.2020.08.08.16.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 16:07:11 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sun,  9 Aug 2020 08:06:45 +0900
Message-Id: <20200808230647.833047-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808230647.833047-1-shorne@gmail.com>
References: <20200808230647.833047-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 4/6] openrisc: uaccess: Remove unused macro
 __addr_ok
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

U2luY2UgY29tbWl0IGI0OGIyYzNlNTA0MyAoIm9wZW5yaXNjOiB1c2UgZ2VuZXJpYyBzdHJubGVu
X3VzZXIoKQpmdW5jdGlvbiIpIHRoZSBtYWNybyBfX2FkZHJfb2sgaXMgbm8gbG9uZ2VyIHVzZWQu
ICBJdCBpcyBzYWZlIHRvIHJlbW92ZQpzbyB0aGlzIHBhdGNoIHJlbW92ZXMgaXQuCgpTaWduZWQt
b2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KLS0tCiBhcmNoL29wZW5y
aXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3Mu
aCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCmluZGV4IDRiNTlkYzlhZDMw
MC4uODVhNTUzNTliMjQ0IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaAorKysgYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaApAQCAtNTUs
OSArNTUsNiBAQCBzdGF0aWMgaW5saW5lIGludCBfX3JhbmdlX29rKHVuc2lnbmVkIGxvbmcgYWRk
ciwgdW5zaWduZWQgbG9uZyBzaXplKQogCXJldHVybiBzaXplIDw9IGZzICYmIGFkZHIgPD0gKGZz
IC0gc2l6ZSk7CiB9CiAKLS8qIEVuc3VyZSB0aGF0IGFkZHIgaXMgYmVsb3cgdGFzaydzIGFkZHJf
bGltaXQgKi8KLSNkZWZpbmUgX19hZGRyX29rKGFkZHIpICgodW5zaWduZWQgbG9uZykgYWRkciA8
IGdldF9mcygpKQotCiAjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKICh7IAkJ
CQkJCQkJCVwKIAlfX3JhbmdlX29rKCh1bnNpZ25lZCBsb25nKShhZGRyKSwgKHNpemUpKTsJCQlc
Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C91423D369
	for <lists+openrisc@lfdr.de>; Wed,  5 Aug 2020 23:07:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0C66A20DB3;
	Wed,  5 Aug 2020 23:07:59 +0200 (CEST)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 6AA4820C7C
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 23:07:57 +0200 (CEST)
Received: by mail-pl1-f193.google.com with SMTP id o1so26234595plk.1
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=ra1N+hKoOtk5+DcbbgGsoMGexOPWfeNtvkB67fEqNZ2Q9sjhXGWHwfqltkBv70FmUH
 edugTkarOj9Qruhl/kueDS5bT0XcpPfmG2+piwt8FrxUHEvjRtWnlb4sgktLOiibURt4
 AFjlIB7HuP45XcTk/Wuecxeh7Q8AiDYKGY8nRBs2QEUwB6ja+Tn/WLMNrFNmCxHvp+oX
 wXA0izQ5Ix8hh1nK8DSuSq84A8e5UocOJKAuF8fyoOob2byMo6h2HDF4egtWTtMv3o46
 Odtu6a1y9ljWXJ1Qfph2Ej0DuIxaAdmiHklBuO9HEm1tQskfC03G3uBRTWP2SJyXCDG2
 DuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=N+Qy2IRPPD2ehXZbex14xewvOKHYOu54oYD97L/S7R2Tf3i5mnTH5ZfY+z/dhbvbnq
 ZcSz0zyXNnltGP8JbBeFnvalrb0+DyZExQH3RNzX997n5rM9PFLWqtZy6rs08rtN5tze
 5/Bwy5sgOwiFCw5SO5Dndsqb2LZEy7LZOGhij1IRRewjszaBcc08G2polBSbdsqJAfxw
 0zhgnm6Vs64KO7dyUreXWLbhnRQMbpttSopDyIXeAh8Mtel0V3pgTXwELuHQCDUB+GYX
 vsTONpuOcXI/QlAd2uKwJ0fcRzB6DIUkw9dGBE5bjv4a8C1OIzN48PYYOeLG2GoRD3wJ
 r+9w==
X-Gm-Message-State: AOAM533mPTUOHkXz3MZppaSvnHQlw6QtN3r7NdchOShb38uTt96wZ/ew
 4Q0MHGge9OawJzJbF4+pdhs=
X-Google-Smtp-Source: ABdhPJwgAH4NnK9wX6qTc8HLiOKtJkemmE2YjMahKds++HdJ9FjRt9GvV6Ys+LDVFH4h9rcTAgzv3Q==
X-Received: by 2002:a17:902:d303:: with SMTP id
 b3mr4916272plc.101.1596661676102; 
 Wed, 05 Aug 2020 14:07:56 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id e15sm4101134pgr.39.2020.08.05.14.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:07:55 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  6 Aug 2020 06:07:23 +0900
Message-Id: <20200805210725.310301-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805210725.310301-1-shorne@gmail.com>
References: <20200805210725.310301-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 4/6] openrisc: uaccess: Remove unused macro
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

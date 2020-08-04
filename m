Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE1323B3DA
	for <lists+openrisc@lfdr.de>; Tue,  4 Aug 2020 06:24:26 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 03E9E20D9A;
	Tue,  4 Aug 2020 06:24:26 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 8C83A20D91
 for <openrisc@lists.librecores.org>; Tue,  4 Aug 2020 06:24:24 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id lx9so1302791pjb.2
 for <openrisc@lists.librecores.org>; Mon, 03 Aug 2020 21:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=EhVQyH8cSJ8WjufSoJQDqGVwOxId9jA9kgPDpqVmz6Eop5PLtoNqsaJ8d/ka9ob+1n
 wCzQhOS2Q7eh89CBVwe5xcy6yeZ7Db4h/Q/TtQGA2NHFgQqBIlJWT6To4J0L8fPDJKYs
 ONsK/6GnZQn4pdtbGmkGETU8J+ArYZBw1fBCkSX4ibQZWi6pZ055lyBfKQwRBWgxyDuF
 jYcIwQxPO5tzFIhthRRLguJXOqCmzsyEeKeEgv0goGLm9QnOYwIxfRYYXjsFSEnnjAX0
 1uhUfWIVbM8Q4qZ1nMDtt+mlxNTgR/B2bOcnqSWaYZX9glLdq7Z/qSknoO4YXsqRlNGp
 xcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v96ubfgeahRH8xGlTKbAfEYW4ILSGysT4Aem4Y+4DRg=;
 b=M62crmQgC+lk+IhODJW+SkTDY3YnD3tIZhwThSos8o9nfr9dULHZGxeySdp/ZQ5nQq
 UMmn0+opznayc2bICLK4JTn11O5pxfdIgOg9BR51dy/9b7ISylmzDJbZLKEstiaMdel+
 qhMTbIzAqjRmIVo7ndVCDD6TKQEejcSGVM4DFjI0OgM55iIWspl1T6jt7nzRMZRfmgjZ
 hJTByk6RbkZtZyCre4MNGx6Kb5gsVBIYeRKMK78LNsIJPQTFIRsESTUOMepgFo8pjtjR
 TaJdj3R0lDE9FPCUVDIEclRw8lDBNfavaV3RCzGIIQ6EytS1D8b4K2FJm1B2Y2lg4gro
 /uyw==
X-Gm-Message-State: AOAM532RjfcAYfRzR6qJD0kugog5eqY8CyTTAqnB4gwNgyxdE/Xfselr
 aK3PJBPmbYjgsol5/GwnT+o=
X-Google-Smtp-Source: ABdhPJzjN+8C7iOcRT/urmN6FvL54B86INpPPzxRPdkwYACqnHdKiIRG9rYX82aC0KE5TaEVT3WwFA==
X-Received: by 2002:a17:902:9b96:: with SMTP id
 y22mr9924530plp.86.1596515063199; 
 Mon, 03 Aug 2020 21:24:23 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id d29sm20593782pgb.54.2020.08.03.21.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 21:24:22 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Tue,  4 Aug 2020 13:23:52 +0900
Message-Id: <20200804042354.3930694-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804042354.3930694-1-shorne@gmail.com>
References: <20200804042354.3930694-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 4/6] openrisc: uaccess: Remove unused macro
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

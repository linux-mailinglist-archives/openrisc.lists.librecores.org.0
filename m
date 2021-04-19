Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 34BC93638BB
	for <lists+openrisc@lfdr.de>; Mon, 19 Apr 2021 02:05:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DB92021341;
	Mon, 19 Apr 2021 02:05:51 +0200 (CEST)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mail.librecores.org (Postfix) with ESMTPS id 79407210A9
 for <openrisc@lists.librecores.org>; Mon, 19 Apr 2021 02:05:49 +0200 (CEST)
Received: by mail-pj1-f44.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so8292115pjb.1
 for <openrisc@lists.librecores.org>; Sun, 18 Apr 2021 17:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qR7Xxv661uZLQLlP61872z56PqEHOjXcc706mSIsFkY=;
 b=VYEkYxZbafcih/bpfxjIHj15d6pCBKk+jAUKCpwSqhW/zmw5Nfj8DST/LGueHf/f5o
 2rS6ODhIsR62wd16GCJ9T5FZYQ/HBhPE/4db2iE9q47O+oIzSWVvUJTohflqvwfZaEw8
 exgSIjZ7LEf2H5FsfD+4zrahAfwbmeqsgylVbOrUUdnAsk2CddnpZCrwQXBHOEjsfSue
 49/W0kFJJ8KeNQsyr7VNE5a8YDBWobNluyJFpHtYzjEGrFuhlc3Pi+PlKNgdQnZG0KjG
 BxcuOg6OIx2aVSG3U/6lTko+CpXvTW+KgABQpvPHQWc4hsc54eSiA0XLNHS8AQVipgrE
 KuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qR7Xxv661uZLQLlP61872z56PqEHOjXcc706mSIsFkY=;
 b=IMHN5K+WRQ4KupFzM6PXteiaJT1ohnKEKgpFNfMVyVEMzwziWbwVYEqoailHPiYkNW
 GFxz9v10hHeRnjtnw/xIyZRE4Al+msoRyTb/j7eQk3kUQttFc4xIAo5eUQqedPqe7+7q
 bZGCZo3htdAxj04781OUsVW8wdOmo1V5CwmBPcRCLrrfZoScZshL20D19k9fUBBcH9Kg
 ZLnhaqoJ2Y4DBHkBMrTDDI7cMHvDpGFOFPoefgGhpqTL1EhPJHopgQyd35LYwqFRaT6K
 jDE3VZntLpuTtjdu6IzxkJC2YQ/Mnlforo56wEn743P7cOIgfuMxfLhCmdYG1fuTBXj4
 YHfQ==
X-Gm-Message-State: AOAM532u8B4WFqHNmGRJy6w7l32MnUG6hJqLihuC6bjyCTgQ+agoU3kr
 LTLv29TkesiyGsMTfJwG6HE=
X-Google-Smtp-Source: ABdhPJyS340zkjwoXLpJFbNkTpphU3rdWDOf5hCwl43IWu3EqmJAbgU5yVlIop35WXnDHL1BVC1TIQ==
X-Received: by 2002:a17:902:654b:b029:ec:a435:5b5c with SMTP id
 d11-20020a170902654bb02900eca4355b5cmr2855275pln.42.1618790748075; 
 Sun, 18 Apr 2021 17:05:48 -0700 (PDT)
Received: from localhost (g191.124-44-145.ppp.wakwak.ne.jp. [124.44.145.191])
 by smtp.gmail.com with ESMTPSA id
 s40sm9773731pfw.100.2021.04.18.17.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 17:05:47 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Mon, 19 Apr 2021 09:05:24 +0900
Message-Id: <20210419000524.3625897-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419000524.3625897-1-shorne@gmail.com>
References: <20210419000524.3625897-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 4/4] or1k: Fail link if the PLT relocation
 overflows
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

YmZkL0NoYW5nZUxvZzoKCglQUiAyNzc0NgoJKiBlbGYzMi1vcjFrLmMgKG9yMWtfZWxmX2Zpbmlz
aF9keW5hbWljX3N5bWJvbCk6IEFkZCBjb25kaXRpb24KCXRvIGNoZWNrIGFuZCBmYWlsIGlmIHRo
ZSBQTFQgcmVsb2NhdGlvbiBvdmVyZmxvd3MuCi0tLQogYmZkL2VsZjMyLW9yMWsuYyB8IDggKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9iZmQv
ZWxmMzItb3Ixay5jIGIvYmZkL2VsZjMyLW9yMWsuYwppbmRleCAxYTViMzMxOTY0Ni4uNmFmYWNm
YTU3Y2YgMTAwNjQ0Ci0tLSBhL2JmZC9lbGYzMi1vcjFrLmMKKysrIGIvYmZkL2VsZjMyLW9yMWsu
YwpAQCAtMjQ1Myw2ICsyNDUzLDE0IEBAIG9yMWtfZWxmX2ZpbmlzaF9keW5hbWljX3N5bWJvbCAo
YmZkICpvdXRwdXRfYmZkLAogICAgICAgZ290X29mZnNldCA9IChwbHRfaW5kZXggKyAzKSAqIDQ7
CiAgICAgICBnb3RfYWRkciA9IGdvdF9iYXNlX2FkZHIgKyBnb3Rfb2Zmc2V0OwogCisgICAgICBp
ZiAoIWh0YWItPnNhd19nb3RoYSAmJiBwbHRfcmVsb2MgPiAweGZmZmYpCisJeworCSAgX2JmZF9l
cnJvcl9oYW5kbGVyIChfKCIlcEI6IHBsdCByZWxvY2F0aW9uIG92ZXJmbG93IHdoZW4gd3JpdGlu
ZyAlcyIpLAorCQkgICAgICAgICAgICAgIG91dHB1dF9iZmQsIGgtPnJvb3Qucm9vdC5zdHJpbmcp
OworCSAgYmZkX3NldF9lcnJvciAoYmZkX2Vycm9yX2JhZF92YWx1ZSk7CisJICByZXR1cm4gZmFs
c2U7CisJfQorCiAgICAgICAvKiBGaWxsIGluIHRoZSBlbnRyeSBpbiB0aGUgcHJvY2VkdXJlIGxp
bmthZ2UgdGFibGUuICAqLwogICAgICAgaWYgKGh0YWItPnNhd19wbHRhKQogCXsKLS0gCjIuMjYu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

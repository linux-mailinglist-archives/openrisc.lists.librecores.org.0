Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C16471DA2E1
	for <lists+openrisc@lfdr.de>; Tue, 19 May 2020 22:38:25 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A367320B77;
	Tue, 19 May 2020 22:38:25 +0200 (CEST)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id 0C6D020B78
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 22:38:23 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id k7so180973pjs.5
 for <openrisc@lists.librecores.org>; Tue, 19 May 2020 13:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GhgA5JXTcYl1x/8KyqIEVFscg5nAasjIcBUCad7ahc=;
 b=POYqoujEPphblxEElIO2SOIQTiU3L4IGw9R/EPgT4Tr1EReyQzR5BvNWWvWJCWuxWj
 ctFAbit0QtF49DTvrXt4k1jr5fhKuexj3LK6AoBRFnQPUXmLCzTgUm/xpgO099CWGOPU
 yxSuqu59zcxB8C6NlP/Vdp0/IM0P03WEHcxDGA2VuJhzO6tZR8DWaJIp2FS9SK0OrsNR
 Eq9jVRhhK3LuXEAgQaXUBbV2FDC7DotmZPnQjr7A63yj3+FiVjzCoCyS/rliJTR0rmSv
 nNZ2xWdhX+hdxRZcxXv6tuWbq0tOkQo9ltSuQL83atMn3S3J9RB38snzNANoOeqv42wA
 mL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3GhgA5JXTcYl1x/8KyqIEVFscg5nAasjIcBUCad7ahc=;
 b=FADf/6cgfi8I1tWKM0aHpHmJvbp+0LfLjS71VvcMJ9wiWSdNpvzz2VQEfaT4W2Itmi
 0a0a3T2TRu0zIEF9v7hrpiV+mnyBmNP6XCWuy89+1ux1V+YNG5CfJKVidUeeYm9N7QiU
 ymmH/PoSwN2zY4DdBDgABiyPJbG804s9xfEB3YcXYDaIJ8MkB0wjpliR3u89+u30skVk
 1VImmGu468KNvF+ZXMgZZzgtjMpivnnJyK+GCeiCZ7f5CZ/zfwyX9OngmW3s7KKO9oRy
 sJaqtLZSA16pjPgjeJC9BrQuA4kKJdEImB/F1tWQlQCyUojB2Lzal6Y3854Ti8eB7pVX
 guxg==
X-Gm-Message-State: AOAM533AtX7eo+vdvDgVkeP3DAbbi6NCqvt3gABM9Wndtgx60r6CK9/o
 QFFNqxJEXoOw9qMrIqWWIeQIrXpk
X-Google-Smtp-Source: ABdhPJyQj70vMaVQLaFacH0yNUatyGG6L1LpFjdkEpuqLF3yxi1AwT0xL+m+PypBOHP/qeAD2CM4Dg==
X-Received: by 2002:a17:902:14f:: with SMTP id 73mr1229173plb.86.1589920701375; 
 Tue, 19 May 2020 13:38:21 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id u45sm336933pjb.7.2020.05.19.13.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 13:38:20 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed, 20 May 2020 05:37:49 +0900
Message-Id: <20200519203750.401593-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519203750.401593-1-shorne@gmail.com>
References: <20200519203750.401593-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 4/5] or1k: Add note to indicate execstack
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

RGVmaW5lIFRBUkdFVF9BU01fRklMRV9FTkQgYXMgZmlsZV9lbmRfaW5kaWNhdGVfZXhlY19zdGFj
ayB0byBhbGxvdwpnZW5lcmF0aW9uIG9mIHRoZSAiLm5vdGUuR05VLXN0YWNrIiBzZWN0aW9uIG5v
dGUuICBUaGlzIGFsbG93cyBiaW51dGlscwp0byBwcm9wZXJseSBzZXQgUFRfR05VX1NUQUNLIGlu
IHRoZSBwcm9ncmFtIGhlYWRlci4KClRoaXMgZml4ZXMgYSBnbGliYyBleGVjc3RhY2sgdGVzdHN1
aXRlIHRlc3QgZmFpbHVyZSBmb3VuZCB3aGlsZSB3b3JraW5nCm9uIHRoZSBPcGVuUklTQyBnbGli
YyBwb3J0LgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFrL2xpbnV4LmggKFRBUkdFVF9B
U01fRklMRV9FTkQpOiBEZWZpbmUgbWFjcm8uCi0tLQogZ2NjL2NvbmZpZy9vcjFrL2xpbnV4Lmgg
fCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZ2Nj
L2NvbmZpZy9vcjFrL2xpbnV4LmggYi9nY2MvY29uZmlnL29yMWsvbGludXguaAppbmRleCAyMWNl
ZjA2N2RkYS4uODY5M2U4ODRlMmEgMTAwNjQ0Ci0tLSBhL2djYy9jb25maWcvb3Ixay9saW51eC5o
CisrKyBiL2djYy9jb25maWcvb3Ixay9saW51eC5oCkBAIC00Miw0ICs0Miw2IEBACiAgICAgICV7
IXNoYXJlZDotZHluYW1pYy1saW5rZXIgIiBHTlVfVVNFUl9EWU5BTUlDX0xJTktFUiAifX19IFwK
ICAgICV7c3RhdGljLXBpZTotQnN0YXRpYyAtcGllIC0tbm8tZHluYW1pYy1saW5rZXIgLXogdGV4
dH0iCiAKKyNkZWZpbmUgVEFSR0VUX0FTTV9GSUxFX0VORCBmaWxlX2VuZF9pbmRpY2F0ZV9leGVj
X3N0YWNrCisKICNlbmRpZiAvKiBHQ0NfT1IxS19MSU5VWF9IICovCi0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

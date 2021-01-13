Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8D97D2F5549
	for <lists+openrisc@lfdr.de>; Thu, 14 Jan 2021 00:51:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5E02F21091;
	Thu, 14 Jan 2021 00:51:00 +0100 (CET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mail.librecores.org (Postfix) with ESMTPS id 06E6720CA6
 for <openrisc@lists.librecores.org>; Thu, 14 Jan 2021 00:50:58 +0100 (CET)
Received: by mail-pj1-f42.google.com with SMTP id y12so2089455pji.1
 for <openrisc@lists.librecores.org>; Wed, 13 Jan 2021 15:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tR4OkZIvavmwQSXL9K0yfwGWgy4VSx+DXoKn79gBerI=;
 b=ZT9lilyWzXQO1pduiMMrcECZWZvS56no5s8qnogBle7Ga9ZtOyMP8T8bUcmEeQORKv
 /Q6ivVtuscg/NFI9b6n8nYr/ZA59L5OA+siPwYlgICQV9ss6oQY8ibIyvvq6wjLgugbh
 GKh0Pc2xuuM9w3Vi3q80N9Jp4uTQGiwveI+vcU7uClFemmF9es6MLRt8sqQO7sjmV7cX
 6HyOoyKPoyRNuI+yzNafClPPY8pbkxNOSIUSOBxrC9AcmBpZawfsliFkjt4rF5xLmo0V
 SxrJQpSn8d2ypG1xuSpIix80p79CYNuBCc+8D5DSiEg72HySNyBUog59hjNPNZtHZWWz
 qtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tR4OkZIvavmwQSXL9K0yfwGWgy4VSx+DXoKn79gBerI=;
 b=RMgBkia6I1c2nbIutz1IBK2ZNu9HO19haDOXVe2h7sEMACy7BCCf9WkW3CPSYhKVS+
 MRRWusegYfAevbh17sKQv7gwzcKkFl4+MeaWU21+6Mj8LX8TcoPHItmkH+rVsARYQmzV
 BgFry19fHbsBHndEYxU/6rak7YL8LwCX9zu5dCeAJsKRkfgM1CtySMKULQoBd/OgphfL
 csc3om60dnTQa3Pb1wPkjhweNHoh9AC0QS6G/m07PRwstzY6IxfnEs9xxiMga1nsfzTB
 jEp/0Rzijw67EbEWv2JhKe/SV+QnI2+BAsTI4WccpkNjDxHWhPx/IMrBMAqRuogJw9/2
 vweQ==
X-Gm-Message-State: AOAM531fvKFnIl1zC7GTEekISgjKOvWHM8TxSCQggE24hHmRgTseuKZy
 l9mkxzUZuzvhqKkEY8nvOmk=
X-Google-Smtp-Source: ABdhPJzcqpFRBAE1VI17iCs3zN7sDRqRb6if/hYEV53kChPH/gezfvBtKnHYj8dc9Vr7M/IqERFpew==
X-Received: by 2002:a17:902:778e:b029:da:feef:8f2d with SMTP id
 o14-20020a170902778eb02900dafeef8f2dmr4694379pll.25.1610581856198; 
 Wed, 13 Jan 2021 15:50:56 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 w11sm3574557pge.28.2021.01.13.15.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 15:50:55 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Thu, 14 Jan 2021 08:50:31 +0900
Message-Id: <20210113235032.2821155-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113235032.2821155-1-shorne@gmail.com>
References: <20210113235032.2821155-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 4/5] or1k: Add note to indicate execstack
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
L2NvbmZpZy9vcjFrL2xpbnV4LmggYi9nY2MvY29uZmlnL29yMWsvbGludXguaAppbmRleCA3NGZi
ZTA4MjEwMy4uMTk2ZjNmM2M4ZjAgMTAwNjQ0Ci0tLSBhL2djYy9jb25maWcvb3Ixay9saW51eC5o
CisrKyBiL2djYy9jb25maWcvb3Ixay9saW51eC5oCkBAIC00Miw0ICs0Miw2IEBACiAgICAgICV7
IXNoYXJlZDotZHluYW1pYy1saW5rZXIgIiBHTlVfVVNFUl9EWU5BTUlDX0xJTktFUiAifX19IFwK
ICAgICV7c3RhdGljLXBpZTotQnN0YXRpYyAtcGllIC0tbm8tZHluYW1pYy1saW5rZXIgLXogdGV4
dH0iCiAKKyNkZWZpbmUgVEFSR0VUX0FTTV9GSUxFX0VORCBmaWxlX2VuZF9pbmRpY2F0ZV9leGVj
X3N0YWNrCisKICNlbmRpZiAvKiBHQ0NfT1IxS19MSU5VWF9IICovCi0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A6F0A14AB5
	for <lists+openrisc@lfdr.de>; Mon,  6 May 2019 15:16:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9077D279F2;
	Mon,  6 May 2019 15:16:38 +0200 (CEST)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by mail.librecores.org (Postfix) with ESMTPS id 5DFC025C26
 for <openrisc@lists.librecores.org>; Mon,  6 May 2019 15:16:37 +0200 (CEST)
Received: by mail-pg1-f193.google.com with SMTP id p6so6442289pgh.9
 for <openrisc@lists.librecores.org>; Mon, 06 May 2019 06:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QpB6tKd/617lHI2fBjDgUWj3SJqKfguqGCoACpqYopw=;
 b=WVMTNf3fux33Y9Xbr52LjK492sNemM1BDsq9qf4P9TnMXbStVJJqDUoylm5edgQzN2
 QRuBv5QduKkMvwM7wNPN/Pd+UrWJXnN/pWXk3SnUWO8Vk4Aa6fEix21DpTvF44zySIeI
 /fFAD9Zo6PGdrrOEsvT4Y64Td+m2GXd4PK3P0XtV1soh5+50p6lq2WqoLYGtEaAhMthH
 A44hlLyDj5qijJZle1ShFCLuWJ12NEMfnXlJedx05Y8MooYuWtwOWSw4NU22jiqdoXp5
 JUs7/k7C3S2RGgGERZnFm3fFhiy5Hhq+H/bMbq8/mpmIngfsM8207jrb1qNQjbK4JLdA
 LEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QpB6tKd/617lHI2fBjDgUWj3SJqKfguqGCoACpqYopw=;
 b=gv3Egx5JxKWx+mzYXlY877j0nlnOzvlxOo882zBmxS3mFAHuxNwtlYZBgqXG9fZ/+y
 KnOfoUoQ2Nu6gaiH2qN0jeJUq4IIWDFrAhW7dxWVTNUhbGy9IVMyHBkF78gpitnfvGTk
 orkT65C9nX9P7xOdGcqMbWd+ijgwDUums9AZsEwuuX7pnlxN+7T7R2XLoNcUuOhcpM4O
 2Qhbslbjtu1RbRuwFjSzFj3pp/9b5Fn83GIdI2rwylby4B0I5XG0vwRXiVT85i7sshq/
 ReEglj97PVbsHX+yLCiuWAWTve4BHdm0F1umgQiKsRctwIeKmx3IoLgiJtXOI41wfkkg
 h03w==
X-Gm-Message-State: APjAAAUbukzNRzMtsi6MB0IzUuWXyvNsFc1osM4/U1TE0YbUreLQ1GdM
 dACrFDk6VD/2HmC6l8w65BI=
X-Google-Smtp-Source: APXvYqxEyYb3mpBYJ5SvkC2jVJOV9xoIDariPhTbGLeGiXAdXGfKn91tg9iS8DxIxN+6KfuRke1Ecg==
X-Received: by 2002:a65:5c47:: with SMTP id v7mr31724319pgr.80.1557148595933; 
 Mon, 06 May 2019 06:16:35 -0700 (PDT)
Received: from localhost (g191.61-115-60.ppp.wakwak.ne.jp. [61.115.60.191])
 by smtp.gmail.com with ESMTPSA id u5sm13116715pfm.121.2019.05.06.06.16.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 06:16:35 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Mon,  6 May 2019 22:16:21 +0900
Message-Id: <20190506131621.29929-3-shorne@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190506131621.29929-1-shorne@gmail.com>
References: <20190506131621.29929-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/2] or1k: Fix issues with msoft-div
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

QXMgcmVwb3J0ZWQgYnkgUmljaGFyZCBTZWx2YWdnaS4gIEFsc28sIGFkZCBhIGJhc2ljIHRlc3Qg
dG8gdmVyaWZ5IHRoZQpzb2Z0IG1hdGggd29ya3Mgd2hlbiBlbmFibGVkLgoKZ2NjL3Rlc3RzdWl0
ZS9DaGFuZ2VMb2c6CgoJUFIgdGFyZ2V0LzkwMzYyCgkqIGdjYy50YXJnZXQvb3Ixay9kaXYtbXVs
LTMuYzogTmV3IHRlc3QuCgpsaWJnY2MvQ2hhbmdlTG9nOgoKCVBSIHRhcmdldC85MDM2MgoJKiBj
b25maWcvb3Ixay9saWIxZnVuY3MuUyAoX191ZGl2c2kzKTogQ2hhbmdlIGwuc2ZlcWkKCXRvIGwu
c2ZlcSBhbmQgbC5zZmx0c2kgdG8gbC5zZmx0cyBlcXVpdmFsZW50cyBhcyB0aGUgaW1tZWRpYXRl
CglpbnN0cnVjdGlvbnMgYXJlIG5vdCBhdmFpbGFibGUgb24gZXZlcnkgcHJvY2Vzc29yLiAgQ2hh
bmdlIGEKCWwuYm5mIHRvIGwuYmYgdG8gZml4IGxvZ2ljIGlzc3VlLgotLS0KIGdjYy90ZXN0c3Vp
dGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwtMy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysKIGxpYmdjYy9jb25maWcvb3Ixay9saWIxZnVuY3MuUyAgICAgICAgICAgIHwgIDYgKystLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ixay9kaXYtbXVsLTMuYwoK
ZGlmZiAtLWdpdCBhL2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwtMy5jIGIv
Z2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLjJjNGY5MWI3ZTk4Ci0tLSAvZGV2L251bGwKKysrIGIv
Z2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMKQEAgLTAsMCArMSwzMSBA
QAorLyogeyBkZy1kbyBydW4gfSAqLworLyogeyBkZy1vcHRpb25zICItTzIgLW1zb2Z0LWRpdiAt
bXNvZnQtbXVsIiB9ICovCisKK3N0cnVjdCB0ZXN0Y2FzZSB7CisgIGludCBhOworICBpbnQgYjsK
KyAgaW50IGM7CisgIGludCBleHBlY3RlZDsKK307CisKK3N0cnVjdCB0ZXN0Y2FzZSB0ZXN0c1td
ID0geworICB7MiwgMjAwLCAzLCAxMzN9LAorICB7MywgMzAwLCAzLCAzMDB9LAorICB7MiwgNTAw
LCAzLCAzMzN9LAorICB7NCwgMjUwLCAzLCAzMzN9LAorICB7MCwgMCwgMCwgMH0KK307CisKK2lu
dCBjYWxjIChpbnQgYSwgaW50IGIsIGludCBjKSB7CisgIHJldHVybiBhICogYiAvIGM7Cit9CisK
K2ludCBtYWluICgpIHsKKyAgaW50IGZhaWwgPSAwOworICBzdHJ1Y3QgdGVzdGNhc2UgKnRjOwor
CisgIGZvciAoaW50IGkgPSAwOyAodGMgPSAmdGVzdHNbaV0sIHRjLT5jKTsgaSsrKQorICAgIGZh
aWwgfD0gKGNhbGMgKHRjLT5hLCB0Yy0+YiwgdGMtPmMpICE9IHRjLT5leHBlY3RlZCk7CisKKyAg
cmV0dXJuIGZhaWw7Cit9CmRpZmYgLS1naXQgYS9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNz
LlMgYi9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMKaW5kZXggZDIxMDM5MjM0ODYuLjZk
MDU4OTc3MjI5IDEwMDY0NAotLS0gYS9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMKKysr
IGIvbGliZ2NjL2NvbmZpZy9vcjFrL2xpYjFmdW5jcy5TCkBAIC02OCwxOCArNjgsMTggQEAgX191
ZGl2bW9kc2kzX2ludGVybmFsOgogCSAgIGlzIG5vdCBjbG9iYmVyZWQgYnkgdGhpcyByb3V0aW5l
LCBhbmQgdXNlIHRoYXQgYXMgdG8KIAkgICBzYXZlIGEgcmV0dXJuIGFkZHJlc3Mgd2l0aG91dCBj
cmVhdGluZyBhIHN0YWNrIGZyYW1lLiAgKi8KIAotCWwuc2ZlcWkJCXI0LCAwCQkvKiBkaXZpc2lv
biBieSB6ZXJvOyByZXR1cm4gMC4gICovCisJbC5zZmVxCQlyNCwgcjAJCS8qIGRpdmlzaW9uIGJ5
IHplcm87IHJldHVybiAwLiAgKi8KIAlsLm9yaQkJcjExLCByMCwgMAkvKiBpbml0aWFsIHF1b3Rp
ZW50ICovCiAJbC5iZgkJOWYKIAkgbC5vcmkJCXIxMiwgcjMsIDAJLyogaW5pdGlhbCByZW1haW5k
ZXIgKi8KIAogCS8qIEdpdmVuIFgvWSwgc2hpZnQgWSBsZWZ0IHVudGlsIFkgPj0gWC4gICovCiAJ
bC5vcmkJCXI2LCByMCwgMQkvKiBtYXNrID0gMSAqLwotMToJbC5zZmx0c2kJcjQsIDAJCS8qIHkg
aGFzIG1zYiBzZXQgKi8KKzE6CWwuc2ZsdHMJCXI0LCByMAkJLyogeSBoYXMgbXNiIHNldCAqLwog
CWwuYmYJCTJmCiAJIGwuc2ZsdHUJcjQsIHIxMgkJLyogeSA8IHggKi8KIAlsLmFkZAkJcjQsIHI0
LCByNAkvKiB5IDw8PSAxICovCi0JbC5ibmYJCTFiCisJbC5iZgkJMWIKIAkgbC5hZGQJCXI2LCBy
NiwgcjYJLyogbWFzayA8PD0gMSAqLwogCiAJLyogU2hpZnQgWSBiYWNrIHRvIHRoZSByaWdodCBh
Z2Fpbiwgc3VidHJhY3RpbmcgZnJvbSBYLiAgKi8KLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 60CE663667
	for <lists+openrisc@lfdr.de>; Tue,  9 Jul 2019 15:06:43 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4992C2035E;
	Tue,  9 Jul 2019 15:06:43 +0200 (CEST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id 182962035D
 for <openrisc@lists.librecores.org>; Tue,  9 Jul 2019 15:06:42 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id q10so9267440pff.9
 for <openrisc@lists.librecores.org>; Tue, 09 Jul 2019 06:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BBKW0uHpsO0C0lMXvzlPUIuLRTxcGoqqDyZk9GHqQjA=;
 b=Ugaqz0mmhbYAkXs8XACXEEqvJQW/wDx2Z7YVbw4639I05ldi5q09Vu0p2WkwKK3ImB
 enEcim+BNtAb+Qf7s5Cg+WHevF7mi2oANbTB9EpvpnzrY12d2xqZJ/AEWADRtLn7bbpb
 ycVdLOQonzr7VrNuoIEZNWc6aL8Oo7z++oa2Nq7HBch9zc0X+OKTIltUYAHQynihX3u2
 cbr0vh2YiR5TKeFrCNuM/9VvPHWbrw1N2foad163V5vrZ06hARAmWDCutR10CdOcLh63
 xMOagsT9iTMvfptI0ZswTKs+jWLO/NDW55CeugNoYZ1L27pkXxQ8eLaAGGSOC4Gv0XZK
 oTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BBKW0uHpsO0C0lMXvzlPUIuLRTxcGoqqDyZk9GHqQjA=;
 b=YSJJkpQPjyJskIEKRz50JkF2npdgyzq6WF4RZXMT8G7If76eQo9HvbeAg+RXX0BQH4
 3BIe2Z6r+OUwCswrzFIi4ZhcidW9FefbS6PgfiHueHAkHVr9JrQRQSCm5z5V9h57RGN/
 LgkUQvkiWxWKh9ImS26kdCMWPbmLO7mC4aD9rq7mpTwqKfbQ4g935P8y4okHSfEIT0hn
 ERe6bWJsd5kahjxBl6Ve2qJFLh5kzIHmGXb2wscfvTXMWhhrc1JdnQhnEkmqNWJExmgb
 0FdnkCJ1Yx5buUOVW4ihsQpuLO0DUyOjt5uc41FmB8xO9s5fgQuczb1aYmcmX932ACXR
 59pw==
X-Gm-Message-State: APjAAAUyZe7Ze2n4e4Mpb0dcODNGJ/h0puWd7riMJeW+m/7CA2Do3LSA
 Gsr48Eb45jMGtCkj5AvWaBc=
X-Google-Smtp-Source: APXvYqyGJJ32LaWh5GDCYca6Pa75QhZOSid62apZlJEBYwUE4PaZd2JTE15SSPZrzXHnHPVrkRrkZg==
X-Received: by 2002:a63:d944:: with SMTP id e4mr30252118pgj.261.1562677599871; 
 Tue, 09 Jul 2019 06:06:39 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id r196sm20524371pgr.84.2019.07.09.06.06.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 06:06:39 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Tue,  9 Jul 2019 22:06:23 +0900
Message-Id: <20190709130626.11226-3-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709130626.11226-1-shorne@gmail.com>
References: <20190709130626.11226-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 2/5] or1k: Fix issues with msoft-div
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
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
 Openrisc <openrisc@lists.librecores.org>, Jeff Law <law@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Rml4ZXMgYmFkIGFzc2VtYmx5IGxvZ2ljIHdpdGggc29mdHdhcmUgZGl2aWRlIGFzIHJlcG9ydGVk
IGJ5IFJpY2hhcmQgU2VsdmFnZ2kuCkFsc28sIGFkZCBhIGJhc2ljIHRlc3QgdG8gdmVyaWZ5IHRo
ZSBzb2Z0IG1hdGggd29ya3Mgd2hlbiBlbmFibGVkLgoKZ2NjL3Rlc3RzdWl0ZS9DaGFuZ2VMb2c6
CgoJUFIgdGFyZ2V0LzkwMzYyCgkqIGdjYy50YXJnZXQvb3Ixay9kaXYtbXVsLTMuYzogTmV3IHRl
c3QuCgpsaWJnY2MvQ2hhbmdlTG9nOgoKCVBSIHRhcmdldC85MDM2MgoJKiBjb25maWcvb3Ixay9s
aWIxZnVuY3MuUyAoX191ZGl2c2kzKTogQ2hhbmdlIGwuc2ZlcWkKCXRvIGwuc2ZlcSBhbmQgbC5z
Zmx0c2kgdG8gbC5zZmx0cyBlcXVpdmFsZW50cyBhcyB0aGUgaW1tZWRpYXRlCglpbnN0cnVjdGlv
bnMgYXJlIG5vdCBhdmFpbGFibGUgb24gZXZlcnkgcHJvY2Vzc29yLiAgQ2hhbmdlIGEKCWwuYm5m
IHRvIGwuYmYgdG8gZml4IGxvZ2ljIGlzc3VlLgotLS0KIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdl
dC9vcjFrL2Rpdi1tdWwtMy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysKIGxpYmdjYy9j
b25maWcvb3Ixay9saWIxZnVuY3MuUyAgICAgICAgICAgIHwgIDYgKystLS0KIDIgZmlsZXMgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ixay9kaXYtbXVsLTMuYwoKZGlmZiAtLWdpdCBh
L2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwtMy5jIGIvZ2NjL3Rlc3RzdWl0
ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAuLjJjNGY5MWI3ZTk4Ci0tLSAvZGV2L251bGwKKysrIGIvZ2NjL3Rlc3RzdWl0
ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMKQEAgLTAsMCArMSwzMSBAQAorLyogeyBkZy1k
byBydW4gfSAqLworLyogeyBkZy1vcHRpb25zICItTzIgLW1zb2Z0LWRpdiAtbXNvZnQtbXVsIiB9
ICovCisKK3N0cnVjdCB0ZXN0Y2FzZSB7CisgIGludCBhOworICBpbnQgYjsKKyAgaW50IGM7Cisg
IGludCBleHBlY3RlZDsKK307CisKK3N0cnVjdCB0ZXN0Y2FzZSB0ZXN0c1tdID0geworICB7Miwg
MjAwLCAzLCAxMzN9LAorICB7MywgMzAwLCAzLCAzMDB9LAorICB7MiwgNTAwLCAzLCAzMzN9LAor
ICB7NCwgMjUwLCAzLCAzMzN9LAorICB7MCwgMCwgMCwgMH0KK307CisKK2ludCBjYWxjIChpbnQg
YSwgaW50IGIsIGludCBjKSB7CisgIHJldHVybiBhICogYiAvIGM7Cit9CisKK2ludCBtYWluICgp
IHsKKyAgaW50IGZhaWwgPSAwOworICBzdHJ1Y3QgdGVzdGNhc2UgKnRjOworCisgIGZvciAoaW50
IGkgPSAwOyAodGMgPSAmdGVzdHNbaV0sIHRjLT5jKTsgaSsrKQorICAgIGZhaWwgfD0gKGNhbGMg
KHRjLT5hLCB0Yy0+YiwgdGMtPmMpICE9IHRjLT5leHBlY3RlZCk7CisKKyAgcmV0dXJuIGZhaWw7
Cit9CmRpZmYgLS1naXQgYS9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMgYi9saWJnY2Mv
Y29uZmlnL29yMWsvbGliMWZ1bmNzLlMKaW5kZXggZDIxMDM5MjM0ODYuLjZkMDU4OTc3MjI5IDEw
MDY0NAotLS0gYS9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMKKysrIGIvbGliZ2NjL2Nv
bmZpZy9vcjFrL2xpYjFmdW5jcy5TCkBAIC02OCwxOCArNjgsMTggQEAgX191ZGl2bW9kc2kzX2lu
dGVybmFsOgogCSAgIGlzIG5vdCBjbG9iYmVyZWQgYnkgdGhpcyByb3V0aW5lLCBhbmQgdXNlIHRo
YXQgYXMgdG8KIAkgICBzYXZlIGEgcmV0dXJuIGFkZHJlc3Mgd2l0aG91dCBjcmVhdGluZyBhIHN0
YWNrIGZyYW1lLiAgKi8KIAotCWwuc2ZlcWkJCXI0LCAwCQkvKiBkaXZpc2lvbiBieSB6ZXJvOyBy
ZXR1cm4gMC4gICovCisJbC5zZmVxCQlyNCwgcjAJCS8qIGRpdmlzaW9uIGJ5IHplcm87IHJldHVy
biAwLiAgKi8KIAlsLm9yaQkJcjExLCByMCwgMAkvKiBpbml0aWFsIHF1b3RpZW50ICovCiAJbC5i
ZgkJOWYKIAkgbC5vcmkJCXIxMiwgcjMsIDAJLyogaW5pdGlhbCByZW1haW5kZXIgKi8KIAogCS8q
IEdpdmVuIFgvWSwgc2hpZnQgWSBsZWZ0IHVudGlsIFkgPj0gWC4gICovCiAJbC5vcmkJCXI2LCBy
MCwgMQkvKiBtYXNrID0gMSAqLwotMToJbC5zZmx0c2kJcjQsIDAJCS8qIHkgaGFzIG1zYiBzZXQg
Ki8KKzE6CWwuc2ZsdHMJCXI0LCByMAkJLyogeSBoYXMgbXNiIHNldCAqLwogCWwuYmYJCTJmCiAJ
IGwuc2ZsdHUJcjQsIHIxMgkJLyogeSA8IHggKi8KIAlsLmFkZAkJcjQsIHI0LCByNAkvKiB5IDw8
PSAxICovCi0JbC5ibmYJCTFiCisJbC5iZgkJMWIKIAkgbC5hZGQJCXI2LCByNiwgcjYJLyogbWFz
ayA8PD0gMSAqLwogCiAJLyogU2hpZnQgWSBiYWNrIHRvIHRoZSByaWdodCBhZ2Fpbiwgc3VidHJh
Y3RpbmcgZnJvbSBYLiAgKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

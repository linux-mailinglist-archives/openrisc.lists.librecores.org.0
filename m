Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6184D1FC97C
	for <lists+openrisc@lfdr.de>; Wed, 17 Jun 2020 11:07:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EBC4D20CC9;
	Wed, 17 Jun 2020 11:07:20 +0200 (CEST)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id F31C120C4E
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 11:07:19 +0200 (CEST)
Received: by mail-pf1-f193.google.com with SMTP id 10so796049pfx.8
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnLnijT3kAKagUkRCUY6dPCloOW3fhO0MSYNzvoS/58=;
 b=dzCIdKya9MvwLcA8MAjN9GvG7PIaY0dbuxpTthmyWJyrErNkbrpxgQLsCixAt+0hb/
 gFk0MgUwcFDM5dKQFwBRfGi7rVbA4LLSNUrkPx0RF/EkXrORi4Jz0aR+59d26fJyP0Y3
 SpszT+FqP/z0qZs88HreytHRbz9KWlfJBhKySXZKiMAOWP01mbzpRwKjDJhNqL8bwKke
 WItWkXTyOjqHTPkIz3o7KbJ9RcZr7mXpcq25jEysd+FG5qQAiuIIF2MRjPNtB3tA+Fpr
 P8TQ1Rgsx3Z7eBsneK8g3GqwLRi+GsObq4hXixrn95PLbabyepjJrBtBGiJsXV/l+IMY
 dXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnLnijT3kAKagUkRCUY6dPCloOW3fhO0MSYNzvoS/58=;
 b=GiL1pFlctf/rvkgKQI664eg+uCpK/m+pN8a/qh5NDDZr9tZCiKLdno8V45k2fni5J/
 MrUYFDSKjdSTuAB1CajC7s90p6nJZM9PNf7gxsgag4B5w4ZV0sHJjDy+V3+tsYJXLKQ+
 S8d6B8MksD7Sn2ffwY9ZcbbFyGZLL8xze/yjaY22mjuytroqXHKKWomyIJ9ud6nwOyGx
 DH1Sfeo1Ro5eeWzC6GDmf3F/Oc8FLk+sPmzKE8nLFLzoQYy+VF5tSwsw8Ez0e1Mc7u49
 lzvMNqTVF6MwFXkKwPKWy2QnVz6gCWRFPMgGNkhgtgbppxxlaT9w+AZ9RrexictH2uvh
 vkKQ==
X-Gm-Message-State: AOAM532n590HAoDaaJeCgzn1d5VXinNz1jZQBcmg8YMsrXLUGyVA22+Q
 ythGWJTr7LggV0JY0o5+Bz4=
X-Google-Smtp-Source: ABdhPJwDb3WnWhllQKssed+/Sv/xzTVMmYrYBlGYX345oLJ8rS5GEETlkUkL+/3H6ZtKq6VXqBoqKQ==
X-Received: by 2002:a63:9e02:: with SMTP id s2mr5468301pgd.170.1592384838074; 
 Wed, 17 Jun 2020 02:07:18 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 j5sm10340697pgi.42.2020.06.17.02.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 02:07:17 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 17 Jun 2020 18:07:01 +0900
Message-Id: <20200617090702.1684812-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Fix oops caused when dumping stack
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

V2hlbiBkdW1waW5nIGEgc3RhY2sgc2l3dGggJ2NhdCAvcHJvYy8xL3N0YWNrJyB0aGUga2VybmVs
IHdvdWxkIG9vcHMuCkZvciBleGFtcGxlOgoKICAgICMgY2F0IC9wcm9jLzY5MC9zdGFjawogICAg
VW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgYWNjZXNzCiAgICAgYXQgdmlydHVhbCBhZGRyZXNzIDB4
N2ZjNjBmNTgKCiAgICBPb3BzIzogMDAwMAogICAgQ1BVICM6IDAKICAgICAgIFBDOiBjMDAwOTdm
YyAgICBTUjogMDAwMDgwN2YgICAgU1A6IGQ2ZjA5YjljCiAgICBHUFIwMDogMDAwMDAwMDAgR1BS
MDE6IGQ2ZjA5YjljIEdQUjAyOiBkNmYwOWJiOCBHUFIwMzogZDZmMDliYzQKICAgIEdQUjA0OiA3
ZmM2MGY1YyBHUFIwNTogYzAwMDk5YjQgR1BSMDY6IDAwMDAwMDAwIEdQUjA3OiBkNmYwOWJhMwog
ICAgR1BSMDg6IGZmZmZmZjAwIEdQUjA5OiBjMDAwOTgwNCBHUFIxMDogZDZmMDgwMDAgR1BSMTE6
IDAwMDAwMDAwCiAgICBHUFIxMjogZmZmZmUwMDAgR1BSMTM6IGRiYjg2MDAwIEdQUjE0OiAwMDAw
MDAwMSBHUFIxNTogZGJiODYyNTAKICAgIEdQUjE2OiA3ZmM2MGY2MyBHUFIxNzogMDAwMDBmNWMg
R1BSMTg6IGQ2ZjA5YmM0IEdQUjE5OiAwMDAwMDAwMAogICAgR1BSMjA6IGMwMDA5OWI0IEdQUjIx
OiBmZmZmZmZjMCBHUFIyMjogMDAwMDAwMDAgR1BSMjM6IDAwMDAwMDAwCiAgICBHUFIyNDogMDAw
MDAwMDEgR1BSMjU6IDAwMDAwMmM2IEdQUjI2OiBkNzhiNjg1MCBHUFIyNzogMDAwMDAwMDEKICAg
IEdQUjI4OiAwMDAwMDAwMCBHUFIyOTogZGJiODYwMDAgR1BSMzA6IGZmZmZmZmZmIEdQUjMxOiBk
YmI4NjJmYwogICAgICBSRVM6IDAwMDAwMDAwIG9HUFIxMTogZmZmZmZmZmYKICAgIFByb2Nlc3Mg
Y2F0IChwaWQ6IDcwMiwgc3RhY2twYWdlPWQ3OWQ2MDAwKQoKICAgIFN0YWNrOgogICAgQ2FsbCB0
cmFjZToKICAgIFs8NTk4OTc3ZjI+XSBzYXZlX3N0YWNrX3RyYWNlX3RzaysweDQwLzB4NzQKICAg
IFs8OTUwNjNmMGU+XSBzdGFja190cmFjZV9zYXZlX3RzaysweDQ0LzB4NTgKICAgIFs8YjU1N2Jm
ZGQ+XSBwcm9jX3BpZF9zdGFjaysweGQwLzB4MTNjCiAgICBbPGEyZGY4ZWRhPl0gcHJvY19zaW5n
bGVfc2hvdysweDZjLzB4ZjAKICAgIFs8ZTVhNzM3Yjc+XSBzZXFfcmVhZCsweDFiNC8weDY4OAog
ICAgWzwyZDZjNzQ4MD5dIGRvX2l0ZXJfcmVhZCsweDIwOC8weDI0OAogICAgWzwyMTgyYTJmYj5d
IHZmc19yZWFkdisweDY0LzB4OTAKClRoaXMgd2FzIGNhdXNlZCBieSB0aGUgc3RhY2sgdHJhY2Ug
Y29kZSBpbiBzYXZlX3N0YWNrX3RyYWNlX3RzayB1c2luZwp0aGUgd3Jvbmcgc3RhY2sgcG9pbnRl
ci4gIEl0IHdhcyB1c2luZyB0aGUgdXNlciBzdGFjayBwb2ludGVyIGluc3RlYWQgb2YKdGhlIGtl
cm5lbCBzdGFjayBwb2ludGVyLiAgRml4IHRoaXMgYnkgdXNpbmcgdGhlIHJpZ2h0IHN0YWNrLgoK
QWxzbyBmb3IgZ29vZCBtZWFzdXJlIHdlIGFkZCB0cnlfZ2V0X3Rhc2tfc3RhY2svcHV0X3Rhc2tf
c3RhY2sgdG8gZW5zdXJlCnRoZSB0YXNrIGlzIG5vdCBsb3N0IHdoaWxlIHdlIGFyZSB3YWxraW5n
IGl0J3Mgc3RhY2suCgpTaWduZWQtb2ZmLWJ5OiBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWls
LmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zdGFja3RyYWNlLmMgfCA4ICsrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc3RhY2t0cmFjZS5jCmluZGV4IDQzZjE0MGEyOGJjNy4uYWM5MTYxNDUwOWM4IDEwMDY0
NAotLS0gYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zdGFja3RyYWNlLmMKKysrIGIvYXJjaC9vcGVu
cmlzYy9rZXJuZWwvc3RhY2t0cmFjZS5jCkBAIC0xMyw2ICsxMyw3IEBACiAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KICNpbmNsdWRlIDxsaW51eC9z
Y2hlZC9kZWJ1Zy5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2tfc3RhY2suaD4KICNpbmNs
dWRlIDxsaW51eC9zdGFja3RyYWNlLmg+CiAKICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CkBA
IC02OCwxMiArNjksMTcgQEAgdm9pZCBzYXZlX3N0YWNrX3RyYWNlX3RzayhzdHJ1Y3QgdGFza19z
dHJ1Y3QgKnRzaywgc3RydWN0IHN0YWNrX3RyYWNlICp0cmFjZSkKIHsKIAl1bnNpZ25lZCBsb25n
ICpzcCA9IE5VTEw7CiAKKwlpZiAoIXRyeV9nZXRfdGFza19zdGFjayh0c2spKQorCQlyZXR1cm47
CisKIAlpZiAodHNrID09IGN1cnJlbnQpCiAJCXNwID0gKHVuc2lnbmVkIGxvbmcgKikgJnNwOwog
CWVsc2UKLQkJc3AgPSAodW5zaWduZWQgbG9uZyAqKSBLU1RLX0VTUCh0c2spOworCQlzcCA9ICh1
bnNpZ25lZCBsb25nICopIHRhc2tfdGhyZWFkX2luZm8odHNrKS0+a3NwOwogCiAJdW53aW5kX3N0
YWNrKHRyYWNlLCBzcCwgc2F2ZV9zdGFja19hZGRyZXNzX25vc2NoZWQpOworCisJcHV0X3Rhc2tf
c3RhY2sodHNrKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKHNhdmVfc3RhY2tfdHJhY2VfdHNrKTsK
IAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

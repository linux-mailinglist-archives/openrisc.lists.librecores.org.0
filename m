Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 14DE65DD08
	for <lists+openrisc@lfdr.de>; Wed,  3 Jul 2019 05:34:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D06DA2033E;
	Wed,  3 Jul 2019 05:34:10 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 8EE1520156
 for <openrisc@lists.librecores.org>; Wed,  3 Jul 2019 05:34:09 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id c14so430785plo.0
 for <openrisc@lists.librecores.org>; Tue, 02 Jul 2019 20:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0AuKl6/tFOClcQ8E2AI6hBsJ2g1XLtBDY8c9fpA1c4=;
 b=WSRFQgv7FLbJh6MC27Ge+uYvLztvQLP7l2uwFLlYQHydbOL3lB+U3TPjspjMOHjeUi
 /vZIG0hkITu3X/pBCo9Jy2XGif0Kj+96OoCFnDQW/+hv42JNpUa2NZPibVEFKVYQSt7e
 /K0dOqZKK7+6bwQoNJvMcmf5lKQ5w4YYdjhKD37vosJLBMV9wizOZWGfdA0v/n1LEin1
 VWvOJyn1LPaohazdti07lRYdMa39+77hhdWtmMuh0xhZKsL+HmTZq6ZqC0We99ddR7VL
 BR/rKl+l+LoeGKSu4dCvOCbkvdLIIw2KaM4s58Bd3MjMwRC58DFWUro0peHuYdHNK6QV
 teMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0AuKl6/tFOClcQ8E2AI6hBsJ2g1XLtBDY8c9fpA1c4=;
 b=JHQ0rTySWtgi3+5LjauOOzPvgcxjyWUDl10vRXkQLU/7gBphJdjy9xFSsRfQ47f0Wl
 NeGBZm21cwgx67r0XhMhCo/dj4t3ug6aPTurDQOaEiGFld+VlxQF/dS02VZvwn+r3gAl
 k2uOMjgpFvfQaubbRoqufury7Ng/KYhmSO+16KsmvxoluWeQ4S4yOAZNWnFJqRCpTJIG
 p/glDFxgsx9AgAey1wLPPBXXwi7iNVZr7bBoaEusQaLwF9arvwyjjOo2RBBUnaYwNATi
 wOAjDG2QcOfXd6EcZEy89u1uwZPmBvOwEKhXwMfCtB6HEPwC28hDwzCiGACL30FgFW8o
 OGyg==
X-Gm-Message-State: APjAAAX+BF5E7VsopfAsOCDCazQAZsJjOi8oiJY0kXtOVkCSivCet8OA
 l8eXYrVptD1wseOKnteKftiiBa5R
X-Google-Smtp-Source: APXvYqxyocNa78zN4+TS4HhzE3QiIwCKiLwfDVAMn1+5t+GnRxls6JaIh49OPXpz1T8mrGwEvgaQXg==
X-Received: by 2002:a17:902:2a27:: with SMTP id
 i36mr38733996plb.161.1562124848203; 
 Tue, 02 Jul 2019 20:34:08 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id 191sm525522pfu.177.2019.07.02.20.34.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 20:34:07 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Wed,  3 Jul 2019 12:33:48 +0900
Message-Id: <20190703033351.11924-3-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703033351.11924-1-shorne@gmail.com>
References: <20190703033351.11924-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 2/5] or1k: Fix issues with msoft-div
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
Cc: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
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
IHRvIGwuYmYgdG8gZml4IGxvZ2ljIGlzc3VlLgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gbm9u
ZQoKIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwtMy5jIHwgMzEgKysrKysr
KysrKysrKysrKysrKysrKysKIGxpYmdjYy9jb25maWcvb3Ixay9saWIxZnVuY3MuUyAgICAgICAg
ICAgIHwgIDYgKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ix
ay9kaXYtbXVsLTMuYwoKZGlmZiAtLWdpdCBhL2djYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFr
L2Rpdi1tdWwtMy5jIGIvZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAuLjJjNGY5MWI3ZTk4Ci0tLSAv
ZGV2L251bGwKKysrIGIvZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvZGl2LW11bC0zLmMK
QEAgLTAsMCArMSwzMSBAQAorLyogeyBkZy1kbyBydW4gfSAqLworLyogeyBkZy1vcHRpb25zICIt
TzIgLW1zb2Z0LWRpdiAtbXNvZnQtbXVsIiB9ICovCisKK3N0cnVjdCB0ZXN0Y2FzZSB7CisgIGlu
dCBhOworICBpbnQgYjsKKyAgaW50IGM7CisgIGludCBleHBlY3RlZDsKK307CisKK3N0cnVjdCB0
ZXN0Y2FzZSB0ZXN0c1tdID0geworICB7MiwgMjAwLCAzLCAxMzN9LAorICB7MywgMzAwLCAzLCAz
MDB9LAorICB7MiwgNTAwLCAzLCAzMzN9LAorICB7NCwgMjUwLCAzLCAzMzN9LAorICB7MCwgMCwg
MCwgMH0KK307CisKK2ludCBjYWxjIChpbnQgYSwgaW50IGIsIGludCBjKSB7CisgIHJldHVybiBh
ICogYiAvIGM7Cit9CisKK2ludCBtYWluICgpIHsKKyAgaW50IGZhaWwgPSAwOworICBzdHJ1Y3Qg
dGVzdGNhc2UgKnRjOworCisgIGZvciAoaW50IGkgPSAwOyAodGMgPSAmdGVzdHNbaV0sIHRjLT5j
KTsgaSsrKQorICAgIGZhaWwgfD0gKGNhbGMgKHRjLT5hLCB0Yy0+YiwgdGMtPmMpICE9IHRjLT5l
eHBlY3RlZCk7CisKKyAgcmV0dXJuIGZhaWw7Cit9CmRpZmYgLS1naXQgYS9saWJnY2MvY29uZmln
L29yMWsvbGliMWZ1bmNzLlMgYi9saWJnY2MvY29uZmlnL29yMWsvbGliMWZ1bmNzLlMKaW5kZXgg
ZDIxMDM5MjM0ODYuLjZkMDU4OTc3MjI5IDEwMDY0NAotLS0gYS9saWJnY2MvY29uZmlnL29yMWsv
bGliMWZ1bmNzLlMKKysrIGIvbGliZ2NjL2NvbmZpZy9vcjFrL2xpYjFmdW5jcy5TCkBAIC02OCwx
OCArNjgsMTggQEAgX191ZGl2bW9kc2kzX2ludGVybmFsOgogCSAgIGlzIG5vdCBjbG9iYmVyZWQg
YnkgdGhpcyByb3V0aW5lLCBhbmQgdXNlIHRoYXQgYXMgdG8KIAkgICBzYXZlIGEgcmV0dXJuIGFk
ZHJlc3Mgd2l0aG91dCBjcmVhdGluZyBhIHN0YWNrIGZyYW1lLiAgKi8KIAotCWwuc2ZlcWkJCXI0
LCAwCQkvKiBkaXZpc2lvbiBieSB6ZXJvOyByZXR1cm4gMC4gICovCisJbC5zZmVxCQlyNCwgcjAJ
CS8qIGRpdmlzaW9uIGJ5IHplcm87IHJldHVybiAwLiAgKi8KIAlsLm9yaQkJcjExLCByMCwgMAkv
KiBpbml0aWFsIHF1b3RpZW50ICovCiAJbC5iZgkJOWYKIAkgbC5vcmkJCXIxMiwgcjMsIDAJLyog
aW5pdGlhbCByZW1haW5kZXIgKi8KIAogCS8qIEdpdmVuIFgvWSwgc2hpZnQgWSBsZWZ0IHVudGls
IFkgPj0gWC4gICovCiAJbC5vcmkJCXI2LCByMCwgMQkvKiBtYXNrID0gMSAqLwotMToJbC5zZmx0
c2kJcjQsIDAJCS8qIHkgaGFzIG1zYiBzZXQgKi8KKzE6CWwuc2ZsdHMJCXI0LCByMAkJLyogeSBo
YXMgbXNiIHNldCAqLwogCWwuYmYJCTJmCiAJIGwuc2ZsdHUJcjQsIHIxMgkJLyogeSA8IHggKi8K
IAlsLmFkZAkJcjQsIHI0LCByNAkvKiB5IDw8PSAxICovCi0JbC5ibmYJCTFiCisJbC5iZgkJMWIK
IAkgbC5hZGQJCXI2LCByNiwgcjYJLyogbWFzayA8PD0gMSAqLwogCiAJLyogU2hpZnQgWSBiYWNr
IHRvIHRoZSByaWdodCBhZ2Fpbiwgc3VidHJhY3RpbmcgZnJvbSBYLiAgKi8KLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

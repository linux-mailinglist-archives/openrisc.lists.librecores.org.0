Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 41CFF3A232
	for <lists+openrisc@lfdr.de>; Sat,  8 Jun 2019 23:32:50 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 30C1F20242;
	Sat,  8 Jun 2019 23:32:50 +0200 (CEST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mail.librecores.org (Postfix) with ESMTPS id D6D4620242
 for <openrisc@lists.librecores.org>; Sat,  8 Jun 2019 23:32:48 +0200 (CEST)
Received: by mail-pf1-f171.google.com with SMTP id c85so3116004pfc.1
 for <openrisc@lists.librecores.org>; Sat, 08 Jun 2019 14:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqK0PqLk2MOIIoYyxx246OsVs4dwkreis2YPAiprCaQ=;
 b=FrQJxNxPmHasffs9NN8JIzqCt3ExZFNCsvxTF0D5RSbBWqCo0EDJsPb/Pcm9KLqJU9
 q1xBAIw+qkDfpYFyaA4DLkirFbOVxVW6bYtdRCUluNrYSgMrn3Bk6BWik5k0qPGUNAZ/
 3Shli+YJziOv49jzaghIPHhDIeTPtF8uV668kZjuq4gI+rET2azfxXoWzcFCUeLmbjF3
 hrbZbF1uJ7AhbCXgI2oNhWD1KBJSOdCB6/7s8JVICE8r5mMhW47ZhdTXC0Wt5sBlRo77
 Z8kmf7KwBNLeNauxlyf8qyFt24bwj7Ms/gQmT4SaYqVDOk0KbLrp/vl+HAeJx/wZS250
 SPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JqK0PqLk2MOIIoYyxx246OsVs4dwkreis2YPAiprCaQ=;
 b=kKX84EeYGCOAam6cQiOsYK0KZCPg2hWG1Hi5PhMmWl7bvtuFJ5ZeeccMaaaGG/1MfU
 mPg4Nh5wUt7ZAzGxwSpgeeo+OQhaglG0BXsQzuj2CHpYG/vwT/JOFnzrqbTnTeH5ifLN
 +8gNSmDvpiJrXKoo3MY+y0i61G3pJ8suZ/pYjb5EsqawWPiVrIXH7PlSmLq4CQxSSb9L
 47bPC6KNFnzRgEk4efN4SIy1SgUZUuXm9mO00dvVQ5Bq4pCe8Oim/oyqTsIReDECIzqs
 ZG5yaTmHZH8V/aiEBbChiTRWYWDunqkuu6iSr2R1DGBSiWzY/ZXl+ZgAUk93Nfu4oIuj
 s5bw==
X-Gm-Message-State: APjAAAXV+lVgm4D490aas3Ls7fS8pdqV4u5s6LrqFZH4ZfvMWBx6QOyh
 hjtkW/LnKky1CQP6VM9qAT4wMajK
X-Google-Smtp-Source: APXvYqzMJPLREWfgsrUlEkx9F05rm+pOoDsOqTsG7DSQG9WxEX/txBXacEohl7dDNN3WRjrlQnRXLw==
X-Received: by 2002:a65:518d:: with SMTP id h13mr8498416pgq.186.1560029567422; 
 Sat, 08 Jun 2019 14:32:47 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id s12sm5676946pjp.10.2019.06.08.14.32.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 14:32:46 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Sun,  9 Jun 2019 06:32:20 +0900
Message-Id: <20190608213225.3230-5-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608213225.3230-1-shorne@gmail.com>
References: <20190608213225.3230-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 04/11] cpu/or1k: Update fpu compare symbols to
 imply set flag
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGZwdSBjb21wYXJlIHN5bWJvbHMgd2hlcmUgbm90IGluY2x1ZGluZyAnc2YnIGluIHRoZSBt
bmVtb25pYy4gIFNvCmluc3RlYWQgb2YgYGxmLXNmZXFgIChpbXBseWluZyBzZXQgZmxhZyBpZiBv
cGVyYW5kcyBhcmUgZXF1YWwpIHdlIHdlcmUKaGF2aW5nIGBsZi1lcWAuICAgVGhpcyBwYXRjaCBh
ZGRzIHRoZSAnc2YnLiAgVGhpcyBoZWxwcyB3aXRoIG1ha2luZyB0aGUKZ2VuZXJhdGVkIENHRU4g
ZG9jdW1lbnRhdGlvbiBjb25zaXN0ZW50IGFuZCBvcmRlcmVkIGNvcnJlY3RseS4KCmNwdS9DaGFu
Z2VMb2c6Cgp5eXl5LW1tLWRkICBTdGFmZm9yZCBIb3JuZSAgPHNob3JuZUBnbWFpbC5jb20+CgoJ
KiBvcjFrb3JmcHguY3B1IChmbG9hdC1zZXRmbGFnLWluc24tYmFzZSk6IEFkZCAnc2YnIHRvIHN5
bWJvbC4KLS0tCiBjcHUvb3Ixa29yZnB4LmNwdSB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NwdS9vcjFrb3Jm
cHguY3B1IGIvY3B1L29yMWtvcmZweC5jcHUKaW5kZXggNWUzM2I4MmE0NC4uZjQzNTIyZjJlNiAx
MDA2NDQKLS0tIGEvY3B1L29yMWtvcmZweC5jcHUKKysrIGIvY3B1L29yMWtvcmZweC5jcHUKQEAg
LTI2OCw3ICsyNjgsNyBAQAogCiAoZGVmaW5lLXBtYWNybyAoZmxvYXQtc2V0ZmxhZy1pbnNuLWJh
c2UgbW5lbW9uaWMgcnR4LW1uZW1vbmljIHN5bWFudGljcykKICAgKGJlZ2luCi0gICAgKGRuaSAo
LnN5bSBsZi0gbW5lbW9uaWMgLXMpCisgICAgKGRuaSAoLnN5bSBsZi1zZiBtbmVtb25pYyAtcykK
ICAgICAgICAgICguc3RyICJsZi5zZiIgbW5lbW9uaWMgIi5zIHJlZy9yZWciKQogICAgICAgICAg
KChNQUNIIE9SRlBYMzItTUFDSFMpKQogICAgICAgICAgKC5zdHIgImxmLnNmIiBtbmVtb25pYyAi
LnMgJHJBU0YsJHJCU0YiKQpAQCAtMjc2LDcgKzI3Niw3IEBACiAgICAgICAgICAoc3ltYW50aWNz
IHJ0eC1tbmVtb25pYyBTRiByQVNGIHJCU0YpCiAgICAgICAgICAoKQogICAgICAgICAgKQotICAg
IChkbmkgKC5zeW0gbGYtIG1uZW1vbmljIC1kKQorICAgIChkbmkgKC5zeW0gbGYtc2YgbW5lbW9u
aWMgLWQpCiAgICAgICAgICAoLnN0ciAibGYuc2YiIG1uZW1vbmljICIuZCByZWcvcmVnIikKICAg
ICAgICAgICgoTUFDSCBPUkZQWDY0LU1BQ0hTKSkKICAgICAgICAgICguc3RyICJsZi5zZiIgbW5l
bW9uaWMgIi5kICRyQURGLCRyQkRGIikKQEAgLTI4NCw3ICsyODQsNyBAQAogICAgICAgICAgKHN5
bWFudGljcyBydHgtbW5lbW9uaWMgREYgckFERiByQkRGKQogICAgICAgICAgKCkKICAgICAgICAg
ICkKLSAgICAoZG5pICguc3ltIGxmLSBtbmVtb25pYyAtZDMyKQorICAgIChkbmkgKC5zeW0gbGYt
c2YgbW5lbW9uaWMgLWQzMikKICAgICAgICAgICguc3RyICJsZi5zZiIgbW5lbW9uaWMgIi5kIHJl
Z3BhaXIvcmVncGFpciIpCiAgICAgICAgICAoKE1BQ0ggT1JGUFg2NEEzMi1NQUNIUykpCiAgICAg
ICAgICAoLnN0ciAibGYuc2YiIG1uZW1vbmljICIuZCAkckFEMzJGLCRyQkQzMkYiKQotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

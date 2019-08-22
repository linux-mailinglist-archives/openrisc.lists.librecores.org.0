Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BBF9799207
	for <lists+openrisc@lfdr.de>; Thu, 22 Aug 2019 13:28:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6775B20499;
	Thu, 22 Aug 2019 13:28:14 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 08EE620436
 for <openrisc@lists.librecores.org>; Thu, 22 Aug 2019 13:28:13 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id w2so3765846pfi.3
 for <openrisc@lists.librecores.org>; Thu, 22 Aug 2019 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmlVzSEhOyvtfewt28rOVQdjcr6g2JW+gwKJfCyrfqU=;
 b=ehGakx+q/W7uxmk5bkgfXmgTL1UfWJZCjvabAZEnhCWMjQdiFmgXTIEcAzC28mCSCk
 4G2rj7TBf4AKcDToX5OVqFvg0jDHhtMmNypVyTW3zXvjHw17GYzBfdJV1Ka8A/YQzTjZ
 VRdNbnJcJiiaVghYFHjbq6thW/Zi6R5gqICc3PMcWtx87GOhZfKygFG28EmfCrHxCDxm
 hdP6IewvNEJ6z2D8Nq8eOoMiXZGgjH0g9jVqwvZM91JjH36THN/rAqoV9A3JFrTGPmlU
 7+Qd196S8hG+uOOSLCgw5MCdzMn/C/5CWTiynRhxSuUa9tvARGfZyc1a8Q+sZQPvJPit
 XMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmlVzSEhOyvtfewt28rOVQdjcr6g2JW+gwKJfCyrfqU=;
 b=r8dy4AKoKoE6Ayznk2hFYj9kFp7A2AsGuPstLVD8x0e3AnTNusbETpEdV0/8DCrAzE
 DvBVrP1Sx4C1y1p2exXl1GbPvzIscxqJG/9EXuxg5OfI2F8DKplHDHxKBKGgmiiOS20/
 5LlWH1+DWnF7nW2nXOi4YXgGSIddHV47L3QN41uJbPM/pChMWSGT5py6hwUDP6yLo0qd
 6q+zXzRUxfNvWIsfuboaXPmofR3eER3/NBCN2JnTOvTOZDiy1LLvv9ityTlwSyBNd+c6
 RHZJOV6Of6iDsq2NOnXnAM2qp3Ohd8hgeuxCw7Y/Wxl6Z3+SNDvnps3H2UtbzIXAYrLt
 +ZgQ==
X-Gm-Message-State: APjAAAV8F9MyP+o0hUevnn+l73YfP7ExLouTEkXTcWS2v3wOohC1Y7Cz
 Mzk9/g/i2zvnG6rJJyAh6g0=
X-Google-Smtp-Source: APXvYqxMdZz2rur/R0VddwpdkoVMEJsl4qiDtQKgG6OuqoKxseWZg20vomQav1ZYXjwpFTdEJ9s/wQ==
X-Received: by 2002:aa7:984a:: with SMTP id n10mr41368884pfq.3.1566473291333; 
 Thu, 22 Aug 2019 04:28:11 -0700 (PDT)
Received: from localhost (g75.222-224-160.ppp.wakwak.ne.jp. [222.224.160.75])
 by smtp.gmail.com with ESMTPSA id
 q8sm9251480pje.2.2019.08.22.04.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 04:28:10 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Thu, 22 Aug 2019 20:27:57 +0900
Message-Id: <20190822112757.32751-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] or1k: Fix incorrect value in PLT GOT entries,
 causing infinite loop
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

VGhlIFBMVCBHT1QgZW50cnkgc2hvdWxkIHBvaW50IHRvIHRoZSBmaXJzdCBQTFQgZW50cnkgd2hp
Y2ggY29udGFpbnMgdGhlCnJ1bnRpbWUgbGlua2VyIGZ1bmN0aW9uLiAgSXQgd2FzIHBvaW50aW5n
IGJhY2sgdG8gdGhlIHN5bWJvbCBQTFQgZW50cnkKY2F1c2luZyBhbiBpbmZpbml0ZSBsb29wLgoK
SSBmb3VuZCB0aGlzIHdoZW4gdGVzdGluZyB0aGUgT3BlblJJU0MgZ2xpYmMgcG9ydCB3aGljaCB1
c2VzIHRoZSBydW50aW1lCmR5bmFtaWMgbGlua2VyLiAgSXQgc2VlbXMgb3RoZXIgbGliYydzIHdl
IHVzZSBzbyBmYXIgaGF2ZSBub3QgYmVlbgptYWtpbmcgdXNlIG9mIHRoZSBpbml0aWFsIFBMVCBH
T1QgZW50cmllcy4KCmJmZC9DaGFuZ2VMb2c6CgoJKiBlbGYzMi1vcjFrLmMgKG9yMWtfZWxmX2Zp
bmlzaF9keW5hbWljX3N5bWJvbCk6IFVzZSBjb3JyZWN0IHZhbHVlIGZvcgoJUExUIEdPVCBlbnRy
aWVzLgotLS0KIGJmZC9lbGYzMi1vcjFrLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYmZkL2VsZjMyLW9y
MWsuYyBiL2JmZC9lbGYzMi1vcjFrLmMKaW5kZXggYzFiYmFjOThmYi4uY2I3YzBkYTVmZCAxMDA2
NDQKLS0tIGEvYmZkL2VsZjMyLW9yMWsuYworKysgYi9iZmQvZWxmMzItb3Ixay5jCkBAIC0yMzc3
LDggKzIzNzcsMTEgQEAgb3Ixa19lbGZfZmluaXNoX2R5bmFtaWNfc3ltYm9sIChiZmQgKm91dHB1
dF9iZmQsCiAgICAgICBvcjFrX3dyaXRlX3BsdF9lbnRyeSAob3V0cHV0X2JmZCwgc3BsdC0+Y29u
dGVudHMgKyBoLT5wbHQub2Zmc2V0LAogCQkJICAgIHBsdDAsIHBsdDEsIHBsdDIsIE9SMUtfSlIo
MTIpKTsKIAotICAgICAgLyogRmlsbCBpbiB0aGUgZW50cnkgaW4gdGhlIGdsb2JhbCBvZmZzZXQg
dGFibGUuICAqLwotICAgICAgYmZkX3B1dF8zMiAob3V0cHV0X2JmZCwgcGx0X2FkZHIsIHNnb3Qt
PmNvbnRlbnRzICsgZ290X29mZnNldCk7CisgICAgICAvKiBGaWxsIGluIHRoZSBlbnRyeSBpbiB0
aGUgZ2xvYmFsIG9mZnNldCB0YWJsZS4gIFdlIGluaXRpYWxpemUgaXQgdG8KKwkgcG9pbnQgdG8g
dGhlIHRvcCBvZiB0aGUgcGx0LiAgVGhpcyBpcyBkb25lIHRvIGxhenkgbG9va3VwIHRoZSBhY3R1
YWwKKwkgc3ltYm9sIGFzIHRoZSBmaXJzdCBwbHQgZW50cnkgd2lsbCBiZSBzZXR1cCBieSBsaWJj
IHRvIGNhbGwgdGhlCisJIHJ1bnRpbWUgZHluYW1pYyBsaW5rZXIuICAqLworICAgICAgYmZkX3B1
dF8zMiAob3V0cHV0X2JmZCwgcGx0X2Jhc2VfYWRkciwgc2dvdC0+Y29udGVudHMgKyBnb3Rfb2Zm
c2V0KTsKIAogICAgICAgLyogRmlsbCBpbiB0aGUgZW50cnkgaW4gdGhlIC5yZWxhLnBsdCBzZWN0
aW9uLiAgKi8KICAgICAgIHJlbGEucl9vZmZzZXQgPSBnb3RfYWRkcjsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

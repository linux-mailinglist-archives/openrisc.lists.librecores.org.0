Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3167C408B4A
	for <lists+openrisc@lfdr.de>; Mon, 13 Sep 2021 14:48:17 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B98C224146;
	Mon, 13 Sep 2021 14:48:16 +0200 (CEST)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mail.librecores.org (Postfix) with ESMTPS id 1D61C20DB6
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 14:48:15 +0200 (CEST)
Received: by mail-pj1-f49.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so6425723pjn.0
 for <openrisc@lists.librecores.org>; Mon, 13 Sep 2021 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrMZ+lrJmms04U/k7RZG/Pqqs7T5wRbWh+zDFFhZAI0=;
 b=fju+PeKHZyZwIbLUI0lFjBNKbS79EDFsqBMWTGb1ID2KBu9E0zUAv66hTjpDTKbiBh
 6ERH7JQzZXNkwDdExzQvv3sYLsO6F4DtaE7edmQBg3fvvJxy3NrumzKB/oLtGwcJKZAK
 Be91NJE4nM3oTdPDatGG68V7tq0LEK4KLr4nwIDQkByZldmsCxTfx32vP7VuLcIxA00E
 RMjHApU2fjeXxeKmZsfbyvqwXsvZEKfQZ+D20SJZcM/64aBoGeI/qpCfh+MzDqDgwVL7
 JI3L2632tzny0/VwIdhdZkNte81GGuURv1aFGsddGwilF+NqImOf6HXfHhB7XVXuo0Of
 6TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrMZ+lrJmms04U/k7RZG/Pqqs7T5wRbWh+zDFFhZAI0=;
 b=YHfRA+q4nUjZYY6KlazDA1DJPOxVkmF0oZMvtRr/hVubQ8Q0TGa2cYFfmY8ocNwxV0
 C2CYDhDfddQ5RiCw/32Gh8KKYnrU+pmMpIQ01RIke6utmafgBFiGRcroALDy1AHEJyLv
 S/c3ooPPimY5SX9krVVNXCCHD2jstl5gFvrwz/G1pkZQ+LBXjb7IjvW3WQvruDW1en9v
 oWFa7h2Pluqs6zKvTP0FfDnGodWMaHl3+WQ2RG6Z/ATh7FMYB47gOxkd8OrC0RrYDYjs
 CrPhIbarcjmepQWn34HABGQe3Ts/xGjznlJpEkQmcXpxNyjzgtsEgv6OVKSM6iztgZtj
 5/tg==
X-Gm-Message-State: AOAM533eBmM3JKSGJdHdMP/WgbFe9pjY93083R2lX7PCaKFgIfIEv2XN
 USR037fH9BQcZ3086MoXw4U=
X-Google-Smtp-Source: ABdhPJz+QzyzNFd2N8a+N36uUQ41K9GokTYainuNt95ZuiKNDB8kSGaIwIg63KrD7ss8i/54tKBQkw==
X-Received: by 2002:a17:90a:1915:: with SMTP id
 21mr13141187pjg.24.1631537293497; 
 Mon, 13 Sep 2021 05:48:13 -0700 (PDT)
Received: from localhost (g245.61-45-50.ppp.wakwak.ne.jp. [61.45.50.245])
 by smtp.gmail.com with ESMTPSA id h5sm7105767pfr.134.2021.09.13.05.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 05:48:12 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>
Date: Mon, 13 Sep 2021 21:47:55 +0900
Message-Id: <20210913124800.471680-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/5] OpenRISC Linux Native and GDBServer Support
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

SGVsbG8sCgpBcyBJIGhhdmUgYmVlbiB3b3JraW5nIG9uIHRoZSBPcGVuUklTQyBnbGliYyBwb3J0
IG92ZXIgdGhlIGxhc3QgZmV3IHllYXJzIG5vdyBJCmhhdmUgaGFkIHRoZSBuZWVkIHRvIGhhdmUg
TGludXggbmF0aXZlIGRlYnVnZ2luZy4gIEF0IGZpcnN0IEkgc3RhcnRlZCB3aXRoIHRoZQpnZGJz
ZXJ2ZXIsIGJ1dCBxdWlja2x5IGdyZXcgb3V0IG9mIHRoYXQgYW5kIGp1c3Qgc2V0dGxlZCBvbiBy
dW5uaW5nIGdkYiBuYXRpdmUKb24gdGhlIHBsYXRmb3JtLgoKVGhlc2UgYXJlIHRoZSBwYXRjaGVz
IEkgaGF2ZSBiZWVuIHVzaW5nLgoKU3RhZmZvcmQgSG9ybmUgKDUpOgogIGdkYjogb3IxazogaW1w
bGVtZW50IGdkYiBzZXJ2ZXIKICBnZGI6IG9yMWs6IGZpeHVwIGxpbnV4IHJlZ2NhY2hlIGNvbW1l
bnQKICBnZGI6IG9yMWs6IGFkZCBnZW5lcmF0ZWQgbGludXggZGVzY3JpcHRvciBmaWxlCiAgZ2Ri
OiBvcjFrOiBhZGQgbmF0aXZlIGxpbnV4IHN1cHBvcnQKICBnZGI6IG9yMWs6IGFkZCBzaW5nbGUg
c3RlcCBmb3IgbGludXggbmF0aXZlIGRlYnVnZ2luZwoKIGdkYi9NYWtlZmlsZS5pbiAgICAgICAg
ICAgICAgIHwgICAyICsKIGdkYi9jb25maWd1cmUuaG9zdCAgICAgICAgICAgIHwgICAyICsKIGdk
Yi9jb25maWd1cmUubmF0ICAgICAgICAgICAgIHwgICA0ICsKIGdkYi9mZWF0dXJlcy9NYWtlZmls
ZSAgICAgICAgIHwgICAxICsKIGdkYi9mZWF0dXJlcy9vcjFrLWxpbnV4LmMgICAgIHwgIDc4ICsr
KysrKysrKysKIGdkYi9mZWF0dXJlcy9vcjFrLWxpbnV4LnhtbCAgIHwgIDEzICsrCiBnZGIvb3Ix
ay1saW51eC1uYXQuYyAgICAgICAgICB8IDIxMCArKysrKysrKysrKysrKysrKysrKysrKysrKysK
IGdkYi9vcjFrLWxpbnV4LXRkZXAuYyAgICAgICAgIHwgIDE0ICstCiBnZGIvb3Ixay1saW51eC10
ZGVwLmggICAgICAgICB8ICAyNiArKysrCiBnZGIvb3Ixay10ZGVwLmMgICAgICAgICAgICAgICB8
ICA2NiArKysrKystLS0KIGdkYi9vcjFrLXRkZXAuaCAgICAgICAgICAgICAgIHwgICA1ICsKIGdk
Yi9yZWdmb3JtYXRzL29yMWstbGludXguZGF0IHwgIDQwICsrKysrCiBnZGJzZXJ2ZXIvTWFrZWZp
bGUuaW4gICAgICAgICB8ICAgMSArCiBnZGJzZXJ2ZXIvY29uZmlndXJlLnNydiAgICAgICB8ICAg
OCArCiBnZGJzZXJ2ZXIvbGludXgtb3Ixay1sb3cuY2MgICB8IDI2NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxNSBmaWxlcyBjaGFuZ2VkLCA3MTQgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZ2RiL2ZlYXR1cmVzL29yMWstbGlu
dXguYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGdkYi9mZWF0dXJlcy9vcjFrLWxpbnV4LnhtbAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGdkYi9vcjFrLWxpbnV4LW5hdC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Z2RiL29yMWstbGludXgtdGRlcC5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgZ2RiL3JlZ2Zvcm1hdHMv
b3Ixay1saW51eC5kYXQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBnZGJzZXJ2ZXIvbGludXgtb3Ixay1s
b3cuY2MKCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD6CC1199A9
	for <lists+openrisc@lfdr.de>; Tue, 10 Dec 2019 22:49:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 619DE20755;
	Tue, 10 Dec 2019 22:49:16 +0100 (CET)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 1D7F22069E
 for <openrisc@lists.librecores.org>; Tue, 10 Dec 2019 22:49:14 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id h14so481036pfe.10
 for <openrisc@lists.librecores.org>; Tue, 10 Dec 2019 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXW0TIoXrVCVi+UpBTRkBzI0kcYkxyr8O+fnYiU5H0E=;
 b=ZuAcxMnbScNyad8WKkdHSsIDkm0K2UB9OVdgkfJem5y1SVQJ2rhwkNNP27CG9owWCw
 zwMgXCwCt59LCsdAUubB8acHK6Vmti8RH34FNFL1Viztitngb1ZXZWOU6IYwQEarcOxL
 boDk7biO89J9ngG6SagFDqImsz3ZKVIaqkOulQJb/J2NjLJ9uBfsi1NaOxeZrkY8w8Ut
 pfwxV/q/WdB2bEPE9d4jGrIQngeyT2+hCxerhOmxC0iMOzl+XNjXDEjt+dbBxIBl151w
 UYCCL69ldosjWKLN33Eya2ABUdiKKl7ZZgVsObqHOQoupHIQCAPa8pQYlBPcpx2tBB8e
 /eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jXW0TIoXrVCVi+UpBTRkBzI0kcYkxyr8O+fnYiU5H0E=;
 b=TBxeCjz3UVph5X3mFU+xNXu6jdGih7x9HhzzOeWC22A/TMucQFpdN08fpb3V5f6Yek
 tb3iVLg/1UE0M9pZr02SW7dB5cB2Ncyoy8rVQA+8duN3BA2TVpLWYj9E1mG4TATPkprQ
 suWvGNINON/th8azQLIoUCZKRxmPr9tBrY3oqD9ci71VJPKD1u7MGCvVdNjMFuhbhfOG
 uTFRwSnyzhdiU3u5BWm7MWPyD/MbD4qe62tquhYkLwCeXZHJqt13ZOMJACa8Fly3Ur/K
 Ka6lNRMnNijYSPNi5qapyApkpP6+eOVoB+WRIlMgv0w7ECb5rw6k+PRlRd1YkVDBk8ZG
 zbXQ==
X-Gm-Message-State: APjAAAUB9FcsRSQxTSBzy/7A7HpPdOxO9T+KrfD2hROZFyh/NdALwA5F
 0kyMAoxToy+hmmbV+BdH/SU=
X-Google-Smtp-Source: APXvYqzAulqGxPGcI5QCyUIu7XYSo3hED+0y0iZovvfPEeDunsk6oiZDToTfuC8xodHaUXjINNuORQ==
X-Received: by 2002:a62:5482:: with SMTP id i124mr74766pfb.176.1576014552461; 
 Tue, 10 Dec 2019 13:49:12 -0800 (PST)
Received: from localhost (g143.222-224-150.ppp.wakwak.ne.jp. [222.224.150.143])
 by smtp.gmail.com with ESMTPSA id d13sm3773810pjx.21.2019.12.10.13.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 13:49:11 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Wed, 11 Dec 2019 06:49:04 +0900
Message-Id: <20191210214906.21465-1-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/2] OpenRISC Remove 64-bit support to fit 32-bit
 hosts (PR 25184)
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
Cc: Openrisc <openrisc@lists.librecores.org>, dalias@libc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlIGlzc3VlIHdhcyByZXBvcnRlZCBieSBSaWNoIEZlbGtlciwgT3BlblJJU0MgZ2FzIGZhaWxz
IHRvIGNhbGN1bGF0ZSBuZWdhdGl2ZQpvZmZzZXRzIHdoZW4gcnVubmluZyBvbiAzMi1iaXQgaG9z
dHMuICBJIHRyYWNlZCB0aGlzIGJhY2sgdG8gaGF2aW5nIDY0LWJpdAphZGRyZXNzIHNwYWNlIHN1
cHBvcnQgaW4gdGhlIENQVSBkZWZpbml0aW9ucy4gIEl0IHNlZW1zIHdlIGNvdWxkIGZpeCB0aGlz
IGJ5CmVpdGhlciBhZGRpbmcgc29tZSBmaXhlcyBmb3IgY2dlbiB0byBzdXBwb3J0IHRoaXMgY2Fz
ZSBvciBieSBhZGRpbmcgc29tZSBjdXN0b20KQyB0byBkbyB0aGUganVtcCBvZmZzZXQgY2FsY3Vs
YXRpb25zLgoKSG93ZXZlciwgcmVhbGl6aW5nIHRoYXQgT3BlblJJU0MgNjQtYml0IHN1cHBvcnQg
aXMgbm90IHRlc3RlZCwgbm90IHVzZWQgYW5kIG5vCmhhcmR3YXJlIG9yIHNpbXVsYXRvcnMgZXhp
c3QgSSBhbSBkZWNpZGluZyByZW1vdmluZyBpdCBpcyBlYXNpZXN0LgoKU3RhZmZvcmQgSG9ybmUg
KDIpOgogIG9yMWs6IFJlbW92ZSA2NC1iaXQgc3VwcG9ydCwgaXQncyBub3QgdXNlZCBhbmQgaXQg
YnJlYWtzIDMyLWJpdCBob3N0cwogIG9yMWs6IFJlZ25lcmF0ZSBvcGNvZGUgZmlsZXMgYWZ0ZXIg
cmVtb3ZpbmcgNjQtYml0IHN1cHBvcnQKCiBjcHUvb3Ixay5jcHUgICAgICAgICAgfCAgIDM1ICst
CiBjcHUvb3Ixa2NvbW1vbi5jcHUgICAgfCAgIDE0IC0KIGNwdS9vcjFrb3JmcHguY3B1ICAgICB8
ICAgNjQgLS0KIG9wY29kZXMvb3Ixay1hc20uYyAgICB8ICAgIDkgLQogb3Bjb2Rlcy9vcjFrLWRl
c2MuYyAgIHwgMTgxMSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
b3Bjb2Rlcy9vcjFrLWRlc2MuaCAgIHwgIDMzMiArKysrLS0tLQogb3Bjb2Rlcy9vcjFrLWRpcy5j
ICAgIHwgICAgOSAtCiBvcGNvZGVzL29yMWstaWJsZC5jICAgfCAgIDYwICstCiBvcGNvZGVzL29y
MWstb3BjLmMgICAgfCAgMTUyIC0tLS0KIG9wY29kZXMvb3Ixay1vcGMuaCAgICB8ICAgMjggKy0K
IG9wY29kZXMvb3Ixay1vcGluc3QuYyB8ICA0MjggKysrKystLS0tLQogMTEgZmlsZXMgY2hhbmdl
ZCwgMTE4NSBpbnNlcnRpb25zKCspLCAxNzU3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

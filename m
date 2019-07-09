Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 199286366A
	for <lists+openrisc@lfdr.de>; Tue,  9 Jul 2019 15:06:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 06A1420359;
	Tue,  9 Jul 2019 15:06:51 +0200 (CEST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mail.librecores.org (Postfix) with ESMTPS id 8A6B720359
 for <openrisc@lists.librecores.org>; Tue,  9 Jul 2019 15:06:49 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id c73so4612254pfb.13
 for <openrisc@lists.librecores.org>; Tue, 09 Jul 2019 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EilQcnb4c1buHaCeIuPtvcyH6CC+QPIj5Xc8rhmHi3c=;
 b=vPKM8+2GWdCIy/RhjBrFWO7f4erPQgY7Bik0hWwWIQnVp9tDDQ7WFDjf4R5jdXx6xp
 cqQnQdyW3cxE+I0C8JLlc+hxyQwhs2MmHLphJipFOV1o9yurUT7AktVLnY8eSkqo5rVd
 dUM8MXDBYTwR6OttJWsLiPNZtqFJCLDpXiK0TfUBDjkxPUvCjKhei33tbzsKH9uYUvMA
 sGw2Z9Wh+nJznibILMZVERTP43SMb2YFJiZRgA8KG9S5nT3vzusGJurZNnB9Cp7Pz8WB
 vDppzHbtfUXo0TKE0DUklPqBAat+LRSczIcUbB/AeBCd04qJrBp0TUjRluur0jITPU+d
 QlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EilQcnb4c1buHaCeIuPtvcyH6CC+QPIj5Xc8rhmHi3c=;
 b=UQw/aC85ogQgheYfg9tBLAJwPA8Pgcx16iSn+NHNhavzrLofDR/Tu4oov+I0bsPGvM
 KMOdn+i6chu/gY1gkZZRS7zFi1Jnh5ZQbDYkbKwN/p1XTQYoEMROXbKhobKtGiIOEav1
 xq+NDEP7PvGty/XCXewhKGhIDQ7QaHxq6m3Ks77CW7RZNpPMUpQDGP0QxuQ1uFOaZvuN
 VA7BuBkYKf/v0S9W9SO83bM0/xiv320Dd7yJPCRYMulbXxVtsnfuOc4D47yD+8kyxP+N
 AfYGFkDISXRoPIKNEFcDV7RN+fcJYu36hGeTJHG9VUvnVDP2+qGGNBV167hNYZ0i1GrA
 nnNA==
X-Gm-Message-State: APjAAAXQiuRPDRWf4NL+GOC1AlNb/1BEjalBqZT/guRIipIKKdCs0iYZ
 IqDLBYysPrZlC3SpHPnBM3POnr5M
X-Google-Smtp-Source: APXvYqxCDH7ai3lollcEig5xqRVTb+VeDLLYGCVcTYt5TYGcXRlFB2YSFjEF5yo0v/1QY93FJcQQsA==
X-Received: by 2002:a63:5c1c:: with SMTP id q28mr29932134pgb.288.1562677608062; 
 Tue, 09 Jul 2019 06:06:48 -0700 (PDT)
Received: from localhost (g223.61-115-60.ppp.wakwak.ne.jp. [61.115.60.223])
 by smtp.gmail.com with ESMTPSA id 34sm9641946pgl.15.2019.07.09.06.06.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 06:06:47 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Tue,  9 Jul 2019 22:06:26 +0900
Message-Id: <20190709130626.11226-6-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709130626.11226-1-shorne@gmail.com>
References: <20190709130626.11226-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 5/5] or1k: only force reg for immediates
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

VGhlIGZvcmNlX3JlZyBpbiBvcjFrX2V4cGFuZF9jb21wYXJlIGlzIGhhcmQgY29kZWQgZm9yIFNJ
bW9kZSwgd2hpY2ggaXMgZmluZSBhcwp0aGlzIHVzZWQgdG8gb25seSBiZSB1c2VkIG9uIFNJIGV4
cGFuZHMuICBIb3dldmVyLCB3aXRoIEZQIHN1cHBvcnQgdGhpcyB3aWxsCmNhdXNlIGlzc3Vlcy4g
IEluIGdlbmVyYWwgd2Ugc2hvdWxkIG9ubHkgZm9yY2UgdGhlIHJpZ2h0IGhhbmQgb3BlcmFuZCB0
byBhCnJlZ2lzdGVyIGlmIGl0cyBhbiBpbW1lZGlhdGUuICBUaGlzIHBhdGNoIGFkZHMgYW4gY29u
ZGl0aW9uIHRvIGNoZWNrIGZvciB0aGF0LgoKZ2NjL0NoYW5nZUxvZzoKCgkqIGNvbmZpZy9vcjFr
L29yMWsuYyAob3Ixa19leHBhbmRfY29tcGFyZSk6IENoZWNrIGZvciBpbnQgYmVmb3JlCglmb3Jj
ZV9yZWcuCi0tLQogZ2NjL2NvbmZpZy9vcjFrL29yMWsuYyB8IDEwICsrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
Z2NjL2NvbmZpZy9vcjFrL29yMWsuYyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmMKaW5kZXggMWVl
YTg0ZjQ3ZTAuLmY4ZWVkNGE3Nzk3IDEwMDY0NAotLS0gYS9nY2MvY29uZmlnL29yMWsvb3Ixay5j
CisrKyBiL2djYy9jb25maWcvb3Ixay9vcjFrLmMKQEAgLTE0NDgsMTMgKzE0NDgsMTUgQEAgdm9p
ZAogb3Ixa19leHBhbmRfY29tcGFyZSAocnR4ICpvcGVyYW5kcykKIHsKICAgcnR4IHNyX2YgPSBn
ZW5fcnR4X1JFRyAoQkltb2RlLCBTUl9GX1JFR05VTSk7CisgIHJ0eCByaWdodGhhbmRfb3AgPSBY
RVhQIChvcGVyYW5kc1swXSwgMSk7CiAgIHJ0eF9jb2RlIGNtcF9jb2RlID0gR0VUX0NPREUgKG9w
ZXJhbmRzWzBdKTsKICAgYm9vbCBmbGFnX2NoZWNrX25lID0gdHJ1ZTsKIAotICAvKiBUaGUgUlRM
IG1heSByZWNlaXZlIGFuIGltbWVkaWF0ZSBpbiBhcmd1bWVudCAxIG9mIHRoZSBjb21wYXJlLCB0
aGlzIGlzIG5vdAotICAgICBzdXBwb3J0ZWQgdW5sZXNzIHdlIGhhdmUgbC5zZippIGluc3RydWN0
aW9ucywgZm9yY2UgdGhlbSBpbnRvIHJlZ2lzdGVycy4gICovCi0gIGlmICghVEFSR0VUX1NGSU1N
KQotICAgIFhFWFAgKG9wZXJhbmRzWzBdLCAxKSA9IGZvcmNlX3JlZyAoU0ltb2RlLCBYRVhQIChv
cGVyYW5kc1swXSwgMSkpOworICAvKiBJbnRlZ2VyIFJUTCBtYXkgcmVjZWl2ZSBhbiBpbW1lZGlh
dGUgaW4gYXJndW1lbnQgMSBvZiB0aGUgY29tcGFyZSwgdGhpcyBpcworICAgICBub3Qgc3VwcG9y
dGVkIHVubGVzcyB3ZSBoYXZlIGwuc2YqaSBpbnN0cnVjdGlvbnMsIGZvcmNlIHRoZW0gaW50bwor
ICAgICByZWdpc3RlcnMuICAqLworICBpZiAoIVRBUkdFVF9TRklNTSAmJiBDT05TVF9JTlRfUCAo
cmlnaHRoYW5kX29wKSkKKyAgICBYRVhQIChvcGVyYW5kc1swXSwgMSkgPSBmb3JjZV9yZWcgKFNJ
bW9kZSwgcmlnaHRoYW5kX29wKTsKIAogICAvKiBOb3JtYWxpemUgY29tcGFyaXNvbiBvcGVyYXRv
cnMgdG8gb25lcyBPcGVuUklTQyBzdXBwb3J0LiAgKi8KICAgc3dpdGNoIChjbXBfY29kZSkKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

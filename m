Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 86AFC515EC0
	for <lists+openrisc@lfdr.de>; Sat, 30 Apr 2022 17:38:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 59D13248FA;
	Sat, 30 Apr 2022 17:38:01 +0200 (CEST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mail.librecores.org (Postfix) with ESMTPS id E31DF248CD
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 17:37:57 +0200 (CEST)
Received: by mail-pj1-f53.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so12904737pju.2
 for <openrisc@lists.librecores.org>; Sat, 30 Apr 2022 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=kF7TN9WBue7gogtLcWCSwM/BfmlmiiSeL5p6P+r9TFf7mJTPo7V03Vb2pERNLvb7OE
 aRiiolMYojHxd4x5cQCGpG9H2wT2LX9AGbU77WuAKd7VD9xTc7yVRQuxr9CmreoFTg1r
 PvNjg/njaujbrqAe+WzlaHXAa3YGjcCyPClqxCArzRUK1f4wnu8wIGOKQzuuPux3fanL
 dNudXAVOCI0w1bdRz0Bat3QH8ewK8iAbnP04kEkDwytD4R2TvR69JqSwtluXppkeLWp+
 iJKg4ylgLJ4xSXkYkJB/5TkTjMKtqArr+XkBvDHr/ZIlgr8RD4A5+MLPtRKEzg0pyefW
 MJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=GsO1g7Ro+rsf0io9vopg1aQfP2P2g91oLlrkEyQDXiM=;
 b=LXwgIoi8ZsvgxWZJUJWIVlOPQGp+EupAv4/f0QxxRzPwk0zL0bWlpTToQKIBX3DnlH
 yZSQXnBqhc/EhXs8svMscRlZs3PqXBNjZ9m5q2ZjIgorIJPrBxQCR9ViSHTx8Y6LDndd
 +FDcMBNP5rWYsE0bL5ykxycxbmX4aW77ZZWrfeQvnaP1iWSBNVt+YFDMrRD0V75UwpLS
 AlKwxUg/WMRrjdl0fPYCUVtNNVR6d7sY0Jy8cb8EjP+xmze1bIpZNLxkzKaLj+dIJTMJ
 42cacVoZZP+oI/IIDNc3nEYpu6BldL/bFkSXdebVFweOEkBjiUw9F2gTHdsivBFuo7M8
 PBDQ==
X-Gm-Message-State: AOAM533I5xY1zOu9ql/wDaYdQ6ghPtqDgtXf/B4dEapIsObpHDVj8m47
 uK7gYSRacy+puUGczeohowV/MQ==
X-Google-Smtp-Source: ABdhPJzNtj8d/a+lfHQeb2reqO0YCZeJo7LPF+70BVvrDTXjKfwmfYC5tWlm1kzXph5Ui9RlcPxgHQ==
X-Received: by 2002:a17:902:8d8e:b0:159:4f6:c4aa with SMTP id
 v14-20020a1709028d8e00b0015904f6c4aamr4142558plo.115.1651333076544; 
 Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 m2-20020a17090a2c0200b001d7761ee6fcsm12923373pjd.3.2022.04.30.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 08:37:56 -0700 (PDT)
Date: Sat, 30 Apr 2022 08:36:22 -0700
Message-Id: <20220430153626.30660-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430153626.30660-1-palmer@rivosinc.com>
References: <20220430153626.30660-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [OpenRISC] [PATCH v4 3/7] asm-generic: qrwlock: Document the
 spinlock fairness requirements
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
Cc: peterz@infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
 guoren@kernel.org, jszhang@kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, jonas@southpole.se, linux-csky@vger.kernel.org,
 mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpJIGNvdWxkIG9ubHkg
ZmluZCB0aGUgZmFpcm5lc3MgcmVxdWlyZW1lbnRzIGRvY3VtZW50ZWQgYXMgdGhlIEMgY29kZSwK
dGhpcyBjYWxscyB0aGVtIG91dCBpbiBhIGNvbW1lbnQganVzdCB0byBiZSBhIGJpdCBtb3JlIGV4
cGxpY2l0LgoKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5j
b20+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9xcndsb2NrLmggfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmlj
L3Fyd2xvY2suaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcXJ3bG9jay5oCmluZGV4IDdhZTBlY2Uw
N2I0ZS4uMjRhZTA5YzFkYjlmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Fyd2xv
Y2suaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3Fyd2xvY2suaApAQCAtMiw2ICsyLDEwIEBA
CiAvKgogICogUXVldWUgcmVhZC93cml0ZSBsb2NrCiAgKgorICogVGhlc2UgdXNlIGdlbmVyaWMg
YXRvbWljIGFuZCBsb2NraW5nIHJvdXRpbmVzLCBidXQgZGVwZW5kIG9uIGEgZmFpciBzcGlubG9j
aworICogaW1wbGVtZW50YXRpb24gaW4gb3JkZXIgdG8gYmUgZmFpciB0aGVtc2VsdmVzLiAgVGhl
IGltcGxlbWVudGF0aW9uIGluCisgKiBhc20tZ2VuZXJpYy9zcGlubG9jay5oIG1lZXRzIHRoZXNl
IHJlcXVpcmVtZW50cy4KKyAqCiAgKiAoQykgQ29weXJpZ2h0IDIwMTMtMjAxNCBIZXdsZXR0LVBh
Y2thcmQgRGV2ZWxvcG1lbnQgQ29tcGFueSwgTC5QLgogICoKICAqIEF1dGhvcnM6IFdhaW1hbiBM
b25nIDx3YWltYW4ubG9uZ0BocC5jb20+Ci0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D4F95470ECC
	for <lists+openrisc@lfdr.de>; Sat, 11 Dec 2021 00:35:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B64E8242CC;
	Sat, 11 Dec 2021 00:35:43 +0100 (CET)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mail.librecores.org (Postfix) with ESMTPS id 3F663242B9
 for <openrisc@lists.librecores.org>; Sat, 11 Dec 2021 00:35:42 +0100 (CET)
Received: by mail-pg1-f172.google.com with SMTP id a23so4719025pgm.4
 for <openrisc@lists.librecores.org>; Fri, 10 Dec 2021 15:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ElDxRuWf9GfPoY52kEsiau5azdeYjGKXn+4nUud1HdA=;
 b=K8B21dQtjj3Bo/JunACbXTHuQn7kthplT9g5jQgXhEejDDnpidq/ZU30p+O/AGT2Pb
 FHb8Ji6s8k4Tx+EIV/Cv2h0U3CufXSO2WcipJwzx9jkotD76ebxVYTv+2hpx6nV4QDT3
 P7pwPE69Do8vgHIw90kcTdmgsMUuwOnOUzapHDvFmfiegEa5xcav9zN8ymOcliqiR5zb
 H+p8Ovw480CSM81eEzCxUX3lGMAmOuChIVfZwxTbhLp1tHO2U+3l+pMZuvQbp5lfHoVK
 eVJHK6U9s35NP1cfthLUcXI6hdhRyLi8fUgkIzqICTd0KM42jm2qX2T+COEqydufvmEQ
 X9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ElDxRuWf9GfPoY52kEsiau5azdeYjGKXn+4nUud1HdA=;
 b=urEKGHWA3fL2D6YWRQKTgSxqr1/oyiVrvEKzOOKJSeiolzOfyR+qSe2f8aBXjpJU0A
 gQdd8Qyc2fqoSzjzqaZQ6vhTTAHwRHs1+bhxo657uUnLoK4Qg0Bd/12aCcOS/NbdzfQA
 9cxQoBaSW2AWtby+9zyLZ97QlkUri/BHiaHTuPBRdshBgTrtWrtDhZF81EE0qGAZMGDZ
 4tKmbHE3j1cD5kPbQlDca1SNNUX2V/9cGcXOmlg+HHbqaevW+tuEjc0Rhj1m0wdtIOQt
 Aj2hHiPzKg3hijDOVaEN1ZH+H4IBjK/iJQOkKzO/Fv4VE3aY4xiT234c1Wnfdgx+SQkS
 23OQ==
X-Gm-Message-State: AOAM5309Wk9ucxTBMiJd0TF/YR/DmHTIQ/3GG6UgMsfbciTSRVHmz43Z
 zQUG9fWXoeRKc8WdUw0vOBc=
X-Google-Smtp-Source: ABdhPJymkr8fpeqzXONqlNXKk1LYIYCySZ8EF87NsViTzV/WMxAra61KbD6W3p0uqJ0Vqb/0hqQa/A==
X-Received: by 2002:a63:2013:: with SMTP id g19mr25795611pgg.505.1639179340863; 
 Fri, 10 Dec 2021 15:35:40 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id g189sm3575391pgc.3.2021.12.10.15.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 15:35:40 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 11 Dec 2021 08:34:55 +0900
Message-Id: <20211210233456.4146479-13-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210233456.4146479-1-shorne@gmail.com>
References: <20211210233456.4146479-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 12/13] build-many-glibcs.py: add OpenRISC
 support
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

LS0tCiBzY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5IHwgNSArKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGli
Y3MucHkgYi9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5CmluZGV4IDZhZTIxNzI5NTYuLjQ3
YjJjYWJjOWMgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKKysrIGIv
c2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5weQpAQCAtMzM0LDYgKzMzNCwxMCBAQCBjbGFzcyBD
b250ZXh0KG9iamVjdCk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnY2NvcHRz
JzogJy1tYWJpPTY0J31dKQogICAgICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0nbmlvczInLAog
ICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0nbGludXgtZ251JykKKyAgICAgICAgc2Vs
Zi5hZGRfY29uZmlnKGFyY2g9J29yMWsnLAorICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFt
ZT0nbGludXgtZ251JywKKyAgICAgICAgICAgICAgICAgICAgICAgIHZhcmlhbnQ9J3NvZnQnLAor
ICAgICAgICAgICAgICAgICAgICAgICAgZ2NjX2NmZz1bJy0td2l0aC1tdWx0aWxpYi1saXN0PW1j
bW92J10pCiAgICAgICAgIHNlbGYuYWRkX2NvbmZpZyhhcmNoPSdwb3dlcnBjJywKICAgICAgICAg
ICAgICAgICAgICAgICAgIG9zX25hbWU9J2xpbnV4LWdudScsCiAgICAgICAgICAgICAgICAgICAg
ICAgICBnY2NfY2ZnPVsnLS1kaXNhYmxlLW11bHRpbGliJywgJy0tZW5hYmxlLXNlY3VyZXBsdCdd
LApAQCAtMTI3MCw2ICsxMjc0LDcgQEAgZGVmIGluc3RhbGxfbGludXhfaGVhZGVycyhwb2xpY3ks
IGNtZGxpc3QpOgogICAgICAgICAgICAgICAgICdtaWNyb2JsYXplJzogJ21pY3JvYmxhemUnLAog
ICAgICAgICAgICAgICAgICdtaXBzJzogJ21pcHMnLAogICAgICAgICAgICAgICAgICduaW9zMic6
ICduaW9zMicsCisgICAgICAgICAgICAgICAgJ29yMWsnOiAnb3BlbnJpc2MnLAogICAgICAgICAg
ICAgICAgICdwb3dlcnBjJzogJ3Bvd2VycGMnLAogICAgICAgICAgICAgICAgICdzMzkwJzogJ3Mz
OTAnLAogICAgICAgICAgICAgICAgICdyaXNjdjMyJzogJ3Jpc2N2JywKLS0gCjIuMzEuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2985744F0FE
	for <lists+openrisc@lfdr.de>; Sat, 13 Nov 2021 04:17:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0E5B6242CA;
	Sat, 13 Nov 2021 04:17:21 +0100 (CET)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mail.librecores.org (Postfix) with ESMTPS id 4AC16242B7
 for <openrisc@lists.librecores.org>; Sat, 13 Nov 2021 04:17:19 +0100 (CET)
Received: by mail-pj1-f52.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so7332258pjj.0
 for <openrisc@lists.librecores.org>; Fri, 12 Nov 2021 19:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Mxj4dUe1Ee+dT9PVFtHu4arOqmmpc8cTXAX9cp8Njs=;
 b=hqECUPcTHj7GTbETuVcrRsCRuYuF0xpVa+ryub9I9wiWBY6NCZHY/eFkVLgIWR19jU
 LBNWtKPMr1/V03jtYS8FqS0NJxEZNby4TV4VvdLOzGQxTIW+fpvF9kBiFhw7HK4n/1kk
 5XHdCGcQx5gI/7wGL+aj90pRpOtVB3grWbw1InTjJP9NACQRLytue//0G+hdu5vydueC
 R2LNPZO42TlmQMQ1m+IOj5IpDbFZwFa6aXa5hc/a/zHqjQCJK7XqIl255WhvW5bhSLnQ
 HKFZBQ+YzcwcAON5E3kwfK9TOfXzs1AErXgpMc3Mh+6YpDgfKEDdAWyGXKrTj5puTc9m
 sU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Mxj4dUe1Ee+dT9PVFtHu4arOqmmpc8cTXAX9cp8Njs=;
 b=DKP8q2Tno/piHXn79kXuvr+ZxTYG9IqtnVX3IK6ZW02KW/0a/hnpj3bMluVFkVzeP0
 Lv7j5IPSLUvac4DbdrokRnENtf1Uh44XbGczM6Vk2ccDiBE3YeIEwuyYrKyI/DPnui/W
 O7DUSbF7Q0zFyeBL1QGHYN2IDex5G2sH5nBtuOeubTY0eSOZcCZalcSbwkHxhd/PMBa7
 570TKNuMAIzHJTL9XLXhEg2827jZnMqytfJS7E82Htb3L/xNpTsYu+p364diqw8lcF/z
 tw5GGpZOA5mwGn1FW+JJ1riVlbO7dg/Sm5R0fz12/k85NjMR/dsE4hgJ8iAAWlQczbai
 fmng==
X-Gm-Message-State: AOAM530NrwRfd0jrD7YrABftaGF7Q3QA7htfiJsJ8pWtkM0rT6TLlQd+
 PI9mP+fMsrb7xdW+yGhfRaVoUb8GjwM=
X-Google-Smtp-Source: ABdhPJwq5t5FFkkotvE8DOki6JweQ87jtAc/OceJZ5XOY3P9lngh+9GBNetygQLKtlLOtw5f5U5Zzg==
X-Received: by 2002:a17:902:c643:b0:141:cf6b:6999 with SMTP id
 s3-20020a170902c64300b00141cf6b6999mr13955311pls.80.1636773437915; 
 Fri, 12 Nov 2021 19:17:17 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id h125sm4468969pfe.164.2021.11.12.19.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 19:17:17 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Sat, 13 Nov 2021 12:16:38 +0900
Message-Id: <20211113031639.2402161-13-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113031639.2402161-1-shorne@gmail.com>
References: <20211113031639.2402161-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 12/13] build-many-glibcs.py: add OpenRISC
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
Y3MucHkgYi9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5CmluZGV4IGU4YjliMjEzY2EuLjQw
MDcyODgzYzIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKKysrIGIv
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

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEB9480FAB
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 05:43:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C4B524306;
	Wed, 29 Dec 2021 05:43:37 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id B34ED24301
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 05:43:34 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso10317987pje.0
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 20:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/W2OvxMK3faeLJf28QoUmBjnkAqL9L/jyN/UNDXxzQ=;
 b=m0ghxxK+WHKo2TNu0FzLBcQjBzVDDhFna5oOspLqNT6lPLzM9Aqel+DwjSGMu3VKdO
 r6ipGTeZJyeUKbjQ6/Ro2JBsrlPD2ZTZIjOaBSJKYz6IxN16qUG+4v4z1V0SApglZWgF
 FSelGJd3bbuTs4o1qB2SgIv9J8DlkvBBpmMuKDy/FMIYPAlJj73mdSqYipfRy++yfwsF
 I+5kzBfnAS9sp2Qh/bSvDCp4AcPbt43JDzsLbs7cLcZ4OzaH1+3DiofLrKpXPwLzWsQP
 1lzzufezXs3tH3ZNuaQ/WSX8lF+/Ey5T/Zm8W3o2InGF8rD0o2gKnBmTI/5B8neXsCN4
 bpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/W2OvxMK3faeLJf28QoUmBjnkAqL9L/jyN/UNDXxzQ=;
 b=t5SF63SStKJBPu5ij+/8d7lCosvwiERItnS9XDIphtOTXy4IRuYfBbh/B0aaKERVCZ
 qQ4EI/VcoDVkzGfRkfWBCG9RfoPvaMp4CVwaD2uB+4zV11bNRuC4AXvVz1998wM1P+nw
 uzppQ45zv/a42K47XzStkpqfKwcPqtx6aGg980RM3n8PxNb1gZASd0QBdJj0nFN1v0dA
 dopqcbQKbdZ178Nm11FPbGUeN4tb10qwK6lATVQHX/upBsSjhtN9talM9/QNrvlETaEA
 vwfd2ZM4F0SZhT6whUhmrVE8Bj1Qj8fCEuSxdPxajcmopl/zH0r3f6h7cFuJdc/pADRv
 uBKg==
X-Gm-Message-State: AOAM532Bvt8ZtWO+F/SO9dB6vu2Ix0Gg3eoJ7z0UAc01zmeVaBSyn4JT
 WdyvoYfoFTLyLjKgODnCODs=
X-Google-Smtp-Source: ABdhPJzYC7IGQH0kCaI6davqzI9KyQHo5EvUsJ/5frufk4iDr1ake3rtS9dYw64Hib277SwAjjn7Tg==
X-Received: by 2002:a17:903:191:b0:148:e4d3:e8a9 with SMTP id
 z17-20020a170903019100b00148e4d3e8a9mr24747548plg.101.1640753013390; 
 Tue, 28 Dec 2021 20:43:33 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id d17sm20956257pfl.125.2021.12.28.20.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 20:43:32 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Wed, 29 Dec 2021 13:42:50 +0900
Message-Id: <20211229044251.2203653-13-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229044251.2203653-1-shorne@gmail.com>
References: <20211229044251.2203653-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v4 12/13] build-many-glibcs.py: add OpenRISC
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
Y3MucHkgYi9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5CmluZGV4IGI4M2JjMTU5ZmQuLmFk
NmU1OTEzZTQgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKKysrIGIv
c2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5weQpAQCAtMzM1LDYgKzMzNSwxMCBAQCBjbGFzcyBD
b250ZXh0KG9iamVjdCk6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnY2NvcHRz
JzogJy1tYWJpPTY0J31dKQogICAgICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0nbmlvczInLAog
ICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0nbGludXgtZ251JykKKyAgICAgICAgc2Vs
Zi5hZGRfY29uZmlnKGFyY2g9J29yMWsnLAorICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFt
ZT0nbGludXgtZ251JywKKyAgICAgICAgICAgICAgICAgICAgICAgIHZhcmlhbnQ9J3NvZnQnLAor
ICAgICAgICAgICAgICAgICAgICAgICAgZ2NjX2NmZz1bJy0td2l0aC1tdWx0aWxpYi1saXN0PW1j
bW92J10pCiAgICAgICAgIHNlbGYuYWRkX2NvbmZpZyhhcmNoPSdwb3dlcnBjJywKICAgICAgICAg
ICAgICAgICAgICAgICAgIG9zX25hbWU9J2xpbnV4LWdudScsCiAgICAgICAgICAgICAgICAgICAg
ICAgICBnY2NfY2ZnPVsnLS1kaXNhYmxlLW11bHRpbGliJywgJy0tZW5hYmxlLXNlY3VyZXBsdCdd
LApAQCAtMTI3MSw2ICsxMjc1LDcgQEAgZGVmIGluc3RhbGxfbGludXhfaGVhZGVycyhwb2xpY3ks
IGNtZGxpc3QpOgogICAgICAgICAgICAgICAgICdtaWNyb2JsYXplJzogJ21pY3JvYmxhemUnLAog
ICAgICAgICAgICAgICAgICdtaXBzJzogJ21pcHMnLAogICAgICAgICAgICAgICAgICduaW9zMic6
ICduaW9zMicsCisgICAgICAgICAgICAgICAgJ29yMWsnOiAnb3BlbnJpc2MnLAogICAgICAgICAg
ICAgICAgICdwb3dlcnBjJzogJ3Bvd2VycGMnLAogICAgICAgICAgICAgICAgICdzMzkwJzogJ3Mz
OTAnLAogICAgICAgICAgICAgICAgICdyaXNjdjMyJzogJ3Jpc2N2JywKLS0gCjIuMzEuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

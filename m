Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CB13932BA57
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 21:19:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4212A21207;
	Wed,  3 Mar 2021 21:19:14 +0100 (CET)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mail.librecores.org (Postfix) with ESMTPS id 092E820CE6
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 21:19:12 +0100 (CET)
Received: by mail-pf1-f175.google.com with SMTP id 192so10083615pfv.0
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 12:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhCmsbDI1dI2/M5F+ADTQwB8AB3O64z4Iu6E1VIM6Js=;
 b=u4XTY3eJ1t+LOx8l2StUY+NHOSCVTyS2O7VHGBFHsvDJeLelpL2Dx+thHzR2OAABvM
 kGbeb7hediYel80WOG268GBCxXLIbzkXuYa6kKChnXtL9PxPxPLnGCJYm/6XlHD+0bto
 V0rTsxGM+DB3dyRFiETYIkMTt3iZp2IkQndDTefktOOdsl+wQ9xngSGxgTVbNRCXvl/s
 5lfSCzVtnmPfXoVhFnj7h7IuBk8Yt0EQixuBUgJ84sOUBWmW8Bz/q/FiZcja14x20hP0
 e474OWBA8wnPibKzoJxRCkZdzHDjHulHowx32tX68MzziFq557k3IOf+Q2IzeVEBhDIB
 HOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhCmsbDI1dI2/M5F+ADTQwB8AB3O64z4Iu6E1VIM6Js=;
 b=XTXgsPaoz7rTR2GTnKJoyr5Wm154ha4yWoJqqFj1A68OU8ZZIi/Ai2LgDOcimXgW/e
 +oVps+am8UELPMwjZx9Q+a7X9iVxLPDZ6rtsCrckPVMdVlf2R0nH42pU47rOSUgUEWzq
 Y4Hgfvcg+0+7FDxOjlRRfeJbmK2h2vglnew4sBFBwc2+XTjxe0Dk5m0gqIAY63AxvjWW
 RMttWX2Wpvrs5tEoIUanJTZexOWzJ4oukONhWhGLx5nkux45eqJ47hy57M6K0YTF4y5C
 wmG5LuavGAx5Zhe5yvJ/4vOq5kskPdXMZ6hmthN8DBzDy/fLexlcAx1VfI9UQuQJe8kn
 l0rQ==
X-Gm-Message-State: AOAM531cHpP6+b8hjridJplB4BzBllSxbjvyBv2F5AFQwQ+jUEKu9jic
 9HJ+eUzC1DZlzKgmUoP1pvw=
X-Google-Smtp-Source: ABdhPJwPXUhsmgnUI9WzXOxFXkSGPIlJZMxg+kTjeDTGJjMBu6atgSH4HA6CVIpKrg7cnYWP+NS5Qw==
X-Received: by 2002:a62:ed10:0:b029:1e6:2447:f8ba with SMTP id
 u16-20020a62ed100000b02901e62447f8bamr459145pfh.61.1614802750429; 
 Wed, 03 Mar 2021 12:19:10 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id j35sm11118596pgj.45.2021.03.03.12.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 12:19:09 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Thu,  4 Mar 2021 05:19:04 +0900
Message-Id: <20210303201904.3509658-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Define the elf binary entry point
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
Cc: s.hauer@pengutronix.de, Openrisc <openrisc@lists.librecores.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RW50cnkgaXMgdXNlZCBieSBxZW11IHRvIGZpbmQgd2hlcmUgdG8gc3RhcnQgYm9vdGluZywgd2Ug
ZGVmaW5lCnRoaXMgdG8gdGhlIDB4MTAwIHJlc2V0IHZlY3RvciBhcyBpcyBkb25lIGJ5IGRlZmF1
bHQgd2hlbiB0aGUgQ1BVCnJlc2V0cy4gIFRoaXMgZml4ZXMgdGhlIHFlbXUgYm9vdCBpc3N1ZS4K
ClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgotLS0KIGFy
Y2gvb3BlbnJpc2MvY3B1L2JhcmVib3gubGRzLlMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvY3B1L2JhcmVib3gubGRzLlMg
Yi9hcmNoL29wZW5yaXNjL2NwdS9iYXJlYm94Lmxkcy5TCmluZGV4IGFkYjBjMjJmOC4uNDVjNWYy
NTUzIDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL2NwdS9iYXJlYm94Lmxkcy5TCisrKyBiL2Fy
Y2gvb3BlbnJpc2MvY3B1L2JhcmVib3gubGRzLlMKQEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRl
IDxhc20tZ2VuZXJpYy9iYXJlYm94Lmxkcy5oPgogCiBPVVRQVVRfRk9STUFUKCJlbGYzMi1vcjFr
IiwgImVsZjMyLW9yMWsiLCAiZWxmMzItb3IxayIpCitFTlRSWShfX3Jlc2V0KQogX19EWU5BTUlD
ICA9ICAwOwogCiBNRU1PUlkKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

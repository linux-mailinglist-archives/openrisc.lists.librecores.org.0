Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 600562E0671
	for <lists+openrisc@lfdr.de>; Tue, 22 Dec 2020 08:07:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D859C20FFD;
	Tue, 22 Dec 2020 08:07:43 +0100 (CET)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mail.librecores.org (Postfix) with ESMTPS id 4971B205A7
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 08:07:42 +0100 (CET)
Received: by mail-pg1-f181.google.com with SMTP id 15so7804510pgx.7
 for <openrisc@lists.librecores.org>; Mon, 21 Dec 2020 23:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hk2cDE8u0WfTEuYjrU1tOKMdy/DIwU50dg41KTTX1vY=;
 b=TAX0WHuFrRIwxQK4VQQ7VfGtPivg6Taa0iYXDqthot+WKDJLmzAdowHd6jrSfxjT/P
 +XROVegmFV68XbQauNVV5RChR56iTTU+VIHWw4AWqL/BNIEHw1qEPCjvsL40TXaXOxRR
 rHKObdhOFZCXdL/qz4TtVK7DXGQDPge+FRnf031tOO+HP0WFZ4wNW2UyEftSBkAX9DTe
 R+mWHB7JTL2qLnNGknudhY/FAjBkd0kl8dd9mUnSQs4IpjXKOww07fuuxLPzY8dVOgn8
 Cbz224auC07X6ItxDVJ1pK2w6lhGlSrn2n/qAMdf6dMiAA4WA3ErVuQebfvOjYMe4Bat
 OkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hk2cDE8u0WfTEuYjrU1tOKMdy/DIwU50dg41KTTX1vY=;
 b=l4evau5Gpl+DiMcFL2IkhA9MvvyzXhbmhCM8B9iyfZz0fjLdj4UApuIJw/gzxHMoLP
 SXO21KBvAiW8ivTUlbxAlitPJpRnrs9JzMoZpvXGuqXvFNsR7BUn2eFBKUjj1w/4VWFr
 0R4iX1dr4vMC86y6APrNdj/mEh6TLde2YPS7c1vlMj5GMoyl8kFC+vVXevZdc2HqQ0cG
 igRLXJs1RxO35AxJveJAqeQpH44A6CdSz8eE9F18OtV7dJlsWwudxHucsJfPnmzcydQJ
 uwYC1izUIcdHLVMaFyFrH3dmIGmH4RyMXvDjHf92VA/8p+dPHSj6PSrQXDSjIciCdDzz
 Bp3Q==
X-Gm-Message-State: AOAM530tZvlGV7oQOLsi5Vh0WJdsePbUerF14+BHqtdJ+6ZiH5wFLGi8
 iRQvU4qMImdpGfeDZqRepWk=
X-Google-Smtp-Source: ABdhPJys6mesLl6Q93FSUHN93zC1WPhHApNiN/N1nf5C7DImS5AL0TJ4uHIZFoggPXamHti1LOVE3w==
X-Received: by 2002:a62:1ad0:0:b029:197:e389:fb26 with SMTP id
 a199-20020a621ad00000b0290197e389fb26mr18703472pfa.20.1608620860445; 
 Mon, 21 Dec 2020 23:07:40 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id q16sm19232872pfg.139.2020.12.21.23.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 23:07:39 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Tue, 22 Dec 2020 17:37:31 +1030
Message-Id: <20201222070731.491076-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2] openrisc: Add vmlinux.bin target
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
Cc: Karol Gugala <kgugala@antmicro.com>, openrisc@lists.librecores.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Mateusz Holenko <mholenko@antmicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QnVpbGQgaXQgYnkgZGVmYXVsdC4gVGhpcyBpcyBjb21tb25seSB1c2VkIGJ5IGZwZ2EgdGFyZ2V0
cy4KClNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQp2Mjog
QWRkcmVzcyByZXZpZXcgZnJvbSBNYXNhaGlybwoKIC0gQWRkIHZtbGludXguYmluIHRvIHBob255
IHRhcmdldAogLSBzaW1wbGZ5IHZtbGludXguYmluIHJ1bGUKIC0gYWRkIGNsZWFudXAgcnVsZQog
LSBhZGQgdm1saW51eC5iaW4gdG8gdGFyZ2V0cwogLSBBZGQgZ2l0aWdub3JlCi0tLQogYXJjaC9v
cGVucmlzYy9NYWtlZmlsZSAgICAgICAgfCAxMiArKysrKysrKysrKysKIGFyY2gvb3BlbnJpc2Mv
Ym9vdC8uZ2l0aWdub3JlIHwgIDIgKysKIGFyY2gvb3BlbnJpc2MvYm9vdC9NYWtlZmlsZSAgIHwg
MTAgKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9ib290Ly5naXRpZ25vcmUKIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL29wZW5yaXNjL2Jvb3QvTWFrZWZpbGUKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL01ha2VmaWxlIGIvYXJjaC9vcGVucmlzYy9NYWtlZmlsZQppbmRleCBiZjEwMTQxYzc0MjYu
LmIxMzQwNGYxZjhiZCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9NYWtlZmlsZQorKysgYi9h
cmNoL29wZW5yaXNjL01ha2VmaWxlCkBAIC0yNCw2ICsyNCwxMCBAQCBMSUJHQ0MgCQk6PSAkKHNo
ZWxsICQoQ0MpICQoS0JVSUxEX0NGTEFHUykgLXByaW50LWxpYmdjYy1maWxlLW5hbWUpCiAKIEtC
VUlMRF9DRkxBR1MJKz0gLXBpcGUgLWZmaXhlZC1yMTAgLURfX2xpbnV4X18KIAorYWxsOiB2bWxp
bnV4LmJpbgorCitib290IDo9IGFyY2gvJChBUkNIKS9ib290CisKIGlmZXEgKCQoQ09ORklHX09Q
RU5SSVNDX0hBVkVfSU5TVF9NVUwpLHkpCiAJS0JVSUxEX0NGTEFHUyArPSAkKGNhbGwgY2Mtb3B0
aW9uLC1taGFyZC1tdWwpCiBlbHNlCkBAIC00OSwzICs1MywxMSBAQCBlbHNlCiBCVUlMVElOX0RU
QiA6PSBuCiBlbmRpZgogY29yZS0kKEJVSUxUSU5fRFRCKSArPSBhcmNoL29wZW5yaXNjL2Jvb3Qv
ZHRzLworCitQSE9OWSArPSB2bWxpbnV4LmJpbgorCit2bWxpbnV4LmJpbjogdm1saW51eAorCSQo
USkkKE1BS0UpICQoYnVpbGQpPSQoYm9vdCkgJChib290KS8kQAorCithcmNoY2xlYW46CisJJChR
KSQoTUFLRSkgJChjbGVhbik9JChib290KQpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9ib290
Ly5naXRpZ25vcmUgYi9hcmNoL29wZW5yaXNjL2Jvb3QvLmdpdGlnbm9yZQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjAwN2Q2ZmVhMzE0NQotLS0gL2Rldi9udWxsCisr
KyBiL2FyY2gvb3BlbnJpc2MvYm9vdC8uZ2l0aWdub3JlCkBAIC0wLDAgKzEsMiBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAordm1saW51eC5iaW4KZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2MvYm9vdC9NYWtlZmlsZSBiL2FyY2gvb3BlbnJpc2MvYm9vdC9NYWtlZmlsZQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjViMjg1MzhmNGRkMQotLS0g
L2Rldi9udWxsCisrKyBiL2FyY2gvb3BlbnJpc2MvYm9vdC9NYWtlZmlsZQpAQCAtMCwwICsxLDEw
IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisjCisjIE1ha2VmaWxlIGZv
ciBib290YWJsZSBrZXJuZWwgaW1hZ2VzCisjCisKK3RhcmdldHMgKz0gdm1saW51eC5iaW4KKwor
T0JKQ09QWUZMQUdTX3ZtbGludXguYmluIDo9IC1PIGJpbmFyeQorJChvYmopL3ZtbGludXguYmlu
OiB2bWxpbnV4IEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWQsb2JqY29weSkKLS0gCjIuMjkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

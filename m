Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 306C4483AE2
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 04:14:50 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1279F2432E;
	Tue,  4 Jan 2022 04:14:50 +0100 (CET)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mail.librecores.org (Postfix) with ESMTPS id 2B8FC24334
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 04:14:49 +0100 (CET)
Received: by mail-pj1-f43.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so936000pjl.0
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 19:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgAi05Z1MC59Dw1ajT8qZHxaekyVL3O3QWsPedBdN8Q=;
 b=N/HpeQjDSXo66GwiUsH2qZ4uscOQCSVdT8+KaGSpHkner8GjOy2HWUSYlOx3cx8c3Z
 ni9I1Dc4Pg78RkOQXELIJ303oCiWke/fOel3krjKohhQR8B5dFEv4qXK2Xhxys/xmeav
 Hx52CpboNZ2bVinq1Oi3+BIgcf1Q+L5yuAFi62nmdWejogTGXM1ul5ZgqwdoQV8V00dP
 T06UG7UANAzCtr/e+2XGRt3PKC2dBtYjY27vhQGgXeJ/K16wKer6oy9A3sMlDh4OyMCk
 93FMlIc0bvTzNgDxImRaZfuEBO+vBJwtvhzFXdGraoFcAlQcLjgPrLhH1ofB4Epf84TN
 0wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgAi05Z1MC59Dw1ajT8qZHxaekyVL3O3QWsPedBdN8Q=;
 b=Ftb549mrOKF3B3XjDQ+dvNqPl6m8PoFOjzw2Qrxl8G26RvSj7erj6+2cabSDjq/iU+
 G2ORkqwc0LO25yW3l1HsjHZXDirbENdPBopmIg8YbED/uLanyx3h8WLea1ZlzRGKoC/s
 H5Qc36XbIk/EccAd0ZrxoNjg2dQ9PQOrGGKpTNebBc6TWve4J/DHAYGjLlahiOINudmY
 uTM0ZV2Y+BhLpW6CfqerXYq6Y2qPy65S5mX8mUa3bI/HBAhf9cSccZ7asZYF3QpTMWx/
 S3zGAyZxU4+8pgoc4gPuxw4owDY9th/UZZPbnO8c8ooSXR+xVcBAR5y1sV1qpSieCEg+
 Rd4A==
X-Gm-Message-State: AOAM532PTvL2KlfSDybaFbu4Ce03Y8Kf9pjDJnrhCUDwFsfC/CL3Ec8M
 sQGAzDO7XtDBbAfChC7jl1A=
X-Google-Smtp-Source: ABdhPJxER2z9qQBl0BD/DwC96Hoa5IzwXh4pSFk6uNxwgOY2ozHqoEJL4cVMK8Ku9WLM5sxrntJKgg==
X-Received: by 2002:a17:90b:1211:: with SMTP id
 gl17mr43175991pjb.207.1641266087810; 
 Mon, 03 Jan 2022 19:14:47 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id v25sm40263964pfg.175.2022.01.03.19.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 19:14:47 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Tue,  4 Jan 2022 12:14:13 +0900
Message-Id: <20220104031414.2416928-13-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104031414.2416928-1-shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v5 12/13] build-many-glibcs.py: add OpenRISC
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmV2aWV3ZWQtYnk6IEFkaGVtZXJ2YWwgWmFuZWxsYSAgPGFkaGVtZXJ2YWwuemFuZWxsYUBsaW5h
cm8ub3JnPgotLS0KIHNjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkgfCA1ICsrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9idWlsZC1t
YW55LWdsaWJjcy5weSBiL3NjcmlwdHMvYnVpbGQtbWFueS1nbGliY3MucHkKaW5kZXggMzU0Yjg3
MDc0Mi4uMDdhMzcwNWYzOSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9idWlsZC1tYW55LWdsaWJjcy5w
eQorKysgYi9zY3JpcHRzL2J1aWxkLW1hbnktZ2xpYmNzLnB5CkBAIC0zMzUsNiArMzM1LDEwIEBA
IGNsYXNzIENvbnRleHQob2JqZWN0KToKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICdjY29wdHMnOiAnLW1hYmk9NjQnfV0pCiAgICAgICAgIHNlbGYuYWRkX2NvbmZpZyhhcmNoPSdu
aW9zMicsCiAgICAgICAgICAgICAgICAgICAgICAgICBvc19uYW1lPSdsaW51eC1nbnUnKQorICAg
ICAgICBzZWxmLmFkZF9jb25maWcoYXJjaD0nb3IxaycsCisgICAgICAgICAgICAgICAgICAgICAg
ICBvc19uYW1lPSdsaW51eC1nbnUnLAorICAgICAgICAgICAgICAgICAgICAgICAgdmFyaWFudD0n
c29mdCcsCisgICAgICAgICAgICAgICAgICAgICAgICBnY2NfY2ZnPVsnLS13aXRoLW11bHRpbGli
LWxpc3Q9bWNtb3YnXSkKICAgICAgICAgc2VsZi5hZGRfY29uZmlnKGFyY2g9J3Bvd2VycGMnLAog
ICAgICAgICAgICAgICAgICAgICAgICAgb3NfbmFtZT0nbGludXgtZ251JywKICAgICAgICAgICAg
ICAgICAgICAgICAgIGdjY19jZmc9WyctLWRpc2FibGUtbXVsdGlsaWInLCAnLS1lbmFibGUtc2Vj
dXJlcGx0J10sCkBAIC0xMjcxLDYgKzEyNzUsNyBAQCBkZWYgaW5zdGFsbF9saW51eF9oZWFkZXJz
KHBvbGljeSwgY21kbGlzdCk6CiAgICAgICAgICAgICAgICAgJ21pY3JvYmxhemUnOiAnbWljcm9i
bGF6ZScsCiAgICAgICAgICAgICAgICAgJ21pcHMnOiAnbWlwcycsCiAgICAgICAgICAgICAgICAg
J25pb3MyJzogJ25pb3MyJywKKyAgICAgICAgICAgICAgICAnb3Ixayc6ICdvcGVucmlzYycsCiAg
ICAgICAgICAgICAgICAgJ3Bvd2VycGMnOiAncG93ZXJwYycsCiAgICAgICAgICAgICAgICAgJ3Mz
OTAnOiAnczM5MCcsCiAgICAgICAgICAgICAgICAgJ3Jpc2N2MzInOiAncmlzY3YnLAotLSAKMi4z
MS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

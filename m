Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9D62B3F88FA
	for <lists+openrisc@lfdr.de>; Thu, 26 Aug 2021 15:30:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8120C240EC;
	Thu, 26 Aug 2021 15:30:06 +0200 (CEST)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id CAC95240E9
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 15:30:04 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so2347376pjx.5
 for <openrisc@lists.librecores.org>; Thu, 26 Aug 2021 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EGevsc/jyJ74lEaSwdV/APsb0ImTFRxwqrKLjXKSBgo=;
 b=NjZDFd/8qpUbZcpyiNwRynlrWO6fTiYgBnlL6tkSnbAgyBSDIOWnt+simjDktIg5ww
 P6i1lp+WlvbgStVLOJi/KotykOktwOZ1zV5wqcLtW/w1sXGv6dtSQ0qN9QV46AMyjXBR
 CCRb5pAF4Eg9gXo+dvyXpKPDVVW3IgBoHm8VKFeDPjA8Qo3WWu50Wj2Ce5pc47uLFcL8
 dNahGuQlfbnMKmjkGkcYAXkE8LdFeBGBTDIAbHJyIh7MpfIb/js2sRA5ahQVKyisx/FH
 hEWp36m1q8TZvNOdJbe/491rCfceHJWYRsU5RKT17D/RZOp0y+QTK4CVydPOgjCQ4oM5
 O/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EGevsc/jyJ74lEaSwdV/APsb0ImTFRxwqrKLjXKSBgo=;
 b=VAJM5tZ3t7dHHicqhCUMJTiG18nyWbfQg4KrVBZ3/s5jAtVomaq8JFuosEx8GarszK
 BDe1r0M/5ons3E+r0/bZFmk7XEQQ8Co8K+FEC2c9TFoBCNoXseCQ+PiJ21k+FitLdyWP
 RpTgHQa2jKxFqp9lu2ZFyXqQDzKmBRbYHnzFi5ztD4hvH7gofC1bGKo20qBm7kYfGuv5
 xiC10hfqjXSD7e6clZ0o+4zt/UcJNzHml5KWbzPc0ahRcDUmzcbU/iNpofkvdaaAa5EE
 7f0jXvErUeUFQ8KvOU82rRmnDahjtjdHqY1VNGMeW6ooiv8FwXJYtHq2F/3Nb+Qadfml
 G9ng==
X-Gm-Message-State: AOAM531gZS8bzTbXZ/YfHZboaKr7lBgSh+RkHK1+JDbB74rHf4ngSrur
 TmIpvRH9Y9INpnV4e9wSwHU=
X-Google-Smtp-Source: ABdhPJxvQ7kbhcuLjB4I8EdREWj4nIdGC+r42Y/Ok4cfnkGHswNqhK2h+7sr42gEQSzroslfZSfP8g==
X-Received: by 2002:a17:903:32ce:b0:138:7c09:1178 with SMTP id
 i14-20020a17090332ce00b001387c091178mr3597011plr.60.1629984603296; 
 Thu, 26 Aug 2021 06:30:03 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w186sm3359693pfw.78.2021.08.26.06.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:30:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Stafford Horne <shorne@gmail.com>
Date: Thu, 26 Aug 2021 22:59:46 +0930
Message-Id: <20210826132946.3324593-4-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826132946.3324593-1-joel@jms.id.au>
References: <20210826132946.3324593-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/3] openrisc/litex: Update defconfig
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
Cc: openrisc@lists.librecores.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWRkIHRoZSBsaXRlZXRoIG5ldHdvcmsgZGV2aWNlIGFuZCBiYXNpYyBuZXR3b3JrIG9wdGlvbnMs
IGFuZCB1cGRhdGUgdGhlCm9wdGlvbnMgYnkgZG9pbmcgYSBzYXZlZGVmY29uZmlnLgoKU2lnbmVk
LW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KLS0tCiBhcmNoL29wZW5yaXNj
L2NvbmZpZ3Mvb3Ixa2xpdGV4X2RlZmNvbmZpZyB8IDI2ICsrKysrKysrKysrKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtsaXRleF9kZWZjb25maWcgYi9hcmNo
L29wZW5yaXNjL2NvbmZpZ3Mvb3Ixa2xpdGV4X2RlZmNvbmZpZwppbmRleCAzYzJjNzBkM2Q3NDAu
LmQ2OTU4NzlhNGQyNiAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtsaXRl
eF9kZWZjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9jb25maWdzL29yMWtsaXRleF9kZWZjb25m
aWcKQEAgLTEsMTggKzEsMjQgQEAKIENPTkZJR19CTEtfREVWX0lOSVRSRD15Ci1DT05GSUdfQk9P
VFBBUkFNX1NPRlRMT0NLVVBfUEFOSUM9eQotQ09ORklHX0JVR19PTl9EQVRBX0NPUlJVUFRJT049
eQogQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFPXkKLUNPTkZJR19ERVZUTVBGUz15Ci1DT05G
SUdfREVWVE1QRlNfTU9VTlQ9eQogQ09ORklHX0VNQkVEREVEPXkKK0NPTkZJR19PUEVOUklTQ19C
VUlMVElOX0RUQj0ib3Ixa2xpdGV4IgogQ09ORklHX0haXzEwMD15Ci1DT05GSUdfSU5JVFJBTUZT
X1NPVVJDRT0ib3BlbnJpc2Mtcm9vdGZzLmNwaW8uZ3oiCitDT05GSUdfTkVUPXkKK0NPTkZJR19Q
QUNLRVQ9eQorQ09ORklHX1VOSVg9eQorQ09ORklHX0lORVQ9eQorQ09ORklHX0RFVlRNUEZTPXkK
K0NPTkZJR19ERVZUTVBGU19NT1VOVD15CiBDT05GSUdfT0ZfT1ZFUkxBWT15Ci1DT05GSUdfT1BF
TlJJU0NfQlVJTFRJTl9EVEI9Im9yMWtsaXRleCIKLUNPTkZJR19QQU5JQ19PTl9PT1BTPXkKLUNP
TkZJR19QUklOVEtfVElNRT15Ci1DT05GSUdfTElURVhfU09DX0NPTlRST0xMRVI9eQorQ09ORklH
X05FVERFVklDRVM9eQorQ09ORklHX0xJVEVYX0xJVEVFVEg9eQogQ09ORklHX1NFUklBTF9MSVRF
VUFSVD15CiBDT05GSUdfU0VSSUFMX0xJVEVVQVJUX0NPTlNPTEU9eQotQ09ORklHX1NPRlRMT0NL
VVBfREVURUNUT1I9eQogQ09ORklHX1RUWV9QUklOVEs9eQorQ09ORklHX0xJVEVYX1NPQ19DT05U
Uk9MTEVSPXkKK0NPTkZJR19UTVBGUz15CitDT05GSUdfUFJJTlRLX1RJTUU9eQorQ09ORklHX1BB
TklDX09OX09PUFM9eQorQ09ORklHX1NPRlRMT0NLVVBfREVURUNUT1I9eQorQ09ORklHX0JPT1RQ
QVJBTV9TT0ZUTE9DS1VQX1BBTklDPXkKK0NPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9OPXkK
LS0gCjIuMzMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

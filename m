Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E3A0D3A237
	for <lists+openrisc@lfdr.de>; Sat,  8 Jun 2019 23:33:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C7BC62026A;
	Sat,  8 Jun 2019 23:33:00 +0200 (CEST)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by mail.librecores.org (Postfix) with ESMTPS id 6B47520106
 for <openrisc@lists.librecores.org>; Sat,  8 Jun 2019 23:32:58 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id f25so2960810pgv.10
 for <openrisc@lists.librecores.org>; Sat, 08 Jun 2019 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ujuyNlKSIOI3L3wLfD607tFhlYjymUiHSB66SYaaLqQ=;
 b=n/86z+qaJk8aMPvUiZu8w/XB4+1eWn1Eg27yiMBxe9d8ZBbck2ieBGga6sWgvN8bVv
 rFoNoO3kgLCKSb4Ec+VBcw2oS48YNKtERcdcA6jlzdXp0XIk8Mo8hv/OjLDkvA9yR0Ts
 WcfMFtt4mQ9gHQDWd5lb73gOq6bvq6f1gfiYDf1sSRVzW25adcmBwy82QYjgUW3zwCdj
 i8Xp1K8gNVrqn3odl+0mE/p8toG7dRd8d1kPBZxg43JQB/90B1dvv1QchqzLOO/doelN
 Dp1aJAQjQeu2+YoTyUOR8nQojoZhOpdEl0iulZVw1ipsB2mSRTZvV7ksN272jNRZUw23
 z2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ujuyNlKSIOI3L3wLfD607tFhlYjymUiHSB66SYaaLqQ=;
 b=TqdcGK/vdb9tQwD6XT/iUrSUZns4HP15Z7HYtNe/fR4kYPRFepAAnJ+NAjsnfK5OHG
 67hQ4Q+zzLtvKiD1TzwW/kzXDpTHLTUnXozZ5HYGb0flB4S2j/Jlb7PgND2Fxba/+SIi
 uEjuHKCG8JwyugaNaOqqD2c0k1dsEt5R1gfCoVLlVPaX3Q6VXQ1g1MAd3mjTVM8RYh1Y
 H5iuWMEwY6jJ506IQfZNMnGxYXAW68ppmayjzFchcZnD8tXN01velN6YOhCesgKEPQbj
 qn8R8riTdIEYoebyu5HIKpkVQkWwSodWw4wlKPLKUcoKqaujcyE4Vep3dCHA2ALH9dGL
 O9Xw==
X-Gm-Message-State: APjAAAX+8ycb9Tk446BMOLIkjZ91GOYrxIXGyBcvvI2Oynp7J3kRo6da
 68yzc2tvcHD8HBlhiGreQdg=
X-Google-Smtp-Source: APXvYqyvACmHCZ7t/nMYDWdXy3+59sRNk5hGw/auYoUGpfP0bMECpEh/kT4mtrWpJGdkPq3HSQcISA==
X-Received: by 2002:a63:6445:: with SMTP id y66mr9082984pgb.23.1560029576800; 
 Sat, 08 Jun 2019 14:32:56 -0700 (PDT)
Received: from localhost (g30.211-19-85.ppp.wakwak.ne.jp. [211.19.85.30])
 by smtp.gmail.com with ESMTPSA id l1sm6115870pgj.67.2019.06.08.14.32.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 14:32:56 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GDB patches <gdb-patches@sourceware.org>,
 GNU Binutils <binutils@sourceware.org>
Date: Sun,  9 Jun 2019 06:32:23 +0900
Message-Id: <20190608213225.3230-8-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608213225.3230-1-shorne@gmail.com>
References: <20190608213225.3230-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v3 07/11] sim/common: Wire in df/di conversion
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
Cc: Nick Clifton <nickc@redhat.com>, Openrisc <openrisc@lists.librecores.org>,
 Andrey Bacherov <bandvig@mail.ru>,
 Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXAgdW50aWwgbm93IHRoZXNlIGhhdmUgbm90IGJlZW4gdXNlZCBpbiBhbnkgQ0dFTiB0YXJnZXRz
LCBhZGQgdGhlbSBhcwp0aGV5IGFyZSBub3cgdXNlZCBieSBPcGVuUklTQy4KCnNpbS9jb21tb24v
Q2hhbmdlTG9nOgoKCSogY2dlbi1hY2NmcC5jIChmbG9hdGRpZGYsIGZpeGRmZGkpOiBOZXcgZnVu
Y3Rpb25zLgoJKGNnZW5faW5pdF9hY2N1cmF0ZV9mcHUpOiBBZGQgZmxvYXRkaWRmIGFuZCBmaXhk
ZmRpLgotLS0KQ2hhbmdlcyBzaW5jZSB2MjoKIC0gbm9uZQoKIHNpbS9jb21tb24vY2dlbi1hY2Nm
cC5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NpbS9jb21tb24vY2dlbi1hY2NmcC5jIGIvc2ltL2Nv
bW1vbi9jZ2VuLWFjY2ZwLmMKaW5kZXggNWQ2MDBjNmU0MS4uNTFmNWEyOWZlMiAxMDA2NDQKLS0t
IGEvc2ltL2NvbW1vbi9jZ2VuLWFjY2ZwLmMKKysrIGIvc2ltL2NvbW1vbi9jZ2VuLWFjY2ZwLmMK
QEAgLTM0OSw2ICszNDksMTcgQEAgZmxvYXRzaWRmIChDR0VOX0ZQVSogZnB1LCBpbnQgaG93IFVO
VVNFRCwgU0kgeCkKICAgcmV0dXJuIHJlczsKIH0KIAorc3RhdGljIERGCitmbG9hdGRpZGYgKENH
RU5fRlBVKiBmcHUsIGludCBob3cgVU5VU0VELCBESSB4KQoreworICBzaW1fZnB1IGFuczsKKyAg
dW5zaWduZWQ2NCByZXM7CisKKyAgc2ltX2ZwdV9pNjR0byAoJmFucywgeCwgc2ltX2ZwdV9yb3Vu
ZF9uZWFyKTsKKyAgc2ltX2ZwdV90bzY0ICgmcmVzLCAmYW5zKTsKKyAgcmV0dXJuIHJlczsKK30K
Kwogc3RhdGljIFNGCiB1ZmxvYXRzaXNmIChDR0VOX0ZQVSogZnB1LCBpbnQgaG93IFVOVVNFRCwg
VVNJIHgpCiB7CkBAIC0zODIsNiArMzkzLDE3IEBAIGZpeGRmc2kgKENHRU5fRlBVKiBmcHUsIGlu
dCBob3cgVU5VU0VELCBERiB4KQogICByZXR1cm4gcmVzOwogfQogCitzdGF0aWMgREkKK2ZpeGRm
ZGkgKENHRU5fRlBVKiBmcHUsIGludCBob3cgVU5VU0VELCBERiB4KQoreworICBzaW1fZnB1IG9w
MTsKKyAgdW5zaWduZWQ2NCByZXM7CisKKyAgc2ltX2ZwdV82NHRvICgmb3AxLCB4KTsKKyAgc2lt
X2ZwdV90bzY0aSAoJnJlcywgJm9wMSwgc2ltX2ZwdV9yb3VuZF9uZWFyKTsKKyAgcmV0dXJuIHJl
czsKK30KKwogc3RhdGljIFVTSQogdWZpeHNmc2kgKENHRU5fRlBVKiBmcHUsIGludCBob3cgVU5V
U0VELCBTRiB4KQogewpAQCAtNzM5LDggKzc2MSwxMCBAQCBjZ2VuX2luaXRfYWNjdXJhdGVfZnB1
IChTSU1fQ1BVKiBjcHUsIENHRU5fRlBVKiBmcHUsIENHRU5fRlBVX0VSUk9SX0ZOKiBlcnJvcikK
ICAgby0+ZnRydW5jZGZzZiA9IGZ0cnVuY2Rmc2Y7CiAgIG8tPmZsb2F0c2lzZiA9IGZsb2F0c2lz
ZjsKICAgby0+ZmxvYXRzaWRmID0gZmxvYXRzaWRmOworICBvLT5mbG9hdGRpZGYgPSBmbG9hdGRp
ZGY7CiAgIG8tPnVmbG9hdHNpc2YgPSB1ZmxvYXRzaXNmOwogICBvLT5maXhzZnNpID0gZml4c2Zz
aTsKICAgby0+Zml4ZGZzaSA9IGZpeGRmc2k7CisgIG8tPmZpeGRmZGkgPSBmaXhkZmRpOwogICBv
LT51Zml4c2ZzaSA9IHVmaXhzZnNpOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ED6D4170C02
	for <lists+openrisc@lfdr.de>; Wed, 26 Feb 2020 23:56:56 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CA9CD2097A;
	Wed, 26 Feb 2020 23:56:56 +0100 (CET)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 1B5A720964
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 23:56:55 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id i6so548236pfc.1
 for <openrisc@lists.librecores.org>; Wed, 26 Feb 2020 14:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3yZOynVtZ9TuFM5blbmeqKauEd+nanPA/x/dYgy4NIw=;
 b=EO2EpfelDxj6yFbd8r60aewPznC0Fq5Ufv3i4qGw0pwwm0k+nYDFr1GL75urBMM4zu
 J0glJhC2Q6cA+mP08iaXFmOVhjCtBgHAWJeXAUA1VIteADNtXsBwcxlgXJ6Y50RnmGy1
 Cv96E4Ml5Smil/1H8gpLYax0smDbD4PCiDMghVSARalpTBGQYTGYI6zkl1BrIuR5NRf0
 rr/hVF0y4Z02yFnx46YZdMQDVpxG9Yo626h46S6yBOfDcIGmg71Zk1W4P8Wz1awOIB+F
 3rngUHAhWU6mhsBugqQofpOFUWUm8dqLNK0nvKHcDHDC7zK1PmEi4ENkrbHtuxoKCIDm
 PLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3yZOynVtZ9TuFM5blbmeqKauEd+nanPA/x/dYgy4NIw=;
 b=JLm9V4Q8dR6b/UHRjqW7b0R+4M3Gj/b/E7V7d1omng/la1x7x1gtmBxLwvZEWoRtFe
 T6WV2TYZ73H52q6JS0X1b8sRDStnaP8Kk3+hqCM4fPeGzTCuajUfmrLoIiBGWHT5crr8
 8stQYeBANsP1bRkmD+CGcFZKQ9Q0pybwSb0pUyFkPeF3GJEzxbvNd8nEldtN0emH7U3c
 9Vd5dAF2iNpCfbUS89WomsTsnISRiiwvxdv2NPtDis5x1HZO/eEOE8uyzienhfagD7Wh
 l2Hozx76DYUkuLo4x3E6HhRqa/Q+r5mFk5IPbZflAyPmpIoChXPMuAmxpey6KKlGvW3z
 mevQ==
X-Gm-Message-State: APjAAAVsF4SN6WIwPaUbn0D3MNVBsoknHnb8IwKT7lgROxrGUgYpnBLG
 iXUxwvcCaw0VcBBhfn5ddN4=
X-Google-Smtp-Source: APXvYqwzNIhc6hsdjebEOPJY36PCd53sBWg1xV74dKzmQPjY6Uj4+MZs24N6QMWE1/TPcfml608Otg==
X-Received: by 2002:a63:e74f:: with SMTP id j15mr1077288pgk.20.1582757813368; 
 Wed, 26 Feb 2020 14:56:53 -0800 (PST)
Received: from localhost (g183.222-224-185.ppp.wakwak.ne.jp. [222.224.185.183])
 by smtp.gmail.com with ESMTPSA id g13sm3718187pgh.82.2020.02.26.14.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 14:56:52 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>
Date: Thu, 27 Feb 2020 07:56:24 +0900
Message-Id: <20200226225625.28935-3-shorne@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200226225625.28935-1-shorne@gmail.com>
References: <20200226225625.28935-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 2/3] openrisc: Enable the clone3 syscall
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
Cc: Jonas Bonn <jonas@southpole.se>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RW5hYmxlIHRoZSBjbG9uZTMgc3lzY2FsbCBmb3IgT3BlblJJU0MuICBXZSB1c2UgdGhlIGdlbmVy
aWMgdmVyc2lvbi4KClRoaXMgd2FzIHRlc3RlZCB3aXRoIHRoZSBjbG9uZTMgdGVzdCBmcm9tIHNl
bGZ0ZXN0cy4gIE5vdGUsIGZvciBhbGwKdGVzdHMgdG8gcGFzcyBpdCByZXF1aXJlZCBlbmFibGlu
ZyBDT05GSUdfTkFNRVNQQUNFUyB3aGljaCBpcyBub3QKZW5hYmxlZCBpbiB0aGUgZGVmYXVsdCBr
ZXJuZWwgY29uZmlnLgoKU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFp
bC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL3VhcGkvYXNtL3VuaXN0ZC5oIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2luY2x1ZGUvdWFwaS9hc20vdW5pc3RkLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvdWFw
aS9hc20vdW5pc3RkLmgKaW5kZXggNTY2ZjhjNGY4MDQ3Li5mYWUzNGM2MGZhODggMTAwNjQ0Ci0t
LSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS91YXBpL2FzbS91bmlzdGQuaAorKysgYi9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvdWFwaS9hc20vdW5pc3RkLmgKQEAgLTI0LDYgKzI0LDcgQEAKICNkZWZp
bmUgX19BUkNIX1dBTlRfU0VUX0dFVF9STElNSVQKICNkZWZpbmUgX19BUkNIX1dBTlRfU1lTX0ZP
UksKICNkZWZpbmUgX19BUkNIX1dBTlRfU1lTX0NMT05FCisjZGVmaW5lIF9fQVJDSF9XQU5UX1NZ
U19DTE9ORTMKICNkZWZpbmUgX19BUkNIX1dBTlRfVElNRTMyX1NZU0NBTExTCiAKICNpbmNsdWRl
IDxhc20tZ2VuZXJpYy91bmlzdGQuaD4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A719514AAE
	for <lists+openrisc@lfdr.de>; Mon,  6 May 2019 15:16:30 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4E4E728445;
	Mon,  6 May 2019 15:16:30 +0200 (CEST)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mail.librecores.org (Postfix) with ESMTPS id B49A7279C6
 for <openrisc@lists.librecores.org>; Mon,  6 May 2019 15:16:28 +0200 (CEST)
Received: by mail-pg1-f180.google.com with SMTP id h1so6463771pgs.2
 for <openrisc@lists.librecores.org>; Mon, 06 May 2019 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9b/zTSjBXQ7htokux0Hz7rxlfyMltWRAp0wmfMxh5hg=;
 b=L2/hMyZ1oVV4Lhj9jaDbhvAlRinofl9quhY1qiwTWKoQKTIEMWShxWPcAtFYSXPflS
 eApqrptmath1axlpHhzw9pu/nauqvx65Teup8ADSlOOHERusRBOLOktHUs9UJM1Uzaq6
 jl47OxPvN9xzfWs6rH5WMDY/7B7cUydJb25D+NXqvbtyxB+X6+PwF9hETJgTjPvh8XgY
 UfajCRdE82BRiBDRIqy8ptt4jQlK4RFxCD5KzvIrmNzOgq551+vvjrZwWLqe1fpNHHtF
 rbnSXJsAIMSnNDRxri4nZS0kdt4AsYDgeAU3+9cWCXnxO0ieQZ7E092yNGcI/GkvfMdF
 leIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9b/zTSjBXQ7htokux0Hz7rxlfyMltWRAp0wmfMxh5hg=;
 b=i+AEyRTTkUhEGc0fwoPdpFej1I/XHq+dJtPJmGKDbcbHYUdDV0PAsTLK3VstHosEzY
 l39XHFXsykbQAqKol27E0UGIT/W1V0WK7xb5GfWk9maaieAnVrdt634Crc4Hzt1xKsSG
 3S1Uwksa/8IRQUnIyj7F1anb7uirpHmP7pB0H2j+bO99YHThd6tJc41h1fuPFTPwR33w
 LK6jT1iHnNeNCBH4jQ8mpXr2vyxBvqrPLk6GChYdUZo7Jjp2JDWp23/pfPshKRYFHFLN
 Fd3Fl8L4/03CLfzIKTLR5Da6uD9oUGP+8DH9mSZ80KOx5Tn9ffDxISb8vc4wnSFW91dB
 711Q==
X-Gm-Message-State: APjAAAVNqhwdeptcs+VZZyOwjWLQfAbOJr1dXFdS/I8BHxD8Ll8nEs/4
 tcbESfOQKyDaXjCLysoajJ0=
X-Google-Smtp-Source: APXvYqyocNpVXwEzlKU/k7tLDEra9FcFIzSsviyp5CV7A5sLgByfaOskQ0jNxvzzK6HTWK9iWUmbWg==
X-Received: by 2002:a63:d347:: with SMTP id u7mr32031677pgi.254.1557148587128; 
 Mon, 06 May 2019 06:16:27 -0700 (PDT)
Received: from localhost (g191.61-115-60.ppp.wakwak.ne.jp. [61.115.60.191])
 by smtp.gmail.com with ESMTPSA id l15sm17161090pfi.79.2019.05.06.06.16.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 06:16:25 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Mon,  6 May 2019 22:16:19 +0900
Message-Id: <20190506131621.29929-1-shorne@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/2] OpenRISC fixes
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

SSBzZW50IHRoZSBmaXggZm9yIDkwMzYzIHByZXZpb3VzbHkgd2l0aCB0aGUgRlBVIHBhdGNoZXMu
ICBOb3csIEkgaGF2ZSBhZGRlZAp0ZXN0cyBhbmQgYW5vdGhlciBpc3N1ZSBjYW1lIHVwLCBzbyBJ
IGFtIHNlbmRpbmcgYXMgYSBuZXcgc2VyaWVzLiAgSSBwbGFubmVkIHRvCmNvbW1pdCB0aGUgY29k
ZSBiZWZvcmUgdGhlIDkueCByZWxlYXNlIGJ1dCBtaXNzZWQgdGhhdC4KClRoaXMgaXMgYSBzZXJp
ZXMgb2YgZml4ZXMgZm9yIHRoZSBPcGVuUklTQyB0YXJnZXQgZm91bmQgZHVyaW5nIHJlY2VudCB0
ZXN0aW5ncy4KClBSczoKCiAtIDkwMzYyIG9yMWs6IFNvZnQgZGl2aWRlIGRvZXMgbm90IHdvcmsg
Y29ycmVjdGx5CiAtIDkwMzYzIG9yMWs6IEV4dHJhIG1hc2sgaW5zbiBhZnRlciBsb2FkIGZyb20g
bWVtb3J5CgpTdGFmZm9yZCBIb3JuZSAoMik6CiAgb3IxazogRml4IGNvZGUgcXVhbGl0eSBmb3Ig
dm9sYXRpbGUgbWVtb3J5IGxvYWRzCiAgb3IxazogRml4IGlzc3VlcyB3aXRoIG1zb2Z0LWRpdgoK
IGdjYy9jb25maWcvb3Ixay9vcjFrLm1kICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIGdjYy9j
b25maWcvb3Ixay9wcmVkaWNhdGVzLm1kICAgICAgICAgICAgIHwgMTggKysrKysKIGdjYy90ZXN0
c3VpdGUvZ2NjLnRhcmdldC9vcjFrL2Rpdi1tdWwtMy5jIHwgMzEgKysrKysrKysKIGdjYy90ZXN0
c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3N3YXAtMS5jICAgIHwgODYgKysrKysrKysrKysrKysrKysr
KysrKysKIGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9vcjFrL3N3YXAtMi5jICAgIHwgNjMgKysr
KysrKysrKysrKysrKysKIGxpYmdjYy9jb25maWcvb3Ixay9saWIxZnVuY3MuUyAgICAgICAgICAg
IHwgIDYgKy0KIDYgZmlsZXMgY2hhbmdlZCwgMjA0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZ2NjL3Rlc3RzdWl0ZS9nY2MudGFyZ2V0L29yMWsvZGl2
LW11bC0zLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBnY2MvdGVzdHN1aXRlL2djYy50YXJnZXQvb3Ix
ay9zd2FwLTEuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGdjYy90ZXN0c3VpdGUvZ2NjLnRhcmdldC9v
cjFrL3N3YXAtMi5jCgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGli
cmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlz
Ywo=

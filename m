Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 80DAF4681EF
	for <lists+openrisc@lfdr.de>; Sat,  4 Dec 2021 03:19:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 668F224287;
	Sat,  4 Dec 2021 03:19:15 +0100 (CET)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mail.librecores.org (Postfix) with ESMTPS id 7DB0524286
 for <openrisc@lists.librecores.org>; Sat,  4 Dec 2021 03:19:13 +0100 (CET)
Received: by mail-pj1-f54.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so3961506pjb.5
 for <openrisc@lists.librecores.org>; Fri, 03 Dec 2021 18:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HySgl1aazEFF/0pHlVuKtbQoUuOrWhUzXZK/cM+YaDA=;
 b=MFjgvfk/Rmqmiy1u6FdgpcYXFuJGAloSbFeEpYylnuP/xSsGCdMV4gAW2U2nl4BUlX
 +5vQi2xybslX5pGdV2EV/+etfFPdHEIx8koWwwNCYIY1vv2LgZ4+lPrqJe9An7FivsQz
 mVeDvbPNe3Q67vRCNs1W2FSOUltDbFgWCWy3BeVsBKJgvXxLnFpDRfGur822YGn/hYU7
 9Mxf6/50NCfQF73afsWzRirRzeXLpD99dA6SSNhuIIbkNVO/493pEfl1etypPyhQfxFr
 01ck/7NPwDEyPCfNDg8pydck7pwl60J7WJ1Wc4T5ganqtXutywnpiIwD884Tez61KRN3
 Y2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HySgl1aazEFF/0pHlVuKtbQoUuOrWhUzXZK/cM+YaDA=;
 b=CfnkOwldpiHRqbLPOPECYyqx3I0oWjGoobvfKOVLvUcD+kOo3F1nz1qhHsNE9HOzs+
 W5nWKK6AoSQCypCDLcQQ7sHy+7wuCM92/E5q8iBEmnNFqZTeowGREx9FLK838Lr1eBpm
 ek45mxjBSK9joal7vVL2cznjSoYPX6LVVQqL6DmfPo8/iHlGdcahRFjFniQ3Ocwr9ip1
 msTp8p8bHgXbD6YPybn8DDTbkoZ02DFJkgRj/Wz9HtcWV4OWl8T25z8WLMrzr9b8tb44
 DW3fhL3wSOH9Y+WQymB8YqwqEg1U5ok7IIVb+sLowzNTa8w8wOongsrlT9xlKqakRj94
 Kipw==
X-Gm-Message-State: AOAM530YqRw+boRiDzSSoy24DoUGWhpyIDMS0WWBql3VPK5M4KyCvF2T
 TEMiI2veXaPPb+t7FR5JkE4=
X-Google-Smtp-Source: ABdhPJwUGVH+woQYAqfI5V4YKXxdrSDOHdd4IPtHx/Xzs5CJeMo0O9rf0JhXCmj06z5YoH98R/Ym5Q==
X-Received: by 2002:a17:90a:3b02:: with SMTP id
 d2mr18284888pjc.159.1638584352154; 
 Fri, 03 Dec 2021 18:19:12 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id 63sm4573644pfz.119.2021.12.03.18.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 18:19:11 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Sat,  4 Dec 2021 11:18:42 +0900
Message-Id: <20211204021842.1853549-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211204021842.1853549-1-shorne@gmail.com>
References: <20211204021842.1853549-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 3/3] openrisc: Add clone3 ABI wrapper
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
Cc: Jonas Bonn <jonas@southpole.se>, Petr Mladek <pmladek@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Chris Down <chris@chrisdown.name>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Openrisc <openrisc@lists.librecores.org>,
 Rob Landley <rob@landley.net>, Jessica Yu <jeyu@kernel.org>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TGlrZSBmb3JrIGFuZCBjbG9uZSB0aGUgY2xvbmUzIHN5c2NhbGwgbmVlZHMgYSB3cmFwcGVyIHRv
IHNhdmUgY2FsbGVlCnNhdmVkIHJlZ2lzdGVycywgd2hpY2ggaXMgcmVxdWlyZWQgYnkgdGhlIE9w
ZW5SSVNDIEFCSS4gIFRoaXMgY2FtZSB1cAphZnRlciBhdWRpdGluZyBjb2RlIGZvbGxvd2luZyBh
IGRpc2N1c3Npb24gd2l0aCBSb2IgTGFuZGxleSBhbmQgQXJuZApCZXJnbWFubiBbMF0uCgpUZXN0
ZWQgd2l0aCB0aGUgY2xvbmUzIGtzZWxmdGVzdHMgYW5kIHRoZXJlIHdlcmUgbm8gaXNzdWVzLgoK
WzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80MTIwNmZjNy1mOGNlLTk4YWEtMzcxOC1i
YTNlMTQzMWUzMjBAbGFuZGxleS5uZXQvVC8jbTljMGNkYjI3MDM4MTNiOWRmNGRhMDRjZjZiMzBk
ZTFmMWFhODk5NDQKCkZpeGVzOiAwN2U4M2RmYmUxNmMgKCJvcGVucmlzYzogRW5hYmxlIHRoZSBj
bG9uZTMgc3lzY2FsbCIpCkNjOiBSb2IgTGFuZGxleSA8cm9iQGxhbmRsZXkubmV0PgpDYzogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUg
PHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zeXNjYWxs
cy5oIHwgMiArKwogYXJjaC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUyAgICAgICAgIHwgNSArKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL3N5c2NhbGxzLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3N5c2NhbGxzLmgKaW5kZXggM2E3ZWVhZTZmNTZhLi5hYTFjN2U5ODcyMmUgMTAwNjQ0Ci0tLSBh
L2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vc3lzY2FsbHMuaAorKysgYi9hcmNoL29wZW5yaXNj
L2luY2x1ZGUvYXNtL3N5c2NhbGxzLmgKQEAgLTIyLDkgKzIyLDExIEBAIGFzbWxpbmthZ2UgbG9u
ZyBzeXNfb3Ixa19hdG9taWModW5zaWduZWQgbG9uZyB0eXBlLCB1bnNpZ25lZCBsb25nICp2MSwK
IAogYXNtbGlua2FnZSBsb25nIF9fc3lzX2Nsb25lKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3Ms
IHVuc2lnbmVkIGxvbmcgbmV3c3AsCiAJCQl2b2lkIF9fdXNlciAqcGFyZW50X3RpZCwgdm9pZCBf
X3VzZXIgKmNoaWxkX3RpZCwgaW50IHRscyk7Cithc21saW5rYWdlIGxvbmcgX19zeXNfY2xvbmUz
KHN0cnVjdCBjbG9uZV9hcmdzIF9fdXNlciAqdWFyZ3MsIHNpemVfdCBzaXplKTsKIGFzbWxpbmth
Z2UgbG9uZyBfX3N5c19mb3JrKHZvaWQpOwogCiAjZGVmaW5lIHN5c19jbG9uZSBfX3N5c19jbG9u
ZQorI2RlZmluZSBzeXNfY2xvbmUzIF9fc3lzX2Nsb25lMwogI2RlZmluZSBzeXNfZm9yayBfX3N5
c19mb3JrCiAKICNlbmRpZiAvKiBfX0FTTV9PUEVOUklTQ19TWVNDQUxMU19IICovCmRpZmYgLS1n
aXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRyeS5TIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwv
ZW50cnkuUwppbmRleCA4Y2QyMTEzMDU3YzUuLjNjYTFiMWY0OTBiOSAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9rZXJuZWwvZW50cnkuUworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9lbnRy
eS5TCkBAIC0xMTY1LDYgKzExNjUsMTEgQEAgRU5UUlkoX19zeXNfY2xvbmUpCiAJbC5qCV9mb3Jr
X3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAogCSBsLm9yaQlyMjkscjI5LGxvKHN5c19jbG9uZSkK
IAorRU5UUlkoX19zeXNfY2xvbmUzKQorCWwubW92aGkJcjI5LGhpKHN5c19jbG9uZTMpCisJbC5q
CV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAorCSBsLm9yaQlyMjkscjI5LGxvKHN5c19j
bG9uZTMpCisKIEVOVFJZKF9fc3lzX2ZvcmspCiAJbC5tb3ZoaQlyMjksaGkoc3lzX2ZvcmspCiAJ
bC5qCV9mb3JrX3NhdmVfZXh0cmFfcmVnc19hbmRfY2FsbAotLSAKMi4zMS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

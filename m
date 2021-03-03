Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5A6132B855
	for <lists+openrisc@lfdr.de>; Wed,  3 Mar 2021 14:50:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9C22621207;
	Wed,  3 Mar 2021 14:50:40 +0100 (CET)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mail.librecores.org (Postfix) with ESMTPS id 17EDC211D8
 for <openrisc@lists.librecores.org>; Wed,  3 Mar 2021 14:50:39 +0100 (CET)
Received: by mail-pl1-f179.google.com with SMTP id u11so14046393plg.13
 for <openrisc@lists.librecores.org>; Wed, 03 Mar 2021 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIhB0bJu41uVvngYYT0NTcQhJNYdmr0Au3krz82BP3A=;
 b=QxTwBKX8jb8KR6SM4p3m/nri4i22f5J7GWyQs/teJgC1/KfeBvZJdqNVuOL6KLbcHm
 o74rtlwFJ3LXA7RAvngcNicf+py4ComqGJOhCYqZueuSRFU+K6ZdGp1oWRbIr++BEaqD
 VmWqvpY/2mqM/af4fmGQFtxEjciwkhlPjc4hZfMw0riZoSdaFNDhFwDYYEAv93nuE3gp
 z90ljU7T/hey8PmcvkCw3Ads1Cg2em1drhigRobXDh4j+/DFUzmG5VIzi6bd8pF9tZOP
 AajRSa8Dq8nP4o/b7phVApWEnX3mo1d7GEpOUINjj7byOQ09dnNlKVpSzoQbql5A7ps6
 3LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pIhB0bJu41uVvngYYT0NTcQhJNYdmr0Au3krz82BP3A=;
 b=fCMSWsb1zGTL524toUeAnmYhWh0IJcbA0T2nnAoBx+fQBhP29VOB4cJQrJGBr2K6/O
 aiMNI560k1xfkPndgJhBesEDYrKqYLc57J4cyU81biHwRNM8NWFdDzeaT/Dcxs1cF86t
 JMv9o+Ruq3L6GYTzbpT8rKD6Sjbt6xC94fHKwzB4lyinxF7nh0+O/4EHI1+g7ikcIm9I
 zfBgnueM+Ko42FUcioPmBjEbn6N3P5XGfywu2RpnIYRk9BHtoSKbvr4B58HnsbBkP1hI
 GzPT0joneWIZm/u1803aCcEvkoHqE0c920lFKkusdaIeI0HpE9LhkgJFebCQMJu8Cbjp
 82DA==
X-Gm-Message-State: AOAM533fqJbRBNlPNxrDt2dSVOkZbs7NaWN4Z356JD2Rjh7qWnegzdJj
 lvZc46baiTCCkGvKUq+bULQ=
X-Google-Smtp-Source: ABdhPJylNVDLGtZSKNuR5qKOMb0y2PhuviI+7osL5RdGkofYdwwQ6gJtqQXUgMGuUBft+ccK04iIwg==
X-Received: by 2002:a17:90b:253:: with SMTP id
 fz19mr9636374pjb.160.1614779437563; 
 Wed, 03 Mar 2021 05:50:37 -0800 (PST)
Received: from localhost (g98.115-65-200.ppp.wakwak.ne.jp. [115.65.200.98])
 by smtp.gmail.com with ESMTPSA id y4sm24995676pfb.34.2021.03.03.05.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:50:36 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: Barebox <barebox@lists.infradead.org>
Date: Wed,  3 Mar 2021 22:50:22 +0900
Message-Id: <20210303135026.3450789-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 0/4] OpenRISC fixes and setjmp/longjmp work
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

SGVsbG8sCgpUaGVzZSBhcmUgdGhlIHBhdGNoZXMgSSBjYW1lIHVwIHdpdGggdG8gZ2V0IHRoZSBz
ZXRqbXAvbG9uZ2ptcCByb3V0aW5lcyB0byB3b3JrCm9uIE9wZW5SSVNDLiAgSXQgc2VlbXMgdG8g
YmUgd29ya2luZyB3ZWxsLgoKVGhlIHBhdGNoZXMgYXJlIG9uIGdpdGh1YiBoZXJlOgogIGh0dHBz
Oi8vZ2l0aHViLmNvbS9zdGZmcmRocm4vYmFyZWJveC90cmVlL29wZW5yaXNjLWJ0aHJlYWQKCkkg
aGFkIHRvIHJldmVydCBhIGNvbW1pdCB0byByZW1vdmUgb3BlbnJpc2MgdG8gZG8gdGhpcyB3b3Jr
LCBJIGhvcGUgdGhhdCBjYW4gYmUKcmV2ZXJ0ZWQuCgpUZXN0IG91dHB1dDoKCiAgICBiYXJlYm94
QG9yMWtzaW06LyBidGhyZWFkIC12CiAgICBidGhyZWFkX3ByaW50ZXIgeWllbGQgIzEKICAgIGJ0
aHJlYWRfcHJpbnRlciB5aWVsZCAjMgogICAgYnRocmVhZF9wcmludGVyIHlpZWxkICMzCiAgICBi
dGhyZWFkX3ByaW50ZXIgeWllbGQgIzQKICAgIDM2NDQxIGJ0aHJlYWQgeWllbGQgY2FsbHMgaW4g
MXMKICAgIGJhcmVib3hAb3Ixa3NpbTovIGJ0aHJlYWQgLXYKICAgIGJ0aHJlYWRfcHJpbnRlciB5
aWVsZCAjMQogICAgYnRocmVhZF9wcmludGVyIHlpZWxkICMyCiAgICBidGhyZWFkX3ByaW50ZXIg
eWllbGQgIzMKICAgIGJ0aHJlYWRfcHJpbnRlciB5aWVsZCAjNAogICAgMzY1MDQgYnRocmVhZCB5
aWVsZCBjYWxscyBpbiAxcwogICAgYmFyZWJveEBvcjFrc2ltOi8gYnRocmVhZAoKICAgIGJ0aHJl
YWQgLSBwcmludCBpbmZvIGFib3V0IHJlZ2lzdGVyZWQgYnRocmVhZHMKCiAgICBwcmludCBpbmZv
IGFib3V0IHJlZ2lzdGVyZWQgYmFyZWJveCB0aHJlYWRzCgogICAgT3B0aW9uczoKCSAgICAtaSAg
ICAgIFByaW50IGluZm9ybWF0aW9uIGFib3V0IHJlZ2lzdGVyZWQgYnRocmVhZHMKCSAgICAtdCAg
ICAgIG1lYXN1cmUgaG93IG1hbnkgYnRocmVhZHMgd2UgY3VycmVudGx5IHJ1biBpbiAxcwoJICAg
IC1jICAgICAgY291bnQgbWF4aW11bSBjb250ZXh0IHN3aXRjaGVzIGluIDFzCgkgICAgLXYgICAg
ICB2ZXJpZnkgY29ycmVjdCBidGhyZWFkIG9wZXJhdGlvbgoKICAgIGJhcmVib3hAb3Ixa3NpbTov
IGJ0aHJlYWQgLWMKICAgIGJ0aHJlYWQgLWMKICAgIDI2OTUzNiBidGhyZWFkIGNvbnRleHQgc3dp
dGNoZXMgcG9zc2libGUgaW4gMXMKClN0YWZmb3JkIEhvcm5lICg0KToKICBvcGVucmlzYzogVXNl
IG1vdmhpIHRvIHplcm8gcmVnaXN0ZXJzCiAgb3BlbnJpc2M6IEFkZCBnaXRpZ25vcmUgZm9yIGR0
YiBmaWxlcwogIG9wZW5yaXNjOiBBZGQgbGlua2FnZS5oCiAgb3BlbnJpc2M6IEltcGxlbWVudCBz
ZXRqbXAvbG9uZ2ptcC9pbml0am1wCgogYXJjaC9vcGVucmlzYy9LY29uZmlnICAgICAgICAgICAg
ICAgfCAgMSArCiBhcmNoL29wZW5yaXNjL2NwdS9zdGFydC5TICAgICAgICAgICB8ICA2ICsrLS0K
IGFyY2gvb3BlbnJpc2MvZHRzLy5naXRpZ25vcmUgICAgICAgIHwgIDEgKwogYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS9saW5rYWdlLmggfCAgNyArKysrCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUv
YXNtL3NldGptcC5oICB8IDE3ICsrKysrKysrKwogYXJjaC9vcGVucmlzYy9saWIvTWFrZWZpbGUg
ICAgICAgICAgfCAgMSArCiBhcmNoL29wZW5yaXNjL2xpYi9zZXRqbXAuUyAgICAgICAgICB8IDU2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5nZWQsIDg2IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlz
Yy9kdHMvLmdpdGlnbm9yZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vbGlua2FnZS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9zZXRqbXAuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvb3BlbnJpc2MvbGliL3NldGpt
cC5TCgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

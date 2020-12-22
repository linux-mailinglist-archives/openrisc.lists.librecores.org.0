Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5A12E0600
	for <lists+openrisc@lfdr.de>; Tue, 22 Dec 2020 07:18:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2334021079;
	Tue, 22 Dec 2020 07:18:18 +0100 (CET)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mail.librecores.org (Postfix) with ESMTPS id AE36120E7B
 for <openrisc@lists.librecores.org>; Tue, 22 Dec 2020 07:18:16 +0100 (CET)
Received: by mail-pj1-f44.google.com with SMTP id iq13so765319pjb.3
 for <openrisc@lists.librecores.org>; Mon, 21 Dec 2020 22:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkoDUqKrK9varFFokYUmOlkdQyjUoQaODT52KKjeRGs=;
 b=ZJb4h5oR883OgR0LJbi6evcaBdy413jnvRDXyTTTXe2cMTwgRidwOKw0hRw4BcIeyw
 5kfO5cuRZ/wO/h+Kzt0RgF1EQ2Uy1I2cgNa+ZJr+kfZxX6wCcPApDT2UkCMufR7YCbe3
 H4YSk0kqVo53dQ8UWqpWK5bBQH1t2daSTmSf9F2XrwZDt3m4eG0oOxPJdgnmzfw7TbYm
 rbXnERd2cHEQicpKU2wlHe+t1H19ocZtZZYGTmM3vNqwI696HYXZsD3XV4tiKCCOkiYs
 MxTx07EJInJ1yI88J6IAUD8P+HHZKDxF7cHVXrY5QX/qpTTx6C/wtc9/BYJYkkXmmLu/
 FhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kkoDUqKrK9varFFokYUmOlkdQyjUoQaODT52KKjeRGs=;
 b=M1gNdfWpygkG0VW9YAjYjjcYGIl9L/M5yuLXs3VpvW5T61+NavGScLnp6rxxz5ttPx
 XE8EC98hOIKH9Voc9Ots7JNGAPOqI319E1eflUhtwZjIeZZojAlv/cF54a0MEzQ+lTrk
 wnBVjsJSMCw1DZlZyS7rOd6YhPcCahTHmiI3lq69vJHwYBZh4UrKXmWX5TJaAERdutO4
 CzOsmxNVjARKgOHGutV9JBdckg2qUwx/Rs7l632iq2qILjwueAdSMsbMhYT4vOM963PL
 vbG7Lk8+G4WEXerSbpwooMc9LklAzBUrv14RmonzUYRju6XQaYSwLWDxVhD0m4+a5UTb
 uArg==
X-Gm-Message-State: AOAM531idbnsIcOPa+uvg2MOkFGQmJp+0IO4JwsLWcCmmeUpZ/tuDZj/
 mV97/ajPIGXj16oXIsuPE5Y=
X-Google-Smtp-Source: ABdhPJwY2UiPFjcTR0XQuvixWysoQI+qVtD6lCIe4Yl1ewkjGsDFcvxsx41CUqgK+GtJmTRXGcCsqg==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr20184767pjb.25.1608617894686; 
 Mon, 21 Dec 2020 22:18:14 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id a23sm17769794pjh.19.2020.12.21.22.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 22:18:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Tue, 22 Dec 2020 16:48:05 +1030
Message-Id: <20201222061805.462460-1-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH] openrisc: Add vmlinux.bin target
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
cy4KClNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+Ci0tLQogYXJj
aC9vcGVucmlzYy9NYWtlZmlsZSAgICAgIHwgNyArKysrKysrCiBhcmNoL29wZW5yaXNjL2Jvb3Qv
TWFrZWZpbGUgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2Jvb3QvTWFrZWZpbGUKCmRpZmYgLS1n
aXQgYS9hcmNoL29wZW5yaXNjL01ha2VmaWxlIGIvYXJjaC9vcGVucmlzYy9NYWtlZmlsZQppbmRl
eCBiZjEwMTQxYzc0MjYuLjIzOWJjYTJkMTkyNSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9N
YWtlZmlsZQorKysgYi9hcmNoL29wZW5yaXNjL01ha2VmaWxlCkBAIC0yNCw2ICsyNCwxMCBAQCBM
SUJHQ0MgCQk6PSAkKHNoZWxsICQoQ0MpICQoS0JVSUxEX0NGTEFHUykgLXByaW50LWxpYmdjYy1m
aWxlLW5hbWUpCiAKIEtCVUlMRF9DRkxBR1MJKz0gLXBpcGUgLWZmaXhlZC1yMTAgLURfX2xpbnV4
X18KIAorYWxsOiB2bWxpbnV4LmJpbgorCitib290IDo9IGFyY2gvJChBUkNIKS9ib290CisKIGlm
ZXEgKCQoQ09ORklHX09QRU5SSVNDX0hBVkVfSU5TVF9NVUwpLHkpCiAJS0JVSUxEX0NGTEFHUyAr
PSAkKGNhbGwgY2Mtb3B0aW9uLC1taGFyZC1tdWwpCiBlbHNlCkBAIC00OSwzICs1Myw2IEBAIGVs
c2UKIEJVSUxUSU5fRFRCIDo9IG4KIGVuZGlmCiBjb3JlLSQoQlVJTFRJTl9EVEIpICs9IGFyY2gv
b3BlbnJpc2MvYm9vdC9kdHMvCisKK3ZtbGludXguYmluOiB2bWxpbnV4CisJJChRKSQoTUFLRSkg
JChidWlsZCk9JChib290KSAkKHBhdHN1YnN0ICUsJChib290KS8lLCRAKQpkaWZmIC0tZ2l0IGEv
YXJjaC9vcGVucmlzYy9ib290L01ha2VmaWxlIGIvYXJjaC9vcGVucmlzYy9ib290L01ha2VmaWxl
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMGU3MWU4Zjc4YmIyCi0t
LSAvZGV2L251bGwKKysrIGIvYXJjaC9vcGVucmlzYy9ib290L01ha2VmaWxlCkBAIC0wLDAgKzEs
OCBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorIworIyBNYWtlZmlsZSBm
b3IgYm9vdGFibGUga2VybmVsIGltYWdlcworIworCitPQkpDT1BZRkxBR1Nfdm1saW51eC5iaW4g
Oj0gLU8gYmluYXJ5CiskKG9iaikvdm1saW51eC5iaW46IHZtbGludXggRk9SQ0UKKwkkKGNhbGwg
aWZfY2hhbmdlZCxvYmpjb3B5KQotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

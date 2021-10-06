Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8489A424308
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 65FEC241A4;
	Wed,  6 Oct 2021 18:43:49 +0200 (CEST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by mail.librecores.org (Postfix) with ESMTPS id 9D1042414C
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:47 +0200 (CEST)
Received: by mail-ot1-f42.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso3843634ota.8
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E46c5KotLBJJxu4fxLSa91xNqDqPq5a/10Op+mtdz/c=;
 b=TPUwQXyWGiARP2LBKn2WBO6MqvR8OuuP45xqM7/eaDSoeGyomY2Nnhv1ulIcwdR5Ko
 X/gOydkmYbiX92x4c7pn8W4qtTt3wB18YAre/6JI3WBRdIaJcn/PrKad7ObJPAWy5mLB
 h1j3LboZA3bV8gJEuLF7gMzZqFoFFs+iyM7ivEenb1S7qpy2hNsgbhMOg3hgSJ2vyZsc
 y6s0HaM7GBUA9MlhreOqacpUAri6AQY/vsvPqIpnYkPNKR1fWS5T4Ju3LJmORmrXnMsU
 OWhikuDxKLksqeB3haaM1vVr/fGBdOuRZIv2L9J1OvDx6hG3mlttjzQiBlXY0JONs/CJ
 UnyA==
X-Gm-Message-State: AOAM5322GN6aYgYnTjEzfFosHFMRSyt7eP7eaOhGEJceHHjp198qmZOV
 7waBlooscYZeKV1e6R3MEA==
X-Google-Smtp-Source: ABdhPJxehVSGYvZXtuNP7Z+wFAXu0A1JJQzA5MrGIRkKPVwBp+gSYiQNHX06q+RB97zQgpf/RwBd+A==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id
 y11mr20406228oti.291.1633538626550; 
 Wed, 06 Oct 2021 09:43:46 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  6 Oct 2021 11:43:26 -0500
Message-Id: <20211006164332.1981454-7-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzJyAncmVnJyBwcm9wZXJ0eSB3
aXRoCm9mX2dldF9jcHVfaHdpZCgpLgoKQ2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5z
ZT4KQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0
aS5maT4KQ2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpDYzogb3BlbnJpc2NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYyB8IDYgKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zbXAuYwpp
bmRleCA0MTVlMjA5NzMyYTMuLjdkNWE0ZjMwM2E1YSAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc21wLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKQEAgLTY1LDEx
ICs2NSw3IEBAIHZvaWQgX19pbml0IHNtcF9pbml0X2NwdXModm9pZCkKIAl1MzIgY3B1X2lkOwog
CiAJZm9yX2VhY2hfb2ZfY3B1X25vZGUoY3B1KSB7Ci0JCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihjcHUsICJyZWciLCAmY3B1X2lkKSkgewotCQkJcHJfd2FybigiJXMgbWlzc2luZyByZWcgcHJv
cGVydHkiLCBjcHUtPmZ1bGxfbmFtZSk7Ci0JCQljb250aW51ZTsKLQkJfQotCisJCWNwdV9pZCA9
IG9mX2dldF9jcHVfaHdpZChjcHUpOwogCQlpZiAoY3B1X2lkIDwgTlJfQ1BVUykKIAkJCXNldF9j
cHVfcG9zc2libGUoY3B1X2lkLCB0cnVlKTsKIAl9Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB7246094
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:45:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E363D20A40;
	Mon, 17 Aug 2020 10:45:39 +0200 (CEST)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by mail.librecores.org (Postfix) with ESMTPS id 5582A20C89
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 05:35:13 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id t15so10708471pjq.5
 for <openrisc@lists.librecores.org>; Mon, 27 Jul 2020 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BQ0N2+dVPSv9zBmIax9FhAdje7sgqYgmgfJjCmKnWDA=;
 b=k+SBQyBvHv6bYtnVcbgMDkBAdBoCa4QoKpfHqJZIUZHwOuBbYHrJ5U429c8n+pnJ63
 RNWj4/66GTWXp6cIn6XLevHJlBAdacCmMoHN0cjiNbFrDinmRfAV7IrasclMmxoMVADv
 vZNMdDUhbTKnym+mkaCi3X3ajYZ+Z6XsoYwYYhScZKQP8EJc/vzmG1JPZpkJI/LudB5a
 ZCiqCthWmmcTkhOkgX4u8eqlXZFATiL+RbR8o8SkovD7Oc3Lw2He6+A5iDrRFfqyoamA
 OvG+LSEzWGvRce0dbaH0Q8pWidkHj4Bpe6KVsTE1Xgie4OYjgLC4AgCA7s8NQTuvoNPM
 Um8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BQ0N2+dVPSv9zBmIax9FhAdje7sgqYgmgfJjCmKnWDA=;
 b=oiFtu78QhV973aEZdv4fdFNmw52YsrgXVyUWeMXAfvDrJxCJF44ZjMCFV1GVZ1BbpX
 EgS1lGm7XaCDMVIi1MoijhXoMSNHfs7+yHeFceiCBzmwQ9WbdeemX8NDO2i4FLjcCOH9
 gN3CG9Dz0097Pyxhf+DaX7MT7ftIcikS+BIOxhVFGT+hz8M//9JQd9HdSwd0ebtq9Oxy
 czRxVrQ44rm+QIr6Sf6nwOt7Ds3qZ8FzR7ysuDd4KWDJzo4BjwSXbFLhOItRsTCjzNUv
 5JqPtj2Nt/09/w24VY+x9kdzmIeT7U58bT3LdtWcHslzdLAW3LPGqBRaDpCw/jslIB6M
 eaaA==
X-Gm-Message-State: AOAM531ZiYBDREO4QbnNei5i4Fo6ghZ3uuOZa7mmg7tKSD1Go4P530pp
 1bwa6t4KIqmnU1tCP22Keu8=
X-Google-Smtp-Source: ABdhPJzv8QVNMwZpdBvbr0dCqJM80cgxLsujPUqdgNMJ/PsaZ7BgVojxi5BnmzceR6G1fj9/gDjU7g==
X-Received: by 2002:a17:902:7005:: with SMTP id
 y5mr19970202plk.342.1595907311445; 
 Mon, 27 Jul 2020 20:35:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id r4sm998707pji.37.2020.07.27.20.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 20:35:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Date: Tue, 28 Jul 2020 13:33:55 +1000
Message-Id: <20200728033405.78469-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200728033405.78469-1-npiggin@gmail.com>
References: <20200728033405.78469-1-npiggin@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 14/24] openrisc: use asm-generic/mmu_context.h
 for no-op implementations
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2M6IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KQ2M6IFN0ZWZhbiBLcmlzdGlhbnNz
b24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KQ2M6IFN0YWZmb3JkIEhvcm5l
IDxzaG9ybmVAZ21haWwuY29tPgpDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKU2ln
bmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4KLS0tCiBhcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCA4ICsrKy0tLS0tCiBhcmNoL29w
ZW5yaXNjL21tL3RsYi5jICAgICAgICAgICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5y
aXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L21tdV9jb250ZXh0LmgKaW5kZXggY2VkNTc3NTQyZTI5Li5hNjcwMjM4NGM3N2QgMTAwNjQ0Ci0t
LSBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAorKysgYi9hcmNoL29w
ZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmgKQEAgLTE3LDEzICsxNywxMyBAQAogCiAj
aW5jbHVkZSA8YXNtLWdlbmVyaWMvbW1faG9va3MuaD4KIAorI2RlZmluZSBpbml0X25ld19jb250
ZXh0IGluaXRfbmV3X2NvbnRleHQKIGV4dGVybiBpbnQgaW5pdF9uZXdfY29udGV4dChzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0pOworI2RlZmluZSBkZXN0cm95
X2NvbnRleHQgZGVzdHJveV9jb250ZXh0CiBleHRlcm4gdm9pZCBkZXN0cm95X2NvbnRleHQoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pOwogZXh0ZXJuIHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1
Y3QgKnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3QgKm5leHQsCiAJCSAgICAgIHN0cnVjdCB0YXNrX3N0
cnVjdCAqdHNrKTsKIAotI2RlZmluZSBkZWFjdGl2YXRlX21tKHRzaywgbW0pCWRvIHsgfSB3aGls
ZSAoMCkKLQogI2RlZmluZSBhY3RpdmF0ZV9tbShwcmV2LCBuZXh0KSBzd2l0Y2hfbW0oKHByZXYp
LCAobmV4dCksIE5VTEwpCiAKIC8qIGN1cnJlbnQgYWN0aXZlIHBnZCAtIHRoaXMgaXMgc2ltaWxh
ciB0byBvdGhlciBwcm9jZXNzb3JzIHBnZApAQCAtMzIsOCArMzIsNiBAQCBleHRlcm4gdm9pZCBz
d2l0Y2hfbW0oc3RydWN0IG1tX3N0cnVjdCAqcHJldiwgc3RydWN0IG1tX3N0cnVjdCAqbmV4dCwK
IAogZXh0ZXJuIHZvbGF0aWxlIHBnZF90ICpjdXJyZW50X3BnZFtdOyAvKiBkZWZpbmVkIGluIGFy
Y2gvb3BlbnJpc2MvbW0vZmF1bHQuYyAqLwogCi1zdGF0aWMgaW5saW5lIHZvaWQgZW50ZXJfbGF6
eV90bGIoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQotewot
fQorI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tdV9jb250ZXh0Lmg+CiAKICNlbmRpZgpkaWZmIC0t
Z2l0IGEvYXJjaC9vcGVucmlzYy9tbS90bGIuYyBiL2FyY2gvb3BlbnJpc2MvbW0vdGxiLmMKaW5k
ZXggNGI2ODBhZWQ4ZjVmLi44MjFhYWI0Y2YzYmUgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mv
bW0vdGxiLmMKKysrIGIvYXJjaC9vcGVucmlzYy9tbS90bGIuYwpAQCAtMTU5LDYgKzE1OSw3IEBA
IHZvaWQgc3dpdGNoX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKnByZXYsIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km5leHQsCiAgKiBpbnN0YW5jZS4KICAqLwogCisjZGVmaW5lIGluaXRfbmV3X2NvbnRleHQgaW5p
dF9uZXdfY29udGV4dAogaW50IGluaXRfbmV3X2NvbnRleHQoc3RydWN0IHRhc2tfc3RydWN0ICp0
c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogewogCW1tLT5jb250ZXh0ID0gTk9fQ09OVEVYVDsK
QEAgLTE3MCw2ICsxNzEsNyBAQCBpbnQgaW5pdF9uZXdfY29udGV4dChzdHJ1Y3QgdGFza19zdHJ1
Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAgKiBkcm9wcyBpdC4KICAqLwogCisjZGVm
aW5lIGRlc3Ryb3lfY29udGV4dCBkZXN0cm95X2NvbnRleHQKIHZvaWQgZGVzdHJveV9jb250ZXh0
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogewogCWZsdXNoX3RsYl9tbShtbSk7Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

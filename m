Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CE8A5267C8E
	for <lists+openrisc@lfdr.de>; Sat, 12 Sep 2020 23:22:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DB7A0205AD;
	Sat, 12 Sep 2020 23:22:09 +0200 (CEST)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 69A2420C44
 for <openrisc@lists.librecores.org>; Tue,  1 Sep 2020 16:16:45 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id u128so861218pfb.6
 for <openrisc@lists.librecores.org>; Tue, 01 Sep 2020 07:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vzoL+VsrIPHuqh1rtEB2SuTababb460vueko2jTOo4=;
 b=XxxGJfPETQ7BZiIuZPtIZTdbh7ieNNvvgRcIjzPetj4CA6WlA6eQmTamnSI4ThlLOp
 I7Bwm5vBwBcLIzkRWQszNO5+mqimneWWmxfugSbuIDaZBS1IFgcKiHHRPoGqQ9F0f1Co
 EtKxeYYXyyTeeVAotBk5cJhyUZaR4+HBsL5QEX1us7JCul4yTuZkY6ldhldS6dO979lI
 6GMBbSl5F4bzmlOnmQPmXLMDigRNfA8+tv59CLpLU2rwgaSkfRh0VzP3KXE3IfkGNyw9
 zEyx5WAdD5EPiTaL9zeyWyu9rVYM327qiAvJMWhWZCNi3jRtlhh4RqwMP6Y+qcdURY6h
 n5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vzoL+VsrIPHuqh1rtEB2SuTababb460vueko2jTOo4=;
 b=YBhEHZapJPKqwq41heHhEtIIgm/ZExKud+uf12SypLIyhUTUuDPFwP9TfAXkWPnjWv
 9evpPurWNJRPxDxO1DbSLGjZN1u9oA+o0Ut2pq5p9Fkp8xQsYd0SmVug/aycahO1uUP6
 Tw8BfRYJtT/8Zux31fcrMHVu/CdMuqriV5cTzRkJmAojKRCZDvY0KVonXq2teGF34jz+
 IfWe+FQ9OJgaZ9xBigFP4b2ac2pz42u4xZ5kHANlr8y4202sPd//RRLBWX8i4qGaltOn
 oSMQw0DV11fhjwpYMLupc1VEBvJ2rx3F8ZZMk7WAZts4cul8X7T8IBf3ec5CYsw67TiL
 uLCA==
X-Gm-Message-State: AOAM533fvgiOLOqj+Yuj7TOIjcXtuUjPrb/Sj2dNrJFq01mohlD3HvZo
 yiiwwAbn/0Cnq4c8STdbq5U=
X-Google-Smtp-Source: ABdhPJxhdXGBFtIiSfY5hgzmizcaBGI6SG79Dre9MXBlOMApIf1kkDG0o9XLXTCLh5Pm5ekdjZE4cg==
X-Received: by 2002:a65:5689:: with SMTP id v9mr1729375pgs.271.1598969802057; 
 Tue, 01 Sep 2020 07:16:42 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id w9sm2212816pgg.76.2020.09.01.07.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 07:16:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Date: Wed,  2 Sep 2020 00:15:30 +1000
Message-Id: <20200901141539.1757549-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901141539.1757549-1-npiggin@gmail.com>
References: <20200901141539.1757549-1-npiggin@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 12 Sep 2020 23:22:07 +0200
Subject: [OpenRISC] [PATCH v3 14/23] openrisc: use asm-generic/mmu_context.h
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
bmVkLW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4KLS0tCgpQbGVh
c2UgYWNrIG9yIG5hY2sgaWYgeW91IG9iamVjdCB0byB0aGlzIGJlaW5nIG1lcmVkIHZpYQpBcm5k
J3MgdHJlZS4KCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCA4ICsr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaCBiL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAppbmRleCBjZWQ1Nzc1NDJlMjku
LmE2NzAyMzg0Yzc3ZCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9tbXVf
Y29udGV4dC5oCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaApA
QCAtMTcsMTMgKzE3LDEzIEBACiAKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9tbV9ob29rcy5oPgog
CisjZGVmaW5lIGluaXRfbmV3X2NvbnRleHQgaW5pdF9uZXdfY29udGV4dAogZXh0ZXJuIGludCBp
bml0X25ld19jb250ZXh0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0
ICptbSk7CisjZGVmaW5lIGRlc3Ryb3lfY29udGV4dCBkZXN0cm95X2NvbnRleHQKIGV4dGVybiB2
b2lkIGRlc3Ryb3lfY29udGV4dChzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiBleHRlcm4gdm9pZCBz
d2l0Y2hfbW0oc3RydWN0IG1tX3N0cnVjdCAqcHJldiwgc3RydWN0IG1tX3N0cnVjdCAqbmV4dCwK
IAkJICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICp0c2spOwogCi0jZGVmaW5lIGRlYWN0aXZhdGVf
bW0odHNrLCBtbSkJZG8geyB9IHdoaWxlICgwKQotCiAjZGVmaW5lIGFjdGl2YXRlX21tKHByZXYs
IG5leHQpIHN3aXRjaF9tbSgocHJldiksIChuZXh0KSwgTlVMTCkKIAogLyogY3VycmVudCBhY3Rp
dmUgcGdkIC0gdGhpcyBpcyBzaW1pbGFyIHRvIG90aGVyIHByb2Nlc3NvcnMgcGdkCkBAIC0zMiw4
ICszMiw2IEBAIGV4dGVybiB2b2lkIHN3aXRjaF9tbShzdHJ1Y3QgbW1fc3RydWN0ICpwcmV2LCBz
dHJ1Y3QgbW1fc3RydWN0ICpuZXh0LAogCiBleHRlcm4gdm9sYXRpbGUgcGdkX3QgKmN1cnJlbnRf
cGdkW107IC8qIGRlZmluZWQgaW4gYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICovCiAKLXN0YXRp
YyBpbmxpbmUgdm9pZCBlbnRlcl9sYXp5X3RsYihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0
IHRhc2tfc3RydWN0ICp0c2spCi17Ci19CisjaW5jbHVkZSA8YXNtLWdlbmVyaWMvbW11X2NvbnRl
eHQuaD4KIAogI2VuZGlmCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7C957255765
	for <lists+openrisc@lfdr.de>; Fri, 28 Aug 2020 11:18:04 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 551C620AF7;
	Fri, 28 Aug 2020 11:18:03 +0200 (CEST)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by mail.librecores.org (Postfix) with ESMTPS id 6DDA9202F8
 for <openrisc@lists.librecores.org>; Wed, 26 Aug 2020 16:53:51 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id ds1so1004528pjb.1
 for <openrisc@lists.librecores.org>; Wed, 26 Aug 2020 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TcbxX+lW5qgeFyGHy3Sgew1O8jaIFOQUWGSD9fmh4Ds=;
 b=q6an9A4xnvWqk3kD2Ahthf2EBYHipvLOJq8gjmXpTdU04Nb3S0hQP/tdZJTVPB7Joq
 XC8ygVnKRZGdRLkl49eU+TNhLdVAdDiyLUgS6CwO0WwOWKgFRtDvkpYeg4/QTuxVVxMR
 VONWRTlBOJd+PhC/tDxD26+EDSkLdSTR4HxFZzt8wfkhxZ7wdbW2ZmbBlq4BlH8CT5ud
 v/9wvVpl7dYLBm6CK6vdLN6Ino1ljMHl3uUsqcdG/mukXHoW9fcHwjQn1+m4sm8eiesc
 xBr/J/RV0sgRv/bTpbQXVo3EXoECA/odOegWY8UDepBWkdlD1HoKruo+lyujzOPtRV/j
 4hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TcbxX+lW5qgeFyGHy3Sgew1O8jaIFOQUWGSD9fmh4Ds=;
 b=gQxKIyt3Z/YUomwEmXhMR9aQGUjJvWdK2mQraryQmg4M08aC5Qofn4Iom4gZSvf5Xz
 iGTQigJkHAwJZMNwqXDTrB3tf0+7aDDR96K4j3e4fK7sfjQRwgp3+PgFhcflVnOviqtt
 Q7rBTLl9e5FQwWDYMB2+KIYVkWqT8K9pLVDXgtpAEtDgsN35r6RnpcOWwy7telaZ1HIG
 Sq6u2MRXh76S0f1HlPB/tF6vNuDUf/hvur3yxHXL+Gyb5fmDWR0Zi6dq4qpL1jejUaSd
 aD/K7BUntT2sFL0ikqxrCdjl/iaa0+J0YLFOPRSbaXN+OqIfnMAJm+2+mgF1h4J0+rEo
 /MCw==
X-Gm-Message-State: AOAM531rtD552OFbIZ5F7kD/BnG/JYEPHNCzAxS1E/aYZthri5BYLavj
 DqiqS0wO44KVYzziiZMwSGE=
X-Google-Smtp-Source: ABdhPJzN+aMSyEY8aUnGBKztdrqgQqKNljAox7LWDC4FKdqEOI7IHNbzRh50th/9lmPgjJlxGrT0sA==
X-Received: by 2002:a17:90a:5298:: with SMTP id
 w24mr6075538pjh.221.1598453629825; 
 Wed, 26 Aug 2020 07:53:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id r7sm3327140pfl.186.2020.08.26.07.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 07:53:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-arch@vger.kernel.org
Date: Thu, 27 Aug 2020 00:52:40 +1000
Message-Id: <20200826145249.745432-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200826145249.745432-1-npiggin@gmail.com>
References: <20200826145249.745432-1-npiggin@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Aug 2020 11:18:01 +0200
Subject: [OpenRISC] [PATCH v2 14/23] openrisc: use asm-generic/mmu_context.h
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
L29wZW5yaXNjL2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCA4ICsrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaCBiL2FyY2gvb3BlbnJpc2MvaW5j
bHVkZS9hc20vbW11X2NvbnRleHQuaAppbmRleCBjZWQ1Nzc1NDJlMjkuLmE2NzAyMzg0Yzc3ZCAx
MDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oCisrKyBi
L2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaApAQCAtMTcsMTMgKzE3LDEz
IEBACiAKICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9tbV9ob29rcy5oPgogCisjZGVmaW5lIGluaXRf
bmV3X2NvbnRleHQgaW5pdF9uZXdfY29udGV4dAogZXh0ZXJuIGludCBpbml0X25ld19jb250ZXh0
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CisjZGVmaW5l
IGRlc3Ryb3lfY29udGV4dCBkZXN0cm95X2NvbnRleHQKIGV4dGVybiB2b2lkIGRlc3Ryb3lfY29u
dGV4dChzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiBleHRlcm4gdm9pZCBzd2l0Y2hfbW0oc3RydWN0
IG1tX3N0cnVjdCAqcHJldiwgc3RydWN0IG1tX3N0cnVjdCAqbmV4dCwKIAkJICAgICAgc3RydWN0
IHRhc2tfc3RydWN0ICp0c2spOwogCi0jZGVmaW5lIGRlYWN0aXZhdGVfbW0odHNrLCBtbSkJZG8g
eyB9IHdoaWxlICgwKQotCiAjZGVmaW5lIGFjdGl2YXRlX21tKHByZXYsIG5leHQpIHN3aXRjaF9t
bSgocHJldiksIChuZXh0KSwgTlVMTCkKIAogLyogY3VycmVudCBhY3RpdmUgcGdkIC0gdGhpcyBp
cyBzaW1pbGFyIHRvIG90aGVyIHByb2Nlc3NvcnMgcGdkCkBAIC0zMiw4ICszMiw2IEBAIGV4dGVy
biB2b2lkIHN3aXRjaF9tbShzdHJ1Y3QgbW1fc3RydWN0ICpwcmV2LCBzdHJ1Y3QgbW1fc3RydWN0
ICpuZXh0LAogCiBleHRlcm4gdm9sYXRpbGUgcGdkX3QgKmN1cnJlbnRfcGdkW107IC8qIGRlZmlu
ZWQgaW4gYXJjaC9vcGVucmlzYy9tbS9mYXVsdC5jICovCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBl
bnRlcl9sYXp5X3RsYihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0IHRhc2tfc3RydWN0ICp0
c2spCi17Ci19CisjaW5jbHVkZSA8YXNtLWdlbmVyaWMvbW11X2NvbnRleHQuaD4KIAogI2VuZGlm
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

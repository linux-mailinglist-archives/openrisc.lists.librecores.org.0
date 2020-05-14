Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C88C41D3F78
	for <lists+openrisc@lfdr.de>; Thu, 14 May 2020 23:00:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B5B4520AD9;
	Thu, 14 May 2020 23:00:47 +0200 (CEST)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id BE35F20937
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 23:00:45 +0200 (CEST)
Received: by mail-pg1-f194.google.com with SMTP id f4so1783493pgi.10
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 14:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OEm/5SsC5ThfI2iO+se6q9fsU1qhPDFIdGXQk5ZLfVw=;
 b=OEICDGa/5SSTXYnOzimW9MPBfDmmmaJWogN+IY4y7O0IsrbjbJ8hObVDNa+8qxdvVK
 tQgWX31pjRzYtMBz6QufGobozbhPExr1am7cgQMTTqjMYwTY+wYCw4OVMQBuujdFqopp
 bBbm9/xI8xKT9qkb4lr0aK74IX6KfX5RhSP51IGA3c3aOyJYVyN49q/TRioPRf4EHbDA
 37XYBW+Q6FV6voaG31/4XEnrWbDzoZFQvW4p8pjNkPKAOlV2n6UHgdfgZOophk4zS41q
 8L1diiztsHAOSnMiVNOlJ47OSRKEBUno1lp+Z5te63WsUVU2AghxygaJ2EJBtUZLkj7I
 sBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OEm/5SsC5ThfI2iO+se6q9fsU1qhPDFIdGXQk5ZLfVw=;
 b=Z4+vhfABxQfC8qbAvI1E+Y9rQmqNBJuTLLsAzy3Z/N4vkaJCBMViBvDiXtcf/BiIqi
 zIHQrwh5xwYmoGYgwUlKYucooBgRe4jOPgz4glkhms8t1Fzw7YDB7NHYwsJ42RtIIT3c
 1NOT2mky/ZyRv7icogRNSUGMexKSGBv7jElcHfEs7dVwmZoMEPy9GJNgECgkOlmjy89s
 OY5Zx5qNno2pppTnFxprVXlnZtiSOCv/Jo8lgvOOsZXxDeRp37qMCupuZU84XAxNHw4k
 4F7frA0mPHY3sTX4CyCllfstAD0/rHDG2h5WGUDeV44etfXuUXxScCZzcyt3T1Kb6mCt
 JJ4Q==
X-Gm-Message-State: AOAM530ATHeJPQjTAJ51qTI8uTMHUJnwq0pL+5KUnWFeDAB17Bpk35hc
 he+niUxn4UK5bZdh+oy4+Vk=
X-Google-Smtp-Source: ABdhPJwhaAOrPU7kFcKZKztC9OifvdhcK75++NT6El5lbOUf8H7+Uq4pIRm9N118mn5uiBurMJTyTA==
X-Received: by 2002:a62:35c1:: with SMTP id c184mr422351pfa.120.1589490044385; 
 Thu, 14 May 2020 14:00:44 -0700 (PDT)
Received: from localhost (g216.222-224-245.ppp.wakwak.ne.jp. [222.224.245.216])
 by smtp.gmail.com with ESMTPSA id q16sm95958pgm.91.2020.05.14.14.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:00:43 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GNU Binutils <binutils@sourceware.org>
Date: Fri, 15 May 2020 06:00:14 +0900
Message-Id: <20200514210018.2749462-5-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514210018.2749462-1-shorne@gmail.com>
References: <20200514210018.2749462-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 4/8] or1k: Fix issue with multiple PCREL
 relocations
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

V2hlbiBhIHN5bWJvbCBoYXMgbXVsdGlwbGUgUENSRUwgYWNjZXNzZXMgdGhlIGZpcnN0IGFjY2Vz
cyByZWxvY2F0aW9uCndpbGwgYmUgcHJvcGVybHkgY2FsY3VsYXRlZCBidXQgc3Vic2VxdWVudCBv
bmVzIHdlcmUgbm90IHBlcmZvcm1pbmcgdGhlClBDUkVMIGNhbGN1bGF0aW9uLgoKYmZkL0NoYW5n
ZUxvZzoKCnl5eXktbW0tZGQgIFN0YWZmb3JkIEhvcm5lICA8c2hvcm5lQGdtYWlsLmNvbT4KCgkq
IGJmZC9lbGYzMi1vcjFrLmMgKG9yMWtfZWxmX3JlbG9jYXRlX3NlY3Rpb24pOiBGaXh1cCBQQ1JF
TCByZWxvY2F0aW9uCgljYWxjdWxhdGlvbi4KLS0tCiBiZmQvZWxmMzItb3Ixay5jIHwgMTMgKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYmZkL2VsZjMyLW9yMWsuYyBiL2JmZC9lbGYzMi1vcjFrLmMKaW5k
ZXggYWNmZGI1YmVmMi4uZWVlNDE4YzU1OCAxMDA2NDQKLS0tIGEvYmZkL2VsZjMyLW9yMWsuYwor
KysgYi9iZmQvZWxmMzItb3Ixay5jCkBAIC0xNjM5LDkgKzE2MzksMTggQEAgb3Ixa19lbGZfcmVs
b2NhdGVfc2VjdGlvbiAoYmZkICpvdXRwdXRfYmZkLAogCSAgICAgIH0KIAogCSAgICAvKiBPbmx5
IHByb2Nlc3MgdGhlIHJlbG9jYXRpb24gb25jZS4gICovCi0JICAgIGlmIChnb3RvZmYgJiAxKQor
CSAgICBpZiAoKGdvdG9mZiAmIDEpICE9IDApCiAJICAgICAgewotCQlyZWxvY2F0aW9uID0gc2dv
dC0+b3V0cHV0X29mZnNldCArIChnb3RvZmYgICYgfjMpOworCQlnb3RvZmYgKz0gb3Ixa19pbml0
aWFsX2V4ZWNfb2Zmc2V0IChob3d0bywgdGxzX3R5cGUpOworCisJCS8qIFRoZSBQRzIxIGFuZCBM
TzEzIHJlbG9jcyBhcmUgcGMtcmVsYXRpdmUsIHdoaWxlIHRoZQorCQkgICByZXN0IGFyZSBHT1Qg
cmVsYXRpdmUuICAqLworCQlyZWxvY2F0aW9uID0gZ290X2Jhc2UgKyAoZ290b2ZmICYgfjMpOwor
CQlpZiAoIShyX3R5cGUgPT0gUl9PUjFLX1RMU19HRF9QRzIxCisJCSAgICB8fCByX3R5cGUgPT0g
Ul9PUjFLX1RMU19HRF9MTzEzCisJCSAgICB8fCByX3R5cGUgPT0gUl9PUjFLX1RMU19JRV9QRzIx
CisJCSAgICB8fCByX3R5cGUgPT0gUl9PUjFLX1RMU19JRV9MTzEzKSkKKwkJICByZWxvY2F0aW9u
IC09IGdvdF9zeW1fdmFsdWU7CiAJCWJyZWFrOwogCSAgICAgIH0KIAotLSAKMi4yNi4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

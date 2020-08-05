Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E523723D367
	for <lists+openrisc@lfdr.de>; Wed,  5 Aug 2020 23:07:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C852F20DB1;
	Wed,  5 Aug 2020 23:07:54 +0200 (CEST)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by mail.librecores.org (Postfix) with ESMTPS id 7BBF420DAE
 for <openrisc@lists.librecores.org>; Wed,  5 Aug 2020 23:07:53 +0200 (CEST)
Received: by mail-pj1-f65.google.com with SMTP id mw10so1511401pjb.2
 for <openrisc@lists.librecores.org>; Wed, 05 Aug 2020 14:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FQQh9grVE9WmqeYXdehIdQwW9U/dAMb893sRAt75ZM=;
 b=Xp/XrIDuVUyJT5+h+fRWdH5AGHClQV7LL1pHflyIiX8/g2oGRbaiwj44x+auCBuIqW
 F1xntosLaa0foveAwMoJm41zcfdOWJ6QH9H+98AWkjkB68iNHiQIF2DVNiUOiahyUHto
 EbxIOaGuaKyZF7mgvzR4afLhNSOyzQRhiyS2ulRKQtM617jIAT8t+oc5Q8Ia0MEO3HHM
 h3kMcYxnqcXdSfnFCU3WRfVvpt9dMW5Qur2O9sLIjtcd+5t7kAqh3UZsF7MSl9i2Fhle
 alPzl0llmRhxNspuyVpOpnfRC5axu3UolPonDCRgnP/EcbnOwwYgFLKvEp30LVehnyUe
 +zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FQQh9grVE9WmqeYXdehIdQwW9U/dAMb893sRAt75ZM=;
 b=f26bobLJ/YuV29MyEdospI2TjrS1IiPMU12sqygrF0p8b6Nb18KkwvEuVwZo/CJjDU
 daPfR92tnKU/tEYYaYp8HdTehqA4CSF/FM92mbRuZA2ZyDQlwC3HpBiRoyhsGcz5extp
 GMBxJrOOEpynerpX9V2JS8ToOsbRVIA6Rmdrrx2i5XGsBV1fIvU6ribjbSnYXfj73B7/
 /sz8d/ZSF7f7hZYROWv/1Ye04SnvSjxHDCiyNcJBbCVJ0mS6yfcSltziLgCwHVjmjLBR
 F7yjCU6IMBDJmbzz6uuyt6CtIWcoYDKyz2mTYeDEWfMc+F/4oc7Zkx+MihcrGJzWTFva
 pqcg==
X-Gm-Message-State: AOAM530/pEVddnYKbMHLe2qHK49S7yDVn+VSXmwh002mftSXV9Lp+jca
 L9WBkbVMQwBTlZ9mb1aJq4M=
X-Google-Smtp-Source: ABdhPJzRiGMTYMevkiMEA0rjmyQMTuKQcrG6ioSC88DSO2hfVm9V39SQ0lntBlhFGO9QVpuFTu5Ygw==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr4959522plz.9.1596661672016; 
 Wed, 05 Aug 2020 14:07:52 -0700 (PDT)
Received: from localhost (g223.115-65-55.ppp.wakwak.ne.jp. [115.65.55.223])
 by smtp.gmail.com with ESMTPSA id s61sm4270907pjb.57.2020.08.05.14.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 14:07:50 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Thu,  6 Aug 2020 06:07:22 +0900
Message-Id: <20200805210725.310301-4-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805210725.310301-1-shorne@gmail.com>
References: <20200805210725.310301-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 3/6] openrisc: uaccess: Use static inline
 function in access_ok
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
Cc: Jonas Bonn <jonas@southpole.se>, openrisc@lists.librecores.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXMgc3VnZ2VzdGVkIGJ5IExpbnVzIHdoZW4gcmV2aWV3aW5nIGNvbW1pdCA5Y2IyZmViNGQyMWQK
KCJhcmNoL29wZW5yaXNjOiBGaXggaXNzdWVzIHdpdGggYWNjZXNzX29rKCkiKSBsYXN0IHllYXI7
IG1ha2luZwpfX3JhbmdlX29rIGFuIGlubGluZSBmdW5jdGlvbiBhbHNvIGZpeGVzIHRoZSB1c2Vk
IHR3aWNlIGlzc3VlIHRoYXQgdGhlCmNvbW1pdCB3YXMgZml4aW5nLiAgSSBhZ3JlZSBpdCdzIGEg
Z29vZCBjbGVhbnVwLiAgVGhpcyBwYXRjaCBhZGRyZXNzZXMKdGhhdCBhcyBJIGFtIGN1cnJlbnRs
eSB3b3JraW5nIG9uIHRoZSBhY2Nlc3Nfb2sgbWFjcm8gdG8gZml4dXAgc3BhcnNlCmFubm90YXRp
b25zIGluIE9wZW5SSVNDLgoKU3VnZ2VzdGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNA
bGludXgtZm91bmRhdGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9y
bmVAZ21haWwuY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwg
MTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgg
Yi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAppbmRleCBmMmZjNWM0Yjg4YzMu
LjRiNTlkYzlhZDMwMCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNj
ZXNzLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTQ4LDE2
ICs0OCwxOSBAQAogLyogRW5zdXJlIHRoYXQgdGhlIHJhbmdlIGZyb20gYWRkciB0byBhZGRyK3Np
emUgaXMgYWxsIHdpdGhpbiB0aGUgcHJvY2VzcycKICAqIGFkZHJlc3Mgc3BhY2UKICAqLwotI2Rl
ZmluZSBfX3JhbmdlX29rKGFkZHIsIHNpemUpIChzaXplIDw9IGdldF9mcygpICYmIGFkZHIgPD0g
KGdldF9mcygpLXNpemUpKQorc3RhdGljIGlubGluZSBpbnQgX19yYW5nZV9vayh1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKK3sKKwljb25zdCBtbV9zZWdtZW50X3QgZnMg
PSBnZXRfZnMoKTsKKworCXJldHVybiBzaXplIDw9IGZzICYmIGFkZHIgPD0gKGZzIC0gc2l6ZSk7
Cit9CiAKIC8qIEVuc3VyZSB0aGF0IGFkZHIgaXMgYmVsb3cgdGFzaydzIGFkZHJfbGltaXQgKi8K
ICNkZWZpbmUgX19hZGRyX29rKGFkZHIpICgodW5zaWduZWQgbG9uZykgYWRkciA8IGdldF9mcygp
KQogCiAjZGVmaW5lIGFjY2Vzc19vayhhZGRyLCBzaXplKQkJCQkJCVwKICh7IAkJCQkJCQkJCVwK
LQl1bnNpZ25lZCBsb25nIF9fYW9fYWRkciA9ICh1bnNpZ25lZCBsb25nKShhZGRyKTsJCVwKLQl1
bnNpZ25lZCBsb25nIF9fYW9fc2l6ZSA9ICh1bnNpZ25lZCBsb25nKShzaXplKTsJCVwKLQlfX3Jh
bmdlX29rKF9fYW9fYWRkciwgX19hb19zaXplKTsJCQkJXAorCV9fcmFuZ2Vfb2soKHVuc2lnbmVk
IGxvbmcpKGFkZHIpLCAoc2l6ZSkpOwkJCVwKIH0pCiAKIC8qCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C55211FECC3
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8689520AAC;
	Thu, 18 Jun 2020 09:47:22 +0200 (CEST)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id A927620C67
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 11:03:32 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id k6so621052pll.9
 for <openrisc@lists.librecores.org>; Wed, 17 Jun 2020 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8uusENFHgtRiLU833qE274616Po1yGCg5u4oskG+Pc=;
 b=BJezgYXOSuWVS6fopqT6ic6EXVlT4CnCbhywI6aSA+lD5URJTr9n4660kaqw0qb8RL
 N5Ia+vAa6op1xONrEv+0OQ8cJX2cxKWf4YeQOpo27ZqoXvVmeakNsAQoXHYK6BAHUIhi
 ONf1+fdHrU5zC2GOeLgQl5AOiYtpnJa78Agz7K5VkGstFCBObC4xOeiifszZCN7/lqBy
 PsG2LGaNdh2kaYWigLmATnheEjRzkan8JKA/NLGPJLDMoMuqn79v387mGkWbPabO0qwi
 qnF9pI0/PkOM0kM05ioKKhthnLRsnQzhqhHmDiyaC/K1UEFCUbhXJBlh8EW2S5NCGjtt
 r54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O8uusENFHgtRiLU833qE274616Po1yGCg5u4oskG+Pc=;
 b=aei1wUEKcz5AogWp7Qb5Qq3iDgw2jqvwjRxhaDN2xpc4uLLPj/idkvJUaiKCKs5FYu
 Pt2lqnl+X5RX2l2naZSfxRuzZeMM/omRU50qd+uk/+f4aNRGLTU3i9fq4W28dpQmc7rS
 EglZ6JUNDhc7zHhF/W53/owlW29Fh9x3VWrX8Oxv3W5cAHGsUzEC4ZXTQWqcXJ6PgdQ3
 F4TGycOov1zPyg41pNA1vWynOwFhz9WNwVEKzlI7qAE+z2B8xTYEnpoDGnJcFzstqq8J
 Eq9Q3ySezVrrbgio2NotYt6xrvIbK+Dj5iPJaRH3zlsthIo9XJtkF7szupDItKwctlQC
 zVTQ==
X-Gm-Message-State: AOAM533ZdiBOLC0Sae5m1eyQAwnEXvTz09Fc17Z5LG748kE8WhKj4q0y
 weD+KoITGbVGiwJkPbX/zyA=
X-Google-Smtp-Source: ABdhPJyWwTn9mkKYeHt3moriBB1llX8dynovBjZ9NI5N5zPBLZzrO3Bqsz0HOtk1lgZ8FwyRE07RHg==
X-Received: by 2002:a17:902:8c84:: with SMTP id
 t4mr5681414plo.315.1592384610948; 
 Wed, 17 Jun 2020 02:03:30 -0700 (PDT)
Received: from localhost (g228.115-65-196.ppp.wakwak.ne.jp. [115.65.196.228])
 by smtp.gmail.com with ESMTPSA id
 b5sm19768965pfg.191.2020.06.17.02.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 02:03:29 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Date: Wed, 17 Jun 2020 18:02:46 +0900
Message-Id: <20200617090247.1680188-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: [OpenRISC] [PATCH] openrisc: Fix boot oops when DEBUG_VM is enabled
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
Cc: Jonas Bonn <jonas@southpole.se>, Thomas Hellstrom <thellstrom@vmware.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 Steven Price <steven.price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 openrisc@lists.librecores.org, Michel Lespinasse <walken@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

U2luY2UgdjUuOC1yYzEgT3BlblJJU0MgTGludXggZmFpbHMgdG8gYm9vdCB3aGVuIERFQlVHX1ZN
IGlzIGVuYWJsZWQuClRoaXMgaGFzIGJlZW4gYmlzZWN0ZWQgdG8gY29tbWl0IDQyZmM1NDE0MDRm
MiAoIm1tYXAgbG9ja2luZyBBUEk6IGFkZAptbWFwX2Fzc2VydF9sb2NrZWQoKSBhbmQgbW1hcF9h
c3NlcnRfd3JpdGVfbG9ja2VkKCkiKS4KClRoZSBhZGRlZCBsb2NraW5nIGNoZWNrcyBleHBvc2Vk
IHRoZSBpc3N1ZSB0aGF0IE9wZW5SSVNDIHdhcyBub3QgdGFraW5nCnRoaXMgbW1hcCBsb2NrIHdo
ZW4gZHVyaW5nIHBhZ2Ugd2Fsa3MgZm9yIERNQSBvcGVyYXRpb25zLiAgVGhpcyBwYXRjaApsb2Nr
cyBhbmQgdW5sb2NrcyB0aGUgbW1hcCBsb2NrIGZvciBwYWdlIHdhbGtpbmcuCgpGaXhlczogNDJm
YzU0MTQwNGYyICgibW1hcCBsb2NraW5nIEFQSTogYWRkIG1tYXBfYXNzZXJ0X2xvY2tlZCgpIGFu
ZCBtbWFwX2Fzc2VydF93cml0ZV9sb2NrZWQoKSIKQ2M6IE1pY2hlbCBMZXNwaW5hc3NlIDx3YWxr
ZW5AZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFp
bC5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMgfCA1ICsrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvZG1hLmMgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9kbWEuYwppbmRleCBjMTUyYTY4ODExZGQu
LjM0NTcyNzYzOGQ1MiAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMKKysr
IGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvZG1hLmMKQEAgLTc0LDggKzc0LDExIEBAIHZvaWQgKmFy
Y2hfZG1hX3NldF91bmNhY2hlZCh2b2lkICpjcHVfYWRkciwgc2l6ZV90IHNpemUpCiAJICogV2Ug
bmVlZCB0byBpdGVyYXRlIHRocm91Z2ggdGhlIHBhZ2VzLCBjbGVhcmluZyB0aGUgZGNhY2hlIGZv
cgogCSAqIHRoZW0gYW5kIHNldHRpbmcgdGhlIGNhY2hlLWluaGliaXQgYml0LgogCSAqLworCW1t
YXBfcmVhZF9sb2NrKCZpbml0X21tKTsKIAllcnJvciA9IHdhbGtfcGFnZV9yYW5nZSgmaW5pdF9t
bSwgdmEsIHZhICsgc2l6ZSwgJnNldF9ub2NhY2hlX3dhbGtfb3BzLAogCQkJTlVMTCk7CisJbW1h
cF9yZWFkX3VubG9jaygmaW5pdF9tbSk7CisKIAlpZiAoZXJyb3IpCiAJCXJldHVybiBFUlJfUFRS
KGVycm9yKTsKIAlyZXR1cm4gY3B1X2FkZHI7CkBAIC04NSw5ICs4OCwxMSBAQCB2b2lkIGFyY2hf
ZG1hX2NsZWFyX3VuY2FjaGVkKHZvaWQgKmNwdV9hZGRyLCBzaXplX3Qgc2l6ZSkKIHsKIAl1bnNp
Z25lZCBsb25nIHZhID0gKHVuc2lnbmVkIGxvbmcpY3B1X2FkZHI7CiAKKwltbWFwX3JlYWRfbG9j
aygmaW5pdF9tbSk7CiAJLyogd2Fsa19wYWdlX3JhbmdlIHNob3VsZG4ndCBiZSBhYmxlIHRvIGZh
aWwgaGVyZSAqLwogCVdBUk5fT04od2Fsa19wYWdlX3JhbmdlKCZpbml0X21tLCB2YSwgdmEgKyBz
aXplLAogCQkJJmNsZWFyX25vY2FjaGVfd2Fsa19vcHMsIE5VTEwpKTsKKwltbWFwX3JlYWRfdW5s
b2NrKCZpbml0X21tKTsKIH0KIAogdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UocGh5c19h
ZGRyX3QgYWRkciwgc2l6ZV90IHNpemUsCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

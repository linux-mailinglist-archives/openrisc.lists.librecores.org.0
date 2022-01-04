Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DD9AF483AD7
	for <lists+openrisc@lfdr.de>; Tue,  4 Jan 2022 04:14:24 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C2C6E24325;
	Tue,  4 Jan 2022 04:14:24 +0100 (CET)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mail.librecores.org (Postfix) with ESMTPS id 9D9CF24326
 for <openrisc@lists.librecores.org>; Tue,  4 Jan 2022 04:14:22 +0100 (CET)
Received: by mail-pg1-f177.google.com with SMTP id 7so18890564pgn.0
 for <openrisc@lists.librecores.org>; Mon, 03 Jan 2022 19:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ddwd/bjIRDkkm9tx32KA6WYi50BQdtQ4xdqTQCq9FHE=;
 b=L2aMGSWSgekNYOB/pjDBIsg6X8CLsNJ1UA562SOJoBxSEMtKchgdrdA1UY1cKC8pRu
 HM08QV6cH7FYdGokJq0qZfEmiVebJIHU4UpSaXzrPZVwoJP6Y0HrkNocj+d4I6r0G0xB
 W+oLhZY2iZO5DGI/Xmty90WCe9XdyPgtbZYDT9wmn9e7aC8AVtS+/XVD1zEba3MH2X1V
 EeMuL7Zz0CkUPURjZWmsXAoS7sFm57v2+M39IcXPtTo6K8Y6QNDyppIWBL80bhhNa6uw
 3FSEwd9yMz3gVqMkxmbVgpqnW31L7iY4bISCUaiUTxb6VUmLdRpun/lFHr59Ud8cE4ZP
 nJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ddwd/bjIRDkkm9tx32KA6WYi50BQdtQ4xdqTQCq9FHE=;
 b=COVU2EI2KcUnUN/GmWppGOY7eIGRgmUTONALDA6zenRCTqHoSSWsE1yh3GaW5yg/qS
 Jb50/ATq1zeZInEbDelUsL4CKQs1dIGzb6UxApLgikBLZKGItMWyBkSAFnEkbaAi/LjU
 k3bEuir61MsSyJBj9pVSGFIlS3VUfvz1NyAdjnO9EFyPC0GaYMOqLMx/Cm7qwcZoIvKA
 y2GTqgWqlGYZ7i4KFubAcHKWM5sI3QIFYR6y1IxykRFMG77YwJ7hZGAPGxrgf9kwuqOf
 qbciWIAG5opBx+Swxy8F/wvU1dvmq1pBc3AYN321+nwbFuzUlvOQFUIPIZMsfYZ1nW4H
 gvQw==
X-Gm-Message-State: AOAM531tSIpHChWLPCiEy4wcmTGKWwDr+OyUERkEN3Nk/HBLfXwotHcJ
 Ck4BiNAOk44QFMaUA1hRE1U=
X-Google-Smtp-Source: ABdhPJyoJC2lge0R1gaBkMNmpM5f7rrdQOYUsJM2g+u+eJwkGFRjCApn9eHubZ9ITFUb0v6t6bj4fg==
X-Received: by 2002:a05:6a00:1386:b0:4ba:b454:70bc with SMTP id
 t6-20020a056a00138600b004bab45470bcmr48720907pfg.19.1641266061244; 
 Mon, 03 Jan 2022 19:14:21 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id s9sm31324708pfw.174.2022.01.03.19.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 19:14:20 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Tue,  4 Jan 2022 12:14:02 +0900
Message-Id: <20220104031414.2416928-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220104031414.2416928-1-shorne@gmail.com>
References: <20220104031414.2416928-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v5 01/13] elf: Add reloc for OpenRISC
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
Cc: Openrisc <openrisc@lists.librecores.org>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UmV2aWV3ZWQtYnk6IEFkaGVtZXJ2YWwgWmFuZWxsYSAgPGFkaGVtZXJ2YWwuemFuZWxsYUBsaW5h
cm8ub3JnPgotLS0KIGVsZi9lbGYuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZWxmL2VsZi5oIGIvZWxmL2VsZi5oCmluZGV4IDA4YjBhOTczOTcuLjA3MzVmNmI1NzkgMTAwNjQ0
Ci0tLSBhL2VsZi9lbGYuaAorKysgYi9lbGYvZWxmLmgKQEAgLTQxMjQsNCArNDEyNCw0MSBAQCBl
bnVtCiAjZGVmaW5lIFJfQVJDX1RMU19MRV9TOQkJMHg0YQogI2RlZmluZSBSX0FSQ19UTFNfTEVf
MzIJCTB4NGIKIAorLyogT3BlblJJU0MgMTAwMCBzcGVjaWZpYyByZWxvY3MuICAqLworI2RlZmlu
ZSBSX09SMUtfTk9ORQkJMAorI2RlZmluZSBSX09SMUtfMzIJCTEKKyNkZWZpbmUgUl9PUjFLXzE2
CQkyCisjZGVmaW5lIFJfT1IxS184CQkzCisjZGVmaW5lIFJfT1IxS19MT18xNl9JTl9JTlNOCTQK
KyNkZWZpbmUgUl9PUjFLX0hJXzE2X0lOX0lOU04JNQorI2RlZmluZSBSX09SMUtfSU5TTl9SRUxf
MjYJNgorI2RlZmluZSBSX09SMUtfR05VX1ZURU5UUlkJNworI2RlZmluZSBSX09SMUtfR05VX1ZU
SU5IRVJJVAk4CisjZGVmaW5lIFJfT1IxS18zMl9QQ1JFTAkJOQorI2RlZmluZSBSX09SMUtfMTZf
UENSRUwJCTEwCisjZGVmaW5lIFJfT1IxS184X1BDUkVMCQkxMQorI2RlZmluZSBSX09SMUtfR09U
UENfSEkxNgkxMgorI2RlZmluZSBSX09SMUtfR09UUENfTE8xNgkxMworI2RlZmluZSBSX09SMUtf
R09UMTYJCTE0CisjZGVmaW5lIFJfT1IxS19QTFQyNgkJMTUKKyNkZWZpbmUgUl9PUjFLX0dPVE9G
Rl9ISTE2CTE2CisjZGVmaW5lIFJfT1IxS19HT1RPRkZfTE8xNgkxNworI2RlZmluZSBSX09SMUtf
Q09QWQkJMTgKKyNkZWZpbmUgUl9PUjFLX0dMT0JfREFUCQkxOQorI2RlZmluZSBSX09SMUtfSk1Q
X1NMT1QJCTIwCisjZGVmaW5lIFJfT1IxS19SRUxBVElWRQkJMjEKKyNkZWZpbmUgUl9PUjFLX1RM
U19HRF9ISTE2CTIyCisjZGVmaW5lIFJfT1IxS19UTFNfR0RfTE8xNgkyMworI2RlZmluZSBSX09S
MUtfVExTX0xETV9ISTE2CTI0CisjZGVmaW5lIFJfT1IxS19UTFNfTERNX0xPMTYJMjUKKyNkZWZp
bmUgUl9PUjFLX1RMU19MRE9fSEkxNgkyNgorI2RlZmluZSBSX09SMUtfVExTX0xET19MTzE2CTI3
CisjZGVmaW5lIFJfT1IxS19UTFNfSUVfSEkxNgkyOAorI2RlZmluZSBSX09SMUtfVExTX0lFX0xP
MTYJMjkKKyNkZWZpbmUgUl9PUjFLX1RMU19MRV9ISTE2CTMwCisjZGVmaW5lIFJfT1IxS19UTFNf
TEVfTE8xNgkzMQorI2RlZmluZSBSX09SMUtfVExTX1RQT0ZGCTMyCisjZGVmaW5lIFJfT1IxS19U
TFNfRFRQT0ZGCTMzCisjZGVmaW5lIFJfT1IxS19UTFNfRFRQTU9ECTM0CisKICNlbmRpZgkvKiBl
bGYuaCAqLwotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

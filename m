Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3F78B480F9E
	for <lists+openrisc@lfdr.de>; Wed, 29 Dec 2021 05:43:02 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 27C8724300;
	Wed, 29 Dec 2021 05:43:02 +0100 (CET)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mail.librecores.org (Postfix) with ESMTPS id 832A124072
 for <openrisc@lists.librecores.org>; Wed, 29 Dec 2021 05:43:00 +0100 (CET)
Received: by mail-pg1-f181.google.com with SMTP id l10so17553016pgm.7
 for <openrisc@lists.librecores.org>; Tue, 28 Dec 2021 20:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4E4kfy9aRT0STJqFCwKilk70oeXp0mzC5ksRhyqlW2o=;
 b=pW/VFCkFZvkSozSLzYChberz68eKfZrtHc++Jy8o0syIao4N696lJTKLGk69gph2jK
 J8vXt3wMfnQi+huz8zi8fEs2LlvBr5kek4+YcbTdSKf21CjFAgN32xhvZ9qE6hTbgFqY
 Xylg09DZoZR2NOKPpLwktqHiKuVDm3xemE8YdnTjaymLZ5m/LZiXPiwMU4JgWy3Qsety
 r5Vq2jAkQD9Ze/k57xgipxGQgakJ92C3Ix5+BXil88k+4kYuVAyRNw7eOy0dj/ROfypl
 H7Lmmytd10nkH1uIrVmWSz15F8LOZkFU6eOYpnyl7cfd6TnKal+nLAbqefOCCUhmxGAZ
 2Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4E4kfy9aRT0STJqFCwKilk70oeXp0mzC5ksRhyqlW2o=;
 b=AZMUtVOcBHf85Hq144nO6ECNGUSGVPvkJNZPTZ/PKeMwkB+BHV9WKeJWtgSZTIteUC
 zKG9r3Fr8WZvtneJIoOQ6ynMcjI1n5cmzv41IgALo3XF5vq0UEoCOrbACqQpaYIfUuji
 dvQRTB8PBsC78YVkN1cr3Zr5htcRRdWXrHwZS8PAfBPMAXLOauLOo0zs0svcDhJNk6Y7
 toABw7AAMkWinYHQDi4NqgmUXO+4PZYamvD9CXPlLy0SovrREg/ah0OTCCsqfGGx5Els
 aPtoUmUWZJLaSF06Lz7T+2T4ggTBwJcnxP7iOfA/OvkAwlEGHu+MDilUBC9M9HjzJCwR
 ICzg==
X-Gm-Message-State: AOAM531PiaihFiiG654gqu2KDMCznCYhaQw+sHQDv6YV8PqanoWK1k1j
 xUc99RJBD/8Do4fPLwih3cPu/zd7aM0=
X-Google-Smtp-Source: ABdhPJz8K4+N2gtPQc87uBn1VvkuJfmonm1aoL1YFBEximpkvaWoerQqJDHlSDzTZOcUQ6WfpKuDWA==
X-Received: by 2002:a63:6dc8:: with SMTP id i191mr22135407pgc.34.1640752979128; 
 Tue, 28 Dec 2021 20:42:59 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id nl16sm18704042pjb.22.2021.12.28.20.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 20:42:58 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: GLIBC patches <libc-alpha@sourceware.org>
Date: Wed, 29 Dec 2021 13:42:39 +0900
Message-Id: <20211229044251.2203653-2-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229044251.2203653-1-shorne@gmail.com>
References: <20211229044251.2203653-1-shorne@gmail.com>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v4 01/13] elf: Add reloc for OpenRISC
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
ZWxmL2VsZi5oIGIvZWxmL2VsZi5oCmluZGV4IGZmNTI1OGQwNjUuLmIyNmI4YTQwZDMgMTAwNjQ0
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

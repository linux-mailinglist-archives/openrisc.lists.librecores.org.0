Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 61112370906
	for <lists+openrisc@lfdr.de>; Sat,  1 May 2021 23:11:53 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DF85B21375;
	Sat,  1 May 2021 23:11:52 +0200 (CEST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mail.librecores.org (Postfix) with ESMTPS id 99C3920162
 for <openrisc@lists.librecores.org>; Sat,  1 May 2021 23:11:51 +0200 (CEST)
Received: by mail-pj1-f50.google.com with SMTP id p17so895197pjz.3
 for <openrisc@lists.librecores.org>; Sat, 01 May 2021 14:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShmEn8h0RwDjmdZdLu/6t793fk1d/pLcven8em9tUIo=;
 b=lvPNE9w6WamMTIKRTLE5J2tA0zjXr9xVD08AYjTUY62rvoPXyy8BEcAXUw18UN7FbU
 2nbyZyVfw8x0nQf1LI3BTZeX3uAsYspM2AiFp7k67O0yuWrz0L0cc95/tuT/RieHvVsk
 Eiq75nc0XdMwsOgzFzE8B5b0MG84e2yQniU1zOO6IaQsF6wn0VKhLYwD+ElSxaFp/OXB
 QPaCB2q8zQPgK650hWYiru+zDcNTY6p43T1L+qRn17t2n21sfRH3mOdQoz22SbGLa0EP
 R6Ykmckc233Yq+HKN3EzLYotiXcNYndbsizioMZVpnBM/OKXPBc5l8ea95ka74wufOhS
 4Qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ShmEn8h0RwDjmdZdLu/6t793fk1d/pLcven8em9tUIo=;
 b=VUucBDKRU78HnxaCa8pETqyg1Db4wThWScUtHoCBWCnJ9E72PD2lhrc3OsKZAOH/pZ
 J3sgoEaGwmYmx8tJENchDffxY3I1mqmrjRNp6/clVC8eARmtMIovWvH56oImha5khCw6
 YGgU34eFjoeuAcj9Lw1nEnUt8FnPzCnRpHlp23oiQflzgF7RHymGe1J/Bch2ITW7Iu+M
 Vh9gjwyQ+k9h4q0yf0kcFQcobGDXa82ElRBhJ8clqwmM2+kPOpwFfd2IhOaSCCCVOyH+
 cSiYUgnE0lyDt6IKvuSw5gw/xgXDt2NaC/ECWKY/kN1165YB5+KmF908snIEj0aGHVVP
 bz8w==
X-Gm-Message-State: AOAM5311yLUQSxHdXHMjG2ZlsT/Q/Vhxecwwkobzf/UWNUX6Z51SoxIS
 z+CZVAGWjMn2BpErWfGEg1k=
X-Google-Smtp-Source: ABdhPJznUmlJLhLsaE1X6c7WkLa28HB2Q7gYFZQ1MZGeMfMEcXHf/EYcaZ/PrOnWPhQNHtIkJzZ5aA==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id
 oa3mr18991372pjb.159.1619903510222; 
 Sat, 01 May 2021 14:11:50 -0700 (PDT)
Received: from localhost (g17.222-224-135.ppp.wakwak.ne.jp. [222.224.135.17])
 by smtp.gmail.com with ESMTPSA id
 v22sm5225985pff.105.2021.05.01.14.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 14:11:49 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: GCC patches <gcc-patches@gcc.gnu.org>
Date: Sun,  2 May 2021 06:11:43 +0900
Message-Id: <20210501211145.2980164-1-shorne@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 0/2] OpenRISC support for cmodel=large
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
Cc: giulio.benetti@benettiengineering.com,
 Openrisc <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Q2hhbmdlcyBmcm9tIHYxOgogLSBBZGRlZCBwYXRjaCB0byBlbmFibGVkIGNtb2RsZT1sYXJnZSBv
biBjcnRzdHVmZgoKVGhpcyBzZXJpZXMgZml4ZXMgc29tZSBidWdzIGZvdW5kIHdoZW4gbGlua2lu
ZyBsYXJnZSBiaW5hcmllcywgYm90aCBpbiBidWlsZHJvb3QKYW5kIGdsaWJjIHRlc3RpbmcuCgpT
dGFmZm9yZCBIb3JuZSAoMik6CiAgb3IxazogQWRkIG1jbW9kZWwgb3B0aW9uIHRvIGhhbmRsZSBs
YXJnZSBHT1RzCiAgb3IxazogVXNlIGNtb2RlbD1sYXJnZSB3aGVuIGJ1aWxkaW5nIGNydHN0dWZm
CgogZ2NjL2NvbmZpZy9vcjFrL29yMWstb3B0cy5oICAgfCAzMCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKIGdjYy9jb25maWcvb3Ixay9vcjFrLmMgICAgICAgIHwgMTEgKysrKysrKysr
LS0KIGdjYy9jb25maWcvb3Ixay9vcjFrLmggICAgICAgIHwgIDcgKysrKysrKwogZ2NjL2NvbmZp
Zy9vcjFrL29yMWsub3B0ICAgICAgfCAxOSArKysrKysrKysrKysrKysrKysrCiBnY2MvZG9jL2lu
dm9rZS50ZXhpICAgICAgICAgICB8IDEyICsrKysrKysrKysrLQogbGliZ2NjL2NvbmZpZy5ob3N0
ICAgICAgICAgICAgfCAgNCArKy0tCiBsaWJnY2MvY29uZmlnL29yMWsvdC1jcnRzdHVmZiB8ICAy
ICsrCiA3IGZpbGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZ2NjL2NvbmZpZy9vcjFrL29yMWstb3B0cy5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgbGliZ2NjL2NvbmZpZy9vcjFrL3QtY3J0c3R1ZmYKCi0tIAoyLjI2LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

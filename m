Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 375B14242F8
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 12D71240A4;
	Wed,  6 Oct 2021 18:43:42 +0200 (CEST)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by mail.librecores.org (Postfix) with ESMTPS id 399DB23F01
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:40 +0200 (CEST)
Received: by mail-oo1-f41.google.com with SMTP id
 l8-20020a4ae2c8000000b002b5ec765d9fso1008623oot.13
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH5lm9ZJrN75WHjiktQyDKNUxUp68MdS3scEafa+VH8=;
 b=L6+6K+K6OEFNtLDzPWYXdLMrWEwxrfDln844aGNyuprgmvVGzqlmAY4fcK80ktMmKF
 CLSzeirm9V2KPTUf/G8SLL96Prja5leSfN08bsY4KQz5UKQVNKo9iDmfWVfIi/J5x1Y2
 kPYvsDdkiUaDz6xsMcZIKVy9z8X/1Advc4I1TXjGg3z5EtabMbVuGlsNxUx7+J9WYSIM
 Z8ywjlxXcmPhih9IzkrYP4HRRi0KqeWI1d7OlTivCDdgVS9ha/kRTmBorvXzlIiaz9OI
 M1YVANgPz6OeXtDReqcDgwjyzx+np//QffKGQ48YT9g+8utix1zMGauXVlDIUOO3Atvp
 DhXg==
X-Gm-Message-State: AOAM533JN3V6Tfm1rgRIsDyhQ79Nljm06lRTDkUhc6nc1u4TdcmA6Z6e
 XRrWIWwFMOE7lqam2MLcdQ==
X-Google-Smtp-Source: ABdhPJwDQxYuha7mztXncei2FBwje0uHQ2qAvAT0rAc8M1CEq47s46mQjlS2vX0JBLAJhljiutK9EA==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr19009146oor.47.1633538619135; 
 Wed, 06 Oct 2021 09:43:39 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:38 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:22 -0500
Message-Id: <20211006164332.1981454-3-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 02/12] ARM: Use of_get_cpu_hwid()
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

UmVwbGFjZSB0aGUgb3BlbiBjb2RlZCBwYXJzaW5nIG9mIENQVSBub2RlcycgJ3JlZycgcHJvcGVy
dHkgd2l0aApvZl9nZXRfY3B1X2h3aWQoKS4KClRoaXMgY2hhbmdlIGRyb3BzIGFuIGVycm9yIG1l
c3NhZ2UgZm9yIG1pc3NpbmcgJ3JlZycgcHJvcGVydHksIGJ1dCB0aGF0CnNob3VsZCBub3QgYmUg
bmVjZXNzYXJ5IGFzIHRoZSBEVCB0b29scyB3aWxsIGVuc3VyZSAncmVnJyBpcyBwcmVzZW50LgoK
Q2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL2tlcm5lbC9kZXZ0cmVl
LmMgfCAyMiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9rZXJuZWwvZGV2
dHJlZS5jIGIvYXJjaC9hcm0va2VybmVsL2RldnRyZWUuYwppbmRleCAyODMxMWRkMGZlZTYuLjAy
ODM5ZDhiNjIwMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0va2VybmVsL2RldnRyZWUuYworKysgYi9h
cmNoL2FybS9rZXJuZWwvZGV2dHJlZS5jCkBAIC04NCwzMyArODQsMTUgQEAgdm9pZCBfX2luaXQg
YXJtX2R0X2luaXRfY3B1X21hcHModm9pZCkKIAkJcmV0dXJuOwogCiAJZm9yX2VhY2hfb2ZfY3B1
X25vZGUoY3B1KSB7Ci0JCWNvbnN0IF9fYmUzMiAqY2VsbDsKLQkJaW50IHByb3BfYnl0ZXM7Ci0J
CXUzMiBod2lkOworCQl1MzIgaHdpZCA9IG9mX2dldF9jcHVfaHdpZChjcHUsIDApOwogCiAJCXBy
X2RlYnVnKCIgKiAlcE9GLi4uXG4iLCBjcHUpOwotCQkvKgotCQkgKiBBIGRldmljZSB0cmVlIGNv
bnRhaW5pbmcgQ1BVIG5vZGVzIHdpdGggbWlzc2luZyAicmVnIgotCQkgKiBwcm9wZXJ0aWVzIGlz
IGNvbnNpZGVyZWQgaW52YWxpZCB0byBidWlsZCB0aGUKLQkJICogY3B1X2xvZ2ljYWxfbWFwLgot
CQkgKi8KLQkJY2VsbCA9IG9mX2dldF9wcm9wZXJ0eShjcHUsICJyZWciLCAmcHJvcF9ieXRlcyk7
Ci0JCWlmICghY2VsbCB8fCBwcm9wX2J5dGVzIDwgc2l6ZW9mKCpjZWxsKSkgewotCQkJcHJfZGVi
dWcoIiAqICVwT0YgbWlzc2luZyByZWcgcHJvcGVydHlcbiIsIGNwdSk7Ci0JCQlvZl9ub2RlX3B1
dChjcHUpOwotCQkJcmV0dXJuOwotCQl9CiAKIAkJLyoKIAkJICogQml0cyBuOjI0IG11c3QgYmUg
c2V0IHRvIDAgaW4gdGhlIERUIHNpbmNlIHRoZSByZWcgcHJvcGVydHkKIAkJICogZGVmaW5lcyB0
aGUgTVBJRFJbMjM6MF0uCiAJCSAqLwotCQlkbyB7Ci0JCQlod2lkID0gYmUzMl90b19jcHUoKmNl
bGwrKyk7Ci0JCQlwcm9wX2J5dGVzIC09IHNpemVvZigqY2VsbCk7Ci0JCX0gd2hpbGUgKCFod2lk
ICYmIHByb3BfYnl0ZXMgPiAwKTsKLQotCQlpZiAocHJvcF9ieXRlcyB8fCAoaHdpZCAmIH5NUElE
Ul9IV0lEX0JJVE1BU0spKSB7CisJCWlmIChod2lkICYgfk1QSURSX0hXSURfQklUTUFTSykgewog
CQkJb2Zfbm9kZV9wdXQoY3B1KTsKIAkJCXJldHVybjsKIAkJfQotLSAKMi4zMC4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

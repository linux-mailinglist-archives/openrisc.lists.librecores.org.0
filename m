Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDD9424301
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 782DA24165;
	Wed,  6 Oct 2021 18:43:46 +0200 (CEST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by mail.librecores.org (Postfix) with ESMTPS id 39224240FB
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:44 +0200 (CEST)
Received: by mail-ot1-f45.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so3873377otx.3
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nz2VNzL+ydy4chpa3d7bE/r1R6JeAbCb1Q1l6nn9BO4=;
 b=Ghh2fO4Ib1XVj1GkO0o/cAFsYMBCk6J5TaXUim9er527l6nkE35Eo4Mbhhd0PCQHhu
 +k0w7PS5Ei0F848BbLZ1GF1qqB5GjvPmf3aQpnZv4ksIQsSKIUrcP6J0r5KAm2IGyJWF
 oJBMw+47tGKauhlWQ9vFY7FQ2pHl6XopVycKcvz+uULDEpUP9m3o74dztqTieDGQT8mg
 6IB4tkdHgtNjjuPiPKTLjhAxiZO5PvVtq5YHNJZbLY4OyTJf9hmPgw/tP35NBetwznnE
 WIzrDWdtnScqR7eg4a2ebaagIrbTKL1FR4QAYURRoB2B6W2bzPn36cV9OQGudQC8IRnT
 7vZQ==
X-Gm-Message-State: AOAM530d0PI9zCIv+VWxLJAxbGLnIpXxepDdPWTsuo1K1/RKD2EPfZPl
 tTu4fVDs0rU8tVai4Dg89Q==
X-Google-Smtp-Source: ABdhPJzkVUe2NQ95hrntc6XfGtsZUf11mFfAeFqW0+ilFUDkOjdRegXB0ef4DYKZYBjYmsjM+kfXAg==
X-Received: by 2002:a9d:6ac7:: with SMTP id m7mr20566678otq.49.1633538622946; 
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:24 -0500
Message-Id: <20211006164332.1981454-5-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 04/12] arm64: Use of_get_cpu_hwid()
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
Q2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+CkNjOiBXaWxsIERl
YWNvbiA8d2lsbEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtNjQva2VybmVsL3NtcC5jIHwgMzEgKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMgYi9hcmNo
L2FybTY0L2tlcm5lbC9zbXAuYwppbmRleCA2ZjZmZjA3MmFjYmQuLmM1Y2ViYzQwNmQyNCAxMDA2
NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvc21wLmMKKysrIGIvYXJjaC9hcm02NC9rZXJuZWwv
c21wLmMKQEAgLTQ2NiwzMyArNDY2LDYgQEAgdm9pZCBfX2luaXQgc21wX3ByZXBhcmVfYm9vdF9j
cHUodm9pZCkKIAlrYXNhbl9pbml0X2h3X3RhZ3MoKTsKIH0KIAotc3RhdGljIHU2NCBfX2luaXQg
b2ZfZ2V0X2NwdV9tcGlkcihzdHJ1Y3QgZGV2aWNlX25vZGUgKmRuKQotewotCWNvbnN0IF9fYmUz
MiAqY2VsbDsKLQl1NjQgaHdpZDsKLQotCS8qCi0JICogQSBjcHUgbm9kZSB3aXRoIG1pc3Npbmcg
InJlZyIgcHJvcGVydHkgaXMKLQkgKiBjb25zaWRlcmVkIGludmFsaWQgdG8gYnVpbGQgYSBjcHVf
bG9naWNhbF9tYXAKLQkgKiBlbnRyeS4KLQkgKi8KLQljZWxsID0gb2ZfZ2V0X3Byb3BlcnR5KGRu
LCAicmVnIiwgTlVMTCk7Ci0JaWYgKCFjZWxsKSB7Ci0JCXByX2VycigiJXBPRjogbWlzc2luZyBy
ZWcgcHJvcGVydHlcbiIsIGRuKTsKLQkJcmV0dXJuIElOVkFMSURfSFdJRDsKLQl9Ci0KLQlod2lk
ID0gb2ZfcmVhZF9udW1iZXIoY2VsbCwgb2Zfbl9hZGRyX2NlbGxzKGRuKSk7Ci0JLyoKLQkgKiBO
b24gYWZmaW5pdHkgYml0cyBtdXN0IGJlIHNldCB0byAwIGluIHRoZSBEVAotCSAqLwotCWlmICho
d2lkICYgfk1QSURSX0hXSURfQklUTUFTSykgewotCQlwcl9lcnIoIiVwT0Y6IGludmFsaWQgcmVn
IHByb3BlcnR5XG4iLCBkbik7Ci0JCXJldHVybiBJTlZBTElEX0hXSUQ7Ci0JfQotCXJldHVybiBo
d2lkOwotfQotCiAvKgogICogRHVwbGljYXRlIE1QSURScyBhcmUgYSByZWNpcGUgZm9yIGRpc2Fz
dGVyLiBTY2FuIGFsbCBpbml0aWFsaXplZAogICogZW50cmllcyBhbmQgY2hlY2sgZm9yIGR1cGxp
Y2F0ZXMuIElmIGFueSBpcyBmb3VuZCBqdXN0IGlnbm9yZSB0aGUKQEAgLTY1Niw5ICs2MjksOSBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgb2ZfcGFyc2VfYW5kX2luaXRfY3B1cyh2b2lkKQogCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqZG47CiAKIAlmb3JfZWFjaF9vZl9jcHVfbm9kZShkbikgewotCQl1NjQg
aHdpZCA9IG9mX2dldF9jcHVfbXBpZHIoZG4pOworCQl1NjQgaHdpZCA9IG9mX2dldF9jcHVfaHdp
ZChkbiwgMCk7CiAKLQkJaWYgKGh3aWQgPT0gSU5WQUxJRF9IV0lEKQorCQlpZiAoaHdpZCAmIH5N
UElEUl9IV0lEX0JJVE1BU0spCiAJCQlnb3RvIG5leHQ7CiAKIAkJaWYgKGlzX21waWRyX2R1cGxp
Y2F0ZShjcHVfY291bnQsIGh3aWQpKSB7Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

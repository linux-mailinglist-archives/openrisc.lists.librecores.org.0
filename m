Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 63E82424315
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 41060241FC;
	Wed,  6 Oct 2021 18:43:57 +0200 (CEST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mail.librecores.org (Postfix) with ESMTPS id 05E24241A0
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:56 +0200 (CEST)
Received: by mail-oi1-f178.google.com with SMTP id n64so4891093oih.2
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J13zoIHrX4tLH3WneJUTeWV7jFKNgk6/LfnJOFSAv7E=;
 b=B/jBs8AsZ4uJXGYHlpq7B8L61CPsXbvv7tGDUY8ENFUrN3ntx7o6lQXl9Ppso/DUCo
 hcHKRJlU8vzCccbqQTyT1Q4okf12vMrUigOEQZIRbGD/HK8NFniN2+UyA5Y7fGcU4Htr
 wt+k3HbsBWwVFznpkasboyoB8U8FEwnu5XjHhztqyFLNQO8o/qThikTa0FgY3Ln0VSNE
 oRTDk8bRZnKFaYXi1RC0eLzEzVxTn82LbvB//lyKsgPwQVBfqvuMr7jiPUAnUs65K8E0
 clxOEgXN5ukyVdMCzajO8gPf519o83foGIDAiqR1bQ3xcfEbXIwOmGyX5rA7B6IJJt7X
 8Tcw==
X-Gm-Message-State: AOAM531lwRkMrgb6xN/wpdGMeNuoEtxzELCcyow9olXV9j/bFzjQFrgD
 hWQPoszpKDnfhB4xRRot+DLOZU3kpw==
X-Google-Smtp-Source: ABdhPJzsmLqvAc8ULa8uzHfFQAR3YkQa63E6ZsBRL9k77fBu+BE8j4mODwWxFxPISSskaMe8DkKEfw==
X-Received: by 2002:aca:c288:: with SMTP id s130mr7509039oif.138.1633538634953; 
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:30 -0500
Message-Id: <20211006164332.1981454-11-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 10/12] x86: dt: Use of_get_cpu_hwid()
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

UmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzJyAncmVnJyBwcm9wZXJ0eSB3
aXRoCm9mX2dldF9jcHVfaHdpZCgpLgoKQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQ
ZXRrb3YgPGJwQGFsaWVuOC5kZT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiAiSC4gUGV0ZXIgQW52
aW4iIDxocGFAenl0b3IuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgotLS0KIGFyY2gveDg2L2tlcm5lbC9kZXZpY2V0cmVlLmMgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9kZXZpY2V0cmVlLmMgYi9hcmNoL3g4Ni9rZXJuZWwvZGV2aWNldHJl
ZS5jCmluZGV4IDZhNGNiNzFjMjQ5OC4uM2FhMWU5OWRmMmE5IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvZGV2aWNldHJlZS5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9kZXZpY2V0cmVlLmMK
QEAgLTEzOSwxMiArMTM5LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkdGJfY3B1X3NldHVwKHZv
aWQpCiB7CiAJc3RydWN0IGRldmljZV9ub2RlICpkbjsKIAl1MzIgYXBpY19pZCwgdmVyc2lvbjsK
LQlpbnQgcmV0OwogCiAJdmVyc2lvbiA9IEdFVF9BUElDX1ZFUlNJT04oYXBpY19yZWFkKEFQSUNf
TFZSKSk7CiAJZm9yX2VhY2hfb2ZfY3B1X25vZGUoZG4pIHsKLQkJcmV0ID0gb2ZfcHJvcGVydHlf
cmVhZF91MzIoZG4sICJyZWciLCAmYXBpY19pZCk7Ci0JCWlmIChyZXQgPCAwKSB7CisJCWFwaWNf
aWQgPSBvZl9nZXRfY3B1X2h3aWQoZG4sIDApOworCQlpZiAoYXBpY19pZCA9PSB+MFUpIHsKIAkJ
CXByX3dhcm4oIiVwT0Y6IG1pc3NpbmcgbG9jYWwgQVBJQyBJRFxuIiwgZG4pOwogCQkJY29udGlu
dWU7CiAJCX0KLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

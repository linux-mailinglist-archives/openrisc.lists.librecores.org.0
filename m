Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 30D36424313
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 13CB2241DF;
	Wed,  6 Oct 2021 18:43:55 +0200 (CEST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by mail.librecores.org (Postfix) with ESMTPS id 0A1DF241A3
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:54 +0200 (CEST)
Received: by mail-oo1-f51.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so1019668oof.9
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVDBxu87TJi7lJ0TsvF77hW6cToukGJnTBFK4bAPEHE=;
 b=Rmvc20ABEVvKUSjee1FRl09lRNiuW7Y9YtCHseI6ggaX7bKCfVW42wuX/ARdmf37AR
 Lj9ceqk3cwSnRCiOq6mfNYbtngAg9N5POCQhXQbSfxM4jaqujiV6P/6SZQUklNd7RK9U
 5pDnp5NxwI7t/4C0na3EUhihoXDEgxLCrzzEsUG41ADVD3soiQJzSM9Jlu0/URNxR2SC
 Gr6tFNcClJc6DKu8kMG6K4bwV/6gBpW3vSuEGllNfwLKVnU17Wsh73lCpDnSL3muqaVq
 uoo/2+mRC6/GQxyrsZcuHfmoaNh5kiCq+PsPKwV85LxSQ/a3yiRtAvBeBvHRESi/g0EM
 PNOA==
X-Gm-Message-State: AOAM533M2xTqYnK4WwRHmh9tGJNAg/C8YShJwTCWJ9KsFITG7LBDN9aR
 fXqxgt+VGJLpccShmrFrqQ==
X-Google-Smtp-Source: ABdhPJwSo3vtevHig5e6wcfYzHn+p/9LVu6izXiBqHPOZc+ml50aXK5vctwJYkE3EswfiMHjHBf9ng==
X-Received: by 2002:a4a:e597:: with SMTP id o23mr6391984oov.96.1633538632948; 
 Wed, 06 Oct 2021 09:43:52 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:52 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:29 -0500
Message-Id: <20211006164332.1981454-10-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 09/12] sh: Use of_get_cpu_hwid()
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
aXRoCm9mX2dldF9jcHVfaHdpZCgpLgoKQ2M6IFlvc2hpbm9yaSBTYXRvIDx5c2F0b0B1c2Vycy5z
b3VyY2Vmb3JnZS5qcD4KQ2M6IFJpY2ggRmVsa2VyIDxkYWxpYXNAbGliYy5vcmc+CkNjOiBsaW51
eC1zaEB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmljLmMgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvc2gvYm9hcmRzL29mLWdlbmVyaWMuYyBiL2FyY2gvc2gvYm9hcmRzL29mLWdlbmVyaWMu
YwppbmRleCA5MjFkNzZmYzMzNTguLmY3ZjNlNjE4ZTg1YiAxMDA2NDQKLS0tIGEvYXJjaC9zaC9i
b2FyZHMvb2YtZ2VuZXJpYy5jCisrKyBiL2FyY2gvc2gvYm9hcmRzL29mLWdlbmVyaWMuYwpAQCAt
NjIsOSArNjIsOCBAQCBzdGF0aWMgdm9pZCBzaF9vZl9zbXBfcHJvYmUodm9pZCkKIAlpbml0X2Nw
dV9wb3NzaWJsZShjcHVtYXNrX29mKDApKTsKIAogCWZvcl9lYWNoX29mX2NwdV9ub2RlKG5wKSB7
Ci0JCWNvbnN0IF9fYmUzMiAqY2VsbCA9IG9mX2dldF9wcm9wZXJ0eShucCwgInJlZyIsIE5VTEwp
OwotCQl1NjQgaWQgPSAtMTsKLQkJaWYgKGNlbGwpIGlkID0gb2ZfcmVhZF9udW1iZXIoY2VsbCwg
b2Zfbl9hZGRyX2NlbGxzKG5wKSk7CisJCXU2NCBpZCA9IG9mX2dldF9jcHVfaHdpZChucCwgMCk7
CisKIAkJaWYgKGlkIDwgTlJfQ1BVUykgewogCQkJaWYgKCFtZXRob2QpCiAJCQkJb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmcobnAsICJlbmFibGUtbWV0aG9kIiwgJm1ldGhvZCk7Ci0tIAoyLjMwLjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

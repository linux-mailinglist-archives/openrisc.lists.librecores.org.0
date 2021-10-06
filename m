Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 01A80424311
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D941F24195;
	Wed,  6 Oct 2021 18:43:53 +0200 (CEST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by mail.librecores.org (Postfix) with ESMTPS id 2815424194
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:52 +0200 (CEST)
Received: by mail-ot1-f50.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso3843964ota.8
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhacG1oflfweV+ZMxYJrdhD3dQtCOWEVKc3UA01qLrg=;
 b=VJKWxOiS9YbZYMk1OjJMxig/xuAt4J3Og4S43HwOu4XUmfZNwB4GfSxnujTtCiKv/H
 BfDfsQMt4MArxqVcxbKki2iP9C+VY8dzO8R1hFwusx8z71Oi/1CkQ1y5jmQKf53Sx8Ri
 q+h91/zn6V3DsNavlm9eNCNY1n/iMqxAYF778OUKkvE/ZiFdFes+Q8MZsvRu+gRRaqD6
 DgrkjGHQHJ63pvU1bFvtQ8ABE/gYov2mCQZbH/ie00tZQLdIHNrphU8vJ3vCUtwdomJ9
 rShQljfLiYgH+F6p9o4Xya30/b0E1m7KdB+ToPX79lW2Z+xofGKFrDarUuLSZ98gDOg+
 NM8Q==
X-Gm-Message-State: AOAM533cpHt7dzP+kTREjigghr9HhJiNKp7BwOIWkt6BtY3LSApVZm9b
 bIyoRakJuGZdcQMGCxhGOA==
X-Google-Smtp-Source: ABdhPJzJQ2R5CEfp/bAtXtoCRQDaDF5B6RqZA1flXSsxFu0kVfpgeNfjZq0OKrhuVdseg2/0PDqWlg==
X-Received: by 2002:a05:6830:455:: with SMTP id
 d21mr20503877otc.300.1633538631080; 
 Wed, 06 Oct 2021 09:43:51 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:49 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:28 -0500
Message-Id: <20211006164332.1981454-9-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 08/12] riscv: Use of_get_cpu_hwid()
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
aXRoCm9mX2dldF9jcHVfaHdpZCgpLgoKQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlA
c2lmaXZlLmNvbT4KQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNjOiBB
bGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
LS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwppbmRleCA2ZDU5ZTY5MDZmZGQuLmYx
M2IyYzllYTkxMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1LmMKQEAgLTIyLDcgKzIyLDggQEAgaW50IHJpc2N2X29mX3Byb2Nl
c3Nvcl9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCQlyZXR1cm4gLUVOT0RFVjsK
IAl9CiAKLQlpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInJlZyIsICZoYXJ0KSkgewor
CWhhcnQgPSBvZl9nZXRfY3B1X2h3aWQobm9kZSwgMCk7CisJaWYgKGhhcnQgPT0gfjBVKSB7CiAJ
CXByX3dhcm4oIkZvdW5kIENQVSB3aXRob3V0IGhhcnQgSURcbiIpOwogCQlyZXR1cm4gLUVOT0RF
VjsKIAl9Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

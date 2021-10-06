Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 664B34242FB
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 496D02412F;
	Wed,  6 Oct 2021 18:43:44 +0200 (CEST)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by mail.librecores.org (Postfix) with ESMTPS id 213B4240FB
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:42 +0200 (CEST)
Received: by mail-oo1-f42.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so524815oou.10
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdvZjQ/BWS45GZwLPJ4dVbNMr/Wj7uXKHO/Bl7X5Es4=;
 b=jaXajj2VcGoo6fGMJj3v3jasuqdmdy7BiNgBSLmUU9rrUZ/V0mCs4rvAb2PUDDbRp2
 KXBS/yDAoEPDtHqjreASP8Lo4pnU+RfhMGYxRwyrbd02Xl8k3VZxN9RDYGKvAjaYKXhj
 9AW85/E/2mGUxxf4cSxiq2UkRJx3yYrl0PeUw+mIs9wgcLW9CaX9jNTPSHKlDO20Olp5
 32UkbQaCmYp17BICA5HI+s0XzvbLdaJYUWzwmOBzbJUtcPdvtTuYcdY7bhvqiBbbKBXT
 kAm3Be1cjw1b5xfPON4Y9D6CyF+S/wH6LX6jM7Wg4MpRnfbtaO1+nB2k5xJEw6s/Lc4U
 EwSw==
X-Gm-Message-State: AOAM533n3L5zMz9L6HE3agI9rDcbz91mk6a32KGS6WioI5D6xyeq6i1u
 corgzOJxE0QSIMFzPJqk7w==
X-Google-Smtp-Source: ABdhPJy1h3H+xIThEc/Bx5W+PW+QqHTa7nGnBvK2axsTz6MHYy0vHuhJmmz3xzrXGNxNysUcAEgxdA==
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr18657206oob.72.1633538621020; 
 Wed, 06 Oct 2021 09:43:41 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:40 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:23 -0500
Message-Id: <20211006164332.1981454-4-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
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

UmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2YgQ1BVIG5vZGVzICdyZWcnIHByb3BlcnR5IHdp
dGgKb2ZfZ2V0X2NwdV9od2lkKCkuCgpDYzogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxsaUBn
bWFpbC5jb20+CkNjOiBSYXkgSnVpIDxyanVpQGJyb2FkY29tLmNvbT4KQ2M6IFNjb3R0IEJyYW5k
ZW4gPHNicmFuZGVuQGJyb2FkY29tLmNvbT4KQ2M6IGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBi
cm9hZGNvbS5jb20KQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3JnLnVrPgpTaWdu
ZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtL21h
Y2gtYmNtL2JjbTYzeHhfcG1iLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLWJjbS9i
Y202M3h4X3BtYi5jIGIvYXJjaC9hcm0vbWFjaC1iY20vYmNtNjN4eF9wbWIuYwppbmRleCAwZTVh
MDViYWMzZWEuLjAwM2YxNDcyYWI0NSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vbWFjaC1iY20vYmNt
NjN4eF9wbWIuYworKysgYi9hcmNoL2FybS9tYWNoLWJjbS9iY202M3h4X3BtYi5jCkBAIC05MSwx
MCArOTEsMTAgQEAgc3RhdGljIGludCBiY202M3h4X3BtYl9nZXRfcmVzb3VyY2VzKHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqZG4sCiAJc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwogCWludCByZXQ7
CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihkbiwgInJlZyIsIGNwdSk7Ci0JaWYgKHJl
dCkgeworCSpjcHUgPSBvZl9nZXRfY3B1X2h3aWQoZG4sIDApOworCWlmICgqY3B1ID09IH4wVSkg
ewogCQlwcl9lcnIoIkNQVSBpcyBtaXNzaW5nIGEgcmVnIG5vZGVcbiIpOwotCQlyZXR1cm4gcmV0
OworCQlyZXR1cm4gLUVOT0RFVjsKIAl9CiAKIAlyZXQgPSBvZl9wYXJzZV9waGFuZGxlX3dpdGhf
YXJncyhkbiwgInJlc2V0cyIsICIjcmVzZXQtY2VsbHMiLAotLSAKMi4zMC4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

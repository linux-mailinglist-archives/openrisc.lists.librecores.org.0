Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD52742430D
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ABB6C2414C;
	Wed,  6 Oct 2021 18:43:51 +0200 (CEST)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by mail.librecores.org (Postfix) with ESMTPS id B34282414C
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:49 +0200 (CEST)
Received: by mail-oo1-f46.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so524931oou.10
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY59MK3rRpvbu1Z+VUSRhTP9oCogI9gtd3qobuL4xSE=;
 b=Ky3QzBR73SPExrwN1BaYJIs8POgAnIrgZNnmZt1WpcSUOPLG5uTLiKAdOMu/l5e8gQ
 /gJBI756dWhAo2fRc//wGuIKHNnu4PS5KdPs/HikSS0W3rxy06Dd9LXTvTqJbBY4e7Dt
 vh6bi6E1vNiQ/r20kb/qjBcJBHl7/zvFDvcjPkJzJ/HSNR5gAQMVwJLiGB1HSV1+bhnw
 L+oHWB5cRTZJnY4t2K3bLqu1rjOe/b3htBfjvF62QfJY7DrbtqD5NG/aM0NrfSOSYHqP
 DGfCCJLQLsrFS34V3FRmeyYUSnMF07wJBT4+dbltosYAILl7fSe0XDJMpyVAC47BF/Yd
 jMnA==
X-Gm-Message-State: AOAM5306CKQv116pHFVGA4Y6Hwa7XvJqm2a6tF/PJwc/OvEP4nm1+zrN
 MGCeSiAZ0FjMGOYu1Sqttg==
X-Google-Smtp-Source: ABdhPJz0UBQruF1+4qwCrW51W9Ryn9cj8arPhEOykPX2X80Gkf6HFF4wZl1tVkLGt4TXGOWPUlKBPA==
X-Received: by 2002:a05:6820:1018:: with SMTP id
 v24mr19468852oor.27.1633538628646; 
 Wed, 06 Oct 2021 09:43:48 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:47 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:27 -0500
Message-Id: <20211006164332.1981454-8-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
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
aXRoCm9mX2dldF9jcHVfaHdpZCgpLgoKQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1h
bi5pZC5hdT4KQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5n
Lm9yZz4KQ2M6IFBhdWwgTWFja2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPgpDYzogbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcKU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jIHwgNyArLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zbXAuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc21wLmMKaW5k
ZXggOWNjN2QzZGJmNDM5Li5kOTZiMGUzNjFhNzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9r
ZXJuZWwvc21wLmMKKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zbXAuYwpAQCAtMTMxMywxOCAr
MTMxMywxMyBAQCBpbnQgX19jcHVfdXAodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IHRhc2tfc3Ry
dWN0ICp0aWRsZSkKIGludCBjcHVfdG9fY29yZV9pZChpbnQgY3B1KQogewogCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbnA7Ci0JY29uc3QgX19iZTMyICpyZWc7CiAJaW50IGlkID0gLTE7CiAKIAlucCA9
IG9mX2dldF9jcHVfbm9kZShjcHUsIE5VTEwpOwogCWlmICghbnApCiAJCWdvdG8gb3V0OwogCi0J
cmVnID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAicmVnIiwgTlVMTCk7Ci0JaWYgKCFyZWcpCi0JCWdv
dG8gb3V0OwotCi0JaWQgPSBiZTMyX3RvX2NwdXAocmVnKTsKKwlpZCA9IG9mX2dldF9jcHVfaHdp
ZChucCwgMCk7CiBvdXQ6CiAJb2Zfbm9kZV9wdXQobnApOwogCXJldHVybiBpZDsKLS0gCjIuMzAu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

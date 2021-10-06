Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F40304242F1
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D6D7E24047;
	Wed,  6 Oct 2021 18:43:39 +0200 (CEST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mail.librecores.org (Postfix) with ESMTPS id 722B323F01
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:38 +0200 (CEST)
Received: by mail-oi1-f179.google.com with SMTP id s24so4839737oij.8
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uA/cSYcpVyY62IJQPXwhEfvcH0a7DNNoh6QF/gbSv/o=;
 b=A+pnKwyMSE427jwY6IHWoU/dhI7hLvJ/hekj275WNdToqzF89+8l4tS4IbsrHzMVBi
 csyacPRNCiBEcwW9L0OvTKIF52gcWcrnM6F4uh5h288LioNXdjDlHksF+dOJtGItmAk3
 J5Wl7DpwSXUBX3L49wOHZWSWlSK1IskJBeNuju4vBCHQAttSx//NToI+mlLcWQDCGmVg
 +u0sOsS0raNpL44mNp9JJSd9/X+1wsYq/G7kBvoT5zKknQkEQBns8J8dsIF08WRcBiu4
 ssdepc8r2XSMjYGKRAwYcyM+Tm8TGCIyJY0/22L/8GENk6bIXXBYWleb4+PHa1AY6Uqt
 DQnQ==
X-Gm-Message-State: AOAM531OtOKPfuOz7z/H4S2urj2/pmTzDwI7kUsKIlJorAbluqTHyP+s
 viOfJf6LJfSJTMBq66QsBw==
X-Google-Smtp-Source: ABdhPJyz5HqR6tKtFIEsHk/GSarLhJvs4xTI3uQnRBWEIdAL05spj94Pn3luIAFrkmprFHNc17eP4A==
X-Received: by 2002:a05:6808:231f:: with SMTP id
 bn31mr855081oib.66.1633538617237; 
 Wed, 06 Oct 2021 09:43:37 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:36 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:21 -0500
Message-Id: <20211006164332.1981454-2-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 01/12] of: Add of_get_cpu_hwid() to read hardware
 ID from CPU nodes
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

VGhlcmUgYXJlIHZhcmlvdXMgb3BlbiBjb2RlZCBpbXBsZW1lbnRpb25zIHBhcnNpbmcgdGhlIENQ
VSBub2RlICdyZWcnCnByb3BlcnR5IHdoaWNoIGNvbnRhaW5zIHRoZSBDUFUncyBoYXJkd2FyZSBJ
RC4gSW50cm9kdWNlIGEgbmV3IGZ1bmN0aW9uLApvZl9nZXRfY3B1X2h3aWQoKSwgdG8gcmVhZCB0
aGUgaGFyZHdhcmUgSUQuCgpBbGwgdGhlIGNhbGxlcnMgc2hvdWxkIGJlIERUIG9ubHkgY29kZSwg
c28gbm8gbmVlZCBmb3IgYW4gZW1wdHkKZnVuY3Rpb24uCgpDYzogRnJhbmsgUm93YW5kIDxmcm93
YW5kLmxpc3RAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvb2YvYmFzZS5jICB8IDIyICsrKysrKysrKysrKysrKysrKysr
KysKIGluY2x1ZGUvbGludXgvb2YuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvYmFzZS5jIGIvZHJpdmVycy9vZi9iYXNl
LmMKaW5kZXggZjcyMGMwZDI0NmYyLi5lNTg3YWI0NGJlMjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
b2YvYmFzZS5jCisrKyBiL2RyaXZlcnMvb2YvYmFzZS5jCkBAIC0yODYsNiArMjg2LDI4IEBAIGNv
bnN0IHZvaWQgKm9mX2dldF9wcm9wZXJ0eShjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBj
b25zdCBjaGFyICpuYW1lLAogfQogRVhQT1JUX1NZTUJPTChvZl9nZXRfcHJvcGVydHkpOwogCisv
KioKKyAqIG9mX2dldF9jcHVfaHdpZCAtIEdldCB0aGUgaGFyZHdhcmUgSUQgZnJvbSBhIENQVSBk
ZXZpY2Ugbm9kZQorICoKKyAqIEBjcHVuOiBDUFUgbnVtYmVyKGxvZ2ljYWwgaW5kZXgpIGZvciB3
aGljaCBkZXZpY2Ugbm9kZSBpcyByZXF1aXJlZAorICogQHRocmVhZDogVGhlIGxvY2FsIHRocmVh
ZCBudW1iZXIgdG8gZ2V0IHRoZSBoYXJkd2FyZSBJRCBmb3IuCisgKgorICogUmV0dXJuOiBUaGUg
aGFyZHdhcmUgSUQgZm9yIHRoZSBDUFUgbm9kZSBvciB+MFVMTCBpZiBub3QgZm91bmQuCisgKi8K
K3U2NCBvZl9nZXRfY3B1X2h3aWQoc3RydWN0IGRldmljZV9ub2RlICpjcHVuLCB1bnNpZ25lZCBp
bnQgdGhyZWFkKQoreworCWNvbnN0IF9fYmUzMiAqY2VsbDsKKwlpbnQgYWMsIGxlbjsKKworCWFj
ID0gb2Zfbl9hZGRyX2NlbGxzKGNwdW4pOworCWNlbGwgPSBvZl9nZXRfcHJvcGVydHkoY3B1biwg
InJlZyIsICZsZW4pOworCWlmICghY2VsbCB8fCAhYWMgfHwgKChzaXplb2YoKmNlbGwpICogYWMg
KiAodGhyZWFkICsgMSkpID4gbGVuKSkKKwkJcmV0dXJuIH4wVUxMOworCisJY2VsbCArPSBhYyAq
IHRocmVhZDsKKwlyZXR1cm4gb2ZfcmVhZF9udW1iZXIoY2VsbCwgYWMpOworfQorCiAvKgogICog
YXJjaF9tYXRjaF9jcHVfcGh5c19pZCAtIE1hdGNoIHRoZSBnaXZlbiBsb2dpY2FsIENQVSBhbmQg
cGh5c2ljYWwgaWQKICAqCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L29mLmggYi9pbmNsdWRl
L2xpbnV4L29mLmgKaW5kZXggNmYxYzQxZjEwOWJiLi44MDdmODE2OGRhZDkgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvb2YuaAorKysgYi9pbmNsdWRlL2xpbnV4L29mLmgKQEAgLTM1Myw2ICsz
NTMsNyBAQCBleHRlcm4gc3RydWN0IGRldmljZV9ub2RlICpvZl9nZXRfY3B1X25vZGUoaW50IGNw
dSwgdW5zaWduZWQgaW50ICp0aHJlYWQpOwogZXh0ZXJuIHN0cnVjdCBkZXZpY2Vfbm9kZSAqb2Zf
Z2V0X25leHRfY3B1X25vZGUoc3RydWN0IGRldmljZV9ub2RlICpwcmV2KTsKIGV4dGVybiBzdHJ1
Y3QgZGV2aWNlX25vZGUgKm9mX2dldF9jcHVfc3RhdGVfbm9kZShzdHJ1Y3QgZGV2aWNlX25vZGUg
KmNwdV9ub2RlLAogCQkJCQkJIGludCBpbmRleCk7CitleHRlcm4gdTY0IG9mX2dldF9jcHVfaHdp
ZChzdHJ1Y3QgZGV2aWNlX25vZGUgKmNwdW4sIHVuc2lnbmVkIGludCB0aHJlYWQpOwogCiAjZGVm
aW5lIGZvcl9lYWNoX3Byb3BlcnR5X29mX25vZGUoZG4sIHBwKSBcCiAJZm9yIChwcCA9IGRuLT5w
cm9wZXJ0aWVzOyBwcCAhPSBOVUxMOyBwcCA9IHBwLT5uZXh0KQotLSAKMi4zMC4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

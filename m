Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D7456424303
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:47 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BA34224146;
	Wed,  6 Oct 2021 18:43:47 +0200 (CEST)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mail.librecores.org (Postfix) with ESMTPS id B04E224106
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:45 +0200 (CEST)
Received: by mail-oi1-f176.google.com with SMTP id o4so4810534oia.10
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CN2tRnfV0nmrSbuDbyHoypag3neEaofRCNv6xL7Eiog=;
 b=wDmvQs9lk0T+yxW1BZVVKCTkNrKxpWVzWOcFcXtWPvZDkBE3D4M2jKD45SZY5ZjV9K
 IC4VGrZ0KsB8zYT7sPnsj4/PISf69jMAtyuQB4k3R9iJhnZhPkdbmiaH76YFALBm9MDt
 n7Siyh2lmuningEoSWh+i5bYohMHKE40eb0k4P8Na0dRKm87nOm26Wvr5jc6bj4xbmo4
 eBzgUSrHeru2Z9qcKWF+a7E+LzzOl8wuuuC2i8wkAjz/24lMdb6gnVB5MOaUh9AIYGGY
 CjpaKeXuEiH9rrVwk5ibCubpRrBqPiOpPypX0fMtkiiXZy/U4ecQEkIScOCo41wISF5W
 hIlg==
X-Gm-Message-State: AOAM531NXLL7sB6TR+vMuFz9rKLKIvjhe2dNEAJpVE8rO7/tmAjUZJ/n
 7MQs2epuOG3CrnvQp6xu5A==
X-Google-Smtp-Source: ABdhPJz/z+8TSD/WdWHkwOUMUF3/lnf5Mt7uWOPSGKwTcm1xutcPl6qw5jPqaYPZiNT3CeLWfPqlWg==
X-Received: by 2002:aca:30c9:: with SMTP id w192mr7839682oiw.93.1633538624646; 
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:25 -0500
Message-Id: <20211006164332.1981454-6-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 05/12] csky: Use of_get_cpu_hwid()
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
dGgKb2ZfZ2V0X2NwdV9od2lkKCkuCgpDYzogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+CkNj
OiBsaW51eC1jc2t5QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgotLS0KIGFyY2gvY3NreS9rZXJuZWwvc21wLmMgfCA2ICsrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9hcmNoL2Nza3kva2VybmVsL3NtcC5jIGIvYXJjaC9jc2t5L2tlcm5lbC9zbXAuYwppbmRl
eCBlMjk5MzUzOWFmOGUuLjZiYjM4YmMyZjM5YiAxMDA2NDQKLS0tIGEvYXJjaC9jc2t5L2tlcm5l
bC9zbXAuYworKysgYi9hcmNoL2Nza3kva2VybmVsL3NtcC5jCkBAIC0xODAsMTUgKzE4MCwxMyBA
QCB2b2lkIF9faW5pdCBzZXR1cF9zbXBfaXBpKHZvaWQpCiB2b2lkIF9faW5pdCBzZXR1cF9zbXAo
dm9pZCkKIHsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBOVUxMOwotCWludCBjcHU7CisJ
dW5zaWduZWQgaW50IGNwdTsKIAogCWZvcl9lYWNoX29mX2NwdV9ub2RlKG5vZGUpIHsKIAkJaWYg
KCFvZl9kZXZpY2VfaXNfYXZhaWxhYmxlKG5vZGUpKQogCQkJY29udGludWU7CiAKLQkJaWYgKG9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyZWciLCAmY3B1KSkKLQkJCWNvbnRpbnVlOwotCisJ
CWNwdSA9IG9mX2dldF9jcHVfaHdpZChub2RlLCAwKTsKIAkJaWYgKGNwdSA+PSBOUl9DUFVTKQog
CQkJY29udGludWU7CiAKLS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

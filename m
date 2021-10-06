Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D404B42431E
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:44:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BADB32414C;
	Wed,  6 Oct 2021 18:44:01 +0200 (CEST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by mail.librecores.org (Postfix) with ESMTPS id B987024201
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:59 +0200 (CEST)
Received: by mail-ot1-f45.google.com with SMTP id
 o27-20020a9d411b000000b005453f95356cso2938281ote.11
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ODdwkiH4tXq9GvyXH7/gt65PfkKCS+62hrrbhfBOAKY=;
 b=M7O5LHJiU245+aVUhvpW6LKVCBydR4PsEQpU+UoAtvUYPEEEikYJ1zokkaohE8kS/i
 vK7EQKPrTMgImpZ962doter1iV+zUoUQWolGh8BwTxodDd7Zt55r4ybijBQ9tL/INvJN
 9+3kJ2MDMRSBgbeIqagrDjHcrunUoua0UYsZ8GmbLWxca50hEoPQkWX7bw7rImsn4yQN
 oAw4AvCEIl8r3BkLJaaTcQ0HYJzhqq3+DoU0r3gFV5CoYc8VVm+30hJdilpt2aDXsKZa
 ffagvuvhMOwe2rxi1I5mRby6WhsP/5XNZ1q+PH0837O5b+Sr54cycBQCgS9YoM+CZT0q
 AUIg==
X-Gm-Message-State: AOAM530VIs7s8G3QMDB9LNBuZInf5gXib2aKYcx3T8P5MwCGBcqpPIN9
 LJ8GUsb3iWc3h+tkPBZJGg==
X-Google-Smtp-Source: ABdhPJyKbg8/vmyrEytsmwBD61hnJT/KfL8RD1L+0+jj33vwvFOqRG7dPOrAYWXK5lnk+W9TvgzSoQ==
X-Received: by 2002:a05:6830:1ad3:: with SMTP id
 r19mr19253078otc.98.1633538638626; 
 Wed, 06 Oct 2021 09:43:58 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:32 -0500
Message-Id: <20211006164332.1981454-13-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 12/12] cacheinfo: Set cache 'id' based on DT data
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

VXNlIHRoZSBtaW5pbXVtIENQVSBoL3cgaWQgb2YgdGhlIENQVXMgYXNzb2NpYXRlZCB3aXRoIHRo
ZSBjYWNoZSBmb3IgdGhlCmNhY2hlICdpZCcuIFRoaXMgd2lsbCBwcm92aWRlIGEgc3RhYmxlIGlk
IHZhbHVlIGZvciBhIGdpdmVuIHN5c3RlbS4gQXMKd2UgbmVlZCB0byBjaGVjayBhbGwgcG9zc2li
bGUgQ1BVcywgd2UgY2FuJ3QgdXNlIHRoZSBzaGFyZWRfY3B1X21hcAp3aGljaCBpcyBqdXN0IG9u
bGluZSBDUFVzLiBBcyB0aGVyZSdzIG5vdCBhIGNhY2hlIHRvIENQVXMgbWFwcGluZyBpbiBEVCwK
d2UgaGF2ZSB0byB3YWxrIGFsbCBDUFUgbm9kZXMgYW5kIHRoZW4gd2FsayBjYWNoZSBsZXZlbHMu
CgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6
ICJSYWZhZWwgSi4gV3lzb2NraSIgPHJhZmFlbEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvYmFzZS9jYWNoZWluZm8u
YyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9jYWNoZWluZm8uYyBiL2RyaXZl
cnMvYmFzZS9jYWNoZWluZm8uYwppbmRleCA2NmQxMGJkYjg2M2IuLjQ0NTQ3ZmQ5NmY3MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9iYXNlL2NhY2hlaW5mby5jCisrKyBiL2RyaXZlcnMvYmFzZS9jYWNo
ZWluZm8uYwpAQCAtMTM2LDYgKzEzNiwzMSBAQCBzdGF0aWMgYm9vbCBjYWNoZV9ub2RlX2lzX3Vu
aWZpZWQoc3RydWN0IGNhY2hlaW5mbyAqdGhpc19sZWFmLAogCXJldHVybiBvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2wobnAsICJjYWNoZS11bmlmaWVkIik7CiB9CiAKK3N0YXRpYyB2b2lkIGNhY2hlX29m
X3NldF9pZChzdHJ1Y3QgY2FjaGVpbmZvICp0aGlzX2xlYWYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnApCit7CisJc3RydWN0IGRldmljZV9ub2RlICpjcHU7CisJdW5zaWduZWQgbG9uZyBtaW5faWQg
PSB+MFVMOworCisJZm9yX2VhY2hfb2ZfY3B1X25vZGUoY3B1KSB7CisJCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqY2FjaGVfbm9kZSA9IGNwdTsKKwkJdTY0IGlkID0gb2ZfZ2V0X2NwdV9od2lkKGNhY2hl
X25vZGUsIDApOworCisJCXdoaWxlICgoY2FjaGVfbm9kZSA9IG9mX2ZpbmRfbmV4dF9jYWNoZV9u
b2RlKGNhY2hlX25vZGUpKSkgeworCQkJaWYgKChjYWNoZV9ub2RlID09IG5wKSAmJiAoaWQgPCBt
aW5faWQpKSB7CisJCQkJbWluX2lkID0gaWQ7CisJCQkJb2Zfbm9kZV9wdXQoY2FjaGVfbm9kZSk7
CisJCQkJYnJlYWs7CisJCQl9CisJCQlvZl9ub2RlX3B1dChjYWNoZV9ub2RlKTsKKwkJfQorCX0K
KworCWlmIChtaW5faWQgIT0gfjBVTCkgeworCQl0aGlzX2xlYWYtPmlkID0gbWluX2lkOworCQl0
aGlzX2xlYWYtPmF0dHJpYnV0ZXMgfD0gQ0FDSEVfSUQ7CisJfQorfQorCiBzdGF0aWMgdm9pZCBj
YWNoZV9vZl9zZXRfcHJvcHMoc3RydWN0IGNhY2hlaW5mbyAqdGhpc19sZWFmLAogCQkJICAgICAg
IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiB7CkBAIC0xNTEsNiArMTc2LDcgQEAgc3RhdGljIHZv
aWQgY2FjaGVfb2Zfc2V0X3Byb3BzKHN0cnVjdCBjYWNoZWluZm8gKnRoaXNfbGVhZiwKIAljYWNo
ZV9nZXRfbGluZV9zaXplKHRoaXNfbGVhZiwgbnApOwogCWNhY2hlX25yX3NldHModGhpc19sZWFm
LCBucCk7CiAJY2FjaGVfYXNzb2NpYXRpdml0eSh0aGlzX2xlYWYpOworCWNhY2hlX29mX3NldF9p
ZCh0aGlzX2xlYWYsIG5wKTsKIH0KIAogc3RhdGljIGludCBjYWNoZV9zZXR1cF9vZl9ub2RlKHVu
c2lnbmVkIGludCBjcHUpCi0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

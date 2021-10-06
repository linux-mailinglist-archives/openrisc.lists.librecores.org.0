Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFE4424319
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7A63724200;
	Wed,  6 Oct 2021 18:43:59 +0200 (CEST)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by mail.librecores.org (Postfix) with ESMTPS id C996E241FD
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:57 +0200 (CEST)
Received: by mail-oi1-f170.google.com with SMTP id x187so2465871oix.9
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hDUPVdWmFpBgvCkQTCBoljrAdHSMkkZBVQWsyUTyf5E=;
 b=7VOhdt7xo5sQlW6DNpChC1a8dD7pTWako6mgbSu9SfPP8VVXVnm4uc3lfIDjlQecIV
 Giqjhkpex0fG205FWdUnuqXSSn9/Y7liGMpALEc5dMzQxOGTJXKVTVbD/OManPP5OhlZ
 5flaJKmVXkFJBUvCECXvseT0wz7oX5ZA7lJ46EeH00sVtT3GXmJ21IXv7wYuXivGz8e3
 Xrog8QhxERG9XSgOu4COu5qIugLO8iwUlwRt5Cy5RYjY3juIbOiN4VjF3RIoX5GPpROn
 rtcyC9ET27VXVekLjRMf5mmVeLHHL9Vuib96Y53JeDOXLZky1mb4Zt5YL4eQuwmuUOk7
 BkLw==
X-Gm-Message-State: AOAM533lbH+IEuokJF8Jmk7wiWT7Boe9fuJMYKpheOH+mRbZ22Cco2+M
 /QtYRKotjvmWYEQSppvsBQ==
X-Google-Smtp-Source: ABdhPJzdKu+vPdU6QOPaibRhZZ8V3BXWev73rJIyB9NkWGThVarWr5zcXuesMdXl3XDSlz8SwXuIcg==
X-Received: by 2002:a54:4f8f:: with SMTP id g15mr7727342oiy.178.1633538636692; 
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:56 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:31 -0500
Message-Id: <20211006164332.1981454-12-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 11/12] cacheinfo: Allow for >32-bit cache 'id'
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

SW4gcHJlcGFyYXRpb24gdG8gc2V0IHRoZSBjYWNoZSAnaWQnIGJhc2VkIG9uIHRoZSBDUFUgaC93
IGlkcywgYWxsb3cgZm9yCjY0LWJpdCBiaXQgJ2lkJyB2YWx1ZS4gVGhlIG9ubHkgY2FzZSB0aGF0
IG5lZWRzIHRoaXMgaXMgYXJtNjQsIHNvCnVuc2lnbmVkIGxvbmcgaXMgc3VmZmljaWVudC4KCkNj
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogIlJh
ZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9iYXNlL2NhY2hlaW5mby5jICB8
IDggKysrKysrKy0KIGluY2x1ZGUvbGludXgvY2FjaGVpbmZvLmggfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jhc2UvY2FjaGVpbmZvLmMgYi9kcml2ZXJzL2Jhc2UvY2FjaGVpbmZvLmMKaW5kZXggZGFk
Mjk2MjI5MTYxLi42NmQxMGJkYjg2M2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmFzZS9jYWNoZWlu
Zm8uYworKysgYi9kcml2ZXJzL2Jhc2UvY2FjaGVpbmZvLmMKQEAgLTM2NiwxMyArMzY2LDE5IEBA
IHN0YXRpYyBzc2l6ZV90IGZpbGVfbmFtZSMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJXAog
CXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiV1XG4iLCB0aGlzX2xlYWYtPm9iamVjdCk7CVwKIH0K
IAotc2hvd19vbmUoaWQsIGlkKTsKIHNob3dfb25lKGxldmVsLCBsZXZlbCk7CiBzaG93X29uZShj
b2hlcmVuY3lfbGluZV9zaXplLCBjb2hlcmVuY3lfbGluZV9zaXplKTsKIHNob3dfb25lKG51bWJl
cl9vZl9zZXRzLCBudW1iZXJfb2Zfc2V0cyk7CiBzaG93X29uZShwaHlzaWNhbF9saW5lX3BhcnRp
dGlvbiwgcGh5c2ljYWxfbGluZV9wYXJ0aXRpb24pOwogc2hvd19vbmUod2F5c19vZl9hc3NvY2lh
dGl2aXR5LCB3YXlzX29mX2Fzc29jaWF0aXZpdHkpOwogCitzdGF0aWMgc3NpemVfdCBpZF9zaG93
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIg
KmJ1ZikKK3sKKwlzdHJ1Y3QgY2FjaGVpbmZvICp0aGlzX2xlYWYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKKworCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVsdVxuIiwgdGhpc19sZWFmLT5pZCk7
Cit9CisKIHN0YXRpYyBzc2l6ZV90IHNpemVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQkg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKIHsKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvY2FjaGVpbmZvLmggYi9pbmNsdWRlL2xpbnV4L2NhY2hlaW5mby5oCmlu
ZGV4IDJmOTA5ZWQwODRjNi4uYjJlN2YzZTQwMjA0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2NhY2hlaW5mby5oCisrKyBiL2luY2x1ZGUvbGludXgvY2FjaGVpbmZvLmgKQEAgLTQ4LDcgKzQ4
LDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGludCBjb2hlcmVuY3lfbWF4X3NpemU7CiAgKiBrZWVwaW5n
LCB0aGUgcmVtYWluaW5nIG1lbWJlcnMgZm9ybSB0aGUgY29yZSBwcm9wZXJ0aWVzIG9mIHRoZSBj
YWNoZQogICovCiBzdHJ1Y3QgY2FjaGVpbmZvIHsKLQl1bnNpZ25lZCBpbnQgaWQ7CisJdW5zaWdu
ZWQgbG9uZyBpZDsKIAllbnVtIGNhY2hlX3R5cGUgdHlwZTsKIAl1bnNpZ25lZCBpbnQgbGV2ZWw7
CiAJdW5zaWduZWQgaW50IGNvaGVyZW5jeV9saW5lX3NpemU7Ci0tIAoyLjMwLjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

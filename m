Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 252574242EF
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 18:43:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A61B22403C;
	Wed,  6 Oct 2021 18:43:37 +0200 (CEST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mail.librecores.org (Postfix) with ESMTPS id 87AFB211D5
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 18:43:36 +0200 (CEST)
Received: by mail-oi1-f175.google.com with SMTP id y207so1679118oia.11
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 09:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jBzMvIMgnR7M/3yhI7B+vslrQk5E3C0Pdi0d+USOXmM=;
 b=vAHC9OiwhBLDHqDIkPhnlyJ5fOg4sIl/GjlcG9sGBNguMGLNBfKXh2CbdLukS85M3T
 Vq8zuEtVM7BlXl4fWYCaceYDo+Q+bgUgLipMtfiVkkS1KJKkxal2zHHM7dchUQCBMFMZ
 mLX/ZBbnDb1bUcYL1vnEIqpyXSjeasWqsZBda2wY6Ah8e334Duvl2g1Fl2R2W76KKxsh
 djXA+jSoczgZWQfKTYTp+zzDmaxRHzbrBBmFB7eyEv9doImqZhomvlJrzNziuohB9Wl0
 swvNmwj9S5sb7O0FndeIGbyYkvyXrl/2h/+8IsEtqNlGeuECYegLZiuMGJaulE9uITla
 jzGw==
X-Gm-Message-State: AOAM532l/M8jMetMM3xONZSuotHLoBpvWhwM5qV3FS3qJU4AjPiqwHIG
 v0DmVoNt35L0ASdgsbNljQ==
X-Google-Smtp-Source: ABdhPJx7CXhXT5M1W0CAhtBp2h8eMcQ5I0cRndKVwy8olo5SejcUQh3JemHdw8Jrz5VsbxC5vFcqCA==
X-Received: by 2002:a05:6808:2221:: with SMTP id
 bd33mr8117373oib.64.1633538615382; 
 Wed, 06 Oct 2021 09:43:35 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:34 -0700 (PDT)
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
Date: Wed,  6 Oct 2021 11:43:20 -0500
Message-Id: <20211006164332.1981454-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH 00/12] DT: CPU h/w id parsing clean-ups and
 cacheinfo id support
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

VGhlIGZpcnN0IDEwIHBhdGNoZXMgYWRkIGEgbmV3IGZ1bmN0aW9uLCBvZl9nZXRfY3B1X2h3aWQo
KSwgd2hpY2ggcGFyc2VzCkNQVSBEVCBub2RlICdyZWcnIHByb3BlcnR5LCBhbmQgdGhlbiB1c2Ug
aXQgdG8gcmVwbGFjZSBhbGwgdGhlIG9wZW4KY29kZWQgdmVyc2lvbnMgb2YgcGFyc2luZyBDUFUg
bm9kZSAncmVnJyBwcm9wZXJ0aWVzLgoKVGhlIGxhc3QgMiBwYXRjaGVzIGFkZCBzdXBwb3J0IGZv
ciBwb3B1bGF0aW5nIHRoZSBjYWNoZWluZm8gJ2lkJyBvbiBEVApwbGF0Zm9ybXMuIFRoZSBtaW5p
bXVtIGFzc29jaWF0ZWQgQ1BVIGh3aWQgaXMgdXNlZCBmb3IgdGhlIGlkLiBUaGUgaWQgaXMKb3B0
aW9uYWwsIGJ1dCBuZWNlc3NhcnkgZm9yIHJlc2N0cmwgd2hpY2ggaXMgYmVpbmcgYWRhcHRlZCBm
b3IgQXJtIE1QQU0uCgpUZXN0ZWQgb24gYXJtNjQuIENvbXBpbGUgdGVzdGVkIG9uIGFybSwgeDg2
IGFuZCBwb3dlcnBjLgoKUm9iCgpSb2IgSGVycmluZyAoMTIpOgogIG9mOiBBZGQgb2ZfZ2V0X2Nw
dV9od2lkKCkgdG8gcmVhZCBoYXJkd2FyZSBJRCBmcm9tIENQVSBub2RlcwogIEFSTTogVXNlIG9m
X2dldF9jcHVfaHdpZCgpCiAgQVJNOiBicm9hZGNvbTogVXNlIG9mX2dldF9jcHVfaHdpZCgpCiAg
YXJtNjQ6IFVzZSBvZl9nZXRfY3B1X2h3aWQoKQogIGNza3k6IFVzZSBvZl9nZXRfY3B1X2h3aWQo
KQogIG9wZW5yaXNjOiBVc2Ugb2ZfZ2V0X2NwdV9od2lkKCkKICBwb3dlcnBjOiBVc2Ugb2ZfZ2V0
X2NwdV9od2lkKCkKICByaXNjdjogVXNlIG9mX2dldF9jcHVfaHdpZCgpCiAgc2g6IFVzZSBvZl9n
ZXRfY3B1X2h3aWQoKQogIHg4NjogZHQ6IFVzZSBvZl9nZXRfY3B1X2h3aWQoKQogIGNhY2hlaW5m
bzogQWxsb3cgZm9yID4zMi1iaXQgY2FjaGUgJ2lkJwogIGNhY2hlaW5mbzogU2V0IGNhY2hlICdp
ZCcgYmFzZWQgb24gRFQgZGF0YQoKIGFyY2gvYXJtL2tlcm5lbC9kZXZ0cmVlLmMgICAgICAgfCAy
MiArKy0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvYXJtL21hY2gtYmNtL2JjbTYzeHhfcG1iLmMg
fCAgNiArKystLS0KIGFyY2gvYXJtNjQva2VybmVsL3NtcC5jICAgICAgICAgfCAzMSArKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvY3NreS9rZXJuZWwvc21wLmMgICAgICAgICAg
fCAgNiArKy0tLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jICAgICAgfCAgNiArLS0tLS0K
IGFyY2gvcG93ZXJwYy9rZXJuZWwvc21wLmMgICAgICAgfCAgNyArLS0tLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHUuYyAgICAgICAgIHwgIDMgKystCiBhcmNoL3NoL2JvYXJkcy9vZi1nZW5lcmlj
LmMgICAgIHwgIDUgKystLS0KIGFyY2gveDg2L2tlcm5lbC9kZXZpY2V0cmVlLmMgICAgfCAgNSAr
Ky0tLQogZHJpdmVycy9iYXNlL2NhY2hlaW5mby5jICAgICAgICB8IDM0ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9vZi9iYXNlLmMgICAgICAgICAgICAgICB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9jYWNoZWluZm8uaCAgICAgICB8
ICAyICstCiBpbmNsdWRlL2xpbnV4L29mLmggICAgICAgICAgICAgIHwgIDEgKwogMTMgZmlsZXMg
Y2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCgotLSAKMi4zMC4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

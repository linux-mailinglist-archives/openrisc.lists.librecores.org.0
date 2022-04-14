Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E4BEE501DF4
	for <lists+openrisc@lfdr.de>; Fri, 15 Apr 2022 00:05:23 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 93AE4248C9;
	Fri, 15 Apr 2022 00:05:23 +0200 (CEST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id C7F2F2480E
 for <openrisc@lists.librecores.org>; Fri, 15 Apr 2022 00:05:20 +0200 (CEST)
Received: by mail-pl1-f182.google.com with SMTP id n8so5832971plh.1
 for <openrisc@lists.librecores.org>; Thu, 14 Apr 2022 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=fGuiIocTsGNeGfljFQBqIaq8z11faA06QmkOS1ZNMsM=;
 b=R6qB8EHjaJgSIdCtMKhdYuPkgsZWKZJvItsuxrvYJe66b0kWr5qEcaypbW8fVsbM0X
 FhUqRtspmHufGwN2FALekT8CyXJm5S7kjyMcktlGU1XrpzbtotUCXZuO87tkl8dzpRsU
 rD7GHFid/eI0LZmwYI/csFXmn3CvJN7DaDKvJaMLpPJ/3/P4dIfleHYvn2zvLdnkO4tP
 7bShSmxTBQk2haxc2USQ9dtIjlVAIPg3bDRc+xVXDklpfpHWqfjPqU6sgkCSldEnbFhC
 TWJSMeobIJFf8xFLlsze9XxDtvdwjGCazEbqvvXoqURGpeC9W8m/Vt3E4JkUOM5Z3ckq
 eeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=fGuiIocTsGNeGfljFQBqIaq8z11faA06QmkOS1ZNMsM=;
 b=N2+nBl0Wzcs1goUdfdLKdjyurD0qRmLQmvIBowTuQvy4rgfGg+BMPDdghv8y/7wcWv
 LdOh2hH1peYJ8byeJZWgujweEyft62samD/W/bwoAdDKX1PuhJHTgqSdU1qTKE7Bnxnp
 zQCInM+xHW0hIkkwmvBtz4d+aKpDeHDGrnZ7uor8xjj5pIxmux4E+pAG4+kdTzqc8hht
 jrsGBgW73KnS/CbKE+az7oQQlm2teRI+lxUb1DI51Qs3yiHCmOWfXH8Lo7YXdkDNGqmd
 ZKnqRerqYc/lQ1iYB3+XaIYhEvOUEhqMeu0oSrbBgNxKCgs9p8qkWfNHtTuhDeJ/c5Gd
 2Y1A==
X-Gm-Message-State: AOAM531llfBWaZxJ0aS0pphViTtUFRbgXnks0sdVedCMTNWulfZ/KZz1
 qBHwTZMRJGa2w5pZJVxENdbepA==
X-Google-Smtp-Source: ABdhPJyAzBb8YxpknFCk5JeSfiuwavmwv/MB+OUr9ESYgO7bJCkViBS7KMaonnUZ91p8m5wnAMzoYg==
X-Received: by 2002:a17:90a:4294:b0:1cd:5524:cd6a with SMTP id
 p20-20020a17090a429400b001cd5524cd6amr716857pjg.212.1649973919487; 
 Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0024c500b004fae56b2921sm805319pfv.167.2022.04.14.15.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:19 -0700 (PDT)
Date: Thu, 14 Apr 2022 15:02:11 -0700
Message-Id: <20220414220214.24556-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
Subject: [OpenRISC] [PATCH v3 4/7] openrisc: Move to ticket-spinlock
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
Cc: wangkefeng.wang@huawei.com, peterz@infradead.org,
 Palmer Dabbelt <palmer@rivosinc.com>, jszhang@kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 jonas@southpole.se, linux-csky@vger.kernel.org, mingo@redhat.com,
 longman@redhat.com, linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, boqun.feng@gmail.com,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, sudipm.mukherjee@gmail.com,
 macro@orcam.me.uk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgoKV2UgaGF2ZSBubyBp
bmRpY2F0aW9ucyB0aGF0IG9wZW5yaXNjIG1lZXRzIHRoZSBxc3BpbmxvY2sgcmVxdWlyZW1lbnRz
LApzbyBtb3ZlIHRvIHRpY2tldC1zcGlubG9jayBhcyB0aGF0IGlzIG1vcmUgbGlrZXkgdG8gYmUg
Y29ycmVjdC4KClNpZ25lZC1vZmYtYnk6IFBldGVyIFppamxzdHJhIChJbnRlbCkgPHBldGVyekBp
bmZyYWRlYWQub3JnPgpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL29wZW5yaXNjL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
fCAgMSAtCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL0tidWlsZCAgICAgICAgICAgfCAgNSAr
Ky0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrLmggICAgICAgfCAyNyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5sb2NrX3R5
cGVzLmggfCAgNyAtLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzOCBk
ZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3NwaW5sb2NrLmgKIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNt
L3NwaW5sb2NrX3R5cGVzLmgKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL0tjb25maWcgYi9h
cmNoL29wZW5yaXNjL0tjb25maWcKaW5kZXggMGQ2OGFkZjZlMDJiLi45OWYwZTRhNGNiYmQgMTAw
NjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2MvS2NvbmZpZworKysgYi9hcmNoL29wZW5yaXNjL0tjb25m
aWcKQEAgLTMwLDcgKzMwLDYgQEAgY29uZmlnIE9QRU5SSVNDCiAJc2VsZWN0IEhBVkVfREVCVUdf
U1RBQ0tPVkVSRkxPVwogCXNlbGVjdCBPUjFLX1BJQwogCXNlbGVjdCBDUFVfTk9fRUZGSUNJRU5U
X0ZGUyBpZiAhT1BFTlJJU0NfSEFWRV9JTlNUX0ZGMQotCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURf
U1BJTkxPQ0tTCiAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9SV0xPQ0tTCiAJc2VsZWN0IE9NUElD
IGlmIFNNUAogCXNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKZGlmZiAtLWdpdCBhL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2Fz
bS9LYnVpbGQKaW5kZXggY2E1OTg3ZTExMDUzLi4zMzg2YjljMWMwNzMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vS2J1aWxkCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVk
ZS9hc20vS2J1aWxkCkBAIC0xLDkgKzEsOCBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMAogZ2VuZXJpYy15ICs9IGV4dGFibGUuaAogZ2VuZXJpYy15ICs9IGt2bV9wYXJhLmgK
LWdlbmVyaWMteSArPSBtY3Nfc3BpbmxvY2suaAotZ2VuZXJpYy15ICs9IHFzcGlubG9ja190eXBl
cy5oCi1nZW5lcmljLXkgKz0gcXNwaW5sb2NrLmgKK2dlbmVyaWMteSArPSBzcGlubG9ja190eXBl
cy5oCitnZW5lcmljLXkgKz0gc3BpbmxvY2suaAogZ2VuZXJpYy15ICs9IHFyd2xvY2tfdHlwZXMu
aAogZ2VuZXJpYy15ICs9IHFyd2xvY2suaAogZ2VuZXJpYy15ICs9IHVzZXIuaApkaWZmIC0tZ2l0
IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9zcGlubG9jay5oIGIvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9zcGlubG9jay5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyNjQ5
NDRhNzE1MzUuLjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3Nw
aW5sb2NrLmgKKysrIC9kZXYvbnVsbApAQCAtMSwyNyArMCwwIEBACi0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlciAqLwotLyoKLSAqIE9wZW5SSVNDIExpbnV4Ci0g
KgotICogTGludXggYXJjaGl0ZWN0dXJhbCBwb3J0IGJvcnJvd2luZyBsaWJlcmFsbHkgZnJvbSBz
aW1pbGFyIHdvcmtzIG9mCi0gKiBvdGhlcnMuICBBbGwgb3JpZ2luYWwgY29weXJpZ2h0cyBhcHBs
eSBhcyBwZXIgdGhlIG9yaWdpbmFsIHNvdXJjZQotICogZGVjbGFyYXRpb24uCi0gKgotICogT3Bl
blJJU0MgaW1wbGVtZW50YXRpb246Ci0gKiBDb3B5cmlnaHQgKEMpIDIwMDMgTWF0amF6IEJyZXNr
dmFyIDxwaG9lbml4QGJzZW1pLmNvbT4KLSAqIENvcHlyaWdodCAoQykgMjAxMC0yMDExIEpvbmFz
IEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KLSAqIGV0IGFsLgotICovCi0KLSNpZm5kZWYgX19B
U01fT1BFTlJJU0NfU1BJTkxPQ0tfSAotI2RlZmluZSBfX0FTTV9PUEVOUklTQ19TUElOTE9DS19I
Ci0KLSNpbmNsdWRlIDxhc20vcXNwaW5sb2NrLmg+Ci0KLSNpbmNsdWRlIDxhc20vcXJ3bG9jay5o
PgotCi0jZGVmaW5lIGFyY2hfc3Bpbl9yZWxheChsb2NrKQljcHVfcmVsYXgoKQotI2RlZmluZSBh
cmNoX3JlYWRfcmVsYXgobG9jaykJY3B1X3JlbGF4KCkKLSNkZWZpbmUgYXJjaF93cml0ZV9yZWxh
eChsb2NrKQljcHVfcmVsYXgoKQotCi0KLSNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlz
Yy9pbmNsdWRlL2FzbS9zcGlubG9ja190eXBlcy5oIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2Fz
bS9zcGlubG9ja190eXBlcy5oCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA3YzZmYjEy
MDhjODguLjAwMDAwMDAwMDAwMAotLS0gYS9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3NwaW5s
b2NrX3R5cGVzLmgKKysrIC9kZXYvbnVsbApAQCAtMSw3ICswLDAgQEAKLSNpZm5kZWYgX0FTTV9P
UEVOUklTQ19TUElOTE9DS19UWVBFU19ICi0jZGVmaW5lIF9BU01fT1BFTlJJU0NfU1BJTkxPQ0tf
VFlQRVNfSAotCi0jaW5jbHVkZSA8YXNtL3FzcGlubG9ja190eXBlcy5oPgotI2luY2x1ZGUgPGFz
bS9xcndsb2NrX3R5cGVzLmg+Ci0KLSNlbmRpZiAvKiBfQVNNX09QRU5SSVNDX1NQSU5MT0NLX1RZ
UEVTX0ggKi8KLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

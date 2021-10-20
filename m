Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9AC4352F5
	for <lists+openrisc@lfdr.de>; Wed, 20 Oct 2021 20:48:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B334724215;
	Wed, 20 Oct 2021 20:48:06 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 5E2EA24105
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 20:48:05 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81D8061212
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634755683;
 bh=n8VrOe4I2yKWKENo2xOz+GrW26l+tosuZNQ1rYD5gKE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X8tKojH7Z8fdPyVTk4z+AoVAS3a9h5oYDEVDa7uI3b3vQWDC0RDkopnsSuFW09wMx
 S5ymoCHlxw+BZDcfi8a/SbXyaru92R/D/4JVacWcGVpk2lCHkMZKGKNpRCcpV4amQE
 0SC95mBmBf+xrbZsPKYOZ3Tw+i6Awvb4CDoD4fADso7xeFCGtNQbQjFeERWiYt5J4a
 XviC1MWcQkWkyhnJbBbb7MhB9KdUgixAetlN+ZjGulMI+TYlz6yOX8pi/IJu8QIrAm
 DPTPSRiUO2vc4Q2/LyUL9rJoQfRdVbdcu/SicgghaP/nLNsd5aIhVOahGYlBk3gw4h
 jokZEwKpwMQ/g==
Received: by mail-lf1-f51.google.com with SMTP id g36so328224lfv.3
 for <openrisc@lists.librecores.org>; Wed, 20 Oct 2021 11:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM533/BAkeK6IhlbqJ00DNrQLO4FgCaw3XJjbeabkifVCYYpjjQLm4
 WaqwPnV02YbKwx2pp0SLALPSykp6nMBX5eEgTA==
X-Google-Smtp-Source: ABdhPJyDkQcU37hcsbyKe6namKZuEksRA+CPb1y/N+dx0XKOp77yba3905ZumF5lcfjyaXaZElnjUUGJ+2NqhJwXc9g=
X-Received: by 2002:aa7:cd0a:: with SMTP id b10mr942298edw.164.1634755670808; 
 Wed, 20 Oct 2021 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Oct 2021 13:47:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 X86 ML <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [OpenRISC] [PATCH 00/12] DT: CPU h/w id parsing clean-ups and
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
 SH-Linux <linux-sh@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgNiwgMjAyMSBhdCAxMTo0MyBBTSBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IFRoZSBmaXJzdCAxMCBwYXRjaGVzIGFkZCBhIG5ldyBmdW5jdGlvbiwg
b2ZfZ2V0X2NwdV9od2lkKCksIHdoaWNoIHBhcnNlcwo+IENQVSBEVCBub2RlICdyZWcnIHByb3Bl
cnR5LCBhbmQgdGhlbiB1c2UgaXQgdG8gcmVwbGFjZSBhbGwgdGhlIG9wZW4KPiBjb2RlZCB2ZXJz
aW9ucyBvZiBwYXJzaW5nIENQVSBub2RlICdyZWcnIHByb3BlcnRpZXMuCj4KPiBUaGUgbGFzdCAy
IHBhdGNoZXMgYWRkIHN1cHBvcnQgZm9yIHBvcHVsYXRpbmcgdGhlIGNhY2hlaW5mbyAnaWQnIG9u
IERUCj4gcGxhdGZvcm1zLiBUaGUgbWluaW11bSBhc3NvY2lhdGVkIENQVSBod2lkIGlzIHVzZWQg
Zm9yIHRoZSBpZC4gVGhlIGlkIGlzCj4gb3B0aW9uYWwsIGJ1dCBuZWNlc3NhcnkgZm9yIHJlc2N0
cmwgd2hpY2ggaXMgYmVpbmcgYWRhcHRlZCBmb3IgQXJtIE1QQU0uCj4KPiBUZXN0ZWQgb24gYXJt
NjQuIENvbXBpbGUgdGVzdGVkIG9uIGFybSwgeDg2IGFuZCBwb3dlcnBjLgo+Cj4gUm9iCj4KPiBS
b2IgSGVycmluZyAoMTIpOgo+ICAgb2Y6IEFkZCBvZl9nZXRfY3B1X2h3aWQoKSB0byByZWFkIGhh
cmR3YXJlIElEIGZyb20gQ1BVIG5vZGVzCj4gICBBUk06IFVzZSBvZl9nZXRfY3B1X2h3aWQoKQo+
ICAgQVJNOiBicm9hZGNvbTogVXNlIG9mX2dldF9jcHVfaHdpZCgpCj4gICBhcm02NDogVXNlIG9m
X2dldF9jcHVfaHdpZCgpCj4gICBjc2t5OiBVc2Ugb2ZfZ2V0X2NwdV9od2lkKCkKPiAgIG9wZW5y
aXNjOiBVc2Ugb2ZfZ2V0X2NwdV9od2lkKCkKPiAgIHBvd2VycGM6IFVzZSBvZl9nZXRfY3B1X2h3
aWQoKQo+ICAgcmlzY3Y6IFVzZSBvZl9nZXRfY3B1X2h3aWQoKQo+ICAgc2g6IFVzZSBvZl9nZXRf
Y3B1X2h3aWQoKQo+ICAgeDg2OiBkdDogVXNlIG9mX2dldF9jcHVfaHdpZCgpCj4gICBjYWNoZWlu
Zm86IEFsbG93IGZvciA+MzItYml0IGNhY2hlICdpZCcKPiAgIGNhY2hlaW5mbzogU2V0IGNhY2hl
ICdpZCcgYmFzZWQgb24gRFQgZGF0YQoKSSd2ZSBmaXhlZCB1cCB0aGUgb3BlbnJpc2MgZXJyb3Ig
YW5kIGFwcGxpZWQgMS0xMCB0byB0aGUgRFQgdHJlZS4KClRoZSBjYWNoZWluZm8gcGFydCBpcyBn
b2luZyB0byBuZWVkIHNvbWUgbW9yZSB3b3JrLiBJJ3ZlIGZvdW5kIEkgd2lsbApuZWVkIHRoZSBj
YWNoZSBhZmZpbml0eSAob2YgcG9zc2libGUgY3B1cykgYXMgd2VsbCwgc28gSSBwbGFuIHRvIGFs
c28Kc3RvcmUgdGhlIGFmZmluaXR5IGluc3RlYWQgb2YgbG9vcGluZyB0aHJ1IGNhY2hlcyBhbmQg
Y3B1cyBhZ2Fpbi4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

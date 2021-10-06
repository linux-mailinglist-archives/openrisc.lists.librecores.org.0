Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BC03C424881
	for <lists+openrisc@lfdr.de>; Wed,  6 Oct 2021 23:09:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6995E241A3;
	Wed,  6 Oct 2021 23:09:06 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 82DD2240F1
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 23:09:04 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C63C361177
 for <openrisc@lists.librecores.org>; Wed,  6 Oct 2021 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633554542;
 bh=7y2OqyGeh/YLbNHB3wW+VV17BTzd0SdtkHXCJgfSaiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=broTUrrlFiLEzw1V1KzqJl3cjITvNqn8fuEk42SbT6TOR0Idnr3Wvw0BoG0aE0XuK
 NcpZbDNChXN5OOm6Ht7gYg7ZqR5OmZTcfjSzeNJPRg5cOCMbxZr7joE/D0yEs5pSX7
 F6alwzWwl4jZJjHSLNJ16AL9sS7C3JKfDDqnlFebb4Ue/y4PFm2G7NOIciGL8rG0+j
 kKeZDu8KP9lnqWGFDFTpdF2tScH7ckPbtPihCtX8t+0miILAe0Nj8i5SmOPEIDCtkc
 6vimnh2FYEuku4Zh1t+GlHrloVdffSs/V1GeuzJwGJWGcqAOcnZovErMBgw7nd29RK
 UA/OZl+re6dPA==
Received: by mail-wr1-f49.google.com with SMTP id t2so12613093wrb.8
 for <openrisc@lists.librecores.org>; Wed, 06 Oct 2021 14:09:02 -0700 (PDT)
X-Gm-Message-State: AOAM531UXYOwH2QwKfBQhK25pH9cSvCOcyciyIPv1Z+McyH58zuQJV6/
 m2vJLK83Ncl5Uxq4ZtnsPGB8dHitHJW169XAVw==
X-Google-Smtp-Source: ABdhPJymkbNsN9aT73y46BJl6usZeJjKrfNWWvIOkuSTs2FD7IqIC9KCjaQE7Xpsh+yBqmdTH3WZm/Iyih4k6MZ6upc=
X-Received: by 2002:a05:6402:44c:: with SMTP id
 p12mr678627edw.145.1633554530546; 
 Wed, 06 Oct 2021 14:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
In-Reply-To: <YV4KkAC2p9D4yCnH@antec>
From: Rob Herring <robh@kernel.org>
Date: Wed, 6 Oct 2021 16:08:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
Message-ID: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 SH-Linux <linux-sh@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, Openrisc <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgNiwgMjAyMSBhdCAzOjQ0IFBNIFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDA2LCAyMDIxIGF0IDExOjQzOjI2QU0gLTA1
MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gUmVwbGFjZSBvcGVuIGNvZGVkIHBhcnNpbmcgb2Yg
Q1BVIG5vZGVzJyAncmVnJyBwcm9wZXJ0eSB3aXRoCj4gPiBvZl9nZXRfY3B1X2h3aWQoKS4KPiA+
Cj4gPiBDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+ID4gQ2M6IFN0ZWZhbiBL
cmlzdGlhbnNzb24gPHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KPiA+IENjOiBT
dGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiA+IENjOiBvcGVucmlzY0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIHwgNiArLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NtcC5jIGIvYXJjaC9vcGVucmlz
Yy9rZXJuZWwvc21wLmMKPiA+IGluZGV4IDQxNWUyMDk3MzJhMy4uN2Q1YTRmMzAzYTVhIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc21wLmMKPiA+ICsrKyBiL2FyY2gvb3Bl
bnJpc2Mva2VybmVsL3NtcC5jCj4gPiBAQCAtNjUsMTEgKzY1LDcgQEAgdm9pZCBfX2luaXQgc21w
X2luaXRfY3B1cyh2b2lkKQo+ID4gICAgICAgdTMyIGNwdV9pZDsKPiA+Cj4gPiAgICAgICBmb3Jf
ZWFjaF9vZl9jcHVfbm9kZShjcHUpIHsKPiA+IC0gICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5
X3JlYWRfdTMyKGNwdSwgInJlZyIsICZjcHVfaWQpKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgcHJfd2FybigiJXMgbWlzc2luZyByZWcgcHJvcGVydHkiLCBjcHUtPmZ1bGxfbmFtZSk7Cj4g
PiAtICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAtICAgICAgICAgICAgIH0KPiA+
IC0KPiA+ICsgICAgICAgICAgICAgY3B1X2lkID0gb2ZfZ2V0X2NwdV9od2lkKGNwdSk7CgpPb3Bz
LCB0aGF0IHNob3VsZCBiZTogb2ZfZ2V0X2NwdV9od2lkKGNwdSwgMCk7CgpJIHRob3VnaHQgSSBk
b3VibGUgY2hlY2tlZCBhbGwgdGhvc2UuLi4KCj4gWW91IGhhdmUgZGVmaW5lZCBvZl9nZXRfY3B1
X2h3aWQgdG8gcmV0dXJuIHU2NCwgd2lsbCB0aGlzIGNyZWF0ZSBjb21waWxlcgo+IHdhcm5pbmdz
IHdoZW4gc2luY2Ugd2UgYXJlIHN0b3JpbmcgYSB1NjQgaW50byBhIHUzMj8KCkknbSBjb3VudGlu
ZyBvbiB0aGUgY2FsbGVyIHRvIGtub3cgdGhlIG1heCBzaXplIGZvciB0aGVpciBwbGF0Zm9ybS4K
Cj4KPiBJdCBzZWVtcyBvbmx5IGlmIHdlIG1ha2Ugd2l0aCBXPTMuCj4KPiBJIHRob3VnaHQgd2Ug
dXN1YWxseSB3YXJuZWQgb24gdGhpcy4gIE9oIHdlbGwsIGZvciB0aGUgb3BlbnJpc2MgYml0cy4K
ClRoYXQncyBvbmx5IG9uIHB0ciB0cnVuY2F0aW9uIEkgdGhpbmsuCgo+IEFja2VkLWJ5OiBTdGFm
Zm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPgo+ID4gICAgICAgICAgICAgICBpZiAoY3B1
X2lkIDwgTlJfQ1BVUykKPiA+ICAgICAgICAgICAgICAgICAgICAgICBzZXRfY3B1X3Bvc3NpYmxl
KGNwdV9pZCwgdHJ1ZSk7Cj4gPiAgICAgICB9Cj4gPiAtLQo+ID4gMi4zMC4yCj4gPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 65372424EAA
	for <lists+openrisc@lfdr.de>; Thu,  7 Oct 2021 10:08:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C0EDE241A4;
	Thu,  7 Oct 2021 10:08:10 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6185D2418D
 for <openrisc@lists.librecores.org>; Thu,  7 Oct 2021 10:08:09 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A63A161354;
 Thu,  7 Oct 2021 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633594088;
 bh=dm9/vpPW4I/oLlWZ3sN+YDm0nseIyiNdiq2BmTSzlNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G8wrvs97fHfdiL5l1GNqfBsj5WSvMC2CgUNRkAD9lWilsADRiRDh393GWk3HUn3Ts
 vM8d9uccvuv8G5TMLMWf1winBoFuEDY3PrhNdg3gcjr+GBL7pd3oBmM1mAkTUFkoSI
 w8Z+IjERciMgdML4PF+krqxXeBNo08oiouFvkZn2vMvUYgTzZTKdT5c69xX8qW1K+h
 b2l74TEajI8beXDoYksoK4Cx+j/QDC47jIPwSUGr87wY62bC9610e0qQsUW+K3OPGm
 u1cEgxGh9gh5goTfjXOtts91pNmMR0FxKVGHPwbVS74rMsnljpa216ovjPWLt40afS
 ETw3OdvPPVNwg==
Date: Thu, 7 Oct 2021 09:07:59 +0100
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20211007080758.GA31467@willie-the-truck>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-5-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-5-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] [PATCH 04/12] arm64: Use of_get_cpu_hwid()
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMTE6NDM6MjRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gUmVwbGFjZSB0aGUgb3BlbiBjb2RlZCBwYXJzaW5nIG9mIENQVSBub2RlcycgJ3JlZycg
cHJvcGVydHkgd2l0aAo+IG9mX2dldF9jcHVfaHdpZCgpLgo+IAo+IFRoaXMgY2hhbmdlIGRyb3Bz
IGFuIGVycm9yIG1lc3NhZ2UgZm9yIG1pc3NpbmcgJ3JlZycgcHJvcGVydHksIGJ1dCB0aGF0Cj4g
c2hvdWxkIG5vdCBiZSBuZWNlc3NhcnkgYXMgdGhlIERUIHRvb2xzIHdpbGwgZW5zdXJlICdyZWcn
IGlzIHByZXNlbnQuCj4gCj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFy
bS5jb20+Cj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9hcm02NC9rZXJu
ZWwvc21wLmMgfCAzMSArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKQWNrZWQtYnk6IFdpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CgpJdCdzIGEgc2hhbWUgSU5WQUxJRF9IV0lEIGNhbid0
IGJlIHJlbW92ZWQgdG9vLCBidXQgbG9va3MgbGlrZSBpdCdzIHN0aWxsCnVzZWQgaW4gYSBjb3Vw
bGUgb2YgcGxhY2VzLgoKV2lsbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

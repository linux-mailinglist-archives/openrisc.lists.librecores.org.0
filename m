Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CD6F0432977
	for <lists+openrisc@lfdr.de>; Tue, 19 Oct 2021 00:02:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0335024213;
	Tue, 19 Oct 2021 00:02:41 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 977E924047
 for <openrisc@lists.librecores.org>; Mon, 18 Oct 2021 15:31:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF88911B3;
 Mon, 18 Oct 2021 06:31:37 -0700 (PDT)
Received: from bogus (unknown [10.57.25.56])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BFB93F73D;
 Mon, 18 Oct 2021 06:31:30 -0700 (PDT)
Date: Mon, 18 Oct 2021 14:31:27 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <20211018133127.4oenrvzxwzn73s3k@bogus>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-13-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006164332.1981454-13-robh@kernel.org>
X-Mailman-Approved-At: Tue, 19 Oct 2021 00:02:38 +0200
Subject: Re: [OpenRISC] [PATCH 12/12] cacheinfo: Set cache 'id' based on DT
 data
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
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMDYsIDIwMjEgYXQgMTE6NDM6MzJBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gVXNlIHRoZSBtaW5pbXVtIENQVSBoL3cgaWQgb2YgdGhlIENQVXMgYXNzb2NpYXRlZCB3
aXRoIHRoZSBjYWNoZSBmb3IgdGhlCj4gY2FjaGUgJ2lkJy4gVGhpcyB3aWxsIHByb3ZpZGUgYSBz
dGFibGUgaWQgdmFsdWUgZm9yIGEgZ2l2ZW4gc3lzdGVtLiBBcwo+IHdlIG5lZWQgdG8gY2hlY2sg
YWxsIHBvc3NpYmxlIENQVXMsIHdlIGNhbid0IHVzZSB0aGUgc2hhcmVkX2NwdV9tYXAKPiB3aGlj
aCBpcyBqdXN0IG9ubGluZSBDUFVzLiBBcyB0aGVyZSdzIG5vdCBhIGNhY2hlIHRvIENQVXMgbWFw
cGluZyBpbiBEVCwKPiB3ZSBoYXZlIHRvIHdhbGsgYWxsIENQVSBub2RlcyBhbmQgdGhlbiB3YWxr
IGNhY2hlIGxldmVscy4KPiAKCkFja2VkLWJ5OiBTdWRlZXAgSG9sbGEgPHN1ZGVlcC5ob2xsYUBh
cm0uY29tPgoKLS0gClJlZ2FyZHMsClN1ZGVlcApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

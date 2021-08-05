Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE053E34FA
	for <lists+openrisc@lfdr.de>; Sat,  7 Aug 2021 12:45:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 117F121390;
	Sat,  7 Aug 2021 12:45:00 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 41DEA20E4D
 for <openrisc@lists.librecores.org>; Thu,  5 Aug 2021 19:36:42 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0683E610A2;
 Thu,  5 Aug 2021 17:36:32 +0000 (UTC)
Date: Thu, 5 Aug 2021 18:36:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20210805173625.GH6719@arm.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805075032.723037-2-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 07 Aug 2021 12:44:58 +0200
Subject: Re: [OpenRISC] [PATCH 1/3] arch: Export machine_restart() instances
 so they can be called from modules
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
Cc: Rich Felker <dalias@libc.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Crispin <john@phrozen.org>, Sebastian Reichel <sre@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBBdWcgMDUsIDIwMjEgYXQgMDg6NTA6MzBBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL2FybTY0
L2tlcm5lbC9wcm9jZXNzLmMKPiBpbmRleCBiNGJiNjdmMTdhMmNhLi5jZjg5Y2U5MWQ3MTQ1IDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvYXJt
NjQva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC0yMTIsNiArMjEyLDcgQEAgdm9pZCBtYWNoaW5lX3Jl
c3RhcnQoY2hhciAqY21kKQo+ICAJcHJpbnRrKCJSZWJvb3QgZmFpbGVkIC0tIFN5c3RlbSBoYWx0
ZWRcbiIpOwo+ICAJd2hpbGUgKDEpOwo+ICB9Cj4gK0VYUE9SVF9TWU1CT0wobWFjaGluZV9yZXN0
YXJ0KTsKClNob3VsZCB3ZSBtYWtlIHRoaXMgRVhQT1JUX1NZTUJPTF9HUEw/IEkgc3VwcG9zZSBp
dCdzIG5vdCBmb3IgZ2VuZXJhbAp1c2UgYnkgb3V0IG9mIHRyZWUgZHJpdmVycyBhbmQgaXQgbWF0
Y2hlcyB0aGUgb3RoZXIgcG1fcG93ZXJfb2ZmIHN5bWJvbAp3ZSBleHBvcnQgaW4gdGhpcyBmaWxl
LgoKRWl0aGVyIHdheToKCkFja2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5h
c0Bhcm0uY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

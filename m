Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 439DF3E1B8E
	for <lists+openrisc@lfdr.de>; Thu,  5 Aug 2021 20:41:31 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E0FD3211D5;
	Thu,  5 Aug 2021 20:41:30 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 89D5E202FC
 for <openrisc@lists.librecores.org>; Thu,  5 Aug 2021 20:41:29 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0F0C60F01;
 Thu,  5 Aug 2021 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1628188887;
 bh=DJstyoIneDhJWe2M45tnolj4HGCE0gCrRv38Ul0FPvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yLSS87676hn106VIngpXBP/rOEU9YnrWCbO+LvhheiKjxKARCwKmpPaCV3EXfwCgP
 eswsJEhyB34IGotQMI4++5xN+H6/H2Zsa8YN4zRquACi04W3hFcBWcF1DF3HWEIxIo
 hfvqM78wNk4u3fnnSgFl6tYnBJF7uBTAQJcXiptc=
Date: Thu, 5 Aug 2021 20:41:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <YQww08x2whx/LIIT@kroah.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
 <20210805173625.GH6719@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805173625.GH6719@arm.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 John Crispin <john@phrozen.org>, Sebastian Reichel <sre@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
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

T24gVGh1LCBBdWcgMDUsIDIwMjEgYXQgMDY6MzY6MjVQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDA1LCAyMDIxIGF0IDA4OjUwOjMwQU0gKzAxMDAsIExlZSBK
b25lcyB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMg
Yi9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+IGluZGV4IGI0YmI2N2YxN2EyY2EuLmNm
ODljZTkxZDcxNDUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMK
PiA+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwo+ID4gQEAgLTIxMiw2ICsyMTIs
NyBAQCB2b2lkIG1hY2hpbmVfcmVzdGFydChjaGFyICpjbWQpCj4gPiAgCXByaW50aygiUmVib290
IGZhaWxlZCAtLSBTeXN0ZW0gaGFsdGVkXG4iKTsKPiA+ICAJd2hpbGUgKDEpOwo+ID4gIH0KPiA+
ICtFWFBPUlRfU1lNQk9MKG1hY2hpbmVfcmVzdGFydCk7Cj4gCj4gU2hvdWxkIHdlIG1ha2UgdGhp
cyBFWFBPUlRfU1lNQk9MX0dQTD8gSSBzdXBwb3NlIGl0J3Mgbm90IGZvciBnZW5lcmFsCj4gdXNl
IGJ5IG91dCBvZiB0cmVlIGRyaXZlcnMgYW5kIGl0IG1hdGNoZXMgdGhlIG90aGVyIHBtX3Bvd2Vy
X29mZiBzeW1ib2wKPiB3ZSBleHBvcnQgaW4gdGhpcyBmaWxlLgoKWWVzIHBsZWFzZS4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

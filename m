Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7212A1D2015
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:55 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 088FC20B81;
	Wed, 13 May 2020 22:17:55 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6D08C202FD
 for <openrisc@lists.librecores.org>; Wed, 13 May 2020 07:21:52 +0200 (CEST)
Received: from kernel.org (unknown [87.70.20.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06A0920675;
 Wed, 13 May 2020 05:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589347309;
 bh=eXxsFWMRwsjxCxIEwZvSMlzVp4JoExGumCwVZGQ437k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C67nj68nb/WBhkQSlanqvNkuKuI8DtxJ9ZixH0J1b2BuEaAk5a5wNzO7jtcEk7q0p
 JlpDcwhtcaCA3Vi5e8fc7aXovPbaDZ6qYnKJdRNeliw/je8Bz0w2ebGvIUy/BChi12
 FHMPcFva8/LxUc1i7w8oclm0hcf1j8ysLYGt5c9s=
Date: Wed, 13 May 2020 08:21:33 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200513052133.GN14260@kernel.org>
References: <20200512184422.12418-1-rppt@kernel.org>
 <20200512184422.12418-4-rppt@kernel.org>
 <20200512192013.GY16070@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512192013.GY16070@bombadil.infradead.org>
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 03/12] mm: reorder includes after
 introduction of linux/pgtable.h
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMTI6MjA6MTNQTSAtMDcwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gT24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMDk6NDQ6MTNQTSArMDMwMCwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FscGhhL2tlcm5lbC9wcm90by5o
IGIvYXJjaC9hbHBoYS9rZXJuZWwvcHJvdG8uaAo+ID4gaW5kZXggYTA5M2NkNDVlYzc5Li43MDFh
MDUwOTAxNDEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FscGhhL2tlcm5lbC9wcm90by5oCj4gPiAr
KysgYi9hcmNoL2FscGhhL2tlcm5lbC9wcm90by5oCj4gPiBAQCAtMiw4ICsyLDYgQEAKPiA+ICAj
aW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4g
PiAgCj4gPiAtI2luY2x1ZGUgPGxpbnV4L3BndGFibGUuaD4KPiA+IC0KPiA+ICAvKiBQcm90b3R5
cGVzIG9mIGZ1bmN0aW9ucyB1c2VkIGFjcm9zcyBtb2R1bGVzIGhlcmUgaW4gdGhpcyBkaXJlY3Rv
cnkuICAqLwo+ID4gIAo+ID4gICNkZWZpbmUgdnVjcAl2b2xhdGlsZSB1bnNpZ25lZCBjaGFyICAq
Cj4gCj4gTG9va3MgbGlrZSB5b3VyIHNjcmlwdCBoYXMgYSBidWcgaWYgbGludXgvcGd0YWJsZS5o
IGlzIHRoZSBsYXN0IGluY2x1ZGUKPiBpbiB0aGUgZmlsZT8KClNjcmlwdCBpbmRlZWQgY2Fubm90
IGhhbmRsZSBhbGwgdGhlIGNvcm5lciBjYXNlLCBidXQgdGhpcyBpcyBub3Qgb25lIG9mCnRoZW0u
CkkndmUgc3RhcnRlZCBpbml0aWFsbHkgdG8gbG9vayBpbnRvIHJlbW92aW5nIGFzbS9wZ3RhYmxl
LmggaWYgaXQgd2FzIG5vdApuZWVkZWQsIGJ1dCBJJ3ZlIHJ1biBvdXQgb2YgcGF0aWVuY2UgdmVy
eSBzb29uLiBUaGlzIGZpbGUgaXMgd2hhdApzbmVha2VkIGluIGZyb20gdGhhdCBhdHRlbXB0LgoK
LS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

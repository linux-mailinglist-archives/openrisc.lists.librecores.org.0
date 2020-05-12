Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3526A1D2012
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DD66420ADA;
	Wed, 13 May 2020 22:17:53 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2405720AF2
 for <openrisc@lists.librecores.org>; Tue, 12 May 2020 21:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eXQZf3ekGrBh7/8h/ecECVEkvcon3f/PbSizwb4mgiw=; b=nS6NfZYBTgk8FJ6ekZTb00EUyW
 QqjhQ0CHb8LyvB9OSPUjgThs7LO118mJcpZ9aaYsirrdctOoJltqUoGQtl9qJP12sqiop6jyRe9gL
 2exLHF4NrfdlRCSjGF2z99JAkJ/igk3/szyn/VqZvVcDLQyvRweZJTFEHHA3lH8oKxD6awzsEItU1
 j3p6PX2d762f7uRx34bi5lJojxVpVten7xFNEnVTmhSd3tWxwVxMPDZQ2n361OE2zSRuxqRBnmyeD
 rZx5ZeIJ7FBQ8hvNoabP6jmSuKtNLJrLrNvGTS3yQhffn23z43EFgI55lR97z03Ad01fZXaZQfFhr
 ZLdWvZPQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jYaRp-00018p-Bh; Tue, 12 May 2020 19:20:13 +0000
Date: Tue, 12 May 2020 12:20:13 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200512192013.GY16070@bombadil.infradead.org>
References: <20200512184422.12418-1-rppt@kernel.org>
 <20200512184422.12418-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512184422.12418-4-rppt@kernel.org>
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

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMDk6NDQ6MTNQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hbHBoYS9rZXJuZWwvcHJvdG8uaCBiL2FyY2gvYWxw
aGEva2VybmVsL3Byb3RvLmgKPiBpbmRleCBhMDkzY2Q0NWVjNzkuLjcwMWEwNTA5MDE0MSAxMDA2
NDQKPiAtLS0gYS9hcmNoL2FscGhhL2tlcm5lbC9wcm90by5oCj4gKysrIGIvYXJjaC9hbHBoYS9r
ZXJuZWwvcHJvdG8uaAo+IEBAIC0yLDggKzIsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJy
dXB0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAKPiAtI2luY2x1ZGUgPGxpbnV4L3Bn
dGFibGUuaD4KPiAtCj4gIC8qIFByb3RvdHlwZXMgb2YgZnVuY3Rpb25zIHVzZWQgYWNyb3NzIG1v
ZHVsZXMgaGVyZSBpbiB0aGlzIGRpcmVjdG9yeS4gICovCj4gIAo+ICAjZGVmaW5lIHZ1Y3AJdm9s
YXRpbGUgdW5zaWduZWQgY2hhciAgKgoKTG9va3MgbGlrZSB5b3VyIHNjcmlwdCBoYXMgYSBidWcg
aWYgbGludXgvcGd0YWJsZS5oIGlzIHRoZSBsYXN0IGluY2x1ZGUKaW4gdGhlIGZpbGU/CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

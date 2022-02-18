Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 659B24BB26F
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 07:35:53 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 47ED924861;
	Fri, 18 Feb 2022 07:35:53 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id A0F0B2485D
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:35:51 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4DEC168BFE; Fri, 18 Feb 2022 07:35:49 +0100 (CET)
Date: Fri, 18 Feb 2022 07:35:49 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220218063549.GJ22576@lst.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-15-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-15-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [OpenRISC] [PATCH v2 14/18] lib/test_lockup: fix kernel pointer
 check for separate address spaces
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDI6MTM6MjhQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IHRlc3Rfa2Vy
bmVsX3B0cigpIHVzZXMgYWNjZXNzX29rKCkgdG8gZmlndXJlIG91dCBpZiBhIGdpdmVuIGFkZHJl
c3MKPiBwb2ludHMgdG8gdXNlciBzcGFjZSBpbnN0ZWFkIG9mIGtlcm5lbCBzcGFjZS4gSG93ZXZl
ciBvbiBhcmNoaXRlY3R1cmVzCj4gdGhhdCBzZXQgQ09ORklHX0FMVEVSTkFURV9VU0VSX0FERFJF
U1NfU1BBQ0UsIGEgcG9pbnRlciBjYW4gYmUgdmFsaWQKPiBmb3IgYm90aCwgYW5kIHRoZSBjaGVj
ayBhbHdheXMgZmFpbHMgYmVjYXVzZSBhY2Nlc3Nfb2soKSByZXR1cm5zIHRydWUuCj4gCj4gTWFr
ZSB0aGUgY2hlY2sgZm9yIHVzZXIgc3BhY2UgcG9pbnRlcnMgY29uZGl0aW9uYWwgb24gdGhlIHR5
cGUgb2YKPiBhZGRyZXNzIHNwYWNlIGxheW91dC4KCldoYXQgaXMgdGhpcyBjb2RlIGV2ZW4gdHJ5
aW5nIHRvIGRvPyAgSXQgbG9va3MgZXh0cmVtbHkgYnJva2VuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

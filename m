Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 009C94C0D6D
	for <lists+openrisc@lfdr.de>; Wed, 23 Feb 2022 08:41:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ACB6F2414D;
	Wed, 23 Feb 2022 08:41:50 +0100 (CET)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id 7AE8523F5F
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 08:41:49 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nMmHJ-0002z4-00; Wed, 23 Feb 2022 08:41:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 9B37FC2742; Wed, 23 Feb 2022 08:41:27 +0100 (CET)
Date: Wed, 23 Feb 2022 08:41:27 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220223074127.GA8287@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-10-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [OpenRISC] [PATCH v2 09/18] mips: use simpler access_ok()
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
 viro@zeniv.linux.org.uk, monstr@monstr.eu, linux-parisc@vger.kernel.org,
 nickhu@andestech.com, jcmvbkbc@gmail.com, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, ebiederm@xmission.com,
 richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMDI6MTM6MjNQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2Fy
Y2gvbWlwcy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCBkYjlhOGUwMDJiNjIuLmQ3Yzg5
ZGMzNDI2YyAxMDA2NDQKPiAtLS0gYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4g
KysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC0xOSw2ICsxOSw3IEBA
Cj4gICNpZmRlZiBDT05GSUdfMzJCSVQKPiAgCj4gICNkZWZpbmUgX19VQV9MSU1JVCAweDgwMDAw
MDAwVUwKPiArI2RlZmluZSBUQVNLX1NJWkVfTUFYCV9fVUFfTElNSVQKCnVzaW5nIEtTRUcwIGlu
c3RlYWQgd291bGQgSU1ITyBiZSB0aGUgYmV0dGVyIGNob2ljZS4gVGhpcyBnaXZlcyB0aGUKY2hh
bmNlIHRvIHJlbW92ZSBfX1VBX0xJTUlUIGNvbXBsZXRseSBhZnRlciBjbGVhbmluZyB1cCBwdHJh
Y2UuYwoKVGhvbWFzLgoKLS0gCkNyYXAgY2FuIHdvcmsuIEdpdmVuIGVub3VnaCB0aHJ1c3QgcGln
cyB3aWxsIGZseSwgYnV0IGl0J3Mgbm90IG5lY2Vzc2FyaWx5IGEKZ29vZCBpZGVhLiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTkyNSwgMi4zIF0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

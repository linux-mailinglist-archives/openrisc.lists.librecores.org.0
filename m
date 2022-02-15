Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0B09E4B5F4D
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 01:48:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AE02724237;
	Tue, 15 Feb 2022 01:48:31 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id 8545C23E0C
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:48:30 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJm0h-001pkI-9F; Tue, 15 Feb 2022 00:48:03 +0000
Date: Tue, 15 Feb 2022 00:48:03 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Ygr4Q2/KxfF86ETa@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-12-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-12-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
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
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDlQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKCj4gLS8qCj4gLSAqIFNwYXJjNjQgaXMgc2VnbWVudGVkLCB0aG91Z2ggbW9yZSBsaWtl
IHRoZSBNNjhLIHRoYW4gdGhlIEkzODYuCj4gLSAqIFdlIHVzZSB0aGUgc2Vjb25kYXJ5IEFTSSB0
byBhZGRyZXNzIHVzZXIgbWVtb3J5LCB3aGljaCByZWZlcmVuY2VzIGEKPiAtICogY29tcGxldGVs
eSBkaWZmZXJlbnQgVk0gbWFwLCB0aHVzIHRoZXJlIGlzIHplcm8gY2hhbmNlIG9mIHRoZSB1c2Vy
Cj4gLSAqIGRvaW5nIHNvbWV0aGluZyBxdWVlciBhbmQgdHJpY2tpbmcgdXMgaW50byBwb2tpbmcg
a2VybmVsIG1lbW9yeS4KCkFjdHVhbGx5LCB0aGlzIHBhcnQgb2YgY29tbWVudCBwcm9iYWJseSBv
dWdodCB0byBzdGF5IC0gaXQgaXMgcmVsZXZhbnQKZm9yIHVuZGVyc3RhbmRpbmcgd2hhdCdzIGdv
aW5nIG9uIChlLmcuIHdoeSBpcyBhY2Nlc3Nfb2soKSBhbHdheXMgdHJ1ZSwgZXRjLikKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

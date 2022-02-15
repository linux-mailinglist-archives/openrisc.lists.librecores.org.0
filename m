Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B201E4B6369
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 07:29:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6F509242C0;
	Tue, 15 Feb 2022 07:29:49 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 41D9E242C0
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 07:29:47 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 11DDB68AA6; Tue, 15 Feb 2022 07:29:43 +0100 (CET)
Date: Tue, 15 Feb 2022 07:29:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20220215062942.GA12551@lst.de>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [OpenRISC] [PATCH 09/14] m68k: drop custom __access_ok()
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
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTI6Mzc6NDFBTSArMDAwMCwgQWwgVmlybyB3cm90ZToK
PiBQZXJoYXBzIHNpbXBseSB3cmFwIHRoYXQgc3Vja2VyIGludG8gI2lmZGVmIENPTkZJR19DUFVf
SEFTX0FERFJFU1NfU1BBQ0VTCj4gKGFuZCB0cmltIHRoZSBjb21tZW50IGRvd24gdG8gImNvbGRm
aXJlIGFuZCA2ODAwMCB3aWxsIHBpY2sgZ2VuZXJpYwo+IHZhcmlhbnQiKT8KCkkgd29uZGVyIGlm
IHdlIHNob3VsZCBpbnZlcnQgQ09ORklHX0FSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNT
X1NQQUNFLApzZWxlY3QgdGhlIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2UgY29uZmlnIGZvciBzMzkw
LCBzcGFyYzY0LCBub24tY29sZGZpcmUKbTY4ayBhbmQgbWlwcyB3aXRoIEVWQSBhbmQgdGhlbiBq
dXN0IGhhdmUgb25lIHNpbmdsZSBhY2Nlc3Nfb2sgZm9yCm92ZXJsYXBwaW5nIGFkZHJlc3Mgc3Bh
Y2UgKGFzIGFkZGVkIGJ5IEFybmQpIGFuZCBub24tb3ZlcmxhcHBpbmcgb25lcwooYWx3YXlzIHJl
dHVybiB0cnVlKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

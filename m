Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A50964B5ACB
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 21:00:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5CAB124800;
	Mon, 14 Feb 2022 21:00:20 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 3DC37211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 21:00:19 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2A25C68AA6; Mon, 14 Feb 2022 21:00:11 +0100 (CET)
Date: Mon, 14 Feb 2022 21:00:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <20220214200011.GA3786@lst.de>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org> <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [OpenRISC] [PATCH 04/14] x86: use more conventional access_ok()
 definition
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDg6NDU6NTJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBBcyBBbCBwb2ludGVkIG91dCwgdGhleSB0dXJuZWQgb3V0IHRvIGJlIG5lY2Vzc2Fy
eSBvbiBzcGFyYzY0LCBidXQgdGhlIG9ubHkKPiBkZWZpbml0aW9ucyBhcmUgb24gc3BhcmM2NCBh
bmQgeDg2LCBzbyBpdCdzIHBvc3NpYmxlIHRoYXQgdGhleSBzZXJ2ZSBhIHNpbWlsYXIKPiBwdXJw
b3NlIGhlcmUsIGluIHdoaWNoIGNhc2UgY2hhbmdpbmcgdGhlIGxpbWl0IGZyb20gVEFTS19TSVpF
IHRvCj4gVEFTS19TSVpFX01BWCBpcyBwcm9iYWJseSB3cm9uZyBhcyB3ZWxsLgo+IAo+IFNvIGVp
dGhlciBJIG5lZWQgdG8gcmV2ZXJ0IHRoZSBvcmlnaW5hbCBkZWZpbml0aW9uIGFzIEkgZGlkIG9u
IHNwYXJjNjQsIG9yCj4gdGhleSBjYW4gYmUgcmVtb3ZlZCBjb21wbGV0ZWx5LiBIb3BlZnVsbHkg
QWwgb3IgdGhlIHg4NiBtYWludGFpbmVycwo+IGNhbiBjbGFyaWZ5LgoKTG9va2luZyBhdCB0aGUg
eDg2IHVzZXJzIEkgdGhpbms6CgogLSB2YWxpZF91c2VyX2ZyYW1lIHNob3VsZCBnbyBhd2F5IGFu
ZCB0aGUgY2FsbGVyIHNob3VsZCB1c2UgZ2V0X3VzZXIKICAgaW5zdGVhZCBvZiBfX2dldF91c2Vy
CiAtIHRoZSBvbmUgaW4gY29weV9jb2RlIGNhbiBqdXN0IGdvIGF3YXksIGFzIHRoZXJlIGlzIGFu
b3RoZXIgY2hlY2sKICAgaW4gY29weV9mcm9tX3VzZXJfbm1pCiAtIGNvcHlfc3RhY2tfZnJhbWUg
c2hvdWxkIGp1c3QgdXNlIGFjY2Vzc19vawogLSBhcyBkb2VzIGNvcHlfZnJvbV91c2VyX25taQoK
YnV0IHllcywgaGF2aW5nIHNvbWVvbmUgd2hvIGFjdHVhbGx5IGtub3dzIHRoaXMgY29kZSBsb29r
IG92ZXIgaXQKd291bGQgYmUgdmVyeSBoZWxwZnVsLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

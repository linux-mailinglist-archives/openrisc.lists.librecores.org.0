Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D1E074B5C01
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 22:09:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DFF742420E;
	Mon, 14 Feb 2022 22:09:39 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id D6699211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 21:19:52 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJhmV-001mcz-Ba; Mon, 14 Feb 2022 20:17:07 +0000
Date: Mon, 14 Feb 2022 20:17:07 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Ygq4wy9fikDYmuHU@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
X-Mailman-Approved-At: Mon, 14 Feb 2022 22:09:38 +0100
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
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMTI6MDE6MDVQTSAtMDgwMCwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMTE6NDYgQU0gQXJuZCBCZXJnbWFubiA8
YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBBcyBBbCBwb2ludGVkIG91dCwgdGhleSB0
dXJuZWQgb3V0IHRvIGJlIG5lY2Vzc2FyeSBvbiBzcGFyYzY0LCBidXQgdGhlIG9ubHkKPiA+IGRl
ZmluaXRpb25zIGFyZSBvbiBzcGFyYzY0IGFuZCB4ODYsIHNvIGl0J3MgcG9zc2libGUgdGhhdCB0
aGV5IHNlcnZlIGEgc2ltaWxhcgo+ID4gcHVycG9zZSBoZXJlLCBpbiB3aGljaCBjYXNlIGNoYW5n
aW5nIHRoZSBsaW1pdCBmcm9tIFRBU0tfU0laRSB0bwo+ID4gVEFTS19TSVpFX01BWCBpcyBwcm9i
YWJseSB3cm9uZyBhcyB3ZWxsLgo+IAo+IHg4Ni02NCBoYXMgYWx3YXlzKCopIHVzZWQgVEFTS19T
SVpFX01BWCBmb3IgYWNjZXNzX29rKCksIGFuZCB0aGUKPiBnZXRfdXNlcigpIGFzc2VtYmxlciBp
bXBsZW1lbnRhdGlvbiBkb2VzIHRoZSBzYW1lLgo+IAo+IEkgdGhpbmsgYW55IF9fcmFuZ2Vfbm90
X29rKCkgdXNlcnMgdGhhdCB1c2UgVEFTS19TSVpFIGFyZSBlbnRpcmVseQo+IGhpc3RvcmljYWws
IGFuZCBzaG91bGQgYmUganVzdCBmaXhlZC4KCklJUkMsIHRoYXQgd2FzIG1vc3RseSB1c2VybGFu
ZCBzdGFjayB0cmFjZSBjb2xsZWN0aW9uIGluIHBlcmYuCkknbGwgdHJ5IHRvIGRpZyBpbiBhcmNo
aXZlcyBhbmQgc2VlIHdoYXQgc2hvd3MgdXAgLSBpdCdzIGJlZW4KYSB3aGlsZSBhZ28uLi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

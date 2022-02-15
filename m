Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CB4084B6136
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 03:47:36 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6EBA624237;
	Tue, 15 Feb 2022 03:47:36 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id BC20B23F5F
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 03:47:34 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJnrt-001qwH-NG; Tue, 15 Feb 2022 02:47:05 +0000
Date: Tue, 15 Feb 2022 02:47:05 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YgsUKcXGR7r4nINj@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
 <Ygq4wy9fikDYmuHU@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygq4wy9fikDYmuHU@zeniv-ca.linux.org.uk>
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDg6MTc6MDdQTSArMDAwMCwgQWwgVmlybyB3cm90ZToK
PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAxMjowMTowNVBNIC0wODAwLCBMaW51cyBUb3J2YWxk
cyB3cm90ZToKPiA+IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDExOjQ2IEFNIEFybmQgQmVyZ21h
bm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFzIEFsIHBvaW50ZWQgb3V0
LCB0aGV5IHR1cm5lZCBvdXQgdG8gYmUgbmVjZXNzYXJ5IG9uIHNwYXJjNjQsIGJ1dCB0aGUgb25s
eQo+ID4gPiBkZWZpbml0aW9ucyBhcmUgb24gc3BhcmM2NCBhbmQgeDg2LCBzbyBpdCdzIHBvc3Np
YmxlIHRoYXQgdGhleSBzZXJ2ZSBhIHNpbWlsYXIKPiA+ID4gcHVycG9zZSBoZXJlLCBpbiB3aGlj
aCBjYXNlIGNoYW5naW5nIHRoZSBsaW1pdCBmcm9tIFRBU0tfU0laRSB0bwo+ID4gPiBUQVNLX1NJ
WkVfTUFYIGlzIHByb2JhYmx5IHdyb25nIGFzIHdlbGwuCj4gPiAKPiA+IHg4Ni02NCBoYXMgYWx3
YXlzKCopIHVzZWQgVEFTS19TSVpFX01BWCBmb3IgYWNjZXNzX29rKCksIGFuZCB0aGUKPiA+IGdl
dF91c2VyKCkgYXNzZW1ibGVyIGltcGxlbWVudGF0aW9uIGRvZXMgdGhlIHNhbWUuCj4gPiAKPiA+
IEkgdGhpbmsgYW55IF9fcmFuZ2Vfbm90X29rKCkgdXNlcnMgdGhhdCB1c2UgVEFTS19TSVpFIGFy
ZSBlbnRpcmVseQo+ID4gaGlzdG9yaWNhbCwgYW5kIHNob3VsZCBiZSBqdXN0IGZpeGVkLgo+IAo+
IElJUkMsIHRoYXQgd2FzIG1vc3RseSB1c2VybGFuZCBzdGFjayB0cmFjZSBjb2xsZWN0aW9uIGlu
IHBlcmYuCj4gSSdsbCB0cnkgdG8gZGlnIGluIGFyY2hpdmVzIGFuZCBzZWUgd2hhdCBzaG93cyB1
cCAtIGl0J3MgYmVlbgo+IGEgd2hpbGUgYWdvLi4uCgpBZnRlciBzb21lIGRpZ2dpbmc6CgoJYWNj
ZXNzX29rKCkgbmVlZHMgb25seSB0byBtYWtlIHN1cmUgdGhhdCBNTVUgd29uJ3QgZ28gYW55d2hl
cmUgbmVhcgp0aGUga2VybmVsIHBhZ2UgdGFibGVzOyBhZGRyZXNzIGxpbWl0IGZvciAzMmJpdCB0
aHJlYWRzIGlzIG5vbmUgb2YgaXRzCmNvbmNlcm4sIHNvIFRBU0tfU0laRV9NQVggaXMgcmlnaHQg
Zm9yIGl0LgoKCXZhbGlkX3VzZXJfZnJhbWUoKSBpbiBhcmNoL3g4Ni9ldmVudHMvY29yZS5jOiB1
c2VkIHdoaWxlIHdhbGtpbmcKdGhlIHVzZXJsYW5kIGNhbGwgY2hhaW4uICBUaGUgcmVhc29uIGl0
J3Mgbm90IGFjY2Vzc19vaygpIGlzIG9ubHkgdGhhdApwZXJmX2NhbGxjaGFpbl91c2VyKCkgbWln
aHQndmUgYmVlbiBjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgdGhhdCBjYW1lIHdoaWxlCndlJ2QgYmVl
biB1bmRlciBLRVJORUxfRFMuCglUaGF0IGhhZCBiZWVuIGJhY2sgaW4gMjAxNSBhbmQgaXQgaGFk
IGJlZW4gb2Jzb2xldGVkIHNpbmNlIDIwMTcsIGNvbW1pdAo4OGIwMTkzZDk0MTggKHBlcmYvY2Fs
bGNoYWluOiBGb3JjZSBVU0VSX0RTIHdoZW4gaW52b2tpbmcgcGVyZl9jYWxsY2hhaW5fdXNlcigp
KS4KV2UgaGFkIGJlZW4gZ3VhcmFudGVlZCBVU0VSX0RTIGV2ZXIgc2luY2UuCglJT1csIGl0IGNv
dWxkJ3ZlIHJldmVydGVkIHRvIHVzZSBvZiBhY2Nlc3Nfb2soKSBhdCBhbnkgcG9pbnQgYWZ0ZXIg
dGhhdC4KVEFTS19TSVpFIHZzIFRBU0tfU0laRV9NQVggaXMgcHJldHR5IG11Y2ggYW4gYWNjaWRl
bnQgdGhlcmUgLSBtaWdodCd2ZSBiZWVuClRBU0tfU0laRV9NQVggZnJvbSB0aGUgdmVyeSBiZWdp
bm5pbmcuCgoJY29weV9zdGFja19mcmFtZSgpIGluIGFyY2gveDg2L2tlcm5lbC9zdGFja3RyYWNl
LmM6IHNpbWlsYXIgc3RvcnksCmV4Y2VwdCB0aGUgY29tbWl0IHRoYXQgbWFkZSBzdXJlIGNhbGxl
cnMgd2lsbCBoYXZlIFVTRVJfRFMgLSBjYWM5YjlhNGIwODMKKHN0YWNrdHJhY2U6IEZvcmNlIFVT
RVJfRFMgZm9yIHN0YWNrX3RyYWNlX3NhdmVfdXNlcigpKSBpbiB0aGlzIGNhc2UuCkFsc28gY291
bGQndmUgYmVlbiB1c2luZyBhY2Nlc3Nfb2soKSBqdXN0IGZpbmUuICBBbXVzaW5nbHksIGFjY2Vz
c19vaygpCnVzZWQgdG8gYmUgdGhlcmUsIHVudGlsIGl0IGhhZCBiZWVuIHJlcGxhY2VkIHdpdGgg
ZXhwbGljaXQgY2hlY2sgb24KSnVsIDIyIDIwMTkgLSA0IGRheXMgYWZ0ZXIgdGhhdCBoYWQgYmVl
biBtYWRlIHVzZWxlc3MgYnkgZml4IGluIHRoZSBjYWxsZXIuLi4KCgljb3B5X2Zyb21fdXNlcl9u
bWkoKS4gIFRoYXQgb25lIGlzIGEgYml0IG1vcmUgaW50ZXJlc3RpbmcuCldlIGhhdmUgYSBjYWxs
IGNoYWluIGZyb20gcGVyZl9vdXRwdXRfc2FtcGxlX3VzdGFjaygpIChjb3ZlcmVkIGJ5CmZvcmNl
X3VhY2Nlc3NfYmVnaW4oKSB0aGVzZSBkYXlzLCBub3QgdGhhdCBpdCBtYXR0ZXJlZCBmb3IgeDg2
IG5vdyksCnRoZXJlJ3Mgc29tZXRoaW5nIG9kZCBpbiBkdW1wc3RhY2suYzpjb3B5X2NvZGUoKSAo
d2l0aCBleHBsaWNpdCBjaGVjawpmb3IgVEFTS19TSVpFX01BWCBpbiB0aGUgY2FsbGVyKSBhbmQg
dGhlcmUncyBhIGNvdXBsZSBvZiBjYWxsZXJzIGluCkludGVsIFBNVSBjb2RlLgoJQUZBSUNTLCB0
aGVyZSdzIG5vIHJlYXNvbiB3aGF0c29ldmVyIHRvIHVzZSBUQVNLX1NJWkUKaW4gdGhhdCBvbmUg
LSB0aGUgcG9pbnQgaXMgdG8gcHJldmVudCBjb3B5aW4gZnJvbSB0aGUga2VybmVsCm1lbW9yeSwg
YW5kIGluIHRoYXQgcmVzcGVjdCBUQVNLX1NJWkVfTUFYIGlzbid0IGFueSB3b3JzZS4KVGhlIGNo
ZWNrIGluIGNvcHlfY29kZSgpIHByb2JhYmx5IHNob3VsZCBnby4KCglTbyBhbGwgb2YgdGhvc2Ug
Z3V5cyBzaG91bGQgYmUgc2ltcGx5IHN3aXRjaGVkIHRvIGFjY2Vzc19vaygpLgpNaWdodCBiZSB3
b3J0aCBtYWtpbmcgdGhhdCBhIHByZWxpbWluYXJ5IHBhdGNoIC0gaXQncyBpbmRlcGVuZGVudApm
cm9tIGV2ZXJ5dGhpbmcgZWxzZSBhbmQgdGhlcmUncyBubyBwb2ludCBmb2xkaW5nIGl0IGludG8g
YW55IG9mIHRoZQpwYXRjaGVzIGluIHRoZSBzZXJpZXMuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

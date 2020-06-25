Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 32607209BC0
	for <lists+openrisc@lfdr.de>; Thu, 25 Jun 2020 11:15:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7CE4620C65;
	Thu, 25 Jun 2020 11:15:08 +0200 (CEST)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id BDE89205B0
 for <openrisc@lists.librecores.org>; Thu, 25 Jun 2020 10:31:47 +0200 (CEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1joNHt-0001Gi-00; Thu, 25 Jun 2020 10:31:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 86F23C06F9; Thu, 25 Jun 2020 10:25:58 +0200 (CEST)
Date: Thu, 25 Jun 2020 10:25:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <20200625082558.GB6319@alpha.franken.de>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 25 Jun 2020 11:15:06 +0200
Subject: Re: [OpenRISC] [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
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
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Weinberger <richard@nod.at>, Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDE6NDM6MjVBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gQWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBjb3B5X3RocmVhZF90bHMoKSBu
b3csIHNvIHJlbW92ZSB0aGUgbGVnYWN5Cj4gY29weV90aHJlYWQoKSBmdW5jdGlvbiBhbmQgdGhl
IEhBVkVfQ09QWV9USFJFQURfVExTIGNvbmZpZyBvcHRpb24uIEV2ZXJ5b25lCj4gdXNlcyB0aGUg
c2FtZSBwcm9jZXNzIGNyZWF0aW9uIGNhbGxpbmcgY29udmVudGlvbiBiYXNlZCBvbgo+IGNvcHlf
dGhyZWFkX3RscygpIGFuZCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MuIFRoaXMgd2lsbCBtYWtl
IGl0IGVhc2llciB0bwo+IG1haW50YWluIHRoZSBjb3JlIHByb2Nlc3MgY3JlYXRpb24gY29kZSB1
bmRlciBrZXJuZWwvLCBzaW1wbGlmaWVzIHRoZQo+IGNhbGxwYXRocyBhbmQgbWFrZXMgdGhlIGlk
ZW50aWNhbCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuCj4gWy4uXSAKPiAgYXJjaC9taXBzL0tjb25m
aWcgICAgICAgICAgfCAgMSAtCgpBY2tlZC1ieTogVGhvbWFzIEJvZ2VuZG9lcmZlciA8dHNib2dl
bmRAYWxwaGEuZnJhbmtlbi5kZT4KClRob21hcy4KCi0tIApDcmFwIGNhbiB3b3JrLiBHaXZlbiBl
bm91Z2ggdGhydXN0IHBpZ3Mgd2lsbCBmbHksIGJ1dCBpdCdzIG5vdCBuZWNlc3NhcmlseSBhCmdv
b2QgaWRlYS4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBb
IFJGQzE5MjUsIDIuMyBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

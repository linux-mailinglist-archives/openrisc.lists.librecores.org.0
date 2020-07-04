Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC5B22B81A
	for <lists+openrisc@lfdr.de>; Thu, 23 Jul 2020 22:49:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 75A1B20272;
	Thu, 23 Jul 2020 22:49:47 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by mail.librecores.org (Postfix) with ESMTPS id F273320910
 for <openrisc@lists.librecores.org>; Sat,  4 Jul 2020 18:11:55 +0200 (CEST)
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jrkkL-0000nq-Fg; Sat, 04 Jul 2020 16:10:33 +0000
Date: Sat, 4 Jul 2020 18:10:31 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Stafford Horne <shorne@gmail.com>, Kees Cook <keescook@chromium.org>
Message-ID: <20200704161031.lcln4ez6yehgffgq@wittgenstein>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-18-christian.brauner@ubuntu.com>
 <20200625211749.GH1401039@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625211749.GH1401039@lianli.shorne-pla.net>
X-Mailman-Approved-At: Thu, 23 Jul 2020 22:49:44 +0200
Subject: Re: [OpenRISC] [PATCH 17/17] arch: rename copy_thread_tls() back to
 copy_thread()
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-csky@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMDY6MTc6NDlBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDE6NDM6MjZBTSArMDIwMCwgQ2hyaXN0
aWFuIEJyYXVuZXIgd3JvdGU6Cj4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9rZXJu
ZWwvcHJvY2Vzcy5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5jCj4gPiBpbmRleCBk
NzAxMGU3MjQ1MGMuLjE5MDQ1YTNlZmI4YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvb3BlbnJpc2Mv
a2VybmVsL3Byb2Nlc3MuYwo+ID4gKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJvY2Vzcy5j
Cj4gPiBAQCAtMTE2LDcgKzExNiw3IEBAIHZvaWQgcmVsZWFzZV90aHJlYWQoc3RydWN0IHRhc2tf
c3RydWN0ICpkZWFkX3Rhc2spCj4gPiAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9m
b3JrKHZvaWQpOwo+ID4gIAo+ID4gIC8qCj4gPiAtICogY29weV90aHJlYWRfdGxzCj4gPiArICog
Y29weV90aHJlYWQKPiA+ICAgKiBAY2xvbmVfZmxhZ3M6IGZsYWdzCj4gPiAgICogQHVzcDogdXNl
ciBzdGFjayBwb2ludGVyIG9yIGZuIGZvciBrZXJuZWwgdGhyZWFkCj4gPiAgICogQGFyZzogYXJn
IHRvIGZuIGZvciBrZXJuZWwgdGhyZWFkOyBhbHdheXMgTlVMTCBmb3IgdXNlcnNwYWNlIHRocmVh
ZAo+ID4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBleHRlcm4gYXNtbGlua2FnZSB2b2lkIHJldF9mcm9t
X2Zvcmsodm9pZCk7Cj4gPiAgICovCj4gPiAgCj4gPiAgaW50Cj4gPiAtY29weV90aHJlYWRfdGxz
KHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIHVuc2lnbmVkIGxvbmcgdXNwLAo+ID4gK2NvcHlf
dGhyZWFkKHVuc2lnbmVkIGxvbmcgY2xvbmVfZmxhZ3MsIHVuc2lnbmVkIGxvbmcgdXNwLAo+ID4g
IAkJdW5zaWduZWQgbG9uZyBhcmcsIHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgdW5zaWduZWQgbG9u
ZyB0bHMpCj4gPiAgewo+IAo+IEZvciB0aGUgT3BlblJJU0MgYml0Lgo+IAo+IEFja2VkLWJ5OiBT
dGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiAKPiBBbHNvLCBJIHdvdWxkIGFncmVl
IHdpdGggd2hhdCBLZWVzIG1lbnRpb25lZCBhYm91dCBhbGlnbmluZyB0aGUgcGFyYW1ldGVycy4K
PiBTdXJlIHRoYXQgd291bGQgYmUgbW9yZSB3b3JrIGJ1dCBpdCB3b3VsZCBiZSBhcHByZWNpYXRl
ZC4KClN1cmUsIHRoaXMgaXMgYSBtZWNoYW5pY2FsIGNoYW5nZS4gSSdsbCB1cGRhdGUgdGhlIGlu
ZGl2aWR1YWwgcGF0Y2hlcyB0byBhY2NvdW50IGZvciB0aGF0LgoKVGhhbmtzIQpDaHJpc3RpYW4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E0933101F2D
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:26 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD10F207D5;
	Tue, 19 Nov 2019 10:04:26 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 9BC6220755
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 16:44:57 +0100 (CET)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4850B225AE;
 Wed, 13 Nov 2019 15:44:48 +0000 (UTC)
Date: Wed, 13 Nov 2019 10:44:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Message-ID: <20191113104446.419e4d8a@gandalf.local.home>
In-Reply-To: <20191106232512.GU25745@shell.armlinux.org.uk>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
 <20191106232512.GU25745@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 10:04:17 +0100
Subject: Re: [OpenRISC] [PATCH 00/50] Add log level to show_stack()
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, "David S. Miller" <davem@davemloft.net>,
 Rich Felker <dalias@libc.org>, Petr Mladek <pmladek@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Mark Salter <msalter@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, openrisc@lists.librecores.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Michal Simek <monstr@monstr.eu>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCA2IE5vdiAyMDE5IDIzOjI1OjEzICswMDAwClJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eCBhZG1pbiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gT24gV2VkLCBOb3YgMDYs
IDIwMTkgYXQgMDk6MzQ6NDBQTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiBJIHN1
cHBvc2UgSSdtIHN1cnByaXNlZCB0aGVyZSBhcmUgYmFja3RyYWNlcyB0aGF0IGFyZSBub3QgaW1w
b3J0YW50Lgo+ID4gRWl0aGVyIGJhZG5lc3MgaGFwcGVuZWQgYW5kIGl0IG5lZWRzIHByaW50aW5n
LCBvciB0aGUgdXNlciBhc2tlZCBmb3IgaXQKPiA+IGFuZCBpdCBuZWVkcyBwcmludGluZy4gIAo+
IAo+IE9yIHV0dGVybHkgbWVhbmluZ2xlc3MuCj4gCj4gPiBQZXJoYXBzIHdlIHNob3VsZCBiZSBy
ZW1vdmluZyBiYWNrdHJhY2VzIGlmIHRoZXkncmUgbm90IGltcG9ydGFudAo+ID4gaW5zdGVhZCBv
ZiBhbGxvd2luZyB0byBwcmludCB0aGVtIGFzIGxvd2VyIGxvZ2xldmVscz8gIAo+IAo+IERlZmlu
aXRlbHkhICBXQVJOX09OKCkgaXMgd2VsbCBvdmVydXNlZCAtIGFuZCBhcyBpcyB0eXBpY2FsLCB1
c2VkCj4gd2l0aG91dCBtdWNoIHRob3VnaHQuICBCb3VuZCB0byBoYXBwZW4gYWZ0ZXIgTGludXMg
Z290IHNoaXJ0eSBhYm91dAo+IEJVR19PTigpIGJlaW5nIG92ZXIgdXNlZC4gIEV2ZXJ5b25lIGp1
c3QgZ3JhYmJlZCB0aGUgbmV4dCBuZWFyZXN0IHRoaW5nCj4gdG8gYXNzZXJ0KCkuCj4gCj4gQXMg
YSBraW5kIG9mIGV4YW1wbGUsIEkndmUgcmVjZW50bHkgY29tZSBhY3Jvc3Mgb25lIFdBUk5fT04o
KSBpbiBhCj4gZHJpdmVyIHN1YnN5c3RlbSAodGhhdCBzaGFsbCByZW1haW4gbmFtZWxlc3MgYXQg
dGhlIG1vbWVudCkgd2hpY2ggdmVyeQo+IGxpa2VseSBoYXMgbXVsdGlwbGUgZGlmZmVyZW50IGRl
dmljZXMgb24gYSBwbGF0Zm9ybS4gIFRoZSBXQVJOX09OKCkKPiB0cmlnZ2VycyBhcyBhIHJlc3Vs
dCBvZiBhIHByb2JsZW0gd2l0aCB0aGUgaGFyZHdhcmUsIGJ1dCBiZWNhdXNlIGl0J3MgYQo+IFdB
Uk5fT04oKSwgeW91J3ZlIG5vIGlkZWEgd2hpY2ggZGV2aWNlIGhhcyBhIHByb2JsZW0uICBUaGUg
YmFja3RyYWNlIGlzCj4gbW9zdGx5IG1lYW5pbmdsZXNzLiAgU28geW91IGtub3cgdGhhdCBhIHBy
b2JsZW0gaGFzIG9jY3VycmVkLCBidXQgdGhlCj4ga2VybmVsIHByaW50cyAqdXNlbGVzcyogYmFj
a3RyYWNlIHRvIGxldCB5b3Uga25vdywgYW5kIHRvdGFsbHkgb21pdHMKPiB0aGUgKnVzZWZ1bCog
aW5mb3JtYXRpb24uCj4gCgpJIHdvdWxkIGxpa2UgdG8gYnJpbmcgdXAgYSB0b3BpYyBmb3IgdGhl
IG5leHQgbWFpbnRhaW5lcnMgc3VtbWl0CihhbHRob3VnaCBJIG1heSBub3QgZXZlbiBiZSB0aGVy
ZSksIHRoYXQgd2UgZGVmaW5lIGEgY2xlYXIgdXNlIG9mCldBUk5fT04oKS4gSSB1c2UgaXQgb25s
eSBpZiB0aGUgY29kZSBkb2VzIHNvbWV0aGluZyBJIGRvIG5vdCBleHBlY3QgaXQKdG8gZG8sIGFu
ZCBpcyBjb25zaWRlcmVkIGEgYnVnIGluIHRoZSBjb2RlIGlmIGl0IHRyaWdnZXJzLiBCdXQgaXQK
YXBwZWFycyB0aGF0IHNvbWUgZHJpdmVycyB1c2UgaXQgZm9yICJvaCBJIGRpZG4ndCByZWFsaXpl
IHRoaXMgaGFyZHdhcmUKZG9lcyBzb21ldGhpbmcgSSBkaWRuJ3QgZXhwZWN0Ii4gQW5kIGlzIGln
bm9yZWQgd2hlbiB0aGUgd2FybiBvbiBpcwp0cmlnZ2VyZWQgYW5kIHJlcG9ydGVkLCB3aXRoICJ5
b3UgaGF2ZSBidWdneSBoYXJkd2FyZSIgYnV0IG15IGhhcmR3YXJlCmFwcGVhcnMgdG8gd29yayBq
dXN0IGZpbmUhCgotLSBTdGV2ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

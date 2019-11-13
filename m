Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0B79E101F31
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BCB81207DE;
	Tue, 19 Nov 2019 10:04:28 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 39178202DD
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 09:47:33 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06A25AEA4;
 Wed, 13 Nov 2019 08:47:31 +0000 (UTC)
Date: Wed, 13 Nov 2019 09:47:22 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-ID: <20191113084722.emzee7g34zki4kkl@pathway.suse.cz>
References: <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
 <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113063334.GA147997@google.com>
User-Agent: NeoMutt/20170912 (1.9.0)
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
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkIDIwMTktMTEtMTMgMTU6MzM6MzQsIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiBP
biAoMTkvMTEvMTMgMDI6MjUpLCBEbWl0cnkgU2Fmb25vdiB3cm90ZToKPiA+IEkgZ3Vlc3MgSSd2
ZSBwb2ludGVkIHRoYXQgaW4gbXkgcG9pbnQgb2YgdmlldyBwcmljZSBmb3Igb25lLXRpbWUgdGVz
dGluZwo+ID4gY29kZSBpcyBjaGVhcGVyIHRoYW4gYWRkaW5nIGEgbmV3IHByaW50ayBmZWF0dXJl
IHRvIHN3YXAgbG9nIGxldmVscyBvbgo+ID4gdGhlIGZseS4KPiBbLi5dCj4gPiBJJ3ZlIGdvbmUg
dGhyb3VnaCBmdW5jdGlvbnMgdXNlZCBieSBzeXNycSBkcml2ZXIgYW5kIHRoZSBzYW1lIGNoYW5n
ZXMKPiA+IGludHJvZHVjaW5nIGxvZyBsZXZlbCBwYXJhbWV0ZXIgd291bGQgYmUgbmVlZGVkIGZv
cjogc2NoZWRfc2hvd190YXNrKCksCj4gPiBkZWJ1Z19zaG93X2FsbF9sb2NrcygpLCBzaG93X3Jl
Z3MoKSwgc2hvd19zdGF0ZSgpLCBzaG93X21lbSgpLiBTb21lIG9mCj4gPiB0aGVtIGRvbid0IG5l
ZWQgYW55IHBsYXRmb3JtIGNoYW5nZXMsIGJ1dCBhdCBsZWFzdCBzaG93X3JlZ3MoKSBuZWVkcy4K
PiAKPiBHb29kIHBvaW50cyBhbmQgbmljZSBjb25jbHVzaW9uLgo+IAo+IFdlbGwsIGhlcmUgd2Ug
Z28uIFRoZXJlIGlzIGEgbnVtYmVyIG9mIGdlbmVyYWxseSB1c2VmdWwgZnVuY3Rpb25zIHRoYXQK
PiBwcmludCBuaWNlIGRhdGEgYW5kIHdoZXJlIHBlb3BsZSBtaWdodCB3YW50IHRvIGhhdmUgYmV0
dGVyIGxvZ2xldmVsIGNvbnRyb2wKPiAoZm9yIGRlYnVnZ2luZyBwdXJwb3NlcykuIHNob3dfc3Rh
Y2soKSBpcyBqdXN0IG9uZSBvZiB0aGVtLgoKQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIHNvbWUg
ZXhhbXBsZXMgc28gdGhhdCB3ZSBnZXQgYW4gaWRlYSBhYm91dAp0aGUgc2NvcGUsIHVzZWZ1bG5l
c3MsIGFuZCByZXF1aXJlbWVudHM/Cgo+IFBhdGNoaW5nIGFsbAo+IHRob3NlIGZ1bmN0aW9ucywg
d2hpY2ggeW91IGhhdmUgbWVudGlvbmVkIGFib3ZlLCBpcyBoYXJkbHkgYSBmdW4gdGFzayB0byBk
by4KPiBIZW5jZSB0aGUgcHJpbnRrKCkgcGVyLUNQVSBwZXItY29udGV4dCBsb2dsZXZlbCBwcm9w
b3NpdGlvbi4gVGhlIGNvZGUgdGhlcmUKPiBpcyBub3QgY2xldmVyIG9yIGNvbXBsaWNhdGVkIGFu
ZCBpcyBtZWFudCBmb3IgZGVidWdnaW5nIHB1cnBvc2VzIG9ubHksIGJ1dAo+IHdpdGgganVzdCAz
IGxpbmVzIG9mIGNvZGUgb25lIGNhbiBkbyBzb21lIHN0dWZmOgo+IAo+IAkvKiBAQlRXIHlvdSBj
YW4ndCBkbyB0aGlzIHdpdGggIiVzIiBLRVJOX0ZPTyA7UCAqLwo+ICsJcHJpbnRrX2VtZXJnZW5j
eV9lbnRlcihMT0dMRVZFTF9TQ0hFRCk7Cj4gKwlkZWJ1Z19zaG93X2FsbF9sb2NrcygpOwo+ICsJ
cHJpbnRrX2VtZXJnZW5jeV9leGl0KCk7CgpCdXQgdGhpcyB3aWxsIG5vdCBzb2x2ZSBzaXR1YXRp
b25zIHdoZXJlIHRoZSBvcmlnaW5hbCBsb2dsZXZlbCBzaG91bGQKc3RheSBmcm9tIGFueSByZWFz
b24uIEl0IGhhcHBlbmVkIGluIHRoaXMgcGF0Y2hzZXQsIHNlZQoKaHR0cHM6Ly9sa21sLmtlcm5l
bC5vcmcvci8yMDE5MTEwNjA5MTI1OC5HUzI1NzQ1QHNoZWxsLmFybWxpbnV4Lm9yZy51awpodHRw
czovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkxMTA2MTMyNTE2LkdDNTgwOEB3aWxsaWUtdGhlLXRy
dWNrCgpXZSB3b3VsZCBuZWVkIHRvIGludmVzdGlnYXRlIG1vcmUgcG90ZW50aWFsIHVzZXJzIG9m
IHRoaXMgZmVhdHVyZSB0bwpzZWUgZXZlbnR1YWwgcmVxdWlyZW1lbnRzLiBJZiB0aGVyZSBhcmUg
dG9vIG1hbnkgZXhjZXB0aW9ucyBhbmQgbW9kZXMKdGhlbiB0aGUgZ2VuZXJpYyBBUEkgbWlnaHQg
Z2V0IHByZXR0eSBjb21wbGljYXRlZC4KCkF0IHRoZSBtb21lbnQsIEkgYW0gaW4gZmF2b3Igb2Yg
dGhpcyBwYXRjaHNldC4gSXQgaXMgaHVnZSBhbmQKbmVlZGVkIGEgbG90IG9mIG1hbnVhbCB3b3Jr
LiBCdXQgdGhlIHJlc3VsdCBpcyBzdHJhaWdodGZvcndhcmQgYW5kCmVhc3kgdG8gdW5kZXJzdGFu
ZC4KCkJlc3QgUmVnYXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

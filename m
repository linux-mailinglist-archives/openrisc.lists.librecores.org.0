Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DE228101F2F
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BD1F820143;
	Tue, 19 Nov 2019 10:04:27 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id E259420716
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 09:35:17 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1671AC68;
 Tue, 12 Nov 2019 08:35:16 +0000 (UTC)
Date: Tue, 12 Nov 2019 09:35:09 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-ID: <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112045704.GA138013@google.com>
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

T24gVHVlIDIwMTktMTEtMTIgMTM6NTc6MDQsIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiBP
biAoMTkvMTEvMTIgMTM6NDQpLCBTZXJnZXkgU2Vub3poYXRza3kgd3JvdGU6Cj4gWy4uXQo+ID4g
PiBCdXQgeWVzLCB0aGlzIHBlci1jb2RlLXNlY3Rpb24gbG9nbGV2ZWwgaXMgcHJvYmxlbWF0aWMu
IFRoZSBmZWVkYmFjawo+ID4gPiBhZ2FpbnN0IHRoZSBwYXRjaHNldCBzaG93cyB0aGF0IHBlb3Bs
ZSB3YW50IGl0IGFsc28gdGhlIG90aGVyIHdheS4KPiA+ID4gSSBtZWFuIHRvIGtlZXAgcHJfZGVi
dWcoKSBhcyBwcl9kZWJ1ZygpLgo+ID4gCj4gPiBIbW0uIFJpZ2h0Lgo+ID4gCj4gPiA+IEEgc29s
dXRpb24gbWlnaHQgYmUgdG8gdXNlIHRoZSBwZXItY29kZS1zZWN0aW9uIGxvZ2xldmVsIG9ubHkg
aW5zdGVhZAo+ID4gPiBvZiBzb21lIHNwZWNpYWwgbG9nbGV2ZWwuCj4gPiAKPiA+IFNvIG1heWJl
IHdlIGNhbiAib3ZlcndyaXRlIiBvbmx5IEtFUk5fREVGQVVMVCBsb2dsZXZlbHM/Cj4gCj4gTE9H
TEVWRUxfREVGQVVMVCwgTE9HTEVWRUxfTk9USUNFLCBMT0dMRVZFTF9JTkZPPwo+IAo+IFNvIHdl
IGNhbiBkb3duZ3JhZGUgc29tZSBtZXNzYWdlcyAobG9nX3N0b3JlKCkgb25seSkgb3IgcHJvbW90
ZQo+IHNvbWUgbWVzc2FnZXMuCj4gCj4gREVCVUcgcGVyaGFwcyBzaG91bGQgc3RheSBkZWJ1Zy4K
PiAKPiA+IFdlIGNlcnRhaW5seSBzaG91bGQgbm90IG1lc3Mgd2l0aCBTQ0hFRCBvciB3aXRoIGFu
eXRoaW5nIGluIGJldHdlZW4KPiA+IEVNRVJHIGFuZCBFUlIuCj4gCj4gICBbRU1FUkcsIFdBUk5d
CgpUaGlzIGlzIGdldHRpbmcgdG9vIGNvbXBsaWNhdGVkLiBJdCB3b3VsZCBpbnRyb2R1Y2UgdG9v
IG1hbnkKaGlkZGVuIHJ1bGVzLiBXaGlsZSB0aGUgZXhwbGljaXRseSBwYXNzZWQgbG9nbGV2ZWwg
cGFyYW1ldGVyCmlzIHN0cmFpZ2h0Zm9yd2FyZCBhbmQgY2xlYXIuCgpJIGFtIGdldHRpbmcgbW9y
ZSBpbmNsaW5lZCB0byB0aGUgc29sdXRpb24gaW50cm9kdWNlZCBieSB0aGlzCnBhdGNoc2V0LiBJ
dCBsb29rcyByZWFzb25hYmxlIGZvciB0aGUgZGlmZmVyZW50IHVzZS1jYXNlcy4KCkJlc3QgUmVn
YXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0
cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC11F741A
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 20231207F4;
	Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 7C81020749
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 10:12:16 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54EB2ACA3;
 Mon, 11 Nov 2019 09:12:15 +0000 (UTC)
Date: Mon, 11 Nov 2019 10:12:07 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-ID: <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111012336.GA85185@google.com>
User-Agent: NeoMutt/20170912 (1.9.0)
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
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

T24gTW9uIDIwMTktMTEtMTEgMTA6MjM6MzYsIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiBP
biAoMTkvMTEvMDggMTQ6MDQpLCBQZXRyIE1sYWRlayB3cm90ZToKPiBbLi5dCj4gPiBJIGFncmVl
IHRoYXQgaXQgaXMgY29tcGxpY2F0ZWQgdG8gcGFzcyB0aGUgbG9nbGV2ZWwgYXMKPiA+IGEgcGFy
YW1ldGVyLiBJdCB3b3VsZCBiZSBiZXR0ZXIgZGVmaW5lIHRoZSBkZWZhdWx0Cj4gPiBsb2cgbGV2
ZWwgZm9yIGEgZ2l2ZW4gY29kZSBzZWN0aW9uLiBJdCBtaWdodCBiZSBzdG9yZWQKPiA+IGluIHRh
c2tfc3RydWN0IGZvciB0aGUgbm9ybWFsIGNvbnRleHQgYW5kIGluIHBlci1DUFUKPiA+IHZhcmlh
YmxlcyBmb3IgaW50ZXJydXB0IGNvbnRleHRzLgo+IAo+IEkgZG8gcmVjYWxsIHRoYXQgd2UgdGFs
a2VkIGFib3V0IHBlci1DUFUgcHJpbnRrIHN0YXRlIGJpdCB3aGljaCB3b3VsZAo+IHN0YXJ0L2Vu
ZCAianVzdCBwcmludCBpdCIgc2VjdGlvbi4gV2UgcHJvYmFibHkgY2FuIGV4dGVuZCBpdCB0byAi
anVzdAo+IGxvZ19zdG9yZSIgdHlwZSBvZiBmdW5jdGlvbmFsaXR5LiBEb2Vzbid0IGxvb2sgbGlr
ZSBhIHZlcnkgYmFkIGlkZWEuCgpUaGUgcHJvYmxlbSB3aXRoIHBlci1DUFUgcHJpbnRrIGlzIHRo
YXQgd2Ugd291bGQgbmVlZCB0byBkaXNhYmxlCmludGVycnVwdHMuIEl0IGlzIG5vdCBhbHdheXMg
d2FudGVkLiBBbHNvIHBlb3BsZSBtaWdodCBub3QgZXhwZWN0CnRoaXMgZnJvbSBhIHByaW50aygp
IEFQSS4KCgo+ICJUaGlzIHRhc2svY29udGV4dCBpcyBpbiB0cm91YmxlLCB3aGF0ZXZlciBpdCBw
cmludGsoKS1zIGlzIGltcG9ydGFudCIuCgpJdCBtaWdodCBiZSBhIG1pbmltYWwgbG9nbGV2ZWwu
IE1vcmUgaW1wb3J0YW50IG1lc3NhZ2VzIHdvdWxkIHN0aWxsCmJlIHByaW50ZWQoKSB3aXRoIHRo
ZSBoaWdoZXIgbG9nbGV2ZWwuCgpCdXQgeWVzLCB0aGlzIHBlci1jb2RlLXNlY3Rpb24gbG9nbGV2
ZWwgaXMgcHJvYmxlbWF0aWMuIFRoZSBmZWVkYmFjawphZ2FpbnN0IHRoZSBwYXRjaHNldCBzaG93
cyB0aGF0IHBlb3BsZSB3YW50IGl0IGFsc28gdGhlIG90aGVyIHdheS4KSSBtZWFuIHRvIGtlZXAg
cHJfZGVidWcoKSBhcyBwcl9kZWJ1ZygpLgoKQSBzb2x1dGlvbiBtaWdodCBiZSB0byB1c2UgdGhl
IHBlci1jb2RlLXNlY3Rpb24gbG9nbGV2ZWwgb25seSBpbnN0ZWFkCm9mIHNvbWUgc3BlY2lhbCBs
b2dsZXZlbC4KCgo+IFBlci1jb25zb2xlIGxvZ2xldmVsIGFsc28gbWlnaHQgaGVscCBzb21ldGlt
ZXMuIFNsb3dlciBjb25zb2xlcyB3b3VsZAo+IC0+d3JpdGUoKSBvbmx5IGNyaXRpY2FsIG1lc3Nh
Z2VzLCBmYXN0ZXIgY29uc29sZXMgZXZlcnl0aGluZy4KClRoaXMgbG9va3MgbGlrZSBhbm90aGVy
IHByb2JsZW0gdG8gbWUuIEFueXdheSwgdGhpcyBmaWx0ZXJpbmcgd2lsbAp3b3JrIGJldHRlciB3
aGVuIHRoZSBsb2dsZXZlbCB3aWxsIGJlIGNvbnNpc3RlbnQgYWNyb3NzIHRoZSByZWxhdGVkCmxp
bmVzLgoKPiBQYXNzaW5nIGxvZ19sZXZlbCBhcyBwYXJ0IG9mIG1lc3NhZ2UgcGF5bG9hZCwgd2hp
Y2ggcHJpbnRrIG1hY2hpbmVyeQo+IG1hZ2ljYWxseSBoaWRlcyBpcyBub3QgZW50aXJlbHkgZXhj
aXRpbmcuIFdoYXQgd2UgaGF2ZSBpbiB0aGUgY29kZQo+IG5vdyAtIHByaW50aygiJXMgYmxhaFxu
IiwgbHZsKSAtIGlzIG5vdCB3aGF0IHdlIHNlZSBpbiB0aGUgbG9ncy4KPiBCZWNhdXNlIHRoZSBs
ZWFkaW5nICclcycgYmVjb21lcyBzcGVjaWFsLiBBbmQgcHJpbnRrKCkvc3ByaW50ZigpCj4gZG9j
dW1lbnRhdGlvbiBzaG91bGQgcmVmbGVjdCB0aGF0OiAnJXMnIHByaW50cyBhIHN0cmluZywgYnV0
IHNvbWV0aW1lcwo+IGl0IGRvZXNuJ3QuCgpJIHBlcnNvbmFsbHkgZG8gbm90IHNlZSB0aGlzIGFz
IGEgYmlnIHByb2JsZW0uCgpUaGUgZXhwbGljaXRseSBwYXNzZWQgbG9nbGV2ZWwgbWFrZXMgbWUg
ZmVlbCBtb3JlIGNvbmZpZGVudCB0aGF0CmFsbCBuZWVkZWQgcHJpbnRrKCkgY2FsbHMgd2VyZSB1
cGRhdGVkLiBCdXQgaXQgbWlnaHQgYmUgYSBmYWxzZQpmZWVsaW5nLiBJIGRvIG5vdCByZWFsbHkg
aGF2ZSBhbnkgc3Ryb25nIHByZWZlcmVuY2UuCgpCZXN0IFJlZ2FyZHMsClBldHIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

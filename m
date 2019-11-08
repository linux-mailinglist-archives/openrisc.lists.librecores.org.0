Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1D2F7415
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EE328207EB;
	Mon, 11 Nov 2019 13:37:43 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 6D63420132
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 14:04:56 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4150BABE8;
 Fri,  8 Nov 2019 13:04:55 +0000 (UTC)
Date: Fri, 8 Nov 2019 14:04:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Message-ID: <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108103719.GB175344@google.com>
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

T24gRnJpIDIwMTktMTEtMDggMTk6Mzc6MTksIFNlcmdleSBTZW5vemhhdHNreSB3cm90ZToKPiBP
biAoMTkvMTEvMDYgMDk6MzUpLCBQZXRyIE1sYWRlayB3cm90ZToKPiA+IEkgYWdyZWUgd2l0aCBh
bGwgdGhlIG90aGVyIGp1c3RpZmljYXRpb24uCj4gPiAKPiA+IEkgd291bGQgYWRkLiBUaGUgYmFj
a3RyYWNlIGlzIHJlYWxseSB1c2VmdWwgZm9yIGRlYnVnZ2luZy4gSXQgc2hvdWxkCj4gPiBiZSBw
b3NzaWJsZSB0byBwcmludCBpdCBldmVuIGluIGxlc3MgY3JpdGljYWwgc2l0dWF0aW9ucy4KPiAK
PiBIbW0sIEkgZG9uJ3Qga25vdy4KPiBEbyB3ZSByZWFsbHkgbmVlZCBkZWJ1Zy9pbmZvIGxldmVs
IGJhY2t0cmFjZXM/CgpkZWJ1ZyBpcyBleGFjdGx5IHRoZSBsb2dsZXZlbCB3aGVyZSByZWdpc3Ry
eSBjb250ZW50IGFuZCBiYWNrdHJhY2UKbWlnaHQgYmUgdmVyeSB1c2VmdWwuIEl0IGlzIG5vdCBh
bHdheXMgaW1wb3J0YW50IHRvIHJlYWNoIHRoZSBjb25zb2xlLgoKCj4gTWF5IGJlIGFsbCBiYWNr
dHJhY2VzIGNhbiBiZSBjb252ZXJ0ZWQgdG8gc29tZXRoaW5nIG1vcmUgc2V2ZXJlCj4gKHNvIHdl
IGNhbiBzdG9wIHBsYXlpbmcgZ2FtZXMgd2l0aCBsb2dsdmwpIGFuZCB0aGVuIHdlIGNhbgo+IGNs
ZWFuIHVwICIoYWIpdXNlcnMiPwoKSU1ITywgd2Ugc2hvdWxkIGRpc3Rpbmd1aXNoIHdhcm5pbmcs
IGVycm9yLCBjcml0LCBhbGVydCwgZW1lcmcKc2l0dWF0aW9ucy4gQmFja3RyYWNlcyBhbmQgYW55
IHJlbGF0ZWQgbWVzc2FnZXMgc2hvdWxkIGJlCmZpbHRlcmVkIHRoZSBzYW1lIHdheS4gQW55IGlu
Zm9ybWF0aW9uIG1pZ2h0IGJlIHVzZWxlc3Mgd2l0aG91dAp0aGUgY29udGV4dC4KCkkgYWdyZWUg
dGhhdCBpdCBpcyBjb21wbGljYXRlZCB0byBwYXNzIHRoZSBsb2dsZXZlbCBhcwphIHBhcmFtZXRl
ci4gSXQgd291bGQgYmUgYmV0dGVyIGRlZmluZSB0aGUgZGVmYXVsdApsb2cgbGV2ZWwgZm9yIGEg
Z2l2ZW4gY29kZSBzZWN0aW9uLiBJdCBtaWdodCBiZSBzdG9yZWQKaW4gdGFza19zdHJ1Y3QgZm9y
IHRoZSBub3JtYWwgY29udGV4dCBhbmQgaW4gcGVyLUNQVQp2YXJpYWJsZXMgZm9yIGludGVycnVw
dCBjb250ZXh0cy4KCkJlc3QgUmVnYXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

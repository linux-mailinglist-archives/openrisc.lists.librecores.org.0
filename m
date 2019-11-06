Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76249F7401
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A036C20136;
	Mon, 11 Nov 2019 13:37:32 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by mail.librecores.org (Postfix) with ESMTPS id 2A7F0206EC
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 09:35:48 +0100 (CET)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19FADAE65;
 Wed,  6 Nov 2019 08:35:47 +0000 (UTC)
Date: Wed, 6 Nov 2019 09:35:38 +0100
From: Petr Mladek <pmladek@suse.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
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
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-um@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
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

T24gV2VkIDIwMTktMTEtMDYgMDM6MDQ6NTEsIERtaXRyeSBTYWZvbm92IHdyb3RlOgo+IEFkZCBs
b2cgbGV2ZWwgYXJndW1lbnQgdG8gc2hvd19zdGFjaygpLgo+IERvbmUgaW4gdGhyZWUgc3RhZ2Vz
Ogo+IDEuIEludHJvZHVjaW5nIHNob3dfc3RhY2tfbG9nbHZsKCkgZm9yIGV2ZXJ5IGFyY2hpdGVj
dHVyZQo+IDIuIE1pZ3JhdGluZyBvbGQgdXNlcnMgd2l0aCBhbiBleHBsaWNpdCBsb2cgbGV2ZWwK
PiAzLiBSZW5hbWluZyBzaG93X3N0YWNrX2xvZ2x2bCgpIGludG8gc2hvd19zdGFjaygpCj4gCj4g
SnVzdGlmaWNhdGlvbjoKPiBvIEl0J3MgYSBkZXNpZ24gbWlzdGFrZSB0byBtb3ZlIGEgYnVzaW5l
c3MtbG9naWMgZGVjaXNpb24KPiAgIGludG8gcGxhdGZvcm0gcmVhbGl6YXRpb24gZGV0YWlsLgo+
IG8gSSBoYXZlIGN1cnJlbnRseSB0d28gcGF0Y2hlcyBzZXRzIHRoYXQgd291bGQgYmVuZWZpdCBm
cm9tIHRoaXMgd29yazoKPiAgIFJlbW92aW5nIGNvbnNvbGVfbG9nbGV2ZWwganVtcHMgaW4gc3lz
cnEgZHJpdmVyIFsxXQoKSnVzdCB0byBjbGFyaWZ5LiBUaGUgcHJvYmxlbSBpbiBzeXNycSBkcml2
ZXIgaXMgYSBiaXQgZGlmZmVyZW50LgpJdCBtb2RpZmllcyBjb25zb2xlX2xvZ2xldmVsIHRvIHNo
b3cgZXZlbiBsZXNzIGltcG9ydGFudCBtZXNzYWdlCm9uIHRoZSBjb25zb2xlLgoKSU1ITywgaXQg
c2hvdWxkIGJlIHNvbHZlZCBieSBwcmludGluZyB0aGUgaGVhZGVyIGxpbmUgd2l0aCBwcl9lcnJv
cigpLgpJdCBpcyBub3QgaWRlYWwuIEEgY2xlYW5lciBzb2x1dGlvbiBtaWdodCBiZSB0byBpbnRy
b2R1Y2UgYW5vdGhlcgpsb2dsZXZlbCB0aGF0IHdpbGwgYWx3YXlzIGdldCBwdXNoZWQgdG8gdGhl
IGNvbnNvbGUuIEJ1dCBJIGFtCm5vdCBzdXJlIGlmIGl0IGlzIHdvcnRoIHRoaXMgc2luZ2xlIGxp
bmUuCgo+ICAgSHVuZyB0YXNrIHdhcm5pbmcgYmVmb3JlIHBhbmljIFsyXSAtIHN1Z2dlc3RlZCBi
eSBUZXRzdW8gKGJ1dCBoZQo+ICAgcHJvYmFibHkgZGlkbid0IHJlYWxpc2Ugd2hhdCBpdCB3b3Vs
ZCBpbnZvbHZlKS4KPiBvIFdoaWxlIGRvaW5nICgxKSwgKDIpIHRoZSBiYWNrdHJhY2VzIHdlcmUg
YWRqdXN0ZWQgdG8gaGVhZGVycwo+ICAgYW5kIG90aGVyIG1lc3NhZ2VzIGZvciBlYWNoIHNpdHVh
dGlvbiAtIHNvIHRoZXJlIHdvbid0IGJlIGEgc2l0dWF0aW9uCj4gICB3aGVuIHRoZSBiYWNrdHJh
Y2UgaXMgcHJpbnRlZCwgYnV0IHRoZSBoZWFkZXJzIGFyZSBtaXNzaW5nIGJlY2F1c2UKPiAgIHRo
ZXkgaGF2ZSBsZXNzZXIgbG9nIGxldmVsIChvciB0aGUgcmV2ZXJzZSkuCj4gbyBBcyB0aGUgcmVz
dWx0IGluICgyKSBwbGF5cyB3aXRoIGNvbnNvbGVfbG9nbGV2ZWwgZm9yIGtkYiBhcmUgcmVtb3Zl
ZC4KCj4gVGhlIGxlYXN0IGltcG9ydGFudCBmb3IgdXBzdHJlYW0sIGJ1dCBtYXliZSBzdGlsbCB3
b3J0aCB0byBub3RlIHRoYXQKPiBldmVyeSBjb21wYW55IEkndmUgd29ya2VkIGluIHNvIGZhciBo
YWQgYW4gb2ZmLWxpc3QgcGF0Y2ggdG8gcHJpbnQKPiBiYWNrdHJhY2Ugd2l0aCB0aGUgbmVlZGVk
IGxvZyBsZXZlbCAoYnV0IG9ubHkgZm9yIHRoZSBhcmNoaXRlY3R1cmUgdGhleQo+IGNhcmVkIGFi
b3V0KS4KPiBJZiB5b3UgaGF2ZSBvdGhlciBpZGVhcyBob3cgeW91IHdpbGwgYmVuZWZpdCBmcm9t
IHNob3dfc3RhY2soKSB3aXRoCj4gYSBsb2cgbGV2ZWwgLSBwbGVhc2UsIHJlcGx5IHRvIHRoaXMg
Y292ZXIgbGV0dGVyLgoKSSBhZ3JlZSB3aXRoIGFsbCB0aGUgb3RoZXIganVzdGlmaWNhdGlvbi4K
Ckkgd291bGQgYWRkLiBUaGUgYmFja3RyYWNlIGlzIHJlYWxseSB1c2VmdWwgZm9yIGRlYnVnZ2lu
Zy4gSXQgc2hvdWxkCmJlIHBvc3NpYmxlIHRvIHByaW50IGl0IGV2ZW4gaW4gbGVzcyBjcml0aWNh
bCBzaXR1YXRpb25zLgoKSSBhbSBhZnJhaWQgdGhhdCBtYW55IHBlb3BsZSB1c2UgV0FSTigpIGZv
ciB0aGlzIHB1cnBvc2UuIEJ1dCBXQVJOKCkKaXMgbm90IGFsd2F5cyBhcHByb3ByaWF0ZS4gV0FS
TigpIG1pc3VzZSBodXRzIHdoZW4gcGFuaWNfb25fd2FybgpvcHRpb24gaXMgdXNlZC4KCkJlc3Qg
UmVnYXJkcywKUGV0cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

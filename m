Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 21127F7417
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 043DD207F2;
	Mon, 11 Nov 2019 13:37:44 +0100 (CET)
Received: from pandora.armlinux.org.uk (unknown [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id A9CF22075C
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 18:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OKQ8ybzqBvVwbNEFVvCvShIsxDoVn1JKRJjkQiqoKU=; b=swiYqGJ7LEVqyrrRsI7H1eTTa
 hKUL+RUA60U6nmKfQ3wx4HeACdCMgfizQI7y71CmrPZ9FkR78hjjzmqBZLEHXPhbl2wyXwtowYyht
 q3s2gW++t5nGtMEhwRgjQdMHHO6gZwwwuAzS21l3ty+eVTpDYUq3y7bBgzQWbko3SSiRfkjM9FyAG
 ozIGQYkMiL4DSG7CHuy+TRP0trl6r2Nd1q0qtEbaW+lBXN63gMwtPy6r2GzdFA2Jn6NOahkxyCgl6
 RA7vVtn4kk9c9iT0zwgIxtjo4SQcsvTNqcn2tKatz1/KsHP3DQuGLUdi5b2RLs4XIvzS7bfH1igZp
 ONICUo7nw==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:53540)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iT86P-0003rG-IT; Fri, 08 Nov 2019 17:31:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iT85t-000697-Tp; Fri, 08 Nov 2019 17:30:45 +0000
Date: Fri, 8 Nov 2019 17:30:45 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191108173045.GY25745@shell.armlinux.org.uk>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
 <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Vasily Gorbik <gor@linux.ibm.com>,
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
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 X86 ML <x86@kernel.org>, clang-built-linux@googlegroups.com,
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

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDQ6Mjg6MzBQTSArMDAwMCwgRG1pdHJ5IFNhZm9ub3Yg
d3JvdGU6Cj4gT24gMTEvNi8xOSA4OjM0IFBNLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+IE9u
IFdlZCwgTm92IDA2LCAyMDE5IGF0IDA0OjI3OjMzUE0gKzAwMDAsIERtaXRyeSBTYWZvbm92IHdy
b3RlOgo+IFsuLl0KPiA+PiBTb3JyeSwgSSBzaG91bGQgaGF2ZSB0cmllZCB0byBkZXNjcmliZSBi
ZXR0ZXIuCj4gPj4KPiA+PiBJJ20gdHJ5aW5nIHRvIHJlbW92ZSBleHRlcm5hbCB1c2VycyBvZiBj
b25zb2xlX2xvZ2xldmVsIGJ5IGZvbGxvd2luZwo+ID4+IHJlYXNvbnM6Cj4gPgo+ID4gSSBzdXBw
b3NlIHNpbmNlIGFsbCBteSBtYWNoaW5lcyBoYXZlICdkZWJ1ZyBpZ25vcmVfbG9nbGV2ZWwKPiA+
IGVhcmx5cHJpbnRrPXNlcmlhbCx0dHlTMCwxMTUyMDAgY29uc29sZT10dHlTMCwxMTUyMDAnIEkg
ZG9uJ3QgaGF2ZSB0aGlzCj4gPiBleHBlcmllbmNlLgo+IAo+IFllYWgsIEkgcmVtZW1iZXIgeW91
IGF2b2lkIGFsbCB0aG9zZSBmdW5jdGlvbmFsaXRpZXMgb2YgcHJpbnRrKCksIGZhaXIKPiBlbm91
Z2guIE9uIHRoZSBvdGhlciBzaWRlLCByZWd1bGFyIHVzZXJzIGFuZCBJJ20gYmV0dGluZyBtb3N0
IG9mCj4gdGhlIG5vbi10dW5lZCBkaXN0cmlidXRpb25zIHVzZSAvcHJvYy9zeXMva2VybmVsL3By
aW50ayBieSBkZWZhdWx0Lgo+IChDaGVja2luZyBvbiBteSBBcmNoICYgRmVkb3JhIC0gbG9nbGV2
ZWwgNCBmcm9tIHRoZSBib3gpCj4gCj4gPj4gLSBjaGFuZ2luZyBjb25zb2xlX2xvZ2xldmVsIG9u
IFNNUCBtZWFucyB0aGF0IHVud2FudGVkIG1lc3NhZ2VzIGZyb20KPiA+PiBvdGhlciBDUFVzIHdp
bGwgYXBwZWFyICh0aGF0IGhhdmUgbG93ZXIgbG9nIGxldmVsKQo+ID4+IC0gb24gVU1QIHVud2Fu
dGVkIG1lc3NhZ2VzIG1heSBhcHBlYXIgaWYgdGhlIGNvZGUgaXMgcHJlZW1wdGVkIHdoaWxlIGl0
Cj4gPj4gaGFzbid0IHNldCB0aGUgY29uc29sZV9sb2dsZXZlbCBiYWNrIHRvIG9sZAo+ID4+IC0g
cmlzaW5nIGNvbnNvbGVfbG9nbGV2ZWwgdG8gcHJpbnQgd2FudGVkIG1lc3NhZ2UocykgbWF5IG5v
dCB3b3JrIGF0IGFsbAo+ID4+IGlmIHByaW50aygpIGhhcyBiZWluZyBkZWxheWVkIGFuZCB0aGUg
Y29uc29sZV9sb2dsZXZlbCBpcyBhbHJlYWR5IHNldAo+ID4+IGJhY2sgdG8gb2xkIHZhbHVlCj4g
Pgo+ID4gU3VyZSwgZnJvYmJpbmcgdGhlIGdsb2JhbCBjb25zb2xlX2xvZ2xldmVsIGlzIGJhZC4K
PiA+Cj4gPj4gSSBhbHNvIGhhdmUgcGF0Y2hlcyBpbiB3aXAgdGhvc2UgbmVlZHMgdG8gcHJpbnQg
YmFja3RyYWNlIHdpdGggc3BlY2lmaWMKPiA+PiBsb2dsZXZlbCAoaGlnaGVyIHdoZW4gaXQncyBj
cml0aWNhbCwgbG93ZXIgd2hlbiBpdCdzIG5vdGljZSBhbmQKPiA+PiBzaG91bGRuJ3QgZ28gdG8g
c2VyaWFsIGNvbnNvbGUpLgo+ID4KPiA+IChldmVyeXRoaW5nIGFsd2F5cyBzaG91bGQgZ28gdG8g
c2VyaWFsLCBzZXJpYWwgaXMgYXdlc29tZSA6LSkKPiAKPiBQZXJzb25hbGx5IEkgYWdyZWUuIFVu
Zm9ydHVuYXRlbHksIGhlcmUgQEFyaXN0YSB0aGVyZSBhcmUgc3dpdGNoZXMgKEknbQo+IHNwZWFr
aW5nIGFib3V0IHRoZSBvcmRlciBvZiB0aG91c2FuZHMgYXQgbGVhc3QpIHRob3NlIGhhdmUgYmF1
ZC1yYXRlIDk2MDAuCj4gSXQncyBhIGJpdCBleHBlbnNpdmUgYmVpbmcgZWxhYm9yYXRlIHdpdGgg
c3VjaCBzZXR1cC4KPiAKPiA+PiBCZXNpZGVzIG9uIGxvY2FsIHRlc3RzIEkgc2VlIGhpdHMgdGhv
c2UgaGF2ZSBoZWFkZXJzIChtZXNzYWdlcyBsaWtlCj4gPj4gIkJhY2t0cmFjZTogIikgd2l0aG91
dCBhbiBhY3R1YWwgYmFja3RyYWNlIGFuZCB0aGUgcmV2ZXJzZSAtIGEgYmFja3RyYWNlCj4gPj4g
d2l0aG91dCBhIHJlYXNvbiBmb3IgaXQuIEl0J3MgcXVpdGUgYW5ub3lpbmcgYW5kIHdvcnRoIGFk
ZHJlc3NpbmcgYnkKPiA+PiBzeW5jaW5nIGhlYWRlcnMgbG9nIGxldmVscyB0byBiYWNrdHJhY2Vz
Lgo+ID4KPiA+IEkgc3VwcG9zZSBJJ20gc3VycHJpc2VkIHRoZXJlIGFyZSBiYWNrdHJhY2VzIHRo
YXQgYXJlIG5vdCBpbXBvcnRhbnQuCj4gPiBFaXRoZXIgYmFkbmVzcyBoYXBwZW5lZCBhbmQgaXQg
bmVlZHMgcHJpbnRpbmcsIG9yIHRoZSB1c2VyIGFza2VkIGZvciBpdAo+ID4gYW5kIGl0IG5lZWRz
IHByaW50aW5nLgo+ID4KPiA+IFBlcmhhcHMgd2Ugc2hvdWxkIGJlIHJlbW92aW5nIGJhY2t0cmFj
ZXMgaWYgdGhleSdyZSBub3QgaW1wb3J0YW50Cj4gPiBpbnN0ZWFkIG9mIGFsbG93aW5nIHRvIHBy
aW50IHRoZW0gYXMgbG93ZXIgbG9nbGV2ZWxzPwo+IAo+IFdlbGwsIHRoZSB1c2UtY2FzZSBmb3Ig
bG93ZXIgbG9nLWxldmVsIGlzIHRoYXQgZXZlcnl0aGluZyBnb2VzIGludG8gbG9ncwo+ICgvdmFy
L2xvZy9kbWVzZyBvciAvdmFyL2xvZy9tZXNzYWdlcyB3aGF0ZXZlciByc3lzbG9nIGhhcyBzZXR0
dGluZykuCj4gCj4gVGhhdCBoYXMgaXQncyB2YWx1ZToKPiAtIGFmdGVyIGEgZmFpbHVyZSAoaS5l
LiBwYW5pYykgbWVzc2FnZXMsIHRob3NlIHdlcmUgb25seSBzaWducyB0aGF0Cj4gc29tZXRoaW5n
IGdvZXMgd3JvbmcgY2FuIGJlIHNlZW4gaW4gbG9ncyB3aGljaCBjYW4gZ2l2ZSBpZGVhcyB3aGF0
IGhhcwo+IGhhcHBlbmVkLgoKTm8gdGhleSBkb24ndC4gIFdoZW4gdGhlIGtlcm5lbCBwYW5pY3Ms
IHVzZXJzcGFjZSBnZW5lcmFsbHkgc3RvcHMKcnVubmluZywgc28gcnN5c2xvZyB3b24ndCBiZSBh
YmxlIHRvIHdyaXRlIHRoZW0gdG8gL3Zhci9sb2cvbWVzc2FnZXMuCgpIb3csIGJ5ICJrZXJuZWwg
cGFuaWNzIiBJIG1lYW4gYSByZWFsIGtlcm5lbCBwYW5pYywgd2hpY2ggcHJvYmFibHkKaXNuJ3Qg
d2hhdCB5b3UncmUgdGFsa2luZyBhYm91dCB0aGVyZS4gIFlvdSBhcmUgcHJvYmFibHkgdGFsa2lu
ZwphYm91dCB0aGUgd2hvbGUgc2hlYmFuZyBvZiBub24tZmF0YWwga2VybmVsIG9vcHMsIGtlcm5l
bCB3YXJuaW5ncwphbmQgdGhlIGxpa2UuICBJZiBzbywgSSdkIGFzayB5b3UgdG8gc3RvcCBjb25m
dXp6aWxhdGluZyB0ZXJtaW5vbG9neS4KCklmIHlvdSByZWFsbHkgd2FudCB0byBjYXB0dXJlIHN1
Y2ggZXZlbnRzLCB0aGVuIHlvdSBuZWVkIHRvIGhhdmUgdGhlCmtlcm5lbCB3cml0ZSB0aGUgcGFu
aWMgdG8gKGUuZy4pIGZsYXNoIC0gc2VlIHRoZSBtdGRvb3BzIGRyaXZlci4KCi0tIApSTUsncyBQ
YXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hl
cy8KRlRUQyBicm9hZGJhbmQgZm9yIDAuOG1pbGUgbGluZSBpbiBzdWJ1cmJpYTogc3luYyBhdCAx
Mi4xTWJwcyBkb3duIDYyMmticHMgdXAKQWNjb3JkaW5nIHRvIHNwZWVkdGVzdC5uZXQ6IDExLjlN
YnBzIGRvd24gNTAwa2JwcyB1cApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

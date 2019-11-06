Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 392C6F7409
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AD1BE20629;
	Mon, 11 Nov 2019 13:37:37 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 36F2A20747
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 21:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJrcQXptkMvPiExxcW5iB0NzeMYZeKfH93+EIxkwDzY=; b=dLqPPOZnjveWBeyFqFHqrbtNZ
 Duw5YArJPTaMMMK8SsjUxFjkIDQhNUSGD5PvNQVqSS+e/GWXU1Um5AVf/5sUPjLz45CKuM0IRDAMs
 VJOI3PF4FsdFW2Mj099DRLCzazEzb+zrotnV0I1WVxXeWHoGdNsYMsg3hXOH54aFacQzs/oy4AisX
 0iQV33+aUEMHy+n5TIl+aUKiWMNj3wlvtrjuO4fCRVPkUgi8SKL+BQOZYBkn7NslBLpVF53Y5s7wl
 nyOBB1ExO8CnC6/BiF+fSyjnLlUc7UEIcgZ13IIdTf4f2/4oA2gULPIuZ+oV94CGzcp/+zHem6q8U
 4ISIm47TA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSS0p-0001aI-GA; Wed, 06 Nov 2019 20:34:43 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id C2126980DF5; Wed,  6 Nov 2019 21:34:40 +0100 (CET)
Date: Wed, 6 Nov 2019 21:34:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDQ6Mjc6MzNQTSArMDAwMCwgRG1pdHJ5IFNhZm9ub3Yg
d3JvdGU6Cj4gSGkgUGV0ZXIsCj4gCj4gT24gMTEvNi8xOSA5OjIwIEFNLCBQZXRlciBaaWpsc3Ry
YSB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDA2LCAyMDE5IGF0IDAzOjA0OjUxQU0gKzAwMDAsIERt
aXRyeSBTYWZvbm92IHdyb3RlOgo+ID4+IEFkZCBsb2cgbGV2ZWwgYXJndW1lbnQgdG8gc2hvd19z
dGFjaygpLgo+ID4+IERvbmUgaW4gdGhyZWUgc3RhZ2VzOgo+ID4+IDEuIEludHJvZHVjaW5nIHNo
b3dfc3RhY2tfbG9nbHZsKCkgZm9yIGV2ZXJ5IGFyY2hpdGVjdHVyZQo+ID4+IDIuIE1pZ3JhdGlu
ZyBvbGQgdXNlcnMgd2l0aCBhbiBleHBsaWNpdCBsb2cgbGV2ZWwKPiA+PiAzLiBSZW5hbWluZyBz
aG93X3N0YWNrX2xvZ2x2bCgpIGludG8gc2hvd19zdGFjaygpCj4gPj4KPiA+PiBKdXN0aWZpY2F0
aW9uOgo+ID4+IG8gSXQncyBhIGRlc2lnbiBtaXN0YWtlIHRvIG1vdmUgYSBidXNpbmVzcy1sb2dp
YyBkZWNpc2lvbgo+ID4+ICAgaW50byBwbGF0Zm9ybSByZWFsaXphdGlvbiBkZXRhaWwuCj4gPj4g
byBJIGhhdmUgY3VycmVudGx5IHR3byBwYXRjaGVzIHNldHMgdGhhdCB3b3VsZCBiZW5lZml0IGZy
b20gdGhpcyB3b3JrOgo+ID4+ICAgUmVtb3ZpbmcgY29uc29sZV9sb2dsZXZlbCBqdW1wcyBpbiBz
eXNycSBkcml2ZXIgWzFdCj4gPj4gICBIdW5nIHRhc2sgd2FybmluZyBiZWZvcmUgcGFuaWMgWzJd
IC0gc3VnZ2VzdGVkIGJ5IFRldHN1byAoYnV0IGhlCj4gPj4gICBwcm9iYWJseSBkaWRuJ3QgcmVh
bGlzZSB3aGF0IGl0IHdvdWxkIGludm9sdmUpLgo+ID4+IG8gV2hpbGUgZG9pbmcgKDEpLCAoMikg
dGhlIGJhY2t0cmFjZXMgd2VyZSBhZGp1c3RlZCB0byBoZWFkZXJzCj4gPj4gICBhbmQgb3RoZXIg
bWVzc2FnZXMgZm9yIGVhY2ggc2l0dWF0aW9uIC0gc28gdGhlcmUgd29uJ3QgYmUgYSBzaXR1YXRp
b24KPiA+PiAgIHdoZW4gdGhlIGJhY2t0cmFjZSBpcyBwcmludGVkLCBidXQgdGhlIGhlYWRlcnMg
YXJlIG1pc3NpbmcgYmVjYXVzZQo+ID4+ICAgdGhleSBoYXZlIGxlc3NlciBsb2cgbGV2ZWwgKG9y
IHRoZSByZXZlcnNlKS4KPiA+PiBvIEFzIHRoZSByZXN1bHQgaW4gKDIpIHBsYXlzIHdpdGggY29u
c29sZV9sb2dsZXZlbCBmb3Iga2RiIGFyZSByZW1vdmVkLgo+ID4gCj4gPiBJIHJlYWxseSBkb24n
dCB1bmRlcnN0YW5kIHRoYXQgd29yZCBzYWxhZC4gV2h5IGFyZSB5b3UgZG9pbmcgdGhpcz8KPiA+
IAo+IAo+IFNvcnJ5LCBJIHNob3VsZCBoYXZlIHRyaWVkIHRvIGRlc2NyaWJlIGJldHRlci4KPiAK
PiBJJ20gdHJ5aW5nIHRvIHJlbW92ZSBleHRlcm5hbCB1c2VycyBvZiBjb25zb2xlX2xvZ2xldmVs
IGJ5IGZvbGxvd2luZwo+IHJlYXNvbnM6CgpJIHN1cHBvc2Ugc2luY2UgYWxsIG15IG1hY2hpbmVz
IGhhdmUgJ2RlYnVnIGlnbm9yZV9sb2dsZXZlbAplYXJseXByaW50az1zZXJpYWwsdHR5UzAsMTE1
MjAwIGNvbnNvbGU9dHR5UzAsMTE1MjAwJyBJIGRvbid0IGhhdmUgdGhpcwpleHBlcmllbmNlLgoK
PiAtIGNoYW5naW5nIGNvbnNvbGVfbG9nbGV2ZWwgb24gU01QIG1lYW5zIHRoYXQgdW53YW50ZWQg
bWVzc2FnZXMgZnJvbQo+IG90aGVyIENQVXMgd2lsbCBhcHBlYXIgKHRoYXQgaGF2ZSBsb3dlciBs
b2cgbGV2ZWwpCj4gLSBvbiBVTVAgdW53YW50ZWQgbWVzc2FnZXMgbWF5IGFwcGVhciBpZiB0aGUg
Y29kZSBpcyBwcmVlbXB0ZWQgd2hpbGUgaXQKPiBoYXNuJ3Qgc2V0IHRoZSBjb25zb2xlX2xvZ2xl
dmVsIGJhY2sgdG8gb2xkCj4gLSByaXNpbmcgY29uc29sZV9sb2dsZXZlbCB0byBwcmludCB3YW50
ZWQgbWVzc2FnZShzKSBtYXkgbm90IHdvcmsgYXQgYWxsCj4gaWYgcHJpbnRrKCkgaGFzIGJlaW5n
IGRlbGF5ZWQgYW5kIHRoZSBjb25zb2xlX2xvZ2xldmVsIGlzIGFscmVhZHkgc2V0Cj4gYmFjayB0
byBvbGQgdmFsdWUKClN1cmUsIGZyb2JiaW5nIHRoZSBnbG9iYWwgY29uc29sZV9sb2dsZXZlbCBp
cyBiYWQuCgo+IEkgYWxzbyBoYXZlIHBhdGNoZXMgaW4gd2lwIHRob3NlIG5lZWRzIHRvIHByaW50
IGJhY2t0cmFjZSB3aXRoIHNwZWNpZmljCj4gbG9nbGV2ZWwgKGhpZ2hlciB3aGVuIGl0J3MgY3Jp
dGljYWwsIGxvd2VyIHdoZW4gaXQncyBub3RpY2UgYW5kCj4gc2hvdWxkbid0IGdvIHRvIHNlcmlh
bCBjb25zb2xlKS4KCihldmVyeXRoaW5nIGFsd2F5cyBzaG91bGQgZ28gdG8gc2VyaWFsLCBzZXJp
YWwgaXMgYXdlc29tZSA6LSkKCj4gQmVzaWRlcyBvbiBsb2NhbCB0ZXN0cyBJIHNlZSBoaXRzIHRo
b3NlIGhhdmUgaGVhZGVycyAobWVzc2FnZXMgbGlrZQo+ICJCYWNrdHJhY2U6ICIpIHdpdGhvdXQg
YW4gYWN0dWFsIGJhY2t0cmFjZSBhbmQgdGhlIHJldmVyc2UgLSBhIGJhY2t0cmFjZQo+IHdpdGhv
dXQgYSByZWFzb24gZm9yIGl0LiBJdCdzIHF1aXRlIGFubm95aW5nIGFuZCB3b3J0aCBhZGRyZXNz
aW5nIGJ5Cj4gc3luY2luZyBoZWFkZXJzIGxvZyBsZXZlbHMgdG8gYmFja3RyYWNlcy4KCkkgc3Vw
cG9zZSBJJ20gc3VycHJpc2VkIHRoZXJlIGFyZSBiYWNrdHJhY2VzIHRoYXQgYXJlIG5vdCBpbXBv
cnRhbnQuCkVpdGhlciBiYWRuZXNzIGhhcHBlbmVkIGFuZCBpdCBuZWVkcyBwcmludGluZywgb3Ig
dGhlIHVzZXIgYXNrZWQgZm9yIGl0CmFuZCBpdCBuZWVkcyBwcmludGluZy4KClBlcmhhcHMgd2Ug
c2hvdWxkIGJlIHJlbW92aW5nIGJhY2t0cmFjZXMgaWYgdGhleSdyZSBub3QgaW1wb3J0YW50Cmlu
c3RlYWQgb2YgYWxsb3dpbmcgdG8gcHJpbnQgdGhlbSBhcyBsb3dlciBsb2dsZXZlbHM/Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

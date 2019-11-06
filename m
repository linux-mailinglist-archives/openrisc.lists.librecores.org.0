Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B784CF740A
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9AF3E20225;
	Mon, 11 Nov 2019 13:37:38 +0100 (CET)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by mail.librecores.org (Postfix) with ESMTPS id 2C8DF2073B
 for <openrisc@lists.librecores.org>; Thu,  7 Nov 2019 00:29:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PRxpis2yYVwo9kDaUSfGCl5VFlJxyHbhU0YR7G7gbJ8=; b=iy2paYFVbfDDxvP/gOAeR2zl0
 YOZEPL3WjHOmVg+0OQahNkJkI83R2voT2LINyyq/NpOQgJ8XbP653WAnOCKJeMd3FQfk1r00D1g6Z
 fp0OZxAP4Vl3Ld3lf2vsPvJVAaYSvfV/oRelynTl2M99Xzch5Yo0n9rKkDRrpqI+VDj8uG0IE0Mwu
 DLXZUR9cXBF6yhsVU66Hv9Zw3qb9D4TtgACKhdNRerRuquMvaCXNfaGPMRzGBVS3f+JaE6Gz3Dc5B
 ZjnPN/i029uWQPyVkPtoGc8KSHKL1/41r92P9256aLhtNWmorZhciQ3YdFO8welchayVt2ute4n7E
 rzURiZTZA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:52746)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iSUgS-00085H-Vb; Wed, 06 Nov 2019 23:25:53 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iSUfp-0004Pa-1s; Wed, 06 Nov 2019 23:25:13 +0000
Date: Wed, 6 Nov 2019 23:25:13 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Peter Zijlstra <peterz@infradead.org>
Message-ID: <20191106232512.GU25745@shell.armlinux.org.uk>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDk6MzQ6NDBQTSArMDEwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gSSBzdXBwb3NlIEknbSBzdXJwcmlzZWQgdGhlcmUgYXJlIGJhY2t0cmFjZXMgdGhh
dCBhcmUgbm90IGltcG9ydGFudC4KPiBFaXRoZXIgYmFkbmVzcyBoYXBwZW5lZCBhbmQgaXQgbmVl
ZHMgcHJpbnRpbmcsIG9yIHRoZSB1c2VyIGFza2VkIGZvciBpdAo+IGFuZCBpdCBuZWVkcyBwcmlu
dGluZy4KCk9yIHV0dGVybHkgbWVhbmluZ2xlc3MuCgo+IFBlcmhhcHMgd2Ugc2hvdWxkIGJlIHJl
bW92aW5nIGJhY2t0cmFjZXMgaWYgdGhleSdyZSBub3QgaW1wb3J0YW50Cj4gaW5zdGVhZCBvZiBh
bGxvd2luZyB0byBwcmludCB0aGVtIGFzIGxvd2VyIGxvZ2xldmVscz8KCkRlZmluaXRlbHkhICBX
QVJOX09OKCkgaXMgd2VsbCBvdmVydXNlZCAtIGFuZCBhcyBpcyB0eXBpY2FsLCB1c2VkCndpdGhv
dXQgbXVjaCB0aG91Z2h0LiAgQm91bmQgdG8gaGFwcGVuIGFmdGVyIExpbnVzIGdvdCBzaGlydHkg
YWJvdXQKQlVHX09OKCkgYmVpbmcgb3ZlciB1c2VkLiAgRXZlcnlvbmUganVzdCBncmFiYmVkIHRo
ZSBuZXh0IG5lYXJlc3QgdGhpbmcKdG8gYXNzZXJ0KCkuCgpBcyBhIGtpbmQgb2YgZXhhbXBsZSwg
SSd2ZSByZWNlbnRseSBjb21lIGFjcm9zcyBvbmUgV0FSTl9PTigpIGluIGEKZHJpdmVyIHN1YnN5
c3RlbSAodGhhdCBzaGFsbCByZW1haW4gbmFtZWxlc3MgYXQgdGhlIG1vbWVudCkgd2hpY2ggdmVy
eQpsaWtlbHkgaGFzIG11bHRpcGxlIGRpZmZlcmVudCBkZXZpY2VzIG9uIGEgcGxhdGZvcm0uICBU
aGUgV0FSTl9PTigpCnRyaWdnZXJzIGFzIGEgcmVzdWx0IG9mIGEgcHJvYmxlbSB3aXRoIHRoZSBo
YXJkd2FyZSwgYnV0IGJlY2F1c2UgaXQncyBhCldBUk5fT04oKSwgeW91J3ZlIG5vIGlkZWEgd2hp
Y2ggZGV2aWNlIGhhcyBhIHByb2JsZW0uICBUaGUgYmFja3RyYWNlIGlzCm1vc3RseSBtZWFuaW5n
bGVzcy4gIFNvIHlvdSBrbm93IHRoYXQgYSBwcm9ibGVtIGhhcyBvY2N1cnJlZCwgYnV0IHRoZQpr
ZXJuZWwgcHJpbnRzICp1c2VsZXNzKiBiYWNrdHJhY2UgdG8gbGV0IHlvdSBrbm93LCBhbmQgdG90
YWxseSBvbWl0cwp0aGUgKnVzZWZ1bCogaW5mb3JtYXRpb24uCgotLSAKUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMg
YnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMg
ZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3du
IDUwMGticHMgdXAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

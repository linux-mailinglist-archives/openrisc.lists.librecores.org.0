Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 15631F7402
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08E7320132;
	Mon, 11 Nov 2019 13:37:33 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 3FA44206F6
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 10:21:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XC4fPCw3J3i5aH6OXgVy9H1qRwbB/y9LePlmMadDkeQ=; b=ChIeMW0IZbNT7DDWy38jbL0ti
 o3kdjyNHnjm8CZpcaqKlsG3bH6W2x8fORIgfBYfmM7e5nS0piuqmqum28O0zH/5977tOw4px+tdeS
 oTR+oQSX5ZlLLCwbPSqWqFbvOrVdrNZQaG6kPwneTb7qqLVv0nfzlXYK0ztdA5NXh1Sq3O0rh2L7t
 3kF6Hs7vAdiIgMe4W9PbjKANnM5eic3qCufRluAtUmPDlbf/PoOH4pP8V97waGVRV2PiwFuD7mO5V
 DbuXHw4dzseLAoH/5uIRR0LLRcVINkzsLiGoRAGsofVWC7f1rZCmkGeTl/XGifnDxZqPsBDQ9OfnO
 +Z33+sWYQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSHUe-00058d-4m; Wed, 06 Nov 2019 09:20:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A681A301A79;
 Wed,  6 Nov 2019 10:19:35 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9F3F529A4C2C6; Wed,  6 Nov 2019 10:20:39 +0100 (CET)
Date: Wed, 6 Nov 2019 10:20:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191106092039.GT4131@hirez.programming.kicks-ass.net>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDM6MDQ6NTFBTSArMDAwMCwgRG1pdHJ5IFNhZm9ub3Yg
d3JvdGU6Cj4gQWRkIGxvZyBsZXZlbCBhcmd1bWVudCB0byBzaG93X3N0YWNrKCkuCj4gRG9uZSBp
biB0aHJlZSBzdGFnZXM6Cj4gMS4gSW50cm9kdWNpbmcgc2hvd19zdGFja19sb2dsdmwoKSBmb3Ig
ZXZlcnkgYXJjaGl0ZWN0dXJlCj4gMi4gTWlncmF0aW5nIG9sZCB1c2VycyB3aXRoIGFuIGV4cGxp
Y2l0IGxvZyBsZXZlbAo+IDMuIFJlbmFtaW5nIHNob3dfc3RhY2tfbG9nbHZsKCkgaW50byBzaG93
X3N0YWNrKCkKPiAKPiBKdXN0aWZpY2F0aW9uOgo+IG8gSXQncyBhIGRlc2lnbiBtaXN0YWtlIHRv
IG1vdmUgYSBidXNpbmVzcy1sb2dpYyBkZWNpc2lvbgo+ICAgaW50byBwbGF0Zm9ybSByZWFsaXph
dGlvbiBkZXRhaWwuCj4gbyBJIGhhdmUgY3VycmVudGx5IHR3byBwYXRjaGVzIHNldHMgdGhhdCB3
b3VsZCBiZW5lZml0IGZyb20gdGhpcyB3b3JrOgo+ICAgUmVtb3ZpbmcgY29uc29sZV9sb2dsZXZl
bCBqdW1wcyBpbiBzeXNycSBkcml2ZXIgWzFdCj4gICBIdW5nIHRhc2sgd2FybmluZyBiZWZvcmUg
cGFuaWMgWzJdIC0gc3VnZ2VzdGVkIGJ5IFRldHN1byAoYnV0IGhlCj4gICBwcm9iYWJseSBkaWRu
J3QgcmVhbGlzZSB3aGF0IGl0IHdvdWxkIGludm9sdmUpLgo+IG8gV2hpbGUgZG9pbmcgKDEpLCAo
MikgdGhlIGJhY2t0cmFjZXMgd2VyZSBhZGp1c3RlZCB0byBoZWFkZXJzCj4gICBhbmQgb3RoZXIg
bWVzc2FnZXMgZm9yIGVhY2ggc2l0dWF0aW9uIC0gc28gdGhlcmUgd29uJ3QgYmUgYSBzaXR1YXRp
b24KPiAgIHdoZW4gdGhlIGJhY2t0cmFjZSBpcyBwcmludGVkLCBidXQgdGhlIGhlYWRlcnMgYXJl
IG1pc3NpbmcgYmVjYXVzZQo+ICAgdGhleSBoYXZlIGxlc3NlciBsb2cgbGV2ZWwgKG9yIHRoZSBy
ZXZlcnNlKS4KPiBvIEFzIHRoZSByZXN1bHQgaW4gKDIpIHBsYXlzIHdpdGggY29uc29sZV9sb2ds
ZXZlbCBmb3Iga2RiIGFyZSByZW1vdmVkLgoKSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB0aGF0
IHdvcmQgc2FsYWQuIFdoeSBhcmUgeW91IGRvaW5nIHRoaXM/Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

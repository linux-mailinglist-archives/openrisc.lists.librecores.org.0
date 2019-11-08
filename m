Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4456F7416
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86F85207D0;
	Mon, 11 Nov 2019 13:37:44 +0100 (CET)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by mail.librecores.org (Postfix) with ESMTPS id 221DF205F5
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 17:28:42 +0100 (CET)
Received: by mail-lf1-f67.google.com with SMTP id y6so4929372lfj.2
 for <openrisc@lists.librecores.org>; Fri, 08 Nov 2019 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=;
 b=OFQ83MN4Hmk627ztvJPIKihtIRsS8ZJ3GNTmqGPL14tUmqtruv4K7nmTrdqjRLFkAn
 v66F5LmIzidO2RY0wAc8faHozHlKmYZjXqnWdur1cdgyOYMMPWxMT2qM/13lV7Gll4Nc
 lRCKNQhkBNihdDdl1Z0mCUKrkPWWlSTJj8W9XuLLYhohd1gFs4UlSNvhCs93ZGZd3jBA
 FVTjYbasessxSjfBcyeOLdW+Y8Bd7gD+BB7UCWg2KPTCWA+UwS7+l7bzP+7BahjCAYhI
 nOv6jmxm+6mZbCk5AkWY13lz+e0hU9EGlWVlrK7ojQr4zo4A/XJr3HfWznngkwdMz6Mb
 pEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g8y3Kv95ejyL7msYqyPIoRMuCM9aKky/CsOCvaHvzKM=;
 b=tqR92IYkdmt6E12WU/4c+e37skTYgk8UdIRKAd5zJrzECPiT0Lofc/yg9a8IN5w38p
 Y6BEg/QfkGDOSFoQ8m72ZbWUqAHfjgY5c7RDrtPd97HblW/UixDaNQ1JBJb+nKuHZM/4
 QtJ/qHDdUgZsf93kJVwuNkD/7p6pisInGbu4MlnqhQhh8CEX/Nhp7cXo2ItInQae5dxU
 PXp+eCoPzXVVY6fBQ9eXvr4OwDbVhnRGjmab6G4PQzmQY47I3tAzcGE35vO2w1plPp3E
 UzwQ8lzBnwKQVN0KhGcKcJuPYn7yPEGfQ6mzsvp1UReKE3OZ55uibQn3T9DGpZTYlY7U
 eMWg==
X-Gm-Message-State: APjAAAVh9ED9OL/5DPP5QH/wvjCxf05O4/jdW5EzqzqUUKrE0Fg3O2ql
 2JhbMBlJmfAjJxeANDug/DVPUlPH4HmkEe5jI8lGTg==
X-Google-Smtp-Source: APXvYqzHzf9qj/gQvrMhsVZj/mUBqCeBT0v/95hThrViwKN4rfJkI0AUVqq0YGCyoYWqoiClXSsdpDtSyx/K8KYU40o=
X-Received: by 2002:a19:ab11:: with SMTP id u17mr7519021lfe.78.1573230521103; 
 Fri, 08 Nov 2019 08:28:41 -0800 (PST)
MIME-Version: 1.0
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
In-Reply-To: <20191106203440.GH3079@worktop.programming.kicks-ass.net>
From: Dmitry Safonov <dima@arista.com>
Date: Fri, 8 Nov 2019 16:28:30 +0000
Message-ID: <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
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
 Petr Mladek <pmladek@suse.com>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
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

T24gMTEvNi8xOSA4OjM0IFBNLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiBPbiBXZWQsIE5vdiAw
NiwgMjAxOSBhdCAwNDoyNzozM1BNICswMDAwLCBEbWl0cnkgU2Fmb25vdiB3cm90ZToKWy4uXQo+
PiBTb3JyeSwgSSBzaG91bGQgaGF2ZSB0cmllZCB0byBkZXNjcmliZSBiZXR0ZXIuCj4+Cj4+IEkn
bSB0cnlpbmcgdG8gcmVtb3ZlIGV4dGVybmFsIHVzZXJzIG9mIGNvbnNvbGVfbG9nbGV2ZWwgYnkg
Zm9sbG93aW5nCj4+IHJlYXNvbnM6Cj4KPiBJIHN1cHBvc2Ugc2luY2UgYWxsIG15IG1hY2hpbmVz
IGhhdmUgJ2RlYnVnIGlnbm9yZV9sb2dsZXZlbAo+IGVhcmx5cHJpbnRrPXNlcmlhbCx0dHlTMCwx
MTUyMDAgY29uc29sZT10dHlTMCwxMTUyMDAnIEkgZG9uJ3QgaGF2ZSB0aGlzCj4gZXhwZXJpZW5j
ZS4KClllYWgsIEkgcmVtZW1iZXIgeW91IGF2b2lkIGFsbCB0aG9zZSBmdW5jdGlvbmFsaXRpZXMg
b2YgcHJpbnRrKCksIGZhaXIKZW5vdWdoLiBPbiB0aGUgb3RoZXIgc2lkZSwgcmVndWxhciB1c2Vy
cyBhbmQgSSdtIGJldHRpbmcgbW9zdCBvZgp0aGUgbm9uLXR1bmVkIGRpc3RyaWJ1dGlvbnMgdXNl
IC9wcm9jL3N5cy9rZXJuZWwvcHJpbnRrIGJ5IGRlZmF1bHQuCihDaGVja2luZyBvbiBteSBBcmNo
ICYgRmVkb3JhIC0gbG9nbGV2ZWwgNCBmcm9tIHRoZSBib3gpCgo+PiAtIGNoYW5naW5nIGNvbnNv
bGVfbG9nbGV2ZWwgb24gU01QIG1lYW5zIHRoYXQgdW53YW50ZWQgbWVzc2FnZXMgZnJvbQo+PiBv
dGhlciBDUFVzIHdpbGwgYXBwZWFyICh0aGF0IGhhdmUgbG93ZXIgbG9nIGxldmVsKQo+PiAtIG9u
IFVNUCB1bndhbnRlZCBtZXNzYWdlcyBtYXkgYXBwZWFyIGlmIHRoZSBjb2RlIGlzIHByZWVtcHRl
ZCB3aGlsZSBpdAo+PiBoYXNuJ3Qgc2V0IHRoZSBjb25zb2xlX2xvZ2xldmVsIGJhY2sgdG8gb2xk
Cj4+IC0gcmlzaW5nIGNvbnNvbGVfbG9nbGV2ZWwgdG8gcHJpbnQgd2FudGVkIG1lc3NhZ2Uocykg
bWF5IG5vdCB3b3JrIGF0IGFsbAo+PiBpZiBwcmludGsoKSBoYXMgYmVpbmcgZGVsYXllZCBhbmQg
dGhlIGNvbnNvbGVfbG9nbGV2ZWwgaXMgYWxyZWFkeSBzZXQKPj4gYmFjayB0byBvbGQgdmFsdWUK
Pgo+IFN1cmUsIGZyb2JiaW5nIHRoZSBnbG9iYWwgY29uc29sZV9sb2dsZXZlbCBpcyBiYWQuCj4K
Pj4gSSBhbHNvIGhhdmUgcGF0Y2hlcyBpbiB3aXAgdGhvc2UgbmVlZHMgdG8gcHJpbnQgYmFja3Ry
YWNlIHdpdGggc3BlY2lmaWMKPj4gbG9nbGV2ZWwgKGhpZ2hlciB3aGVuIGl0J3MgY3JpdGljYWws
IGxvd2VyIHdoZW4gaXQncyBub3RpY2UgYW5kCj4+IHNob3VsZG4ndCBnbyB0byBzZXJpYWwgY29u
c29sZSkuCj4KPiAoZXZlcnl0aGluZyBhbHdheXMgc2hvdWxkIGdvIHRvIHNlcmlhbCwgc2VyaWFs
IGlzIGF3ZXNvbWUgOi0pCgpQZXJzb25hbGx5IEkgYWdyZWUuIFVuZm9ydHVuYXRlbHksIGhlcmUg
QEFyaXN0YSB0aGVyZSBhcmUgc3dpdGNoZXMgKEknbQpzcGVha2luZyBhYm91dCB0aGUgb3JkZXIg
b2YgdGhvdXNhbmRzIGF0IGxlYXN0KSB0aG9zZSBoYXZlIGJhdWQtcmF0ZSA5NjAwLgpJdCdzIGEg
Yml0IGV4cGVuc2l2ZSBiZWluZyBlbGFib3JhdGUgd2l0aCBzdWNoIHNldHVwLgoKPj4gQmVzaWRl
cyBvbiBsb2NhbCB0ZXN0cyBJIHNlZSBoaXRzIHRob3NlIGhhdmUgaGVhZGVycyAobWVzc2FnZXMg
bGlrZQo+PiAiQmFja3RyYWNlOiAiKSB3aXRob3V0IGFuIGFjdHVhbCBiYWNrdHJhY2UgYW5kIHRo
ZSByZXZlcnNlIC0gYSBiYWNrdHJhY2UKPj4gd2l0aG91dCBhIHJlYXNvbiBmb3IgaXQuIEl0J3Mg
cXVpdGUgYW5ub3lpbmcgYW5kIHdvcnRoIGFkZHJlc3NpbmcgYnkKPj4gc3luY2luZyBoZWFkZXJz
IGxvZyBsZXZlbHMgdG8gYmFja3RyYWNlcy4KPgo+IEkgc3VwcG9zZSBJJ20gc3VycHJpc2VkIHRo
ZXJlIGFyZSBiYWNrdHJhY2VzIHRoYXQgYXJlIG5vdCBpbXBvcnRhbnQuCj4gRWl0aGVyIGJhZG5l
c3MgaGFwcGVuZWQgYW5kIGl0IG5lZWRzIHByaW50aW5nLCBvciB0aGUgdXNlciBhc2tlZCBmb3Ig
aXQKPiBhbmQgaXQgbmVlZHMgcHJpbnRpbmcuCj4KPiBQZXJoYXBzIHdlIHNob3VsZCBiZSByZW1v
dmluZyBiYWNrdHJhY2VzIGlmIHRoZXkncmUgbm90IGltcG9ydGFudAo+IGluc3RlYWQgb2YgYWxs
b3dpbmcgdG8gcHJpbnQgdGhlbSBhcyBsb3dlciBsb2dsZXZlbHM/CgpXZWxsLCB0aGUgdXNlLWNh
c2UgZm9yIGxvd2VyIGxvZy1sZXZlbCBpcyB0aGF0IGV2ZXJ5dGhpbmcgZ29lcyBpbnRvIGxvZ3MK
KC92YXIvbG9nL2RtZXNnIG9yIC92YXIvbG9nL21lc3NhZ2VzIHdoYXRldmVyIHJzeXNsb2cgaGFz
IHNldHR0aW5nKS4KClRoYXQgaGFzIGl0J3MgdmFsdWU6Ci0gYWZ0ZXIgYSBmYWlsdXJlIChpLmUu
IHBhbmljKSBtZXNzYWdlcywgdGhvc2Ugd2VyZSBvbmx5IHNpZ25zIHRoYXQKc29tZXRoaW5nIGdv
ZXMgd3JvbmcgY2FuIGJlIHNlZW4gaW4gbG9ncyB3aGljaCBjYW4gZ2l2ZSBpZGVhcyB3aGF0IGhh
cwpoYXBwZW5lZC4KLSBiZWZvcmUgdGhlIGZhaWx1cmUsIHRob3NlIG1lc3NhZ2VzIGdvIHRvIHRl
bGVtZXRyeSBhbmQgY2FuIGJlCmF1dG8tbWFnaWNhbGx5IHByb2Nlc3NlZCByZW1vdGVseSB0byB0
YWtlIGEgZGVjaXNpb24gKGUuZy4gYmFsYW5jZSB0aGUKdHJhZmZpYyBhd2F5KS4KCkkgd2lzaCBh
bGwgdGhlIGluZm9ybWF0aW9uIGNvdWxkIGJlIGdhdGhlcmVkIGluIHRoZSB1c2Vyc3BhY2UsIGJ1
dCBtYW55CmV4aXN0aW5nIGtlcm5lbC9kcml2ZXIgbWVzc2FnZXMgYXJlIHZhbHVhYmxlLiBBIG1v
cmUgZGV0YWlsZWQgZXhhbXBsZSBpcwpodW5nIHRhc2sgZGV0ZWN0b3I6IHdlIHdhbnQgdG8gaGF2
ZSB0aGUgYmFja3RyYWNlIGZvciBhIHRhc2sgdGhhdCBpcwppbiB1bmludGVycnVwdGlibGUgc3Rh
dGUgdG9vIGxvbmcsIGJ1dCBvbmx5IGluIGxvZ3MgYXMgcHJpbnRpbmcgb24Kc2VyaWFsIGNvbnNv
bGUgbWF5IGxlYWQgdG8gaG9sZGluZyBjb25zb2xlIGxvY2sgYW5kIHdhdGNoZG9nLgpCZXNpZGVz
IGN1c3RvbWVyIG5vdGlmaWNhdGlvbnMgYW5kIGludmVzdGlnYXRpb25zLCBJIHNlZSB0aGUgdmFs
dWUgb2Ygc3VjaAoiYm90dGxlbmVjayIgd2FybmluZ3MgZHVyaW5nIGxvbmctcnVubmluZyBpbnRl
Z3JhdGlvbiB0ZXN0cy4KClRoYW5rcywKICAgICAgICAgIERtaXRyeQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

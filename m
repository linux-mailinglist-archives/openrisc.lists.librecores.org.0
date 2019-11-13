Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ACA2D101F32
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 67C022047B;
	Tue, 19 Nov 2019 10:04:29 +0100 (CET)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id AE6B42056E
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 17:41:27 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id q26so1997963pfn.11
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=kRXw4AvoWBw7ukkZ2SwH4DcHmhkOyvtHzm9A9tembEe4SHnL/Wkxs4OG+Y78DFYLKj
 WUQkQ3xkRC7KpV6HsQsVQ8Y83U6DSV4bjqqA4yz8eiAzM5MouyPOfpTV04Q+Swaq6dzO
 iwJ3irSL+AWM6APV8kLc/aiqJnine4lrlZLBQET4Kth1bx1KYWl6QngPsxySaS0LA2u8
 4l3EYQWDxhDPyJMBUmdjQ4AlBq5rQRf2tmZq6s9bjkx4QpbhYyBqV94RH9xa8/CrCe8j
 rdAqy2276oEWDDekf+JPcbvdolRg+K/VuqSY8KHpC1K4x4t7plUDL/CedXLaIDpvWCOd
 tkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpYMERXodNN3/IUKFqoV3bu09Kfnjp4MDDbBxGqTaak=;
 b=B+x51l/G9iYgtwdpnsg0mQJRdhEUW+jJpna8v8G/8PnT551a4UWBv2fU7rtTJvAX88
 NvhHbtADLGrI3QK4+ZNhACdWo914SlafCnp5sH2a3aYw+pAcufNAO1sUDKIRBmavFPS/
 hTzUYSCJhGtTHJjEIPda19Ac3t7VIcOaVcH3Rt2ut6eEW9Qg+bC54fZvNPDi8Spm+DbQ
 MWEFHg2/ODxX05DaKO/KRzTy1HLSynJWmJbWhdnSzBCvMg2KLlUB+cUT+Bp7JBFuoVdM
 d41G1tczIcKIDJCF2VnAlm4wzxP+ER2rHOlHuMAcPQyE4a8cOdU0DxECCKcBqk2lPvK+
 yYWA==
X-Gm-Message-State: APjAAAX9nCMFHzjLvXVX4LPxi6Znzud9AAnkrI9dBIsMbQaVE1+rUf2K
 PPG6B8Z0TX5S9Q6fpcecJJfajQ==
X-Google-Smtp-Source: APXvYqxGmsqG/IrGmwAGiFxwnMwQ7BOsmJMkITh9aVjyUYUrJF/k6QpL2RmzoyB1mQQoM3FoiW7TOw==
X-Received: by 2002:a63:c55:: with SMTP id 21mr4829337pgm.282.1573663285447;
 Wed, 13 Nov 2019 08:41:25 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id h4sm2954304pjs.24.2019.11.13.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2019 08:41:24 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com> <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com> <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
Date: Wed, 13 Nov 2019 16:40:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191113063334.GA147997@google.com>
Content-Language: en-US
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
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
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

SGkgU2VyZ2V5LAoKT24gMTEvMTMvMTkgNjozMyBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3Rl
OgpbLi5dCj4gV2VsbCwgaGVyZSB3ZSBnby4gVGhlcmUgaXMgYSBudW1iZXIgb2YgZ2VuZXJhbGx5
IHVzZWZ1bCBmdW5jdGlvbnMgdGhhdAo+IHByaW50IG5pY2UgZGF0YSBhbmQgd2hlcmUgcGVvcGxl
IG1pZ2h0IHdhbnQgdG8gaGF2ZSBiZXR0ZXIgbG9nbGV2ZWwgY29udHJvbAo+IChmb3IgZGVidWdn
aW5nIHB1cnBvc2VzKS4gc2hvd19zdGFjaygpIGlzIGp1c3Qgb25lIG9mIHRoZW0uIFBhdGNoaW5n
IGFsbAo+IHRob3NlIGZ1bmN0aW9ucywgd2hpY2ggeW91IGhhdmUgbWVudGlvbmVkIGFib3ZlLCBp
cyBoYXJkbHkgYSBmdW4gdGFzayB0byBkby4KPiBIZW5jZSB0aGUgcHJpbnRrKCkgcGVyLUNQVSBw
ZXItY29udGV4dCBsb2dsZXZlbCBwcm9wb3NpdGlvbi4gVGhlIGNvZGUgdGhlcmUKPiBpcyBub3Qg
Y2xldmVyIG9yIGNvbXBsaWNhdGVkIGFuZCBpcyBtZWFudCBmb3IgZGVidWdnaW5nIHB1cnBvc2Vz
IG9ubHksIGJ1dAo+IHdpdGgganVzdCAzIGxpbmVzIG9mIGNvZGUgb25lIGNhbiBkbyBzb21lIHN0
dWZmOgo+IAo+IAkvKiBAQlRXIHlvdSBjYW4ndCBkbyB0aGlzIHdpdGggIiVzIiBLRVJOX0ZPTyA7
UCAqLwo+ICsJcHJpbnRrX2VtZXJnZW5jeV9lbnRlcihMT0dMRVZFTF9TQ0hFRCk7Cj4gKwlkZWJ1
Z19zaG93X2FsbF9sb2NrcygpOwo+ICsJcHJpbnRrX2VtZXJnZW5jeV9leGl0KCk7CgpOb3QgdGhh
dCBJIHdhbnQgdG8gY3JpdGljIHlvdXIgcHJvcG9zYWwgbW9yZSwgYnV0IGp1c3QgdG8gY2xhcmlm
eSB3aGF0CkkndmUgbWVhbnQgYnkgImNsZWF2ZXIgYW5kIGNvbXBsaWNhdGVkIjoKCkkgZG9uJ3Qg
dGhpbmsgc2VtYW50aWNhbGx5IHRoZXJlIGlzIGFueSBkaWZmZXJlbmNlIGJldHdlZW46Cgpwcmlu
dGtfZW1lcmdlbmN5X2VudGVyKExPR0xFVkVMX1NDSEVEKTsKcHJpbnRrKCk7CnByaW50a19lbWVy
Z2VuY3lfZXhpdCgpOwp2cwpwcmludGsoIiVzIC4uLiIsIEtFUk5fU0hFRCwgLi4uKTsKCkkgd2Fz
IHNwZWFraW5nIGFib3V0IGNvbXBsZXhpdHkgbm90IGFib3V0IHVzYWdlLCBidXQgYWJvdXQgcmVh
bGl6YXRpb24KaW5zaWRlIHByaW50a19lbWVyZ2VuY3lfZW50ZXIoKTogdGhlcmUgd2lsbCBiZSBz
b21lIGJ1c2luZXNzIGxvZ2ljIHRoYXQKd2lsbCBkbyAiaXQncyBOTUk/IFVzZSBsb2dsZXZlbCBn
aXZlbi4gaXQncyBLRVJOX0FMRVJUPyBEb24ndCBkb3duZ3JhZGUKdGhlIGxvZ2xldmVsLi4uIiBh
bmQgb3RoZXIgc21hcnQgZGV0YWlscyB0aG9zZSBhcmUgcmVhbGx5IGxvZ2ljIHdoaWNoCm9uZSBo
YXZlIHRvIHRoaW5rIGFib3V0IGFuZCBsYXRlciBtYWludGFpbi4KClRoZXJlIHdpbGwgYmUgYWxz
byBtaW5vciBpc3N1ZXMgbGlrZSBwZW9wbGUgaW5zZXJ0aW5nIHByaW50IHdpdGggb25lIGxvZwps
ZXZlbCBhbmQgc2VlaW5nIGl0IGluIGRtZXNnIHdpdGggYW5vdGhlciwgYnV0IEkgcHJlc3VtZSB0
aG9zZQpwcmludGtfZW50ZXIoKSBhbmQgcHJpbnRrX2V4aXQoKSB3aWxsIGNvdmVyIGxpdHRsZSBh
bW91bnQgb2YgY29kZQp3aXRob3V0IG11Y2ggbmVzdGluZyBbYXMgbG9uZyBhcyBpdCdzIG5vdCBn
ZXR0aW5nIG92ZXJ1c2VkXS4gQW5kIGFsc28gaXQKY2FuIGJlIGRvY3VtZW50ZWQgYW5kIHBlb3Bs
ZSB3aWxsIGxlYXJuIGFib3V0IGFub3RoZXIgZmVhdHVyZSBvZiBwcmludGsoKS4KCkFuZCB0aGlz
IHllYXIgSSd2ZSBzZWVuIHRoZSBwcmVzZW50YXRpb24gIldoeSBwcmludGsoKSBpcyBzbwpjb21w
bGljYXRlZD8iIGFuZCBJIHByZXN1bWVkIHRoYXQgdGhlIGFwcHJvYWNoIGlzIHRvIGtlZXAgdGhp
bmdzIGFzCnNpbXBsZSBhcyBwb3NzaWJsZS4KCkluIGNvbmNsdXNpb246Ckkgc2VlIHRoYXQgeW91
ciBwcm9wb3NhbCBhbHNvIHNvbHZlcyB0aGUgcHJvYmxlbSBbZXhjZXB0IHByZWVtcHRpb24gYW5k
CnNvbWUgcHJfZGVidWcoKSB0aGF0IHNob3VsZG4ndCBiZSBwcmludGVkXS4gQW5kIEkgdGhpbmsg
eW91ciBhcHByb2FjaCBpcwpiZXR0ZXIgaW4gdGhlIHNlbnNlIG9mIHNob3J0LXRlcm0gKHdlIHdv
bid0IGhhdmUgYW55IG1pc3NlZCAlcyBLRVJOXyBpbgpsaW51eC1uZXh0KSwgYnV0IGluIGEgbG9u
Zy10ZXJtIGl0IGFkZHMgc29tZSBhbW91bnQgb2YgYnVzaW5lc3MgbG9naWMgdG8KcHJpbnRrIGFu
ZCBhbm90aGVyIGZlYXR1cmUuCgpKdXN0IGluIGNhc2U6IGFnYWluLCBJIGRvbid0IG1pbmQsIGl0
J3MgdXAgdG8geW91LCBtYWludGFpbmVycyBvZgpwcmludGsuIEl0J3MgYWxzbyBub3QgdmVyeSBm
dW4gZm9yIG1lIHRvIGNyZWF0ZSB0aG9zZSBwYXRjaGVzLgpCdXQgdGhleSBmaXggY29uc29sZV9s
b2dsZXZlbCBpc3N1ZXMgKEkgaG9wZSB3ZSBjb3VsZCB1bi1leHBvcnQgaXQgaW4KdGhlIGVuZCkg
YW5kIGFsc28gSSBuZWVkIGl0IGZvciBteSBvdGhlciBwYXRjaGVzIHRob3NlIHdpbGwgcHJvZHVj
ZQp3YXJuaW5ncyB3aXRoIGRlYnVnIGxvZ2xldmVsIHdoZW4gY29uZmlndXJlZCB0aHJvdWdoIHN5
c2N0bC4KClRoYW5rcywKICAgICAgICAgIERtaXRyeQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

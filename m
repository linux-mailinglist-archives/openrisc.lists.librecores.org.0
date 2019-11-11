Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 48C0BF8098
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 20:52:18 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 411A220690;
	Mon, 11 Nov 2019 20:52:17 +0100 (CET)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by mail.librecores.org (Postfix) with ESMTPS id A035620136
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 20:47:34 +0100 (CET)
Received: by mail-wm1-f65.google.com with SMTP id a17so643512wmb.0
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=cZIehrzGpUFezD2aa4zmv8OufN5OtO0USzsaArEEUTu0egX1JDp7fXq/MKdHB+YxUr
 j/kC7hgtECdh5x1noQBDdzd4zMsGonK7DNa4R/e8/R7qxcehDcLnLo5qSFE4wjuyW42o
 PQpFktb3ed0G2yVCt/fgkRLVHHWNH3ragHLlsd4kHSnraDACO77RcGzlulVu3SB7tcFm
 Ka75d1q24hYXLZJbDgNbGl6ynhrMJhmWegwmwjFp7I5D0Fg2d54s1iF9aPGxd1hnX+B8
 gISwE6rYfN65iX3ZaYqQ/BYKUKfAwSvjgwPgiFEkk/eO1PVC0atmmvIxVoVwNPzimOsY
 R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOJc4N4PavQU2sAVS1vG4t8ohqXXXnqqV8/w5qQonB8=;
 b=It9Y+dmJdhr+FBcnGHs7FXnUhdIAxi5uFD2lWFu6vRH18c+UxiqoVVPsSn3R6xFlkB
 WLzKEDxzvdtKDDotQA4rGlpPBrLpcNWZU6EBaoyZd36itTfGfBahR0uExogGB3IhLz1D
 2M+JS9lF3cL1UNonB3eSq9lmlhJYWUsYPCw1dq689qb/J29JgAXnGSn5xXDGlIzDcnWs
 B2+f3hpGowHfwwg5jfUFz21Pi4bl8usoYpYeERGc0O3xLWJxfY5Bn9opAf1gA3CqDjVG
 oa0IZ5nZU0B5sEZe7ZzSEc2QCyeJwebT2mPFWngSOLOl1wflJ96Om8z4ECjdrq54rDX4
 yqQQ==
X-Gm-Message-State: APjAAAXSIxMTpdZ81xYvvoiPC+tV2HqB7AqR59yZTh/9stnwWP2S1bOu
 NYLHgjbsHM1AyEWjtE86LFoGvQ==
X-Google-Smtp-Source: APXvYqwUswzQhu0DkD+M5khz/mFK8gHdabdOoahgxknZZUvPWQw4U7A4JmJR+GV6KsoYg/TOZHa6cQ==
X-Received: by 2002:a1c:2342:: with SMTP id j63mr585268wmj.56.1573501654084;
 Mon, 11 Nov 2019 11:47:34 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id f67sm723039wme.16.2019.11.11.11.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 11:47:33 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Petr Mladek <pmladek@suse.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
Date: Mon, 11 Nov 2019 19:47:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111012336.GA85185@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Nov 2019 20:52:16 +0100
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

SGkgU2VyZ2V5LCBQZXRyLAoKT24gMTEvMTEvMTkgMToyMyBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5
IHdyb3RlOgo+IE9uICgxOS8xMS8wOCAxNDowNCksIFBldHIgTWxhZGVrIHdyb3RlOgo+IFsuLl0K
Pj4gSSBhZ3JlZSB0aGF0IGl0IGlzIGNvbXBsaWNhdGVkIHRvIHBhc3MgdGhlIGxvZ2xldmVsIGFz
Cj4+IGEgcGFyYW1ldGVyLiBJdCB3b3VsZCBiZSBiZXR0ZXIgZGVmaW5lIHRoZSBkZWZhdWx0Cj4+
IGxvZyBsZXZlbCBmb3IgYSBnaXZlbiBjb2RlIHNlY3Rpb24uIEl0IG1pZ2h0IGJlIHN0b3JlZAo+
PiBpbiB0YXNrX3N0cnVjdCBmb3IgdGhlIG5vcm1hbCBjb250ZXh0IGFuZCBpbiBwZXItQ1BVCj4+
IHZhcmlhYmxlcyBmb3IgaW50ZXJydXB0IGNvbnRleHRzLgo+IAo+IEkgZG8gcmVjYWxsIHRoYXQg
d2UgdGFsa2VkIGFib3V0IHBlci1DUFUgcHJpbnRrIHN0YXRlIGJpdCB3aGljaCB3b3VsZAo+IHN0
YXJ0L2VuZCAianVzdCBwcmludCBpdCIgc2VjdGlvbi4gV2UgcHJvYmFibHkgY2FuIGV4dGVuZCBp
dCB0byAianVzdAo+IGxvZ19zdG9yZSIgdHlwZSBvZiBmdW5jdGlvbmFsaXR5LiBEb2Vzbid0IGxv
b2sgbGlrZSBhIHZlcnkgYmFkIGlkZWEuCj4gIlRoaXMgdGFzay9jb250ZXh0IGlzIGluIHRyb3Vi
bGUsIHdoYXRldmVyIGl0IHByaW50aygpLXMgaXMgaW1wb3J0YW50Ii4KCkkgZG9uJ3Qgc2VlIGhv
dyBiaXRzIG9uIHRhc2tfc3RydWN0IG9yIGluIHBlci1jcHUgYXJlIGVhc2llciB0aGFuCnN1cHBs
eWluZyBhIGxvZyBsZXZlbCBwYXJhbWV0ZXIgZG93biB0aGUgc3RhY2suCkhvdyB3b3VsZCBpdCB3
b3JrIGlmIHN5c3JxX2hhbmRsZV9jcmFzaCgpIGNhbGxlZCBieSBrZXktcHJlc3M/CkhvdyB3b3Vs
ZCB0aGF0IGludGVyYWN0IHdpdGggZGVmZXJyZWQgcHJpbnRpbmc/CkhvdyB3b3VsZCBpdCBtYWtl
IHZpc2libGUgcHJpbnRzIGZyb20gY3VycmVudCBjb250ZXh0LCBidXQgbm90IGZyb20Kc29tZXRo
aW5nIHRoYXQgcHJlZW1wdGVkIGl0PwoKRnVydGhlcm1vcmUsIHdoYXQgcHJvYmxlbXMgYXJlIHlv
dSB0cnlpbmcgdG8gc29sdmUgd2l0aCB0aGlzIGRlc2lnbj8KT25seSBzeXNycSBkcml2ZXI/IEtk
Yj8KSW4gbXkgcGVyc3BlY3RpdmUgaXQgc291bmRzIHRvbyBjb21wbGljYXRlZCBhbmQgb3Zlci1l
bmdpbmVlcmVkIGZvcgpzb21ldGhpbmcgdGhhdCBoYXMgdHdvLXRocmVlIHVzZXJzLgpBbHNvIEkn
dmUgdHJpZWQgdG8gcG9pbnQgdGhhdCBJIG5lZWQgdG8gcHJpbnQgYmFja3RyYWNlIHNvbWV0aW1l
cyB3aXRoCktFUk5fREVCVUcgbG9nbGV2ZWwgdG8gdXNlIGl0IGluIHByb2R1Y3Rpb24gZm9yIGVh
cmx5IG5vdGljZXMgdGhvc2UKbmVlZHMgdG8gZ28gb25seSB0byBsb2cgZmlsZXMgYW5kIGN1cnJl
bnRseSBlYWNoIGFyY2hpdGVjdHVyZSBkZWNpZGVzCndoaWNoIGxvZyBsZXZlbCBpdCBwcmVmZXJz
LgoKQW5kIHdoYXQncyBzbyBjb21wbGljYXRlZCBhYm91dCB0aGlzIHBhdGNoZXMgc2V0PyBJIHNl
ZSBvbmx5IHNpZGUgb2YgdGhlCnRlc3RpbmcsIGJ1dCB0aGUgYnVpbGQtdGVzdGluZyBpcyBjb3Zl
cmVkIHdpdGggMGRheSBib3QgYW5kIGNvc3Qgbm90aGluZwphbmQgYW55IHZpc2libGUgcmVncmVz
c2lvbiBtYXkgYmUgZm91bmQgZHVyaW5nIC1uZXh0IHBlcmlvZC4KV2hpbGUgaW50cm9kdWNpbmcg
dGhvc2UgcHJpbnRrLXNlY3Rpb25zIG1heSBzdWJ0bHkgYnJlYWsgdGhpbmdzLgoKSSBtZWFuLCBJ
IGRlZmluaXRlbHkga25vdyBsZXNzIGFib3V0IHByaW50aygpIGFuZCBpdHMgaW50ZXJuYWxzIHRo
YW4geW91Ci0gc28gbXkgcG9pbnRzIG1heSBiZSBhIG5vLXNlbnNlLgoKV2hhdCBJJ20gZ29pbmcg
dG8gZG8gLSBpcyB0byBmaXggYWxsIGJ1aWxkIGFuZCByZXBvcnRlZCBpc3N1ZXMsIEknbGwKc2Vu
ZCB2MiB0aGlzIHdlZWsgYW5kIGZlZWwgZnJlZSB0byBOQUsgaXQsIEkgd2lsbCBmb3JnZXQgYWJv
dXQgdGhvc2UKcGF0Y2hlcyBhbmQgd29uJ3QgYmUgb2ZmZW5kZWQuCkkgZG9uJ3Qgc2VlIG1hbnkg
cGVvcGxlIHRob3NlIGFyZSAiaGV5LCB3ZSdsbCBiZW5lZml0IGZyb20gdGhpcyIuCkFuZCBkb2lu
ZyB0aGlzIHBhdGNoZXMgc2V0IHdhcyBuZWl0aGVyIHF1aXRlIGZ1biAoZGlydHkgYnVzaW5lc3Mp
LCBub3IKc29tZXRoaW5nIEkgY2FuIGJlIGxhdGVyIHByb3VkIG9mIChoZXksIEkndmUgaW50cm9k
dWNlZCB0aGUgbG9nIGxldmVsCnBhcmFtZXRlciB0byBwcmludGluZyBmdW5jdGlvbnMhKS4KClRo
YW5rcywKICAgICAgICAgIERpbWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

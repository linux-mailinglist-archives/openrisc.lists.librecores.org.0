Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A1679F7418
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 757A820749;
	Mon, 11 Nov 2019 13:37:45 +0100 (CET)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by mail.librecores.org (Postfix) with ESMTPS id 2AEAD20499
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 22:08:40 +0100 (CET)
Received: by mail-wm1-f68.google.com with SMTP id f3so7573588wmc.5
 for <openrisc@lists.librecores.org>; Fri, 08 Nov 2019 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=rjflubiq8T92r7IsfuflmmOLhAbyeUiuHnf/rQSYhhlSmttRaTaotAvL5xYp4yOydT
 GvzpvT1wRN/Se5w5Bamn3iuJIAGtHWJ3FQg7uwfFHiBZYXDG6coXsfRkKjBQWYAriMTe
 4kTrO4cphBn73YaGY9oVhRABcMWkQkwRmG/gGE9R1eQjZ3xrtTYtO4ekpHSWHoSNgXQt
 LOIHB3CeUqi5Hx5sAbRW5lNwEUAqSAnAREOPMl/n34UjrP0bXjp7N2IIvVwOE5dHTyoC
 y/6fNB8lMSjFK19DQSqAbg52NdT8Yh0NvqWS+ZavZPT5hVJ6jwjvtDCEDMZ1djztH8HA
 lzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=leuvFNJRBbgvPXZJlD4yDG614p9ePBBBJqh6/bi0nWM=;
 b=ttfKfB7B8Q8mm7XnKExESXvNFubd5wLYq3eHgxOCJxxuxM53YmZdrH1AB4tuiiGMGE
 d5LeynG/nfbKdUu0bSv+EUEWEYIrLNhVi1VCzO6S6mfRNigcBaWWTC4o3F0UZFD/h19x
 1RnVikVXM5I2G7aIbIIq9CMa58Ahy/Q6X/UG1E0FfuuWs7mPdHmwVniK+GaAlSB2IMWk
 VfjO25B9JXtpyHfabGYwq+iR7vb/OsulND6R1A3dvfLBU8mClLGkKqzy72fWuiiV64Qe
 hWMIdl+oNdbfk4yYxFAqBQdmksIbpPtwvYBlT9Go6pzD3i/tADoQs5OsV3sMU6U6tihA
 pcyQ==
X-Gm-Message-State: APjAAAUxWSRhxOBlvlvRDPXIPNtCZqMbbZjbe/7PB2WVXHyncmfT99fD
 +zx4779AiBUZL7HriB9y49E=
X-Google-Smtp-Source: APXvYqy4dAVQ+ZAcZ+Na7c6XiIr61o8y7Lfg2+bZQEg4XJKlBUyi7kCGw2dZZvY/2MRfFQOLGhdeXA==
X-Received: by 2002:a1c:810d:: with SMTP id c13mr6004971wmd.154.1573247319697; 
 Fri, 08 Nov 2019 13:08:39 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id j63sm9370828wmj.46.2019.11.08.13.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 13:08:38 -0800 (PST)
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Dmitry Safonov <dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106092039.GT4131@hirez.programming.kicks-ass.net>
 <10db6fa1-5b17-ebe6-09e0-6335e09e4db8@arista.com>
 <20191106203440.GH3079@worktop.programming.kicks-ass.net>
 <CAGrbwDRgX1BZoFrVYSXhAeeUKHrB=q3w8jXFPOuRvO7HV4Ciqw@mail.gmail.com>
 <20191108173045.GY25745@shell.armlinux.org.uk>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <5a411348-be84-f592-ef2d-ffaec99332bd@gmail.com>
Date: Fri, 8 Nov 2019 21:08:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191108173045.GY25745@shell.armlinux.org.uk>
Content-Language: en-US
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
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, Will Deacon <will@kernel.org>,
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

Ck9uIDExLzgvMTkgNTozMCBQTSwgUnVzc2VsbCBLaW5nIC0gQVJNIExpbnV4IGFkbWluIHdyb3Rl
Ogo+IE9uIEZyaSwgTm92IDA4LCAyMDE5IGF0IDA0OjI4OjMwUE0gKzAwMDAsIERtaXRyeSBTYWZv
bm92IHdyb3RlOgpbLi5dCj4+Cj4+IFdlbGwsIHRoZSB1c2UtY2FzZSBmb3IgbG93ZXIgbG9nLWxl
dmVsIGlzIHRoYXQgZXZlcnl0aGluZyBnb2VzIGludG8gbG9ncwo+PiAoL3Zhci9sb2cvZG1lc2cg
b3IgL3Zhci9sb2cvbWVzc2FnZXMgd2hhdGV2ZXIgcnN5c2xvZyBoYXMgc2V0dHRpbmcpLgo+Pgo+
PiBUaGF0IGhhcyBpdCdzIHZhbHVlOgo+PiAtIGFmdGVyIGEgZmFpbHVyZSAoaS5lLiBwYW5pYykg
bWVzc2FnZXMsIHRob3NlIHdlcmUgb25seSBzaWducyB0aGF0Cj4+IHNvbWV0aGluZyBnb2VzIHdy
b25nIGNhbiBiZSBzZWVuIGluIGxvZ3Mgd2hpY2ggY2FuIGdpdmUgaWRlYXMgd2hhdCBoYXMKPj4g
aGFwcGVuZWQuCj4gCj4gTm8gdGhleSBkb24ndC4gIFdoZW4gdGhlIGtlcm5lbCBwYW5pY3MsIHVz
ZXJzcGFjZSBnZW5lcmFsbHkgc3RvcHMKPiBydW5uaW5nLCBzbyByc3lzbG9nIHdvbid0IGJlIGFi
bGUgdG8gd3JpdGUgdGhlbSB0byAvdmFyL2xvZy9tZXNzYWdlcy4KPiAKPiBIb3csIGJ5ICJrZXJu
ZWwgcGFuaWNzIiBJIG1lYW4gYSByZWFsIGtlcm5lbCBwYW5pYywgd2hpY2ggcHJvYmFibHkKPiBp
c24ndCB3aGF0IHlvdSdyZSB0YWxraW5nIGFib3V0IHRoZXJlLiAgWW91IGFyZSBwcm9iYWJseSB0
YWxraW5nCj4gYWJvdXQgdGhlIHdob2xlIHNoZWJhbmcgb2Ygbm9uLWZhdGFsIGtlcm5lbCBvb3Bz
LCBrZXJuZWwgd2FybmluZ3MKPiBhbmQgdGhlIGxpa2UuICBJZiBzbywgSSdkIGFzayB5b3UgdG8g
c3RvcCBjb25mdXp6aWxhdGluZyB0ZXJtaW5vbG9neS4KPiAKPiBJZiB5b3UgcmVhbGx5IHdhbnQg
dG8gY2FwdHVyZSBzdWNoIGV2ZW50cywgdGhlbiB5b3UgbmVlZCB0byBoYXZlIHRoZQo+IGtlcm5l
bCB3cml0ZSB0aGUgcGFuaWMgdG8gKGUuZy4pIGZsYXNoIC0gc2VlIHRoZSBtdGRvb3BzIGRyaXZl
ci4KCkkgd2FzIHRhbGtpbmcgYWJvdXQgdGhpbmdzIHByaW9yIHRoZSBwYW5pYzogT09NcywgTU1D
IHdyaXRlL3JlYWQKd2FybmluZ3MsIGh1bmcgdGFza3MsIHdlIGFsc28gaGF2ZSBsb2NhbCBwYXRj
aGVzIHRvIHByb2R1Y2UgYSB3YXJuaW5nIGlmCnRoZSBtdXRleCBpcyBiZWluZyBoZWxkIGZvciB0
b28gbG9uZyBvciBhIHRhc2sgaXMgc3RhcnZpbmcgb24gQ1BVIHRpbWUKYnkgaGFyZC9zb2Z0IGly
cXMgKEkgaG9wZSBJIHdpbGwgZGVzaWduIHNvbWV0aGluZyBsaWtlIHRoYXQgZm9yCnVwc3RyZWFt
KS4gSSd2ZSBmb3VuZCB0aG9zZSB3YXJuaW5ncyB1c2VmdWwgdG86CihhKSBoYXZlIGFuIGVhcmx5
IG1lc3NhZ2Ugd2hlbiB0aGUgdGhpbmdzIGFyZSBzdGFydGluZyBnb2luZyBiYWQuCihiKSBhbmFs
eXplIGNvbnRlbnRpb25zIG9yIHRvbyBsYXJnZSBzY2FsZSBmb3IgYSBib3ggb3IgZmF1bHR5IGhh
cmR3YXJlCmZvciBub24tcmVwcm9kdWNpYmxlIGlzc3VlcyBqdXN0IGZyb20gbG9ncy4KCldlIHVz
ZSBrZXhlYyB0byBzYXZlIHRoZSBkbWVzZyByaW5nYnVmZmVyIGNvbnRlbnQgYWZ0ZXIgdGhlIHBh
bmljLgoKVGhhbmtzLAogICAgICAgICAgRG1pdHJ5Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==

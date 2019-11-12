Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3A152101F1F
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 34BB6207BA;
	Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by mail.librecores.org (Postfix) with ESMTPS id 733E520136
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 03:40:20 +0100 (CET)
Received: by mail-wm1-f67.google.com with SMTP id b11so1392560wmb.5
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 18:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=MX42aMTTzAgzmolo19ziCaVvJW01j4llkcsSSsPBgIZf5M/QJqFnu0ykgQ+YU9I1XM
 lWWUfFOOmvWQUbOV/+iKy4yX6WRH0x7F+7sbAobnLPJdwSzb9YWyJ9/pnJvSWZVMB+xV
 UFEneok+5nQrKqWY1H/ryexuorVth0ci9XQccgC0yNGEatwsWoLWkeJcz3zYnXhenkJH
 nhLbJhqGH8CSvC3ekwmNTkFJs9KRa26JVi5KOJ0GN3lmDlPGH14xef5YqFU0Sk8qUi0p
 NtXZ7DYgZXwHf2rN/1LtOFtVEw8aJlkAZJ8tf3acCKNzLndcz00BKo1YrVsWG4zo53JF
 Pi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hc0bl6ua3Awo0puTEJJtiCFLlsTJGov09J6GyMYDUcw=;
 b=ONhsuY/5vAXNIV8YEjYBaIR0ubFLllPPyejefxnxgJgML4yXDyolMtH9RUJ/SJUCBi
 wY8roeZfZsXl1J5siMLd2v+6KPBeERkgbS+0fIdAMHh+CMYPo+D00IRu2G5EJytiHwas
 +1gVh1myjn13WxdogL+ph/CM2cZO0NNUIci5FFb/oBzEO4tmxhmMzIkaShtRz86hy6JA
 ClQwugxurpNAyTqBWvFmS5kLk/UqAdTJ0/EqSV8t63z9MbjdyXps7HcKRqKVYPd0m7f5
 43LMQf4gbDt7G5Q1RO2m8ZAoazMTckKJ9C3NHftPj/eguuruE24lrZejFjJAomkPM+kB
 TiCQ==
X-Gm-Message-State: APjAAAXy1Is/NL/ZWic83O28/BY6p1t6skk1VXY8SOwoCD4qdQJV8b/W
 f6wad3dYHl0DmWOjzsTlUAQfcw==
X-Google-Smtp-Source: APXvYqwGQmDILzErOejMnS6vcYmyu3aXwuweLJ3fDyVGcyV1rhcTRlJUkjSBJvf4yqYURAoU8N6Q/w==
X-Received: by 2002:a7b:c211:: with SMTP id x17mr1567811wmi.71.1573526420054; 
 Mon, 11 Nov 2019 18:40:20 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id u26sm1511046wmj.9.2019.11.11.18.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 18:40:19 -0800 (PST)
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
Date: Tue, 12 Nov 2019 02:40:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112021747.GA68506@google.com>
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

SGkgU2VyZ2V5LAoKT24gMTEvMTIvMTkgMjoxNyBBTSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3Rl
Ogo+IE9uICgxOS8xMS8xMSAxOTo0NyksIERtaXRyeSBTYWZvbm92IHdyb3RlOgpbLi5dCj4+IFdo
YXQgSSdtIGdvaW5nIHRvIGRvIC0gaXMgdG8gZml4IGFsbCBidWlsZCBhbmQgcmVwb3J0ZWQgaXNz
dWVzLCBJJ2xsCj4+IHNlbmQgdjIgdGhpcyB3ZWVrIGFuZCBmZWVsIGZyZWUgdG8gTkFLIGl0LCBJ
IHdpbGwgZm9yZ2V0IGFib3V0IHRob3NlCj4+IHBhdGNoZXMgYW5kIHdvbid0IGJlIG9mZmVuZGVk
Lgo+IAo+IExvdmVseS4KPiBBbmQgLSBubywgSSdtIG5vdCBnb2luZyB0byBOQUsgcGxhdGZvcm0g
c3BlY2lmaWMgY2hhbmdlcy4gSnVzdCBzbyB5b3Uga25vdy4KPiAKPiAqQWxsKiBJJ20gdGFsa2lu
ZyBhYm91dCBpcyBhbiBhbHRlcm5hdGl2ZSwgbGVzcyAiZ28gYW5kIHRvdWNoIGEgdG9uIG9mCj4g
cGxhdGZvcm0gY29kZSIgYXBwcm9hY2guIFRoZSBhcmd1bWVudCAiSSBwYXRjaGVkIHNvIG1hbnkg
ZmlsZXMgdGhhdCBJJ20KPiBub3QgZXZlbiBnb2luZyB0byBkaXNjdXNzIGFueXRoaW5nIG5vdyIg
aXMgbm90IHByb2R1Y3RpdmUsIHRvIHNheSB0aGUKPiBsZWFzdC4gSG9wZSB0aGlzIGNsYXJpZmll
cy4KCkl0IHByb2JhYmx5IHdhcyBhIHdyb25nIGltcHJlc3Npb24gZnJvbSB0aGUgYm90aCBzaWRl
cy4KTXkgaW1wcmVzc2lvbiB3YXMgIllvdSB0b3VjaCBldmVyeSBhcmNoaXRlY3R1cmUgLSB3ZSB3
b24ndCBldmVuIGNvbnNpZGVyCnRoYXQiLiBTb3JyeSBmb3IgdGhlIHRoZSB3cm9uZyBpbXByZXNz
aW9uIGZyb20gbXkgc2lkZSAtIEknbSBvcGVuIGZvcgpkaXNjdXNzaW9uLgoKSW4gbXkgcG9pbnQg
b2YgdmlldyB0aGUgY29zdCBvZiBvbmUtdGltZSBbbW9zdGx5IGJ1aWxkXSB0ZXN0aW5nIGV2ZXJ5
CmFyY2hpdGVjdHVyZSBpcyBjaGVhcGVyIHRoYW4gaW50cm9kdWNpbmcgc29tZSBuZXcgc21hcnQg
Y29kZSB0aGF0IHdpbGwKbGl2ZSBmb3JldmVyLiBUaG91Z2gsIGFnYWluIHlvdSBhbmQgUGV0ciB1
bmRlcnN0YW5kIG1vcmUgdGhhbiBtZSBpbgpwcmludGsoKSBjb2RlLCBzbyBJJ20gbm90IGFueSBp
bnNpc3RpbmcuCgpJJ2xsIHJlcGx5IHRvIHlvdXIgc3VnZ2VzdGlvbiB0b21vcnJvdywgaXQncyBh
IGJpdCBsYXRlIGluIG15IHR6LgoKVGhhbmtzLAogICAgICAgICAgRG1pdHJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

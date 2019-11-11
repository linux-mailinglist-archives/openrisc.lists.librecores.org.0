Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 01CB8F7419
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D3F1A207F1;
	Mon, 11 Nov 2019 13:37:45 +0100 (CET)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by mail.librecores.org (Postfix) with ESMTPS id 5D980206A8
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:23:41 +0100 (CET)
Received: by mail-pg1-f196.google.com with SMTP id h4so8345118pgv.8
 for <openrisc@lists.librecores.org>; Sun, 10 Nov 2019 17:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=;
 b=PEUFO8IEu1osGIrKprDzvbxlNRJeZ7+VQZKgcPA4VWwOYdra1vch/X2sOCSKa29N9n
 VdblGN+C6xXZa66p438tGiFX2wH1ZMvXaLBCYR4jMYFYKpHWbu3dvuf4i51nfGHovAdM
 kJ21eWqlCVZNsUh7vR0KmZmoQmTZB1DoPsxQK2h0K8DrMvb84HP3pZHYPYw+F3AAOb8s
 2PUdw4923VWsoF2jPoVNv2KKLc7p6DTbwWWIyb/CwJRvDtzNsBcrU623traZ5+UDPhd8
 dvUZh/U5lV6A1081bATRr1q945s51Yb6awkYmElXIQG0WkPEPjbs1iqGD3WlzUt7rcka
 L5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=meRRGW7ni43do21CnMh1ypMYB7GRo8yRghEKxpnOMtM=;
 b=qAz/Qj1cjymVRj3mFmCmoxuneyBMBq8Ao89bgquQlyNhGT2yikZ1ZYeq3sJGjGc2F2
 SapVWszvKY0U9Uoo9Wd17ExQYWBBgd/KjpL6KgK3Gh7jgRNhYMmFZo9a+0qFzc9yyw6r
 DWE15cpdLtR2hHAx/Hby/2+i/PZHwEZlurw3kOsg8XdTKX7QjOvTv3fCWGsUPMOpYWnk
 G0sOyefB3XPLHO5G5U5u7mVSXwX6BDEdwOqlO/gEBkmtZUhOylhJUfHK8ZzfCn6vfmy1
 0/AGOCiLnobDG3aPTseg/eqmz2lXz8DhQ4Y7pkeiwJe3A12ISQbb0MGo9cstFyVFI7BU
 ZYvQ==
X-Gm-Message-State: APjAAAUmXcAou5TA6DMx5ETdY9Mqk2F8j86BCNd0DKXmntdcD2fYzKV+
 Mp+THXWi8drgzVw5KfyBD64=
X-Google-Smtp-Source: APXvYqy6vC5fNwNO+7Jnp+tE/qbyOeavvD3kd+/MEwk8H/f5hGFY+WAM1K+Wsl4w+fZzo2o0jtZpqg==
X-Received: by 2002:a63:b047:: with SMTP id z7mr20331363pgo.224.1573435419566; 
 Sun, 10 Nov 2019 17:23:39 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id r8sm12584714pgr.59.2019.11.10.17.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Nov 2019 17:23:38 -0800 (PST)
Date: Mon, 11 Nov 2019 10:23:36 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191111012336.GA85185@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
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

T24gKDE5LzExLzA4IDE0OjA0KSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiBJIGFncmVlIHRo
YXQgaXQgaXMgY29tcGxpY2F0ZWQgdG8gcGFzcyB0aGUgbG9nbGV2ZWwgYXMKPiBhIHBhcmFtZXRl
ci4gSXQgd291bGQgYmUgYmV0dGVyIGRlZmluZSB0aGUgZGVmYXVsdAo+IGxvZyBsZXZlbCBmb3Ig
YSBnaXZlbiBjb2RlIHNlY3Rpb24uIEl0IG1pZ2h0IGJlIHN0b3JlZAo+IGluIHRhc2tfc3RydWN0
IGZvciB0aGUgbm9ybWFsIGNvbnRleHQgYW5kIGluIHBlci1DUFUKPiB2YXJpYWJsZXMgZm9yIGlu
dGVycnVwdCBjb250ZXh0cy4KCkkgZG8gcmVjYWxsIHRoYXQgd2UgdGFsa2VkIGFib3V0IHBlci1D
UFUgcHJpbnRrIHN0YXRlIGJpdCB3aGljaCB3b3VsZApzdGFydC9lbmQgImp1c3QgcHJpbnQgaXQi
IHNlY3Rpb24uIFdlIHByb2JhYmx5IGNhbiBleHRlbmQgaXQgdG8gImp1c3QKbG9nX3N0b3JlIiB0
eXBlIG9mIGZ1bmN0aW9uYWxpdHkuIERvZXNuJ3QgbG9vayBsaWtlIGEgdmVyeSBiYWQgaWRlYS4K
IlRoaXMgdGFzay9jb250ZXh0IGlzIGluIHRyb3VibGUsIHdoYXRldmVyIGl0IHByaW50aygpLXMg
aXMgaW1wb3J0YW50Ii4KClBlci1jb25zb2xlIGxvZ2xldmVsIGFsc28gbWlnaHQgaGVscCBzb21l
dGltZXMuIFNsb3dlciBjb25zb2xlcyB3b3VsZAotPndyaXRlKCkgb25seSBjcml0aWNhbCBtZXNz
YWdlcywgZmFzdGVyIGNvbnNvbGVzIGV2ZXJ5dGhpbmcuCgpQYXNzaW5nIGxvZ19sZXZlbCBhcyBw
YXJ0IG9mIG1lc3NhZ2UgcGF5bG9hZCwgd2hpY2ggcHJpbnRrIG1hY2hpbmVyeQptYWdpY2FsbHkg
aGlkZXMgaXMgbm90IGVudGlyZWx5IGV4Y2l0aW5nLiBXaGF0IHdlIGhhdmUgaW4gdGhlIGNvZGUK
bm93IC0gcHJpbnRrKCIlcyBibGFoXG4iLCBsdmwpIC0gaXMgbm90IHdoYXQgd2Ugc2VlIGluIHRo
ZSBsb2dzLgpCZWNhdXNlIHRoZSBsZWFkaW5nICclcycgYmVjb21lcyBzcGVjaWFsLiBBbmQgcHJp
bnRrKCkvc3ByaW50ZigpCmRvY3VtZW50YXRpb24gc2hvdWxkIHJlZmxlY3QgdGhhdDogJyVzJyBw
cmludHMgYSBzdHJpbmcsIGJ1dCBzb21ldGltZXMKaXQgZG9lc24ndC4KCgktc3MKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

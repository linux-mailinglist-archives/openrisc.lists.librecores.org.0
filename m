Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 741D4101F29
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:24 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BABB220332;
	Tue, 19 Nov 2019 10:04:23 +0100 (CET)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by mail.librecores.org (Postfix) with ESMTPS id 9D4062048C
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 07:33:40 +0100 (CET)
Received: by mail-pl1-f195.google.com with SMTP id l4so623275plt.13
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 22:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KPZG4VqXDKJQhwt8QhBKSdwu6zZ1yvGSLXAAovETV8E=;
 b=U+7/ZvVfxKk+hxsLJDRIKIa9v9E62t1+RHHdRG8fTOKlKCc4Kg8kLlVghoiEvtLKpI
 pPB/09WWUgNDAvmTd9ZCgUOuDBo7+0/f9WrOXWR2uZQ/aTiznYX6i7YMJNAQqiVBiT9D
 uNMlkpfHxoC092SA3lqUUmN6Py1jaNvbxPVR7bhPPMcnC5VVTdQfrrvn9g+mwUT9wmS5
 IpQo+ozODVnxdup9AaHr+12x4K6wNPJd6H6aHacy3JkNKTrjQ9VPgzg12dvkP1Aua/p8
 JdT9N+L+Gr2JhZIIZgVnzKCc48NZMHSHGJjqaFnpF0Bg0opyuGJWVOEoMHo8Jbl+CwGg
 Qilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KPZG4VqXDKJQhwt8QhBKSdwu6zZ1yvGSLXAAovETV8E=;
 b=fHGEAa22gjD1jbPRZzfD7NQdbslTOXDNkiFvIj2i9gciJao+3t9B69esttjneyfGaG
 aKbfCb4lZZT0TFmvm1WCB4HLCQ+TG8PpFMN3YbV9yQCJcnMuu19ad5FS5So/AzhFv4LZ
 bI9Mft5EnTS/vnCdMVbVeTtsyhx7MHPbNSb5YYwA0vWD2PiF722Rs7P8NkuWLRUfg4VP
 w3/0LVlHXbWnWYxT61AMw6ZPh9+yOqI4n1JI9Ry29b2v0m/QUS8pmSZpVtXj4G5S2ewm
 OQSG5RCPrhOhE7Ql0olUNWNfvpn2vUwOw2HNIvN9UGDQKeEoLkwg/xiUBuAHhFlM+YVG
 PROQ==
X-Gm-Message-State: APjAAAWWG4+e8zn5sYbI1Cv7hCM5KNUcza7uuG53NQR7xciqJg2OPzoy
 P16rkkbDn0pJaVtb5rd83p4=
X-Google-Smtp-Source: APXvYqw/EXwYt3YxwlYA4wZk8PjZNxrmOm0/6WUJy4pyQbt0uw3oeq/94f1ysfc7w8q8vIp4HTP4BA==
X-Received: by 2002:a17:902:5a44:: with SMTP id
 f4mr2028828plm.174.1573626818736; 
 Tue, 12 Nov 2019 22:33:38 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id i16sm1209291pfa.184.2019.11.12.22.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 22:33:37 -0800 (PST)
Date: Wed, 13 Nov 2019 15:33:34 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191113063334.GA147997@google.com>
References: <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
 <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Ben Segall <bsegall@google.com>, Guo Ren <guoren@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Mel Gorman <mgorman@suse.de>, Jiri Slaby <jslaby@suse.com>,
 Matt Turner <mattst88@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp,
 Petr Mladek <pmladek@suse.com>, linux-pm@vger.kernel.org,
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
 Len Brown <len.brown@intel.com>, Peter Zijlstra <peterz@infradead.org>,
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

T24gKDE5LzExLzEzIDAyOjI1KSwgRG1pdHJ5IFNhZm9ub3Ygd3JvdGU6Cj4gSSBndWVzcyBJJ3Zl
IHBvaW50ZWQgdGhhdCBpbiBteSBwb2ludCBvZiB2aWV3IHByaWNlIGZvciBvbmUtdGltZSB0ZXN0
aW5nCj4gY29kZSBpcyBjaGVhcGVyIHRoYW4gYWRkaW5nIGEgbmV3IHByaW50ayBmZWF0dXJlIHRv
IHN3YXAgbG9nIGxldmVscyBvbgo+IHRoZSBmbHkuClsuLl0KPiBJJ3ZlIGdvbmUgdGhyb3VnaCBm
dW5jdGlvbnMgdXNlZCBieSBzeXNycSBkcml2ZXIgYW5kIHRoZSBzYW1lIGNoYW5nZXMKPiBpbnRy
b2R1Y2luZyBsb2cgbGV2ZWwgcGFyYW1ldGVyIHdvdWxkIGJlIG5lZWRlZCBmb3I6IHNjaGVkX3No
b3dfdGFzaygpLAo+IGRlYnVnX3Nob3dfYWxsX2xvY2tzKCksIHNob3dfcmVncygpLCBzaG93X3N0
YXRlKCksIHNob3dfbWVtKCkuIFNvbWUgb2YKPiB0aGVtIGRvbid0IG5lZWQgYW55IHBsYXRmb3Jt
IGNoYW5nZXMsIGJ1dCBhdCBsZWFzdCBzaG93X3JlZ3MoKSBuZWVkcy4KCkdvb2QgcG9pbnRzIGFu
ZCBuaWNlIGNvbmNsdXNpb24uCgpXZWxsLCBoZXJlIHdlIGdvLiBUaGVyZSBpcyBhIG51bWJlciBv
ZiBnZW5lcmFsbHkgdXNlZnVsIGZ1bmN0aW9ucyB0aGF0CnByaW50IG5pY2UgZGF0YSBhbmQgd2hl
cmUgcGVvcGxlIG1pZ2h0IHdhbnQgdG8gaGF2ZSBiZXR0ZXIgbG9nbGV2ZWwgY29udHJvbAooZm9y
IGRlYnVnZ2luZyBwdXJwb3NlcykuIHNob3dfc3RhY2soKSBpcyBqdXN0IG9uZSBvZiB0aGVtLiBQ
YXRjaGluZyBhbGwKdGhvc2UgZnVuY3Rpb25zLCB3aGljaCB5b3UgaGF2ZSBtZW50aW9uZWQgYWJv
dmUsIGlzIGhhcmRseSBhIGZ1biB0YXNrIHRvIGRvLgpIZW5jZSB0aGUgcHJpbnRrKCkgcGVyLUNQ
VSBwZXItY29udGV4dCBsb2dsZXZlbCBwcm9wb3NpdGlvbi4gVGhlIGNvZGUgdGhlcmUKaXMgbm90
IGNsZXZlciBvciBjb21wbGljYXRlZCBhbmQgaXMgbWVhbnQgZm9yIGRlYnVnZ2luZyBwdXJwb3Nl
cyBvbmx5LCBidXQKd2l0aCBqdXN0IDMgbGluZXMgb2YgY29kZSBvbmUgY2FuIGRvIHNvbWUgc3R1
ZmY6CgoJLyogQEJUVyB5b3UgY2FuJ3QgZG8gdGhpcyB3aXRoICIlcyIgS0VSTl9GT08gO1AgKi8K
KwlwcmludGtfZW1lcmdlbmN5X2VudGVyKExPR0xFVkVMX1NDSEVEKTsKKwlkZWJ1Z19zaG93X2Fs
bF9sb2NrcygpOworCXByaW50a19lbWVyZ2VuY3lfZXhpdCgpOwoKTm93Li4uCkknbSBub3Qgc3Vy
ZSBpZiB0aGlzIHdob2xlIHRoaW5nIGlzIHVwIHRvICJwcmludGsgbWFpbnRhaW5lcnMgb25seSIu
CklmIG5vIG9uZSBpcyBnb2luZyB0byB1c2UgImVtZXJnZW5jeSBwcmludGsgY29udGV4dHMiIHRo
ZW4gdGhlcmUgaXMKbm8gcG9pbnQgaW4gaGF2aW5nIHRoYXQgY29kZSBpbiB0aGUga2VybmVsLgoK
CS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

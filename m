Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 108E1101F22
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CF7CA207C5;
	Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by mail.librecores.org (Postfix) with ESMTPS id 5C2B920383
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 05:57:08 +0100 (CET)
Received: by mail-pf1-f196.google.com with SMTP id 3so12431068pfb.10
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 20:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=AI85TZuxJFzpojKZJlquzPJ/5YvDFz8JEdaGZ7N9Bmfov5X7GyMy3TfvkUyQANtqKe
 uWjtNNrB596OMU00c6+qct2nMEsGN4W/ajrsVlovtW2vJG2fjivE6vkHc9d5Fc8S37eB
 0VpD+e7K/Ht0coC/nAVEUQFQLhXtyB4aw6jKMKF9ff8HzhVOsLQ13K9MvUH4nh17A3b8
 X0IG+zvP4YjZB9qcfjrPIBuuKfgEibO6DzaNR3cG8TZwz73XhoRwn86VlJzYDpndT6LU
 MtpcwxBGTg4+qOqVF/y48uFNpA2bAo7xyKsOHk/v6yI7+ZG1IGpxyK0r3md+ToHLMdrK
 mWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tE21poLWpjs1GduZLj+PgABwuxQTljOZlec7LOXTsTQ=;
 b=jB7Y0s72/I9vMQ1CmVgleIWU+5JU9TK2E3TKx2ugas7TnL/sk3mmkVqlfun8TdY9Hj
 AcprRreghQJdXAznRY/t2ulk9TZLxhnBIJ1mLdeM2UuSvRjY3odP/OMB8fwHF+3df5ti
 QH0vyefQqIJmYEojVMxDVbcoSI9Ib05TDiXE5rHO7OIpqHA7QawtdK7HyW2F8krwyO56
 2rFtH2gXpP2uJ0Y49RFeD4Uev7o2ML0Hu+ouFb6nDPKTwX3e3Mk+uDH23YYZtdvolYYY
 wmEe9pIt9DxWXu1VjHdRo085g73aYaZnaBosMRaz13uL2+PhOpYkIsVxHR0tbUYms+u7
 FB6w==
X-Gm-Message-State: APjAAAXzm5Xi0fS6Ar4UmNjRny18l4D3NPvY6dPD/fF7JdJbqdGE6in6
 n/5KkNDPrJ+q2YS3Rt3C9js=
X-Google-Smtp-Source: APXvYqwONZTehdk35XitEb5MFGQ3YaKV519c02Q5wasJGEVSNUQOf6OoebSn7yVrmWLCDumcSeljhQ==
X-Received: by 2002:a17:90a:f48a:: with SMTP id
 bx10mr3683941pjb.103.1573534626683; 
 Mon, 11 Nov 2019 20:57:06 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id n23sm15226461pff.137.2019.11.11.20.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:57:05 -0800 (PST)
Date: Tue, 12 Nov 2019 13:57:04 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191112045704.GA138013@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112044447.GA121272@google.com>
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

T24gKDE5LzExLzEyIDEzOjQ0KSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgpbLi5dCj4gPiBC
dXQgeWVzLCB0aGlzIHBlci1jb2RlLXNlY3Rpb24gbG9nbGV2ZWwgaXMgcHJvYmxlbWF0aWMuIFRo
ZSBmZWVkYmFjawo+ID4gYWdhaW5zdCB0aGUgcGF0Y2hzZXQgc2hvd3MgdGhhdCBwZW9wbGUgd2Fu
dCBpdCBhbHNvIHRoZSBvdGhlciB3YXkuCj4gPiBJIG1lYW4gdG8ga2VlcCBwcl9kZWJ1ZygpIGFz
IHByX2RlYnVnKCkuCj4gCj4gSG1tLiBSaWdodC4KPiAKPiA+IEEgc29sdXRpb24gbWlnaHQgYmUg
dG8gdXNlIHRoZSBwZXItY29kZS1zZWN0aW9uIGxvZ2xldmVsIG9ubHkgaW5zdGVhZAo+ID4gb2Yg
c29tZSBzcGVjaWFsIGxvZ2xldmVsLgo+IAo+IFNvIG1heWJlIHdlIGNhbiAib3ZlcndyaXRlIiBv
bmx5IEtFUk5fREVGQVVMVCBsb2dsZXZlbHM/CgpMT0dMRVZFTF9ERUZBVUxULCBMT0dMRVZFTF9O
T1RJQ0UsIExPR0xFVkVMX0lORk8/CgpTbyB3ZSBjYW4gZG93bmdyYWRlIHNvbWUgbWVzc2FnZXMg
KGxvZ19zdG9yZSgpIG9ubHkpIG9yIHByb21vdGUKc29tZSBtZXNzYWdlcy4KCkRFQlVHIHBlcmhh
cHMgc2hvdWxkIHN0YXkgZGVidWcuCgo+IFdlIGNlcnRhaW5seSBzaG91bGQgbm90IG1lc3Mgd2l0
aCBTQ0hFRCBvciB3aXRoIGFueXRoaW5nIGluIGJldHdlZW4KPiBFTUVSRyBhbmQgRVJSLgoKICBb
RU1FUkcsIFdBUk5dCgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

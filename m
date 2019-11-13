Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 01A24101F24
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4B415207C9;
	Tue, 19 Nov 2019 10:04:20 +0100 (CET)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by mail.librecores.org (Postfix) with ESMTPS id 525932071E
 for <openrisc@lists.librecores.org>; Wed, 13 Nov 2019 02:23:42 +0100 (CET)
Received: by mail-pl1-f193.google.com with SMTP id w8so317147plq.5
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 17:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1L7ASzKkM9H3jGXxNBrUB+7DORYDzuzDLILdAI3Iz7A=;
 b=hPWPZKlqyeQnXDnfKM+yto4tna7/NwAt3iB5d61vGkkJIZuUufxmpnoxkEgePVnej7
 L3hqEC23l+0zKgGK6W4wPhhfu5rKZowqxPh/46+GMjsQYom9+rxAtKscDZa4tq1EZ716
 v3E2zlUhIldCXA7DVyUqyyBaEbvglPUOrZExWlUjNqVUbKviWiZ0UqqlQQn5uS5GaAHc
 mq/bIirdXr39H9gdTuhjl1CNb4pz9u1NyVaytreQwY9zEl/crJdG04QmPFkkR8rnNcTE
 UvMTM+CfzewoFMwCfZcUTuuW9mgMTzeza8o6UpjTQJvYoUxBVhuX8rWLl3B8wj02ljU3
 maaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1L7ASzKkM9H3jGXxNBrUB+7DORYDzuzDLILdAI3Iz7A=;
 b=QXJzFyjEqIU9Aib0+sFoVCDs6DcVEk6yyRq+2I5+Mgr8rW6LCHlC7su5mTvan1gFkM
 oCLP/5FaNyUtMQeerCXhj974pNKIquG7NUw2JGLwQTAGtwdT46Clv0z0QyHcpQjZp9UV
 Xkset1mVdbQsV/Fs/4B5apQTmnJsi0z2u3+IZOrLd23z3PgzV1LtdwKMVAbGIjQi1AEl
 qTFZRUQU5lWJoYoZECmb4dGg+6v7/MXQwZ7TmVwwg5Lx99uTncK1wBdJr/MJPOm78Qkt
 U1eKBz7gzjb1CBGssMTeA4WXYJkgdGq1j5eX2UdIh/k+tryKm7yN/VZO6gHuSAG9XW3y
 vo2g==
X-Gm-Message-State: APjAAAU8Apjbfj9Wli4LT1WKBVN0nO1FuN9l9OZ++1LxxbWOsQ3LPFRA
 IB4oXTS/GHf5yiWbQJCcaO4=
X-Google-Smtp-Source: APXvYqyiqUiMRcG57rYhVmi/PN592L9nB6krMmKeStEG0mbc1TStTpGh0xSJ8gvsM3GDADDNTGDfqQ==
X-Received: by 2002:a17:902:8a83:: with SMTP id p3mr856215plo.79.1573608220830; 
 Tue, 12 Nov 2019 17:23:40 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id s3sm304442pjr.13.2019.11.12.17.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 17:23:39 -0800 (PST)
Date: Wed, 13 Nov 2019 10:23:37 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>, Dmitry Safonov <dima@arista.com>
Message-ID: <20191113012337.GA70781@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112101229.GA201294@google.com>
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

T24gKDE5LzExLzEyIDE5OjEyKSwgU2VyZ2V5IFNlbm96aGF0c2t5IHdyb3RlOgo+IE9uICgxOS8x
MS8xMiAwOTozNSksIFBldHIgTWxhZGVrIHdyb3RlOgo+IFsuLl0KPiA+IFRoaXMgaXMgZ2V0dGlu
ZyB0b28gY29tcGxpY2F0ZWQuIEl0IHdvdWxkIGludHJvZHVjZSB0b28gbWFueQo+ID4gaGlkZGVu
IHJ1bGVzLiBXaGlsZSB0aGUgZXhwbGljaXRseSBwYXNzZWQgbG9nbGV2ZWwgcGFyYW1ldGVyCj4g
PiBpcyBzdHJhaWdodGZvcndhcmQgYW5kIGNsZWFyLgo+Cj4gSWYgbG9nbGV2ZWwgaXMgREVGQVVM
VCBvciBOT1RJQ0Ugb3IgSU5GTyB0aGVuIHdlIGNhbiBvdmVyd3JpdGUgaXQKPiAoZWl0aGVyIGRv
d25ncmFkZSBvciB1cGdyYWRlKS4gVGhhdCdzIG9uZSBydWxlLCBiYXNpY2FsbHkuIE5vdCB0b28K
PiBjb21wbGljYXRlZCwgSSBndWVzcy4KCkNhbiBiZSB0YWtlbiBldmVuIGEgYml0IGZ1cnRoZXIg
dGhhbgoKCXNob3dfc3RhY2soTlVMTCwgTlVMTCwgTE9HTEVWRUxfREVCVUcpOwpvcgoJc2hvd19z
dGFjayhOVUxMLCBOVUxMLCBMT0dMRVZFTF9FUlIpOwoKRm9yIGluc3RhbmNlLAoKCXNwaW5fbG9j
a19pcnFzYXZlKCZycS0+bG9jaywgZmxhZ3MpOwoJcHJpbnRrX2VtZXJnZW5jeV9lbnRlcihMT0dM
RVZFTF9TQ0hFRCk7CgkJLi4uCgkJc2hvd19zdGFjayguLi4pOwoJCXByaW50aygpOwoJCXByaW50
aygpOwoJCS4uLgoJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcnEtPmxvY2ssIGZsYWdzKTsKCm9y
CgoJc3Bpbl9sb2NrX2lycXNhdmUoJnVhcnRfcG9ydC0+bG9jaywgZmxhZ3MpOwoJcHJpbnRrX2Vt
ZXJnZW5jeV9lbnRlcihMT0dMRVZFTF9TQ0hFRCk7CgkJLi4uCgkJcHJpbnRrKCk7CgkJcHJpbnRr
KCk7CgkJLi4uCgphbmQgc28gb24uCgoJLXNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5y
aXNjCg==

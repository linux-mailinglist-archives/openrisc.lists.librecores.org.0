Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 85A01101F23
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 08B9D207C7;
	Tue, 19 Nov 2019 10:04:20 +0100 (CET)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by mail.librecores.org (Postfix) with ESMTPS id C0567205FA
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 11:12:34 +0100 (CET)
Received: by mail-pf1-f193.google.com with SMTP id r4so12999253pfl.7
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 02:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iABlNrF2pKWSZ44AJQZkuRtZU/cPi9wpLdONGxReYeE=;
 b=lVQpY920ERl+suupN9XSt5AI00c2Bwp6YTe+nuAxfJ0tx8/CHdvsOX8KqHu3FmMDHw
 pKJz2qZ3MIZdI/LvHcuOQwnw03zOL+xBaPoBM3Sk8cqEAObtva+w2W+VwUQXyt+Yzl0z
 2Ik5jh60mk6441pRqx3/IONqYdeiU8UBQPNLpaFQv+9/cOgrSL80TVTu8IIfCepoYN0k
 46xEtzM2XHEzQhHHKxX5sVHiAqwMvF9Sq45W8ZvBkd56VxLaVtoM4UNEcrlWR3NAHdQy
 xhQtHdonv/wnGP9QHISUJ1hs6f5eymrLlJUCAqXrERs33xe9PtMv6394ZI1rErDw09YV
 v71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iABlNrF2pKWSZ44AJQZkuRtZU/cPi9wpLdONGxReYeE=;
 b=I0DHAS14ZKpodQhuV5xr0VYu5nPfuzeyRpiiwraNexjA02kXlU/+5pFJv5jgY341xo
 MraFZBPHdSVWKTLNUSSLScRiENSXVQ4+tjBF+2iG2oksTwj4JOc//CoSBn/G2xue9xSm
 LFG1/ZfrwbrhyV2gZ3WORfP4WifustNq/V+eNOVSZxtGGDm18PsHzWqGbAQ6UxwWI6Ku
 mW9lWrUMFYTtgaRGb7BRhKnFi1vsdsaLbFTewSb83dXA56CuCu/jK6qzqo+vAJyBoe4Q
 6Seqq93E4oQV7x4vZy3ha77TlwdMepEruqVwKhmyjnmLQ9VVo6KS3oTwE7RAOnwUVA3X
 BOQA==
X-Gm-Message-State: APjAAAVLQlKAL16zFaUX4C9dn0Hy33KE0W/iQ2WTSgtJHhCassYMeokx
 Iebe/UspKA7z3Q3TCt7XoSk=
X-Google-Smtp-Source: APXvYqzbLkT+ewX6d5aDmf1lCSG1EnFPCAEpBjMiCepHVQ5OZ8DJHna0XlH2m+np53cmAKdzl8CVcA==
X-Received: by 2002:a62:fb02:: with SMTP id x2mr28010053pfm.254.1573553553232; 
 Tue, 12 Nov 2019 02:12:33 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id k9sm19867384pfk.72.2019.11.12.02.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 02:12:31 -0800 (PST)
Date: Tue, 12 Nov 2019 19:12:29 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191112101229.GA201294@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
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

T24gKDE5LzExLzEyIDA5OjM1KSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiBUaGlzIGlzIGdl
dHRpbmcgdG9vIGNvbXBsaWNhdGVkLiBJdCB3b3VsZCBpbnRyb2R1Y2UgdG9vIG1hbnkKPiBoaWRk
ZW4gcnVsZXMuIFdoaWxlIHRoZSBleHBsaWNpdGx5IHBhc3NlZCBsb2dsZXZlbCBwYXJhbWV0ZXIK
PiBpcyBzdHJhaWdodGZvcndhcmQgYW5kIGNsZWFyLgoKSWYgbG9nbGV2ZWwgaXMgREVGQVVMVCBv
ciBOT1RJQ0Ugb3IgSU5GTyB0aGVuIHdlIGNhbiBvdmVyd3JpdGUgaXQKKGVpdGhlciBkb3duZ3Jh
ZGUgb3IgdXBncmFkZSkuIFRoYXQncyBvbmUgcnVsZSwgYmFzaWNhbGx5LiBOb3QgdG9vCmNvbXBs
aWNhdGVkLCBJIGd1ZXNzLgoKPiBJIGFtIGdldHRpbmcgbW9yZSBpbmNsaW5lZCB0byB0aGUgc29s
dXRpb24gaW50cm9kdWNlZCBieSB0aGlzCj4gcGF0Y2hzZXQuIEl0IGxvb2tzIHJlYXNvbmFibGUg
Zm9yIHRoZSBkaWZmZXJlbnQgdXNlLWNhc2VzLgoKTm8gcHJlc3N1cmUgZnJvbSBteSBzaWRlLiBV
cCB0byBhcmNoIG1haW50YWluZXJzLgoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

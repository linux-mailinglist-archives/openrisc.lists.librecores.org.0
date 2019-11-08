Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8B013F7414
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6B767207E7;
	Mon, 11 Nov 2019 13:37:43 +0100 (CET)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id 2DF3120690
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 11:37:24 +0100 (CET)
Received: by mail-pf1-f195.google.com with SMTP id p24so4299007pfn.4
 for <openrisc@lists.librecores.org>; Fri, 08 Nov 2019 02:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=S+Nia2Oa5QzCO5JT/esBQ1livkv4TlWV+4fZRWkEO+o=;
 b=f9fUi1K0epILaPpMKUGA+FGIJ+GYnQXz31FR/JIRsr0jNtvXVD8WKS6AKbo2g/yYiS
 jp2Jgic4IxPn6T+PZphyltIyB4vnkBFwniOcMw51O2csFX1kjAC4QKejH96MUOsdWVPi
 BoIKRt+J7TT0AysruvIMXwSoJkxw5mAFsb1iShx9yrdJQ4jAMH1x3fQmLCILPy17O63N
 P5MCDaBbfZ4mb7y00oRdGf9IW4tz0D1nAGsSM5DLvdeQEZfjNAjb8k+88kSyJh4+WTH8
 CfsXzxfWKj+ARiV2OGLJRKeQ2vRNt5PSY65UAb+0sRHT/5MlGv9E/r9lKer8LjaXODrM
 kWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=S+Nia2Oa5QzCO5JT/esBQ1livkv4TlWV+4fZRWkEO+o=;
 b=bw19rD1IUGk9rObtbr72jN9JOKFOxlM97A3AWQQ6a4kA36R29QYWt8HgvR3oFytYOW
 ytr6nDrY6/rDBEMUsP2x4Qw1pBYvkdx3jHnmtzLQln2KOvia6Ku8IXVbmT8DxIajLdml
 Hl1zZMlCRCOUOHjqdCbhxJtPCX2Wfr8jf9Z28pxn7MV5sfseny81eP7hkT2RwSPW6R0Y
 Zqor+k/qCvWBIL1atk4uQ/ayjmrWICjEDQGOJk2wZ1DMf/AWY2nw1Z09nc91C4TyjGXm
 UKKmTCQ0S8dqlyIMnjPrH54f7kxwaB8TGuZwPSA2e/8d77ex2JUwEiAtfUEasLKbDRuD
 Iv3A==
X-Gm-Message-State: APjAAAWLlI576cA1fuf+xnhmvQW6kgkSOPLSkI+wmCE2T2uAw7taxxUh
 Anu3dRToFCAMhAbfZq6DmaA=
X-Google-Smtp-Source: APXvYqyO7sUpnj6a7Ff+Mjm5FDdK7wKit2fH7+9aIK/ZJYnbn96UndAqrCFpv1s9jhGv09wzRODVog==
X-Received: by 2002:a17:90a:25ea:: with SMTP id
 k97mr12085072pje.110.1573209442245; 
 Fri, 08 Nov 2019 02:37:22 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id m14sm5221119pgj.8.2019.11.08.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 02:37:21 -0800 (PST)
Date: Fri, 8 Nov 2019 19:37:19 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191108103719.GB175344@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
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

T24gKDE5LzExLzA2IDA5OjM1KSwgUGV0ciBNbGFkZWsgd3JvdGU6Cj4gSSBhZ3JlZSB3aXRoIGFs
bCB0aGUgb3RoZXIganVzdGlmaWNhdGlvbi4KPiAKPiBJIHdvdWxkIGFkZC4gVGhlIGJhY2t0cmFj
ZSBpcyByZWFsbHkgdXNlZnVsIGZvciBkZWJ1Z2dpbmcuIEl0IHNob3VsZAo+IGJlIHBvc3NpYmxl
IHRvIHByaW50IGl0IGV2ZW4gaW4gbGVzcyBjcml0aWNhbCBzaXR1YXRpb25zLgoKSG1tLCBJIGRv
bid0IGtub3cuCkRvIHdlIHJlYWxseSBuZWVkIGRlYnVnL2luZm8gbGV2ZWwgYmFja3RyYWNlcz8g
TWF5IGJlIGFsbCBiYWNrdHJhY2VzCmNhbiBiZSBjb252ZXJ0ZWQgdG8gc29tZXRoaW5nIG1vcmUg
c2V2ZXJlIChzbyB3ZSBjYW4gc3RvcCBwbGF5aW5nIGdhbWVzCndpdGggbG9nbHZsKSBhbmQgdGhl
biB3ZSBjYW4gY2xlYW4gdXAgIihhYil1c2VycyI/CgoJLXNzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83BED101F33
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4E2202042B;
	Tue, 19 Nov 2019 10:04:30 +0100 (CET)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by mail.librecores.org (Postfix) with ESMTPS id D613F20689
 for <openrisc@lists.librecores.org>; Fri, 15 Nov 2019 01:50:26 +0100 (CET)
Received: by mail-pf1-f195.google.com with SMTP id z4so5434883pfn.12
 for <openrisc@lists.librecores.org>; Thu, 14 Nov 2019 16:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=;
 b=KmyV0wmxO8hyWXeEcxKcQ9g8HAkhA/qdNPNsFVQfn2yQQaw88HTfL9LaYbMztbfLd7
 52Pu0wZdSH5VQCaovxyvQHk0OD3K8hwyJyv7gTIE7WfYFbfnBk0EdgJX1JDN4pxqrXgl
 ySMbute8meJ9NzhuhL1SAlrw8K7mPUp5drSPhW4XMcf1d4qZgHVwU+2rw50XjdktNSiF
 sXgm7kRa4irKvcghjdz42mh6HHtDdUpm74owHzVgf/ujVAH0IqCxtLXrybdOBUMLjKyu
 aagzgO7oGkNhda1hCKKFnixzMGqDsMvYc3bCAGLjTVnTtVkSC3NSs1N74SaX4ygndQ54
 O+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vPNtAsB3gXKxK0gWaPZBn5Rp3HfCqb9+MUmX4aWZ2D4=;
 b=LlU5kXrrJaltELibd7qXrA+k5+eaxu0U/Iall57HKAnBpmHv6PyklvBCm7mO0ar+ca
 YKczrR/DUURzYuDVei+7VCf7qCDzy7YxHgWgkSxUlnnQsok/cdv4CxDnpjHhvPl1zn0+
 3FdCU0htAukvN7Vg/JHf/BUjUsbcZU1t0HQZcv/v7mZuczxCIc1hRWyZdmfasGLyfK43
 0BTGv7Spe9KZG2kFG1tyWAe+ACiVINS2fjeXuAUPOJSPvz4orocIY5R1iyRMx8pejD/Y
 4Bx6ZcUGgURQ1KNOh+se1kejOs1jJoSmwI9ac5dgEUIAD4hqlrN8zNBGqKCU2AtAmZHF
 t8Ow==
X-Gm-Message-State: APjAAAVtyjlF07msLvl6WUnxNHMVVXshgXjt4CTtfjxVdqO9BzaulPRN
 ptVPfNjmdAEusFoLxGMwJOE=
X-Google-Smtp-Source: APXvYqzs/6YJY3W3liGEvm6Y1c+pswB4gmlD11KAgZFkRk3IFiZFsVE0EZASQU/B8tJzNuq9YuYJSQ==
X-Received: by 2002:a62:ee0c:: with SMTP id e12mr14672743pfi.38.1573779025403; 
 Thu, 14 Nov 2019 16:50:25 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id s15sm3632564pjp.3.2019.11.14.16.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2019 16:50:24 -0800 (PST)
Date: Fri, 15 Nov 2019 09:50:22 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191115005022.GA144607@google.com>
References: <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
 <20191112044447.GA121272@google.com>
 <20191112045704.GA138013@google.com>
 <20191112083509.gmgjpkjffsfaw5lm@pathway.suse.cz>
 <20191112101229.GA201294@google.com>
 <20191113012337.GA70781@google.com>
 <25ff45f0-6420-f660-55a8-637f11ab5ab4@arista.com>
 <20191113063334.GA147997@google.com>
 <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <578d041a-3ce5-28bb-9fcc-cf90fe82b036@arista.com>
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

T24gKDE5LzExLzEzIDE2OjQwKSwgRG1pdHJ5IFNhZm9ub3Ygd3JvdGU6Cj4gSXQncyBhbHNvIG5v
dCB2ZXJ5IGZ1biBmb3IgbWUgdG8gY3JlYXRlIHRob3NlIHBhdGNoZXMuCj4gQnV0IHRoZXkgZml4
IGNvbnNvbGVfbG9nbGV2ZWwgaXNzdWVzIChJIGhvcGUgd2UgY291bGQgdW4tZXhwb3J0IGl0IGlu
Cj4gdGhlIGVuZCkgYW5kIGFsc28gSSBuZWVkIGl0IGZvciBteSBvdGhlciBwYXRjaGVzIHRob3Nl
IHdpbGwgcHJvZHVjZQo+IHdhcm5pbmdzIHdpdGggZGVidWcgbG9nbGV2ZWwgd2hlbiBjb25maWd1
cmVkIHRocm91Z2ggc3lzY3RsLgoKTm8gb2JqZWN0aW9ucy4KCgktc3MKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK

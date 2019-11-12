Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 70D8C101F21
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:21 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A0117207C3;
	Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by mail.librecores.org (Postfix) with ESMTPS id 765A820332
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 05:44:52 +0100 (CET)
Received: by mail-pg1-f194.google.com with SMTP id h27so11025827pgn.0
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 20:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=D8FdqJ91C9CViimFs5HkqTNzLfTnpza7YcDlJMaUW/GYDtbpWN+jf3gagVp5Pb54ut
 pJnpc/x6Rud5mFzPf0ZReA35hd11ljJ6cO/5F7Ue3e6hQ2TSEJ94YRDSGLm6NhnyCdqt
 CzzD2BCnxTXK5GtYHwa3Uusyd8eoRKj//LeZNogwczP3XkHhZ0DhI0uDpEhLu6Pcihhn
 H3BS+MU+Nl1Oowf4/jk8zWm4nc12KVZM+ffZ6sfZ7WtTjgYJy574lkrjNaKPgYx+dzhc
 p2jV1Cc9pO8ZsG8xspjchyhzIZQ4FAt5l5TNSRCxJncAjNaATr8g0kc1uRTSgUAVAp1B
 466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z6L3+hI6K7wkMCOOKfC6B5htW9e/NujoD4rmfI82OVU=;
 b=JMzUwo6KquaXLoXsonIrxHmgCj6NTkuK69NkcGl70NL6/qlpLGOOGSLuJGR2KDMrne
 oEvdb7ZRcfVchouEI2awo82X+jkO9wn6zE17Riic6xyp629hKH2IbplCSegqKfMEaXcc
 ceQnhlB6UOjDtuGQxPeTYKN2+icYbu2IYrIvuNZMpC7WfmS0sxs03W4AGDAy+UqYPmj1
 QMFf7NQeGRc1wb3Ql3uFuqW3d6vl+Q5rcSTahhWFAL5j7v/uWvhEXMKe2cCddOuQpL0P
 hgAHI7Kk8vua2BTK00KPXvC1dmHBFyTeGKUyxFZEmDUyvUyR2MsFx6dI2zr//eWnxtcJ
 TuCw==
X-Gm-Message-State: APjAAAWcxFiyB6WTzJMIRCCHqGrTWQUstmAKgrPa37AUrrDmkSzZqRjn
 nZIHDsxLMqWO+JImaWjSi1E=
X-Google-Smtp-Source: APXvYqwNPlyjQTahvdEBWCuI4Zd+Adrk+027CcV4KySo2l3EKHcRsdH9n54f0hJl6o3TjoADo67N4w==
X-Received: by 2002:a63:d802:: with SMTP id b2mr32909872pgh.414.1573533890747; 
 Mon, 11 Nov 2019 20:44:50 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id l62sm18583061pgl.24.2019.11.11.20.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:44:49 -0800 (PST)
Date: Tue, 12 Nov 2019 13:44:47 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Message-ID: <20191112044447.GA121272@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111091207.u3lrd6cmumnx4czr@pathway.suse.cz>
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

T24gKDE5LzExLzExIDEwOjEyKSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiA+IEkgZG8gcmVj
YWxsIHRoYXQgd2UgdGFsa2VkIGFib3V0IHBlci1DUFUgcHJpbnRrIHN0YXRlIGJpdCB3aGljaCB3
b3VsZAo+ID4gc3RhcnQvZW5kICJqdXN0IHByaW50IGl0IiBzZWN0aW9uLiBXZSBwcm9iYWJseSBj
YW4gZXh0ZW5kIGl0IHRvICJqdXN0Cj4gPiBsb2dfc3RvcmUiIHR5cGUgb2YgZnVuY3Rpb25hbGl0
eS4gRG9lc24ndCBsb29rIGxpa2UgYSB2ZXJ5IGJhZCBpZGVhLgo+IAo+IFRoZSBwcm9ibGVtIHdp
dGggcGVyLUNQVSBwcmludGsgaXMgdGhhdCB3ZSB3b3VsZCBuZWVkIHRvIGRpc2FibGUKPiBpbnRl
cnJ1cHRzLgoKT3IgZGlzYWJsZSBwcmVlbXB0aW9uIGFuZCBoYXZlIGxvZ2xldmVsIHBlci1DUFUg
YW5kIHBlci1jb250ZXh0LgpwcmVlbXB0X2NvdW50IGNhbiBuYXZpZ2F0ZSB1cyB0byB0aGUgcmln
aHQgY29udGV4dCBsb2dsZXZlbCBvbgpwYXJ0aWN1bGFyIENQVS4gSSdtIHRhbGtpbmcgaGVyZSBv
bmx5IGFib3V0IGJhY2t0cmFjZSAoZXJyb3IpCnJlcG9ydGluZyBjb250ZXh0cy4gVGhvc2UgY2Fu
IGJlIGF0b21pYyBwZXJmZWN0bHkgZmluZS4KCkkgcG9zdGVkIGEgc2lsbHkgY29kZSBzbmlwcGV0
LgoKWy4uXQo+IEJ1dCB5ZXMsIHRoaXMgcGVyLWNvZGUtc2VjdGlvbiBsb2dsZXZlbCBpcyBwcm9i
bGVtYXRpYy4gVGhlIGZlZWRiYWNrCj4gYWdhaW5zdCB0aGUgcGF0Y2hzZXQgc2hvd3MgdGhhdCBw
ZW9wbGUgd2FudCBpdCBhbHNvIHRoZSBvdGhlciB3YXkuCj4gSSBtZWFuIHRvIGtlZXAgcHJfZGVi
dWcoKSBhcyBwcl9kZWJ1ZygpLgoKSG1tLiBSaWdodC4KCj4gQSBzb2x1dGlvbiBtaWdodCBiZSB0
byB1c2UgdGhlIHBlci1jb2RlLXNlY3Rpb24gbG9nbGV2ZWwgb25seSBpbnN0ZWFkCj4gb2Ygc29t
ZSBzcGVjaWFsIGxvZ2xldmVsLgoKU28gbWF5YmUgd2UgY2FuICJvdmVyd3JpdGUiIG9ubHkgS0VS
Tl9ERUZBVUxUIGxvZ2xldmVscz8KV2UgY2VydGFpbmx5IHNob3VsZCBub3QgbWVzcyB3aXRoIFND
SEVEIG9yIHdpdGggYW55dGhpbmcgaW4gYmV0d2VlbgpFTUVSRyBhbmQgRVJSLgoKPiBUaGUgZXhw
bGljaXRseSBwYXNzZWQgbG9nbGV2ZWwgbWFrZXMgbWUgZmVlbCBtb3JlIGNvbmZpZGVudCB0aGF0
Cj4gYWxsIG5lZWRlZCBwcmludGsoKSBjYWxscyB3ZXJlIHVwZGF0ZWQuIEJ1dCBpdCBtaWdodCBi
ZSBhIGZhbHNlCj4gZmVlbGluZy4gSSBkbyBub3QgcmVhbGx5IGhhdmUgYW55IHN0cm9uZyBwcmVm
ZXJlbmNlLgoKSSdtIG5vdCBsaWtlIHJlYWxseSBvYmplY3RpbmcsIGp1c3QgdHJ5aW5nIHRvIGV4
cGxvcmUgc29tZSBvdGhlcgpvcHRpb25zLgoKCS1zcwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

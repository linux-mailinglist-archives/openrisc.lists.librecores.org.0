Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D2B86101F20
	for <lists+openrisc@lfdr.de>; Tue, 19 Nov 2019 10:04:20 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 65F93207BD;
	Tue, 19 Nov 2019 10:04:19 +0100 (CET)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by mail.librecores.org (Postfix) with ESMTPS id 3747720132
 for <openrisc@lists.librecores.org>; Tue, 12 Nov 2019 05:25:51 +0100 (CET)
Received: by mail-pl1-f196.google.com with SMTP id w8so8832722plq.5
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 20:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=cdGWTYNC6NHRu+kvA4I6kS1Y2LfiO2jKF0r2reR+0mRqcG8yKudKBCw9I9DOXABIX4
 /3TUFbNC4J3e6CiNMFB22KOrjhFeNSMw6A4f5zE4eujUVPhwdAy4UE6JiknhjlsRGWe7
 RTgQRbIczKqjQpk9q9jHQE31BO+69ykoGYVcUuJlUop2q+ad5Zn3tErki59ff20RUtZo
 yWETgjDNltG315ymhYBMnymIi7dXr1HTD7KD2QIijuj5xF7vcEzw9cliyVtugI35e748
 tq7YxpziGywkq1lpdx1pl1YBrcMuX71SP1knncXeWdL4sRO4vx39eBLBEYWFTo///pwr
 NCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9VefD4i9ErvjrjSu5lBHBfa2VMuQnRlhyfcHWoSsFGA=;
 b=pF425R6YNLEJtqrFZgcaKHPCj2JspciVXdXGoJlcJtRyAEGjhOWNd2ayzQzyTo1oit
 CTgQNIXYsXpxcqirtVnzvXanTUkAuWCmTpjPQLwHWayyDbNcnL8jhncGqaKV/uPg89q+
 zD5s504rSAVyMZ+/mlFUwDSdHZGRRkcT4OEqzkiIvRZpNCDBtommr/2DJNvz4pUIRJFK
 bd0XX4Qu0Myy7imLINGo68ka3eaV4+2pDxQvcKl5ryPNA4vl9oF/9oZFYb+W93QGiMoD
 dZ1VXS2TqZ/zJtG/BFvFkPkIloVHVjF4qcMkVSxh+JS0IUviONa7EbJ5GB7ldOE46Y04
 sfEg==
X-Gm-Message-State: APjAAAVqI9Z2yPOTyCUHNNJr/gn/U0mdMYXQOzjYYGjHAKwreYcaN7j4
 JYauPnOCyE23RT00ZQUCfTk=
X-Google-Smtp-Source: APXvYqyjkigrHz92j3yARMh7vwLk0eQQU3iBJc8XJ3FFSXhKkmIaB79Wx/YFJE8etx6MkatMc7zyFg==
X-Received: by 2002:a17:902:246:: with SMTP id
 64mr28628529plc.339.1573532749511; 
 Mon, 11 Nov 2019 20:25:49 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:250d:e71d:5a0a:9afe])
 by smtp.gmail.com with ESMTPSA id 186sm23754823pfb.99.2019.11.11.20.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 20:25:48 -0800 (PST)
Date: Tue, 12 Nov 2019 13:25:46 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dmitry Safonov <dima@arista.com>
Message-ID: <20191112042546.GA119579@google.com>
References: <20191106030542.868541-1-dima@arista.com>
 <20191106083538.z5nlpuf64cigxigh@pathway.suse.cz>
 <20191108103719.GB175344@google.com>
 <20191108130447.h3wfgo4efjkto56f@pathway.suse.cz>
 <20191111012336.GA85185@google.com>
 <13e72b62-c842-8ed5-5b41-bc1692b28f53@arista.com>
 <20191112021747.GA68506@google.com>
 <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25cb9647-007a-9c18-4784-49c0aef4f54b@arista.com>
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

T24gKDE5LzExLzEyIDAyOjQwKSwgRG1pdHJ5IFNhZm9ub3Ygd3JvdGU6ClsuLl0KPiBJbiBteSBw
b2ludCBvZiB2aWV3IHRoZSBjb3N0IG9mIG9uZS10aW1lIFttb3N0bHkgYnVpbGRdIHRlc3Rpbmcg
ZXZlcnkKPiBhcmNoaXRlY3R1cmUgaXMgY2hlYXBlciB0aGFuIGludHJvZHVjaW5nIHNvbWUgbmV3
IHNtYXJ0IGNvZGUgdGhhdCB3aWxsCj4gbGl2ZSBmb3JldmVyLgoKV2VsbCwgdGhlcmUgbWF5IGJl
IHRoZSBuZWVkIHRvIHBhc3MgbG9nbGV2ZWwgZGVlcGVyIGR1ZSB0byAiaGV5IF9fc2hvd19zdGFj
aygpCm9uIHRoYXQgYXJjaCBpbnZva2VzIGJhcigpLCB3aGljaCBpbnZva2VzIGZvbygpIGFuZCBu
b3cgZm9vKCkgZG9lcyBwcmludGsoKSwKYnV0IHdlIGRvbid0IHNlZSBpdCIuIFRoZSBjb250ZXh0
IHdoaWNoIGRlY2lkZWQgdG8gYmFja3RhcmFjZXMgZGVjaWRlZAp0byBkbyBzbyBmb3IgYSByZWFz
b24sIHByb2JhYmx5LCBzbyBJIGd1ZXNzIHdlIGNhbiBsb29rIGF0IGl0IGFzICJhIHNwZWNpYWwK
ZXJyb3IgcmVwb3J0aW5nIGNvZGUgYmxvY2siLgoKVGhlIHByb3Bvc2VkIHBhdGNoIHNldCBwYXNz
ZXMgbG9nbGV2ZWwgdmlhIHNsaWdodGx5IHVudXN1YWwgY2hhbm5lbCAtCnZpYSBzcHJpbnRmKCku
IFdlIHByb2JhYmx5IGNhbiBkbyBpdCwgYnV0IEkgd291bGQgcHJlZmVyIHRvIG1pbmltaXplCnRo
ZSBudW1iZXIgb2Ygc3VjaCBwcmludGstcyBpbiB0aGUga2VybmVsLiBUaGUgY29kZSBzbmlwcGV0
IHdoaWNoIEkKcG9zdGVkIGFsc28gZG9lcyBwcmV0dHkgdW51c3VhbCB0aGluZyB3LnIudCBsb2ds
ZXZlbC4gQm90aCBhcHByb2FjaGVzCmFyZSAibm9uLXN0YW5kYXJkIiBmcm9tIHRoYXQgUE9WLgoK
PiBJJ2xsIHJlcGx5IHRvIHlvdXIgc3VnZ2VzdGlvbiB0b21vcnJvdywgaXQncyBhIGJpdCBsYXRl
IGluIG15IHR6LgoKU3VyZS4KClRvIGFueW9uZSB3aG8gd2lsbCBjb21tZW50IG9uIHRoYXQgY29k
ZSBzbmlwcGV0IC0gdGhpcyBpcyBub3QgYQoibG9vaywgaGVyZSBpcyB3aGF0IHlvdSBuZWVkIHRv
IGRvIiB0eXBlIG9mIHByb3Bvc2FsLiBKdXN0IGFuCmFsdGVybmF0aXZlIGFwcHJvYWNoIHdpdGgg
aXRzIHByb3MgYW5kIGNvbnMuCgpXZSBoYWQgc2V2ZXJhbCByZXF1ZXN0cyBvdmVyIHRoZSB5ZWFy
cyB0byBoYXZlIHNvbWV0aGluZyBsaWtlICJmb3JjaWJseQphbGxvdyBhbGwgdW5kZXJseWluZyBw
cmludGstcyBmcm9tIGhlcmUgdG8gaGVyZSIgb3IgImZvcmNpYmx5IHN1cHByZXNzCm9yIHBvc3Rw
b25lIHVuZGVybHlpbmcgcHJpbnRrLXMgZnJvbSBoZXJlIHRvIGhlcmUiLCBldGMuCgoJLXNzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BD8C4204C18
	for <lists+openrisc@lfdr.de>; Tue, 23 Jun 2020 10:19:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C345820372;
	Tue, 23 Jun 2020 10:19:08 +0200 (CEST)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by mail.librecores.org (Postfix) with ESMTPS id 1830620B53
 for <openrisc@lists.librecores.org>; Tue, 23 Jun 2020 02:44:57 +0200 (CEST)
Received: by mail-pl1-f194.google.com with SMTP id s14so4278402plq.6
 for <openrisc@lists.librecores.org>; Mon, 22 Jun 2020 17:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WOoBj34wrpkLm3cxJNNb0KejtEcGHXihiKs5tn9Bl2A=;
 b=Fyi9BekJ6P5kCaEZI4v0Q5UGFFijbkzvYxlDhZfmBSOVaRIA/BSafm9pzLuUQlIJo0
 akWxcy93XZBgnvmXLQQBdCNAgHijbBuOyOHThfXz86makirRrM3AruNfhYt0fz3mFMJt
 ULQfJMf3BQL8GiNmwlac0RpP8ipddRm3w9CIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WOoBj34wrpkLm3cxJNNb0KejtEcGHXihiKs5tn9Bl2A=;
 b=eza6v5fLwhy2V2dHkGSMLPEp/IeGeeGC4oOz3UC16kFmsPQ+/qX8gEZVOwBwEJJDMc
 IOIylnarB+DeUivXlLsakla73FeEVaqGlw1Gc7CU8FL40OKVfatzfIsJSVF8cgGn3f4k
 nFU2s79j8NaDKJVGYnoYGA5cp5vvP3fXqnI/6o41gcVzUgJlFHoCG6Jj4Jgo6SVHirKl
 ydZbvJuj+a863uKAIkaG9jRtmW+ByvK1pbs0lFEhu+PRVKHD+C0gBiAGJgMdgXiWfflY
 WW/XYPCcpIR0YQ3COsxx5CytHZSNdBTrF3kHCrv0A3sdlMYKY3LhWpmzWEqsQ0MS36zh
 cPwg==
X-Gm-Message-State: AOAM5315T6ACCQrjTXsULlsZaL1E8onqQo+S0JCHKKjo6sSaxBKX8J+m
 OU+HtXZje8WkZVsxhPM/QnWiWw==
X-Google-Smtp-Source: ABdhPJy929KxEZDPMhVg/7RDKm9ph7K2EaifUV9Pymu41sd+vdmJB8ghRrYd77/5UI2QmM+Ube3znQ==
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr20933232pjb.119.1592873094790; 
 Mon, 22 Jun 2020 17:44:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d5sm15307659pfd.124.2020.06.22.17.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 17:44:53 -0700 (PDT)
Date: Mon, 22 Jun 2020 17:44:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <202006221743.1BE5670@keescook>
References: <20200622234326.906346-1-christian.brauner@ubuntu.com>
 <20200622234326.906346-17-christian.brauner@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622234326.906346-17-christian.brauner@ubuntu.com>
X-Mailman-Approved-At: Tue, 23 Jun 2020 10:19:04 +0200
Subject: Re: [OpenRISC] [PATCH 16/17] arch: remove HAVE_COPY_THREAD_TLS
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
Cc: Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, linux-xtensa@linux-xtensa.org,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Jeff Dike <jdike@addtoit.com>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nick Hu <nickhu@andestech.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Paul Mackerras <paulus@samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMDE6NDM6MjVBTSArMDIwMCwgQ2hyaXN0aWFuIEJyYXVu
ZXIgd3JvdGU6Cj4gQWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydCBjb3B5X3RocmVhZF90bHMoKSBu
b3csIHNvIHJlbW92ZSB0aGUgbGVnYWN5Cj4gY29weV90aHJlYWQoKSBmdW5jdGlvbiBhbmQgdGhl
IEhBVkVfQ09QWV9USFJFQURfVExTIGNvbmZpZyBvcHRpb24uIEV2ZXJ5b25lCj4gdXNlcyB0aGUg
c2FtZSBwcm9jZXNzIGNyZWF0aW9uIGNhbGxpbmcgY29udmVudGlvbiBiYXNlZCBvbgo+IGNvcHlf
dGhyZWFkX3RscygpIGFuZCBzdHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MuIFRoaXMgd2lsbCBtYWtl
IGl0IGVhc2llciB0bwo+IG1haW50YWluIHRoZSBjb3JlIHByb2Nlc3MgY3JlYXRpb24gY29kZSB1
bmRlciBrZXJuZWwvLCBzaW1wbGlmaWVzIHRoZQo+IGNhbGxwYXRocyBhbmQgbWFrZXMgdGhlIGlk
ZW50aWNhbCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuCj4gWy4uLl0KPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gQnJhdW5lciA8Y2hyaXN0aWFuLmJyYXVuZXJAdWJ1bnR1LmNvbT4KCk1hc3NpdmUg
Q0MgbGlzdC4gOykgbGludXgtYXJjaEAgbWF5IGJlIHN1ZmZpY2llbnQuCgpSZXZpZXdlZC1ieTog
S2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotLSAKS2VlcyBDb29rCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

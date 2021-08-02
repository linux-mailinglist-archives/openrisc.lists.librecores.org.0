Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E4C743DDEDB
	for <lists+openrisc@lfdr.de>; Mon,  2 Aug 2021 20:04:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A271023CBB;
	Mon,  2 Aug 2021 20:04:11 +0200 (CEST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mail.librecores.org (Postfix) with ESMTPS id AAF15210A9
 for <openrisc@lists.librecores.org>; Mon,  2 Aug 2021 20:04:09 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id cb3so10271397ejb.1
 for <openrisc@lists.librecores.org>; Mon, 02 Aug 2021 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=bllfssUh1l3Cfof1I9S9zG5MovjfwF9CypWcpRvDmWpOEx759rPpO8GjtwWqnstMf2
 1QwJGh+kGvZKoMFQKf6FhnPOMkpo3JEJzP0z2jokepgekez40su6FDqDQO76azQW4aaY
 ndpMqrh8QhqQUbO9PB7UVTzGgkGjnuiB8BDrnOUlo6IfpOOOD5wRbVnNH3nzFEb8Jlvv
 f2sHv6d82OwwrINjEhGy7L8YhBy8Uq7x29x9aN5cqnZAFpZ+YseiNvbNJLRthMaSdJt+
 GNYBQGlDLHbH2bDQodG8T6OzjQiYO36wOgJ2MGUlCkSsxnL4jcZpqW+jXXGFabstpv3T
 roTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpOmQ9FDFdEDp1DRxCOS4/jNxSUC+b7VQifrd/M4FUE=;
 b=bFtGlgrQR5YN85rd30I3hEY0dufloYZgZmSCXNVeUT1/HWDIqMPUn+aMxq8qPeHCAP
 o1DV0mgR+MzF0kM96+5+Oez711bKDt/7QAGGJ+PuZ4vz5NQdUyzNfE8RkV3G31tL3Jy8
 GuUucRqIDJomUUBqVtfuv1XUJ82AWK0c5+ZovoYr0lFaJLWWXT6400W/pOxZ1ZGqCmEy
 Y53aU7WnMjoKgRr25GDCOQUcbE5zKf0y/yj8zevhnTZh/UhdB1KQ4QyOmJuFcQuX8wtn
 M0+Sj5sIFqa2oGTdAWGr125jyj2plo5iW2RA96Vq5PaJyqyDt7cbjmlBXSDwjP3Jsm7q
 Xj3Q==
X-Gm-Message-State: AOAM5322McIofPVyHeHf2UkaDc2sXEf2PUfg4Svmy+OXn2jtd/lorhPa
 X+ddGcFgcobVNf1c8SWAkrd54IBmMqyRa6KmUMc=
X-Google-Smtp-Source: ABdhPJx4CTYoE1N/7r5r3Yv59NCnUgpiXyVEWPBrQR2H8OPpQmdyOckhCi7flWDeCgEu3pc8T6+GCYt+gQKqcxApyio=
X-Received: by 2002:a17:906:34da:: with SMTP id
 h26mr16470323ejb.376.1627927449046; 
 Mon, 02 Aug 2021 11:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 2 Aug 2021 11:03:57 -0700
Message-ID: <CAMo8BfLDjw71xiCDo8uk4pQFuOzqAoak0k3R4YJDnRsA2hoCtw@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [OpenRISC] [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT
 in Kconfig
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390 <linux-s390@vger.kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Richard Weinberger <richard@nod.at>,
 Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-snps-arc@lists.infradead.org, Jeff Dike <jdike@addtoit.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-mips@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBKdWwgMzAsIDIwMjEgYXQgMTA6MjQgUE0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGly
b3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBNYWtlIGFyY2hpdGVjdHVyZXMgc2VsZWN0IFRSQUNF
X0lSUUZMQUdTX1NVUFBPUlQgaW5zdGVhZCBvZgo+IGhhdmluZyBtYW55IGRlZmluZXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+IC0t
LQo+ICBhcmNoL3h0ZW5zYS9LY29uZmlnICAgICAgICAgICB8IDQgKy0tLQoKQWNrZWQtYnk6IE1h
eCBGaWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPgotLSAKVGhhbmtzLgotLSBNYXgKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

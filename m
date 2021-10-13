Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1BA42B7CB
	for <lists+openrisc@lfdr.de>; Wed, 13 Oct 2021 08:45:52 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E0BA124202;
	Wed, 13 Oct 2021 08:45:51 +0200 (CEST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mail.librecores.org (Postfix) with ESMTPS id 3425824151
 for <openrisc@lists.librecores.org>; Wed, 13 Oct 2021 08:45:50 +0200 (CEST)
Received: by mail-pl1-f182.google.com with SMTP id y4so1174621plb.0
 for <openrisc@lists.librecores.org>; Tue, 12 Oct 2021 23:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=ZVG9fseiMJi5y7uNc0U//uB9qmTc4gJH0ueiRXhntI+xclAF1mY0ZabBN0HENHjmuQ
 Wd2tZE7h7XcVk1DbOBPcKKRzFh73LE1iY97UMVdM/LDFC8CDxtoZ3SUXBlDw8iyhvu6V
 muglMpS8KRkUeK+EwwJZIYurw/HXNEkgWVJds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=54qHtHAy8rfjFU+2zKfQg/JWPnOp0YLsqKSPrLOjYj8aTIhNOlMhCdookJ5GUnI9Is
 5xgNlctc+MyjzhZLJzmuorASnod3qwppFkVPt7nzjm5n6InZVOjYChKxrC/Zd4EPtEVt
 F0qx1wK4zneBo7Ga7L6e6I1qYBsRkaSHZtMblJi/RxohStnltMbtTC2dCPCiH4tNaF1Y
 84e8H00bN9JCOwrR8BvcvzKvzddK2r1C862AncThOPcly52XtTp8OQFBZbvvsn+5Kkzd
 u/+cGox7UBD8b81moQdMQJIRySfQftSdU4whaj9ksFDNW0qVwqW/LKw4jxMwNUdb21so
 f+0w==
X-Gm-Message-State: AOAM5330NUcMwhOuKUgY3zxUKyLRWoD47RzkWTjE7RTHOeNPAvhYqXMy
 L4O3PHoZJEW8ZtOwzYMUmRSEkw==
X-Google-Smtp-Source: ABdhPJzjo8AWROfTHh1Xk5YI6pRx05t7IBlItdI3oMMrcEgEqW1hgXJ6mKwWSXyPV/CEcnXRlFzD6Q==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr11233854pjb.169.1634107548649; 
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i124sm13247931pfc.153.2021.10.12.23.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:45:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Message-ID: <202110122345.4B8FE35AED@keescook>
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
Subject: Re: [OpenRISC] [PATCH 2/2] kbuild: use more subdir- for visiting
 subdirectories while cleaning
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-alpha@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 Julien Thierry <jthierry@redhat.com>, Nick Hu <nickhu@andestech.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Borislav Petkov <bp@alien8.de>,
 Vineet Gupta <vgupta@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgMDM6MzY6MjJQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IERvY3VtZW50YXRpb24va2J1aWxkL21ha2VmaWxlcy5yc3Qgc3VnZ2VzdHMgdG8g
dXNlICJhcmNoY2xlYW4iIGZvcgo+IGNsZWFuaW5nIGFyY2gvJChTUkNBUkNIKS9ib290Ly4KPiAK
PiBTaW5jZSBjb21taXQgZDkyY2M0ZDUxNjQzICgia2J1aWxkOiByZXF1aXJlIGFsbCBhcmNoaXRl
Y3R1cmVzIHRvIGhhdmUKPiBhcmNoLyQoU1JDQVJDSCkvS2J1aWxkIiksIHdlIGNhbiB1c2UgdGhl
ICJzdWJkaXItICs9IGJvb3QiIHRyaWNrIGZvcgo+IGFsbCBhcmNoaXRlY3R1cmVzLiBUaGlzIGNh
biB0YWtlIGFkdmFudGFnZSBvZiB0aGUgcGFyYWxsZWwgb3B0aW9uICgtaikKPiBmb3IgIm1ha2Ug
Y2xlYW4iLgo+IAo+IEkgYWxzbyBjbGVhbmVkIHVwIHRoZSBjb21tZW50cy4gVGhlICJhcmNoZGVw
IiB0YXJnZXQgZG9lcyBub3QgZXhpc3QuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KCkkgbGlrZSB0aGUgY2xlYW4tdXAhCgpSZXZpZXdl
ZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CgotLSAKS2VlcyBDb29rCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

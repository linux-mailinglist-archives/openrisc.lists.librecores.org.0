Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4E54B5AD5
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 21:07:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 160E3247E9;
	Mon, 14 Feb 2022 21:07:58 +0100 (CET)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mail.librecores.org (Postfix) with ESMTPS id D349C211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 21:07:56 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id h8so13243855ejy.4
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 12:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgwPr3jWEXZiHeYJRBUfKrH3C5wLRAnP7Z6R5s1EJ5U=;
 b=ZcumWtnhggjMFDUHhywZOsPSWocj5WFiFD4wxX4meGi3Jv+FEek8bAx8wm544tPFuD
 FZMy/4sQc4BwvneObDdXEv1mNtlI8GPACMt1JW8whp1hkRcRU1/uCicaO7g7UXSaSO+q
 JQ0jz81cHBjFl3QlKdIkLJ7hR07DlS4kmaNNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgwPr3jWEXZiHeYJRBUfKrH3C5wLRAnP7Z6R5s1EJ5U=;
 b=pkJ3avhn0O14W8Jux2WBPP5UGXhylpkHPL6YZ8yhieWtqpRWby5d6cpfQkHkryo2MC
 CFHOqEpgyiL1XBcwhhYrodfUT5LIlY2/9xAjcDMER+7b9pHRnWbc2z6KDBJlp6HDmzuF
 PSBodw3DfLk6Phe1+dDFNxYZItdlUT4z09Bbhfu8Q3usVvPejRoFjl1pT5+22iUvh2F2
 h7A9gWqnZDr45SldBlWhFRm3T622Zy7Ph8b8/sI9LWI6R1d6yLL0ayGxtnLWFCgX9gDF
 Di9RsU/3tc/RxImBtCLFlMX6deBqvSgHAD7oCl6IkOAFE3A4NyA0cG6ygxp7QfS2tlD7
 nFMQ==
X-Gm-Message-State: AOAM531HZ40LAHXDo0YpNcN1iNjiC4gekIudn83JNXb14/UWEdbv8nw/
 0zZ66xcOLnaDXoL9vgkBZZXtS7F6R7ESZukY/4A=
X-Google-Smtp-Source: ABdhPJySytnIzW0G9p/AsvXuhtVqL79PBB2uDuKKnCFvZTmlFmLWLDgLwgIA0b7tUDf6o4azwTaYUA==
X-Received: by 2002:a17:906:729d:: with SMTP id
 b29mr333970ejl.471.1644869276379; 
 Mon, 14 Feb 2022 12:07:56 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44])
 by smtp.gmail.com with ESMTPSA id o11sm1279249edq.101.2022.02.14.12.07.56
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:07:56 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id b13so28897166edn.0
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 12:07:56 -0800 (PST)
X-Received: by 2002:a2e:a231:: with SMTP id i17mr205093ljm.443.1644868881602; 
 Mon, 14 Feb 2022 12:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
In-Reply-To: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 12:01:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
Message-ID: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 04/14] x86: use more conventional access_ok()
 definition
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
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMTE6NDYgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEFzIEFsIHBvaW50ZWQgb3V0LCB0aGV5IHR1cm5lZCBvdXQgdG8g
YmUgbmVjZXNzYXJ5IG9uIHNwYXJjNjQsIGJ1dCB0aGUgb25seQo+IGRlZmluaXRpb25zIGFyZSBv
biBzcGFyYzY0IGFuZCB4ODYsIHNvIGl0J3MgcG9zc2libGUgdGhhdCB0aGV5IHNlcnZlIGEgc2lt
aWxhcgo+IHB1cnBvc2UgaGVyZSwgaW4gd2hpY2ggY2FzZSBjaGFuZ2luZyB0aGUgbGltaXQgZnJv
bSBUQVNLX1NJWkUgdG8KPiBUQVNLX1NJWkVfTUFYIGlzIHByb2JhYmx5IHdyb25nIGFzIHdlbGwu
Cgp4ODYtNjQgaGFzIGFsd2F5cygqKSB1c2VkIFRBU0tfU0laRV9NQVggZm9yIGFjY2Vzc19vaygp
LCBhbmQgdGhlCmdldF91c2VyKCkgYXNzZW1ibGVyIGltcGxlbWVudGF0aW9uIGRvZXMgdGhlIHNh
bWUuCgpJIHRoaW5rIGFueSBfX3JhbmdlX25vdF9vaygpIHVzZXJzIHRoYXQgdXNlIFRBU0tfU0la
RSBhcmUgZW50aXJlbHkKaGlzdG9yaWNhbCwgYW5kIHNob3VsZCBiZSBqdXN0IGZpeGVkLgoKICAg
ICAgICAgICAgICAgICBMaW51cwoKKCopIEFuZCBieSAiYWx3YXlzIiBJIG1lYW4gImFzIGZhciBi
YWNrIGFzIEkgYm90aGVyZWQgdG8gZ28iLiBJbiB0aGUKMi42LjEyIGdpdCBpbXBvcnQsIHdlIGhh
ZAoKICAgICNkZWZpbmUgVVNFUl9EUyAgICAgICAgICBNQUtFX01NX1NFRyhQQUdFX09GRlNFVCkK
CnNvIHRoZSB1c2VyIGFjY2VzcyBsaW1pdCB3YXMgYWN0dWFsbHkgbm90IHJlYWxseSBUQVNLX1NJ
WkVfTUFYIGF0IGFsbCwKYnV0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGtlcm5lbCBtYXBwaW5nLCB3
aGljaCBvbiB4ODYtNjQgaXMgbXVjaCBtdWNoCmhpZ2hlci4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK

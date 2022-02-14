Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 973B04B5AA4
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 20:46:14 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 53DD824801;
	Mon, 14 Feb 2022 20:46:14 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 8F918242D7
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 20:46:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D6186118C
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CCFC340FC
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644867970;
 bh=kZ0Ha+ZttRWbRYErkpKyuJC1dyK+QrO2i6Uu5KgHMvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y0tFdEItPyIpX9Q57aljIliTeAqJEjfsGhV5sRnV7cHDKUAHBtZxnjnJQ0aG/E0DY
 ntmMdawRiR6T8SjqmJRkg+eiX9WIai06zkYCR7faiov+1eO6KA28Xd0WJ3G4HzZ7Ki
 PswrJdfwevWrM+GcXzzieldjGJJj+F38X56atyYmYHaGjvacQFUxk+Q3y53FA51+T8
 ZklKna1hQALqex7ucGzH+u+kKR6+AMMF6Gi34rWhxaWoueN0V5gBdQpdknscuvJdj6
 4dVyfkX9O/n11Gjix37hL+YmaFTxTy2u9mOy0+3ugdzfzd4uf88HSfSBljtkByDhnd
 ubPSK5lCMcVZQ==
Received: by mail-wr1-f53.google.com with SMTP id q7so28500762wrc.13
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 11:46:09 -0800 (PST)
X-Gm-Message-State: AOAM530kQPHgc1bZr3irF6nreqKnSo8uB2bzj4EFut5uiOYTxNtiK2G3
 uUjv5WKA1zx/OGJHpgHdCBcyzzU4YgYQAksLtbg=
X-Google-Smtp-Source: ABdhPJyfeYwWpAfp1t9O1z8BIiteD6oMiQUhUFLNHvAQyjgPbxD0FyJauHtAzbL5TNr8UyIGWRM1U9VPuoeyXIyyYo0=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr445399wrp.219.1644867968239; 
 Mon, 14 Feb 2022 11:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
In-Reply-To: <YgqLFYqIqkIsNC92@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:45:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
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
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgNjowMiBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDJQ
TSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ICsjZGVmaW5lIF9fcmFuZ2Vfbm90X29r
KGFkZHIsIHNpemUsIGxpbWl0KSAgICAoIV9fYWNjZXNzX29rKGFkZHIsIHNpemUpKQo+ID4gKyNk
ZWZpbmUgX19jaGtfcmFuZ2Vfbm90X29rKGFkZHIsIHNpemUsIGxpbWl0KSAgICAgICAgKCFfX2Fj
Y2Vzc19vaygodm9pZCBfX3VzZXIgKilhZGRyLCBzaXplKSkKPgo+IENhbiB3ZSBqdXN0IGtpbGwg
dGhlc2Ugb2ZmIGluc3RlZCBvZiBsZXR0aW5nIHRoZW1tIG9ic2Z1Y2F0ZSB0aGUgY29kZT8KCkFz
IEFsIHBvaW50ZWQgb3V0LCB0aGV5IHR1cm5lZCBvdXQgdG8gYmUgbmVjZXNzYXJ5IG9uIHNwYXJj
NjQsIGJ1dCB0aGUgb25seQpkZWZpbml0aW9ucyBhcmUgb24gc3BhcmM2NCBhbmQgeDg2LCBzbyBp
dCdzIHBvc3NpYmxlIHRoYXQgdGhleSBzZXJ2ZSBhIHNpbWlsYXIKcHVycG9zZSBoZXJlLCBpbiB3
aGljaCBjYXNlIGNoYW5naW5nIHRoZSBsaW1pdCBmcm9tIFRBU0tfU0laRSB0bwpUQVNLX1NJWkVf
TUFYIGlzIHByb2JhYmx5IHdyb25nIGFzIHdlbGwuCgpTbyBlaXRoZXIgSSBuZWVkIHRvIHJldmVy
dCB0aGUgb3JpZ2luYWwgZGVmaW5pdGlvbiBhcyBJIGRpZCBvbiBzcGFyYzY0LCBvcgp0aGV5IGNh
biBiZSByZW1vdmVkIGNvbXBsZXRlbHkuIEhvcGVmdWxseSBBbCBvciB0aGUgeDg2IG1haW50YWlu
ZXJzCmNhbiBjbGFyaWZ5LgoKICAgICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

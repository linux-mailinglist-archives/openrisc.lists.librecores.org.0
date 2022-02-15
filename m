Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 02A7F4B6750
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 10:18:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A87452481E;
	Tue, 15 Feb 2022 10:18:36 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id A5B7C24817
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 10:18:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D2E960A76
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F4DC340F3
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916712;
 bh=auvbexz8OfCE17jezkrwExlxQUSMdLXG0OAD2bmLs8A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WkCGrtyaPGx2lCQmidRf50Nww49rtYKXGqhrb3/C0e99NEVq0x4+WE9foIS4kUwTy
 Mg2PS200LzaF04kA9XIMm+68B/HWgDxXUTEMDmtFuo/vuZCLa1nzhj77kQBMW/PnbX
 ukG7A6NTl1LhUebF+egxWGXBS1bclOmuETqe5/P7P8hYCPMJV01ML09i4Dj7Oc4eam
 qPGV0kiOvw/HrhOoUIvvr9kVOKBBLAKePRDoLhNMD5z9l8zC/MfMs684bQIAPICifC
 JNi2hHWCbvRfB0irmZRpMndHoBz4k0WZn3sUQdjIzkz5H4VhtCg1X21uy/aeXseCev
 i16v7OHaWl0OQ==
Received: by mail-wr1-f52.google.com with SMTP id s10so17421683wrb.1
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:18:32 -0800 (PST)
X-Gm-Message-State: AOAM532nu0Pg+PHSm8VEhAlmKMFUQ6ZxqSnSBMCITA4tHqVEmQTLg6vj
 rvMkcfXRX6KEqaFPwq6Kc+j6p939gAQ6hKUzXLU=
X-Google-Smtp-Source: ABdhPJytLoTfipZUwnG73E442/QjIxHnERGjQ2aeR9o7LjnpbatwjsLI+Mk7641j6VpHXtVWtwvDTIufUdUsOw5At+o=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr2390801wrv.12.1644916711299;
 Tue, 15 Feb 2022 01:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org>
 <YgqK1ihlJvRFHJ9h@infradead.org>
In-Reply-To: <YgqK1ihlJvRFHJ9h@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:18:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [OpenRISC] [PATCH 03/14] nds32: fix access_ok() checks in
 get/put_user
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
 "# 3.4.x" <stable@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgNjowMSBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDFQ
TSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4gPgo+ID4gVGhlIGdldF91c2VyKCkvcHV0X3VzZXIoKSBmdW5jdGlvbnMg
YXJlIG1lYW50IHRvIGNoZWNrIGZvcgo+ID4gYWNjZXNzX29rKCksIHdoaWxlIHRoZSBfX2dldF91
c2VyKCkvX19wdXRfdXNlcigpIGZ1bmN0aW9ucwo+ID4gZG9uJ3QuCj4gPgo+ID4gVGhpcyBicm9r
ZSBpbiA0LjE5IGZvciBuZHMzMiwgd2hlbiBpdCBnYWluZWQgYW4gZXh0cmFuZW91cwo+ID4gY2hl
Y2sgaW4gX19nZXRfdXNlcigpLCBidXQgbG9zdCB0aGUgY2hlY2sgaXQgbmVlZHMgaW4KPiA+IF9f
cHV0X3VzZXIoKS4KPgo+IENhbiB3ZSBmb2xsb3cgdGhlIGxlYWQgb2YgTUlQUyAod2hpY2ggdGhp
cyB3YXMgb3JpZ2luYWxseSBjb3BpZWQKPiBmcm9tIEkgdGhpbmspIGFuZCBraWxsIHRoZSBwb2lu
dGxlc3MgX19nZXQvcHV0X3VzZXJfY2hlY2sgd3JhcHBlcgo+IHRoYXQganVzdCBvYnNmdWNhdGUg
dGhlIGNvZGU/CgpJIGhhZCBhbm90aGVyIGxvb2ssIGJ1dCBJIHRoaW5rIHRoYXQgd291bGQgYmUg
YSBiaWdnZXIgY2hhbmdlIHRoYW4KSSB3YW50IHRvIGhhdmUgaW4gYSBmaXggZm9yIHN0YWJsZSBi
YWNrcG9ydHMsIGFzIG5kczMyIGFsc28gdXNlcwp0aGUgX2NoZWNrIHZlcnNpb25zIGluIF9fe2dl
dCxwdXR9X3VzZXJfZXJyb3IuCgpJZiB3ZSBpbnN0ZWFkIGNsZWFuIGl0IHVwIGluIGEgc2VwYXJh
dGUgcGF0Y2gsIGl0IHNob3VsZCBiZSBkb25lIGZvcgphbGwgZWlnaHQgYXJjaGl0ZWN0dXJlcyB0
aGF0IGRvIHRoZSBzYW1lIHRoaW5nLCBidXQgYXQgdGhhdCBwb2ludCwKdGhlIHRpbWUgc2VlbXMg
YmV0dGVyIHNwZW50IGF0IGNvbWluZyB1cCB3aXRoIGEgbmV3IHNldCBvZgpjYWxsaW5nIGNvbnZl
bnRpb25zIHRoYXQgd29yayB3aXRoIGFzbS1nb3RvLgoKICAgICAgICAgQXJuZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxp
c3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVz
Lm9yZy9saXN0aW5mby9vcGVucmlzYwo=

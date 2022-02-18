Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6234BB315
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 08:16:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5A84A24785;
	Fri, 18 Feb 2022 08:16:43 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 6EBBE24851
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 08:16:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E88161EFA
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214DEC340ED
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168599;
 bh=q+jKWrJ4jJZ2v7I08P11+5fwNrVng4vZR8KgCaGgNp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uRNZZy2+CPWOJuv92dOyd1rHvNKhBILuz7HojVOaF7lOL/BoFj24u43pDTtSwcO2B
 kS7Pw80lZTXEPfCTL3Z7vghTrC4SlGVuhJo+OTP7MCTgX2G37yx65ofo19RQjnL/RA
 X1RHeHskgmZa1dqz/hywb50yEcB9u+SOk/d9BB2OqS8LnUJf/8wGrCrwZ7NdDCfC1d
 WKze8Im+ewzQ4s1dw54fZcQSR5KpeItLpAf4+TQihtipY9ZngwMB0KyPQdQnz8zfKi
 SziJH9s7tyIY2mWzArtdycjGo1CV8W1cYp0Oo2w7ym11uKexowxQSNg8OfalrjO5tJ
 GBzjZlGpGhjvA==
Received: by mail-ed1-f44.google.com with SMTP id m17so13782073edc.13
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 23:16:39 -0800 (PST)
X-Gm-Message-State: AOAM533SKku/UIdAXQ37h5oo7PlmkTHWNntyOuxZu9lmwyhSxxRXQw4E
 BmOg/juK17J9FNWd+V3C6q2FoC+MMz0/xNV038M=
X-Google-Smtp-Source: ABdhPJzrsD9ZegAYWxopB2Dqyhs5CbptDH37N4ZCxM0ghQnmxjYRVare/kFAwMrZOPIITOhmBYHifd3MXTFISbjy0gQ=
X-Received: by 2002:adf:c406:0:b0:1e4:a5ae:34a3 with SMTP id
 v6-20020adfc406000000b001e4a5ae34a3mr5120080wrf.407.1645168587142; Thu, 17
 Feb 2022 23:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
In-Reply-To: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:16:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgODoxNSBQTSBBbmR5IEx1dG9taXJza2kgPGx1dG9AYW1h
Y2FwaXRhbC5uZXQ+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgNToxOSBBTSBB
cm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4gVGhlcmUgYXJlIG1hbnkgZGlmZmVyZW50
IHdheXMgdGhhdCBhY2Nlc3Nfb2soKSBpcyBkZWZpbmVkIGFjcm9zcwo+ID4gYXJjaGl0ZWN0dXJl
cywgYnV0IGluIHRoZSBlbmQsIHRoZXkgYWxsIGp1c3QgY29tcGFyZSBhZ2FpbnN0IHRoZQo+ID4g
dXNlcl9hZGRyX21heCgpIHZhbHVlIG9yIHRoZXkgYWNjZXB0IGFueXRoaW5nLgo+ID4KPiA+IFBy
b3ZpZGUgb25lIGRlZmluaXRpb24gdGhhdCB3b3JrcyBmb3IgbW9zdCBhcmNoaXRlY3R1cmVzLCBj
aGVja2luZwo+ID4gYWdhaW5zdCBUQVNLX1NJWkVfTUFYIGZvciB1c2VyIHByb2Nlc3NlcyBvciBz
a2lwcGluZyB0aGUgY2hlY2sgaW5zaWRlCj4gPiBvZiB1YWNjZXNzX2tlcm5lbCgpIHNlY3Rpb25z
Lgo+ID4KPiA+IEZvciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQgQ09ORklHX1NFVF9GUygpLCB0aGlz
IHNob3VsZCBiZSB0aGUgZmFzdGVzdAo+ID4gY2hlY2ssIGFzIGl0IGNvbWVzIGRvd24gdG8gYSBz
aW5nbGUgY29tcGFyaXNvbiBvZiBhIHBvaW50ZXIgYWdhaW5zdCBhCj4gPiBjb21waWxlLXRpbWUg
Y29uc3RhbnQsIHdoaWxlIHRoZSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgdmVyc2lvbnMgdGVuZCB0
bwo+ID4gZG8gc29tZXRoaW5nIG1vcmUgY29tcGxleCBmb3IgaGlzdG9yaWMgcmVhc29ucyBvciBn
ZXQgc29tZXRoaW5nIHdyb25nLgo+Cj4gVGhpcyBpc24ndCBhY3R1YWxseSBvcHRpbWFsLiAgT24g
eDg2LCBUQVNLX1NJWkVfTUFYIGlzIGEgYml6YXJyZQo+IGNvbnN0YW50IHRoYXQgaGFzIGEgdmVy
eSBzcGVjaWZpYyB2YWx1ZSB0byB3b3JrIGFyb3VuZCBhIGJ1Z15XZGVzaWduCj4gZXJyb3JeV2Zl
YXR1cmUgb2YgSW50ZWwgQ1BVcy4gIFRBU0tfU0laRV9NQVggaXMgdGhlIG1heGltdW0gYWRkcmVz
cyBhdAo+IHdoaWNoIHVzZXJzcGFjZSBpcyBwZXJtaXR0ZWQgdG8gYWxsb2NhdGUgbWVtb3J5LCBi
dXQgdGhlcmUgaXMgYSBodWdlCj4gZ2FwIGJldHdlZW4gdXNlciBhbmQga2VybmVsIGFkZHJlc3Nl
cywgYW5kIGFueSB2YWx1ZSBpbiB0aGUgZ2FwIHdvdWxkCj4gYmUgYWRlcXVhdGUgZm9yIHRoZSBj
b21wYXJpc29uLiAgSWYgd2Ugd2FudGVkIHRvIG9wdGltaXplIHRoaXMsIHNpbXBseQo+IGNoZWNr
aW5nIHRoZSBoaWdoIGJpdCAod2hpY2ggeDg2IGNhbiBkbyB3aXRob3V0IGFueSBpbW1lZGlhdGUK
PiBjb25zdGFudHMgYXQgYWxsKSB3b3VsZCBiZSBzdWZmaWNpZW50IGFuZCwgZm9yIGFuIGFjY2Vz
cyBrbm93biB0byBmaXQKPiBpbiAzMiBiaXRzLCBvbmUgY291bGQgZ2V0IGV2ZW4gZmFuY2llciBh
bmQgY29tcGxldGVseSBpZ25vcmUgdGhlIHNpemUKPiBvZiB0aGUgYWNjZXNzLiAgKEZvciBhY2Nl
c3NlcyBub3Qga25vd24gdG8gZml0IGluIDMyIGJpdHMsIEkgc3VzcGVjdAo+IHNvbWUgY3JlYXRp
dml0eSBjb3VsZCBzdGlsbCBjb21lIHVwIHdpdGggYSBjb25zdHJ1Y3Rpb24gdGhhdCdzCj4gc3Vi
c3RhbnRpYWxseSBmYXN0ZXIgdGhhbiB0aGUgb25lIGluIHlvdXIgcGF0Y2guKQo+Cj4gU28gdGhl
cmUncyBwbGVudHkgb2Ygcm9vbSBmb3Igb3B0aW1pemF0aW9uIGhlcmUuCj4KPiAoVGhpcyBpcyBu
b3QgaW4gYW55IHJlc3BlY3QgYSBOQUsgLS0gaXQncyBqdXN0IGFuIG9ic2VydmF0aW9uIHRoYXQK
PiB0aGlzIGNvdWxkIGJlIGV2ZW4gYmV0dGVyLikKClRoYW5rIHlvdSBmb3IgdGFraW5nIGEgbG9v
ayEKCkFzIHlvdSBjYW4gc2VlIGluIHRoZSBwYXRjaCB0aGF0IGNoYW5nZXMgdGhlIGFsZ29yaXRo
bSBvbiB4ODYgWzFdLAppdCB3YXMgYWxyZWFkeSB1c2luZyBUQVNLX1NJWkVfTUFYIGFzIHRoZSBs
aW1pdCwgb25seSB0aGUgb3JkZXIKaW4gd2hpY2ggdGhlIGNvbXBhcmlzb24gaXMgZG9uZSwgaG9w
ZWZ1bGx5IGxlYWRpbmcgdG8gYmV0dGVyIGNvZGUKYWxyZWFkeS4gSSBoYXZlIGxvb2tlZCBhdCB0
cml2aWFsIGV4YW1wbGVzIG9uIHg4NiB0aGF0IHNob3dlZCBhbgppbXByb3ZlbWVudCBmb3IgY29u
c3RhbnQgc2l6ZXMsIGJ1dCBvbmx5IGxvb2tlZCBhdCBhcm02NCBpbiBkZXRhaWwKZm9yIHRoZSBv
dmVyYWxsIHJlc3VsdC4KCkl0IG1heSBiZSB3b3J0aCBjaGVja2luZyBpZiB1c2luZyBMT05HX01B
WCBhcyB0aGUgbGltaXQgcHJvZHVjZXMKYmV0dGVyIGNvZGUsIGJ1dCBpdCdzIHByb2JhYmx5IGJl
c3QgdG8gZG8gdGhlIG9wdGltaXphdGlvbiBpbiB0aGUKY29tbW9uIGNvZGUgaW4gYSBwb3J0YWJs
ZSB3YXkgdG8ga2VlcCBpdCBmcm9tIGRpdmVyZ2luZyBhZ2Fpbi4KCiAgICAgICBBcm5kCgpbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDIxNjEzMTMzMi4xNDg5OTM5LTctYXJu
ZEBrZXJuZWwub3JnLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

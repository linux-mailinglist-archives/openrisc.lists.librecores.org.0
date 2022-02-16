Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4C774B8886
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:07:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 879F82480F;
	Wed, 16 Feb 2022 14:07:34 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id DED4A24804
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:07:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2D9FB81E33
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 13:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C42EC004E1
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645016848;
 bh=1AijW/WQHr1DB1sxEAf5u6qv337FtGM78rBteqtJsFc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eR+pSKH4i6urTuHp8SMbS5L1lR3P8nmUJD1ceuRkMB/sblKVDbLXa1V4ctffg9nqc
 MZ5CBIrrbDclezyxDR65zlJoJwsJKXVka8NfLNDubVRDW9ZvCKPHsFAEvX9AFZTsZv
 XnnWprcYEUL0wAlpQd7dc+lXs/OTQCaQYh4Tp+vOP3HmdsrK0eFF7UtxZpyNowsTVi
 zM/+EI/YimTD5jwhaXtmYxLzPSVvtcoRmpJVJY78ao3wMJq6/He+p2X7cLGtOBXumX
 wTmvqAWgaou0W2I7Zotd0nfs1DoMTyvG1TxkxcPC8omu42Os9MSRVgWK73cqn7SZMh
 YK6O45QCqEgew==
Received: by mail-wm1-f44.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so1563967wmq.3
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 05:07:28 -0800 (PST)
X-Gm-Message-State: AOAM531VtKxnw7jlE1Hl7KQig9OyY4v/bGSHnmXYYIB43qqlmOFpBshF
 plMHKmivdHQ70fZRq+v0qwF3gtmwWByAyhwqV4I=
X-Google-Smtp-Source: ABdhPJwloTGuyJt/Hdm31OFklwbHVE+n23OzkTYnWy+HDNvimUM0g1FM9pYMdMLaGtlr03PBtziLgSkYqMH3Naa88b4=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr1594630wms.82.1645016837028; Wed, 16
 Feb 2022 05:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-12-arnd@kernel.org>
 <Ygr4Q2/KxfF86ETa@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygr4Q2/KxfF86ETa@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 14:07:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a30supB-MNzhoELOerOemxwTfDFFqZrzmNDQA=WW+VLbw@mail.gmail.com>
Message-ID: <CAK8P3a30supB-MNzhoELOerOemxwTfDFFqZrzmNDQA=WW+VLbw@mail.gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [OpenRISC] [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
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
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTo0OCBBTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwNTozNDo0OVBNICsw
MTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Cj4gPiAtLyoKPiA+IC0gKiBTcGFyYzY0IGlzIHNl
Z21lbnRlZCwgdGhvdWdoIG1vcmUgbGlrZSB0aGUgTTY4SyB0aGFuIHRoZSBJMzg2Lgo+ID4gLSAq
IFdlIHVzZSB0aGUgc2Vjb25kYXJ5IEFTSSB0byBhZGRyZXNzIHVzZXIgbWVtb3J5LCB3aGljaCBy
ZWZlcmVuY2VzIGEKPiA+IC0gKiBjb21wbGV0ZWx5IGRpZmZlcmVudCBWTSBtYXAsIHRodXMgdGhl
cmUgaXMgemVybyBjaGFuY2Ugb2YgdGhlIHVzZXIKPiA+IC0gKiBkb2luZyBzb21ldGhpbmcgcXVl
ZXIgYW5kIHRyaWNraW5nIHVzIGludG8gcG9raW5nIGtlcm5lbCBtZW1vcnkuCj4KPiBBY3R1YWxs
eSwgdGhpcyBwYXJ0IG9mIGNvbW1lbnQgcHJvYmFibHkgb3VnaHQgdG8gc3RheSAtIGl0IGlzIHJl
bGV2YW50Cj4gZm9yIHVuZGVyc3RhbmRpbmcgd2hhdCdzIGdvaW5nIG9uIChlLmcuIHdoeSBpcyBh
Y2Nlc3Nfb2soKSBhbHdheXMgdHJ1ZSwgZXRjLikKCk9rLCBJJ3ZlIHB1dCBpdCBiYWNrIG5vdy4K
CiAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

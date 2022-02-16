Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CD4414B9388
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 23:03:16 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A315924845;
	Wed, 16 Feb 2022 23:03:16 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 4BF4324828
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 23:03:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E343DB82078
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 22:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56958C340F3
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645048993;
 bh=ay/5589FenTcDxawo4c9r5D5w/FgYtE3zMvoHKiKBw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SKBiXg1qMAxSOG7O/+fAEZVno6RY18W0gjWd48YvWVehxkUtMksFHxAKOXPaf1Nim
 qHK3jdeXyT7izApYt/dKY/APNToDbzS30oZ/3+FsRDGwHCYVq4RDe7vcie8TG09GCB
 VJT0268zX83XvVza5Mt2NT9M5MRvq5jsvfN9DDwEAft1MUWYI2uGvfXze8xcMLyYPl
 W5bKKzwddcuQftrn4B+eRiSOdBTv8tp7msayxnS9iimb1X7zN2rzIA/p/RbCumDYFK
 ozI4OSbpqbFd1JHV5fS/CeCxidkU8UzvVlyBvKvVSqnpavPgI6V4RqMDH4eF/+tdlu
 AnRmCFW169S3A==
Received: by mail-ej1-f42.google.com with SMTP id lw4so2312284ejb.12
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:03:13 -0800 (PST)
X-Gm-Message-State: AOAM532c7xlFA9EJh45WNJ0OG8S8Si5kT9o5WpuDf/NC0iRxj8wTcxM2
 jAnlL9ZDB5ovRvEAyfz6bqppB4woBEbqEoFueBE=
X-Google-Smtp-Source: ABdhPJyk0zQXj5EZ1uP9z1YUTizioO4kJ6rvneTTyuZji8J8rGr64s8uMSDVOcQeT3f3UOdAxVtCGFpnKRwe/RHh9ys=
X-Received: by 2002:adf:cf0c:0:b0:1e6:22fe:4580 with SMTP id
 o12-20020adfcf0c000000b001e622fe4580mr53483wrj.12.1645048981311; Wed, 16 Feb
 2022 14:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
 <Yg1F/VT4vRX4aHEt@ravnborg.org>
In-Reply-To: <Yg1F/VT4vRX4aHEt@ravnborg.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 23:02:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
Message-ID: <CAK8P3a2gx2w=RDECNbrO4Zu3ZUTfz2UrLbNSz+ieCgMEFiK3TA@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [OpenRISC] [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS
 users
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

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgNzo0NCBQTSBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+IHdyb3RlOgo+Cj4gSGkgQXJuZCwKPgo+IEZpeCBzcGVsbGluZyBpbiAkc3ViamVjdC4u
LgoKZG9uZQoKPiBzcGFyYy9LY29uZmlnIGIvYXJjaC9zcGFyYy9LY29uZmlnCj4gPiBpbmRleCA5
ZjZmOWJjZTUyOTIuLjkyNzZmMzIxYjNlMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvc3BhcmMvS2Nv
bmZpZwo+ID4gKysrIGIvYXJjaC9zcGFyYy9LY29uZmlnCj4gPiBAQCAtNDYsNyArNDYsNiBAQCBj
b25maWcgU1BBUkMKPiA+ICAgICAgIHNlbGVjdCBMT0NLREVQX1NNQUxMIGlmIExPQ0tERVAKPiA+
ICAgICAgIHNlbGVjdCBORUVEX0RNQV9NQVBfU1RBVEUKPiA+ICAgICAgIHNlbGVjdCBORUVEX1NH
X0RNQV9MRU5HVEgKPiA+IC0gICAgIHNlbGVjdCBTRVRfRlMKPiA+ICAgICAgIHNlbGVjdCBUUkFD
RV9JUlFGTEFHU19TVVBQT1JUCj4gPgo+ID4gIGNvbmZpZyBTUEFSQzMyCj4gPiBAQCAtMTAxLDYg
KzEwMCw3IEBAIGNvbmZpZyBTUEFSQzY0Cj4gPiAgICAgICBzZWxlY3QgSEFWRV9TRVRVUF9QRVJf
Q1BVX0FSRUEKPiA+ICAgICAgIHNlbGVjdCBORUVEX1BFUl9DUFVfRU1CRURfRklSU1RfQ0hVTksK
PiA+ICAgICAgIHNlbGVjdCBORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSwo+ID4gKyAgICAg
c2VsZWN0IFNFVF9GUwo+IFRoaXMgbG9va3Mgd3JvbmcgLSBsb29rcyBsaWtlIHNvbWUgbWVyZ2Ug
d2VudCB3cm9uZyBoZXJlLgoKRml4ZWQgbm93LgoKPgo+IE90aGVyIHRoYW4gdGhlIGFib3ZlIHRo
ZSBzcGFyYzMyIGNoYW5nZXMgbG9va3MgZmluZSwgYW5kIHdpdGggdGhlIEtjb25mCj4gc3R1ZmYg
Zml4ZWQ6Cj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4gIyBmb3Ig
c3BhcmMzMiBjaGFuZ2VzCgpUaGFua3MhCgogICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

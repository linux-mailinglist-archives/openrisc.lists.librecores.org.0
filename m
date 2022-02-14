Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DC2CF4B5AEF
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 21:24:45 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8CF1624806;
	Mon, 14 Feb 2022 21:24:45 +0100 (CET)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mail.librecores.org (Postfix) with ESMTPS id 3C987242D9
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 21:24:44 +0100 (CET)
Received: by mail-ed1-f48.google.com with SMTP id z22so3400880edd.1
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 12:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=JVRzXzobglXSiT0bLuA7vSr1HiJLXJeQF0BO276l66RCTCZjx8953KmFOVPMErrs0l
 on/NKX4mjsS9TS9bqhorHzBzM+OjtKgBLqdNoyLvrA639t1A433SV7/dJ5dxrhaCdPXH
 bTp5UzrLKiAt8Y3WQUfvdICLgLXk8cVAfLq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=NFoQgejG0P7lcjH+J1CCxwa8GNMNUev7nmi4A6DIpvP8eJrxCHx3MhrirP/yBQCbQI
 4+zDWbFmht4rBXHK1VQUKsbxlkJKw/rfLrhRnsH+PCjmZCqiRJFhYfEURxCh7s6hs015
 Cb92oTH6Iw4j0cguuKmb3Cp3FCx+6AvJo8cqkd/xWPyrO6j1kXoId0/GOi5r5dP8TuYn
 VZGiTvNQC0tnDzdLCbX4JHsqa9ybOkUsKO7RMp4MYLeL/bmwsl1it0A437CFaN6G/f38
 OmdkFOcBSiHGxDna/IwRHsHiqBQKJlr7phaB4ODMqhsJmBOSHW6sRoJztUfNc4qQBSWS
 0nZA==
X-Gm-Message-State: AOAM532JWuNKg5MGN4LG1HtVBj3KxTOeXhMiRqiw/BL63oKzX6gg5RQx
 uBVByRZv5UIhowRYp0HdC04EghyF8urThKMAapk=
X-Google-Smtp-Source: ABdhPJzYkfq/GmmbC9wFbFHoFuLPDY+Hu4pBVDHpgRPP+kANpy8COrrhmoQn+r5sre1IuDzphDiOYA==
X-Received: by 2002:aa7:cdc9:: with SMTP id h9mr557863edw.27.1644870283562;
 Mon, 14 Feb 2022 12:24:43 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46])
 by smtp.gmail.com with ESMTPSA id p16sm5641762ejn.54.2022.02.14.12.24.40
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:24:41 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id b14so4334026ede.9
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 12:24:40 -0800 (PST)
X-Received: by 2002:a05:651c:1543:: with SMTP id
 y3mr306548ljp.152.1644870269711; 
 Mon, 14 Feb 2022 12:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
In-Reply-To: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 12:24:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMTI6MDEgUE0gTGludXMgVG9ydmFsZHMKPHRvcnZhbGRz
QGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKPgo+IHg4Ni02NCBoYXMgYWx3YXlzKCopIHVz
ZWQgVEFTS19TSVpFX01BWCBmb3IgYWNjZXNzX29rKCksIGFuZCB0aGUKPiBnZXRfdXNlcigpIGFz
c2VtYmxlciBpbXBsZW1lbnRhdGlvbiBkb2VzIHRoZSBzYW1lLgoKU2lkZSBub3RlOiB3ZSBjb3Vs
ZCBqdXN0IGNoZWNrIHRoZSBzaWduIGJpdCBpbnN0ZWFkLCBhbmQgYXZvaWQgYmlnCmNvbnN0YW50
cyB0aGF0IHdheS4KClJpZ2h0IG5vdyB3ZSBhY3R1YWxseSBoYXZlIHRoaXMgY29tcGxleGl0eSBp
biB0aGUgeDg2LTY0IHVzZXIgYWNjZXNzIGNvZGU6CgogICNpZmRlZiBDT05GSUdfWDg2XzVMRVZF
TAogICNkZWZpbmUgTE9BRF9UQVNLX1NJWkVfTUlOVVNfTihuKSBcCiAgICAgICAgQUxURVJOQVRJ
VkUgX19zdHJpbmdpZnkobW92ICQoKDEgPDwgNDcpIC0gNDA5NiAtIChuKSksJXJkeCksIFwKICAg
ICAgICAgICAgICAgICAgICBfX3N0cmluZ2lmeShtb3YgJCgoMSA8PCA1NikgLSA0MDk2IC0gKG4p
KSwlcmR4KSwKWDg2X0ZFQVRVUkVfTEE1NwogICNlbHNlCiAgI2RlZmluZSBMT0FEX1RBU0tfU0la
RV9NSU5VU19OKG4pIFwKICAgICAgICAgIG1vdiAkKFRBU0tfU0laRV9NQVggLSAobikpLCVfQVNN
X0RYCiAgI2VuZGlmCgpqdXN0IGJlY2F1c2UgdGhlIGNvZGUgdHJpZXMgdG8gZ2V0IHRoYXQgVEFT
S19TSVpFX01BWCBib3VuZGFyeSBqdXN0IHJpZ2h0LgoKQW5kIGdldHRpbmcgdGhhdCBib3VuZGFy
eSBqdXN0IHJpZ2h0IGlzIGltcG9ydGFudCBvbiAzMi1iaXQgeDg2LCBidXQKaXQncyAqbXVjaCog
bGVzcyBpbXBvcnRhbnQgb24geDg2LTY0LgoKVGhlcmUncyBzdGlsbCBhICh3ZWFrKSByZWFzb24g
dG8gZG8gaXQgZXZlbiBmb3IgNjQtYml0IGNvZGU6IHBhZ2UKZmF1bHRzIG91dHNpZGUgdGhlIHZh
bGlkIHVzZXIgc3BhY2UgcmFuZ2UgZG9uJ3QgYWN0dWFsbHkgY2F1c2UgYSAjUEYKZmF1bHQgLSB0
aGV5IGNhdXNlICNHUCAtIGFuZCB0aGVuIHdlIGhhdmUgdGhlICNHUCBoYW5kbGVyIHdhcm4gYWJv
dXQKInRoaXMgYWRkcmVzcyBoYXNuJ3QgYmVlbiBjaGVja2VkIi4KCldoaWNoIGlzIG5pY2UgYW5k
IHVzZWZ1bCBmb3IgZG9pbmcgc3l6Ym90IGtpbmQgb2YgcmFuZG9taXphdGlvbiBsb2FkcwooaWUg
dXNlciBhY2Nlc3NlcyB0aGF0IGRpZG4ndCBnbyB0aHJvdWdoIGFjY2Vzc19vaygpIHdpbGwgc3Rh
bmQgb3V0Cm5pY2VseSksIGJ1dCBtYXliZSBpdCdzIG5vdCB3b3J0aCB0aGlzLiBzeXpib3Qgd291
bGQgYmUgZmluZSB3aXRoIG9ubHkKdGhlICJzaWduIGJpdCBzZXQiIGNhc2Ugd2FybmluZyBmb3Ig
dGhlIHNhbWUgdGhpbmcuCgpTbyBvbiB4ODYtNjQsIHdlIGNvdWxkIGp1c3QgY2hlY2sgdGhlIHNp
Z24gb2YgdGhlIGFkZHJlc3MgaW5zdGVhZCwgYW5kCnNpbXBsaWZ5IGFuZCBzaHJpbmsgdGhvc2Ug
Z2V0L3B1dF91c2VyKCkgY29kZSBzZXF1ZW5jZXMgKGJ1dAphcnJheV9pbmRleF9tYXNrX25vc3Bl
YygpIGN1cnJlbnRseSB1c2VzIHRoZSBjYXJyeSBmbGFnIGNvbXB1dGF0aW9uCnRvbywgc28gd2Un
ZCBoYXZlIHRvIGNoYW5nZSB0aGF0IHBhcnQgYXMgd2VsbCwgbWF5YmUgbm90IHdvcnRoIGl0KS4K
CiAgICAgICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

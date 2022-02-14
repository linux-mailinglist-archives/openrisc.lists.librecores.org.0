Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFC24B5898
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 18:35:47 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1650224801;
	Mon, 14 Feb 2022 18:35:47 +0100 (CET)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mail.librecores.org (Postfix) with ESMTPS id 4272E211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:35:46 +0100 (CET)
Received: by mail-lf1-f42.google.com with SMTP id z19so32003471lfq.13
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=B3+89vMVlD+t/jr4Ir3J5heCAGLy+8O/Bfqv5DSjHS7vGRacFAUCCs0TF2tOD5+IOJ
 DARHbhMwmXg8IKTGNN5wyW1UIWJ3dy3zDkUXnMSy6euD4EH/SAawjrYbWaSs+0JtxWja
 ZBOb3OkzZ9V/CSYGxjkJVHb89skxzNvZve0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=eiNDvX6fKiq58Xhp1ZM7tBnEpSjtwXPlW8DAtGupxuhXSTe+KScwpZQAGFjtr5HCrC
 l6jWTkGMDklZ5RyCxhXKb+0ytHTDeOMHKkeZxzhcpLD285WzClcNIEsaULBVK7KmMHES
 Mn7z1Lu5WV+66y167CkT+NlKjHtHz1e4WsGkZmQNQmuVF3F7j/JbNj1mi0izpK3NIv3x
 qgRZ5ayeI8oyA7VbzBK/IYUFtlcIStG/UDJhShl9lnFu+CsJnvdIiJT861QR0VpU3+CD
 rhNkDq6oj8BhsJlfqfA0Nod9opXEfQ/UDZVlyTKwcMBW7jFnBlsoeh8CqLn4uH19Rmel
 RF8A==
X-Gm-Message-State: AOAM533jS2vzXxhfrkA/FIl7W3UzWKAGKBLHjb0d3K9SeY5l7TcX1D6K
 Yol4cxfJJvxEuUx0pDfr+sieM1EXQafEJz4D+zQ=
X-Google-Smtp-Source: ABdhPJxcPWPq52PBfVXbeO6UZ6bfPmOKsBt6oRP1/KhWmZoSjwgxQboZlia6frcI4iD7gfKCIzT6Iw==
X-Received: by 2002:a05:6512:3d27:: with SMTP id
 d39mr48750lfv.475.1644860145352; 
 Mon, 14 Feb 2022 09:35:45 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52])
 by smtp.gmail.com with ESMTPSA id o13sm586708lfg.142.2022.02.14.09.35.43
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:35:44 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id f37so5788728lfv.8
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 09:35:43 -0800 (PST)
X-Received: by 2002:a19:4302:: with SMTP id q2mr49672lfa.449.1644860131952;
 Mon, 14 Feb 2022 09:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 09:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 00/14] clean up asm/uaccess.h,
 kill set_fs for good
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
 linux-sparc <sparclinux@vger.kernel.org>,
 linux-hexagon <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-parisc <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgODozNSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gSSBkaWQgYSBwYXRjaCBmb3IgbWljcm9ibGF6ZSBhdCBzb21lIHBv
aW50LCB3aGljaCB0dXJuZWQgb3V0IHRvIGJlIGZhaXJseQo+IGdlbmVyaWMsIGFuZCBub3cgcG9y
dGVkIGl0IHRvIG1vc3Qgb3RoZXIgYXJjaGl0ZWN0dXJlcywgdXNpbmcgbmV3IGdlbmVyaWMKPiBp
bXBsZW1lbnRhdGlvbnMgb2YgYWNjZXNzX29rKCkgYW5kIF9fe2dldCxwdXR9X2tlcm5lbF9ub2No
ZWNrKCkuCgpUaGFua3MgZm9yIGRvaW5nIHRoaXMuCgpBcGFydCBmcm9tIHRoZSBzcGFyYzY0IGlz
c3VlIHdpdGggY29tcGxldGVseSBzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlcwooc28gYWNjZXNzX29r
KCkgc2hvdWxkIGFsd2F5cyByZXR1cm4gdHJ1ZSBsaWtlIEFsIHBvaW50ZWQgb3V0KSwgdGhpcwps
b29rcyBleGNlbGxlbnQgdG8gbWUuCgpTb21lYm9keSBzaG91bGQgY2hlY2sgdGhhdCB0aGVyZSBh
cmVuJ3Qgb3RoZXIgY2FzZXMgbGlrZSBzcGFyYzY0LCBidXQKbGV0J3MgbWVyZ2UgdGhpcyBhc2Fw
IG90aGVyIHRoYW4gdGhhdC4KCiAgICAgICAgICAgICAgTGludXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

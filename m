Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF874C1CCD
	for <lists+openrisc@lfdr.de>; Wed, 23 Feb 2022 21:05:34 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B84182480A;
	Wed, 23 Feb 2022 21:05:33 +0100 (CET)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mail.librecores.org (Postfix) with ESMTPS id E399E2419E
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 21:05:32 +0100 (CET)
Received: by mail-ej1-f45.google.com with SMTP id a23so54589269eju.3
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 12:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
 b=F/2f/aEUKxSuzDdCknAbug+t8clrlE0v7gj9NkhphhHftuFg6XGIjvpJXVx+ZHKhn9
 jOIdz4l7lK+/F1JhXkxR/PARyehOhzu1/S93ijWQKe7fGKOKTiRs9R81aIq3OYNVOgnf
 G4UcKLBEtMgH8cssPIzV42vV3R64/Z0YRVhdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
 b=hqpxEsqwAWlg1WHHCEcfdy+pIC322xyh0TH6J99qSTIIpERKJVBvMLfJ/1yp0mFuir
 AnWay7JabIz1ri27oozJ5Wc483Ov/JmOp7nocdnZXlSpRqhvkiG+r8fERRrj4xfY3+X7
 0HKM0Y2Fw1KYc/+564gxLh/UUZNc0odwhnJyY13yhj2cQgIBUo4IYqqEo2oI1dpZpOWw
 q/7XQaQ5RFEBpaC4cuVt4PMr/kbeuqkv0DLOj6BB0walVqymtkL8+zwoj/0PzxqGqVMK
 VA4uLyISplv8Jhw/G/wlXjA44uaG5/idKjP8aQP0Z+vb5wrO3kWqWGPxvfHu4I6Y3Ien
 wWOQ==
X-Gm-Message-State: AOAM533rucgz3RGX20dtTfQCf/poCZvtlPUN0wIbQwMjo0UXtEm8ADxX
 PdzEsDGctejvcIbw2bBZJzyEnYa/7dEeTlyZxoo=
X-Google-Smtp-Source: ABdhPJxfo9wnhXkZO1lMeV9ygEvCy/ZaogM0eCrHYR4nBI6eANTgEaKPwcwvdq3AsLfnprWfHMH8NQ==
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr1014489ejb.285.1645646732260; 
 Wed, 23 Feb 2022 12:05:32 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id e18sm337312edj.85.2022.02.23.12.05.30
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:05:30 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id f17so16588459wrh.7
 for <openrisc@lists.librecores.org>; Wed, 23 Feb 2022 12:05:30 -0800 (PST)
X-Received: by 2002:a05:6512:130b:b0:443:c2eb:399d with SMTP id
 x11-20020a056512130b00b00443c2eb399dmr822016lfu.27.1645646720244; Wed, 23 Feb
 2022 12:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Feb 2022 12:05:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [OpenRISC] [PATCH v2 09/18] mips: use simpler access_ok()
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
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 linux-parisc <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMjEsIDIwMjIgYXQgNToyNSBBTSBUaG9tYXMgQm9nZW5kb2VyZmVyCjx0c2Jv
Z2VuZEBhbHBoYS5mcmFua2VuLmRlPiB3cm90ZToKPgo+IFdpdGggdGhpcyBwYXRjaApbIC4uIHNu
aXAgc25pcCAuLl0KPiBJIGF0IGxlYXN0IGdldCBteSBzaW1wbGUgdGVzdCBjYXNlcyBmaXhlZCwg
YnV0IEknbSBub3Qgc3VyZSB0aGlzIGlzCj4gY29ycmVjdC4KCkkgdGhpbmsgeW91IHJlYWxseSB3
YW50IHRvIGRvIHRoYXQgYW55d2F5LCBqdXN0IHRvIGdldCB0aGluZ3MgbGlrZQp3aWxkIGtlcm5l
bCBwb2ludGVycyByaWdodCAoaWUgdGhpbmsgZ2V0X2tlcm5lbF9ub2ZhdWx0KCkgYW5kIGZyaWVu
ZHMKZm9yIGZ0cmFjZSBldGMpLgoKVGhleSBzaG91bGRuJ3QgaGFwcGVuIGluIGFueSBub3JtYWwg
c2l0dWF0aW9uLCBidXQgdGhvc2Uga2luZHMgb2YKdW52ZXJpZmllZCBwb2ludGVycyBpcyB3aHkg
d2UgX2hhdmVfIGdldF9rZXJuZWxfbm9mYXVsdCgpIGluIHRoZSBmaXJzdApwbGFjZS4KCk9uIHg4
Ni02NCwgdGhlIHJvdWdobHkgZXF1aXZhbGVudCBzaXR1YXRpb24gaXMgdGhhdCBhZGRyZXNzZXMg
dGhhdAphcmVuJ3QgaW4gY2Fub25pY2FsIGZvcm1hdCBkbyBub3QgdGFrZSBhICNQRiAocGFnZSBm
YXVsdCksIHRoZXkgdGFrZSBhCiNHUCAoZ2VuZXJhbCBwcm90ZWN0aW9uKSBmYXVsdC4KClNvIEkg
dGhpbmsgeW91IHdhbnQgdG8gZG8gdGhhdCBmaXh1cF9leGNlcHRpb24oKSBmb3IgYW55IHBvc3Np
YmxlIGFkZHJlc3Nlcy4KCj4gSXMgdGhlcmUgYSByZWFzb24gdG8gbm90IGFsc28gI2RlZmluZSBU
QVNLX1NJWkVfTUFYICAgX19VQV9MSU1JVCBsaWtlCj4gZm9yIHRoZSAzMmJpdCBjYXNlID8KCkkg
d291bGQgc3VnZ2VzdCBhZ2FpbnN0IHVzaW5nIGEgbm9uLWNvbnN0YW50IFRBU0tfU0laRV9NQVgu
IEJlaW5nCmNvbnN0YW50IGlzIGxpdGVyYWxseSBvbmUgcmVhc29uIHdoeSBpdCBleGlzdHMsIHdo
ZW4gVEFTS19TSVpFIGl0c2VsZgpoYXMgb2Z0ZW4gYmVlbiBhYm91dCBvdGhlciB0aGluZ3MgKGll
ICIzMi1iaXQgcHJvY2VzcyIpLgoKSGF2aW5nIHRvIGxvYWQgdmFyaWFibGVzIGZvciB0aGluZ3Mg
bGlrZSBnZXRfdXNlcigpIGlzIGFubm95aW5nLCBpZgp5b3UgY291bGQgZG8gaXQgd2l0aCBhIHNp
bXBsZSBjb25zdGFudCBpbnN0ZWFkICh3aGVyZSB0aGF0ICJzaW1wbGUiCnBhcnQgaXMgdG8gYXZv
aWQgaGF2aW5nIHRvIGxvYWQgYmlnIHZhbHVlcyBmcm9tIGEgY29uc3RhbnQgcG9vbCAtCm9mdGVu
IGNvbnN0YW50cyBsaWtlICJoaWdoIGJpdCBzZXQiIGNhbiBiZSBsb2FkZWQgYW5kIGNvbXBhcmVk
IGFnYWluc3QKbW9yZSBlZmZpY2llbnRseSkuCgogICAgICAgICAgICAgICBMaW51cwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

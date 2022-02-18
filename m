Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 061BC4BB4A4
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 09:56:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B617124875;
	Fri, 18 Feb 2022 09:56:11 +0100 (CET)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mail.librecores.org (Postfix) with ESMTPS id 936C424848
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 09:56:09 +0100 (CET)
Received: by mail-ua1-f43.google.com with SMTP id g15so3936123uap.11
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 00:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acpcDWZvSxDwOAzGTb7O2RMIWdslBDMuoEt9Qz/Phu0=;
 b=4CreIE2Gch5sn0PvHOseU5bzo9nAe/QGbbKPScZzvGSgeL3q+TICVZ9sJnxLFXJQBm
 w0iIRtmykB1HuGUK1s5Hn4wEE+oSPf7JY9gZU4a55rXg08IqpIZgfzx2Sez5vKXrZUW+
 zq2RNv4vC3W89TcDqGASyrJgTavX5eEANLf62QGv/ytJmroM2v7Qpbamr4cQK7D4x2sP
 4KIAlK6hcPzSStIuerwhZqkPtR37UK0r2QzboOY2uq/squBG8tKlUtUkBuPaBcizFO1Y
 UH/fUDiXPxsZ+GkHUsRUFQ3kH2/cVvQJP+ZEoXvBb4xTeA3STPP1JYyS4knIA+b6KFP9
 IeVQ==
X-Gm-Message-State: AOAM533xDX6fFZYw7c46C2/ulvxObtNxiTGvNFJ4oK57bVb2buxKMmuU
 5IoMQeplDV3Vv5jlu/U2z+wctvEu963pQQ==
X-Google-Smtp-Source: ABdhPJz7+Y8af8BAffF04ow/9mM7++Ycv72Jho27wgTlKVBai/A8RpBYjMEx8HpNkZVc8wnNEA1LNA==
X-Received: by 2002:ab0:6596:0:b0:340:644b:1e68 with SMTP id
 v22-20020ab06596000000b00340644b1e68mr2488145uam.119.1645174568391; 
 Fri, 18 Feb 2022 00:56:08 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id s15sm6574883uao.17.2022.02.18.00.56.08
 for <openrisc@lists.librecores.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 00:56:08 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id n142so4464417vkf.5
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 00:56:08 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr2916488vsl.77.1645174557092; Fri, 18
 Feb 2022 00:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-9-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 09:55:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 08/18] uaccess: add generic __{get,
 put}_kernel_nofault
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
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
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMjoxNyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgo+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4KPiBO
aW5lIGFyY2hpdGVjdHVyZXMgYXJlIHN0aWxsIG1pc3NpbmcgX197Z2V0LHB1dH1fa2VybmVsX25v
ZmF1bHQ6Cj4gYWxwaGEsIGlhNjQsIG1pY3JvYmxhemUsIG5kczMyLCBuaW9zMiwgb3BlbnJpc2Ms
IHNoLCBzcGFyYzMyLCB4dGVuc2EuCj4KPiBBZGQgYSBnZW5lcmljIHZlcnNpb24gdGhhdCBsZXRz
IGV2ZXJ5dGhpbmcgdXNlIHRoZSBub3JtYWwKPiBjb3B5X3tmcm9tLHRvfV9rZXJuZWxfbm9mYXVs
dCgpIGNvZGUgYmFzZWQgb24gdGhlc2UsIHJlbW92aW5nIHRoZSBsYXN0Cj4gdXNlIG9mIGdldF9m
cygpL3NldF9mcygpIGZyb20gYXJjaGl0ZWN0dXJlLWluZGVwZW5kZW50IGNvZGUuCj4KPiBSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCj4gIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS91
YWNjZXNzLmggICAgIHwgICAyIC0KCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAg
ICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

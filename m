Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3774C4B9B92
	for <lists+openrisc@lfdr.de>; Thu, 17 Feb 2022 09:57:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EF06A205C5;
	Thu, 17 Feb 2022 09:57:36 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mail.librecores.org (Postfix) with ESMTPS id CE1CD247D9
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 09:55:51 +0100 (CET)
Received: from mail-lf1-f41.google.com ([209.85.167.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MAtoX-1nRWLG1Ryz-00BMgI for <openrisc@lists.librecores.org>; Thu, 17 Feb
 2022 09:55:51 +0100
Received: by mail-lf1-f41.google.com with SMTP id b9so8608062lfv.7
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 00:55:51 -0800 (PST)
X-Gm-Message-State: AOAM531wa3QV5Pf/QN7EycA7KY/ZxMD2H8oprmIe1SKka+LdbgxOIdOi
 zcik2yuNVj9UDefc+fObUt9i4/DznQxIDZ9xGgI=
X-Google-Smtp-Source: ABdhPJwQLFNR2EKsG8wmZOAHPh9E9pyoICR3LxZT862dIjr2W4W3Sw6yF+ayzR5i5e/QGR8IN4+3KhdYVHoGFF4fNyc=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr1268592wrm.317.1645084364936; Wed, 16
 Feb 2022 23:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 08:52:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
X-Provags-ID: V03:K1:lmj0MCZuHpnhvhOwxGkNvRWJvukaKekgNAXXbSr0ppCSNQNoBIk
 gxfdKl4p1ZUoHjNhIHpKMFUmGvlEeYsWC6RJhhKcYDuc9v2L6jDUjTbUihaaeeaudM7hIn9
 JTQ3UA2tvMfyBI6DN9tdPuanh05omRhdiOgVgyOG/nM0DmK3KFbbZ1E8hlhRta2m+G849xK
 SjVQs59R1DRYI+/46p9OQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nKoVFiZ/VFU=:E/qvHX/OOgUjkTkhykymPw
 s9jpo4GzkccbrX6VI9aV0T0PbfIxbbCwKpcKV/m5rsb91/9M+K4NjcMBWLBed3Z5WJMASZLHs
 FowuudjlKY1+6mPbu6b87QC9CQQkhZL7C+5jl7/ufjDaHeG6nobBdukFEPzCLm3rdP10285PJ
 kPAu0cgp6J2HLuAXiDtjHV5m/N+8aX1RbkFI9aTTaEkYP2j44m8UCNQ8Nk4y3oaRcq3PB3Oec
 6SczLlZHjHczuj6DjieA2xye9CxUT1hQdbbTE5e64/bp3VkIiEg9KDA705+UxSSUSQlY6/xNw
 Mv8cxO1OL7BQMf2IeW64aRGS+G9Ybx75s42CGlB986n2JUjyKqg9H+aAGhIb53JsiEhmz4d61
 T94iK2X9psEXl+q3+nBnnf8fzqjZMBav3oPTDXnsybVjswnsGrBJ41b+xcjiFG3s/y9Ay+5g/
 xPE5xFtl2xSIWsDxDRd3GMcrJW8pG5QM14G3+/B5FOiGikmXpWC0t93KvPuFkH7Yrn7DvX17A
 jK1s/dnOpDCkrcKsyFrV7ONTc1Zt4egFVe+102s2iAcr0/0cRDwW9xAul7+K3Fh7tBBnh91Ny
 03D1xSkGHzr5KdsHheejREWw3EWlHqs8jmM7BVqYqMZ8VqABTa7npBZOrkn2BxXqsLmtQ+VWV
 Fh+goG8Rl4r4NcnTxDGs7HrtUibA0kfNaxuVWAfLrt0/bCvvuoC9in3mQCHBFz3O+BvF1+aSG
 YfxG4oqb/plrKvi/q3Jw/2qcyptrTOoL69lMgwVtCcQhzk0GB63TCdFID+7J29G9RVnGf+Aub
 nfnZDKjcNOQb/njQLIi5NlzO8iga6vIcShj8lOt6CoWRn3TCgM=
X-Mailman-Approved-At: Thu, 17 Feb 2022 09:57:35 +0100
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
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTYsIDIwMjIgYXQgMjoxMyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiArICogbGltaXQgYW5kIGNhdGNoIGFsbCBwb3NzaWJsZSBvdmVyZmxv
d3MuCj4gKyAqIE9uIGFyY2hpdGVjdHVyZXMgd2l0aCBzZXBhcmF0ZSB1c2VyIGFkZHJlc3Mgc3Bh
Y2UgKG02OGssIHMzOTAsIHBhcmlzYywKPiArICogc3BhcmM2NCkgb3IgdGhvc2Ugd2l0aG91dCBh
biBNTVUsIHRoaXMgc2hvdWxkIGFsd2F5cyByZXR1cm4gdHJ1ZS4KLi4uCj4gK3N0YXRpYyBpbmxp
bmUgaW50IF9fYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICpwdHIsIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBsaW1pdCA9IHVzZXJfYWRkcl9tYXgo
KTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKXB0cjsKPiAr
Cj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQUxURVJOQVRFX1VTRVJfQUREUkVTU19T
UEFDRSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwoKSSBub3RpY2VkIHRoYXQgSSdt
IG1pc3NpbmcgdGhlIGNoZWNrIGZvciAhQ09ORklHX01NVSBoZXJlLCBkZXNwaXRlCm1lbnRpb25p
bmcgdGhhdCBpbiB0aGUgY29tbWVudCBhYm92ZSBpdC4gSSd2ZSBhZGRlZCBpdCBub3cuCgogICAg
ICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

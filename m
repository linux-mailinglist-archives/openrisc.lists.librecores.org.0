Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CEC8B4B9BDF
	for <lists+openrisc@lfdr.de>; Thu, 17 Feb 2022 10:19:05 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 88B2624823;
	Thu, 17 Feb 2022 10:19:05 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mail.librecores.org (Postfix) with ESMTPS id 085E324823
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 10:19:04 +0100 (CET)
Received: from mail-wm1-f52.google.com ([209.85.128.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQPVR-1ngx3G0JbF-00MJwq for <openrisc@lists.librecores.org>; Thu, 17 Feb
 2022 10:19:03 +0100
Received: by mail-wm1-f52.google.com with SMTP id w13so2262432wmi.2
 for <openrisc@lists.librecores.org>; Thu, 17 Feb 2022 01:19:02 -0800 (PST)
X-Gm-Message-State: AOAM532sWzbN/fp7PcVjJgOy49IKwFRuaowXTqpjGQr7wrkOgZwHNBTO
 FF5Kz6t/RGsK2rTopeM8lc1yd4uAp5HqMLi4Qho=
X-Google-Smtp-Source: ABdhPJwu2NVHGHLxx29UDj0eC2QtTDz9ABoGgqvKd5FtPXFo3D/c1j3IHxwDsslquGRbQQhg+y3kZFZQ6qJy+rJ75Go=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr4990966wms.82.1645085639420; Thu, 17
 Feb 2022 00:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 09:13:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
X-Provags-ID: V03:K1:DVqEb0ZmMD6nAAIH36gtLjnZ4vqx5Uk2RoxoqZXYFzD4Np7ej81
 tLK6HyrGPLLoYU28XtB7aDkjHjYe/FHM2TCKy++kEak1uQNFp1Qhe3EPJbYAh/OxrQXl6gY
 cApdUPQMQ2UbsRVWXS/qjL3sXxGozWWBRnaSuqHYWWe1aR095n9GxfAEzTUKke5hUJEtFd6
 sXxfSUKrXMX8GbyjUvcxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i5PExFnxqJk=:5esueYOEsHW+UGaB8b2s+t
 sMWWgOYBDS9KsdudP9XLRDgRJSIby89OlqxKCLkJuNcsdjwsx3xMGVRKHT2ORsI03BhjrJQFw
 xuyrngXxMDHU//uWzK7MSqh5DfJP4CejDSxPDD8oTYUUmgGUAYUodRNIJDX3SA8E18S3jcTyI
 aqtOBcxFPRLdzcnmyBTXzBT98BUOYSQTUXJ6hiS4CQScU0PYrKQn62Elo3L2LkFMthXvjSmmC
 NFkYF3DKYqxPaEX2faMSQ3cVZx1Pc29OaKMypjKVncoyZ6uTTr8B1OLv6VQ9Xm5Tf8SBxG2jH
 nkRpK5AmrNwXVFdLXIxuMf2InZgO5tItQWkv1qYPqKV8w3YLI/fN0p5nLjf2gDDLnRTJhJL92
 N5y5mpZ1arVF9ti+iKy9LJpn6/MBBlFMTW6m6E73Hp+Wbp9ztT3aojyVPZctw3VOBC9PrC5kh
 A766EItB0mj57GNiK3Po+TmEkTVuX+k2V9woD6AACgcVA14lUgin8CXhObPVGEtCpLRxBwXK3
 gCPohqgaexm3jOyg4AWA+KUqaRcVjsYaSC9Bt9tY1xklb8IyWfo69Iklh79B1CvMZ7lIpN9fN
 Ey75D8lXASQptwwbUla2Zp6VvyhJV89M/POCVzZUSXbCaNE31YbdpktDf88noNcfOiSuw/V/1
 rXeZ6bD+SgNUye10pBhP1zRPAw01ShEpD8VGZ1gQDxQSe7HbyO3v2T2+UeYvAJEFhAeFTL0ux
 hYYpG14wK/la6x80nVG7sAUugvCdqvvRT54+dTzPSPznoEnOhvOEpEIpuxFrsh2q0SH+wNQ9B
 bz+hmA5Erjo+5M5DkuQIpntMWh0fjVbqAB7B+oyzgDuBzufVnA=
Subject: Re: [OpenRISC] [PATCH v2 00/18] clean up asm/uaccess.h,
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
bC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+
IENocmlzdG9waCBIZWxsd2lnIGFuZCBhIGZldyBvdGhlcnMgc3BlbnQgYSBodWdlIGVmZm9ydCBv
biByZW1vdmluZwo+IHNldF9mcygpIGZyb20gbW9zdCBvZiB0aGUgaW1wb3J0YW50IGFyY2hpdGVj
dHVyZXMsIGJ1dCBhYm91dCBoYWxmIHRoZQo+IG90aGVyIGFyY2hpdGVjdHVyZXMgd2VyZSBuZXZl
ciBjb21wbGV0ZWQgZXZlbiB0aG91Z2ggbW9zdCBvZiB0aGVtIGRvbid0Cj4gYWN0dWFsbHkgdXNl
IHNldF9mcygpIGF0IGFsbC4KPgo+IEkgZGlkIGEgcGF0Y2ggZm9yIG1pY3JvYmxhemUgYXQgc29t
ZSBwb2ludCwgd2hpY2ggdHVybmVkIG91dCB0byBiZSBmYWlybHkKPiBnZW5lcmljLCBhbmQgbm93
IHBvcnRlZCBpdCB0byBtb3N0IG90aGVyIGFyY2hpdGVjdHVyZXMsIHVzaW5nIG5ldyBnZW5lcmlj
Cj4gaW1wbGVtZW50YXRpb25zIG9mIGFjY2Vzc19vaygpIGFuZCBfX3tnZXQscHV0fV9rZXJuZWxf
bm9jaGVjaygpLgo+Cj4gVGhyZWUgYXJjaGl0ZWN0dXJlcyAoc3BhcmM2NCwgaWE2NCwgYW5kIHNo
KSBuZWVkZWQgc29tZSBleHRyYSB3b3JrLAo+IHdoaWNoIEkgYWxzbyBjb21wbGV0ZWQuCj4KPiBU
aGUgZmluYWwgc2VyaWVzIGNvbnRhaW5zIGV4dHJhIGNsZWFudXAgY2hhbmdlcyB0aGF0IHRvdWNo
IGFsbAo+IGFyY2hpdGVjdHVyZXMuIFBsZWFzZSByZXZpZXcgYW5kIHRlc3QgdGhlc2UsIHNvIHdl
IGNhbiBtZXJnZSB0aGVtCj4gZm9yIHY1LjE4Lgo+Cj4gVGhlIHNlcmllcyBpcyBhdmFpbGFibGUg
YXQKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hcm5k
L3BsYXlncm91bmQuZ2l0L2xvZy8/aD1zZXRfZnMtMgo+IGZvciB0ZXN0aW5nLgoKSSd2ZSBhZGRl
ZCB0aGUgdXBkYXRlZCBjb250ZW50cyB0byBteSBhc20tZ2VuZXJpYyB0cmVlIG5vdyB0byBwdXQg
dGhlbQppbnRvIGxpbnV4LW5leHQuCgogICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

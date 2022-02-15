Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 537B04B6933
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 11:25:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0369D24825;
	Tue, 15 Feb 2022 11:25:52 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 32A7424823
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 11:25:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2AB4B8180A;
 Tue, 15 Feb 2022 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87FEC340EB;
 Tue, 15 Feb 2022 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644920748;
 bh=ff3JsyoyvYlhG8jzgNCTPV8IRM6/qaYw6mQrNFy9F74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Idtvq2yMUPVIjRWGD6CbxsSP8vfjonXBjhqjw0KPeSxq9WG+eJI9q3VMhGdj4sPiw
 td4MlzEZussptBdaheJ5yjhE4vnfocIKiMf6Eye4k3uvvU7zndbY9d/28Z7fJPAVjQ
 V+ay13tyZYzyUl7pHGRP2ddUQDwCe4rTDO0IODfo=
Date: Tue, 15 Feb 2022 11:25:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Ygt/qMduFQIjWqfU@kroah.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org>
 <YgqK1ihlJvRFHJ9h@infradead.org>
 <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
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
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
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

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTA6MTg6MTVBTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCA2OjAxIFBNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBGZWIgMTQsIDIwMjIg
YXQgMDU6MzQ6NDFQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4gRnJvbTogQXJu
ZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiA+ID4KPiA+ID4gVGhlIGdldF91c2VyKCkvcHV0
X3VzZXIoKSBmdW5jdGlvbnMgYXJlIG1lYW50IHRvIGNoZWNrIGZvcgo+ID4gPiBhY2Nlc3Nfb2so
KSwgd2hpbGUgdGhlIF9fZ2V0X3VzZXIoKS9fX3B1dF91c2VyKCkgZnVuY3Rpb25zCj4gPiA+IGRv
bid0Lgo+ID4gPgo+ID4gPiBUaGlzIGJyb2tlIGluIDQuMTkgZm9yIG5kczMyLCB3aGVuIGl0IGdh
aW5lZCBhbiBleHRyYW5lb3VzCj4gPiA+IGNoZWNrIGluIF9fZ2V0X3VzZXIoKSwgYnV0IGxvc3Qg
dGhlIGNoZWNrIGl0IG5lZWRzIGluCj4gPiA+IF9fcHV0X3VzZXIoKS4KPiA+Cj4gPiBDYW4gd2Ug
Zm9sbG93IHRoZSBsZWFkIG9mIE1JUFMgKHdoaWNoIHRoaXMgd2FzIG9yaWdpbmFsbHkgY29waWVk
Cj4gPiBmcm9tIEkgdGhpbmspIGFuZCBraWxsIHRoZSBwb2ludGxlc3MgX19nZXQvcHV0X3VzZXJf
Y2hlY2sgd3JhcHBlcgo+ID4gdGhhdCBqdXN0IG9ic2Z1Y2F0ZSB0aGUgY29kZT8KPiAKPiBJIGhh
ZCBhbm90aGVyIGxvb2ssIGJ1dCBJIHRoaW5rIHRoYXQgd291bGQgYmUgYSBiaWdnZXIgY2hhbmdl
IHRoYW4KPiBJIHdhbnQgdG8gaGF2ZSBpbiBhIGZpeCBmb3Igc3RhYmxlIGJhY2twb3J0cywgYXMg
bmRzMzIgYWxzbyB1c2VzCj4gdGhlIF9jaGVjayB2ZXJzaW9ucyBpbiBfX3tnZXQscHV0fV91c2Vy
X2Vycm9yLgoKRG9uJ3Qgd29ycnkgYWJvdXQgc3RhYmxlIGJhY2twb3J0cyBmaXJzdCwgZ2V0IGl0
IGNvcnJlY3QgYW5kIG1lcmdlZCBhbmQKdGhlbiB3b3JyeSBhYm91dCB0aGVtIGlmIHlvdSByZWFs
bHkgaGF2ZSB0by4KCklmIHNvbWVvbmUgY2FyZXMgYWJvdXQgbmRzMzIgZm9yIHN0YWJsZSBrZXJu
ZWxzLCB0aGV5IGNhbiBkbyB0aGUKYmFja3BvcnQgd29yayA6KQoKdGhhbmtzLAoKZ3JlZyBrLWgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

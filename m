Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9874B5A96
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 20:40:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C753C24801;
	Mon, 14 Feb 2022 20:40:27 +0100 (CET)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by mail.librecores.org (Postfix) with ESMTPS id 10174240F6
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 20:40:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 915CAB81675
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7542C36AE3
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644867624;
 bh=5szbHF9etsKpvbwWwwc9H/Y1QakuvzjKYGUIBcYFA80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e8SkA3FlLGu70hI/WgHcE1Xcld6ahEqgd/8aP3tnN+Ui+6c+MZmJxArGum1LdtmAc
 TVm8LqkWXJbpel0WqJluZlN0q2Rc8pObOFXCjWsE1d3haVSN1sOjQ5hKRVHWsZ71lN
 9Hnj9zqBHSBBx6qUNlA6sc7rmD8pMbOGHJ9SDDCXuRY9FNQ7binWt4bsfA/Yof8Egb
 Ksm8rfkNmn9T9/rsBeFI1yBap4xnb6nVmSKUusmotl5Q02Llm+mwF8WcKWget2RALt
 X3B6AavEfyIeX6XUTomqUIV78jVQAYplU/28sKTs9My6dabsF705ywSdaO+p8h0D4l
 JZS2fHyItMkuQ==
Received: by mail-wm1-f50.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so94724wmq.3
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 11:40:24 -0800 (PST)
X-Gm-Message-State: AOAM5306H2s+sOUkGEv3UldwMzb/fLgZdSmGPU2udUfdPL79x/d1iAvB
 8ApwJduGLI9we4CdSUJbKScvn+JsZTXiHiEHh6Y=
X-Google-Smtp-Source: ABdhPJzTYqCeBLA8ZZTCXfIkkUBrupnk+RLzKXVQdywxm2I/SfNIqW0R0tvlKvR6EMssd+gXW/CMf7zH4TFa2LGJB14=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr252362wms.82.1644867623104; Mon, 14 Feb
 2022 11:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-11-arnd@kernel.org>
 <YgqL/NJ3YHEAhj4i@infradead.org>
In-Reply-To: <YgqL/NJ3YHEAhj4i@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:40:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3eOw=QpxWFnODE61EFt8oGPJ7dcusfbPSD1vdEsUmekQ@mail.gmail.com>
Message-ID: <CAK8P3a3eOw=QpxWFnODE61EFt8oGPJ7dcusfbPSD1vdEsUmekQ@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [OpenRISC] [PATCH 10/14] uaccess: remove most CONFIG_SET_FS
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
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
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
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgNjowNiBQTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDhQ
TSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+Cj4gPgo+ID4gT24gYWxtb3N0IGFsbCBhcmNoaXRlY3R1cmVzLCB0aGVyZSBh
cmUgbm8gcmVtYWluaW5nIGNhbGxlcnMKPiA+IG9mIHNldF9mcygpLCBzbyBDT05GSUdfU0VUX0ZT
IGNhbiBiZSBkaXNhYmxlZCwgYWxvbmcgd2l0aAo+ID4gcmVtb3ZpbmcgdGhlIHRocmVhZF9pbmZv
IGZpZWxkIGFuZCBhbnkgcmVmZXJlbmNlcyB0byBpdC4KPiA+Cj4gPiBUaGlzIHR1cm5zIGFjY2Vz
c19vaygpIGludG8gYSBjaGVhcGVyIGNoZWNrIGFnYWluc3QgVEFTS19TSVpFX01BWC4KPgo+IFdv
dWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBqdXN0IG1lcmdlIHRoaXMgaW50byB0aGUgbGFz
dCBwYXRjaD8KClllcywgc291bmRzIGdvb2QuIEkgd2Fzbid0IHN1cmUgYXQgZmlyc3QgaWYgdGhl
cmUgaXMgZW5vdWdoIGJ1eS1pbiB0byBnZXQKYWxsIGFyY2hpdGVjdHVyZXMgY2xlYW5lZCB1cCwg
YW5kIEkgaGFkbid0IGRvbmUgdGhlIGlhNjQgcGF0Y2gsIHNvIGl0CnNlZW1lZCBtb3JlIGltcG9y
dGFudCB0byBkbyB0aGlzIHBhcnQgZWFybHksIGJ1dCBub3cgaXQgc2VlbXMgdGhhdCBpdAp3aWxs
IGFsbCBnbyBpbiBhdCB0aGUgc2FtZSB0aW1lLCBzbyBkb2luZyB0aGlzIGFzIHBhcnQgb2YgYSBi
aWcgcmVtb3ZhbAphdCB0aGUgZW5kIG1ha2VzIHNlbnNlLgoKICAgICAgICBBcm5kCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EC8EAF741D
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C6451207BE;
	Mon, 11 Nov 2019 13:37:46 +0100 (CET)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by mail.librecores.org (Postfix) with ESMTPS id 363052078A
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 11:10:26 +0100 (CET)
Received: from mail-qt1-f180.google.com ([209.85.160.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MplLZ-1i6pWm2lbR-00qBWV for <openrisc@lists.librecores.org>; Mon, 11 Nov
 2019 11:10:25 +0100
Received: by mail-qt1-f180.google.com with SMTP id p20so15071706qtq.5
 for <openrisc@lists.librecores.org>; Mon, 11 Nov 2019 02:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAXmmGaj6W7XpxoCvQld4HnVDQXjFMK+vAxDKCuDkBx0DOvzeaZF
 1vn4UDWTcAcHobBvoJeshDNv84OAxzs5Ic7LMZs=
X-Google-Smtp-Source: APXvYqyqP0GEnKlLDcc3YXGxYPpIsc43oy+/l9orRIfJHYpq8HDGEADC0l7WhZk0kMzg516CeAScWIBjk4MnQDDCwV4=
X-Received: by 2002:ac8:1908:: with SMTP id t8mr24584774qtj.18.1573467024165; 
 Mon, 11 Nov 2019 02:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de>
 <20191029064834.23438-13-hch@lst.de>
In-Reply-To: <20191029064834.23438-13-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Nov 2019 11:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:fy5eAt5tw07LjH1cElcQQ9ZxdBYZ/MyLLPoLIp5cSRAtKcrCt84
 pBrruXGEJZ/MVPWIaB3G+0Oo9eut6TCqhfZ6b63lr5RNZxp496Q343UE9BJN9RaSqr2XDLK
 CzO5+/jYTy88J+su7eJZELFwY301cyuPuJGR7RPglY61NNmQPam4i986oWEKxXhFvoDTD0y
 K80SJ2NQA8FTC19xdRjYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JQAHczavFD0=:7f2VtbEB3DftI2fPCX5CbA
 FmGkjiqy8MFxE/WOlZu7r9l/56nsXXQztTFEk8T7xCFnAeQjATF3z3SCG/xvHm16IMbkWbz4d
 TZ029mewYycCFcVryVWBEmlrSBLTkvUVBP1+2j3+E4cCcPSJDUZBHgI4txZB1CtZmOMciJOan
 tjELxyvRe0GsyBec8xzBFwcxMe8Bq7HtTRNy7rrSiJg5UUo3gp/kdAxe94qvDlaFrs3fnUGMc
 Pb/lCGlJ2ds9VYf7gx02pyXCnoPITuLdK9KA+d5hCdf/ICUSdr/v3uGrs9rE2oEqspnTWkgZe
 qsqRHs81N2bER9SBt34W67ajvWifH760/TmmwrQmzPo3alKm6xg69hOq8HU5lTvIPdze0mWjS
 NKD2y2qpZ58mRyYJ5o/TzvyXYax3LparNUi29cMW4Pna67ra6Ldmorxku26LhYOqIyZjmuRLT
 9fchQuFOAnguqQZEJWDv+kPXnXdql58OnMAJ+hVUcH8IyUZH27+Iu1SPnEML9Acg6BHKrbb6+
 rUAlG0Irk7Owd/SlNv9QMTgd2v/U6cySVtsOoxANZI44ZZQSgiMdPFJ7BZsgpsthZ9wj3Y0Xh
 LKf5QKrd64mUHC6UUVCyckqKTQyLjq/rPCg2BhAtQky9attavW7GQPf+6usbRBuLDuzwtjYK8
 hcF0+6EMZgdi7eQWNMnPX+yDHBm41uYaDMVJMmMS/LUZ5Fvv62o8g0cJl/xlg8ydVZYqTwc6Z
 mr4B2J/AWMPQt5BOs+zLjFmFvY3BBCb04nf7aBdzsx67ohZxCH2ZLFX4dsoWBgwwF/GXRGb66
 v9E21+Fjnkv5E776ZJfspcCYv/Ou9xHTk2Qnwubyy4p4skKIe5WB2PE6VBZ7Gm0gPdKJ5sAuv
 Sy/iQ5JYqgJNeY9TgK3w==
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 12/21] arch: rely on asm-generic/io.h for
 default ioremap_* definitions
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgNzo0OSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBWYXJpb3VzIGFyY2hpdGVjdHVyZXMgdGhhdCB1c2UgYXNtLWdlbmVy
aWMvaW8uaCBzdGlsbCBkZWZpbmVkIHRoZWlyCj4gb3duIGRlZmF1bHQgdmVyc2lvbnMgb2YgaW9y
ZW1hcF9ub2NhY2hlLCBpb3JlbWFwX3d0IGFuZCBpb3JlbWFwX3djCj4gdGhhdCBwb2ludCBiYWNr
IHRvIHBsYWluIGlvcmVtYXAgZGlyZWN0bHkgb3IgaW5kaXJlY3RseS4gIFJlbW92ZSB0aGVzZQo+
IGRlZmluaXRpb25zIGFuZCByZWx5IG9uIGFzbS1nZW5lcmljL2lvLmggaW5zdGVhZC4gIEZvciB0
aGlzIHRvIHdvcmsKPiB0aGUgYmFja3VwIGlvcmVtYXBfKiBkZWZpbnRpb25zIG5lZWRzIHRvIGJl
IGNoYW5nZWQgdG8gcHVyZWx5IGNwcAo+IG1hY3JvcyBpbnN0ZWEgb2YgaW5saW5lcyB0byBjb3Zl
ciBmb3IgYXJjaGl0ZWN0dXJlcyBsaWtlIG9wZW5yaXNjCj4gdGhhdCBvbmx5IGRlZmluZSBpb3Jl
bWFwIGFmdGVyIGluY2x1ZGluZyA8YXNtLWdlbmVyaWMvaW8uaD4uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jl
cy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

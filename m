Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFF01D1FFD
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id ACB8620AD9;
	Wed, 13 May 2020 22:17:36 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id ECEBA2088E
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 18:35:06 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 796BC68BEB; Mon, 11 May 2020 18:35:04 +0200 (CEST)
Date: Mon, 11 May 2020 18:35:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200511163503.GA32228@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
 <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
 <20200511151356.GB28634@lst.de>
 <CAMuHMdU1xAmyWysi5xRoaRL7PFurPncvEL0CcEY0V_sUz3EJPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU1xAmyWysi5xRoaRL7PFurPncvEL0CcEY0V_sUz3EJPw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] sort out the flush_icache_range mess
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDU6MjU6NDVQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+ID4gRG8geW91IHdhbnQgdG8gZHJvcCB0aGU6Cj4gPgo+ID4gICAgIHNlbGVj
dCBIQVZFX0FPVVQgaWYgTU1VCj4gPgo+ID4gZm9yIG02OGsgdGhlbj8KPiAKPiBJZiB0aGF0IGhl
bHBzIHRvIHJlZHVjZSBtYWludGVuYW5jZSwgaXQncyBmaW5lIGZvciBtZS4KPiBUaGF0IGxlYXZl
cyBhbHBoYSBhcyB0aGUgc29sZSB1c2VyPwoKWWVzLiAgQW5kIGZvciBhbHBoYSBpdCBpc24ndCBj
bGFzc2ljIExpbnV4IGEub3V0LCBidXQgdGhlIE9TRi8xIEVDT0ZGCmZvcm1hdCwgd2hpY2ggbWln
aHQgbGVhZCB0byBmdXJ0aGVyIGNsZWFudXBzIGV2ZW50dWFsbHkuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==

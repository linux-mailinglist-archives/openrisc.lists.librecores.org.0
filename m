Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 100331D1FF8
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1029020B62;
	Wed, 13 May 2020 22:17:35 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id A8E35202E0
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 17:13:58 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B6F0368BFE; Mon, 11 May 2020 17:13:56 +0200 (CEST)
Date: Mon, 11 May 2020 17:13:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200511151356.GB28634@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
 <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXazsBw0mjJd0uFHQud7qbb5-Uw-PTDB3+-M=huRWOfgQ@mail.gmail.com>
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

T24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDk6NDY6MTdBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIENocmlzdG9waCwKPiAKPiBPbiBTdW4sIE1heSAxMCwgMjAyMCBhdCA5
OjU1IEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+IG5vbmUgb2Yg
d2hpY2ggcmVhbGx5IGFyZSB1c2VkIGJ5IGEgdHlwaWNhbCBNTVUgZW5hYmxlZCBrZXJuZWwsIGFz
IGEub3V0IGNhbgo+ID4gb25seSBiZSBidWlsZCBmb3IgYWxwaGEgYW5kIG02OGsgdG8gc3RhcnQg
d2l0aC4KPiAKPiBRdW90aW5nIG15c2VsZjoKPiAiSSB0aGluayBpdCdzIHNhZmUgdG8gYXNzdW1l
IG5vIG9uZSBzdGlsbCBydW5zIGEub3V0IGJpbmFyaWVzIG9uIG02OGsuIgo+IGh0dHA6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci9DQU11SE1kVyttMFErajNyc1FkTVhuckVQbStYQjVZMkFRcnhXNXNEMW1a
QUtnbUVxb0FAbWFpbC5nbWFpbC5jb20KCkRvIHlvdSB3YW50IHRvIGRyb3AgdGhlOgoKICAgIHNl
bGVjdCBIQVZFX0FPVVQgaWYgTU1VCgpmb3IgbTY4ayB0aGVuPwoKTm90ZSB0aGF0IHdlJ2xsIHN0
aWxsIG5lZWQgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZm9yIG02OGsgd2l0aCBtbXUsCmFzIGl0
IGFsc28gYWxsb3dzIGJpbmZtdF9mbGF0IGZvciBtbXUgY29uZmlncy4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK

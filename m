Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A7FFC1D1FF7
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CD87920B5C;
	Wed, 13 May 2020 22:17:34 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 4EAA420594
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 17:11:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2865568BFE; Mon, 11 May 2020 17:11:21 +0200 (CEST)
Date: Mon, 11 May 2020 17:11:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200511151120.GA28634@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-32-hch@lst.de>
 <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_OxNoKfO=i903kx0mgk0-i2h4u2ase3m9_dn6oFh_5g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 31/31] module: move the set_fs hack for
 flush_icache_range to m68k
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

T24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDk6NDA6MzlBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIFN1biwgTWF5IDEwLCAyMDIwIGF0IDk6NTcgQU0gQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4KPiA+IGZsdXNoX2ljYWNoZV9yYW5nZSBnZW5l
cmFsbHkgb3BlcmF0ZXMgb24ga2VybmVsIGFkZHJlc3NlcywgYnV0IGZvciBzb21lCj4gPiByZWFz
b24gbTY4ayBuZWVkZWQgYSBzZXRfZnMgb3ZlcnJpZGUuICBNb3ZlIHRoYXQgaW50byB0aGUgbTY4
ayBjb2RlCj4gPiBpbnN0ZWQgb2Yga2VlcGluZyBpdCBpbiB0aGUgbW9kdWxlIGxvYWRlci4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAKPiBS
ZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBB
Y2tlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KCkJ0dywg
ZG8geW91IGtub3cgd2hhdCBwYXJ0IG9mIGZsdXNoX2ljYWNoZV9yYW5nZSByZWxpZWQgb24gc2V0
X2ZzPwpEbyBhbnkgb2YgdGhlIG02OGsgbWFpbnRhaW5lcnMgaGF2ZSBhbiBpZGVhIGhvdyB0byBo
YW5kbGUgdGhhdCBpbgphIG5pY2VyIHdheSB3aGVuIHdlIGNhbiBzcGxpdCB0aGUgaW1wbGVtZW50
YXRpb25zPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

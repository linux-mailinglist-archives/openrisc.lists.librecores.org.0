Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 17C2C1D2017
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C29A020B84;
	Wed, 13 May 2020 22:17:55 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 36DC520409
 for <openrisc@lists.librecores.org>; Wed, 13 May 2020 08:23:21 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E27C468C65; Wed, 13 May 2020 08:23:18 +0200 (CEST)
Date: Wed, 13 May 2020 08:23:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Message-ID: <20200513062318.GA24133@lst.de>
References: <20200510075510.987823-20-hch@lst.de>
 <mhng-8adbedbc-0f91-4291-9471-2df5eb7b802b@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8adbedbc-0f91-4291-9471-2df5eb7b802b@palmerdabbelt-glaptop1>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 19/31] riscv: use asm-generic/cacheflush.h
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, jeyu@kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMTIsIDIwMjAgYXQgMDQ6MDA6MjZQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2ds
ZS5jb20+Cj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5j
b20+Cj4KPiBXZXJlIHlvdSB0cnlpbmcgdG8gZ2V0IHRoZXNlIGFsbCBpbiBhdCBvbmNlLCBvciBk
byB5b3Ugd2FudCBtZSB0byB0YWtlIGl0IGludG8KPiBteSB0cmVlPwoKRXhjZXB0IGZvciB0aGUg
c21hbGwgZml4dXBzIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIHNlcmllcyB0aGlzIG5lZWRzCnRv
IGdvIGluIHRvZ2V0aGVyLiAgSSdsbCBoYXZlIHRvIGRvIGF0IGxlYXN0IGFub3RoZXIgcmVzZW5k
LCBhbmQgYWZ0ZXIKdGhhdCBJIGhvcGUgQW5kcmV3IGlzIGdvaW5nIHRvIHBpY2sgaXQgdXAuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

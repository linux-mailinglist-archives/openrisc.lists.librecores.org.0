Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 88F511D1FF9
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 41B0E20B64;
	Wed, 13 May 2020 22:17:35 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 7CE4720717
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 17:15:36 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 919CD68BFE; Mon, 11 May 2020 17:15:35 +0200 (CEST)
Date: Mon, 11 May 2020 17:15:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <20200511151535.GC28634@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-3-hch@lst.de>
 <20200511075115.GA16134@willie-the-truck> <20200511110014.GA19176@gaia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511110014.GA19176@gaia>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 02/31] arm64: fix the flush_icache_range
 arguments in machine_kexec
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Roman Zippel <zippel@linux-m68k.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Jessica Yu <jeyu@kernel.org>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, james.morse@arm.com, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMTI6MDA6MTRQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IEFueXdheSwgSSB0aGluayBDaHJpc3RvcGgncyBwYXRjaCBuZWVkcyB0byBnbyBp
biB3aXRoIGEgZml4ZXMgdGFnOgo+IAo+IEZpeGVzOiBkMjhmNmRmMTMwNWEgKCJhcm02NC9rZXhl
YzogQWRkIGNvcmUga2V4ZWMgc3VwcG9ydCIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
PiAjIDQuOC54LQo+IAo+IGFuZCB3ZSdsbCBjaGFuZ2UgdGhlc2UgZnVuY3Rpb25zL2hlbHBlcnMg
Z29pbmcgZm9yd2FyZCBmb3IgYXJtNjQuCj4gCj4gSGFwcHkgdG8gcGljayB0aGlzIHVwIHZpYSB0
aGUgYXJtNjQgZm9yLW5leHQvZml4ZXMgYnJhbmNoLgoKUGxlYXNlIGRvLCB0aGVyZSBhcmUgbm8g
ZGVwZW5kZW5jaWVzIG9uIGl0IGluIHRoaXMgc2VyaWVzIChJIG9yaWdpbmFsbHkKcGxhbm5lZCB0
byBzd2l0Y2ggZmx1c2hfaWNhY2hlX3JhbmdlIHRvIHBhc3MgYSBrZXJuZWwgcG9pbnRlciArIGxl
bgppbnN0ZWFkIG9mIHRoZSBzdHJhbmdlIHVuc2lnbmVkIGxvbmcgc3RhcnQgYW5kIGVuZC4gIFRo
YXQgc3RpbGwgbG9va3MKdmVyeSB1c2VmdWwsIGJ1dCB0aGUgc2VyaWVzIGFscmVhZHkgaXMgd2F5
IHRvbyBsYXJnZSwgc28gSSdtIGdvaW5nIHRvCmRlZmVyIHRoYXQgY2hhbmdlIGZvciBhbm90aGVy
IG1lcmdlIHdpbmRvdykuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

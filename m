Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 46D284B9073
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 19:41:15 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D219B24841;
	Wed, 16 Feb 2022 19:41:14 +0100 (CET)
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by mail.librecores.org (Postfix) with ESMTPS id 196032483D
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 19:41:14 +0100 (CET)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0f791715-8f58-11ec-b2df-0050568cd888;
 Wed, 16 Feb 2022 18:41:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B2BEB194B1C;
 Wed, 16 Feb 2022 19:41:12 +0100 (CET)
Date: Wed, 16 Feb 2022 19:41:09 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Yg1FRZcrhlh5C//V@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-16-arnd@kernel.org>
 <Yg1D08+olCSGmnYU@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yg1D08+olCSGmnYU@ravnborg.org>
Subject: Re: [OpenRISC] [PATCH v2 15/18] sparc64: remove CONFIG_SET_FS
 support
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 will@kernel.org, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, ardb@kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 viro@zeniv.linux.org.uk, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net,
 green.hu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgQXJuZCwKCk9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDA3OjM0OjU5UE0gKzAxMDAsIFNhbSBS
YXZuYm9yZyB3cm90ZToKPiBIaSBBcm5kLgo+IAo+IE9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDAy
OjEzOjI5UE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBGcm9tOiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+ID4gCj4gPiBzcGFyYzY0IHVzZXMgYWRkcmVzcyBzcGFjZSBp
ZGVudGlmaWVycyB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4ga2VybmVsCj4gPiBhbmQgdXNlciBz
cGFjZSwgdXNpbmcgQVNJX1AgZm9yIGtlcm5lbCB0aHJlYWRzIGJ1dCBBU0lfQUlVUyBmb3Igbm9y
bWFsCj4gPiB1c2VyIHNwYWNlLCB3aXRoIHRoZSBvcHRpb24gb2YgY2hhbmdpbmcgYmV0d2VlbiB0
aGVtLgo+ID4gCj4gPiBBcyBub3RoaW5nIHJlYWxseSBjaGFuZ2VzIHRoZSBBU0kgYW55IG1vcmUs
IGp1c3QgaGFyZGNvZGUgQVNJX0FJVVMKPiA+IGV2ZXJ5d2hlcmUuIEtlcm5lbCB0aHJlYWRzIGFy
ZSBub3QgYWxsb3dlZCB0byBhY2Nlc3MgX191c2VyIHBvaW50ZXJzCj4gPiBhbnl3YXkuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiAtLS0K
PiA+ICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3Byb2Nlc3Nvcl82NC5oICAgfCAgNCAtLS0tCj4g
PiAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9zd2l0Y2hfdG9fNjQuaCAgIHwgIDQgKy0tLQo+ID4g
IGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm9fNjQuaCB8ICA0ICstLS0KPiA+ICBh
cmNoL3NwYXJjL2luY2x1ZGUvYXNtL3VhY2Nlc3NfNjQuaCAgICAgfCAyMCArLS0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gIGFyY2gvc3BhcmMva2VybmVsL3Byb2Nlc3NfNjQuYyAgICAgICAgICB8IDEy
IC0tLS0tLS0tLS0tLQo+ID4gIGFyY2gvc3BhcmMva2VybmVsL3RyYXBzXzY0LmMgICAgICAgICAg
ICB8ICAyIC0tCj4gPiAgYXJjaC9zcGFyYy9saWIvTkdtZW1jcHkuUyAgICAgICAgICAgICAgIHwg
IDMgKy0tCj4gPiAgYXJjaC9zcGFyYy9tbS9pbml0XzY0LmMgICAgICAgICAgICAgICAgIHwgIDcg
KysrKy0tLQo+ID4gIDggZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlv
bnMoLSkKPiAKPiBJIHRoaW5rIHlvdSBzb21laG93IG1pc3NlZCB0aGUgS2NvbmZpZyBjaGFuZ2Us
IGFuZCBhbHNvIHRoZSByZWxhdGVkCj4gc3BhcmMzMiBjaGFuZ2Ugd2hpY2ggY29udGludWUgdG8g
aGF2ZSBzZXRfZnMoKSBhZnRlciB0aGlzIHBhdGNoLgpJIG5vdyBub3RpY2UgdGhlIHNwYXJjMzIg
Yml0cyBhcmUgaW4gdGhlIGxhc3QgcGF0Y2guClRvIGF2b2lkIGJyZWFraW5nIGJpc2VjdC1hYmls
aXR5IG9uIHNwYXJjNjQgSSB0aGluayB5b3UgbmVlZCB0byBtZXJnZQp0aGUgc3BhcmMzMiBjaGFu
Z2VzIHdpdGggdGhpcyBwYXRjaCwgdW5sZXNzIHRoZSBzcGFyYzY0IGNoYW5nZXMgY2FuCmNvZXhp
c3Qgd2l0aCBDT05GSUdfU0VUX0ZTIGNvbnRpbnVlIHRvIGJlIHNldC4KCglTYW0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

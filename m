Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9879C4B904B
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 19:35:12 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 49E492483C;
	Wed, 16 Feb 2022 19:35:12 +0100 (CET)
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by mail.librecores.org (Postfix) with ESMTPS id 8628724837
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 19:35:10 +0100 (CET)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 36dbd7e5-8f57-11ec-b2df-0050568cd888;
 Wed, 16 Feb 2022 18:35:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 10F5F194B3E;
 Wed, 16 Feb 2022 19:35:03 +0100 (CET)
Date: Wed, 16 Feb 2022 19:34:59 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Yg1D08+olCSGmnYU@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-16-arnd@kernel.org>
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

SGkgQXJuZC4KCk9uIFdlZCwgRmViIDE2LCAyMDIyIGF0IDAyOjEzOjI5UE0gKzAxMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAK
PiBzcGFyYzY0IHVzZXMgYWRkcmVzcyBzcGFjZSBpZGVudGlmaWVycyB0byBkaWZmZXJlbnRpYXRl
IGJldHdlZW4ga2VybmVsCj4gYW5kIHVzZXIgc3BhY2UsIHVzaW5nIEFTSV9QIGZvciBrZXJuZWwg
dGhyZWFkcyBidXQgQVNJX0FJVVMgZm9yIG5vcm1hbAo+IHVzZXIgc3BhY2UsIHdpdGggdGhlIG9w
dGlvbiBvZiBjaGFuZ2luZyBiZXR3ZWVuIHRoZW0uCj4gCj4gQXMgbm90aGluZyByZWFsbHkgY2hh
bmdlcyB0aGUgQVNJIGFueSBtb3JlLCBqdXN0IGhhcmRjb2RlIEFTSV9BSVVTCj4gZXZlcnl3aGVy
ZS4gS2VybmVsIHRocmVhZHMgYXJlIG5vdCBhbGxvd2VkIHRvIGFjY2VzcyBfX3VzZXIgcG9pbnRl
cnMKPiBhbnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPiAtLS0KPiAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9wcm9jZXNzb3JfNjQuaCAgIHwg
IDQgLS0tLQo+ICBhcmNoL3NwYXJjL2luY2x1ZGUvYXNtL3N3aXRjaF90b182NC5oICAgfCAgNCAr
LS0tCj4gIGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm9fNjQuaCB8ICA0ICstLS0K
PiAgYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS91YWNjZXNzXzY0LmggICAgIHwgMjAgKy0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgYXJjaC9zcGFyYy9rZXJuZWwvcHJvY2Vzc182NC5jICAgICAgICAgIHwg
MTIgLS0tLS0tLS0tLS0tCj4gIGFyY2gvc3BhcmMva2VybmVsL3RyYXBzXzY0LmMgICAgICAgICAg
ICB8ICAyIC0tCj4gIGFyY2gvc3BhcmMvbGliL05HbWVtY3B5LlMgICAgICAgICAgICAgICB8ICAz
ICstLQo+ICBhcmNoL3NwYXJjL21tL2luaXRfNjQuYyAgICAgICAgICAgICAgICAgfCAgNyArKysr
LS0tCj4gIDggZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0OCBkZWxldGlvbnMoLSkK
CkkgdGhpbmsgeW91IHNvbWVob3cgbWlzc2VkIHRoZSBLY29uZmlnIGNoYW5nZSwgYW5kIGFsc28g
dGhlIHJlbGF0ZWQKc3BhcmMzMiBjaGFuZ2Ugd2hpY2ggY29udGludWUgdG8gaGF2ZSBzZXRfZnMo
KSBhZnRlciB0aGlzIHBhdGNoLgoKCkkgZGlkIG5vdCBtYW5hZ2UgdG8gcmV2aWV3IHRoZSBwYXRj
aCAtIGFzIEkgYW0gdG9vIHVuZmFtaWxpYXIgd2l0aCB0aGUKY29kZSBwYXRocyBhbmQgdGhlIHNl
dF9mcygpIHJlbW92YWwgY2hhbmdlcy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AA00A4B5F1F
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 01:32:51 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 63639242E8;
	Tue, 15 Feb 2022 01:32:51 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id 42E0923FA3
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 01:32:50 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJll2-001pbW-H6; Tue, 15 Feb 2022 00:31:52 +0000
Date: Tue, 15 Feb 2022 00:31:52 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <Ygr0eAA+ZR1eX0wb@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-6-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 05/14] uaccess: add generic __{get,
 put}_kernel_nofault
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
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, nickhu@andestech.com,
 jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDNQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IEFsbCBhcmNo
aXRlY3R1cmVzIHRoYXQgZG9uJ3QgcHJvdmlkZSBfX3tnZXQscHV0fV9rZXJuZWxfbm9mYXVsdCgp
IHlldAo+IGNhbiBpbXBsZW1lbnQgdGhpcyBvbiB0b3Agb2YgX197Z2V0LHB1dH1fdXNlci4KPiAK
PiBBZGQgYSBnZW5lcmljIHZlcnNpb24gdGhhdCBsZXRzIGV2ZXJ5dGhpbmcgdXNlIHRoZSBub3Jt
YWwKPiBjb3B5X3tmcm9tLHRvfV9rZXJuZWxfbm9mYXVsdCgpIGNvZGUgYmFzZWQgb24gdGhlc2Us
IHJlbW92aW5nIHRoZSBsYXN0Cj4gdXNlIG9mIGdldF9mcygpL3NldF9mcygpIGZyb20gYXJjaGl0
ZWN0dXJlLWluZGVwZW5kZW50IGNvZGUuCgpJJ2QgcHV0IHRoZSBsaXN0IG9mIHRob3NlIGFyY2hp
dGVjdHVyZXMgKEFGQUlDUywgdGhhdCdzIGFscGhhLCBpYTY0LAptaWNyb2JsYXplLCBuZHMzMiwg
bmlvczIsIG9wZW5yaXNjLCBzaCwgc3BhcmMzMiwgeHRlbnNhKSBpbnRvIGNvbW1pdAptZXNzYWdl
IC0gaXQncyBub3QgdGhhdCBoYXJkIHRvIGZpbmQgb3V0LCBidXQuLi4KCkFuZCBBRkFJQ1MsIHlv
dSd2ZSBtaXNzZWQgbmlvczIgLSBzZWUKI2RlZmluZSBfX3B1dF91c2VyKHgsIHB0cikgcHV0X3Vz
ZXIoeCwgcHRyKQppbiB0aGVyZS4gIG5kczMyIG9kZGl0aWVzIGFyZSBkZWFsdCB3aXRoIGVhcmxp
ZXIgaW4gdGhlIHNlcmllcywgdGhpcwpvbmUgaXMgbm90Li4uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklT
Q0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3Rp
bmZvL29wZW5yaXNjCg==

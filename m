Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC5B4B641C
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 08:14:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C218E242C0;
	Tue, 15 Feb 2022 08:14:36 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id A7B24235F1
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 08:14:34 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJs1u-001uPd-Et; Tue, 15 Feb 2022 07:13:42 +0000
Date: Tue, 15 Feb 2022 07:13:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
 <20220215062942.GA12551@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215062942.GA12551@lst.de>
Subject: Re: [OpenRISC] [PATCH 09/14] m68k: drop custom __access_ok()
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
 will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@kernel.org>, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, jcmvbkbc@gmail.com,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMDc6Mjk6NDJBTSArMDEwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBGZWIgMTUsIDIwMjIgYXQgMTI6Mzc6NDFBTSArMDAwMCwgQWwg
VmlybyB3cm90ZToKPiA+IFBlcmhhcHMgc2ltcGx5IHdyYXAgdGhhdCBzdWNrZXIgaW50byAjaWZk
ZWYgQ09ORklHX0NQVV9IQVNfQUREUkVTU19TUEFDRVMKPiA+IChhbmQgdHJpbSB0aGUgY29tbWVu
dCBkb3duIHRvICJjb2xkZmlyZSBhbmQgNjgwMDAgd2lsbCBwaWNrIGdlbmVyaWMKPiA+IHZhcmlh
bnQiKT8KPiAKPiBJIHdvbmRlciBpZiB3ZSBzaG91bGQgaW52ZXJ0IENPTkZJR19BUkNIX0hBU19O
T05fT1ZFUkxBUFBJTkdfQUREUkVTU19TUEFDRSwKPiBzZWxlY3QgdGhlIHNlcGFyYXRlIGFkZHJl
c3Mgc3BhY2UgY29uZmlnIGZvciBzMzkwLCBzcGFyYzY0LCBub24tY29sZGZpcmUKPiBtNjhrIGFu
ZCBtaXBzIHdpdGggRVZBIGFuZCB0aGVuIGp1c3QgaGF2ZSBvbmUgc2luZ2xlIGFjY2Vzc19vayBm
b3IKPiBvdmVybGFwcGluZyBhZGRyZXNzIHNwYWNlIChhcyBhZGRlZCBieSBBcm5kKSBhbmQgbm9u
LW92ZXJsYXBwaW5nIG9uZXMKPiAoYWx3YXlzIHJldHVybiB0cnVlKS4KCnBhcmlzYyBpcyBhbHNv
IHN1Y2guLi4gIEhvdyBhYm91dAoKCXNlbGVjdCBBTFRFUk5BVEVfU1BBQ0VfVVNFUkxBTkQKCmZv
ciB0aGF0IGJ1bmNoPyAgV2hpbGUgd2UgYXJlIGF0IGl0LCBob3cgbWFueSB1bnVzdWFsIGFjY2Vz
c19vaygpIGluc3RhbmNlcyBhcmUKbGVmdCBhZnRlciB0aGlzIHNlcmllcz8gIGFybTY0LCBpdGFu
aWMsIHVtLCBhbnl0aGluZyBlbHNlPwoKRldJVywgc3BhcmMzMiBoYXMgYSBzbGlnaHRseSB1bnVz
dWFsIGluc3RhbmNlIChzZWUgdWFjY2Vzc18zMi5oIHRoZXJlKTsgaXQncwpvYnZpb3VzbHkgY2hl
YXBlciB0aGFuIGdlbmVyaWMgYW5kIEkgd29uZGVyIGlmIHRoZSB0cmljayBpcyBsZWdpdGltYXRl
IChhbmQKYXBwbGljYWJsZSBlbHNld2hlcmUsIHBlcmhhcHMpLi4uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVu
UklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xp
c3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2471B4B6152
	for <lists+openrisc@lfdr.de>; Tue, 15 Feb 2022 04:04:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E2E95242C3;
	Tue, 15 Feb 2022 04:04:48 +0100 (CET)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 by mail.librecores.org (Postfix) with ESMTPS id 90C3C240FC
 for <openrisc@lists.librecores.org>; Tue, 15 Feb 2022 04:04:47 +0100 (CET)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJo7z-001r4A-EX; Tue, 15 Feb 2022 03:03:43 +0000
Date: Tue, 15 Feb 2022 03:03:43 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-15-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-15-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH 14/14] uaccess: drop set_fs leftovers
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NTJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vZnV0ZXguaCBiL2Fy
Y2gvcGFyaXNjL2luY2x1ZGUvYXNtL2Z1dGV4LmgKPiBpbmRleCBiNTgzNTMyNWQ0NGIuLjJmNGEx
YjFlZjM4NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9mdXRleC5oCj4g
KysrIGIvYXJjaC9wYXJpc2MvaW5jbHVkZS9hc20vZnV0ZXguaAo+IEBAIC05OSw3ICs5OSw3IEBA
IGZ1dGV4X2F0b21pY19jbXB4Y2hnX2luYXRvbWljKHUzMiAqdXZhbCwgdTMyIF9fdXNlciAqdWFk
ZHIsCj4gIAkvKiBmdXRleC5jIHdhbnRzIHRvIGRvIGEgY21weGNoZ19pbmF0b21pYyBvbiBrZXJu
ZWwgTlVMTCwgd2hpY2ggaXMKPiAgCSAqIG91ciBnYXRld2F5IHBhZ2UsIGFuZCBjYXVzZXMgbm8g
ZW5kIG9mIHRyb3VibGUuLi4KPiAgCSAqLwo+IC0JaWYgKHVhY2Nlc3Nfa2VybmVsKCkgJiYgIXVh
ZGRyKQo+ICsJaWYgKCF1YWRkcikKPiAgCQlyZXR1cm4gLUVGQVVMVDsKCglIdWg/ICB1YWNjZXNz
X2tlcm5lbCgpIGlzIHJlbW92ZWQgc2luY2UgaXQgYmVjb21lcyBhbHdheXMgZmFsc2Ugbm93LApz
byB0aGlzIGxvb2tzIG9kZC4KCglBRkFJQ1MsIHRoZSBjb21tZW50IGFib3ZlIHRoYXQgY2hlY2sg
cmVmZXJzIHRvIGZ1dGV4X2RldGVjdF9jbXB4Y2hnKCkKLT4gY21weGNoZ19mdXRleF92YWx1ZV9s
b2NrZWQoKSAtPiBmdXRleF9hdG9taWNfY21weGNoZ19pbmF0b21pYygpIGNhbGwgY2hhaW4uCldo
aWNoIGhhZCBiZWVuIGdvbmUgc2luY2UgY29tbWl0IDMyOTc0ODFkNjg4YSAoZnV0ZXg6IFJlbW92
ZSBmdXRleF9jbXB4Y2hnCmRldGVjdGlvbikuICBUaGUgY29tbWVudCAqYW5kKiB0aGUgY2hlY2sg
c2hvdWxkJ3ZlIGJlZW4ga2lsbGVkIG9mZiBiYWNrCnRoZW4uCglMZXQncyBtYWtlIHN1cmUgdG8g
Z2V0IGJvdGggbm93Li4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

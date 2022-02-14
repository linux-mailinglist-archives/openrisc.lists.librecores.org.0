Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 917544B5814
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 18:10:11 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4B46224801;
	Mon, 14 Feb 2022 18:10:11 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by mail.librecores.org (Postfix) with ESMTP id 956B3211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:10:10 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-59-4uBsnFPgM72Ml12czhVz_g-1; Mon, 14 Feb 2022 17:10:09 +0000
X-MC-Unique: 4uBsnFPgM72Ml12czhVz_g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 17:10:06 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 14 Feb 2022 17:10:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@infradead.org>, Arnd Bergmann <arnd@kernel.org>
Thread-Topic: [PATCH 03/14] nds32: fix access_ok() checks in get/put_user
Thread-Index: AQHYIcSLBVNsuZIR/kWyaxa2mA9Gq6yTRsYw
Date: Mon, 14 Feb 2022 17:10:05 +0000
Message-ID: <8a6e309687d647e3aef8a88bdb0922af@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org> <YgqK1ihlJvRFHJ9h@infradead.org>
In-Reply-To: <YgqK1ihlJvRFHJ9h@infradead.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [OpenRISC] [PATCH 03/14] nds32: fix access_ok() checks in
 get/put_user
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcKPiBTZW50OiAxNCBGZWJydWFyeSAyMDIyIDE3OjAxCj4g
Cj4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDFQTSArMDEwMCwgQXJuZCBCZXJnbWFu
biB3cm90ZToKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPgo+ID4g
VGhlIGdldF91c2VyKCkvcHV0X3VzZXIoKSBmdW5jdGlvbnMgYXJlIG1lYW50IHRvIGNoZWNrIGZv
cgo+ID4gYWNjZXNzX29rKCksIHdoaWxlIHRoZSBfX2dldF91c2VyKCkvX19wdXRfdXNlcigpIGZ1
bmN0aW9ucwo+ID4gZG9uJ3QuCj4gPgo+ID4gVGhpcyBicm9rZSBpbiA0LjE5IGZvciBuZHMzMiwg
d2hlbiBpdCBnYWluZWQgYW4gZXh0cmFuZW91cwo+ID4gY2hlY2sgaW4gX19nZXRfdXNlcigpLCBi
dXQgbG9zdCB0aGUgY2hlY2sgaXQgbmVlZHMgaW4KPiA+IF9fcHV0X3VzZXIoKS4KPiAKPiBDYW4g
d2UgZm9sbG93IHRoZSBsZWFkIG9mIE1JUFMgKHdoaWNoIHRoaXMgd2FzIG9yaWdpbmFsbHkgY29w
aWVkCj4gZnJvbSBJIHRoaW5rKSBhbmQga2lsbCB0aGUgcG9pbnRsZXNzIF9fZ2V0L3B1dF91c2Vy
X2NoZWNrIHdyYXBwZXIKPiB0aGF0IGp1c3Qgb2JzZnVjYXRlIHRoZSBjb2RlPwoKSXMgaXQgcG9z
c2libGUgdG8gbWFrZSBhbGwgdGhlc2UgYXJjaGl0ZWN0dXJlcyBmYWxsIGJhY2sgdG8KYSBjb21t
b24gZGVmaW5pdGlvbiBzb21ld2hlcmU/CgpNYXliZSB0aGV5IG5lZWQgdG8gZGVmaW5lIEFDQ0VT
U19PS19VU0VSX0xJTUlUIC0gd2hpY2ggY2FuIGJlCmRpZmZlcmVudCBmcm9tIFRBU0tfU0laRS4K
ClRoZXJlJ2xsIGJlIGEgZmV3IHNwZWNpYWwgY2FzZXMsIGJ1dCBtb3N0IGFyY2hpdGVjdHVyZXMg
aGF2ZQprZXJuZWwgYWRkcmVzc2VzIGFib3ZlIHVzZXJzcGFjZSBvbmVzLgoKCURhdmlkCgotClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSwpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

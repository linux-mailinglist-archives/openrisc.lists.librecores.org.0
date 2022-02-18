Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2844BBC5E
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 16:46:04 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B677224884;
	Fri, 18 Feb 2022 16:46:03 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by mail.librecores.org (Postfix) with ESMTP id 594A12487E
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 16:46:01 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-70--4RjbVXtMcueaeoDqT_n6w-1; Fri, 18 Feb 2022 15:45:59 +0000
X-MC-Unique: -4RjbVXtMcueaeoDqT_n6w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 15:45:56 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Fri, 18 Feb 2022 15:45:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Arnd Bergmann <arnd@kernel.org>
Thread-Topic: [PATCH v2 05/18] x86: remove __range_not_ok()
Thread-Index: AQHYJJDV6CwChj5QoEqoVAdoFeMQC6yZc16A
Date: Fri, 18 Feb 2022 15:45:56 +0000
Message-ID: <905678e9e05d40b9a4e13e7b1a34cb68@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org> <20220218062851.GC22576@lst.de>
In-Reply-To: <20220218062851.GC22576@lst.de>
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
Subject: Re: [OpenRISC] [PATCH v2 05/18] x86: remove __range_not_ok()
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "green.hu@gmail.com" <green.hu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcKPiBTZW50OiAxOCBGZWJydWFyeSAyMDIyIDA2OjI5Ci4u
Lgo+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9zdGFja3RyYWNlLmMgYi9hcmNo
L3g4Ni9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gPiBpbmRleCAxNWIwNThlZWZjNGUuLmVlMTE3ZmNm
NDZlZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiA+ICsr
KyBiL2FyY2gveDg2L2tlcm5lbC9zdGFja3RyYWNlLmMKPiA+IEBAIC05MCw3ICs5MCw3IEBAIGNv
cHlfc3RhY2tfZnJhbWUoY29uc3Qgc3RydWN0IHN0YWNrX2ZyYW1lX3VzZXIgX191c2VyICpmcCwK
PiA+ICB7Cj4gPiAgCWludCByZXQ7Cj4gPgo+ID4gLQlpZiAoX19yYW5nZV9ub3Rfb2soZnAsIHNp
emVvZigqZnJhbWUpLCBUQVNLX1NJWkUpKQo+ID4gKwlpZiAoIV9fYWNjZXNzX29rKGZwLCBzaXpl
b2YoKmZyYW1lKSkpCj4gPiAgCQlyZXR1cm4gMDsKPiAKPiBKdXN0IHN3aXRjaCB0aGUgX19nZXRf
dXNlciBjYWxscyBiZWxvdyB0byBnZXRfdXNlciBpbnN0ZWFkLgoKSXMgdGhpcyB3b3J0aCBkb2lu
ZyBhdCBhbGw/CkhvdyBtdWNoIHVzZXJzcGFjZSBjb2RlIGlzIGFjdHVhbGx5IGNvbXBpbGVkIHdp
dGggc3RhY2sgZnJhbWVzPwoKV29uJ3Qgd29yayB3ZWxsIGZvciBhIDMyYml0IHByb2Nlc3Mgb24g
YSA2NGJpdCBrZXJuZWwgZWl0aGVyLgoKCURhdmlkCgotClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
SwpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK

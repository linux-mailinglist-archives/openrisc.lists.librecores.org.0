Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DE3474BB597
	for <lists+openrisc@lfdr.de>; Fri, 18 Feb 2022 10:30:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7F2182487D;
	Fri, 18 Feb 2022 10:30:38 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by mail.librecores.org (Postfix) with ESMTP id BD0DE24876
 for <openrisc@lists.librecores.org>; Fri, 18 Feb 2022 10:30:36 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-129-Mn8CKvyFPNSuM9Bkc4i3uw-1; Fri, 18 Feb 2022 09:30:35 +0000
X-MC-Unique: Mn8CKvyFPNSuM9Bkc4i3uw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 09:30:32 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Fri, 18 Feb 2022 09:30:32 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andy Lutomirski' <luto@amacapital.net>, Arnd Bergmann <arnd@kernel.org>
Thread-Topic: [PATCH v2 13/18] uaccess: generalize access_ok()
Thread-Index: AQHYJDLDvIZKe0fPGEirizFtCzB+zayZCg2g
Date: Fri, 18 Feb 2022 09:30:32 +0000
Message-ID: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
In-Reply-To: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
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
Subject: Re: [OpenRISC] [PATCH v2 13/18] uaccess: generalize access_ok()
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
 "will@kernel.org" <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "ardb@kernel.org" <ardb@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
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

RnJvbTogQW5keSBMdXRvbWlyc2tpDQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjIgMTk6MTUNCi4u
Lg0KPiBUaGlzIGlzbid0IGFjdHVhbGx5IG9wdGltYWwuICBPbiB4ODYsIFRBU0tfU0laRV9NQVgg
aXMgYSBiaXphcnJlDQo+IGNvbnN0YW50IHRoYXQgaGFzIGEgdmVyeSBzcGVjaWZpYyB2YWx1ZSB0
byB3b3JrIGFyb3VuZCBhIGJ1Z15XZGVzaWduDQo+IGVycm9yXldmZWF0dXJlIG9mIEludGVsIENQ
VXMuICBUQVNLX1NJWkVfTUFYIGlzIHRoZSBtYXhpbXVtIGFkZHJlc3MgYXQNCj4gd2hpY2ggdXNl
cnNwYWNlIGlzIHBlcm1pdHRlZCB0byBhbGxvY2F0ZSBtZW1vcnksIGJ1dCB0aGVyZSBpcyBhIGh1
Z2UNCj4gZ2FwIGJldHdlZW4gdXNlciBhbmQga2VybmVsIGFkZHJlc3NlcywgYW5kIGFueSB2YWx1
ZSBpbiB0aGUgZ2FwIHdvdWxkDQo+IGJlIGFkZXF1YXRlIGZvciB0aGUgY29tcGFyaXNvbi4gIElm
IHdlIHdhbnRlZCB0byBvcHRpbWl6ZSB0aGlzLCBzaW1wbHkNCj4gY2hlY2tpbmcgdGhlIGhpZ2gg
Yml0ICh3aGljaCB4ODYgY2FuIGRvIHdpdGhvdXQgYW55IGltbWVkaWF0ZQ0KPiBjb25zdGFudHMg
YXQgYWxsKSB3b3VsZCBiZSBzdWZmaWNpZW50IGFuZCwgZm9yIGFuIGFjY2VzcyBrbm93biB0byBm
aXQNCj4gaW4gMzIgYml0cywgb25lIGNvdWxkIGdldCBldmVuIGZhbmNpZXIgYW5kIGNvbXBsZXRl
bHkgaWdub3JlIHRoZSBzaXplDQo+IG9mIHRoZSBhY2Nlc3MuICAoRm9yIGFjY2Vzc2VzIG5vdCBr
bm93biB0byBmaXQgaW4gMzIgYml0cywgSSBzdXNwZWN0DQo+IHNvbWUgY3JlYXRpdml0eSBjb3Vs
ZCBzdGlsbCBjb21lIHVwIHdpdGggYSBjb25zdHJ1Y3Rpb24gdGhhdCdzDQo+IHN1YnN0YW50aWFs
bHkgZmFzdGVyIHRoYW4gdGhlIG9uZSBpbiB5b3VyIHBhdGNoLikNCj4gDQo+IFNvIHRoZXJlJ3Mg
cGxlbnR5IG9mIHJvb20gZm9yIG9wdGltaXphdGlvbiBoZXJlLg0KPiANCj4gKFRoaXMgaXMgbm90
IGluIGFueSByZXNwZWN0IGEgTkFLIC0tIGl0J3MganVzdCBhbiBvYnNlcnZhdGlvbiB0aGF0DQo+
IHRoaXMgY291bGQgYmUgZXZlbiBiZXR0ZXIuKQ0KDQpGb3IgNjRiaXQgYXJjaCB0aGF0IHVzZSB0
aGUgdG9wIGJpdCB0byBzZXBhcmF0ZSB1c2VyL2tlcm5lbA0KeW91IGNhbiB0ZXN0ICcoYWRkciB8
IHNpemUpID4+IDYyKScuDQpUaGUgY29tcGlsZXIgb3B0aW1pc2VzIG91dCBjb25zdGFudCBzaXpl
cy4NCg0KVGhpcyBoYXMgYWxsIGJlZW4gbWVudGlvbmVkIGEgbG90IG9mIHRpbWVzLg0KWW91IGRv
IGdldCBkaWZmZXJlbnQgZmF1bHQgdHlwZXMuDQoNCk9UT0ggYW4gZXhwbGljaXQgY2hlY2sgZm9y
IGNvbnN0YW50IHNpemUgKGxlc3MgdGhhbiBzb21ldGhpbmcgYmlnKQ0KY2FuIHVzZSB0aGUgY2hl
YXBlciB0ZXN0IG9mIHRoZSBzaWduIGJpdC4NCkJpZyBjb25zdGFudCBzaXplcyBjb3VsZCBiZSBj
b21waWxlIHRpbWUgZXJyb3JzLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

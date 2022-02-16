Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CA3124B8A3D
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:35:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7B8D32483D;
	Wed, 16 Feb 2022 14:35:31 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by mail.librecores.org (Postfix) with ESMTP id 146A024828
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:35:30 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-5-x7kvjQ_dNbmfJSCohruuVA-1; Wed, 16 Feb 2022 13:35:28 +0000
X-MC-Unique: x7kvjQ_dNbmfJSCohruuVA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 13:35:25 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 16 Feb 2022 13:35:25 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Thread-Topic: [PATCH v2 02/18] uaccess: fix nios2 and microblaze get_user_8()
Thread-Index: AQHYIzdfY+IsqXyFuUGlEUsFmAHn6KyWK9Eg
Date: Wed, 16 Feb 2022 13:35:25 +0000
Message-ID: <4a7e026b07c94668a18cb4857ad6b7a5@AcuMS.aculab.com>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-3-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-3-arnd@kernel.org>
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
Subject: Re: [OpenRISC] [PATCH v2 02/18] uaccess: fix nios2 and microblaze
 get_user_8()
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
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "green.hu@gmail.com" <green.hu@gmail.com>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubgo+IFNlbnQ6IDE2IEZlYnJ1YXJ5IDIwMjIgMTM6MTMKPiAKPiBU
aGVzZSB0d28gYXJjaGl0ZWN0dXJlcyBpbXBsZW1lbnQgOC1ieXRlIGdldF91c2VyKCkgdGhyb3Vn
aAo+IGEgbWVtY3B5KCkgaW50byBhIGZvdXItYnl0ZSB2YXJpYWJsZSwgd2hpY2ggd29uJ3QgZml0
Lgo+IAo+IFVzZSBhIHRlbXBvcmFyeSA2NC1iaXQgdmFyaWFibGUgaW5zdGVhZCBoZXJlLCBhbmQg
dXNlIGEgZG91YmxlCj4gY2FzdCB0aGUgd2F5IHRoYXQgcmlzYy12IGFuZCBvcGVucmlzYyBkbyB0
byBhdm9pZCBjb21waWxlLXRpbWUKPiB3YXJuaW5ncy4KPiAKLi4uCj4gIAljYXNlIDQ6CQkJCQkJ
CQlcCj4gLQkJX19nZXRfdXNlcl9hc20oImx3IiwgKHB0ciksIF9fZ3VfdmFsLCBfX2d1X2Vycik7
CVwKPiArCQlfX2dldF91c2VyX2FzbSgibHciLCAocHRyKSwgeCwgX19ndV9lcnIpOwkJXAo+ICAJ
CWJyZWFrOwkJCQkJCQlcCj4gLQljYXNlIDg6CQkJCQkJCQlcCj4gLQkJX19ndV9lcnIgPSBfX2Nv
cHlfZnJvbV91c2VyKCZfX2d1X3ZhbCwgcHRyLCA4KTsJCVwKPiAtCQlpZiAoX19ndV9lcnIpCQkJ
CQkJXAo+IC0JCQlfX2d1X2VyciA9IC1FRkFVTFQ7CQkJCVwKPiArCWNhc2UgODogewkJCQkJCQlc
Cj4gKwkJX191NjQgX194ID0gMDsJCQkJCQlcCj4gKwkJX19ndV9lcnIgPSByYXdfY29weV9mcm9t
X3VzZXIoJl9feCwgcHRyLCA4KSA/CQlcCj4gKwkJCQkJCQktRUZBVUxUIDogMDsJXAo+ICsJCSh4
KSA9ICh0eXBlb2YoeCkpKHR5cGVvZigoeCkgLSAoeCkpKV9feDsJCVwKPiAgCQlicmVhazsJCQkJ
CQkJXAoKV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGp1c3QgZmV0Y2ggdHdvIDMyYml0IHZhbHVl
czoKU29tZXRoaW5nIGxpa2UgKGZvciBMRSAtIG5pb3MyIGlzIGRlZmluaXRlbHkgTEU6CgkJX191
MzIgdmFsX2xvLCB2YWxfaGk7CgkJX19nZXRfdXNlcl9hc20oImx3IiwgKHB0ciksIHZhbF9sbywg
X19ndV9lcnIpOwoJCV9fZ2V0X3VzZXJfYXNtKCJsdyIsIChwdHIpICsgNCwgdmFsX2hpLCBfX2d1
X2Vycik7CgkJeCA9IHZhbF9sbyB8IHZhbF9oaSA8PCAzMjsKCQlicmVhazsKCglEYXZpZAoKLQpS
ZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWls
dG9uIEtleW5lcywgTUsxIDFQVCwgVUsKUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVND
IG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3Rz
LmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

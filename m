Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 764EC377ECC
	for <lists+openrisc@lfdr.de>; Mon, 10 May 2021 10:58:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0FDED2136A;
	Mon, 10 May 2021 10:58:40 +0200 (CEST)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by mail.librecores.org (Postfix) with ESMTP id C189920162
 for <openrisc@lists.librecores.org>; Sat,  8 May 2021 13:42:18 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-30-pslduLlcNaOjNqxPJEEhyg-1; Sat, 08 May 2021 12:42:15 +0100
X-MC-Unique: pslduLlcNaOjNqxPJEEhyg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 8 May 2021 12:42:13 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 8 May 2021 12:42:13 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>
Thread-Topic: [RFC 02/12] openrisc: always use unaligned-struct header
Thread-Index: AQHXQ42+sCloTJU1UUOieiWkxU7/TarZco2w
Date: Sat, 8 May 2021 11:42:13 +0000
Message-ID: <7f2ca7e366a444108932c4c3bb95c2f9@AcuMS.aculab.com>
References: <20210507220813.365382-1-arnd@kernel.org>
 <20210507220813.365382-3-arnd@kernel.org>
In-Reply-To: <20210507220813.365382-3-arnd@kernel.org>
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
X-Mailman-Approved-At: Mon, 10 May 2021 10:58:39 +0200
Subject: Re: [OpenRISC] [RFC 02/12] openrisc: always use unaligned-struct
 header
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubgo+IFNlbnQ6IDA3IE1heSAyMDIxIDIzOjA4Ci4uLgo+IEkgZG9u
J3Qga25vdyBob3cgdGhlIGxvYWRzL3N0b3JlIHBlcmZvcm0gY29tcGFyZWQgdG8gdGhlIHNoaWZ0
IHZlcnNpb24KPiBvbiBhIHBhcnRpY3VsYXIgbWljcm9hcmNoaXRlY3R1cmUsIGJ1dCBteSBndWVz
cyBpcyB0aGF0IHRoZSBzaGlmdHMKPiBhcmUgYmV0dGVyLgoKV2hhdCBkb2VzIHRoZSBuaW9zIHVz
ZT8KU2hpZnRzIGdlbmVyYXRlIHJlYXNvbmFibGUgY29kZSBmb3IgcHV0X3VuYWxpZ25lZCgpIGJ1
dAp0aGV5IGdldCBob3JyaWQgZm9yIGdldF91bmFsaWduZWQoKS4KCk9uIHRoZSBuaW9zIHdyaXRp
bmcgdGhlIDQgYnl0ZXMgdG8gbWVtb3J5IGFuZCByZWFkaW5nIGJhY2sKYSAzMmJpdCB2YWx1ZSBz
aG91bGQgZ2VuZXJhdGUgc2hvcnRlciBmYXN0ZXIgY29kZS4KWW91IGRvIG5lZWQgdG8gZ2VuZXJh
dGUgNCBieXRlIGxvYWRzLCA0IGJ5dGVzIHN0b3JlcywgMzJiaXQgbG9hZC4KKFRoZSBsb2FkIHdp
bGwgY2F1c2UgYSBzdGFsbCBpZiB0aGUgZGF0YSBpcyBuZWVkZWQgZm9yIG9uZQpvZiB0aGUgbmV4
dCB0d28gaW5zdHJ1Y3Rpb25zLCBhbmQgdGhlcmUgaXMgYSAodW5kb2N1bWVudGVkKQpzdGFsbCBi
ZXR3ZWVuIGEgd3JpdGUgYW5kIHJlYWQgdG8gdGhlIHNhbWUgbWVtb3J5IGFyZWEuClRoZSBzaGlm
dCB2ZXJzaW9uIHJlcXVpcmVzIDMgc2hpZnRzIGFuZCAzIG9ycyAtIGJ1dCBJIHRoaW5rCmdjYyBt
YWtlcyBhIGJpZ2dlciBwaWcncyBicmVha2Zhc3Qgb2YgaXQuKQoKT1RPSCBJJ20gbm90IHN1cmUg
YW55b25lIGluIHRoZWlyIHJpZ2h0IG1pbmQgd291bGQgcnVuIExpbnV4IG9uIG5pb3MuCkl0IGlz
IGEgc29mdCBjcHUgZm9yIHRoZSBhbHRlcmEgKG5vdyBpbnRlbCkgZnBnYXMuCldlIHVzZSB0aGVt
IHdpdGggNGsgY29kZSBhbmQgc3ViIDY0ayBkYXRhIGZvciByZWFsIHRpbWUgcHJvY2Vzc2luZy4K
CglEYXZpZAoKLQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91
bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKUmVnaXN0cmF0aW9uIE5vOiAxMzk3
Mzg2IChXYWxlcykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

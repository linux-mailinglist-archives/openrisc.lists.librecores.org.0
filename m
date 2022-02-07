Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9DA2A4AC6F1
	for <lists+openrisc@lfdr.de>; Mon,  7 Feb 2022 18:14:49 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4FF5820CF9;
	Mon,  7 Feb 2022 18:14:49 +0100 (CET)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by mail.librecores.org (Postfix) with ESMTP id E17FA205C5
 for <openrisc@lists.librecores.org>; Mon,  7 Feb 2022 18:14:47 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-261-OsvrFIUnMKKFrChEQsxdNA-1; Mon, 07 Feb 2022 17:14:46 +0000
X-MC-Unique: OsvrFIUnMKKFrChEQsxdNA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 7 Feb 2022 17:14:43 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 7 Feb 2022 17:14:43 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@infradead.org>, Stafford Horne <shorne@gmail.com>
Thread-Topic: [PATCH] openrisc: remove CONFIG_SET_FS
Thread-Index: AQHYG/BjkR+ecsCi7UOyp98rZRODA6yIU2uA
Date: Mon, 7 Feb 2022 17:14:43 +0000
Message-ID: <3744dcbbf2874875b023548aacdd8b41@AcuMS.aculab.com>
References: <20220206013648.3491865-1-shorne@gmail.com>
 <YgC/8ng5WX6Nt104@infradead.org>
In-Reply-To: <YgC/8ng5WX6Nt104@infradead.org>
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
Subject: Re: [OpenRISC] [PATCH] openrisc: remove CONFIG_SET_FS
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
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcKPiBTZW50OiAwNyBGZWJydWFyeSAyMDIyIDA2OjQ1Cj4g
Cj4gT24gU3VuLCBGZWIgMDYsIDIwMjIgYXQgMTA6MzY6NDdBTSArMDkwMCwgU3RhZmZvcmQgSG9y
bmUgd3JvdGU6Cj4gPiBSZW1vdmUgdGhlIGFkZHJlc3Mgc3BhY2Ugb3ZlcnJpZGUgQVBJIHNldF9m
cygpIHVzZWQgZm9yIFVzZXIgTW9kZSBMaW51eC4KPiAKPiBUaGlzIGFpbid0IFVNTCA6KQo+IAo+
ID4gKwlyZXR1cm4gc2l6ZSA8PSBUQVNLX1NJWkUgJiYgYWRkciA8PSAoVEFTS19TSVpFIC0gc2l6
ZSk7Cj4gCj4gTm8gbmVlZCBmb3IgdGhlIGlubmVyIGJyYWNlcy4KClNpbmNlIFRBU0tfU0laRSBp
cyBhY3R1YWxseSBhbiBhZGRyZXNzIHdvdWxkbid0IGJlIGJldHRlciB0bwpzd2FwIHRoZSBjb25k
aXRpb24gYXJvdW5kIChpbiBldmVyeSBhcmNoaXRlY3R1cmUpLgoKCXJldHVybiBhZGRyIDw9IFRB
U0tfU0laRSAmJiBzaXplIDw9IFRBU0tfU0laRSAtIGFkZHI7CgoJRGF2aWQKCi0KUmVnaXN0ZXJl
ZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXlu
ZXMsIE1LMSAxUFQsIFVLClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

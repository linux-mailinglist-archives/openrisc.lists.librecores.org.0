Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E3FD5424E53
	for <lists+openrisc@lfdr.de>; Thu,  7 Oct 2021 09:53:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 63CBE2419E;
	Thu,  7 Oct 2021 09:53:05 +0200 (CEST)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by mail.librecores.org (Postfix) with ESMTP id B0E8C24189
 for <openrisc@lists.librecores.org>; Thu,  7 Oct 2021 09:53:04 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-38-fz1CuUWYNx6QMVBcOLTHFg-1; Thu, 07 Oct 2021 08:53:02 +0100
X-MC-Unique: fz1CuUWYNx6QMVBcOLTHFg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 7 Oct 2021 08:53:01 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 7 Oct 2021 08:53:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Stafford Horne
 <shorne@gmail.com>
Thread-Topic: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Thread-Index: AQHXuvrQ2rKkD2ly1kazB6yB6/HdHavHKFTA
Date: Thu, 7 Oct 2021 07:53:01 +0000
Message-ID: <c81b9c01650e487785b02f6562791556@AcuMS.aculab.com>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
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
Subject: Re: [OpenRISC] [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Will
 Deacon <will@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Ray Jui <rjui@broadcom.com>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul
 Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogU2VnaGVyIEJvZXNzZW5rb29sCj4gU2VudDogMDYgT2N0b2JlciAyMDIxIDIyOjI3Cj4g
Cj4gT24gVGh1LCBPY3QgMDcsIDIwMjEgYXQgMDU6NDQ6MDBBTSArMDkwMCwgU3RhZmZvcmQgSG9y
bmUgd3JvdGU6Cj4gPiBZb3UgaGF2ZSBkZWZpbmVkIG9mX2dldF9jcHVfaHdpZCB0byByZXR1cm4g
dTY0LCB3aWxsIHRoaXMgY3JlYXRlIGNvbXBpbGVyCj4gPiB3YXJuaW5ncyB3aGVuIHNpbmNlIHdl
IGFyZSBzdG9yaW5nIGEgdTY0IGludG8gYSB1MzI/Cj4gPgo+ID4gSXQgc2VlbXMgb25seSBpZiB3
ZSBtYWtlIHdpdGggVz0zLgo+IAo+IFllcy4gIFRoaXMgaXMgZG9uZSBieSAtV2NvbnZlcnNpb24s
ICJXYXJuIGZvciBpbXBsaWNpdCBjb252ZXJzaW9ucyB0aGF0Cj4gbWF5IGFsdGVyIGEgdmFsdWUu
Igo+IAo+ID4gSSB0aG91Z2h0IHdlIHVzdWFsbHkgd2FybmVkIG9uIHRoaXMuCgpUaGUgbWljcm9z
b2Z0IGNvbXBpbGVyIGRvZXMgLSBiZXN0IHRvIHR1cm4gYWxsIHRob3NlIHdhcm5pbmdzIG9mZi4K
Cj4gVGhpcyB3YXJuaW5nIGlzIG5vdCBpbiAtV2FsbCBvciAtV2V4dHJhIGVpdGhlciwgaXQgc3Vm
ZmVycyB0b28gbXVjaCBmcm9tCj4gZmFsc2UgcG9zaXRpdmVzLiAgSXQgaXMgdmVyeSBuYXR1cmFs
IHRvIGp1c3QgaWdub3JlIHRoZSBoaWdoIGJpdHMgb2YKPiBtb2R1bG8gdHlwZXMgKHdoaWNoIGlz
IHdoYXQgInVuc2lnbmVkIiB0eXBlcyAqYXJlKikuICBPciB0aGUgYml0cyB0aGF0Cj4gImZhbGwg
b2ZmIiBvbiBhIGNvbnZlcnNpb24uICBUaGUgQyBzdGFuZGFyZCBtYWtlcyB0aGlzIHJlcXVpcmVk
Cj4gYmVoYXZpb3VyLCBpdCBpcyB1c2VmdWwsIGFuZCBpdCBpcyB0aGUgb25seSBjb252ZW5pZW50
IHdheSBvZiBnZXR0aW5nCj4gdGhpcyEKCkkndmUgYWxzbyBzZWVuIGEgY29tcGlsZXIgY29udmVy
dDoKCXN0cnVjdC0+Y2hhcl9tZW1iZXIgPSAoY2hhcikoaW50X3ZhbCAmIDB4ZmYpOwppbnRvOgoJ
cmVnID0gaW50X3ZhbDsKCXJlZyAmPSAweGZmOyAvLyBmb3IgdGhlICYgMHhmZgoJcmVnICY9IDB4
ZmY7IC8vIGZvciB0aGUgY2FzdAoJc3RydWN0LT5jaGFyX21lbWJlciA9IGxvd184Yml0cyhyZWcp
OwoKWW91IHJlYWxseSBkb24ndCB3YW50IHRoZSBleHRyYSBub2lzZS4KCkknbGwgYmV0IHRoYXQg
KGNoYXIpaW50X3ZhbCBpcyBhY3R1YWxseSBhbiBhcml0aG1ldGljIGV4cHJlc3Npb24uClNvIGl0
cyB0eXBlIHdpbGwgYmUgJ2ludCcuCgoJRGF2aWQKCi0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7724734F41D
	for <lists+openrisc@lfdr.de>; Wed, 31 Mar 2021 00:17:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1A373212C6;
	Wed, 31 Mar 2021 00:17:50 +0200 (CEST)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mail.librecores.org (Postfix) with ESMTPS id 7D8B520E79
 for <openrisc@lists.librecores.org>; Tue, 30 Mar 2021 20:23:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2604; q=dns/txt; s=iport;
 t=1617128625; x=1618338225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xMStwoujyvRVt+OuzbkoYXvA32+qhvWOh/uecqwPFaM=;
 b=HOKvwhRGp1THDDrVjcq0hqrsPhQf9jhzOj6t2M25Zty6l28YVrQm/gpt
 yEjqgSvQ1fHwc6HMYoJ8rWqfIz1F4I/3xbaSxUEGMuMTZViAfhyEPNDEs
 sX/53oxhy3KC+CbX1f4inK0aPjnmsHsBhVaQsNHEjsybZUlVbG6IzTgc6 U=;
X-IPAS-Result: =?us-ascii?q?A0ADAAC0a2NgmJldJa1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE8BQEBAQELAYN2ATkxjGWJLpAIFopFgXwLAQEBDQEBNAQBA?=
 =?us-ascii?q?YRQAoF6AiU0CQ4CAwEBAQMCAwEBAQEBBQEBAQIBBgQUAQEBAQEBAQGGQ4ZFA?=
 =?us-ascii?q?QIDOj8QCxguPBsGE4JwgwirOXWBNIkLgUQigRcBjUkmHIFJQoESgm4uPoo2B?=
 =?us-ascii?q?IJHgQ6CMCyUAYpMmw6BFIMRgSObNjEQpEK4EgIEBgUCFoFUOIFbMxoIGxWDJ?=
 =?us-ascii?q?FAZDY44jk8hAy84AgYKAQEDCYZaLIIZAQE?=
IronPort-HdrOrdr: A9a23:OGIYBqgWvJdablCjWRAu+Iu5lnBQXmcji2hD6mlwRA09T+Wzna
 mV88gz/xnylToXRTUMmcqYPrOBXHPb8vdOkOwsFJ2lWxTrv3btEZF64eLZsl/dMgD36+I178
 1dWodkDtmYNzVHpOb8pDK1CtMxhOSAmZrY4dv261dIYUVUZ7p77wF/YzzrcXFeYAVdH5I2GN
 69y6N8xgaIQngcYsSlCnRtZYGqzOHjr57obQULABQq8mC17Q+A0qLwEBSTw34lPQ9n/LFKyw
 T4uj28wLm/uPemzRKZ8Gnf4/1t6b3c4+oGItCQgc4ILTipsCKUXcBKXr2Puy1dmpDJ1GoX
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="689174954"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 18:23:43 +0000
Received: from zorba ([10.24.8.123])
 by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UINdP0017615
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 18:23:41 GMT
Date: Tue, 30 Mar 2021 11:23:39 -0700
From: Daniel Walker <danielwa@cisco.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-ID: <20210330182339.GU109100@zorba>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
 <D8C1FBF6-E5C0-4233-BCB8-694274EA28F9@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D8C1FBF6-E5C0-4233-BCB8-694274EA28F9@goldelico.com>
X-Outbound-SMTP-Client: 10.24.8.123, [10.24.8.123]
X-Outbound-Node: rcdn-core-2.cisco.com
X-Mailman-Approved-At: Wed, 31 Mar 2021 00:17:44 +0200
Subject: Re: [OpenRISC] [PATCH v3 01/17] cmdline: Add generic function to
 build command line.
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
Cc: linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>,
 microblaze <monstr@monstr.eu>, daniel@gimpelevich.san-francisco.ca.us,
 devicetree <devicetree@vger.kernel.org>, linux-sh@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-mips <linux-mips@vger.kernel.org>, openrisc@lists.librecores.org,
 nios2 <ley.foon.tan@intel.com>, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXIgMzAsIDIwMjEgYXQgMDg6MDc6MzBQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gCj4gPiBBbSAzMC4wMy4yMDIxIHVtIDE5OjI3IHNjaHJpZWIgRGFuaWVs
IFdhbGtlciA8ZGFuaWVsd2FAY2lzY28uY29tPjoKPiA+IAo+ID4gT24gRnJpLCBNYXIgMjYsIDIw
MjEgYXQgMDE6NDQ6NDhQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiA+PiBUaGlz
IGNvZGUgcHJvdmlkZXMgYXJjaGl0ZWN0dXJlcyB3aXRoIGEgd2F5IHRvIGJ1aWxkIGNvbW1hbmQg
bGluZQo+ID4+IGJhc2VkIG9uIHdoYXQgaXMgYnVpbHQgaW4gdGhlIGtlcm5lbCBhbmQgd2hhdCBp
cyBoYW5kZWQgb3ZlciBieSB0aGUKPiA+PiBib290bG9hZGVyLCBiYXNlZCBvbiBzZWxlY3RlZCBj
b21waWxlLXRpbWUgb3B0aW9ucy4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4gPj4gLS0tCj4gPj4gdjM6Cj4g
Pj4gLSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4gPj4gLSBBZGRlZCBjYXBhYmlsaXR5
IHRvIGhhdmUgc3JjID09IGRzdAo+ID4+IC0tLQo+ID4+IGluY2x1ZGUvbGludXgvY21kbGluZS5o
IHwgNTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAxIGZp
bGUgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+ID4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNs
dWRlL2xpbnV4L2NtZGxpbmUuaAo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2NtZGxpbmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4gPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmRlYTg3ZWRkNDFiZQo+ID4+IC0tLSAvZGV2
L251bGwKPiA+PiArKysgYi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAo+ID4+IEBAIC0wLDAgKzEs
NTcgQEAKPiA+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+PiAr
I2lmbmRlZiBfTElOVVhfQ01ETElORV9ICj4gPj4gKyNkZWZpbmUgX0xJTlVYX0NNRExJTkVfSAo+
ID4+ICsKPiA+PiArI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+ID4+ICsKPiA+PiArLyogQWxs
b3cgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBz
dHJpbmdzIHNvIGVhcmx5ICovCj4gPj4gKyNpZm5kZWYgY21kbGluZV9zdHJsY2F0Cj4gPj4gKyNk
ZWZpbmUgY21kbGluZV9zdHJsY2F0IHN0cmxjYXQKPiA+PiArI2VuZGlmCj4gPj4gKwo+ID4+ICsv
Kgo+ID4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9yIHByZXBlbmQgYSBidWlsdGlu
IGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+ID4+ICsgKiBsaW5lIHByb3ZpZGVkIGJ5IHRo
ZSBib290bG9hZGVyLiBLY29uZmlnIG9wdGlvbnMgY2FuIGJlIHVzZWQgdG8gYWx0ZXIKPiA+PiAr
ICogdGhlIGJlaGF2aW9yIG9mIHRoaXMgYnVpbHRpbiBjb21tYW5kIGxpbmUuCj4gPj4gKyAqIEBk
c3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJlcGVuZGVkIHN0cmlu
Zy4KPiA+PiArICogQHNyYzogVGhlIHN0YXJ0aW5nIHN0cmluZyBvciBOVUxMIGlmIHRoZXJlIGlz
bid0IG9uZS4KPiA+PiArICogQGxlbjogdGhlIGxlbmd0aCBvZiBkZXN0IGJ1ZmZlci4KPiA+PiAr
ICovCj4gPiAKPiA+IEFwcGVuZCBvciBwcmVwZW5kID8gQ2lzY28gcmVxdWlyZXMgYm90aCBhdCB0
aGUgc2FtZSB0aW1lLiBUaGlzIGlzIHdoeSBteQo+ID4gaW1wbGVtZW50YXRpb24gcHJvdmlkZXMg
Ym90aC4gSSBjYW4ndCB1c2UgdGhpcyB3aXRoIGJvdGggYXQgb25jZS4KPiAKPiBKdXN0IGFuIGlk
ZWE6IHdoYXQgYWJvdXQgZGVmaW5pbmcgQ01ETElORSBhcyBhIHBhdHRlcm4gd2hlcmUgZS5nLiAi
JCQiIG9yICIlJSIKPiBpcyByZXBsYWNlZCBieSB0aGUgYm9vdCBsb2FkZXIgY29tbWFuZCBsaW5l
Pwo+IAo+IFRoZW4geW91IGNhbiBmb3JtdWxhdGUgcmVwbGFjZSwgcHJlcGVuZCwgYXBwZW5kLCBw
cmVwZW5kK2FwcGVuZCB3aXRoIGEgc2luZ2xlCj4gQ09ORklHIHNldHRpbmcuCj4gCj4gSXQgbWF5
IGJlIGEgbGl0dGxlIG1vcmUgY29tcGxleCBpbiBjb2RlIChzY2FubmluZyBmb3IgdGhlIHBhdHRl
cm4gYW5kIHJlcGxhY2luZwo+IGl0IGFuZCB0YWtlIGNhcmUgdG8gdGVtcG9yYXJ5IG1lbW9yeSkg
YnV0IElNSE8gaXQgY291bGQgYmUgd29ydGggdG8gY29uc2lkZXIuCgpJbiBzb21lIGNhc2VzIHRo
aXMgY29kZSBjb3VsZCBiZSB1c2VkIGV4dHJlbWVseSBlYXJseSBpbiBib290IHVwLiBGb3IgZXhh
bXBsZSBpbiB0aGUKcHJvbV9pbml0LmMgcG93ZXJwYyBjb2RlLCBvciBpbiBlZmkgY2hhbmdlcy4g
VGhlIGZsZXhpYmlsaXR5IHRvIGZpbmQgYW5kIHJlcGxhY2UKbGlrZSB0aGF0IGlzIG5vdCBhbHdh
eXMgYW4gb3B0aW9uIGR1ZSB0byB0aGUgbmF0dXJlIG9mIHRoZSBlbnZpcm9ubWVudC4gSXQncyBu
b3QKaW1wb3NzaWJsZSBvZiBjb3Vyc2UuCgpEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

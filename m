Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9CC34B0E6
	for <lists+openrisc@lfdr.de>; Fri, 26 Mar 2021 21:52:25 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0756A212DD;
	Fri, 26 Mar 2021 21:52:25 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 20B11212A5
 for <openrisc@lists.librecores.org>; Fri, 26 Mar 2021 16:55:33 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6RQB6DtPz9v0Mx;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id fRfLPhr5ARx4; Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6RQB5JGZz9v0Mw;
 Fri, 26 Mar 2021 16:55:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354458B8CF;
 Fri, 26 Mar 2021 16:55:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id o-ftwDSIO1we; Fri, 26 Mar 2021 16:55:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 249F98B8C7;
 Fri, 26 Mar 2021 16:55:31 +0100 (CET)
To: Rob Herring <robh@kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <58834b01-aad5-fa1e-554e-6417b2357202@csgroup.eu>
Date: Fri, 26 Mar 2021 16:55:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Content-Language: fr
X-Mailman-Approved-At: Fri, 26 Mar 2021 21:51:57 +0100
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAyNi8wMy8yMDIxIMOgIDE2OjQyLCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgTWFyIDI2LCAyMDIxIGF0IDc6NDQgQU0gQ2hyaXN0b3BoZSBMZXJveQo+IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Pgo+PiBUaGlzIGNvZGUgcHJvdmlkZXMgYXJjaGl0
ZWN0dXJlcyB3aXRoIGEgd2F5IHRvIGJ1aWxkIGNvbW1hbmQgbGluZQo+PiBiYXNlZCBvbiB3aGF0
IGlzIGJ1aWx0IGluIHRoZSBrZXJuZWwgYW5kIHdoYXQgaXMgaGFuZGVkIG92ZXIgYnkgdGhlCj4+
IGJvb3Rsb2FkZXIsIGJhc2VkIG9uIHNlbGVjdGVkIGNvbXBpbGUtdGltZSBvcHRpb25zLgo+IAo+
IE5vdGUgdGhhdCBJIGhhdmUgdGhpcyBwYXRjaCBwZW5kaW5nOgo+IAo+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjEwMzE2
MTkzODIwLjMxMzctMS1hbGV4QGdoaXRpLmZyLwo+IAo+IEl0J3MgZ29pbmcgdG8gbmVlZCB0byBi
ZSBhZGFwdGVkIGZvciB0aGlzLiBJJ3ZlIGhlbGQgb2ZmIGFwcGx5aW5nIHRvCj4gc2VlIGlmIHRo
aXMgZ2V0cyBzZXR0bGVkLgoKZ29vZCBwb2ludC4KCkhvcGUgd2UgY2FuJ3QgaGF2ZSB0aGluZ3Mg
bGlrZQoKCW9wdGlvbj0iYmVhdXRpZnVsIHdlYXRoZXIiCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+
PiB2MzoKPj4gLSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4+IC0gQWRkZWQgY2FwYWJp
bGl0eSB0byBoYXZlIHNyYyA9PSBkc3QKPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9jbWRsaW5l
LmggfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvbGludXgvY21kbGluZS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Nt
ZGxpbmUuaCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCj4+IC0tLSAvZGV2L251bGwKPj4g
KysrIGIvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gQEAgLTAsMCArMSw1NyBAQAo+PiArLyog
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKyNpZm5kZWYgX0xJTlVYX0NN
RExJTkVfSAo+PiArI2RlZmluZSBfTElOVVhfQ01ETElORV9ICj4+ICsKPj4gKyNpbmNsdWRlIDxs
aW51eC9zdHJpbmcuaD4KPj4gKwo+PiArLyogQWxsb3cgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlk
ZSBzdHJsY2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNvIGVhcmx5ICovCj4+ICsjaWZu
ZGVmIGNtZGxpbmVfc3RybGNhdAo+PiArI2RlZmluZSBjbWRsaW5lX3N0cmxjYXQgc3RybGNhdAo+
PiArI2VuZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9y
IHByZXBlbmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+PiArICogbGlu
ZSBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2Vk
IHRvIGFsdGVyCj4+ICsgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNvbW1hbmQgbGlu
ZS4KPj4gKyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJl
cGVuZGVkIHN0cmluZy4KPj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBp
ZiB0aGVyZSBpc24ndCBvbmUuCj4+ICsgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRlc3QgYnVmZmVy
Lgo+PiArICovCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxk
KGNoYXIgKmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3QgbGVuKQo+PiArewo+PiArICAgICAg
IGlmICghbGVuIHx8IHNyYyA9PSBkc3QpCj4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4+ICsK
Pj4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkgfHwgIXNyYykg
ewo+PiArICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKyAgICAgICAgICAgICAgIGNtZGxp
bmVfc3RybGNhdChkc3QsIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIGlmIChkc3QgIT0gc3JjKQo+PiAr
ICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKwo+PiArICAgICAgIGlmIChJU19FTkFCTEVE
KENPTkZJR19DTURMSU5FX1BSRVBFTkQpKQo+PiArICAgICAgICAgICAgICAgY21kbGluZV9zdHJs
Y2F0KGRzdCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4pOwo+PiArCj4+ICsgICAgICAgY21kbGlu
ZV9zdHJsY2F0KGRzdCwgc3JjLCBsZW4pOwo+PiArCj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHX0NNRExJTkVfRVhURU5EKSkKPiAKPiBTaG91bGQgYmUgQVBQRU5ELgoKTm90IHlldC4g
Rm9yIHRoZSB0aW1lIGJlaW5nIGFsbCBhcmNoaXRlY3R1cmVzIHVzZSBFWFRFTkQgb25seS4KCklu
IHBhdGNoIDMgaXQgaXMgY2hhbmdlZCB0bzoKCi0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0NNRExJ
TkVfRVhURU5EKSkKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpIHx8IElT
X0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5EKSkKClRoZW4gaW4gbGFzdCBwYXRjaCwgSSBm
b3Jnb3QgYnV0IEkgc2hvdWxkIGhhdmUgZG9uZToKCi0JaWYgKElTX0VOQUJMRUQoQ09ORklHX0NN
RExJTkVfRVhURU5EKSB8fCBJU19FTkFCTEVEKENPTkZJR19DTURMSU5FX0FQUEVORCkpCisJaWYg
KElTX0VOQUJMRUQoQ09ORklHX0NNRExJTkVfQVBQRU5EKSkKCgo+IAo+PiArICAgICAgICAgICAg
ICAgY21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArfQo+
PiArCj4+ICsjZGVmaW5lIGNtZGxpbmVfYnVpbGQoZHN0LCBzcmMsIGxlbikgZG8geyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBQZXJoYXBzIGEgY29tbWVudCB3aHkgd2UgbmVl
ZCB0aGlzIHRvIGJlIGEgZGVmaW5lLgoKUHJvYmFibHkgd2UgZG9uJ3QgbmVlZCBhbnltb3JlIGFz
IEkgZmluYWxseSBkZWNpZGVkIHRvIHVzZSBDT01NQU5EX0xJTkVfU0laRSBpbnN0ZWFkIG9mICds
ZW4nIGFzIHRoZSAKc2l6ZSBvZiB0aGUgdGVtcG9yYXJ5IGJ1ZmZlci4KCj4gCj4+ICsgICAgICAg
Y2hhciAqX19jX2RzdCA9IChkc3QpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4gKyAgICAgICBjb25zdCBjaGFyICpfX2Nfc3JjID0gKHNyYyk7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAg
ICAgaWYgKF9fY19zcmMgPT0gX19jX2RzdCkgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgIHN0YXRpYyBjaGFyIF9fY190bXBbQ09NTUFO
RF9MSU5FX1NJWkVdIF9faW5pdGRhdGEgPSAiIjsgXAo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgICAgICAgICAgICBjbWRsaW5lX3N0cmxjYXQoX19jX3RtcCwgX19jX3NyYywgQ09NTUFORF9M
SU5FX1NJWkUpOyAgIFwKPj4gKyAgICAgICAgICAgICAgIF9fY21kbGluZV9idWlsZChfX2NfZHN0
LCBfX2NfdG1wLCAobGVuKSk7ICAgICAgICAgICAgICAgXAo+PiArICAgICAgIH0gZWxzZSB7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+
ICsgICAgICAgICAgICAgICBfX2NtZGxpbmVfYnVpbGQoX19jX2RzdCwgX19jX3NyYywgKGxlbikp
OyAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArfSB3aGlsZSAoMCkKPj4g
Kwo+PiArI2VuZGlmIC8qIF9MSU5VWF9DTURMSU5FX0ggKi8KPj4gLS0KPj4gMi4yNS4wCj4+CgpD
aHJpc3RvcGhlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRw
czovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

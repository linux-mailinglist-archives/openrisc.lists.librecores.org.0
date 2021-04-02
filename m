Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C56FA35325A
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:10 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8FE20212FB;
	Sat,  3 Apr 2021 06:19:09 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 34BB521300
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:23:33 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkN2601bz9v2lr;
 Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id omz2sWo61eF3; Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkN25477z9v2lh;
 Fri,  2 Apr 2021 17:23:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A7DF98BB7C;
 Fri,  2 Apr 2021 17:23:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uhizq2EL8v5n; Fri,  2 Apr 2021 17:23:32 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D75E8BB6F;
 Fri,  2 Apr 2021 17:23:31 +0200 (CEST)
To: Rob Herring <robh@kernel.org>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <53aa0b8c-4ee3-a6af-6fb8-2edc5cd79ea5@csgroup.eu>
Date: Fri, 2 Apr 2021 17:23:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Content-Language: fr
X-Mailman-Approved-At: Sat, 03 Apr 2021 06:18:46 +0200
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
aXMgZ2V0cyBzZXR0bGVkLgoKV2hlbiByZXdvcmtpbmcgRUZJLCBJIGZvdW5kIG91dCB0aGF0IHRo
ZXkgYXJlIGEgc2ltaWxhciBoYW5kbGluZywgd2hpY2ggaW4gYWRkaXRpb24gdGFrZXMgY2FyZSBv
ZiAKc3BhY2UgaW5zaWRlIHF1b3Rlcy4KCkkgYWRkZWQgc29tZXRoaW5nIHNpbWlsYXIgbm93IGlu
IGNtZGxpbmVfYnVpbGQoKSBmdW5jdGlvbi4KCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+PiB2MzoK
Pj4gLSBBZGRyZXNzZWQgY29tbWVudHMgZnJvbSBXaWxsCj4+IC0gQWRkZWQgY2FwYWJpbGl0eSB0
byBoYXZlIHNyYyA9PSBkc3QKPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9jbWRsaW5lLmggfCA1
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
bGludXgvY21kbGluZS5oCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2NtZGxpbmUu
aCBiL2luY2x1ZGUvbGludXgvY21kbGluZS5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uZGVhODdlZGQ0MWJlCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
aW5jbHVkZS9saW51eC9jbWRsaW5lLmgKPj4gQEAgLTAsMCArMSw1NyBAQAo+PiArLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKyNpZm5kZWYgX0xJTlVYX0NNRExJTkVf
SAo+PiArI2RlZmluZSBfTElOVVhfQ01ETElORV9ICj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9z
dHJpbmcuaD4KPj4gKwo+PiArLyogQWxsb3cgYXJjaGl0ZWN0dXJlcyB0byBvdmVycmlkZSBzdHJs
Y2F0LCBwb3dlcnBjIGNhbid0IHVzZSBzdHJpbmdzIHNvIGVhcmx5ICovCj4+ICsjaWZuZGVmIGNt
ZGxpbmVfc3RybGNhdAo+PiArI2RlZmluZSBjbWRsaW5lX3N0cmxjYXQgc3RybGNhdAo+PiArI2Vu
ZGlmCj4+ICsKPj4gKy8qCj4+ICsgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgYXBwZW5kIG9yIHByZXBl
bmQgYSBidWlsdGluIGNvbW1hbmQgbGluZSB0byB0aGUgY29tbWFuZAo+PiArICogbGluZSBwcm92
aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gS2NvbmZpZyBvcHRpb25zIGNhbiBiZSB1c2VkIHRvIGFs
dGVyCj4+ICsgKiB0aGUgYmVoYXZpb3Igb2YgdGhpcyBidWlsdGluIGNvbW1hbmQgbGluZS4KPj4g
KyAqIEBkc3Q6IFRoZSBkZXN0aW5hdGlvbiBvZiB0aGUgZmluYWwgYXBwZW5kZWQvcHJlcGVuZGVk
IHN0cmluZy4KPj4gKyAqIEBzcmM6IFRoZSBzdGFydGluZyBzdHJpbmcgb3IgTlVMTCBpZiB0aGVy
ZSBpc24ndCBvbmUuCj4+ICsgKiBAbGVuOiB0aGUgbGVuZ3RoIG9mIGRlc3QgYnVmZmVyLgo+PiAr
ICovCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19jbWRsaW5lX2J1aWxkKGNoYXIg
KmRzdCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3QgbGVuKQo+PiArewo+PiArICAgICAgIGlmICgh
bGVuIHx8IHNyYyA9PSBkc3QpCj4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4+ICsKPj4gKyAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9GT1JDRSkgfHwgIXNyYykgewo+PiAr
ICAgICAgICAgICAgICAgZHN0WzBdID0gMDsKPj4gKyAgICAgICAgICAgICAgIGNtZGxpbmVfc3Ry
bGNhdChkc3QsIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiArICAgICAgICAgICAgICAgcmV0dXJu
Owo+PiArICAgICAgIH0KPj4gKwo+PiArICAgICAgIGlmIChkc3QgIT0gc3JjKQo+PiArICAgICAg
ICAgICAgICAgZHN0WzBdID0gMDsKPj4gKwo+PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJ
R19DTURMSU5FX1BSRVBFTkQpKQo+PiArICAgICAgICAgICAgICAgY21kbGluZV9zdHJsY2F0KGRz
dCwgQ09ORklHX0NNRExJTkUgIiAiLCBsZW4pOwo+PiArCj4+ICsgICAgICAgY21kbGluZV9zdHJs
Y2F0KGRzdCwgc3JjLCBsZW4pOwo+PiArCj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklH
X0NNRExJTkVfRVhURU5EKSkKPiAKPiBTaG91bGQgYmUgQVBQRU5ELgo+IAo+PiArICAgICAgICAg
ICAgICAgY21kbGluZV9zdHJsY2F0KGRzdCwgIiAiIENPTkZJR19DTURMSU5FLCBsZW4pOwo+PiAr
fQo+PiArCj4+ICsjZGVmaW5lIGNtZGxpbmVfYnVpbGQoZHN0LCBzcmMsIGxlbikgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAKPiBQZXJoYXBzIGEgY29tbWVudCB3aHkgd2Ug
bmVlZCB0aGlzIHRvIGJlIGEgZGVmaW5lLgo+IAo+PiArICAgICAgIGNoYXIgKl9fY19kc3QgPSAo
ZHN0KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsgICAg
ICAgY29uc3QgY2hhciAqX19jX3NyYyA9IChzcmMpOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgIGlmIChfX2Nfc3JjID09
IF9fY19kc3QpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+ICsg
ICAgICAgICAgICAgICBzdGF0aWMgY2hhciBfX2NfdG1wW0NPTU1BTkRfTElORV9TSVpFXSBfX2lu
aXRkYXRhID0gIiI7IFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAgY21k
bGluZV9zdHJsY2F0KF9fY190bXAsIF9fY19zcmMsIENPTU1BTkRfTElORV9TSVpFKTsgICBcCj4+
ICsgICAgICAgICAgICAgICBfX2NtZGxpbmVfYnVpbGQoX19jX2RzdCwgX19jX3RtcCwgKGxlbikp
OyAgICAgICAgICAgICAgIFwKPj4gKyAgICAgICB9IGVsc2UgeyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+PiArICAgICAgICAgICAgICAg
X19jbWRsaW5lX2J1aWxkKF9fY19kc3QsIF9fY19zcmMsIChsZW4pKTsgICAgICAgICAgICAgICBc
Cj4+ICsgICAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPj4gK30gd2hpbGUgKDApCj4+ICsKPj4gKyNlbmRpZiAvKiBf
TElOVVhfQ01ETElORV9IICovCj4+IC0tCj4+IDIuMjUuMAo+PgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A957035325C
	for <lists+openrisc@lfdr.de>; Sat,  3 Apr 2021 06:19:19 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D145F212F1;
	Sat,  3 Apr 2021 06:19:17 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id A5FA121302
 for <openrisc@lists.librecores.org>; Fri,  2 Apr 2021 17:33:09 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkb71LDWz9v2m9;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3l8bzcUaAS9w; Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkb70P7lz9v2m7;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB14E8BB77;
 Fri,  2 Apr 2021 17:33:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9sXjhQ8q7Sww; Fri,  2 Apr 2021 17:33:08 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4BFB8BB6F;
 Fri,  2 Apr 2021 17:33:07 +0200 (CEST)
To: Daniel Walker <danielwa@cisco.com>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
 <20210330172714.GR109100@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9c74d82f-f58f-1ccb-bf22-8eb02a4cd55d@csgroup.eu>
Date: Fri, 2 Apr 2021 17:33:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330172714.GR109100@zorba>
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, will@kernel.org, linux-xtensa@linux-xtensa.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAzMC8wMy8yMDIxIMOgIDE5OjI3LCBEYW5pZWwgV2Fsa2VyIGEgw6ljcml0wqA6Cj4gT24g
RnJpLCBNYXIgMjYsIDIwMjEgYXQgMDE6NDQ6NDhQTSArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToKPj4gVGhpcyBjb2RlIHByb3ZpZGVzIGFyY2hpdGVjdHVyZXMgd2l0aCBhIHdheSB0byBi
dWlsZCBjb21tYW5kIGxpbmUKPj4gYmFzZWQgb24gd2hhdCBpcyBidWlsdCBpbiB0aGUga2VybmVs
IGFuZCB3aGF0IGlzIGhhbmRlZCBvdmVyIGJ5IHRoZQo+PiBib290bG9hZGVyLCBiYXNlZCBvbiBz
ZWxlY3RlZCBjb21waWxlLXRpbWUgb3B0aW9ucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pgo+PiAtLS0KPj4gdjM6Cj4+
IC0gQWRkcmVzc2VkIGNvbW1lbnRzIGZyb20gV2lsbAo+PiAtIEFkZGVkIGNhcGFiaWxpdHkgdG8g
aGF2ZSBzcmMgPT0gZHN0Cj4+IC0tLQo+PiAgIGluY2x1ZGUvbGludXgvY21kbGluZS5oIHwgNTcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgNTcgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xp
bnV4L2NtZGxpbmUuaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbWRsaW5lLmgg
Yi9pbmNsdWRlL2xpbnV4L2NtZGxpbmUuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmRlYTg3ZWRkNDFiZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvY21kbGluZS5oCj4+IEBAIC0wLDAgKzEsNTcgQEAKPj4gKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+ICsjaWZuZGVmIF9MSU5VWF9DTURMSU5FX0gK
Pj4gKyNkZWZpbmUgX0xJTlVYX0NNRExJTkVfSAo+PiArCj4+ICsjaW5jbHVkZSA8bGludXgvc3Ry
aW5nLmg+Cj4+ICsKPj4gKy8qIEFsbG93IGFyY2hpdGVjdHVyZXMgdG8gb3ZlcnJpZGUgc3RybGNh
dCwgcG93ZXJwYyBjYW4ndCB1c2Ugc3RyaW5ncyBzbyBlYXJseSAqLwo+PiArI2lmbmRlZiBjbWRs
aW5lX3N0cmxjYXQKPj4gKyNkZWZpbmUgY21kbGluZV9zdHJsY2F0IHN0cmxjYXQKPj4gKyNlbmRp
Zgo+PiArCj4+ICsvKgo+PiArICogVGhpcyBmdW5jdGlvbiB3aWxsIGFwcGVuZCBvciBwcmVwZW5k
IGEgYnVpbHRpbiBjb21tYW5kIGxpbmUgdG8gdGhlIGNvbW1hbmQKPj4gKyAqIGxpbmUgcHJvdmlk
ZWQgYnkgdGhlIGJvb3Rsb2FkZXIuIEtjb25maWcgb3B0aW9ucyBjYW4gYmUgdXNlZCB0byBhbHRl
cgo+PiArICogdGhlIGJlaGF2aW9yIG9mIHRoaXMgYnVpbHRpbiBjb21tYW5kIGxpbmUuCj4+ICsg
KiBAZHN0OiBUaGUgZGVzdGluYXRpb24gb2YgdGhlIGZpbmFsIGFwcGVuZGVkL3ByZXBlbmRlZCBz
dHJpbmcuCj4+ICsgKiBAc3JjOiBUaGUgc3RhcnRpbmcgc3RyaW5nIG9yIE5VTEwgaWYgdGhlcmUg
aXNuJ3Qgb25lLgo+PiArICogQGxlbjogdGhlIGxlbmd0aCBvZiBkZXN0IGJ1ZmZlci4KPj4gKyAq
Lwo+IAo+IEFwcGVuZCBvciBwcmVwZW5kID8gQ2lzY28gcmVxdWlyZXMgYm90aCBhdCB0aGUgc2Ft
ZSB0aW1lLiBUaGlzIGlzIHdoeSBteQo+IGltcGxlbWVudGF0aW9uIHByb3ZpZGVzIGJvdGguIEkg
Y2FuJ3QgdXNlIHRoaXMgd2l0aCBib3RoIGF0IG9uY2UuCj4gCgpJIHRoaW5rIGl0IGNhbiBiZSBh
ZGRlZCBhcyBhIHNlY29uZCBzdGVwIGlmIGRpbW1lZCBuZWNlc3NhcnkuIFRoZSBmZWVsaW5nIEkg
aGF2ZSBmcm9tIGFsbCB0aGUgCmRpc2N1c3Npb24gaXMgdGhhdCBpdCdzIG5vdCB3aGF0IHBlb3Bs
ZSBmcm9tIHRoZSBjb21tdW5pdHkgYXJlIGxvb2tpbmcgZm9yIGF0IHRoZSBtb21lbnQuCgpBbnl3
YXksIG9uY2UgYWxsIGFyY2hpdGVjdHVyZXMgYXJlIG1vdmVkIHRvIGdlbmVyaWMgaGFuZGxpbmcs
IEkgYmVsaWV2ZSBpdCBpcyB0aGVuIGVhc2llciB0byBzcGxpdCAKQ09ORklHX0NNRExJTkUgaW4g
dHdvIGNvbmZpZ3VyYXRpb24gaXRlbXMgaW4gb3JkZXIgdG8gcHJvdmlkZSBib3RoIGFwcGVuZGlu
ZyBhbmQgcHJlcGVuZGluZyBhdCB0aGUgCnNhbWUgdGltZS4KCkkgc2VlIHNvbWUgY29uY2VybnMg
YWJvdXQgcmlzayBvZiBkb3VibGUgY2hhbmdlcywgYnV0IEkgaGF2ZSBmb2N1c3NlZCBpbiBjaGFu
Z2luZyBhcyBsaXR0bGUgYXMgCnBvc3NpYmxlIHRoZSBleGlzdGluZyBjb25maWd1cmF0aW9uIGl0
ZW1zLCBpbiBvcmRlciB0byBtaW5pbWlzZSB0aGF0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E763D359BD2
	for <lists+openrisc@lfdr.de>; Fri,  9 Apr 2021 12:20:57 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 48B1B212CF;
	Fri,  9 Apr 2021 12:20:57 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 55337200E4
 for <openrisc@lists.librecores.org>; Fri,  9 Apr 2021 12:20:55 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGvKd22R6z9vBmN;
 Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id U6kaT8vyPDk2; Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGvKd0qpkz9vBmM;
 Fri,  9 Apr 2021 12:20:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 449288B7E3;
 Fri,  9 Apr 2021 12:20:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 20mYPqZcSrF8; Fri,  9 Apr 2021 12:20:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0866D8B7E1;
 Fri,  9 Apr 2021 12:20:52 +0200 (CEST)
To: Rob Herring <robh@kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <ab0fd4477964cdbf99e3dd2965a455aa3e738e4b.1617375802.git.christophe.leroy@csgroup.eu>
 <20210408194148.GB1724284@robh.at.kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <834c4850-5541-b5c2-0b7b-d7d960ab2629@csgroup.eu>
Date: Fri, 9 Apr 2021 12:20:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408194148.GB1724284@robh.at.kernel.org>
Content-Language: fr
Subject: Re: [OpenRISC] [PATCH v4 18/20] x86: Convert to GENERIC_CMDLINE
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 danielwa@cisco.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAwOC8wNC8yMDIxIMOgIDIxOjQxLCBSb2IgSGVycmluZyBhIMOpY3JpdMKgOgo+IE9uIEZy
aSwgQXByIDAyLCAyMDIxIGF0IDAzOjE4OjIwUE0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6Cj4+IFRoaXMgY29udmVydHMgdGhlIGFyY2hpdGVjdHVyZSB0byBHRU5FUklDX0NNRExJTkUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldT4KPj4gLS0tCj4+ICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgfCA0NSArKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGFyY2gveDg2L2tlcm5l
bC9zZXR1cC5jIHwgMTcgKystLS0tLS0tLS0tLS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4+IGluZGV4IGEyMDY4NGQ1NmI0Yi4uNjZiMzg0
MjI4Y2EzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+ICsrKyBiL2FyY2gveDg2
L0tjb25maWcKPj4gQEAgLTEwNCw2ICsxMDQsNyBAQCBjb25maWcgWDg2Cj4+ICAgCXNlbGVjdCBB
UkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCj4+ICAgCXNlbGVjdCBBUkNIX1VTRV9TWU1fQU5OT1RB
VElPTlMKPj4gICAJc2VsZWN0IEFSQ0hfV0FOVF9CQVRDSEVEX1VOTUFQX1RMQl9GTFVTSAo+PiAr
CXNlbGVjdCBBUkNIX1dBTlRfQ01ETElORV9QUkVQRU5EX0JZX0RFRkFVTFQKPiAKPiBTZWVtcyB0
byBiZSBub24tZXhpc3RlbnQga2NvbmZpZyBvcHRpb24uCgpPb3BzLiBBZGRlZCBpbiB2NS4KCj4+
IEBAIC04ODMsMTggKzg4MSw3IEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxp
bmVfcCkKPj4gICAJYnNzX3Jlc291cmNlLnN0YXJ0ID0gX19wYV9zeW1ib2woX19ic3Nfc3RhcnQp
Owo+PiAgIAlic3NfcmVzb3VyY2UuZW5kID0gX19wYV9zeW1ib2woX19ic3Nfc3RvcCktMTsKPj4g
ICAKPj4gLSNpZmRlZiBDT05GSUdfQ01ETElORV9CT09MCj4+IC0jaWZkZWYgQ09ORklHX0NNRExJ
TkVfRk9SQ0UKPj4gLQlzdHJsY3B5KGJvb3RfY29tbWFuZF9saW5lLCBidWlsdGluX2NtZGxpbmUs
IENPTU1BTkRfTElORV9TSVpFKTsKPj4gLSNlbHNlCj4+IC0JaWYgKGJ1aWx0aW5fY21kbGluZVsw
XSkgewo+PiAtCQkvKiBhcHBlbmQgYm9vdCBsb2FkZXIgY21kbGluZSB0byBidWlsdGluICovCj4+
IC0JCXN0cmxjYXQoYnVpbHRpbl9jbWRsaW5lLCAiICIsIENPTU1BTkRfTElORV9TSVpFKTsKPj4g
LQkJc3RybGNhdChidWlsdGluX2NtZGxpbmUsIGJvb3RfY29tbWFuZF9saW5lLCBDT01NQU5EX0xJ
TkVfU0laRSk7Cj4+IC0JCXN0cmxjcHkoYm9vdF9jb21tYW5kX2xpbmUsIGJ1aWx0aW5fY21kbGlu
ZSwgQ09NTUFORF9MSU5FX1NJWkUpOwo+PiAtCX0KPj4gLSNlbmRpZgo+PiAtI2VuZGlmCj4+ICsJ
Y21kbGluZV9idWlsZChib290X2NvbW1hbmRfbGluZSwgYm9vdF9jb21tYW5kX2xpbmUpOwo+PiAg
IAo+PiAgIAlzdHJsY3B5KGNvbW1hbmRfbGluZSwgYm9vdF9jb21tYW5kX2xpbmUsIENPTU1BTkRf
TElORV9TSVpFKTsKPj4gICAJKmNtZGxpbmVfcCA9IGNvbW1hbmRfbGluZTsKPiAKPiBPbmNlIHRo
aXMgaXMgYWxsIGRvbmUsIEkgd29uZGVyIGlmIHdlIGNhbiBnZXQgcmlkIG9mIHRoZSBzdHJsY3B5
IGFuZAo+IHBlcmhhcHMgYWxzbyBjbWRsaW5lX3AuCj4gCgpJdCBzZWVtcyByYXRoZXIgY29tcGxp
Y2F0ZWQsIGluIGluaXQvbWFpbi5jIHlvdSBoYXZlIGhlYXZ5IG1hbmlwdWxhdGlvbnMgb2YgY29t
bWFuZCBsaW5lcyB3aGljaCAKc2VlbXMgdG8gYmUgZG9uZSBpbiBzZXR1cF9jb21tYW5kX2xpbmUo
KSB3aGljaCBzZWVtcyB0byBhZGQgc3R1ZmYgaW4gZnJvbnQgb2YgY29tbWFuZCBsaW5lcywgYXQg
dGhlIAplbmQgd2UgZW5kIHVwIHdpdGggc2V2ZXJhbCBjb21tYW5kIGxpbmVzOgoKLyogVW50b3Vj
aGVkIHNhdmVkIGNvbW1hbmQgbGluZSAoZWcuIGZvciAvcHJvYykgKi8KY2hhciAqc2F2ZWRfY29t
bWFuZF9saW5lOwovKiBDb21tYW5kIGxpbmUgZm9yIHBhcmFtZXRlciBwYXJzaW5nICovCnN0YXRp
YyBjaGFyICpzdGF0aWNfY29tbWFuZF9saW5lOwovKiBVbnRvdWNoZWQgZXh0cmEgY29tbWFuZCBs
aW5lICovCnN0YXRpYyBjaGFyICpleHRyYV9jb21tYW5kX2xpbmU7CgpTb21lIG9mIHRoZW0gY29t
ZSBmcm9tIHRoZSBjbWRsaW5lX3Agd2hpY2ggb3RoZXJzIGFyZSBmcm9tIGJvb3RfY29tbWFuZF9s
aW5lLgoKSSB0aGluayBhIGNsZWFudXAgb24gYWxsIHRoYXQgc3R1ZmYgd291bGQgYmUgd29ydGgg
aXQgYXMgYSBmdXJ0aGVyIHN0ZXAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

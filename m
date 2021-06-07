Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E36E239D471
	for <lists+openrisc@lfdr.de>; Mon,  7 Jun 2021 07:48:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A093D20305;
	Mon,  7 Jun 2021 07:48:59 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 5526520305
 for <openrisc@lists.librecores.org>; Mon,  7 Jun 2021 07:48:57 +0200 (CEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fz2Vc3ZsszB9cJ;
 Mon,  7 Jun 2021 07:48:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyaOJDm2hiAi; Mon,  7 Jun 2021 07:48:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fz2Vc2XHVzB9Zm;
 Mon,  7 Jun 2021 07:48:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 436848B77F;
 Mon,  7 Jun 2021 07:48:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KgJWM97gaIvs; Mon,  7 Jun 2021 07:48:56 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E86C38B763;
 Mon,  7 Jun 2021 07:48:55 +0200 (CEST)
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Mike Rapoport <rppt@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
Date: Mon, 7 Jun 2021 07:48:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
Content-Language: fr
Subject: Re: [OpenRISC] [PATCH v2 00/15] init_mm: cleanup ARCH's
 text/data/brk setup code
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

SGkgS2VmZW5nLAoKTGUgMDcvMDYvMjAyMSDDoCAwMjo1NSwgS2VmZW5nIFdhbmcgYSDDqWNyaXTC
oDoKPiAKPiBPbiAyMDIxLzYvNyA1OjI5LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+PiBIZWxsbyBL
ZWZlbmcsCj4+Cj4+IE9uIEZyaSwgSnVuIDA0LCAyMDIxIGF0IDAzOjA2OjE4UE0gKzA4MDAsIEtl
ZmVuZyBXYW5nIHdyb3RlOgo+Pj4gQWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciwg
dGhlbiB1c2UgaXQKPj4+IHRvIGNsZWFudXAgdGhlIHRleHQsIGRhdGEgYW5kIGJyayBzZXR1cCBj
b2RlLgo+Pj4KPj4+IHYyOgo+Pj4gLSBjaGFuZ2UgYXJndW1lbnQgZnJvbSAiY2hhciAqIiB0byAi
dm9pZCAqIiBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4gwqDCoCBzdWdnZXN0ZWQgYnkgR2Vl
cnQgVXl0dGVyaG9ldmVuCj4+PiAtIHVzZSBOVUxMIGluc3RlYWQgb2YgKHZvaWQgKikwIG9uIGg4
MzAwIGFuZCBtNjhrCj4+PiAtIGNvbGxlY3QgQUNLcwo+Pj4KPj4+IENjOiBsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4+PiBDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiB1Y2xp
bnV4LWg4LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLmpwCj4+PiBDYzogbGludXgtbTY4a0BsaXN0
cy5saW51eC1tNjhrLm9yZwo+Pj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4+
PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPj4+IENjOiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+PiBD
YzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPj4+IEtlZmVuZyBXYW5nICgxNSk6Cj4+PiDC
oMKgIG1tOiBhZGQgc2V0dXBfaW5pdGlhbF9pbml0X21tKCkgaGVscGVyCj4+PiDCoMKgIGFyYzog
Y29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4gwqDCoCBhcm06IGNvbnZlcnQg
dG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+IMKgwqAgYXJtNjQ6IGNvbnZlcnQgdG8gc2V0
dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+IMKgwqAgY3NreTogY29udmVydCB0byBzZXR1cF9pbml0
aWFsX2luaXRfbW0oKQo+Pj4gwqDCoCBoODMwMDogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2lu
aXRfbW0oKQo+Pj4gwqDCoCBtNjhrOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgp
Cj4+PiDCoMKgIG5kczMyOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+PiDC
oMKgIG5pb3MyOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+PiDCoMKgIG9w
ZW5yaXNjOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+PiDCoMKgIHBvd2Vy
cGM6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+IMKgwqAgcmlzY3Y6IGNv
bnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+IMKgwqAgczM5MDogY29udmVydCB0
byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4gwqDCoCBzaDogY29udmVydCB0byBzZXR1cF9p
bml0aWFsX2luaXRfbW0oKQo+Pj4gwqDCoCB4ODY6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9p
bml0X21tKCkKPj4gSSBtaWdodCBiZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEFGQUlVIHRoZSBp
bml0X21tLnN0YXJ0X2NvZGUgYW5kIG90aGVyCj4+IGZpZWxkcyBhcmUgbm90IHVzZWQgcmVhbGx5
IGVhcmx5IHNvIHRoZSBuZXcgc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4gZnVuY3Rpb24gY2Fu
IGJlIGNhbGxlZCBpbiB0aGUgZ2VuZXJpYyBjb2RlIG91dHNpZGUgc2V0dXBfYXJjaCgpLCBlLmcg
aW4KPj4gbW1faW5pdCgpLgo+IAo+IEhpIE1pa2XvvIwgZWFjaCBhcmNoaXRlY3R1cmUgaGFzIHRo
ZWlyIG93biB2YWx1ZSwgbm90IHRoZSBzYW1lLCBlZyBtNjhLIGFuZAo+IAo+IGg4MzAwLCBhbHNv
IHRoZSBuYW1lIG9mIHRoZSB0ZXh0L2NvZGUvYnJrIGlzIGRpZmZlcmVudCBpbiBzb21lIGFyY2gs
IHNvIEkga2VlcAo+IAo+IHVuY2hhbmdlZC4KCldoYXQgeW91IGNvdWxkIGRvIGlzIHRvIGRlZmlu
ZSBhIF9fd2VhayBmdW5jdGlvbiB0aGF0IGFyY2hpdGVjdHVyZXMgY2FuIG92ZXJyaWRlIGFuZCBj
YWxsIHRoYXQgCmZ1bmN0aW9uIGZyb20gbW1faW5pdCgpIGFzIHN1Z2dlc3RlZCBieSBNaWtlLAoK
U29tZXRoaW5nIGxpa2U6Cgp2b2lkIF9fd2VhayBzZXR1cF9pbml0aWFsX2luaXRfbW0odm9pZCkK
ewoJaW5pdF9tbS5zdGFydF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpX3N0ZXh0OwoJaW5pdF9tbS5l
bmRfY29kZSA9ICh1bnNpZ25lZCBsb25nKV9ldGV4dDsKCWluaXRfbW0uZW5kX2RhdGEgPSAodW5z
aWduZWQgbG9uZylfZWRhdGE7Cglpbml0X21tLmJyayA9ICh1bnNpZ25lZCBsb25nKV9lbmQ7Cn0K
ClRoZW4gb25seSB0aGUgZmV3IGFyY2hpdGVjdHVyZSB0aGF0IGFyZSBkaWZmZXJlbnQgd291bGQg
b3ZlcnJpZGUgaXQuCgpJIHNlZSBhIGZldyBhcmNoaWN0ZWN0dXJlcyBhcmUgdXNpZ25lIFBBR0Vf
T0ZGU0VUIHRvIHNldCAuc3RhcnRfY29kZSwgYnV0IGl0IGlzIGxpa2VseSB0aGF0IHRoaXMgaXMg
CmVxdWl2YWxlbnQgdG8gX3N0ZXh0LgoKQ2hyaXN0b3BoZQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

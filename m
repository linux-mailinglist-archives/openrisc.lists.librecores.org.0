Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9D335ECE7
	for <lists+openrisc@lfdr.de>; Wed, 14 Apr 2021 08:10:54 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 04D2B20EC9;
	Wed, 14 Apr 2021 08:10:54 +0200 (CEST)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id 7FDA9202FE
 for <openrisc@lists.librecores.org>; Wed, 14 Apr 2021 08:10:52 +0200 (CEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKsXp6CPzzB09bD;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bgEX-Y99N3ka; Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKsXp513xzB09bB;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F6CC8B7B6;
 Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8t_hMitD6rsU; Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62A328B75F;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
 <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec7bbb30-dbbd-197b-4d65-eb3600fe6413@csgroup.eu>
Date: Wed, 14 Apr 2021 08:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
Content-Language: fr
Subject: Re: [OpenRISC] [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAxNC8wNC8yMDIxIMOgIDA3OjU5LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDQvMTQvMjEgMTA6NTIgQU0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+
Cj4+IExlIDE0LzA0LzIwMjEgw6AgMDQ6NTQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
Cj4+PiBDdXJyZW50bHkgbW9zdCBwbGF0Zm9ybXMgZGVmaW5lIEZJUlNUX1VTRVJfQUREUkVTUyBh
cyAwVUwgZHVwbGljYXRpbmcgdGhlCj4+PiBzYW1lIGNvZGUgYWxsIG92ZXIuIEluc3RlYWQgZGVm
aW5lIGEgbmV3IG9wdGlvbiBBUkNIX0hBU19GSVJTVF9VU0VSX0FERFJFU1MKPj4+IGZvciB0aG9z
ZSBwbGF0Zm9ybXMgd2hpY2ggd291bGQgb3ZlcnJpZGUgZ2VuZXJpYyBkZWZhdWx0IEZJUlNUX1VT
RVJfQUREUkVTUwo+Pj4gdmFsdWUgMFVMLiBUaGlzIG1ha2VzIGl0IG11Y2ggY2xlYW5lciB3aXRo
IHJlZHVjZWQgY29kZS4KPj4+Cj4+PiBDYzogbGludXgtYWxwaGFAdmdlci5rZXJuZWwub3JnCj4+
PiBDYzogbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJu
ZWwub3JnCj4+PiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiBsaW51
eC1pYTY0QHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4
ay5vcmcKPj4+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnCj4+PiBDYzogbGludXgtcGFyaXNjQHZnZXIua2VybmVsLm9y
Zwo+Pj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4+PiBDYzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3Jn
Cj4+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+PiBDYzogc3BhcmNsaW51eEB2Z2Vy
Lmtlcm5lbC5vcmcKPj4+IENjOiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzog
bGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKPj4+IENjOiB4ODZAa2VybmVsLm9yZwo+Pj4g
Q2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+Pj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKPj4+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVh
bEBhcm0uY29tPgo+Pj4gLS0tCj4+PiAgwqAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL2FyYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNiAtLS0tLS0KPj4+
ICDCoCBhcmNoL2FybS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4+ICDCoCBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+ICDCoCBhcmNoL2Nz
a3kvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0K
Pj4+ICDCoCBhcmNoL2hleGFnb24vaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAzIC0tLQo+Pj4gIMKgIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGFyY2gvbTY4ay9pbmNsdWRlL2Fz
bS9wZ3RhYmxlX21tLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGFyY2gvbWlj
cm9ibGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+ICDC
oCBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS0zMi5owqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxIC0KPj4+ICDCoCBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5owqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL25kczMyL0tjb25maWfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4+PiAgwqAgYXJj
aC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAy
IC0tCj4+PiAgwqAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4gIMKgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvcGd0YWJsZS5owqDCoMKgIHwgMSAtCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmggfCAxIC0KPj4+ICDCoCBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaCB8IDIgLS0KPj4+ICDCoCBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+
ICDCoCBhcmNoL3MzOTAvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyIC0tCj4+PiAgwqAgYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+PiAgwqAgYXJjaC9zcGFyYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlXzMyLmjCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3Nw
YXJjL2luY2x1ZGUvYXNtL3BndGFibGVfNjQuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgLS0tCj4+
PiAgwqAgYXJjaC91bS9pbmNsdWRlL2FzbS9wZ3RhYmxlLTJsZXZlbC5owqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+Pj4gIMKgIGFyY2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaMKgwqDC
oMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlX3R5
cGVzLmjCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4gIMKgIGFyY2gveHRlbnNhL2luY2x1ZGUv
YXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRl
L2xpbnV4L21tLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNCArKysrCj4+PiAgwqAgbW0vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrCj4+
PiAgwqAgMjkgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgv
bW0uaAo+Pj4gaW5kZXggOGJhNDM0Mjg3Mzg3Li40NzA5OGNjZDcxNWUgMTAwNjQ0Cj4+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L21tLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+Pj4gQEAg
LTQ2LDYgKzQ2LDEwIEBAIGV4dGVybiBpbnQgc3lzY3RsX3BhZ2VfbG9ja191bmZhaXJuZXNzOwo+
Pj4gIMKgIMKgIHZvaWQgaW5pdF9tbV9pbnRlcm5hbHModm9pZCk7Cj4+PiAgwqAgKyNpZm5kZWYg
QVJDSF9IQVNfRklSU1RfVVNFUl9BRERSRVNTCj4+Cj4+IEkgZ3Vlc3MgeW91IGRpZG4ndCB0ZXN0
IGl0IC4uLi4uIDopCj4gCj4gSW4gZmFjdCBJIGRpZCA6KSBUaG91Z2gganVzdCBib290ZWQgaXQg
b24gYXJtNjQgYW5kIGNyb3NzIGNvbXBpbGVkIG9uCj4gbXVsdGlwbGUgb3RoZXJzIHBsYXRmb3Jt
cy4KPiAKPj4KPj4gc2hvdWxkIGJlICNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX0ZJUlNUX1VTRVJf
QUREUkVTUwo+IAo+IFJpZ2h0LCBtZWFudCB0aGF0IGluc3RlYWQuCj4gCj4+Cj4+PiArI2RlZmlu
ZSBGSVJTVF9VU0VSX0FERFJFU1PCoMKgwqAgMFVMCj4+PiArI2VuZGlmCj4+Cj4+IEJ1dCB3aHkg
ZG8gd2UgbmVlZCBhIGNvbmZpZyBvcHRpb24gYXQgYWxsIGZvciB0aGF0ID8KPj4KPj4gV2h5IG5v
dCBqdXN0Ogo+Pgo+PiAjaWZuZGVmIEZJUlNUX1VTRVJfQUREUkVTUwo+PiAjZGVmaW5lIEZJUlNU
X1VTRVJfQUREUkVTU8KgwqDCoCAwVUwKPj4gI2VuZGlmCj4gCj4gVGhpcyBzb3VuZHMgc2ltcGxl
ci4gQnV0IGp1c3Qgd29uZGVyaW5nLCB3b3VsZCBub3QgdGhlcmUgYmUgYW55IHBvc3NpYmlsaXR5
Cj4gb2YgYnVpbGQgcHJvYmxlbXMgZHVlIHRvIGNvbXBpbGF0aW9uIHNlcXVlbmNlIGJldHdlZW4g
YXJjaCBhbmQgZ2VuZXJpYyBjb2RlID8KPiAKCkZvciBzdXJlIGl0IGhhcyB0byBiZSBhZGRyZXNz
ZXMgY2FyZWZ1bGx5LCBidXQgdGhlcmUgYXJlIGFscmVhZHkgYSBsb3Qgb2Ygc3R1ZmYgbGlrZSB0
aGF0IGFyb3VuZCAKcGd0YWJsZXMuaAoKRm9yIGluc3RhbmNlLCBwdGVfb2Zmc2V0X2tlcm5lbCgp
IGhhcyBhIGdlbmVyaWMgZGVmaW5pdGlvbiBpbiBsaW51eC9wZ3RhYmxlcy5oIGJhc2VkIG9uIHdo
ZXRoZXIgaXQgCmlzIGFscmVhZHkgZGVmaW5lZCBvciBub3QuCgpUYWtpbmcgaW50byBhY2NvdW50
IHRoYXQgRklSU1RfVVNFUl9BRERSRVNTIGlzIHRvZGF5IGluIHRoZSBhcmNoaXRlY3R1cmVzJ3Mg
YXNtL3BndGFibGVzLmgsIEkgdGhpbmsgCnB1dHRpbmcgdGhlIGZhbGxiYWNrIGRlZmluaXRpb24g
aW4gbGludXgvcGd0YWJsZS5oIHdvdWxkIGRvIHRoZSB0cmljay4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

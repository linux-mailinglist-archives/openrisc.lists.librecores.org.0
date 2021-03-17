Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2248233EA1F
	for <lists+openrisc@lfdr.de>; Wed, 17 Mar 2021 07:54:52 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 86B2621252;
	Wed, 17 Mar 2021 07:54:50 +0100 (CET)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by mail.librecores.org (Postfix) with ESMTPS id 573A92013F
 for <openrisc@lists.librecores.org>; Wed, 17 Mar 2021 06:58:09 +0100 (CET)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0fXm6M3nz17M4p;
 Wed, 17 Mar 2021 13:56:08 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 13:57:58 +0800
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <fef8ca3b-97ae-5c19-69ea-bb1dfe88cf9c@huawei.com>
Date: Wed, 17 Mar 2021 13:57:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 17 Mar 2021 07:54:48 +0100
Subject: Re: [OpenRISC] [PATCH v2] mm: Move mem_init_print_info() into
 mm_init()
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDIwMjEvMy8xNyAxMzo0OCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPgo+Cj4gTGUgMTcv
MDMvMjAyMSDDoCAwMjo1MiwgS2VmZW5nIFdhbmcgYSDDqWNyaXTCoDoKPj4gbWVtX2luaXRfcHJp
bnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVhY2ggYXJjaGl0ZWN0dXJlLAo+
PiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBzbyB1c2luZyB2b2lkIGFyZ3VtZW50IGFuZCBtb3Zl
IGl0IGludG8gCj4+IG1tX2luaXQoKS4KPj4KPj4gQWNrZWQtYnk6IERhdmUgSGFuc2VuIDxkYXZl
LmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IHYyOgo+PiAtIENsZWFudXAgJ3N0
cicgbGluZSBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoZSBhbmQgQUNLCj4+Cj4+IMKgIGFyY2gvYWxw
aGEvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9h
cmMvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+IMKgIGFy
Y2gvYXJtL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0KPj4g
wqAgYXJjaC9hcm02NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0K
Pj4gwqAgYXJjaC9jc2t5L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAx
IC0KPj4gwqAgYXJjaC9oODMwMC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgLS0KPj4gwqAgYXJjaC9oZXhhZ29uL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxIC0KPj4gwqAgYXJjaC9pYTY0L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxIC0KPj4gwqAgYXJjaC9tNjhrL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9taWNyb2JsYXplL21tL2luaXQuY8KgwqDCoMKgwqDCoMKg
IHzCoCAxIC0KPj4gwqAgYXJjaC9taXBzL2xvb25nc29uNjQvbnVtYS5jwqDCoMKgwqDCoCB8wqAg
MSAtCj4+IMKgIGFyY2gvbWlwcy9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMSAtCj4+IMKgIGFyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIHzCoCAxIC0KPj4g
wqAgYXJjaC9uZHMzMi9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+
PiDCoCBhcmNoL25pb3MyL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAt
Cj4+IMKgIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0t
Cj4+IMKgIGFyY2gvcGFyaXNjL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
LS0KPj4gwqAgYXJjaC9wb3dlcnBjL21tL21lbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MSAtCj4+IMKgIGFyY2gvcmlzY3YvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxIC0KPj4gwqAgYXJjaC9zMzkwL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAyIC0tCj4+IMKgIGFyY2gvc2gvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0XzMyLmPCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgLS0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0XzY0LmPCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEgLQo+PiDCoCBhcmNoL3VtL2tlcm5lbC9tZW0uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMSAtCj4+IMKgIGFyY2gveDg2L21tL2luaXRfMzIuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDIgLS0KPj4gwqAgYXJjaC94ODYvbW0vaW5pdF82NC5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMiAtLQo+PiDCoCBhcmNoL3h0ZW5zYS9tbS9pbml0LmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxIC0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBpbml0L21haW4uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIG1tL3BhZ2VfYWxsb2Mu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKy0tLS0tCj4+IMKg
IDMwIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4+Cj4K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+
PiBpbmRleCA4OTMxNDY1MWRkNjIuLmMyZTBiMzQ5NWM1YSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9tbS5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+PiBAQCAtMjM3Myw3ICsy
MzczLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZnJlZV9yZXNlcnZlZF9hcmVhKHZvaWQgCj4+
ICpzdGFydCwgdm9pZCAqZW5kLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IHBvaXNvbiwgY29uc3QgY2hhciAqcyk7Cj4+IMKgIMKgIGV4dGVybiB2b2lk
IGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQoc3RydWN0IHBhZ2UgKnBhZ2UsIGxvbmcgCj4+IGNv
dW50KTsKPj4gLWV4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8oY29uc3QgY2hhciAqc3Ry
KTsKPj4gK2V4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8odm9pZCk7Cj4KPiBTb3JyeSBJ
IGRpZG4ndCBzZWUgdGhhdCBpbiBwcmV2aW91cyBwYXRjaC4KPgo+ICdleHRlcm4nIGtleXdvcmQg
aXMgcG9pbnRsZXNzIGZvciBmdW5jdGlvbiBwcm90b3R5cGVzIGFuZCBpcyAKPiBkZXByZWNhdGVk
LCB5b3Ugc2hvdWxkIHJlbW92ZSBpdC4KPgo+IFRoYXQgc2FpZCwKPgo+IFJldmlld2VkLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gIyBmb2N1c3NlZCBvbiAK
PiBwb3dlcnBjClRoYW5rcywgbGV0J3Mgd2FpdCBmb3IgbW9yZSBmZWVkYmFjayBmcm9tIG90aGVy
IGFyY2hpdGVjdHVyZXMsIGlmIApuZWNlc3NhcnkswqAgd2lsbCBzZW5kIGEgbmV3IG9uZS4KPgo+
PiDCoCDCoCBleHRlcm4gdm9pZCByZXNlcnZlX2Jvb3RtZW1fcmVnaW9uKHBoeXNfYWRkcl90IHN0
YXJ0LCBwaHlzX2FkZHJfdCAKPj4gZW5kKTsKPiAuCj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

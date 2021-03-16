Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA8D533DFC3
	for <lists+openrisc@lfdr.de>; Tue, 16 Mar 2021 22:04:58 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9743121251;
	Tue, 16 Mar 2021 22:04:57 +0100 (CET)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mail.librecores.org (Postfix) with ESMTPS id 3B0522111C
 for <openrisc@lists.librecores.org>; Tue, 16 Mar 2021 16:04:09 +0100 (CET)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F0GjJ5s2vz8ydQ;
 Tue, 16 Mar 2021 23:02:12 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 23:04:03 +0800
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20210316142637.92193-1-wangkefeng.wang@huawei.com>
 <26cca1c0-bd38-3d5b-5ca4-44081c444396@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <c4bac0d9-d61f-afcd-0ea1-d8bc65993706@huawei.com>
Date: Tue, 16 Mar 2021 23:04:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <26cca1c0-bd38-3d5b-5ca4-44081c444396@csgroup.eu>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 16 Mar 2021 22:04:54 +0100
Subject: Re: [OpenRISC] [PATCH] mm: Move mem_init_print_info() into mm_init()
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

Ck9uIDIwMjEvMy8xNiAyMjo0NywgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPgo+Cj4gTGUgMTYv
MDMvMjAyMSDDoCAxNToyNiwgS2VmZW5nIFdhbmcgYSDDqWNyaXTCoDoKPj4gbWVtX2luaXRfcHJp
bnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVhY2ggYXJjaGl0ZWN0dXJlLAo+
PiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBjbGVhbnVwIGl0IGJ5IHVzaW5nIHZvaWQgYXJndW1l
bnQgYW5kIG1vdmUKPj4gaXQgaW50byBtbV9pbml0KCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtl
ZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gv
YWxwaGEvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gv
YXJjL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJj
aC9hcm0vbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4gwqAg
YXJjaC9hcm02NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKg
IGFyY2gvY3NreS9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDC
oCBhcmNoL2g4MzAwL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4g
wqAgYXJjaC9oZXhhZ29uL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKg
IGFyY2gvaWE2NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDC
oCBhcmNoL202OGsvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4g
wqAgYXJjaC9taWNyb2JsYXplL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFy
Y2gvbWlwcy9sb29uZ3NvbjY0L251bWEuY8KgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJjaC9taXBz
L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvbWlw
cy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIHwgMSAtCj4+IMKgIGFyY2gvbmRzMzIvbW0vaW5pdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvbmlvczIvbW0vaW5pdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL3BhcmlzYy9tbS9pbml0LmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL3Bvd2VycGMvbW0vbWVtLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvcmlzY3YvbW0vaW5pdC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvczM5MC9tbS9pbml0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4gwqAgYXJjaC9zaC9tbS9pbml0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0
XzMyLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gvc3BhcmMvbW0vaW5pdF82
NC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvdW0va2VybmVsL21lbS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gveDg2L21tL2luaXRfMzIuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gveDg2L21tL2luaXRfNjQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gveHRlbnNhL21tL2luaXQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgaW5pdC9tYWluLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4gwqAgbW0vcGFnZV9hbGxv
Yy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgMzAgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKPj4KPgo+PiBkaWZm
IC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4+IGluZGV4IDU1ZDkz
ODI5N2NlNi4uZTRhNmJmNjljODA2IDEwMDY0NAo+PiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPj4g
KysrIGIvbW0vcGFnZV9hbGxvYy5jCj4+IEBAIC03NzI4LDcgKzc3MjgsNyBAQCB1bnNpZ25lZCBs
b25nIGZyZWVfcmVzZXJ2ZWRfYXJlYSh2b2lkICpzdGFydCwgCj4+IHZvaWQgKmVuZCwgaW50IHBv
aXNvbiwgY29uc3QgY2hhcgo+PiDCoMKgwqDCoMKgIHJldHVybiBwYWdlczsKPj4gwqAgfQo+PiDC
oCAtdm9pZCBfX2luaXQgbWVtX2luaXRfcHJpbnRfaW5mbyhjb25zdCBjaGFyICpzdHIpCj4+ICt2
b2lkIF9faW5pdCBtZW1faW5pdF9wcmludF9pbmZvKHZvaWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIHBoeXNwYWdlcywgY29kZXNpemUsIGRhdGFzaXplLCByb3NpemUsIGJz
c19zaXplOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgaW5pdF9jb2RlX3NpemUsIGluaXRf
ZGF0YV9zaXplOwo+Pgo+Cj4gQW5kIHdoYXQgYWJvdXQgdGhlICdzdHInIGluIHRoZSBsYXN0IGxp
bmUgb2YgdGhlIGZ1bmN0aW9uID8KPgo+IMKgwqDCoMKgcHJfaW5mbygiTWVtb3J5OiAlbHVLLyVs
dUsgYXZhaWxhYmxlICglbHVLIGtlcm5lbCBjb2RlLCAlbHVLIAo+IHJ3ZGF0YSwgJWx1SyByb2Rh
dGEsICVsdUsgaW5pdCwgJWx1SyBic3MsICVsdUsgcmVzZXJ2ZWQsICVsdUsgCj4gY21hLXJlc2Vy
dmVkIgo+ICNpZmRlZsKgwqDCoCBDT05GSUdfSElHSE1FTQo+IMKgwqDCoMKgwqDCoMKgICIsICVs
dUsgaGlnaG1lbSIKPiAjZW5kaWYKPiDCoMKgwqDCoMKgwqDCoCAiJXMlcylcbiIsCj4gwqDCoMKg
wqDCoMKgwqAgbnJfZnJlZV9wYWdlcygpIDw8IChQQUdFX1NISUZUIC0gMTApLAo+IMKgwqDCoMKg
wqDCoMKgIHBoeXNwYWdlcyA8PCAoUEFHRV9TSElGVCAtIDEwKSwKPiDCoMKgwqDCoMKgwqDCoCBj
b2Rlc2l6ZSA+PiAxMCwgZGF0YXNpemUgPj4gMTAsIHJvc2l6ZSA+PiAxMCwKPiDCoMKgwqDCoMKg
wqDCoCAoaW5pdF9kYXRhX3NpemUgKyBpbml0X2NvZGVfc2l6ZSkgPj4gMTAsIGJzc19zaXplID4+
IDEwLAo+IMKgwqDCoMKgwqDCoMKgIChwaHlzcGFnZXMgLSB0b3RhbHJhbV9wYWdlcygpIC0gdG90
YWxjbWFfcGFnZXMpIDw8IChQQUdFX1NISUZUIAo+IC0gMTApLAo+IMKgwqDCoMKgwqDCoMKgIHRv
dGFsY21hX3BhZ2VzIDw8IChQQUdFX1NISUZUIC0gMTApLAo+ICNpZmRlZsKgwqDCoCBDT05GSUdf
SElHSE1FTQo+IMKgwqDCoMKgwqDCoMKgIHRvdGFsaGlnaF9wYWdlcygpIDw8IChQQUdFX1NISUZU
IC0gMTApLAo+ICNlbmRpZgo+IMKgwqDCoMKgwqDCoMKgIHN0ciA/ICIsICIgOiAiIiwgc3RyID8g
c3RyIDogIiIpOwoKb2gswqDCoCBJIHNlbmQgYSBiYWQgdmVyc2lvbu+8jGZpcnN0bHkgSSB3YW50
IHRvIHNwbGl0IHR3byBwYXRjaGVzLCBvbmUgZm9yIApmdW5jdGlvbiBtb3ZlLCBvbmUgZm9yIGZ1
bmN0aW9uIGNoYW5nZS4KCnNvcnJ5LCBwbGVhc2UgaWdub3JlIGl077yMIHRoYW5rcyBmb3IgeW91
ciByZW1pbmQuCgo+Cj4KPiBDaHJpc3RvcGhlCj4gLgo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0Bs
aXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZv
L29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6728A39D273
	for <lists+openrisc@lfdr.de>; Mon,  7 Jun 2021 02:56:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 279F9211CC;
	Mon,  7 Jun 2021 02:56:07 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by mail.librecores.org (Postfix) with ESMTPS id 275CD211CC
 for <openrisc@lists.librecores.org>; Mon,  7 Jun 2021 02:56:04 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fyvtz02SLzWnwv;
 Mon,  7 Jun 2021 08:51:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 08:55:55 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 08:55:55 +0800
To: Mike Rapoport <rppt@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
Date: Mon, 7 Jun 2021 08:55:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YL0+Jargm+y9aqx1@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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

Ck9uIDIwMjEvNi83IDU6MjksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gSGVsbG8gS2VmZW5nLAo+
Cj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MThQTSArMDgwMCwgS2VmZW5nIFdhbmcg
d3JvdGU6Cj4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxwZXIsIHRoZW4gdXNlIGl0
Cj4+IHRvIGNsZWFudXAgdGhlIHRleHQsIGRhdGEgYW5kIGJyayBzZXR1cCBjb2RlLgo+Pgo+PiB2
MjoKPj4gLSBjaGFuZ2UgYXJndW1lbnQgZnJvbSAiY2hhciAqIiB0byAidm9pZCAqIiBzZXR1cF9p
bml0aWFsX2luaXRfbW0oKQo+PiAgICBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9ldmVuCj4+
IC0gdXNlIE5VTEwgaW5zdGVhZCBvZiAodm9pZCAqKTAgb24gaDgzMDAgYW5kIG02OGsKPj4gLSBj
b2xsZWN0IEFDS3MKPj4KPj4gQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
Pj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgt
Y3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UuanAKPj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4gQ2M6IG9w
ZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZwo+PiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGlu
dXgtc2hAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+
PiBLZWZlbmcgV2FuZyAoMTUpOgo+PiAgICBtbTogYWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgp
IGhlbHBlcgo+PiAgICBhcmM6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4g
ICAgYXJtOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIGFybTY0OiBj
b252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIGNza3k6IGNvbnZlcnQgdG8g
c2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4gICAgaDgzMDA6IGNvbnZlcnQgdG8gc2V0dXBfaW5p
dGlhbF9pbml0X21tKCkKPj4gICAgbTY4azogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRf
bW0oKQo+PiAgICBuZHMzMjogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAg
ICBuaW9zMjogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAgICBvcGVucmlz
YzogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAgICBwb3dlcnBjOiBjb252
ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIHJpc2N2OiBjb252ZXJ0IHRvIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIHMzOTA6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlh
bF9pbml0X21tKCkKPj4gICAgc2g6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkK
Pj4gICAgeDg2OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4gSSBtaWdodCBi
ZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEFGQUlVIHRoZSBpbml0X21tLnN0YXJ0X2NvZGUgYW5k
IG90aGVyCj4gZmllbGRzIGFyZSBub3QgdXNlZCByZWFsbHkgZWFybHkgc28gdGhlIG5ldyBzZXR1
cF9pbml0aWFsX2luaXRfbW0oKQo+IGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgaW4gdGhlIGdlbmVy
aWMgY29kZSBvdXRzaWRlIHNldHVwX2FyY2goKSwgZS5nIGluCj4gbW1faW5pdCgpLgoKSGkgTWlr
Ze+8jCBlYWNoIGFyY2hpdGVjdHVyZSBoYXMgdGhlaXIgb3duIHZhbHVlLCBub3QgdGhlIHNhbWUs
IGVnIG02OEsgYW5kCgpoODMwMCwgYWxzbyB0aGUgbmFtZSBvZiB0aGUgdGV4dC9jb2RlL2JyayBp
cyBkaWZmZXJlbnQgaW4gc29tZSBhcmNoLCBzbyAKSSBrZWVwCgp1bmNoYW5nZWQuCgo+ICAgCj4+
ICAgYXJjaC9hcmMvbW0vaW5pdC5jICAgICAgICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNo
L2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgNSArLS0tLQo+PiAgIGFyY2gvYXJtNjQv
a2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJjaC9jc2t5L2tlcm5lbC9z
ZXR1cC5jICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgIHwgNSArLS0tLQo+PiAgIGFyY2gvbTY4ay9rZXJuZWwvc2V0dXBfbW0uYyAgICAg
ICAgfCA1ICstLS0tCj4+ICAgYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jICAgICAgICB8IDUg
Ky0tLS0KPj4gICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQo+
PiAgIGFyY2gvbmlvczIva2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJj
aC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3NldHVwLWNvbW1vbi5jIHwgNSArLS0tLQo+PiAgIGFyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL3NoL2tlcm5lbC9zZXR1cC5jICAgICAgICAg
ICAgIHwgNSArLS0tLQo+PiAgIGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgfCA1
ICstLS0tCj4+ICAgaW5jbHVkZS9saW51eC9tbV90eXBlcy5oICAgICAgICAgICB8IDggKysrKysr
KysKPj4gICAxNiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMo
LSkKPj4KPj4gLS0gCj4+IDIuMjYuMgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0
cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29w
ZW5yaXNjCg==

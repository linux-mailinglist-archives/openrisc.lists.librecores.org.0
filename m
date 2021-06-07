Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C0B9839D2BC
	for <lists+openrisc@lfdr.de>; Mon,  7 Jun 2021 03:50:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5ECA02136B;
	Mon,  7 Jun 2021 03:50:40 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by mail.librecores.org (Postfix) with ESMTPS id BD0CC2136B
 for <openrisc@lists.librecores.org>; Mon,  7 Jun 2021 03:50:38 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fyx774Ylsz69Gm;
 Mon,  7 Jun 2021 09:46:43 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:50:32 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:50:31 +0800
To: Mike Rapoport <rppt@kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <20210604070633.32363-2-wangkefeng.wang@huawei.com>
 <YL0+nZPViz5xzxca@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <d07abbe5-941d-a27f-d968-e3d14ef9329a@huawei.com>
Date: Mon, 7 Jun 2021 09:50:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YL0+nZPViz5xzxca@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: Re: [OpenRISC] [PATCH v2 01/15] mm: add setup_initial_init_mm()
 helper
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
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDIwMjEvNi83IDU6MzEsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gSGVsbG8gS2VmZW5nLAo+
Cj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MTlQTSArMDgwMCwgS2VmZW5nIFdhbmcg
d3JvdGU6Cj4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxwZXIgdG8gc2V0dXAga2Vy
bmVsIHRleHQsCj4+IGRhdGEgYW5kIGJyay4KPj4KPj4gQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+PiBDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IHVjbGludXgtaDgtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4
ay5vcmcKPj4gQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4+IENjOiBsaW51eHBw
Yy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1zMzkwQHZn
ZXIua2VybmVsLm9yZwo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogS2Vm
ZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBpbmNsdWRl
L2xpbnV4L21tX3R5cGVzLmggfCA4ICsrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbV90eXBlcy5oIGIv
aW5jbHVkZS9saW51eC9tbV90eXBlcy5oCj4+IGluZGV4IDVhYWNjMWMxMGE0NS4uZTFkMjQyOTA4
OWE0IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKPj4gKysrIGIvaW5j
bHVkZS9saW51eC9tbV90eXBlcy5oCj4+IEBAIC01NzIsNiArNTcyLDE0IEBAIHN0cnVjdCBtbV9z
dHJ1Y3Qgewo+PiAgIH07Cj4+ICAgCj4+ICAgZXh0ZXJuIHN0cnVjdCBtbV9zdHJ1Y3QgaW5pdF9t
bTsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXR1cF9pbml0aWFsX2luaXRfbW0odm9pZCAqc3Rh
cnRfY29kZSwgdm9pZCAqZW5kX2NvZGUsCj4+ICsJCQkJCSB2b2lkICplbmRfZGF0YSwgdm9pZCAq
YnJrKQo+IEkgdGhpbmsgaXQncyBub3QgdGhhdCBwZXJmb3JtYW5jZSBzZW5zaXRpdmUgdG8gbWFr
ZSBpdCBpbmxpbmUuIEl0IGNhbiBiZQo+IHBsYWNlZCBpbiBtbS9pbml0LW1tLmMgd2l0aCBhIGZv
cndhcmQgZGVjbGFyYXRpb24gaW4gbW0uaAoKT2ssIEkgd2lsbCBzZW5kIGEgdXBkYXRlIG9uZSB3
aXRoIHRoaXMgY2hhbmdlLgoKPgo+PiArewo+PiArCWluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNp
Z25lZCBsb25nKXN0YXJ0X2NvZGU7Cj4+ICsJaW5pdF9tbS5lbmRfY29kZSA9ICh1bnNpZ25lZCBs
b25nKWVuZF9jb2RlOwo+PiArCWluaXRfbW0uZW5kX2RhdGEgPSAodW5zaWduZWQgbG9uZyllbmRf
ZGF0YTsKPj4gKwlpbml0X21tLmJyayA9ICh1bnNpZ25lZCBsb25nKWJyazsKPj4gK30KPiAgICAK
Pj4gICAvKiBQb2ludGVyIG1hZ2ljIGJlY2F1c2UgdGhlIGR5bmFtaWMgYXJyYXkgc2l6ZSBjb25m
dXNlcyBzb21lIGNvbXBpbGVycy4gKi8KPj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbW1faW5pdF9j
cHVtYXNrKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+PiAtLSAKPj4gMi4yNi4yCj4+Cj4+Cj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

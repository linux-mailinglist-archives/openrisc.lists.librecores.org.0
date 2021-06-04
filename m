Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3071F39B361
	for <lists+openrisc@lfdr.de>; Fri,  4 Jun 2021 08:58:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 76FA7215CE;
	Fri,  4 Jun 2021 08:58:00 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by mail.librecores.org (Postfix) with ESMTPS id 65DE32136B
 for <openrisc@lists.librecores.org>; Fri,  4 Jun 2021 08:57:58 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FxD5B749vz63gb;
 Fri,  4 Jun 2021 14:54:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:53 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:52 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 4 Jun 2021 15:06:18 +0800
Message-ID: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk
 setup code
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
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-sh@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciwgdGhlbiB1c2UgaXQKdG8gY2xlYW51
cCB0aGUgdGV4dCwgZGF0YSBhbmQgYnJrIHNldHVwIGNvZGUuCgp2MjoKLSBjaGFuZ2UgYXJndW1l
bnQgZnJvbSAiY2hhciAqIiB0byAidm9pZCAqIiBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQogIHN1
Z2dlc3RlZCBieSBHZWVydCBVeXR0ZXJob2V2ZW4KLSB1c2UgTlVMTCBpbnN0ZWFkIG9mICh2b2lk
ICopMCBvbiBoODMwMCBhbmQgbTY4awotIGNvbGxlY3QgQUNLcwoKQ2M6IGxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IHVjbGludXgtaDgtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UuanAKQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcK
Q2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCkNjOiBsaW51eHBwYy1kZXZAbGlzdHMu
b3psYWJzLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgt
c2hAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwpLZWZlbmcg
V2FuZyAoMTUpOgogIG1tOiBhZGQgc2V0dXBfaW5pdGlhbF9pbml0X21tKCkgaGVscGVyCiAgYXJj
OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgYXJtOiBjb252ZXJ0IHRvIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgYXJtNjQ6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9p
bml0X21tKCkKICBjc2t5OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgaDgz
MDA6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKICBtNjhrOiBjb252ZXJ0IHRv
IHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgbmRzMzI6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlh
bF9pbml0X21tKCkKICBuaW9zMjogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQog
IG9wZW5yaXNjOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgcG93ZXJwYzog
Y29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQogIHJpc2N2OiBjb252ZXJ0IHRvIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgczM5MDogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2lu
aXRfbW0oKQogIHNoOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCiAgeDg2OiBj
b252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCgogYXJjaC9hcmMvbW0vaW5pdC5jICAg
ICAgICAgICAgICAgICB8IDUgKy0tLS0KIGFyY2gvYXJtL2tlcm5lbC9zZXR1cC5jICAgICAgICAg
ICAgfCA1ICstLS0tCiBhcmNoL2FybTY0L2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0t
LQogYXJjaC9jc2t5L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8IDUgKy0tLS0KIGFyY2gvaDgz
MDAva2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCiBhcmNoL202OGsva2VybmVsL3Nl
dHVwX21tLmMgICAgICAgIHwgNSArLS0tLQogYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jICAg
ICAgICB8IDUgKy0tLS0KIGFyY2gvbmRzMzIva2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICst
LS0tCiBhcmNoL25pb3MyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQogYXJjaC9v
cGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICB8IDUgKy0tLS0KIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvc2V0dXAtY29tbW9uLmMgfCA1ICstLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jICAg
ICAgICAgIHwgNSArLS0tLQogYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICB8IDUg
Ky0tLS0KIGFyY2gvc2gva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgfCA1ICstLS0tCiBhcmNo
L3g4Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgNSArLS0tLQogaW5jbHVkZS9saW51eC9t
bV90eXBlcy5oICAgICAgICAgICB8IDggKysrKysrKysKIDE2IGZpbGVzIGNoYW5nZWQsIDIzIGlu
c2VydGlvbnMoKyksIDYwIGRlbGV0aW9ucygtKQoKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9w
ZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcv
bGlzdGluZm8vb3BlbnJpc2MK

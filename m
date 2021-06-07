Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7452839D2ED
	for <lists+openrisc@lfdr.de>; Mon,  7 Jun 2021 04:27:22 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 3262020DB6;
	Mon,  7 Jun 2021 04:27:22 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mail.librecores.org (Postfix) with ESMTPS id 9139820DB6
 for <openrisc@lists.librecores.org>; Mon,  7 Jun 2021 04:27:20 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fyxyf67zXzZdPf;
 Mon,  7 Jun 2021 10:24:26 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:27:15 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 10:27:14 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 7 Jun 2021 10:36:11 +0800
Message-ID: <20210607023611.159804-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <YL0+nZPViz5xzxca@kernel.org>
References: <YL0+nZPViz5xzxca@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH v3] mm: add setup_initial_init_mm() helper
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
 x86@kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciB0byBzZXR1cCBrZXJuZWwgdGV4dCwK
ZGF0YSBhbmQgYnJrLgoKQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtY3NreUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKQ2M6
IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKQ2M6IG9wZW5yaXNjQGxpc3RzLmxpYnJl
Y29yZXMub3JnCkNjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwpDYzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCkNjOiBs
aW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwpDYzogeDg2QGtlcm5lbC5vcmcKU2lnbmVkLW9mZi1i
eTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgotLS0KdjM6IGRlY2xh
cmF0aW9uIGluIG1tLmgsIGltcGxlbWVudGlvbiBpbiBpbml0LW1tLmMKIGluY2x1ZGUvbGludXgv
bW0uaCB8IDMgKysrCiBtbS9pbml0LW1tLmMgICAgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5o
IGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IGMyNzRmNzVlZmNmOS4uMDJhYTA1NzU0MGI3IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCkBA
IC0yNDQsNiArMjQ0LDkgQEAgaW50IF9fYWRkX3RvX3BhZ2VfY2FjaGVfbG9ja2VkKHN0cnVjdCBw
YWdlICpwYWdlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKIAogI2RlZmluZSBscnVf
dG9fcGFnZShoZWFkKSAobGlzdF9lbnRyeSgoaGVhZCktPnByZXYsIHN0cnVjdCBwYWdlLCBscnUp
KQogCit2b2lkIHNldHVwX2luaXRpYWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2b2lkICpl
bmRfY29kZSwKKwkJCSAgIHZvaWQgKmVuZF9kYXRhLCB2b2lkICpicmspOworCiAvKgogICogTGlu
dXgga2VybmVsIHZpcnR1YWwgbWVtb3J5IG1hbmFnZXIgcHJpbWl0aXZlcy4KICAqIFRoZSBpZGVh
IGJlaW5nIHRvIGhhdmUgYSAidmlydHVhbCIgbW0gaW4gdGhlIHNhbWUgd2F5CmRpZmYgLS1naXQg
YS9tbS9pbml0LW1tLmMgYi9tbS9pbml0LW1tLmMKaW5kZXggMTUzMTYyNjY5ZjgwLi5iNGE2ZjM4
ZmI1MWQgMTAwNjQ0Ci0tLSBhL21tL2luaXQtbW0uYworKysgYi9tbS9pbml0LW1tLmMKQEAgLTQw
LDMgKzQwLDEyIEBAIHN0cnVjdCBtbV9zdHJ1Y3QgaW5pdF9tbSA9IHsKIAkuY3B1X2JpdG1hcAk9
IENQVV9CSVRTX05PTkUsCiAJSU5JVF9NTV9DT05URVhUKGluaXRfbW0pCiB9OworCit2b2lkIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2b2lkICplbmRfY29kZSwKKwkJ
CSAgIHZvaWQgKmVuZF9kYXRhLCB2b2lkICpicmspCit7CisJaW5pdF9tbS5zdGFydF9jb2RlID0g
KHVuc2lnbmVkIGxvbmcpc3RhcnRfY29kZTsKKwlpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVk
IGxvbmcpZW5kX2NvZGU7CisJaW5pdF9tbS5lbmRfZGF0YSA9ICh1bnNpZ25lZCBsb25nKWVuZF9k
YXRhOworCWluaXRfbW0uYnJrID0gKHVuc2lnbmVkIGxvbmcpYnJrOworfQotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D2A1139F0CD
	for <lists+openrisc@lfdr.de>; Tue,  8 Jun 2021 10:26:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6D9DF23F08;
	Tue,  8 Jun 2021 10:26:03 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by mail.librecores.org (Postfix) with ESMTPS id 33B3021016
 for <openrisc@lists.librecores.org>; Tue,  8 Jun 2021 10:26:01 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fzjqk3LPtzWspY;
 Tue,  8 Jun 2021 16:21:06 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:53 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:52 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 8 Jun 2021 16:34:04 +0800
Message-ID: <20210608083418.137226-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH v3 resend 01/15] mm: add setup_initial_init_mm()
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
eTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgotLS0KIGluY2x1ZGUv
bGludXgvbW0uaCB8IDMgKysrCiBtbS9pbml0LW1tLmMgICAgICAgfCA5ICsrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IGMyNzRmNzVlZmNmOS4uMDJhYTA1NzU0
MGI3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9t
bS5oCkBAIC0yNDQsNiArMjQ0LDkgQEAgaW50IF9fYWRkX3RvX3BhZ2VfY2FjaGVfbG9ja2VkKHN0
cnVjdCBwYWdlICpwYWdlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKIAogI2RlZmlu
ZSBscnVfdG9fcGFnZShoZWFkKSAobGlzdF9lbnRyeSgoaGVhZCktPnByZXYsIHN0cnVjdCBwYWdl
LCBscnUpKQogCit2b2lkIHNldHVwX2luaXRpYWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2
b2lkICplbmRfY29kZSwKKwkJCSAgIHZvaWQgKmVuZF9kYXRhLCB2b2lkICpicmspOworCiAvKgog
ICogTGludXgga2VybmVsIHZpcnR1YWwgbWVtb3J5IG1hbmFnZXIgcHJpbWl0aXZlcy4KICAqIFRo
ZSBpZGVhIGJlaW5nIHRvIGhhdmUgYSAidmlydHVhbCIgbW0gaW4gdGhlIHNhbWUgd2F5CmRpZmYg
LS1naXQgYS9tbS9pbml0LW1tLmMgYi9tbS9pbml0LW1tLmMKaW5kZXggMTUzMTYyNjY5ZjgwLi5i
NGE2ZjM4ZmI1MWQgMTAwNjQ0Ci0tLSBhL21tL2luaXQtbW0uYworKysgYi9tbS9pbml0LW1tLmMK
QEAgLTQwLDMgKzQwLDEyIEBAIHN0cnVjdCBtbV9zdHJ1Y3QgaW5pdF9tbSA9IHsKIAkuY3B1X2Jp
dG1hcAk9IENQVV9CSVRTX05PTkUsCiAJSU5JVF9NTV9DT05URVhUKGluaXRfbW0pCiB9OworCit2
b2lkIHNldHVwX2luaXRpYWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2b2lkICplbmRfY29k
ZSwKKwkJCSAgIHZvaWQgKmVuZF9kYXRhLCB2b2lkICpicmspCit7CisJaW5pdF9tbS5zdGFydF9j
b2RlID0gKHVuc2lnbmVkIGxvbmcpc3RhcnRfY29kZTsKKwlpbml0X21tLmVuZF9jb2RlID0gKHVu
c2lnbmVkIGxvbmcpZW5kX2NvZGU7CisJaW5pdF9tbS5lbmRfZGF0YSA9ICh1bnNpZ25lZCBsb25n
KWVuZF9kYXRhOworCWluaXRfbW0uYnJrID0gKHVuc2lnbmVkIGxvbmcpYnJrOworfQotLSAKMi4y
Ni4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

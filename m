Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B5EB739B360
	for <lists+openrisc@lfdr.de>; Fri,  4 Jun 2021 08:58:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 05F1623C23;
	Fri,  4 Jun 2021 08:58:00 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by mail.librecores.org (Postfix) with ESMTPS id 34CF420E97
 for <openrisc@lists.librecores.org>; Fri,  4 Jun 2021 08:57:58 +0200 (CEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FxD5C6GFvz64vH;
 Fri,  4 Jun 2021 14:54:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:54 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 14:57:53 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 4 Jun 2021 15:06:19 +0800
Message-ID: <20210604070633.32363-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH v2 01/15] mm: add setup_initial_init_mm() helper
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
bGludXgvbW1fdHlwZXMuaCB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggYi9pbmNsdWRlL2xp
bnV4L21tX3R5cGVzLmgKaW5kZXggNWFhY2MxYzEwYTQ1Li5lMWQyNDI5MDg5YTQgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVz
LmgKQEAgLTU3Miw2ICs1NzIsMTQgQEAgc3RydWN0IG1tX3N0cnVjdCB7CiB9OwogCiBleHRlcm4g
c3RydWN0IG1tX3N0cnVjdCBpbml0X21tOworc3RhdGljIGlubGluZSB2b2lkIHNldHVwX2luaXRp
YWxfaW5pdF9tbSh2b2lkICpzdGFydF9jb2RlLCB2b2lkICplbmRfY29kZSwKKwkJCQkJIHZvaWQg
KmVuZF9kYXRhLCB2b2lkICpicmspCit7CisJaW5pdF9tbS5zdGFydF9jb2RlID0gKHVuc2lnbmVk
IGxvbmcpc3RhcnRfY29kZTsKKwlpbml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpZW5k
X2NvZGU7CisJaW5pdF9tbS5lbmRfZGF0YSA9ICh1bnNpZ25lZCBsb25nKWVuZF9kYXRhOworCWlu
aXRfbW0uYnJrID0gKHVuc2lnbmVkIGxvbmcpYnJrOworfQogCiAvKiBQb2ludGVyIG1hZ2ljIGJl
Y2F1c2UgdGhlIGR5bmFtaWMgYXJyYXkgc2l6ZSBjb25mdXNlcyBzb21lIGNvbXBpbGVycy4gKi8K
IHN0YXRpYyBpbmxpbmUgdm9pZCBtbV9pbml0X2NwdW1hc2soc3RydWN0IG1tX3N0cnVjdCAqbW0p
Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

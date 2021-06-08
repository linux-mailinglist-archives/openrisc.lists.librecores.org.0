Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CE47039F0D4
	for <lists+openrisc@lfdr.de>; Tue,  8 Jun 2021 10:26:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A939023F07;
	Tue,  8 Jun 2021 10:26:11 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mail.librecores.org (Postfix) with ESMTPS id 5439620D40
 for <openrisc@lists.librecores.org>; Tue,  8 Jun 2021 10:26:09 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FzjtC0N09zZf2H;
 Tue,  8 Jun 2021 16:23:15 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:59 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:25:57 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 8 Jun 2021 16:34:13 +0800
Message-ID: <20210608083418.137226-11-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH v3 resend 10/15] openrisc: convert to
 setup_initial_init_mm()
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
Cc: Jonas Bonn <jonas@southpole.se>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 linux-mm@kvack.org, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXNlIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciB0byBzaW1wbGlmeSBjb2RlLgoKQWNr
ZWQtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgpDYzogSm9uYXMgQm9ubiA8
am9uYXNAc291dGhwb2xlLnNlPgpDYzogU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0
aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgpDYzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5j
b20+CkNjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwpTaWduZWQtb2ZmLWJ5OiBLZWZl
bmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc2V0dXAuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5j
IGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwppbmRleCBjNmY5ZTdiOWY3Y2IuLjhhZTJk
YTZhYzA5NyAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYworKysgYi9h
cmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jCkBAIC0yOTMsMTAgKzI5Myw3IEBAIHZvaWQgX19p
bml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKICNlbmRpZgogCiAJLyogcHJvY2VzcyAx
J3MgaW5pdGlhbCBtZW1vcnkgcmVnaW9uIGlzIHRoZSBrZXJuZWwgY29kZS9kYXRhICovCi0JaW5p
dF9tbS5zdGFydF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpX3N0ZXh0OwotCWluaXRfbW0uZW5kX2Nv
ZGUgPSAodW5zaWduZWQgbG9uZylfZXRleHQ7Ci0JaW5pdF9tbS5lbmRfZGF0YSA9ICh1bnNpZ25l
ZCBsb25nKV9lZGF0YTsKLQlpbml0X21tLmJyayA9ICh1bnNpZ25lZCBsb25nKV9lbmQ7CisJc2V0
dXBfaW5pdGlhbF9pbml0X21tKF9zdGV4dCwgX2V0ZXh0LCBfZWRhdGEsIF9lbmQpOwogCiAjaWZk
ZWYgQ09ORklHX0JMS19ERVZfSU5JVFJECiAJaWYgKGluaXRyZF9zdGFydCA9PSBpbml0cmRfZW5k
KSB7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

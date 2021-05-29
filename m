Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D9605394BB7
	for <lists+openrisc@lfdr.de>; Sat, 29 May 2021 12:46:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 85FB623CC3;
	Sat, 29 May 2021 12:46:12 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by mail.librecores.org (Postfix) with ESMTPS id D840821081
 for <openrisc@lists.librecores.org>; Sat, 29 May 2021 12:46:09 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsdSG1PDyz67yG;
 Sat, 29 May 2021 18:43:10 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 18:46:04 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 18:46:04 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>
Date: Sat, 29 May 2021 18:54:59 +0800
Message-ID: <20210529105504.180544-11-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Subject: [OpenRISC] [PATCH 10/15] openrisc: convert to
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
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXNlIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciB0byBzaW1wbGlmeSBjb2RlLgoKQ2M6
IEpvbmFzIEJvbm4gPGpvbmFzQHNvdXRocG9sZS5zZT4KQ2M6IFN0ZWZhbiBLcmlzdGlhbnNzb24g
PHN0ZWZhbi5rcmlzdGlhbnNzb25Ac2F1bmFsYWh0aS5maT4KQ2M6IFN0YWZmb3JkIEhvcm5lIDxz
aG9ybmVAZ21haWwuY29tPgpDYzogb3BlbnJpc2NAbGlzdHMubGlicmVjb3Jlcy5vcmcKU2lnbmVk
LW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgotLS0KIGFy
Y2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc2V0dXAuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKaW5kZXggYzZmOWU3
YjlmN2NiLi44YWUyZGE2YWMwOTcgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Nl
dHVwLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwpAQCAtMjkzLDEwICsyOTMs
NyBAQCB2b2lkIF9faW5pdCBzZXR1cF9hcmNoKGNoYXIgKipjbWRsaW5lX3ApCiAjZW5kaWYKIAog
CS8qIHByb2Nlc3MgMSdzIGluaXRpYWwgbWVtb3J5IHJlZ2lvbiBpcyB0aGUga2VybmVsIGNvZGUv
ZGF0YSAqLwotCWluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNpZ25lZCBsb25nKV9zdGV4dDsKLQlp
bml0X21tLmVuZF9jb2RlID0gKHVuc2lnbmVkIGxvbmcpX2V0ZXh0OwotCWluaXRfbW0uZW5kX2Rh
dGEgPSAodW5zaWduZWQgbG9uZylfZWRhdGE7Ci0JaW5pdF9tbS5icmsgPSAodW5zaWduZWQgbG9u
ZylfZW5kOworCXNldHVwX2luaXRpYWxfaW5pdF9tbShfc3RleHQsIF9ldGV4dCwgX2VkYXRhLCBf
ZW5kKTsKIAogI2lmZGVmIENPTkZJR19CTEtfREVWX0lOSVRSRAogCWlmIChpbml0cmRfc3RhcnQg
PT0gaW5pdHJkX2VuZCkgewotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

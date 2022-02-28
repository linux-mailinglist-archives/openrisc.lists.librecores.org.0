Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C42FE4C67B8
	for <lists+openrisc@lfdr.de>; Mon, 28 Feb 2022 11:50:38 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A29C224851;
	Mon, 28 Feb 2022 11:50:38 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 490132484A
 for <openrisc@lists.librecores.org>; Mon, 28 Feb 2022 11:50:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 603D31063;
 Mon, 28 Feb 2022 02:50:36 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2AE5C3F73D;
 Mon, 28 Feb 2022 02:50:27 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Date: Mon, 28 Feb 2022 16:17:36 +0530
Message-Id: <1646045273-9343-14-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
Subject: [OpenRISC] [PATCH V3 13/30] mm/mmap: Drop arch_vm_get_page_pgprot()
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
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhlcmUgYXJlIG5vIHBsYXRmb3JtcyBsZWZ0IHdoaWNoIHVzZSBhcmNoX3ZtX2dldF9wYWdlX3By
b3QoKS4gSnVzdCBkcm9wCmFyY2hfdm1fZ2V0X3BhZ2VfcHJvdCgpIGNvbnN0cnVjdCBhbmQgc2lt
cGxpZnkgcmVtYWluaW5nIGNvZGUuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZz4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hh
bmR1YWxAYXJtLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L21tYW4uaCB8ICA0IC0tLS0KIG1tL21t
YXAuYyAgICAgICAgICAgIHwgMTAgKy0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbWFu
LmggYi9pbmNsdWRlL2xpbnV4L21tYW4uaAppbmRleCBiNjZlOTFiODE3NmMuLjU4YjNhYmQ0NTdh
MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbWFuLmgKKysrIGIvaW5jbHVkZS9saW51eC9t
bWFuLmgKQEAgLTkzLDEwICs5Myw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2bV91bmFjY3RfbWVt
b3J5KGxvbmcgcGFnZXMpCiAjZGVmaW5lIGFyY2hfY2FsY192bV9mbGFnX2JpdHMoZmxhZ3MpIDAK
ICNlbmRpZgogCi0jaWZuZGVmIGFyY2hfdm1fZ2V0X3BhZ2VfcHJvdAotI2RlZmluZSBhcmNoX3Zt
X2dldF9wYWdlX3Byb3Qodm1fZmxhZ3MpIF9fcGdwcm90KDApCi0jZW5kaWYKLQogI2lmbmRlZiBh
cmNoX3ZhbGlkYXRlX3Byb3QKIC8qCiAgKiBUaGlzIGlzIGNhbGxlZCBmcm9tIG1wcm90ZWN0KCku
ICBQUk9UX0dST1dTRE9XTiBhbmQgUFJPVF9HUk9XU1VQIGhhdmUKZGlmZiAtLWdpdCBhL21tL21t
YXAuYyBiL21tL21tYXAuYwppbmRleCBjOGZkOGYwNmJmN2MuLmMxM2RkOWMzNzg2NiAxMDA2NDQK
LS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21tYXAuYwpAQCAtMTAyLDcgKzEwMiw3IEBAIHN0YXRp
YyB2b2lkIHVubWFwX3JlZ2lvbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKICAqCQkJCQkJCQl3OiAo
bm8pIG5vCiAgKgkJCQkJCQkJeDogKHllcykgeWVzCiAgKi8KLXN0YXRpYyBpbmxpbmUgcGdwcm90
X3QgX192bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpCitwZ3Byb3RfdCB2
bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3MpCiB7CiAJc3dpdGNoICh2bV9m
bGFncyAmIChWTV9SRUFEIHwgVk1fV1JJVEUgfCBWTV9FWEVDIHwgVk1fU0hBUkVEKSkgewogCWNh
c2UgVk1fTk9ORToKQEAgLTE0MSwxNCArMTQxLDYgQEAgc3RhdGljIGlubGluZSBwZ3Byb3RfdCBf
X3ZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9mbGFncykKIAkJQlVJTERfQlVHKCk7
CiAJfQogfQotCi1wZ3Byb3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxh
Z3MpCi17Ci0JcGdwcm90X3QgcmV0ID0gX19wZ3Byb3QocGdwcm90X3ZhbChfX3ZtX2dldF9wYWdl
X3Byb3Qodm1fZmxhZ3MpKSB8Ci0JCQlwZ3Byb3RfdmFsKGFyY2hfdm1fZ2V0X3BhZ2VfcHJvdCh2
bV9mbGFncykpKTsKLQotCXJldHVybiByZXQ7Ci19CiBFWFBPUlRfU1lNQk9MKHZtX2dldF9wYWdl
X3Byb3QpOwogI2VuZGlmCS8qIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UICovCiAK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

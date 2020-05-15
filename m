Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 903221E501C
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 283DE20C92;
	Wed, 27 May 2020 23:19:08 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8D6E620B09
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=A0UMmbAtyFU8Mgmehd8BwFzZHE+DazTplWu/8/CZIxQ=; b=thoKBgaMbx1Cx5CA4Atq9h0Hjc
 5bfoBkf6B6l70gHgjHiu6NtD6O4OiCWdLEd2/qYyYSAwD8YOCsdDHCYKc7NJBE4lvcItE8kFKfk/E
 IVklxzatDYx9U7wNUuJTfivt1P5gFyUyJ0cD0MBYfURGrTEyT9PcaERhdoIrOVnJcj2MdfKw25GEa
 83N3SgpWztqjuy5GD/iOZWBJOJraIKdnfZwSWd1Lw6YgUv3HwmgOto1NGYTv/CZDZ6fb9R4cBehIU
 B0bWmc1D8ab7q6CIbZuMjtll0x83iAkVdTSwiU1/VosyGWqL0mewvIilhiIUZoL8og6TsJMFiOW21
 nycS90Qg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSS-0003yz-QR; Fri, 15 May 2020 14:37:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:23 +0200
Message-Id: <20200515143646.3857579-7-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 06/29] asm-generic: don't include <linux/mm.h> in
 cacheflush.h
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, Jessica Yu <jeyu@kernel.org>,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBzZWVtcyB0byBsZWFkIHRvIHNvbWUgY3JhenkgaW5jbHVkZSBsb29wcyB3aGVuIHVzaW5n
CmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBvbiBtb3JlIGFyY2hpdGVjdHVyZXMsIHNvIGxlYXZl
IGl0CnRvIHRoZSBhcmNoIGhlYWRlciBmb3Igbm93LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC91bS9pbmNsdWRlL2FzbS90bGIuaCAgICAg
ICAgIHwgMiArKwogYXJjaC94ODYvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMiArKwogZHJp
dmVycy9udmRpbW0vcG1lbS5jICAgICAgICAgICAgIHwgMyArKy0KIGluY2x1ZGUvYXNtLWdlbmVy
aWMvY2FjaGVmbHVzaC5oICB8IDMgLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3VtL2luY2x1ZGUvYXNtL3RsYi5o
IGIvYXJjaC91bS9pbmNsdWRlL2FzbS90bGIuaAppbmRleCA3MGVlNjAzODM5MDA2Li5mZjljNjI4
Mjg5NjJjIDEwMDY0NAotLS0gYS9hcmNoL3VtL2luY2x1ZGUvYXNtL3RsYi5oCisrKyBiL2FyY2gv
dW0vaW5jbHVkZS9hc20vdGxiLmgKQEAgLTIsNiArMiw4IEBACiAjaWZuZGVmIF9fVU1fVExCX0gK
ICNkZWZpbmUgX19VTV9UTEJfSAogCisjaW5jbHVkZSA8bGludXgvbW0uaD4KKwogI2luY2x1ZGUg
PGFzbS90bGJmbHVzaC5oPgogI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NhY2hlZmx1c2guaD4KICNp
bmNsdWRlIDxhc20tZ2VuZXJpYy90bGIuaD4KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2NhY2hlZmx1c2guaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRl
eCA2M2ZlYWYyYTVmOTNkLi5iMTkyZDkxN2E2ZDBiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vY2FjaGVmbHVz
aC5oCkBAIC0yLDYgKzIsOCBAQAogI2lmbmRlZiBfQVNNX1g4Nl9DQUNIRUZMVVNIX0gKICNkZWZp
bmUgX0FTTV9YODZfQ0FDSEVGTFVTSF9ICiAKKyNpbmNsdWRlIDxsaW51eC9tbS5oPgorCiAvKiBD
YWNoZXMgYXJlbid0IGJyYWluLWRlYWQgb24gdGhlIGludGVsLiAqLwogI2luY2x1ZGUgPGFzbS1n
ZW5lcmljL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vc3BlY2lhbF9pbnNucy5oPgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9udmRpbW0vcG1lbS5jIGIvZHJpdmVycy9udmRpbW0vcG1lbS5jCmlu
ZGV4IDJkZjY5OTRhY2Y4MzYuLjU1MjgyYTYyMTc0MDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZk
aW1tL3BtZW0uYworKysgYi9kcml2ZXJzL252ZGltbS9wbWVtLmMKQEAgLTcsNyArNyw2IEBACiAg
KiBDb3B5cmlnaHQgKGMpIDIwMTUsIEJvYXogSGFycm9zaCA8Ym9hekBwbGV4aXN0b3IuY29tPi4K
ICAqLwogCi0jaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxsaW51eC9ibGtk
ZXYuaD4KICNpbmNsdWRlIDxsaW51eC9oZHJlZy5oPgogI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4K
QEAgLTI1LDYgKzI0LDggQEAKICNpbmNsdWRlIDxsaW51eC9kYXguaD4KICNpbmNsdWRlIDxsaW51
eC9uZC5oPgogI2luY2x1ZGUgPGxpbnV4L2JhY2tpbmctZGV2Lmg+CisjaW5jbHVkZSA8bGludXgv
bW0uaD4KKyNpbmNsdWRlIDxhc20vY2FjaGVmbHVzaC5oPgogI2luY2x1ZGUgInBtZW0uaCIKICNp
bmNsdWRlICJwZm4uaCIKICNpbmNsdWRlICJuZC5oIgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20t
Z2VuZXJpYy9jYWNoZWZsdXNoLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1c2guaApp
bmRleCA5MDYyNzc0OTJlYzU5Li5iZjliYjgzZTlmYzhkIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Fz
bS1nZW5lcmljL2NhY2hlZmx1c2guaAorKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL2NhY2hlZmx1
c2guaApAQCAtMiw5ICsyLDYgQEAKICNpZm5kZWYgX0FTTV9HRU5FUklDX0NBQ0hFRkxVU0hfSAog
I2RlZmluZSBfQVNNX0dFTkVSSUNfQ0FDSEVGTFVTSF9ICiAKLS8qIEtlZXAgaW5jbHVkZXMgdGhl
IHNhbWUgYWNyb3NzIGFyY2hlcy4gICovCi0jaW5jbHVkZSA8bGludXgvbW0uaD4KLQogI2RlZmlu
ZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgMAogCiAvKgotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 731D291102
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F367120499;
	Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8B8B420485
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZcYpG77DrI4zIeJSB2UM1Pr1UMrxQ6cFx59Cqt/5V3Q=; b=ibaKOjiJ0+DsvhmQb5Cy0ZbsEw
 4MXoTvEXM9pkciNqYZkd224cBpwcg3ont4mrhiWzFkrbxveVQbmnIQjzfbWBTG30MXAAJ6nXrILdT
 Fj3hq43LApqSPT6Tor25bHNJPNkgoU9x71vMW7oiPsIvo7n+OEu0cD2zv0XTflxAhVqJwi7dTDHqZ
 eKlU8hl3MWrlNs+abVDiP9a1KWiozDl75x5kSZg97J4BSnsWlhIKI94N0a/XbL0f2oCJmW3P6kDBI
 bYN2QIkMFOSgt4gLNEyQI7SH1vI0+LgPiwwWEn+zziWE55gzf1GpNhurpjb0qeJjd1VY4xN+aGM75
 6+v3YkmQ==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytRs-0004mm-7d; Sat, 17 Aug 2019 07:48:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:34 +0200
Message-Id: <20190817073253.27819-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 07/26] hexagon: clean up ioremap
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VXNlIGlvcmVtYXAgYXMgdGhlIG1haW4gaW1wbGVtZW50ZWQgZnVuY3Rpb24sIGFuZCBkZWZpbmVk
CmlvcmVtYXBfbm9jYWNoZSB0byBpdCBhcyBhIGRlcHJlY2F0ZWQgYWxpYXMuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2hleGFnb24vaW5j
bHVkZS9hc20vaW8uaCAgICAgICB8IDExICsrLS0tLS0tLS0tCiBhcmNoL2hleGFnb24va2VybmVs
L2hleGFnb25fa3N5bXMuYyB8ICAyICstCiBhcmNoL2hleGFnb24vbW0vaW9yZW1hcC5jICAgICAg
ICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2lvLmggYi9hcmNo
L2hleGFnb24vaW5jbHVkZS9hc20vaW8uaAppbmRleCBiYTFhNDQ0ZDU1YjMuLjg5NTM3ZGMxY2Y5
NyAxMDA2NDQKLS0tIGEvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2lvLmgKKysrIGIvYXJjaC9o
ZXhhZ29uL2luY2x1ZGUvYXNtL2lvLmgKQEAgLTE3MSwxNiArMTcxLDkgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIHdyaXRlbCh1MzIgZGF0YSwgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKQogI2Rl
ZmluZSB3cml0ZXdfcmVsYXhlZCBfX3Jhd193cml0ZXcKICNkZWZpbmUgd3JpdGVsX3JlbGF4ZWQg
X19yYXdfd3JpdGVsCiAKLS8qCi0gKiBOZWVkIGFuIG10eXBlIHNvbWV3aGVyZSBpbiBoZXJlLCBm
b3IgY2FjaGUgdHlwZSBkZWFscz8KLSAqIFRoaXMgaXMgcHJvYmFibHkgdG9vIGxvbmcgZm9yIGFu
IGlubGluZS4KLSAqLwotdm9pZCBfX2lvbWVtICppb3JlbWFwX25vY2FjaGUodW5zaWduZWQgbG9u
ZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cit2b2lkIF9faW9tZW0gKmlvcmVtYXAo
dW5zaWduZWQgbG9uZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7CisjZGVmaW5lIGlv
cmVtYXBfbm9jYWNoZSBpb3JlbWFwCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3Jl
bWFwKHVuc2lnbmVkIGxvbmcgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCi17Ci0JcmV0
dXJuIGlvcmVtYXBfbm9jYWNoZShwaHlzX2FkZHIsIHNpemUpOwotfQogCiBzdGF0aWMgaW5saW5l
IHZvaWQgaW91bm1hcCh2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiB7CmRpZmYgLS1naXQg
YS9hcmNoL2hleGFnb24va2VybmVsL2hleGFnb25fa3N5bXMuYyBiL2FyY2gvaGV4YWdvbi9rZXJu
ZWwvaGV4YWdvbl9rc3ltcy5jCmluZGV4IGNmODk3NGJlYjUwMC4uYjNkYmI0NzI1NzJlIDEwMDY0
NAotLS0gYS9hcmNoL2hleGFnb24va2VybmVsL2hleGFnb25fa3N5bXMuYworKysgYi9hcmNoL2hl
eGFnb24va2VybmVsL2hleGFnb25fa3N5bXMuYwpAQCAtMjAsNyArMjAsNyBAQCBFWFBPUlRfU1lN
Qk9MKF9fdm1nZXRpZSk7CiBFWFBPUlRfU1lNQk9MKF9fdm1zZXRpZSk7CiBFWFBPUlRfU1lNQk9M
KF9fdm15aWVsZCk7CiBFWFBPUlRfU1lNQk9MKGVtcHR5X3plcm9fcGFnZSk7Ci1FWFBPUlRfU1lN
Qk9MKGlvcmVtYXBfbm9jYWNoZSk7CitFWFBPUlRfU1lNQk9MKGlvcmVtYXApOwogRVhQT1JUX1NZ
TUJPTChtZW1jcHkpOwogRVhQT1JUX1NZTUJPTChtZW1zZXQpOwogCmRpZmYgLS1naXQgYS9hcmNo
L2hleGFnb24vbW0vaW9yZW1hcC5jIGIvYXJjaC9oZXhhZ29uL21tL2lvcmVtYXAuYwppbmRleCA3
N2Q4ZTFlNjllOWIuLmIxMDNkODNiNWZiYiAxMDA2NDQKLS0tIGEvYXJjaC9oZXhhZ29uL21tL2lv
cmVtYXAuYworKysgYi9hcmNoL2hleGFnb24vbW0vaW9yZW1hcC5jCkBAIC05LDcgKzksNyBAQAog
I2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KICNpbmNsdWRlIDxsaW51eC9tbS5oPgogCi12b2lk
IF9faW9tZW0gKmlvcmVtYXBfbm9jYWNoZSh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwgdW5zaWdu
ZWQgbG9uZyBzaXplKQordm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c19h
ZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiB7CiAJdW5zaWduZWQgbG9uZyBsYXN0X2FkZHIsIGFk
ZHI7CiAJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSBwaHlzX2FkZHIgJiB+UEFHRV9NQVNLOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

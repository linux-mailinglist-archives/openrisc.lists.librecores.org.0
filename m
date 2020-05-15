Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 081AB1E501E
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:11 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BDB05209DF;
	Wed, 27 May 2020 23:19:10 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id DDF2620B14
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oMznyGWmUnH+800kT8BMkDZAQHI6XtvfS5jJWouEfDQ=; b=Fil8zzWGgM7bTiLZqcGMW+YJ5z
 KWiKqxsF9PsHBsoGTjF3M1/6BpcRcrB87gg7fSSrUKG2ViuiDFILsVXTAGiiQFvWZl7302yJv2QDp
 2gdx1QAdET+uvFc0ze5HduS8IJ9srBZdOqL/1nqMHeCh3YBZQaMxq/bdZHgdR67JaPY2iVoS1shDo
 6pyU9IPRQ9Q52AD4zwxw4+qQ7zeiwXt3usfWVUxDx+fAryeslEs5RvNsfp0pYwplX4l6i6toHPASG
 mV2sWCHOlJLsWvBZ89rDzt4kZI4unFON90otMsIMyf+zqnwfQ1s79AFeTZmzqJZZ6+kGlXAlM4ASM
 cgFW93ag==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSZ-000457-1G; Fri, 15 May 2020 14:37:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:25 +0200
Message-Id: <20200515143646.3857579-9-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 08/29] alpha: use asm-generic/cacheflush.h
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

QWxwaGEgbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9mIGl0cyBvd24u
ICBSZWx5IG9uCmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBmb3IgdGhlIGRlZmF1bHRzLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9hbHBo
YS9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCAyOCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL2FscGhhL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvYWxw
aGEvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IDg5MTI4NDg5Y2I1OTguLjYzNmQ3Y2Ew
ZDA1ZjYgMTAwNjQ0Ci0tLSBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCisr
KyBiL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC00LDE5ICs0LDYgQEAK
IAogI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAKLS8qIENhY2hlcyBhcmVuJ3QgYnJhaW4tZGVhZCBv
biB0aGUgQWxwaGEuICovCi0jZGVmaW5lIGZsdXNoX2NhY2hlX2FsbCgpCQkJZG8geyB9IHdoaWxl
ICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9tbShtbSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVm
aW5lIGZsdXNoX2NhY2hlX2R1cF9tbShtbSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZs
dXNoX2NhY2hlX3JhbmdlKHZtYSwgc3RhcnQsIGVuZCkJZG8geyB9IHdoaWxlICgwKQotI2RlZmlu
ZSBmbHVzaF9jYWNoZV9wYWdlKHZtYSwgdm1hZGRyLCBwZm4pCWRvIHsgfSB3aGlsZSAoMCkKLSNk
ZWZpbmUgQVJDSF9JTVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9QQUdFIDAKLSNkZWZpbmUgZmx1c2hf
ZGNhY2hlX3BhZ2UocGFnZSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNo
ZV9tbWFwX2xvY2sobWFwcGluZykJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfZGNh
Y2hlX21tYXBfdW5sb2NrKG1hcHBpbmcpCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hf
Y2FjaGVfdm1hcChzdGFydCwgZW5kKQkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9j
YWNoZV92dW5tYXAoc3RhcnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKLQogLyogTm90ZSB0aGF0
IHRoZSBmb2xsb3dpbmcgdHdvIGRlZmluaXRpb25zIGFyZSBfaGlnaGx5XyBkZXBlbmRlbnQKICAg
IG9uIHRoZSBjb250ZXh0cyBpbiB3aGljaCB0aGV5IGFyZSB1c2VkIGluIHRoZSBrZXJuZWwuICBJ
IHBlcnNvbmFsbHkKICAgIHRoaW5rIGl0IGlzIGNyaW1pbmFsIGhvdyBsb29zZWx5IGRlZmluZWQg
dGhlc2UgbWFjcm9zIGFyZS4gICovCkBAIC01OSwyMCArNDYsMTcgQEAgZmx1c2hfaWNhY2hlX3Vz
ZXJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdlLAog
CQkJbW0tPmNvbnRleHRbc21wX3Byb2Nlc3Nvcl9pZCgpXSA9IDA7CiAJfQogfQotI2Vsc2UKKyNk
ZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2UKKyNl
bHNlIC8qIENPTkZJR19TTVAgKi8KIGV4dGVybiB2b2lkIGZsdXNoX2ljYWNoZV91c2VyX3Jhbmdl
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQlzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWdu
ZWQgbG9uZyBhZGRyLCBpbnQgbGVuKTsKLSNlbmRpZgorI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNl
cl9yYW5nZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZQorI2VuZGlmIC8qIENPTkZJR19TTVAgKi8K
IAogLyogVGhpcyBpcyB1c2VkIG9ubHkgaW4gX19kb19mYXVsdCBhbmQgZG9fc3dhcF9wYWdlLiAg
Ki8KICNkZWZpbmUgZmx1c2hfaWNhY2hlX3BhZ2Uodm1hLCBwYWdlKSBcCi0gIGZsdXNoX2ljYWNo
ZV91c2VyX3JhbmdlKCh2bWEpLCAocGFnZSksIDAsIDApCisJZmx1c2hfaWNhY2hlX3VzZXJfcmFu
Z2UoKHZtYSksIChwYWdlKSwgMCwgMCkKIAotI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSh2bWEs
IHBhZ2UsIHZhZGRyLCBkc3QsIHNyYywgbGVuKSBcCi1kbyB7IG1lbWNweShkc3QsIHNyYywgbGVu
KTsgXAotICAgICBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBhZ2UsIHZhZGRyLCBsZW4p
OyBcCi19IHdoaWxlICgwKQotI2RlZmluZSBjb3B5X2Zyb21fdXNlcl9wYWdlKHZtYSwgcGFnZSwg
dmFkZHIsIGRzdCwgc3JjLCBsZW4pIFwKLQltZW1jcHkoZHN0LCBzcmMsIGxlbikKKyNpbmNsdWRl
IDxhc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmg+CiAKICNlbmRpZiAvKiBfQUxQSEFfQ0FDSEVGTFVT
SF9IICovCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVz
Lm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8C49F1E5021
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4572520C96;
	Wed, 27 May 2020 23:19:13 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id D145420B1A
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aVQ1xLZiwZwftiaH3jhCNlEcJ33SLJz0PSYci41Jgd4=; b=OZZbKqQS7yRJ9ydeXAseXDrGPR
 pCqtvpuNCx4h0c+Kutl3MBL/FRJAKV1XNxx0NGunIFjUln9zHcpS19ogGzj5Z6lkeIHcy2Io0MHs5
 vzmFw9UizVw8q38+CxQ4klLHCYhZiIV+2NcqyeXFoeBHLUMSvZ1vTdGBBhoDSkp9aNrXq8rCDjxju
 BJC34ZsMp2go3jzsikwk4bWdY128y85jVQVtOvd5CbXvkF9hISoRVHqZIlat0xeveRmNV2PQnKYFP
 j3R6GevPGnLNNPVmlBIFC9wcp9FcuWg45rYfky2q0sROWnH7kIBgWP3rKOknfe6d8k1QCZA5b9qY5
 jb3BFk5g==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSh-0004MA-75; Fri, 15 May 2020 14:37:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:28 +0200
Message-Id: <20200515143646.3857579-12-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 11/29] hexagon: use asm-generic/cacheflush.h
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

SGV4YWdvbiBuZWVkcyBhbG1vc3Qgbm8gY2FjaGUgZmx1c2hpbmcgcm91dGluZXMgb2YgaXRzIG93
bi4gIFJlbHkgb24KYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGZvciB0aGUgZGVmYXVsdHMuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2hl
eGFnb24vaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMTkgKysrKystLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvaGV4YWdv
bi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggZmI0NDdkZTQ1ZDU0Yy4uNmVmZjA3MzBl
NmVmZCAxMDA2NDQKLS0tIGEvYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAor
KysgYi9hcmNoL2hleGFnb24vaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC0yNSwyOSArMjUs
MTcgQEAKICNkZWZpbmUgTElORVNJWkUJMzIKICNkZWZpbmUgTElORUJJVFMJNQogCi0jZGVmaW5l
IGZsdXNoX2NhY2hlX2FsbCgpCQkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNo
ZV9tbShtbSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX2R1cF9tbSht
bSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3JhbmdlKHZtYSwgc3Rh
cnQsIGVuZCkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9wYWdlKHZtYSwg
dm1hZGRyLCBwZm4pCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgQVJDSF9JTVBMRU1FTlRTX0ZM
VVNIX0RDQUNIRV9QQUdFIDAKLSNkZWZpbmUgZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSkJCQlkbyB7
IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFwX2xvY2sobWFwcGluZykJCWRv
IHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfdW5sb2NrKG1hcHBpbmcp
CWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3BhZ2Uodm1hLCBwZykJCWRv
IHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2Uodm1hLCBwZywg
YWRyLCBsZW4pCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfdm1hcChzdGFy
dCwgZW5kKQkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV92dW5tYXAoc3Rh
cnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKLQogLyoKICAqIEZsdXNoIERjYWNoZSByYW5nZSB0
aHJvdWdoIGN1cnJlbnQgbWFwLgogICovCiBleHRlcm4gdm9pZCBmbHVzaF9kY2FjaGVfcmFuZ2Uo
dW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOworI2RlZmluZSBmbHVzaF9k
Y2FjaGVfcmFuZ2UgZmx1c2hfZGNhY2hlX3JhbmdlCiAKIC8qCiAgKiBGbHVzaCBJY2FjaGUgcmFu
Z2UgdGhyb3VnaCBjdXJyZW50IG1hcC4KICAqLwogZXh0ZXJuIHZvaWQgZmx1c2hfaWNhY2hlX3Jh
bmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKKyNkZWZpbmUgZmx1
c2hfaWNhY2hlX3JhbmdlIGZsdXNoX2ljYWNoZV9yYW5nZQogCiAvKgogICogTWVtb3J5LW1hbmFn
ZW1lbnQgcmVsYXRlZCBmbHVzaGVzIGFyZSB0aGVyZSB0byBlbnN1cmUgaW4gbm9uLXBoeXNpY2Fs
bHkKQEAgLTc4LDYgKzY2LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAKIHZvaWQgY29weV90b191c2VyX3BhZ2Uoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHN0cnVjdCBwYWdlICpwYWdlLAogCQkgICAgICAgdW5z
aWduZWQgbG9uZyB2YWRkciwgdm9pZCAqZHN0LCB2b2lkICpzcmMsIGludCBsZW4pOworI2RlZmlu
ZSBjb3B5X3RvX3VzZXJfcGFnZSBjb3B5X3RvX3VzZXJfcGFnZQogCiAjZGVmaW5lIGNvcHlfZnJv
bV91c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAogCW1lbWNweShk
c3QsIHNyYywgbGVuKQpAQCAtODUsNCArNzQsNiBAQCB2b2lkIGNvcHlfdG9fdXNlcl9wYWdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIGV4dGVybiB2b2lk
IGhleGFnb25faW52X2RjYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBs
b25nIGVuZCk7CiBleHRlcm4gdm9pZCBoZXhhZ29uX2NsZWFuX2RjYWNoZV9yYW5nZSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CiAKKyNpbmNsdWRlIDxhc20tZ2VuZXJp
Yy9jYWNoZWZsdXNoLmg+CisKICNlbmRpZgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJ
U0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0
aW5mby9vcGVucmlzYwo=

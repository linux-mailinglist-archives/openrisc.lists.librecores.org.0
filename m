Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id BBEF21E5020
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 74F39202EE;
	Wed, 27 May 2020 23:19:12 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 12A4B20B25
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tuZN2xrlpt1mzaSPTZQmZcxarUCgYHN/WWoYWZD5CMA=; b=OENN5BUCXaUFPu7vI1494p7r4i
 S2dWDz0q6EWysp938RuBPRMV7kgePBmLH86pBEtpSxJyy42RL6Y+aCvaXjvJsMsI0Y4cyNO31G5iS
 EDmw72wTcCGqP425Pzg2PhrQeX9C+wPmSNKyptdRpxxMAO8Jbpjz23AKJX/zySzDflvnXEYd/KAWK
 vmOpVRfCzg8IGj9xt5P0AqH8hWqou3lR/3g0g4llT+vsNPlUKFazS2BA6cnVS0ADrmPONbFmj9wV2
 JISTWNjwp8dRFxxV5zRFRImsFzOhhILf6BR9L1clZ+G5XbmEr/KM3Eliay6Xe7YkhFBk3k/YJSHzP
 0aBKdEYw==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSb-0004At-Ol; Fri, 15 May 2020 14:37:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:26 +0200
Message-Id: <20200515143646.3857579-10-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 09/29] arm64: use asm-generic/cacheflush.h
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

QVJNNjQgbmVlZHMgYWxtb3N0IG5vIGNhY2hlIGZsdXNoaW5nIHJvdXRpbmVzIG9mIGl0cyBvd24u
ICBSZWx5IG9uCmFzbS1nZW5lcmljL2NhY2hlZmx1c2guaCBmb3IgdGhlIGRlZmF1bHRzLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCA0NiArKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCBlNmNjYTNkNGFjZjcwLi4wM2E1YTE4
NzE2M2FiIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAor
KysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApAQCAtOTQsMjAgKzk0LDcg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKICNlbmRpZgogCWtpY2tfYWxsX2NwdXNfc3luYygpOwog
fQotCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfbW0oc3RydWN0IG1tX3N0cnVjdCAq
bW0pCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV9wYWdlKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCSAgICB1bnNpZ25lZCBsb25nIHVzZXJfYWRkciwgdW5z
aWduZWQgbG9uZyBwZm4pCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV9y
YW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCQkgICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQotewotfQorI2RlZmluZSBmbHVzaF9pY2FjaGVfcmFu
Z2UgZmx1c2hfaWNhY2hlX3JhbmdlCiAKIC8qCiAgKiBDYWNoZSBtYWludGVuYW5jZSBmdW5jdGlv
bnMgdXNlZCBieSB0aGUgRE1BIEFQSS4gTm8gdG8gYmUgdXNlZCBkaXJlY3RseS4KQEAgLTEyMywx
MiArMTEwLDcgQEAgZXh0ZXJuIHZvaWQgX19kbWFfZmx1c2hfYXJlYShjb25zdCB2b2lkICosIHNp
emVfdCk7CiAgKi8KIGV4dGVybiB2b2lkIGNvcHlfdG9fdXNlcl9wYWdlKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqLCBzdHJ1Y3QgcGFnZSAqLAogCXVuc2lnbmVkIGxvbmcsIHZvaWQgKiwgY29uc3Qg
dm9pZCAqLCB1bnNpZ25lZCBsb25nKTsKLSNkZWZpbmUgY29weV9mcm9tX3VzZXJfcGFnZSh2bWEs
IHBhZ2UsIHZhZGRyLCBkc3QsIHNyYywgbGVuKSBcCi0JZG8gewkJCQkJCQlcCi0JCW1lbWNweShk
c3QsIHNyYywgbGVuKTsJCQkJXAotCX0gd2hpbGUgKDApCi0KLSNkZWZpbmUgZmx1c2hfY2FjaGVf
ZHVwX21tKG1tKSBmbHVzaF9jYWNoZV9tbShtbSkKKyNkZWZpbmUgY29weV90b191c2VyX3BhZ2Ug
Y29weV90b191c2VyX3BhZ2UKIAogLyoKICAqIGZsdXNoX2RjYWNoZV9wYWdlIGlzIHVzZWQgd2hl
biB0aGUga2VybmVsIGhhcyB3cml0dGVuIHRvIHRoZSBwYWdlCkBAIC0xNTQsMjkgKzEzNiwxMSBA
QCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX19mbHVzaF9pY2FjaGVfYWxsKHZvaWQpCiAJ
ZHNiKGlzaCk7CiB9CiAKLSNkZWZpbmUgZmx1c2hfZGNhY2hlX21tYXBfbG9jayhtYXBwaW5nKQkJ
ZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF91bmxvY2sobWFwcGlu
ZykJZG8geyB9IHdoaWxlICgwKQotCi0vKgotICogV2UgZG9uJ3QgYXBwZWFyIHRvIG5lZWQgdG8g
ZG8gYW55dGhpbmcgaGVyZS4gIEluIGZhY3QsIGlmIHdlIGRpZCwgd2UnZAotICogZHVwbGljYXRl
IGNhY2hlIGZsdXNoaW5nIGVsc2V3aGVyZSBwZXJmb3JtZWQgYnkgZmx1c2hfZGNhY2hlX3BhZ2Uo
KS4KLSAqLwotI2RlZmluZSBmbHVzaF9pY2FjaGVfcGFnZSh2bWEscGFnZSkJZG8geyB9IHdoaWxl
ICgwKQotCi0vKgotICogTm90IHJlcXVpcmVkIG9uIEFBcmNoNjQgKFBJUFQgb3IgVklQVCBub24t
YWxpYXNpbmcgRC1jYWNoZSkuCi0gKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92
bWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQotewotfQotCi1zdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfdnVubWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kKQotewotfQotCiBpbnQgc2V0X21lbW9yeV92YWxpZCh1bnNpZ25lZCBs
b25nIGFkZHIsIGludCBudW1wYWdlcywgaW50IGVuYWJsZSk7CiAKIGludCBzZXRfZGlyZWN0X21h
cF9pbnZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UpOwogaW50IHNldF9kaXJlY3RfbWFw
X2RlZmF1bHRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7CiAKLSNlbmRpZgorI2luY2x1ZGUg
PGFzbS1nZW5lcmljL2NhY2hlZmx1c2guaD4KKworI2VuZGlmIC8qIF9fQVNNX0NBQ0hFRkxVU0hf
SCAqLwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

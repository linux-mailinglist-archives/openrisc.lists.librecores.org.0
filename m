Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBC51CD2FF
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 53C6D20B45;
	Mon, 11 May 2020 09:41:44 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 2981020B0D
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cvHE8T+77q41/s5pbmeeFx20Yc/7Q0qwMuv6xWW3l6I=; b=jlK1Xs8XOiQdJdv7gpNa3REBfJ
 lKDncop+Y526zHO1c09ue1tsmhy62YQyiSpNNvf9Z4ZiahLKpzU5P3cKQwGa3wRBS21LxCJ+UZPdV
 TqXx0dDp1ex3qgEPGRMdsmsVQWk8VWUA/XwQ3spbpVkdet+Fx/6LdFegRiK0VvqDFauGCTifl7FIo
 ozHm9qxAO/E1eaZXqyAiAGu+kIvh89bMRzJO3COACFVaAM1d1qwIzGIAqxzXn4Hejh2FDqf2BbSiy
 tqbHC1RnB1LqHQnHEE3mNdC+VmnevO9wt6X/Mn0KLLAR8uewyCde2S9ooRg1B4KvRdt8lE46KfQMq
 +BdApNmA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgon-0000fq-HE; Sun, 10 May 2020 07:56:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:58 +0200
Message-Id: <20200510075510.987823-20-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 19/31] riscv: use asm-generic/cacheflush.h
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

UklTQy1WIG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5lcyBvZiBpdHMgb3du
LiAgUmVseSBvbgphc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggZm9yIHRoZSBkZWZhdWx0cy4KCkFs
c28gcmVtb3ZlIHRoZSBwb2ludGxlc3MgX19LRVJORUxfXyBpZmRlZiB3aGlsZSB3ZSdyZSBhdCBp
dC4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8IDYyICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hl
Zmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCmluZGV4IGM4Njc3
Yzc1ZjgyY2IuLmExNjdiNGZiZGYwMDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5o
CkBAIC04LDY1ICs4LDYgQEAKIAogI2luY2x1ZGUgPGxpbnV4L21tLmg+CiAKLSNkZWZpbmUgQVJD
SF9JTVBMRU1FTlRTX0ZMVVNIX0RDQUNIRV9QQUdFIDAKLQotLyoKLSAqIFRoZSBjYWNoZSBkb2Vz
bid0IG5lZWQgdG8gYmUgZmx1c2hlZCB3aGVuIFRMQiBlbnRyaWVzIGNoYW5nZSB3aGVuCi0gKiB0
aGUgY2FjaGUgaXMgbWFwcGVkIHRvIHBoeXNpY2FsIG1lbW9yeSwgbm90IHZpcnR1YWwgbWVtb3J5
Ci0gKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV9hbGwodm9pZCkKLXsKLX0KLQot
c3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2NhY2hlX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQot
ewotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfZHVwX21tKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQotewotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfcmFuZ2Uo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0JCQkJICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0
LAotCQkJCSAgICAgdW5zaWduZWQgbG9uZyBlbmQpCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF9jYWNoZV9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCSAgICB1
bnNpZ25lZCBsb25nIHZtYWRkciwKLQkJCQkgICAgdW5zaWduZWQgbG9uZyBwZm4pCi17Ci19Ci0K
LXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nKQotewotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hl
X21tYXBfdW5sb2NrKHN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nKQotewotfQotCi1zdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfaWNhY2hlX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsCi0JCQkJICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSkKLXsKLX0KLQotc3RhdGljIGlubGluZSB2
b2lkIGZsdXNoX2NhY2hlX3ZtYXAodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBl
bmQpCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92dW5tYXAodW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCi17Ci19Ci0KLSNkZWZpbmUgY29weV90
b191c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAotCWRvIHsgXAot
CQltZW1jcHkoZHN0LCBzcmMsIGxlbik7IFwKLQkJZmx1c2hfaWNhY2hlX3VzZXJfcmFuZ2Uodm1h
LCBwYWdlLCB2YWRkciwgbGVuKTsgXAotCX0gd2hpbGUgKDApCi0jZGVmaW5lIGNvcHlfZnJvbV91
c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAotCW1lbWNweShkc3Qs
IHNyYywgbGVuKQotCiBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCh2
b2lkKQogewogCWFzbSB2b2xhdGlsZSAoImZlbmNlLmkiIDo6OiAibWVtb3J5Iik7CkBAIC03OSw2
ICsyMCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9kY2FjaGVfcGFnZShzdHJ1Y3QgcGFn
ZSAqcGFnZSkKIAlpZiAodGVzdF9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGFnZS0+ZmxhZ3MpKQog
CQljbGVhcl9iaXQoUEdfZGNhY2hlX2NsZWFuLCAmcGFnZS0+ZmxhZ3MpOwogfQorI2RlZmluZSBB
UkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgMQogCiAvKgogICogUklTQy1WIGRvZXNu
J3QgaGF2ZSBhbiBpbnN0cnVjdGlvbiB0byBmbHVzaCBwYXJ0cyBvZiB0aGUgaW5zdHJ1Y3Rpb24g
Y2FjaGUsCkBAIC0xMDUsNCArNDcsNiBAQCB2b2lkIGZsdXNoX2ljYWNoZV9tbShzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgYm9vbCBsb2NhbCk7CiAjZGVmaW5lIFNZU19SSVNDVl9GTFVTSF9JQ0FDSEVf
TE9DQUwgMVVMCiAjZGVmaW5lIFNZU19SSVNDVl9GTFVTSF9JQ0FDSEVfQUxMICAgKFNZU19SSVND
Vl9GTFVTSF9JQ0FDSEVfTE9DQUwpCiAKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9jYWNoZWZsdXNo
Lmg+CisKICNlbmRpZiAvKiBfQVNNX1JJU0NWX0NBQ0hFRkxVU0hfSCAqLwotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

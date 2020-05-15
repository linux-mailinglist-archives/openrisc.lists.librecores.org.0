Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 361441E503C
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:32 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BC56920CA6;
	Wed, 27 May 2020 23:19:31 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 3249920B2B
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HDHNR2vMO5LCySRH/6CT3QqjRsqvFZVzPMz3Qt7mA6o=; b=uAJfNv2TDWJ9JRrcHAJUafDd9C
 KT8Rx9Bi4XWFozwmwOOqZsw3N64RQD9ErU02DTmQP9wUNQOf0ctXrgMstAhzy0XcLClxnojVhMHSL
 o72cLiKWcbAIxAAtk5tDJ2JYF1SW/wJ3VMFyTu5yg8VxbDKil5E1qyNe7QfJqzY6uJ5PuwL7F7x5x
 h0OKHzVB/oQMCDqHug9II4XGGw5HWXk4POJ5jWRB8Q+9GgljbxEiBFOxvUQ8fBl1TxTd3GPm8pcbk
 CRNY1ZY6VC2rGV672WS/7S3Fxet+aDqDNd+FrRNCSE5AhEyFilH0csXCrw8hA1FZtyztlIyN9YIAY
 aP4syW4g==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbT0-0004m1-QX; Fri, 15 May 2020 14:37:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:34 +0200
Message-Id: <20200515143646.3857579-18-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 17/29] riscv: use asm-generic/cacheflush.h
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
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

UklTQy1WIG5lZWRzIGFsbW9zdCBubyBjYWNoZSBmbHVzaGluZyByb3V0aW5lcyBvZiBpdHMgb3du
LiAgUmVseSBvbgphc20tZ2VuZXJpYy9jYWNoZWZsdXNoLmggZm9yIHRoZSBkZWZhdWx0cy4KCkFs
c28gcmVtb3ZlIHRoZSBwb2ludGxlc3MgX19LRVJORUxfXyBpZmRlZiB3aGlsZSB3ZSdyZSBhdCBp
dC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdl
ZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KQWNrZWQtYnk6
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+Ci0tLQogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCA2MiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCBjODY3N2M3NWY4MmNiLi5hMTY3YjRm
YmRmMDA3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaApAQCAtOCw2NSArOCw2IEBA
CiAKICNpbmNsdWRlIDxsaW51eC9tbS5oPgogCi0jZGVmaW5lIEFSQ0hfSU1QTEVNRU5UU19GTFVT
SF9EQ0FDSEVfUEFHRSAwCi0KLS8qCi0gKiBUaGUgY2FjaGUgZG9lc24ndCBuZWVkIHRvIGJlIGZs
dXNoZWQgd2hlbiBUTEIgZW50cmllcyBjaGFuZ2Ugd2hlbgotICogdGhlIGNhY2hlIGlzIG1hcHBl
ZCB0byBwaHlzaWNhbCBtZW1vcnksIG5vdCB2aXJ0dWFsIG1lbW9yeQotICovCi1zdGF0aWMgaW5s
aW5lIHZvaWQgZmx1c2hfY2FjaGVfYWxsKHZvaWQpCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF9jYWNoZV9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKLXsKLX0KLQotc3RhdGljIGlu
bGluZSB2b2lkIGZsdXNoX2NhY2hlX2R1cF9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKLXsKLX0K
LQotc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2NhY2hlX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAotCQkJCSAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwKLQkJCQkgICAgIHVuc2ln
bmVkIGxvbmcgZW5kKQotewotfQotCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfcGFn
ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCQkgICAgdW5zaWduZWQgbG9uZyB2bWFk
ZHIsCi0JCQkJICAgIHVuc2lnbmVkIGxvbmcgcGZuKQotewotfQotCi1zdGF0aWMgaW5saW5lIHZv
aWQgZmx1c2hfZGNhY2hlX21tYXBfbG9jayhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZykK
LXsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9tbWFwX3VubG9jayhzdHJ1
Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZykKLXsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIGZs
dXNoX2ljYWNoZV9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCSAgICAgc3Ry
dWN0IHBhZ2UgKnBhZ2UpCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF9jYWNoZV92
bWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKQotewotfQotCi1zdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfY2FjaGVfdnVubWFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kKQotewotfQotCi0jZGVmaW5lIGNvcHlfdG9fdXNlcl9wYWdlKHZtYSwg
cGFnZSwgdmFkZHIsIGRzdCwgc3JjLCBsZW4pIFwKLQlkbyB7IFwKLQkJbWVtY3B5KGRzdCwgc3Jj
LCBsZW4pOyBcCi0JCWZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHZtYSwgcGFnZSwgdmFkZHIsIGxl
bik7IFwKLQl9IHdoaWxlICgwKQotI2RlZmluZSBjb3B5X2Zyb21fdXNlcl9wYWdlKHZtYSwgcGFn
ZSwgdmFkZHIsIGRzdCwgc3JjLCBsZW4pIFwKLQltZW1jcHkoZHN0LCBzcmMsIGxlbikKLQogc3Rh
dGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwodm9pZCkKIHsKIAlhc20gdm9s
YXRpbGUgKCJmZW5jZS5pIiA6OjogIm1lbW9yeSIpOwpAQCAtNzksNiArMjAsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJaWYgKHRl
c3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKSkKIAkJY2xlYXJfYml0KFBHX2Rj
YWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKTsKIH0KKyNkZWZpbmUgQVJDSF9JTVBMRU1FTlRTX0ZM
VVNIX0RDQUNIRV9QQUdFIDEKIAogLyoKICAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1
Y3Rpb24gdG8gZmx1c2ggcGFydHMgb2YgdGhlIGluc3RydWN0aW9uIGNhY2hlLApAQCAtMTA1LDQg
KzQ3LDYgQEAgdm9pZCBmbHVzaF9pY2FjaGVfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0sIGJvb2wg
bG9jYWwpOwogI2RlZmluZSBTWVNfUklTQ1ZfRkxVU0hfSUNBQ0hFX0xPQ0FMIDFVTAogI2RlZmlu
ZSBTWVNfUklTQ1ZfRkxVU0hfSUNBQ0hFX0FMTCAgIChTWVNfUklTQ1ZfRkxVU0hfSUNBQ0hFX0xP
Q0FMKQogCisjaW5jbHVkZSA8YXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oPgorCiAjZW5kaWYgLyog
X0FTTV9SSVNDVl9DQUNIRUZMVVNIX0ggKi8KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

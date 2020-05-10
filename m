Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CAC781CD2FB
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A53DA20B34;
	Mon, 11 May 2020 09:41:42 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id EBBC120B10
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0vCVbab8LqnKZMFTDjGS9z17LyCubzzTTEgfa/2l87E=; b=rAiC/Hd8WPxcdGaIK+YBLYo+Go
 2gdb6jgo+qIX00NX0gZ0E+3b3c5nv/Dy3HV4HYwpBO687h4Jo4Ltc0/42GPCymSSypI+qfueG7jRN
 EjPY1/bZA2gpsMgGxph2x0ffB30PGYC9WDHVgo5V8UbC6iLbsl8NLNBugNIL6HdA1DXxEBmVLxofZ
 o6CCGkpWdTkJS/zcOZKpp/pR9nF8jp8S78k9CzBYNa5xIIlcLYmup1VX0Tj4aLywsF3GAmpXO7bXb
 VDpmIrif9kqxg1zp3WDOuB4HrEZ5UDdkvHo/lV/KxLTQBo3jDoSl1xCgsc9x4txt/7k7TYHvSLC5t
 KgFSbZ+g==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgoa-0000I5-Dh; Sun, 10 May 2020 07:56:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:54 +0200
Message-Id: <20200510075510.987823-16-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 15/31] microblaze: use asm-generic/cacheflush.h
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

TWljcm9ibGF6ZSBuZWVkcyBhbG1vc3Qgbm8gY2FjaGUgZmx1c2hpbmcgcm91dGluZXMgb2YgaXRz
IG93bi4gIFJlbHkgb24KYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGZvciB0aGUgZGVmYXVsdHMu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNo
L21pY3JvYmxhemUvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMjkgKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9hcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5o
IGIvYXJjaC9taWNyb2JsYXplL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAppbmRleCAxMWY1NmM4
NTA1NmJiLi4zOWY4ZmI2NzY4ZDhiIDEwMDY0NAotLS0gYS9hcmNoL21pY3JvYmxhemUvaW5jbHVk
ZS9hc20vY2FjaGVmbHVzaC5oCisrKyBiL2FyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9jYWNo
ZWZsdXNoLmgKQEAgLTU3LDkgKzU3LDYgQEAgdm9pZCBtaWNyb2JsYXplX2NhY2hlX2luaXQodm9p
ZCk7CiAjZGVmaW5lIGludmFsaWRhdGVfaWNhY2hlKCkJCQkJbWJjLT5paW4oKTsKICNkZWZpbmUg
aW52YWxpZGF0ZV9pY2FjaGVfcmFuZ2Uoc3RhcnQsIGVuZCkJCW1iYy0+aWlucihzdGFydCwgZW5k
KTsKIAotI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBnLCBhZHIsIGxlbikJ
Zmx1c2hfaWNhY2hlKCk7Ci0jZGVmaW5lIGZsdXNoX2ljYWNoZV9wYWdlKHZtYSwgcGcpCQkJZG8g
eyB9IHdoaWxlICgwKQotCiAjZGVmaW5lIGVuYWJsZV9kY2FjaGUoKQkJCQkJbWJjLT5kZSgpOwog
I2RlZmluZSBkaXNhYmxlX2RjYWNoZSgpCQkJCW1iYy0+ZGQoKTsKIC8qIEZJWE1FIGZvciBMTC10
ZW1hYyBkcml2ZXIgKi8KQEAgLTc3LDI3ICs3NCw5IEBAIGRvIHsgXAogCWZsdXNoX2RjYWNoZV9y
YW5nZSgodW5zaWduZWQpIChhZGRyKSwgKHVuc2lnbmVkKSAoYWRkcikgKyBQQUdFX1NJWkUpOyBc
CiB9IHdoaWxlICgwKTsKIAotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKG1hcHBpbmcp
CQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFwX3VubG9jayhtYXBw
aW5nKQlkbyB7IH0gd2hpbGUgKDApCi0KLSNkZWZpbmUgZmx1c2hfY2FjaGVfZHVwX21tKG1tKQkJ
CQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3ZtYXAoc3RhcnQsIGVuZCkJ
CQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3Z1bm1hcChzdGFydCwgZW5k
KQkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfbW0obW0pCQkJZG8geyB9
IHdoaWxlICgwKQotCiAjZGVmaW5lIGZsdXNoX2NhY2hlX3BhZ2Uodm1hLCB2bWFkZHIsIHBmbikg
XAogCWZsdXNoX2RjYWNoZV9yYW5nZShwZm4gPDwgUEFHRV9TSElGVCwgKHBmbiA8PCBQQUdFX1NI
SUZUKSArIFBBR0VfU0laRSk7CiAKLS8qIE1TOiBrZ2RiIGNvZGUgdXNlIHRoaXMgbWFjcm8sIHdy
b25nIGxlbiB3aXRoIEZMQVNIICovCi0jaWYgMAotI2RlZmluZSBmbHVzaF9jYWNoZV9yYW5nZSh2
bWEsIHN0YXJ0LCBsZW4pCXsJXAotCWZsdXNoX2ljYWNoZV9yYW5nZSgodW5zaWduZWQpIChzdGFy
dCksICh1bnNpZ25lZCkgKHN0YXJ0KSArIChsZW4pKTsgXAotCWZsdXNoX2RjYWNoZV9yYW5nZSgo
dW5zaWduZWQpIChzdGFydCksICh1bnNpZ25lZCkgKHN0YXJ0KSArIChsZW4pKTsgXAotfQotI2Vu
ZGlmCi0KLSNkZWZpbmUgZmx1c2hfY2FjaGVfcmFuZ2Uodm1hLCBzdGFydCwgbGVuKSBkbyB7IH0g
d2hpbGUgKDApCi0KIHN0YXRpYyBpbmxpbmUgdm9pZCBjb3B5X3RvX3VzZXJfcGFnZShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJCQkgICAgIHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25l
ZCBsb25nIHZhZGRyLAogCQkJCSAgICAgdm9pZCAqZHN0LCB2b2lkICpzcmMsIGludCBsZW4pCkBA
IC0xMDksMTIgKzg4LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGNvcHlfdG9fdXNlcl9wYWdlKHN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQlmbHVzaF9kY2FjaGVfcmFuZ2UoYWRkciwgYWRk
ciArIFBBR0VfU0laRSk7CiAJfQogfQorI2RlZmluZSBjb3B5X3RvX3VzZXJfcGFnZSBjb3B5X3Rv
X3VzZXJfcGFnZQogCi1zdGF0aWMgaW5saW5lIHZvaWQgY29weV9mcm9tX3VzZXJfcGFnZShzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJCQkgICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UsIHVu
c2lnbmVkIGxvbmcgdmFkZHIsCi0JCQkJICAgICAgIHZvaWQgKmRzdCwgdm9pZCAqc3JjLCBpbnQg
bGVuKQotewotCW1lbWNweShkc3QsIHNyYywgbGVuKTsKLX0KKyNpbmNsdWRlIDxhc20tZ2VuZXJp
Yy9jYWNoZWZsdXNoLmg+CiAKICNlbmRpZiAvKiBfQVNNX01JQ1JPQkxBWkVfQ0FDSEVGTFVTSF9I
ICovCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9y
ZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

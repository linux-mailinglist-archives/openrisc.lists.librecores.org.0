Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 026BA1E5037
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:28 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B861320CB4;
	Wed, 27 May 2020 23:19:27 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 1099620B27
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8Bf5PQavcsPSk/30moW6k6biuN3Qcs8ONGd4UJ1YFiA=; b=W5kTDVZULzZpxH3nY2FA8EeWtC
 0pxyBdBG5EpPvyEV/Z9cblrqAO9N+qw+On7PqqrTZSrzr1RPRzT0Phkdj87X2ZkuR7CYFd5S+eevF
 0n9RgWvPZ7i7a5oAMZ97LJaLFd1pmN4dBgXCs6eEwOt8KECPC0rehSxD0JfrVfkON6hWEG8uvCKEo
 RE3Nh1w1ujF7q1ih51KWgBKH42wZuT8D/Z+87xmnMUHz66GFWEvo7/Z/1jxMfp8DfHA1EpdUhRJ90
 TDY+NbvF/S/3K0Xiky7/Ae8WckmjKhSIVCbnN11xUn1hKvhHlkCoTI3WbTQGOdOqP3J9XDfCsY7da
 18ZV6AZA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSk-0004PG-IT; Fri, 15 May 2020 14:37:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:29 +0200
Message-Id: <20200515143646.3857579-13-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 12/29] ia64: use asm-generic/cacheflush.h
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

SUE2NCBuZWVkcyBhbG1vc3Qgbm8gY2FjaGUgZmx1c2hpbmcgcm91dGluZXMgb2YgaXRzIG93bi4g
IFJlbHkgb24KYXNtLWdlbmVyaWMvY2FjaGVmbHVzaC5oIGZvciB0aGUgZGVmYXVsdHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2lhNjQv
aW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oIHwgMjggKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9pYTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCBiL2FyY2gvaWE2NC9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKaW5kZXggNmQzNDc4ZjhhYmM4OS4uYThmMWM4NmFjMjQy
YSAxMDA2NDQKLS0tIGEvYXJjaC9pYTY0L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAorKysgYi9h
cmNoL2lhNjQvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCkBAIC0xMiw0NCArMTIsMjIgQEAKIAog
I2luY2x1ZGUgPGFzbS9wYWdlLmg+CiAKLS8qCi0gKiBDYWNoZSBmbHVzaGluZyByb3V0aW5lcy4g
IFRoaXMgaXMgdGhlIGtpbmQgb2Ygc3R1ZmYgdGhhdCBjYW4gYmUgdmVyeSBleHBlbnNpdmUsIHNv
IHRyeQotICogdG8gYXZvaWQgdGhlbSB3aGVuZXZlciBwb3NzaWJsZS4KLSAqLwotCi0jZGVmaW5l
IGZsdXNoX2NhY2hlX2FsbCgpCQkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNo
ZV9tbShtbSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX2R1cF9tbSht
bSkJCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3JhbmdlKHZtYSwgc3Rh
cnQsIGVuZCkJZG8geyB9IHdoaWxlICgwKQotI2RlZmluZSBmbHVzaF9jYWNoZV9wYWdlKHZtYSwg
dm1hZGRyLCBwZm4pCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfaWNhY2hlX3BhZ2Uo
dm1hLHBhZ2UpCQlkbyB7IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2NhY2hlX3ZtYXAoc3Rh
cnQsIGVuZCkJCWRvIHsgfSB3aGlsZSAoMCkKLSNkZWZpbmUgZmx1c2hfY2FjaGVfdnVubWFwKHN0
YXJ0LCBlbmQpCQlkbyB7IH0gd2hpbGUgKDApCi0KICNkZWZpbmUgQVJDSF9JTVBMRU1FTlRTX0ZM
VVNIX0RDQUNIRV9QQUdFIDEKICNkZWZpbmUgZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSkJCQlcCiBk
byB7CQkJCQkJXAogCWNsZWFyX2JpdChQR19hcmNoXzEsICYocGFnZSktPmZsYWdzKTsJXAogfSB3
aGlsZSAoMCkKIAotI2RlZmluZSBmbHVzaF9kY2FjaGVfbW1hcF9sb2NrKG1hcHBpbmcpCQlkbyB7
IH0gd2hpbGUgKDApCi0jZGVmaW5lIGZsdXNoX2RjYWNoZV9tbWFwX3VubG9jayhtYXBwaW5nKQlk
byB7IH0gd2hpbGUgKDApCi0KLWV4dGVybiB2b2lkIGZsdXNoX2ljYWNoZV9yYW5nZSAodW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOworZXh0ZXJuIHZvaWQgZmx1c2hfaWNh
Y2hlX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsKKyNkZWZp
bmUgZmx1c2hfaWNhY2hlX3JhbmdlIGZsdXNoX2ljYWNoZV9yYW5nZQogZXh0ZXJuIHZvaWQgY2xm
bHVzaF9jYWNoZV9yYW5nZSh2b2lkICphZGRyLCBpbnQgc2l6ZSk7CiAKLQogI2RlZmluZSBmbHVz
aF9pY2FjaGVfdXNlcl9yYW5nZSh2bWEsIHBhZ2UsIHVzZXJfYWRkciwgbGVuKQkJCQkJXAogZG8g
ewkJCQkJCQkJCQkJCVwKIAl1bnNpZ25lZCBsb25nIF9hZGRyID0gKHVuc2lnbmVkIGxvbmcpIHBh
Z2VfYWRkcmVzcyhwYWdlKSArICgodXNlcl9hZGRyKSAmIH5QQUdFX01BU0spOwlcCiAJZmx1c2hf
aWNhY2hlX3JhbmdlKF9hZGRyLCBfYWRkciArIChsZW4pKTsJCQkJCQlcCiB9IHdoaWxlICgwKQog
Ci0jZGVmaW5lIGNvcHlfdG9fdXNlcl9wYWdlKHZtYSwgcGFnZSwgdmFkZHIsIGRzdCwgc3JjLCBs
ZW4pIFwKLWRvIHsgbWVtY3B5KGRzdCwgc3JjLCBsZW4pOyBcCi0gICAgIGZsdXNoX2ljYWNoZV91
c2VyX3JhbmdlKHZtYSwgcGFnZSwgdmFkZHIsIGxlbik7IFwKLX0gd2hpbGUgKDApCi0jZGVmaW5l
IGNvcHlfZnJvbV91c2VyX3BhZ2Uodm1hLCBwYWdlLCB2YWRkciwgZHN0LCBzcmMsIGxlbikgXAot
CW1lbWNweShkc3QsIHNyYywgbGVuKQorI2luY2x1ZGUgPGFzbS1nZW5lcmljL2NhY2hlZmx1c2gu
aD4KIAogI2VuZGlmIC8qIF9BU01fSUE2NF9DQUNIRUZMVVNIX0ggKi8KLS0gCjIuMjYuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

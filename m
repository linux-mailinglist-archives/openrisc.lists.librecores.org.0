Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id CA7B39110D
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 81352204AF;
	Sat, 17 Aug 2019 17:02:41 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id D0DE120494
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dP+ujv8B5sl0YlnSgxS8r+w/4TdzJ+SZ48k1rsxBw8k=; b=Hd4hsIW6JTnWNjSZNsuIEDzHOA
 Euy9L/8/55h5PSHMyo6WEYMsm6Yr4A/ZYQwo+JxqXuiJZYcacOygl8Rh2X+8tg2w7YI9sQsZldb8h
 asRRJ/On/DLCo+4iR9Af+qc6mItJseUSzabOikFjKgwaTVN8xvww5HOSF4IQYeAFX2r6ZhvokMl9O
 uKx4lu1Kbm5cp7JTLPSVGPQAaHF6GC+2VM8QtDpbTubKp07/mB2mzhfblqbyVec61f0V1yMr/FRNV
 nmHgdedFld5Xkr6gEFIknn4+TELika1DFM7BNy81Fuq0KwTtcXrZ7C+6Jc4/iZEaaNw8VfTsEfyRN
 sqfZJzdw==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSU-0005OE-M1; Sat, 17 Aug 2019 07:49:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:45 +0200
Message-Id: <20190817073253.27819-19-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 18/26] m68k: rename __iounmap and mark it static
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

bTY4ayB1c2VzIF9faW91bm1hcCBhcyB0aGUgbmFtZSBmb3IgYW4gaW50ZXJuYWwgaGVscGVyIHRo
YXQgaXMgb25seQp1c2VkIGZvciBzb21lIENQVSB0eXBlcy4gIE1hcmsgaXQgc3RhdGljIGFuZCBn
aXZlIGl0IGEgYmV0dGVyIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KLS0tCiBhcmNoL202OGsvaW5jbHVkZS9hc20va21hcC5oIHwgMSAtCiBhcmNo
L202OGsvbW0va21hcC5jICAgICAgICAgIHwgOSArKysrKystLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9p
bmNsdWRlL2FzbS9rbWFwLmggYi9hcmNoL202OGsvaW5jbHVkZS9hc20va21hcC5oCmluZGV4IDQy
MWI2YzljNzY5ZC4uNTU5Y2I5MWJlZGUxIDEwMDY0NAotLS0gYS9hcmNoL202OGsvaW5jbHVkZS9h
c20va21hcC5oCisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9rbWFwLmgKQEAgLTIwLDcgKzIw
LDYgQEAgZXh0ZXJuIHZvaWQgX19pb21lbSAqX19pb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c2Fk
ZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKIAkJCSAgICAgICBpbnQgY2FjaGVmbGFnKTsKICNkZWZp
bmUgaW91bm1hcCBpb3VubWFwCiBleHRlcm4gdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqYWRk
cik7Ci1leHRlcm4gdm9pZCBfX2lvdW5tYXAodm9pZCAqYWRkciwgdW5zaWduZWQgbG9uZyBzaXpl
KTsKIAogI2RlZmluZSBpb3JlbWFwIGlvcmVtYXAKIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVt
ICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5c2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKZGlm
ZiAtLWdpdCBhL2FyY2gvbTY4ay9tbS9rbWFwLmMgYi9hcmNoL202OGsvbW0va21hcC5jCmluZGV4
IDQwYTNiMzI3ZGEwNy4uNGMyNzljZjBiY2M4IDEwMDY0NAotLS0gYS9hcmNoL202OGsvbW0va21h
cC5jCisrKyBiL2FyY2gvbTY4ay9tbS9rbWFwLmMKQEAgLTUyLDYgKzUyLDcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIGZyZWVfaW9fYXJlYSh2b2lkICphZGRyKQogCiAjZGVmaW5lIElPX1NJWkUJCSgy
NTYqMTAyNCkKIAorc3RhdGljIHZvaWQgX19mcmVlX2lvX2FyZWEodm9pZCAqYWRkciwgdW5zaWdu
ZWQgbG9uZyBzaXplKTsKIHN0YXRpYyBzdHJ1Y3Qgdm1fc3RydWN0ICppb2xpc3Q7CiAKIHN0YXRp
YyBzdHJ1Y3Qgdm1fc3RydWN0ICpnZXRfaW9fYXJlYSh1bnNpZ25lZCBsb25nIHNpemUpCkBAIC05
MCw3ICs5MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmcmVlX2lvX2FyZWEodm9pZCAqYWRkcikK
IAkJaWYgKHRtcC0+YWRkciA9PSBhZGRyKSB7CiAJCQkqcCA9IHRtcC0+bmV4dDsKIAkJCS8qIHJl
bW92ZSBnYXAgYWRkZWQgaW4gZ2V0X2lvX2FyZWEoKSAqLwotCQkJX19pb3VubWFwKHRtcC0+YWRk
ciwgdG1wLT5zaXplIC0gSU9fU0laRSk7CisJCQlfX2ZyZWVfaW9fYXJlYSh0bXAtPmFkZHIsIHRt
cC0+c2l6ZSAtIElPX1NJWkUpOwogCQkJa2ZyZWUodG1wKTsKIAkJCXJldHVybjsKIAkJfQpAQCAt
MjQ5LDEyICsyNTAsMTMgQEAgdm9pZCBpb3VubWFwKHZvaWQgX19pb21lbSAqYWRkcikKIH0KIEVY
UE9SVF9TWU1CT0woaW91bm1hcCk7CiAKKyNpZm5kZWYgQ1BVX002ODA0MF9PUl9NNjgwNjBfT05M
WQogLyoKLSAqIF9faW91bm1hcCB1bm1hcHMgbmVhcmx5IGV2ZXJ5dGhpbmcsIHNvIGJlIGNhcmVm
dWwKKyAqIF9fZnJlZV9pb19hcmVhIHVubWFwcyBuZWFybHkgZXZlcnl0aGluZywgc28gYmUgY2Fy
ZWZ1bAogICogQ3VycmVudGx5IGl0IGRvZXNuJ3QgZnJlZSBwb2ludGVyL3BhZ2UgdGFibGVzIGFu
eW1vcmUgYnV0IHRoaXMKICAqIHdhc24ndCB1c2VkIGFueXdheSBhbmQgbWlnaHQgYmUgYWRkZWQg
bGF0ZXIuCiAgKi8KLXZvaWQgX19pb3VubWFwKHZvaWQgKmFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6
ZSkKK3N0YXRpYyB2b2lkIF9fZnJlZV9pb19hcmVhKHZvaWQgKmFkZHIsIHVuc2lnbmVkIGxvbmcg
c2l6ZSkKIHsKIAl1bnNpZ25lZCBsb25nIHZpcnRhZGRyID0gKHVuc2lnbmVkIGxvbmcpYWRkcjsK
IAlwZ2RfdCAqcGdkX2RpcjsKQEAgLTI5Nyw2ICsyOTksNyBAQCB2b2lkIF9faW91bm1hcCh2b2lk
ICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiAKIAlmbHVzaF90bGJfYWxsKCk7CiB9CisjZW5k
aWYgLyogQ1BVX002ODA0MF9PUl9NNjgwNjBfT05MWSAqLwogCiAvKgogICogU2V0IG5ldyBjYWNo
ZSBtb2RlIGZvciBzb21lIGtlcm5lbCBhZGRyZXNzIHNwYWNlLgotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 741D9EAEA8
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:23 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B75A920192;
	Thu, 31 Oct 2019 12:21:21 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id C4602205B2
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3+G6piK0cFHUECcBqueKbAjQOIaGLN//vL/g9k6PQm8=; b=YaQDlh4k8LPVdMmMR1RVW3ROO8
 QnWrW78dM7WtsDi1uYVAKanek2A89SRvLcfgmYCmURxGN/IxcU073g+6E9MKf1aXrWvwExe7Rt7ZH
 v9AG5vsxG6L4Pz2L2q9Lw9flmEeUsFcT9YBZh3tt3EyneXJAjd/lxUbOWrQ/L7JDgc/AJuQgqbEMC
 4fUm/GXncYvu+mUz0aYsRDCIWAdVYvXzrFJYlDSlQVPEOqh2KDEJrHLjgI8N4kKb36X8BrpP9GGGG
 kaoS7pNrXRJAm5SaF4TFYo8c2/brn46mgp/i0j88xcHo8tZy51TAkTnRqvNpEKvFNJmJoYXa1X7GY
 HAoJEFVw==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJ7-0003K7-QE; Tue, 29 Oct 2019 06:48:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:16 +0100
Message-Id: <20191029064834.23438-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 03/21] ia64: rename ioremap_nocache to ioremap_uc
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

T24gaWE2NCBpb3JlbWFwX25vY2FjaGUgZmFpbHMgaWYgYXR0cmlidXRlcyBkb24ndCBtYXRjaC4g
IE5vdCBvdGhlcgphcmNoaXRlY3R1cmVzIGRvZXMgdGhpcywgYW5kIHdlIHBsYW4gdG8gZ2V0IHJp
ZCBvZiBpb3JlbWFwX25vY2FjaGUuClNvIGdldCByaWQgb2YgdGhlIHNwZWNpYWwgc2VtYW50aWNz
IGFuZCBkZWZpbmUgaW9yZW1hcF9ub2NhY2hlIGluCnRlcm1zIG9mIGlvcmVtYXAgYXMgbm8gcG9y
dGFibGUgZHJpdmVyIGNvdWxkIHJlbHkgb24gdGhlIGJlaGF2aW9yCmFueXdheS4KCkhvd2V2ZXIg
eDg2IGltcGxlbWVudHMgaW9yZW1hcF91YyBpbiBhIHNpbWlsYXIgd2F5IGFzIHRoZSBpYTY0CnZl
cnNpb24gb2YgaW9yZW1hcF9ub2NhY2hlLCBpbiB0aGF0IGl0IGlnbm9yZXMgdGhlIGZpcm13YXJl
IHRhYmxlcy4KU3dpdGNoIGlhNjQgdG8gb3ZlcnJpZGUgaW9yZW1hcF91YyBpbnN0ZWFkLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9pYTY0
L2luY2x1ZGUvYXNtL2lvLmggfCA2ICsrKy0tLQogYXJjaC9pYTY0L21tL2lvcmVtYXAuYyAgICAg
fCA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9pYTY0L2lu
Y2x1ZGUvYXNtL2lvLmgKaW5kZXggNTRlNzBjMjEzNTJhLi5mZWM5ZGY5NjA5ZWQgMTAwNjQ0Ci0t
LSBhL2FyY2gvaWE2NC9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvaWE2NC9pbmNsdWRlL2Fz
bS9pby5oCkBAIC0yNTYsMTYgKzI1NiwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgb3V0c2wodW5z
aWduZWQgbG9uZyBwb3J0LCBjb25zdCB2b2lkICpzcmMsCiAjIGlmZGVmIF9fS0VSTkVMX18KIAog
ZXh0ZXJuIHZvaWQgX19pb21lbSAqIGlvcmVtYXAodW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2ln
bmVkIGxvbmcgc2l6ZSk7Ci1leHRlcm4gdm9pZCBfX2lvbWVtICogaW9yZW1hcF9ub2NhY2hlICh1
bnNpZ25lZCBsb25nIG9mZnNldCwgdW5zaWduZWQgbG9uZyBzaXplKTsKK2V4dGVybiB2b2lkIF9f
aW9tZW0gKiBpb3JlbWFwX3VjKHVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNp
emUpOwogZXh0ZXJuIHZvaWQgaW91bm1hcCAodm9sYXRpbGUgdm9pZCBfX2lvbWVtICphZGRyKTsK
IHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICogaW9yZW1hcF9jYWNoZSAodW5zaWduZWQgbG9u
ZyBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKIHsKIAlyZXR1cm4gaW9yZW1hcChwaHlz
X2FkZHIsIHNpemUpOwogfQogI2RlZmluZSBpb3JlbWFwIGlvcmVtYXAKLSNkZWZpbmUgaW9yZW1h
cF9ub2NhY2hlIGlvcmVtYXBfbm9jYWNoZQorI2RlZmluZSBpb3JlbWFwX25vY2FjaGUgaW9yZW1h
cAogI2RlZmluZSBpb3JlbWFwX2NhY2hlIGlvcmVtYXBfY2FjaGUKLSNkZWZpbmUgaW9yZW1hcF91
YyBpb3JlbWFwX25vY2FjaGUKKyNkZWZpbmUgaW9yZW1hcF91YyBpb3JlbWFwX3VjCiAjZGVmaW5l
IGlvdW5tYXAgaW91bm1hcAogCiAvKgpkaWZmIC0tZ2l0IGEvYXJjaC9pYTY0L21tL2lvcmVtYXAu
YyBiL2FyY2gvaWE2NC9tbS9pb3JlbWFwLmMKaW5kZXggMGMwZGUyYzRlYzY5Li5hMDljZmEwNjQ1
MzYgMTAwNjQ0Ci0tLSBhL2FyY2gvaWE2NC9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC9pYTY0L21t
L2lvcmVtYXAuYwpAQCAtOTksMTQgKzk5LDE0IEBAIGlvcmVtYXAgKHVuc2lnbmVkIGxvbmcgcGh5
c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiBFWFBPUlRfU1lNQk9MKGlvcmVtYXApOwogCiB2
b2lkIF9faW9tZW0gKgotaW9yZW1hcF9ub2NhY2hlICh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwg
dW5zaWduZWQgbG9uZyBzaXplKQoraW9yZW1hcF91Yyh1bnNpZ25lZCBsb25nIHBoeXNfYWRkciwg
dW5zaWduZWQgbG9uZyBzaXplKQogewogCWlmIChrZXJuX21lbV9hdHRyaWJ1dGUocGh5c19hZGRy
LCBzaXplKSAmIEVGSV9NRU1PUllfV0IpCiAJCXJldHVybiBOVUxMOwogCiAJcmV0dXJuIF9faW9y
ZW1hcF91YyhwaHlzX2FkZHIpOwogfQotRVhQT1JUX1NZTUJPTChpb3JlbWFwX25vY2FjaGUpOwor
RVhQT1JUX1NZTUJPTChpb3JlbWFwX3VjKTsKIAogdm9pZAogZWFybHlfaW91bm1hcCAodm9sYXRp
bGUgdm9pZCBfX2lvbWVtICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

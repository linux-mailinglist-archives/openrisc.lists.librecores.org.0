Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D3E32EAEB3
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B1CDC20774;
	Thu, 31 Oct 2019 12:21:28 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 05CED20736
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:49:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/Mzf5xuS9oQVeGnlLjKziIgRibXQKwP5ZXqnpIrUsw=; b=ouMJFRdvFdKCvLpr7Yr692aoAh
 ZuI81Y3CvXjNd0E76ZDBOmj38v1X+W/RUimDQ2kTQsLAm9iPrH1bS/g/Tl+dpoYK5hbbEDK+Nk4Dt
 +yQuYZusS3bYUQfB2yyfPFD6Ye/jd58sDnwPe60arxGU4otCGqRMKofH1y5mTzqmbQv0K2hCg9wOF
 izWaAKsL9EDeD+ms83/HWDqU9XAZzfDbBFIrF2E/GAcBiTm6q7+2rraYHTAKRJWj1Wu7k7Khf+ZiN
 mXWytVtu8KNWsNodUNzV9j6W2g9z4tvi/iJ1rFtjXMdPzodHwCjsBZ2E9Bf8sZVyyVIFHKh8WKk0L
 lwf/ZXbg==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJg-0003xf-Nr; Tue, 29 Oct 2019 06:49:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:27 +0100
Message-Id: <20191029064834.23438-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:18 +0100
Subject: [OpenRISC] [PATCH 14/21] hexagon: remove __iounmap
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

Tm8gbmVlZCB0byBpbmRpcmVjdCBpb3VubWFwIGZvciBoZXhhZ29uLgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9oZXhhZ29uL2luY2x1ZGUv
YXNtL2lvLmggICAgICAgfCA3ICstLS0tLS0KIGFyY2gvaGV4YWdvbi9rZXJuZWwvaGV4YWdvbl9r
c3ltcy5jIHwgMiArLQogYXJjaC9oZXhhZ29uL21tL2lvcmVtYXAuYyAgICAgICAgICAgfCAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2hleGFnb24vaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvaGV4YWdvbi9pbmNs
dWRlL2FzbS9pby5oCmluZGV4IDg5NTM3ZGMxY2Y5Ny4uNTM5ZTNlZmNmMzljIDEwMDY0NAotLS0g
YS9hcmNoL2hleGFnb24vaW5jbHVkZS9hc20vaW8uaAorKysgYi9hcmNoL2hleGFnb24vaW5jbHVk
ZS9hc20vaW8uaApAQCAtMjcsNyArMjcsNyBAQAogZXh0ZXJuIGludCByZW1hcF9hcmVhX3BhZ2Vz
KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgcGh5c19hZGRyLAogCQkJCXVuc2ln
bmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKIAotZXh0ZXJuIHZvaWQgX19pb3Vu
bWFwKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcik7CitleHRlcm4gdm9pZCBpb3Vu
bWFwKGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqYWRkcik7CiAKIC8qIERlZmluZWQgaW4g
bGliL2lvLmMsIG5lZWRlZCBmb3Igc21jOTF4IGRyaXZlci4gKi8KIGV4dGVybiB2b2lkIF9fcmF3
X3JlYWRzdyhjb25zdCB2b2lkIF9faW9tZW0gKmFkZHIsIHZvaWQgKmRhdGEsIGludCB3b3JkbGVu
KTsKQEAgLTE3NSwxMSArMTc1LDYgQEAgdm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxv
bmcgcGh5c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpOwogI2RlZmluZSBpb3JlbWFwX25vY2Fj
aGUgaW9yZW1hcAogCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBpb3VubWFwKHZvbGF0aWxlIHZvaWQg
X19pb21lbSAqYWRkcikKLXsKLQlfX2lvdW5tYXAoYWRkcik7Ci19Ci0KICNkZWZpbmUgX19yYXdf
d3JpdGVsIHdyaXRlbAogCiBzdGF0aWMgaW5saW5lIHZvaWQgbWVtY3B5X2Zyb21pbyh2b2lkICpk
c3QsIGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqc3JjLApkaWZmIC0tZ2l0IGEvYXJjaC9o
ZXhhZ29uL2tlcm5lbC9oZXhhZ29uX2tzeW1zLmMgYi9hcmNoL2hleGFnb24va2VybmVsL2hleGFn
b25fa3N5bXMuYwppbmRleCBiM2RiYjQ3MjU3MmUuLjZmYjFhYWFiMWMyOSAxMDA2NDQKLS0tIGEv
YXJjaC9oZXhhZ29uL2tlcm5lbC9oZXhhZ29uX2tzeW1zLmMKKysrIGIvYXJjaC9oZXhhZ29uL2tl
cm5lbC9oZXhhZ29uX2tzeW1zLmMKQEAgLTE0LDcgKzE0LDcgQEAKIEVYUE9SVF9TWU1CT0woX19j
bGVhcl91c2VyX2hleGFnb24pOwogRVhQT1JUX1NZTUJPTChyYXdfY29weV9mcm9tX3VzZXIpOwog
RVhQT1JUX1NZTUJPTChyYXdfY29weV90b191c2VyKTsKLUVYUE9SVF9TWU1CT0woX19pb3VubWFw
KTsKK0VYUE9SVF9TWU1CT0woaW91bm1hcCk7CiBFWFBPUlRfU1lNQk9MKF9fc3Rybmxlbl91c2Vy
KTsKIEVYUE9SVF9TWU1CT0woX192bWdldGllKTsKIEVYUE9SVF9TWU1CT0woX192bXNldGllKTsK
ZGlmZiAtLWdpdCBhL2FyY2gvaGV4YWdvbi9tbS9pb3JlbWFwLmMgYi9hcmNoL2hleGFnb24vbW0v
aW9yZW1hcC5jCmluZGV4IGIxMDNkODNiNWZiYi4uMjU1YzViMWVlMWE3IDEwMDY0NAotLS0gYS9h
cmNoL2hleGFnb24vbW0vaW9yZW1hcC5jCisrKyBiL2FyY2gvaGV4YWdvbi9tbS9pb3JlbWFwLmMK
QEAgLTM4LDcgKzM4LDcgQEAgdm9pZCBfX2lvbWVtICppb3JlbWFwKHVuc2lnbmVkIGxvbmcgcGh5
c19hZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCiAJcmV0dXJuICh2b2lkIF9faW9tZW0gKikgKG9m
ZnNldCArIGFkZHIpOwogfQogCi12b2lkIF9faW91bm1hcChjb25zdCB2b2xhdGlsZSB2b2lkIF9f
aW9tZW0gKmFkZHIpCit2b2lkIGlvdW5tYXAoY29uc3Qgdm9sYXRpbGUgdm9pZCBfX2lvbWVtICph
ZGRyKQogewogCXZ1bm1hcCgodm9pZCAqKSAoKHVuc2lnbmVkIGxvbmcpIGFkZHIgJiBQQUdFX01B
U0spKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29y
ZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

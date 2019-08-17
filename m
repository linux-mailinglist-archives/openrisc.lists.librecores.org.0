Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C850C91100
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 78332204CC;
	Sat, 17 Aug 2019 17:02:33 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 0522320429
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWKWAT+XF1ezmZcHb9DEi10XQA0jRcT+1Qeu2CvZDyI=; b=LxII4lrRlL1J1E6Hl6GfDHU+ci
 VcJnwcQ5TO6+YXCzQYGVXfleFfTjr8kvstgt7Nd/klSB0ZR2UsSDCLManVZBOIsC7JP5yhP1hQwLj
 xbt6UdZYRND916SxFh/gix8OY7mjJ38Yuw+66mRiygqaEWsAVbb6trg0yGE6Ge3yCTex1SYbx11+I
 Rb1Clk+WoY/DxzTxX6tiXNUumTtVhIT2FgWUo430BbPXkLlr6cRLBvZOyrGt9D0+xfnJZGUk04HE3
 0xTi4PYO05qKScEcFflzmgdk4/+cDqKU9wYzhZNHCQtvoQFFfDWAaoWTF90iR7aoDPSjhGJZzJCLq
 LfReqbPQ==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytPg-0003dW-GT; Sat, 17 Aug 2019 07:46:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:32 +0200
Message-Id: <20190817073253.27819-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 05/26] openrisc: map as uncached in ioremap
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

T3BlbnJpc2MgaXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIG5vdCBtYXBwaW5nIGlvcmVtYXAgYXMg
dW5jYWNoZWQsCndoaWNoIGhhcyBiZWVuIHRoZSBkZWZhdWx0IHNpbmNlIHRoZSBMaW51eCAyLjYu
eCBkYXlzLiAgU3dpdGNoIGl0Cm92ZXIgdG8gaW1wbGVtZW50IHVuY2FjaGVkIHNlbWFudGljcyBi
eSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oICAgICAgfCAyMCArKystLS0tLS0t
LS0tLS0tLS0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgMiArLQog
YXJjaC9vcGVucmlzYy9tbS9pb3JlbWFwLmMgICAgICAgICAgfCAgOCArKysrLS0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9hc20vaW8uaCBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vaW8uaAppbmRleCAwNmE3MTA3NTc3ODkuLjViODFhOTZhYjg1ZSAxMDA2NDQKLS0tIGEvYXJj
aC9vcGVucmlzYy9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2FyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vaW8uaApAQCAtMjUsMjUgKzI1LDExIEBACiAjZGVmaW5lIFBJT19PRkZTRVQJCTAKICNkZWZp
bmUgUElPX01BU0sJCTAKIAotI2RlZmluZSBpb3JlbWFwX25vY2FjaGUgaW9yZW1hcF9ub2NhY2hl
CisjZGVmaW5lIGlvcmVtYXBfbm9jYWNoZSBpb3JlbWFwCiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMv
aW8uaD4KICNpbmNsdWRlIDxhc20vcGd0YWJsZS5oPgogCi1leHRlcm4gdm9pZCBfX2lvbWVtICpf
X2lvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCB1bnNpZ25lZCBsb25nIHNpemUsCi0JCQkJcGdw
cm90X3QgcHJvdCk7Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNf
YWRkcl90IG9mZnNldCwgc2l6ZV90IHNpemUpCi17Ci0JcmV0dXJuIF9faW9yZW1hcChvZmZzZXQs
IHNpemUsIFBBR0VfS0VSTkVMKTsKLX0KLQotLyogI2RlZmluZSBfUEFHRV9DSSAgICAgICAweDAw
MiAqLwotc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfbm9jYWNoZShwaHlzX2Fk
ZHJfdCBvZmZzZXQsCi0JCQkJCSAgICAgdW5zaWduZWQgbG9uZyBzaXplKQotewotCXJldHVybiBf
X2lvcmVtYXAob2Zmc2V0LCBzaXplLAotCQkJIF9fcGdwcm90KHBncHJvdF92YWwoUEFHRV9LRVJO
RUwpIHwgX1BBR0VfQ0kpKTsKLX0KLQordm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNfYWRkcl90
IG9mZnNldCwgdW5zaWduZWQgbG9uZyBzaXplKTsKIGV4dGVybiB2b2lkIGlvdW5tYXAodm9pZCAq
YWRkcik7CisKICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA0OTdm
ZDkwOGE0YzQuLjJmZTlmZjViNWQ2ZiAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
QEAgLTk3LDcgKzk3LDcgQEAgZXh0ZXJuIHZvaWQgcGFnaW5nX2luaXQodm9pZCk7CiAvKiBEZWZp
bmUgc29tZSBoaWdoZXIgbGV2ZWwgZ2VuZXJpYyBwYWdlIGF0dHJpYnV0ZXMuCiAgKgogICogSWYg
eW91IGNoYW5nZSBfUEFHRV9DSSBkZWZpbml0aW9uIGJlIHN1cmUgdG8gY2hhbmdlIGl0IGluCi0g
KiBpby5oIGZvciBpb3JlbWFwX25vY2FjaGUoKSB0b28uCisgKiBpby5oIGZvciBpb3JlbWFwKCkg
dG9vLgogICovCiAKIC8qCmRpZmYgLS1naXQgYS9hcmNoL29wZW5yaXNjL21tL2lvcmVtYXAuYyBi
L2FyY2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jCmluZGV4IGUwYzU1MWNhMDg5MS4uOGY4ZTk3Zjdl
YWM5IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL21tL2lvcmVtYXAuYworKysgYi9hcmNoL29w
ZW5yaXNjL21tL2lvcmVtYXAuYwpAQCAtMzQsOCArMzQsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IGZpeG1hcHNfdXNlZCBfX2luaXRkYXRhOwogICogaGF2ZSB0byBjb252ZXJ0IHRoZW0gaW50byBh
biBvZmZzZXQgaW4gYSBwYWdlLWFsaWduZWQgbWFwcGluZywgYnV0IHRoZQogICogY2FsbGVyIHNo
b3VsZG4ndCBuZWVkIHRvIGtub3cgdGhhdCBzbWFsbCBkZXRhaWwuCiAgKi8KLXZvaWQgX19pb21l
bSAqX19yZWYKLV9faW9yZW1hcChwaHlzX2FkZHJfdCBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUs
IHBncHJvdF90IHByb3QpCit2b2lkIF9faW9tZW0gKl9fcmVmIGlvcmVtYXAocGh5c19hZGRyX3Qg
YWRkciwgdW5zaWduZWQgbG9uZyBzaXplKQogewogCXBoeXNfYWRkcl90IHA7CiAJdW5zaWduZWQg
bG9uZyB2OwpAQCAtNjYsNyArNjUsOCBAQCBfX2lvcmVtYXAocGh5c19hZGRyX3QgYWRkciwgdW5z
aWduZWQgbG9uZyBzaXplLCBwZ3Byb3RfdCBwcm90KQogCQlmaXhtYXBzX3VzZWQgKz0gKHNpemUg
Pj4gUEFHRV9TSElGVCk7CiAJfQogCi0JaWYgKGlvcmVtYXBfcGFnZV9yYW5nZSh2LCB2ICsgc2l6
ZSwgcCwgcHJvdCkpIHsKKwlpZiAoaW9yZW1hcF9wYWdlX3JhbmdlKHYsIHYgKyBzaXplLCBwLAor
CQkJX19wZ3Byb3QocGdwcm90X3ZhbChQQUdFX0tFUk5FTCkgfCBfUEFHRV9DSSkpKSB7CiAJCWlm
IChsaWtlbHkobWVtX2luaXRfZG9uZSkpCiAJCQl2ZnJlZShhcmVhLT5hZGRyKTsKIAkJZWxzZQpA
QCAtNzYsNyArNzYsNyBAQCBfX2lvcmVtYXAocGh5c19hZGRyX3QgYWRkciwgdW5zaWduZWQgbG9u
ZyBzaXplLCBwZ3Byb3RfdCBwcm90KQogCiAJcmV0dXJuICh2b2lkIF9faW9tZW0gKikob2Zmc2V0
ICsgKGNoYXIgKil2KTsKIH0KLUVYUE9SVF9TWU1CT0woX19pb3JlbWFwKTsKK0VYUE9SVF9TWU1C
T0woaW9yZW1hcCk7CiAKIHZvaWQgaW91bm1hcCh2b2lkICphZGRyKQogewotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

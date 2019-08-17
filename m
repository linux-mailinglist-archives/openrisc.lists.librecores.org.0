Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDA49110A
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 6F12820497;
	Sat, 17 Aug 2019 17:02:40 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 08D742048F
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/LEmNPB4LUKmzKwKTw7HppJqT8OudhcMVRJaPxcfXo=; b=pzk8LMAIE1YeLLSo3cuHtk2GR4
 Y0uanGBXiTDJ2QkwfZe4gwaPUdwva0NK+NTSezuHwF5xymwcbjauYY+MSqS2bAlhvQHI3IPD3aMDp
 wApGRa1T14nH7PYskhaonl8TXk8byg9KKQzomyZdrqg0WMVxmZtQxDHqCFiPbV2S0E+8+Sa/+hFV6
 KIHEBMB5c9Cnq8SMKWDNcCqKJaRi/PUkzdX9YyTMta3kl2PksMtHtVEoApc7pTwXYhME4JPJyfLgF
 9lB+aPaL34V9VZD16IK+oydc2ruwRxxkQ1Z5IN7U+ev8r/4UP985hKZW1QbdoVQJWejsnFGznitlr
 sI39VxHg==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSK-0005Ci-OB; Sat, 17 Aug 2019 07:48:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:42 +0200
Message-Id: <20190817073253.27819-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 15/26] asm-generic: ioremap_uc should behave the
 same with and without MMU
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

V2hhdGV2ZXIgcmVhc29uIHRoZXJlIGlzIGZvciB0aGUgZXhpc3RlbmNlIG9mIGlvcmVtYXBfdWMs
IGFuZCB0aGUgZmFjdAp0aGF0IGl0IHJldHVybnMgTlVMTCBieSBkZWZhdWx0IG9uIGFyY2hpdGVj
dHVyZXMgd2l0aCBhbiBNTVUgYXBwbGllcwplcXVhbGx5IHRvIG5vbW11IGFyY2hpdGVjdHVyZXMs
IHNvIGRvbid0IHByb3ZpZGUgZGlmZmVyZW50IGRlZmF1bHRzLgoKSW4gcHJhY3RpY2UgdGhlIGRp
ZmZlcmVuY2UgaXMgbWVhbmluZ2xlc3MgYXMgdGhlIG9ubHkgcG9ydGFibGUgZHJpdmVyCnRoYXQg
dXNlcyBpb3JlbWFwX3VjIGlzIGF0eWZiIHdoaWNoIHByb2JhYmx5IGRvZXNuJ3Qgc2hvdyB1cCBv
biBub21tdQpkZXZpY2VzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+Ci0tLQogaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oIHwgMzYgKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oIGIv
aW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCmluZGV4IGQwMjgwNjUxMzY3MC4uYTk4ZWQ2MzI1NzI3
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKKysrIGIvaW5jbHVkZS9hc20t
Z2VuZXJpYy9pby5oCkBAIC05MzUsMTggKzkzNSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAqcGh5
c190b192aXJ0KHVuc2lnbmVkIGxvbmcgYWRkcmVzcykKICAqIGRlZmluZWQgeW91ciBvd24gaW9y
ZW1hcF8qKCkgdmFyaWFudCB5b3UgbXVzdCB0aGVuIGRlY2xhcmUgeW91ciBvd24KICAqIGlvcmVt
YXBfKigpIHZhcmlhbnQgYXMgZGVmaW5lZCB0byBpdHNlbGYgdG8gYXZvaWQgdGhlIGRlZmF1bHQg
TlVMTCByZXR1cm4uCiAgKi8KLQotI2lmZGVmIENPTkZJR19NTVUKLQotI2lmbmRlZiBpb3JlbWFw
X3VjCi0jZGVmaW5lIGlvcmVtYXBfdWMgaW9yZW1hcF91Ywotc3RhdGljIGlubGluZSB2b2lkIF9f
aW9tZW0gKmlvcmVtYXBfdWMocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSkKLXsKLQly
ZXR1cm4gTlVMTDsKLX0KLSNlbmRpZgotCi0jZWxzZSAvKiAhQ09ORklHX01NVSAqLworI2lmbmRl
ZiBDT05GSUdfTU1VCiAKIC8qCiAgKiBDaGFuZ2UgInN0cnVjdCBwYWdlIiB0byBwaHlzaWNhbCBh
ZGRyZXNzLgpAQCAtOTgwLDE0ICs5NjksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAq
aW9yZW1hcF9ub2NhY2hlKHBoeXNfYWRkcl90IG9mZnNldCwgc2l6ZV90IHNpemUpCiB9CiAjZW5k
aWYKIAotI2lmbmRlZiBpb3JlbWFwX3VjCi0jZGVmaW5lIGlvcmVtYXBfdWMgaW9yZW1hcF91Ywot
c3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfdWMocGh5c19hZGRyX3Qgb2Zmc2V0
LCBzaXplX3Qgc2l6ZSkKLXsKLQlyZXR1cm4gaW9yZW1hcF9ub2NhY2hlKG9mZnNldCwgc2l6ZSk7
Ci19Ci0jZW5kaWYKLQogI2lmbmRlZiBpb3JlbWFwX3djCiAjZGVmaW5lIGlvcmVtYXBfd2MgaW9y
ZW1hcF93Ywogc3RhdGljIGlubGluZSB2b2lkIF9faW9tZW0gKmlvcmVtYXBfd2MocGh5c19hZGRy
X3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSkKQEAgLTEwMDQsNiArOTg1LDIxIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBfX2lvbWVtICppb3JlbWFwX3d0KHBoeXNfYWRkcl90IG9mZnNldCwgc2l6ZV90IHNp
emUpCiB9CiAjZW5kaWYKIAorLyoKKyAqIGlvcmVtYXBfdWMgaXMgc3BlY2lhbCBpbiB0aGF0IHdl
IGRvIHJlcXVpcmUgYW4gZXhwbGljaXQgYXJjaGl0ZWN0dXJlCisgKiBpbXBsZW1lbnRhdGlvbi4g
IEluIGdlbmVyYWwgeW91IGRvIG5vdyB3YW50IHRvIHVzZSB0aGlzIGZ1bmN0aW9uIGluIGEKKyAq
IGRyaXZlciBhbmQgdXNlIHBsYWluIGlvcmVtYXAsIHdoaWNoIGlzIHVuY2FjaGVkIGJ5IGRlZmF1
bHQuICBTaW1pbGFybHkKKyAqIGFyY2hpdGVjdHVyZXMgc2hvdWxkIG5vdCBpbXBsZW1lbnQgaXQg
dW5sZXNzIHRoZXkgaGF2ZSBhIHZlcnkgZ29vZAorICogcmVhc29uLgorICovCisjaWZuZGVmIGlv
cmVtYXBfdWMKKyNkZWZpbmUgaW9yZW1hcF91YyBpb3JlbWFwX3VjCitzdGF0aWMgaW5saW5lIHZv
aWQgX19pb21lbSAqaW9yZW1hcF91YyhwaHlzX2FkZHJfdCBvZmZzZXQsIHNpemVfdCBzaXplKQor
eworCXJldHVybiBOVUxMOworfQorI2VuZGlmCisKICNpZmRlZiBDT05GSUdfSEFTX0lPUE9SVF9N
QVAKICNpZm5kZWYgQ09ORklHX0dFTkVSSUNfSU9NQVAKICNpZm5kZWYgaW9wb3J0X21hcAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpP
cGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6
Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

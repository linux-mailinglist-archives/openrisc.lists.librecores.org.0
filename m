Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D614F9110B
	for <lists+openrisc@lfdr.de>; Sat, 17 Aug 2019 17:02:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id B239F204AA;
	Sat, 17 Aug 2019 17:02:40 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 26BE120493
 for <openrisc@lists.librecores.org>; Sat, 17 Aug 2019 09:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gSXK72L3945Be32U1mETDhkMRH47vVT41OGNUHBlxH8=; b=Ir+7dvjJ0n19ReL7GE5byR1L5s
 RYLw9sbqCI/zu7wHP1Iv9zKFGapgO3o1RbAJ9FFm7eI/oxTVoLVkX66xz0/YEwyneuiq8M/u6pzh0
 SgVoXFAmsBUYFf63pntZfH8NJPrUinhX9+zXN1SlkfnVjLe8bsTifKf09Y90ACOd9sg4zKy2y2vKm
 Q/OBS1nE4OWQccKddysmnSkqxRiv9IqbCinrnjb1MWKb3vt1zCEtdfdVtVbncW6xtdd79XdW5ljxw
 SL/WiqRAw8uP8TgYnfp0Sg7mA7tohMlaMEwakmMWhj34u8RT3Ax1+zH2baeE8ic/nfsi5m/z4y6Oq
 xxA/JqOw==;
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSN-0005GA-NB; Sat, 17 Aug 2019 07:49:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Sat, 17 Aug 2019 09:32:43 +0200
Message-Id: <20190817073253.27819-17-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Sat, 17 Aug 2019 17:02:30 +0200
Subject: [OpenRISC] [PATCH 16/26] asm-generic: don't provide ioremap for
 CONFIG_MMU
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

QWxsIE1NVS1lbmFibGVkIHBvcnRzIGhhdmUgYSBub24tdHJpdmlhbCBpb3JlbWFwIGFuZCBzaG91
bGQgdGh1cyBwcm92aWRlCnRoZSBwcm90b3R5cGUgZm9yIHRoZWlyIGltcGxlbWVudGF0aW9uIGlu
c3RlYWQgb2YgcHJvdmlkaW5nIGEgZ2VuZXJpYwpvbmUgdW5sZXNzIGEgZGlmZmVyZW50IHN5bWJv
bCBpcyBub3QgZGVmaW5lZC4gIE5vdGUgdGhhdCB0aGlzIG9ubHkKYWZmZWN0cyBzcGFyYzMyIG5k
czMyIGFzIGFsbCBvdGhlcnMgZG8gcHJvdmlkZSB0aGVpciBvd24gdmVyc2lvbi4KCkFsc28gdXBk
YXRlIHRoZSBrZXJuZWxkb2MgY29tbWVudHMgaW4gYXNtLWdlbmVyaWMvaW8uaCB0byBleHBsYWlu
IHRoZQpzaXR1YXRpb24gYXJvdW5kIHRoZSBkZWZhdWx0IGlvcmVtYXAqIGltcGxlbWVudGF0aW9u
cyBjb3JyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBhcmNoL25kczMyL2luY2x1ZGUvYXNtL2lvLmggICAgfCAgMiArKwogYXJjaC9zcGFy
Yy9pbmNsdWRlL2FzbS9pb18zMi5oIHwgIDEgKwogaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oICAg
ICAgIHwgMjkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9uZHMz
Mi9pbmNsdWRlL2FzbS9pby5oIGIvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS9pby5oCmluZGV4IDE2
ZjI2MjMyMmI4Zi4uZmIwZThhMjRjN2FmIDEwMDY0NAotLS0gYS9hcmNoL25kczMyL2luY2x1ZGUv
YXNtL2lvLmgKKysrIGIvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS9pby5oCkBAIC02LDYgKzYsNyBA
QAogCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAordm9pZCBfX2lvbWVtICppb3JlbWFwKHBo
eXNfYWRkcl90IHBoeXNfYWRkciwgc2l6ZV90IHNpemUpOwogZXh0ZXJuIHZvaWQgaW91bm1hcCh2
b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpOwogI2RlZmluZSBfX3Jhd193cml0ZWIgX19yYXdf
d3JpdGViCiBzdGF0aWMgaW5saW5lIHZvaWQgX19yYXdfd3JpdGViKHU4IHZhbCwgdm9sYXRpbGUg
dm9pZCBfX2lvbWVtICphZGRyKQpAQCAtODAsNCArODEsNSBAQCBzdGF0aWMgaW5saW5lIHUzMiBf
X3Jhd19yZWFkbChjb25zdCB2b2xhdGlsZSB2b2lkIF9faW9tZW0gKmFkZHIpCiAjZGVmaW5lIHdy
aXRldyh2LGMpCSh7IF9faW93bWIoKTsgd3JpdGV3X3JlbGF4ZWQoKHYpLChjKSk7IH0pCiAjZGVm
aW5lIHdyaXRlbCh2LGMpCSh7IF9faW93bWIoKTsgd3JpdGVsX3JlbGF4ZWQoKHYpLChjKSk7IH0p
CiAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvaW8uaD4KKwogI2VuZGlmIC8qIF9fQVNNX05EUzMyX0lP
X0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvaW5jbHVkZS9hc20vaW9fMzIuaCBiL2FyY2gv
c3BhcmMvaW5jbHVkZS9hc20vaW9fMzIuaAppbmRleCBkZjJkYzE3ODQ2NzMuLjlhNTJkOTUwNmY4
MCAxMDA2NDQKLS0tIGEvYXJjaC9zcGFyYy9pbmNsdWRlL2FzbS9pb18zMi5oCisrKyBiL2FyY2gv
c3BhcmMvaW5jbHVkZS9hc20vaW9fMzIuaApAQCAtMTI3LDYgKzEyNyw3IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBzYnVzX21lbWNweV90b2lvKHZvbGF0aWxlIHZvaWQgX19pb21lbSAqZHN0LAogICog
QnVzIG51bWJlciBtYXkgYmUgZW1iZWRkZWQgaW4gdGhlIGhpZ2hlciBiaXRzIG9mIHRoZSBwaHlz
aWNhbCBhZGRyZXNzLgogICogVGhpcyBpcyB3aHkgd2UgaGF2ZSBubyBidXMgbnVtYmVyIGFyZ3Vt
ZW50IHRvIGlvcmVtYXAoKS4KICAqLwordm9pZCBfX2lvbWVtICppb3JlbWFwKHBoeXNfYWRkcl90
IG9mZnNldCwgc2l6ZV90IHNpemUpOwogdm9pZCBpb3VubWFwKHZvbGF0aWxlIHZvaWQgX19pb21l
bSAqYWRkcik7CiAvKiBDcmVhdGUgYSB2aXJ0dWFsIG1hcHBpbmcgY29va2llIGZvciBhbiBJTyBw
b3J0IHJhbmdlICovCiB2b2lkIF9faW9tZW0gKmlvcG9ydF9tYXAodW5zaWduZWQgbG9uZyBwb3J0
LCB1bnNpZ25lZCBpbnQgbnIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5o
IGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9pby5oCmluZGV4IGE5OGVkNjMyNTcyNy4uNmE1ZWRjMjNh
ZmUyIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL2lvLmgKKysrIGIvaW5jbHVkZS9h
c20tZ2VuZXJpYy9pby5oCkBAIC05MjIsMjggKzkyMiwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
KnBoeXNfdG9fdmlydCh1bnNpZ25lZCBsb25nIGFkZHJlc3MpCiAvKioKICAqIERPQzogaW9yZW1h
cCgpIGFuZCBpb3JlbWFwXyooKSB2YXJpYW50cwogICoKLSAqIElmIHlvdSBoYXZlIGFuIElPTU1V
IHlvdXIgYXJjaGl0ZWN0dXJlIGlzIGV4cGVjdGVkIHRvIGhhdmUgYm90aCBpb3JlbWFwKCkKLSAq
IGFuZCBpb3VubWFwKCkgaW1wbGVtZW50ZWQgb3RoZXJ3aXNlIHRoZSBhc20tZ2VuZXJpYyBoZWxw
ZXJzIHdpbGwgcHJvdmlkZSBhCi0gKiBkaXJlY3QgbWFwcGluZy4KKyAqIEFyY2hpdGVjdHVyZXMg
d2l0aCBhbiBNTVUgYXJlIGV4cGVjdGVkIHRvIHByb3ZpZGUgaW9yZW1hcCgpIGFuZCBpb3VubWFw
KCkKKyAqIHRoZW1zZWx2ZXMuICBGb3IgTk9NTVUgYXJjaGl0ZWN0dXJlcyB3ZSBwcm92aWRlIGEg
ZGVmYXVsdCBub3Atb3AKKyAqIGltcGxlbWVudGF0aW9uIHRoYXQgZXhwZWN0IHRoYXQgdGhlIHBo
eXNpY2FsIGFkZHJlc3MgdXNlZCBmb3IgTU1JTyBhcmUKKyAqIGFscmVhZHkgbWFya2VkIGFzIHVu
Y2FjaGVkLCBhbmQgY2FuIGJlIHVzZWQgYXMga2VybmVsIHZpcnR1YWwgYWRkcmVzc2VzLgogICoK
LSAqIFRoZXJlIGFyZSBpb3JlbWFwXyooKSBjYWxsIHZhcmlhbnRzLCBpZiB5b3UgaGF2ZSBubyBJ
T01NVSB3ZSBuYXR1cmFsbHkgd2lsbAotICogZGVmYXVsdCB0byBkaXJlY3QgbWFwcGluZyBmb3Ig
YWxsIG9mIHRoZW0sIHlvdSBjYW4gb3ZlcnJpZGUgdGhlc2UgZGVmYXVsdHMuCi0gKiBJZiB5b3Ug
aGF2ZSBhbiBJT01NVSB5b3UgYXJlIGhpZ2hseSBlbmNvdXJhZ2VkIHRvIHByb3ZpZGUgeW91ciBv
d24KLSAqIGlvcmVtYXAgdmFyaWFudCBpbXBsZW1lbnRhdGlvbiBhcyB0aGVyZSBjdXJyZW50bHkg
aXMgbm8gc2FmZSBhcmNoaXRlY3R1cmUKLSAqIGFnbm9zdGljIGRlZmF1bHQuIFRvIGF2b2lkIHBv
c3NpYmxlIGltcHJvcGVyIGJlaGF2aW91ciBkZWZhdWx0IGFzbS1nZW5lcmljCi0gKiBpb3JlbWFw
XyooKSB2YXJpYW50cyBhbGwgcmV0dXJuIE5VTEwgd2hlbiBhbiBJT01NVSBpcyBhdmFpbGFibGUu
IElmIHlvdSd2ZQotICogZGVmaW5lZCB5b3VyIG93biBpb3JlbWFwXyooKSB2YXJpYW50IHlvdSBt
dXN0IHRoZW4gZGVjbGFyZSB5b3VyIG93bgotICogaW9yZW1hcF8qKCkgdmFyaWFudCBhcyBkZWZp
bmVkIHRvIGl0c2VsZiB0byBhdm9pZCB0aGUgZGVmYXVsdCBOVUxMIHJldHVybi4KKyAqIGlvcmVt
YXBfd2MoKSBhbmQgaW9yZW1hcF93dCgpIGNhbiBwcm92aWRlIG1vcmUgcmVsYXhlZCBjYWNoaW5n
IGF0dHJpYnV0ZXMKKyAqIGZvciBzcGVjaWZpYyBkcml2ZXJzIGlmIHRoZSBhcmNoaXRlY3R1cmUg
Y2hvc2VzIHRvIGltcGxlbWVudCB0aGVtLiAgSWYgdGhleQorICogYXJlIG5vdCBpbXBsZW1lbnRl
ZCB3ZSBmYWxsIGJhY2sgdG8gcGxhaW4gaW9yZW1hcC4KICAqLwogI2lmbmRlZiBDT05GSUdfTU1V
Ci0KLS8qCi0gKiBDaGFuZ2UgInN0cnVjdCBwYWdlIiB0byBwaHlzaWNhbCBhZGRyZXNzLgotICoK
LSAqIFRoaXMgaW1wbGVtZW50YXRpb24gaXMgZm9yIHRoZSBuby1NTVUgY2FzZSBvbmx5Li4uIGlm
IHlvdSBoYXZlIGFuIE1NVQotICogeW91J2xsIG5lZWQgdG8gcHJvdmlkZSB5b3VyIG93biBkZWZp
bml0aW9ucy4KLSAqLwotCiAjaWZuZGVmIGlvcmVtYXAKICNkZWZpbmUgaW9yZW1hcCBpb3JlbWFw
CiBzdGF0aWMgaW5saW5lIHZvaWQgX19pb21lbSAqaW9yZW1hcChwaHlzX2FkZHJfdCBvZmZzZXQs
IHNpemVfdCBzaXplKQpAQCAtOTU0LDE0ICs5NDIsMTMgQEAgc3RhdGljIGlubGluZSB2b2lkIF9f
aW9tZW0gKmlvcmVtYXAocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSkKIAogI2lmbmRl
ZiBpb3VubWFwCiAjZGVmaW5lIGlvdW5tYXAgaW91bm1hcAotCiBzdGF0aWMgaW5saW5lIHZvaWQg
aW91bm1hcCh2b2lkIF9faW9tZW0gKmFkZHIpCiB7CiB9CiAjZW5kaWYKICNlbmRpZiAvKiBDT05G
SUdfTU1VICovCisKICNpZm5kZWYgaW9yZW1hcF9ub2NhY2hlCi12b2lkIF9faW9tZW0gKmlvcmVt
YXAocGh5c19hZGRyX3QgcGh5c19hZGRyLCBzaXplX3Qgc2l6ZSk7CiAjZGVmaW5lIGlvcmVtYXBf
bm9jYWNoZSBpb3JlbWFwX25vY2FjaGUKIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2lvbWVtICppb3Jl
bWFwX25vY2FjaGUocGh5c19hZGRyX3Qgb2Zmc2V0LCBzaXplX3Qgc2l6ZSkKIHsKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

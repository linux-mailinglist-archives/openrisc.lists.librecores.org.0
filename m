Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6FAEAEBA
	for <lists+openrisc@lfdr.de>; Thu, 31 Oct 2019 12:21:31 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0C56820789;
	Thu, 31 Oct 2019 12:21:31 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 7706620728
 for <openrisc@lists.librecores.org>; Tue, 29 Oct 2019 07:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0G9VjTCDn1azePVEARZDWm3/hUf6+uTfkQZKCgB5wVo=; b=rJgXsU3DXKzNjWM4Yt1bNVKDIH
 Qfw9GjtZlieBmDiI4yRbbtb6Tt2IVIbE1nOgMvX08qE9q87ppZN2VEI5JHc6SCp3qiVTCAI6u4kg5
 eHAN7AglzO7nQU50FgdoGIsBwXgxkEW90qHyexs0dpg1m6vgkX/0EkhCW1/4qnydnCE0B091rlttG
 189APJUZlHIdLeOADqftAb2pmoh/3Ex28d5LjzrgpeQFzNzGP1tl3JNBLE3oewUHA/tgYu4B3nF+n
 JVtv+zFKm9r4bryMpjQN7HOA2FgzssZ/VHSzX5SyY95CvwCFQMkZp961u1EVlpKDFrpekuQzEn/C+
 wC89h25A==;
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLK3-0004Ik-1s; Tue, 29 Oct 2019 06:49:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Date: Tue, 29 Oct 2019 07:48:34 +0100
Message-Id: <20191029064834.23438-22-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 31 Oct 2019 12:21:19 +0100
Subject: [OpenRISC] [PATCH 21/21] csky: use generic ioremap
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

VXNlIHRoZSBnZW5lcmljIGlvcmVtYXBfcHJvdCBhbmQgaW91bm1hcCBoZWxwZXJzLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9jc2t5L0tj
b25maWcgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9pby5oICAg
ICAgfCAgOCArKystLS0KIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgNCArKysK
IGFyY2gvY3NreS9tbS9pb3JlbWFwLmMgICAgICAgICAgfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1MCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2Nza3kvS2NvbmZpZyBiL2FyY2gvY3NreS9LY29u
ZmlnCmluZGV4IDM5NzM4NDdiNWY0Mi4uZGEwOWM4ODRjYzMwIDEwMDY0NAotLS0gYS9hcmNoL2Nz
a3kvS2NvbmZpZworKysgYi9hcmNoL2Nza3kvS2NvbmZpZwpAQCAtMTcsNiArMTcsNyBAQCBjb25m
aWcgQ1NLWQogCXNlbGVjdCBJUlFfRE9NQUlOCiAJc2VsZWN0IEhBTkRMRV9ET01BSU5fSVJRCiAJ
c2VsZWN0IERXX0FQQl9USU1FUl9PRgorCXNlbGVjdCBHRU5FUklDX0lPUkVNQVAKIAlzZWxlY3Qg
R0VORVJJQ19MSUJfQVNITERJMwogCXNlbGVjdCBHRU5FUklDX0xJQl9BU0hSREkzCiAJc2VsZWN0
IEdFTkVSSUNfTElCX0xTSFJESTMKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9p
by5oIGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL2lvLmgKaW5kZXggZjU3MjYwNWQ1YWQ1Li4zMzJm
NTFiYzY4ZmIgMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9pbmNsdWRlL2FzbS9pby5oCisrKyBiL2Fy
Y2gvY3NreS9pbmNsdWRlL2FzbS9pby5oCkBAIC0zNiwxMSArMzYsOSBAQAogLyoKICAqIEkvTyBt
ZW1vcnkgbWFwcGluZyBmdW5jdGlvbnMuCiAgKi8KLWV4dGVybiB2b2lkIF9faW9tZW0gKl9faW9y
ZW1hcChwaHlzX2FkZHJfdCBhZGRyLCBzaXplX3Qgc2l6ZSwgcGdwcm90X3QgcHJvdCk7Ci1leHRl
cm4gdm9pZCBpb3VubWFwKHZvaWQgKmFkZHIpOwotCi0jZGVmaW5lIGlvcmVtYXAoYWRkciwgc2l6
ZSkJCV9faW9yZW1hcCgoYWRkciksIChzaXplKSwgcGdwcm90X25vbmNhY2hlZChQQUdFX0tFUk5F
TCkpCi0jZGVmaW5lIGlvcmVtYXBfd2MoYWRkciwgc2l6ZSkJCV9faW9yZW1hcCgoYWRkciksIChz
aXplKSwgcGdwcm90X3dyaXRlY29tYmluZShQQUdFX0tFUk5FTCkpCisjZGVmaW5lIGlvcmVtYXBf
d2MoYWRkciwgc2l6ZSkgXAorCWlvcmVtYXBfcHJvdCgoYWRkciksIChzaXplKSwgXAorCQkoX1BB
R0VfSU9SRU1BUCAmIH5fQ0FDSEVfTUFTSykgfCBfQ0FDSEVfVU5DQUNIRUQpCiAKICNpbmNsdWRl
IDxhc20tZ2VuZXJpYy9pby5oPgogCmRpZmYgLS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA3YzIxOTg1
YzYwZGMuLjRiMmE0MWUxNWYyZSAxMDA2NDQKLS0tIGEvYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAorKysgYi9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC04Niw2ICs4
NiwxMCBAQAogI2RlZmluZSBQQUdFX1VTRVJJTwlfX3BncHJvdChfUEFHRV9QUkVTRU5UIHwgX1BB
R0VfUkVBRCB8IF9QQUdFX1dSSVRFIHwgXAogCQkJCV9DQUNIRV9DQUNIRUQpCiAKKyNkZWZpbmUg
X1BBR0VfSU9SRU1BUCBcCisJKF9QQUdFX1BSRVNFTlQgfCBfX1JFQURBQkxFIHwgX19XUklURUFC
TEUgfCBfUEFHRV9HTE9CQUwgfCBcCisJIF9DQUNIRV9VTkNBQ0hFRCB8IF9QQUdFX1NPKQorCiAj
ZGVmaW5lIF9fUDAwMAlQQUdFX05PTkUKICNkZWZpbmUgX19QMDAxCVBBR0VfUkVBRE9OTFkKICNk
ZWZpbmUgX19QMDEwCVBBR0VfQ09QWQpkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2lvcmVtYXAu
YyBiL2FyY2gvY3NreS9tbS9pb3JlbWFwLmMKaW5kZXggYWU3ODI1NmE1NmZkLi43MGM4MjY4ZDNi
MmIgMTAwNjQ0Ci0tLSBhL2FyY2gvY3NreS9tbS9pb3JlbWFwLmMKKysrIGIvYXJjaC9jc2t5L21t
L2lvcmVtYXAuYwpAQCAtMyw1MyArMyw4IEBACiAKICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4K
ICNpbmNsdWRlIDxsaW51eC9tbS5oPgotI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KICNpbmNs
dWRlIDxsaW51eC9pby5oPgogCi0jaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KLQotc3RhdGljIHZv
aWQgX19pb21lbSAqX19pb3JlbWFwX2NhbGxlcihwaHlzX2FkZHJfdCBhZGRyLCBzaXplX3Qgc2l6
ZSwKLQkJCQkgICAgICBwZ3Byb3RfdCBwcm90LCB2b2lkICpjYWxsZXIpCi17Ci0JcGh5c19hZGRy
X3QgbGFzdF9hZGRyOwotCXVuc2lnbmVkIGxvbmcgb2Zmc2V0LCB2YWRkcjsKLQlzdHJ1Y3Qgdm1f
c3RydWN0ICphcmVhOwotCi0JbGFzdF9hZGRyID0gYWRkciArIHNpemUgLSAxOwotCWlmICghc2l6
ZSB8fCBsYXN0X2FkZHIgPCBhZGRyKQotCQlyZXR1cm4gTlVMTDsKLQotCW9mZnNldCA9IGFkZHIg
JiAoflBBR0VfTUFTSyk7Ci0JYWRkciAmPSBQQUdFX01BU0s7Ci0Jc2l6ZSA9IFBBR0VfQUxJR04o
c2l6ZSArIG9mZnNldCk7Ci0KLQlhcmVhID0gZ2V0X3ZtX2FyZWFfY2FsbGVyKHNpemUsIFZNX0lP
UkVNQVAsIGNhbGxlcik7Ci0JaWYgKCFhcmVhKQotCQlyZXR1cm4gTlVMTDsKLQotCXZhZGRyID0g
KHVuc2lnbmVkIGxvbmcpYXJlYS0+YWRkcjsKLQotCWlmIChpb3JlbWFwX3BhZ2VfcmFuZ2UodmFk
ZHIsIHZhZGRyICsgc2l6ZSwgYWRkciwgcHJvdCkpIHsKLQkJZnJlZV92bV9hcmVhKGFyZWEpOwot
CQlyZXR1cm4gTlVMTDsKLQl9Ci0KLQlyZXR1cm4gKHZvaWQgX19pb21lbSAqKSh2YWRkciArIG9m
ZnNldCk7Ci19Ci0KLXZvaWQgX19pb21lbSAqX19pb3JlbWFwKHBoeXNfYWRkcl90IHBoeXNfYWRk
ciwgc2l6ZV90IHNpemUsIHBncHJvdF90IHByb3QpCi17Ci0JcmV0dXJuIF9faW9yZW1hcF9jYWxs
ZXIocGh5c19hZGRyLCBzaXplLCBwcm90LAotCQkJCV9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygw
KSk7Ci19Ci1FWFBPUlRfU1lNQk9MKF9faW9yZW1hcCk7Ci0KLXZvaWQgaW91bm1hcCh2b2lkIF9f
aW9tZW0gKmFkZHIpCi17Ci0JdnVubWFwKCh2b2lkICopKCh1bnNpZ25lZCBsb25nKWFkZHIgJiBQ
QUdFX01BU0spKTsKLX0KLUVYUE9SVF9TWU1CT0woaW91bm1hcCk7Ci0KIHBncHJvdF90IHBoeXNf
bWVtX2FjY2Vzc19wcm90KHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBsb25nIHBmbiwKIAkJ
CSAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwgcGdwcm90X3Qgdm1hX3Byb3QpCiB7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

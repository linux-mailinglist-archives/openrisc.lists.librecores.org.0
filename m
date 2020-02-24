Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 55358171763
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2D10A20587;
	Thu, 27 Feb 2020 13:35:34 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 40B58208DB
 for <openrisc@lists.librecores.org>; Mon, 24 Feb 2020 20:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6vbrJb1PTxUBmfNUmWMaC9IunHM3NVjcATW2sN+r4hs=; b=EhnoAKGWRXjYku+s4TutBL35qf
 IZBFdQBmO4pyH8ycFxMo5+hdCjNO89mxYaEAQhUI604JD4UleyJ1mkSWFd2A8rK9y42cjZFeP7fqI
 LQ9Rab084Uzyknp8Xt0a7BzHFC/JLuz/0nTh6gNxmUAtRsXExrD6vF4vqsD4yx4BYGRfpGd9mNmQv
 cdmtSuusulJ9P1FC3atUHajNpzqMaMEUOdH7OdbHf0+b2BrTmh9IvCuy7zlKv/nLFyOHNRAF1eqTi
 LW358irqbh5baSuYh1Ux9WAhn/i+bVxlJKjPLhCWmXSsXptImnCCo18YRLakBthTOd0C7XcfxRxxj
 lkvAdDyA==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Jev-0006Xj-34; Mon, 24 Feb 2020 19:44:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Date: Mon, 24 Feb 2020 11:44:44 -0800
Message-Id: <20200224194446.690816-5-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224194446.690816-1-hch@lst.de>
References: <20200224194446.690816-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: [OpenRISC] [PATCH 4/5] dma-direct: provide a
 arch_dma_clear_uncached hook
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-arch@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

VGhpcyBhbGxvd3MgdGhlIGFyY2ggY29kZSB0byByZXNldCB0aGUgcGFnZSB0YWJsZXMgdG8gY2Fj
aGVkIGFjY2VzcyB3aGVuCmZyZWVpbmcgYSBkbWEgY29oZXJlbnQgYWxsb2NhdGlvbiB0aGF0IHdh
cyBzZXQgdG8gdW5jYWNoZWQgdXNpbmcKYXJjaF9kbWFfc2V0X3VuY2FjaGVkLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICB8IDcgKysrKysrKwogaW5jbHVkZS9saW51eC9kbWEtbm9uY29oZXJl
bnQuaCB8IDEgKwoga2VybmVsL2RtYS9kaXJlY3QuYyAgICAgICAgICAgICB8IDIgKysKIDMgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvS2NvbmZpZyBi
L2FyY2gvS2NvbmZpZwppbmRleCAwOTBjZmUwYzgyYTcuLmMyNjMwMmY5MGM5NiAxMDA2NDQKLS0t
IGEvYXJjaC9LY29uZmlnCisrKyBiL2FyY2gvS2NvbmZpZwpAQCAtMjU1LDYgKzI1NSwxMyBAQCBj
b25maWcgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAKIGNvbmZpZyBBUkNIX0hBU19ETUFfU0VUX1VO
Q0FDSEVECiAJYm9vbAogCisjCisjIFNlbGVjdCBpZiB0aGUgYXJjaGl0ZWN0dXJlcyBwcm92aWRl
cyB0aGUgYXJjaF9kbWFfY2xlYXJfdW5jYWNoZWQgc3ltYm9sCisjIHRvIHVuZG8gYW4gaW4tcGxh
Y2UgcGFnZSB0YWJsZSByZW1hcCBmb3IgdW5jYWNoZWQgYWNjZXNzLgorIworY29uZmlnIEFSQ0hf
SEFTX0RNQV9DTEVBUl9VTkNBQ0hFRAorCWJvb2wKKwogIyBTZWxlY3QgaWYgYXJjaCBpbml0X3Rh
c2sgbXVzdCBnbyBpbiB0aGUgX19pbml0X3Rhc2tfZGF0YSBzZWN0aW9uCiBjb25maWcgQVJDSF9U
QVNLX1NUUlVDVF9PTl9TVEFDSwogCWJvb2wKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1h
LW5vbmNvaGVyZW50LmggYi9pbmNsdWRlL2xpbnV4L2RtYS1ub25jb2hlcmVudC5oCmluZGV4IDFh
NDAzOTUwNjY3My4uYjU5ZjFiNmJlM2U5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1u
b25jb2hlcmVudC5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLW5vbmNvaGVyZW50LmgKQEAgLTEw
OSw1ICsxMDksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9kbWFfcHJlcF9jb2hlcmVudChz
dHJ1Y3QgcGFnZSAqcGFnZSwgc2l6ZV90IHNpemUpCiAjZW5kaWYgLyogQ09ORklHX0FSQ0hfSEFT
X0RNQV9QUkVQX0NPSEVSRU5UICovCiAKIHZvaWQgKmFyY2hfZG1hX3NldF91bmNhY2hlZCh2b2lk
ICphZGRyLCBzaXplX3Qgc2l6ZSk7Cit2b2lkIGFyY2hfZG1hX2NsZWFyX3VuY2FjaGVkKHZvaWQg
KmFkZHIsIHNpemVfdCBzaXplKTsKIAogI2VuZGlmIC8qIF9MSU5VWF9ETUFfTk9OQ09IRVJFTlRf
SCAqLwpkaWZmIC0tZ2l0IGEva2VybmVsL2RtYS9kaXJlY3QuYyBiL2tlcm5lbC9kbWEvZGlyZWN0
LmMKaW5kZXggZjAxYTgxOTFmZDU5Li5hODU2MDA1MmE5MTUgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9k
bWEvZGlyZWN0LmMKKysrIGIva2VybmVsL2RtYS9kaXJlY3QuYwpAQCAtMjE5LDYgKzIxOSw4IEBA
IHZvaWQgZG1hX2RpcmVjdF9mcmVlX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsIHZvaWQgKmNwdV9hZGRyLAogCiAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RNQV9SRU1BUCkg
JiYgaXNfdm1hbGxvY19hZGRyKGNwdV9hZGRyKSkKIAkJdnVubWFwKGNwdV9hZGRyKTsKKwllbHNl
IGlmIChJU19FTkFCTEVEKENPTkZJR19BUkNIX0hBU19ETUFfQ0xFQVJfVU5DQUNIRUQpKQorCQlh
cmNoX2RtYV9jbGVhcl91bmNhY2hlZChjcHVfYWRkciwgc2l6ZSk7CiAKIAlkbWFfZnJlZV9jb250
aWd1b3VzKGRldiwgZG1hX2RpcmVjdF90b19wYWdlKGRldiwgZG1hX2FkZHIpLCBzaXplKTsKIH0K
LS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0
dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

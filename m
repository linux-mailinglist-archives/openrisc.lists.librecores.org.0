Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A30EA1E5015
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:05 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C1B2220B10;
	Wed, 27 May 2020 23:19:02 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 8467320B08
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=f8uY0F5J9sPe3diCT135xJ/N/Dw+x4WW5zJnRGaybDU=; b=msMI36+CPB2aX7WIDOvf9a7ihe
 A7+CS1wrGUYzvnMjk+QNuVEq6hdstYIgZPQorAgs/fWSXI09jbVs89riMnRBVwBQviupyy3DYOayE
 JmluGvH20OMtC9Xya8H8+tf43obb46YOBQDhJyEunvFokJSClqB+BYiCKrmFLOa42PsHXDhDHPrDg
 +WL9g+3vPWyosfG4RR5+SAek+0gkDoqEOMBae3KTFjfCYISW1pGgPedRT2GT+SPT55i+D+tHCdocc
 hwAsGs57t3OgA7geJGJWqHENAgWbH0LMOJor1hUDGuRNCVKlG9U2TeWdIlcGEah5uy0ULp3wurKV4
 KfwrUS2Q==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbSF-0003nT-QU; Fri, 15 May 2020 14:36:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:18 +0200
Message-Id: <20200515143646.3857579-2-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 01/29] arm: fix the flush_icache_range arguments
 in set_fiq_handler
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

VGhlIGFyZ3VtZW50cyBwYXNzZWQgbG9vayBib2d1cywgdHJ5IHRvIGZpeCB0aGVtIHRvIHNvbWV0
aGluZyB0aGF0IHNlZW1zCnRvIG1ha2Ugc2Vuc2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL2FybS9rZXJuZWwvZmlxLmMgfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0va2VybmVsL2ZpcS5jIGIvYXJjaC9hcm0va2VybmVsL2ZpcS5jCmluZGV4
IGNkMTIzNGMxMDNmY2QuLjk4Y2EzZTNmYTg0NzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5l
bC9maXEuYworKysgYi9hcmNoL2FybS9rZXJuZWwvZmlxLmMKQEAgLTk4LDggKzk4LDggQEAgdm9p
ZCBzZXRfZmlxX2hhbmRsZXIodm9pZCAqc3RhcnQsIHVuc2lnbmVkIGludCBsZW5ndGgpCiAKIAlt
ZW1jcHkoYmFzZSArIG9mZnNldCwgc3RhcnQsIGxlbmd0aCk7CiAJaWYgKCFjYWNoZV9pc192aXB0
X25vbmFsaWFzaW5nKCkpCi0JCWZsdXNoX2ljYWNoZV9yYW5nZSgodW5zaWduZWQgbG9uZyliYXNl
ICsgb2Zmc2V0LCBvZmZzZXQgKwotCQkJCSAgIGxlbmd0aCk7CisJCWZsdXNoX2ljYWNoZV9yYW5n
ZSgodW5zaWduZWQgbG9uZyliYXNlICsgb2Zmc2V0LAorCQkJCSAgICh1bnNpZ25lZCBsb25nKWJh
c2UgKyBvZmZzZXQgKyBsZW5ndGgpOwogCWZsdXNoX2ljYWNoZV9yYW5nZSgweGZmZmYwMDAwICsg
b2Zmc2V0LCAweGZmZmYwMDAwICsgb2Zmc2V0ICsgbGVuZ3RoKTsKIH0KIAotLSAKMi4yNi4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBt
YWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5s
aWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 31D191CD307
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id E819720B5E;
	Mon, 11 May 2020 09:41:47 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id E9C7220B10
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oCdrIxNzR4NHS2NDYxpGK2EFu2WHsVdB0VGTwPSxhuk=; b=Q+7UfgQ3Rdq+rLentMN2OrWKT3
 jTnHLTbJ6Yo8QYhjLeB8vp2MreobznJtTFQ0jlaiUn5RGr0TWosPvI6rcQTJE/Et+fDYfoHslzFqw
 /BWbCS4JJSasi/72B4NdftCFoYId60ALrCeqbqSFqlmZALTsuQbRcxZdE7gVEMRUZ+2jJgbwFOeTc
 q0RSZogxgE3wUwtPbM4tnpRSA/1iH3V8P+QeyF82EweD60S2UCkj7Bj8IUJ6rB3V0/NRIyG7Xj/d5
 ro+hoo6ZZWAwhBD9nnrcR3crM1Fw3XFyChwrI8FcD9H77DOo0SD2ywb9vJJFHT9ycuVP7MGMEc0Zc
 hBawSvig==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgpC-0001El-6j; Sun, 10 May 2020 07:56:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:06 +0200
Message-Id: <20200510075510.987823-28-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 27/31] exec: only build read_code when needed
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

T25seSBidWlsZCByZWFkX2NvZGUgd2hlbiBiaW5hcnkgZm9ybWF0cyB0aGF0IHVzZSBpdCBhcmUg
YnVpbHQgaW50byB0aGUKa2VybmVsLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Ci0tLQogZnMvZXhlYy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9mcy9leGVjLmMgYi9mcy9leGVjLmMKaW5kZXggMDZi
NGM1NTBhZjVkOS4uYTRmNzY2ZjI5NmY4ZiAxMDA2NDQKLS0tIGEvZnMvZXhlYy5jCisrKyBiL2Zz
L2V4ZWMuYwpAQCAtMTAyNyw2ICsxMDI3LDggQEAgaW50IGtlcm5lbF9yZWFkX2ZpbGVfZnJvbV9m
ZChpbnQgZmQsIHZvaWQgKipidWYsIGxvZmZfdCAqc2l6ZSwgbG9mZl90IG1heF9zaXplLAogfQog
RVhQT1JUX1NZTUJPTF9HUEwoa2VybmVsX3JlYWRfZmlsZV9mcm9tX2ZkKTsKIAorI2lmIGRlZmlu
ZWQoQ09ORklHX0hBVkVfQU9VVCkgfHwgZGVmaW5lZChDT05GSUdfQklORk1UX0ZMQVQpIHx8IFwK
KyAgICBkZWZpbmVkKENPTkZJR19CSU5GTVRfRUxGX0ZEUElDKQogc3NpemVfdCByZWFkX2NvZGUo
c3RydWN0IGZpbGUgKmZpbGUsIHVuc2lnbmVkIGxvbmcgYWRkciwgbG9mZl90IHBvcywgc2l6ZV90
IGxlbikKIHsKIAlzc2l6ZV90IHJlcyA9IHZmc19yZWFkKGZpbGUsICh2b2lkIF9fdXNlciAqKWFk
ZHIsIGxlbiwgJnBvcyk7CkBAIC0xMDM1LDYgKzEwMzcsNyBAQCBzc2l6ZV90IHJlYWRfY29kZShz
dHJ1Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgbG9uZyBhZGRyLCBsb2ZmX3QgcG9zLCBzaXplX3Qg
bGVuKQogCXJldHVybiByZXM7CiB9CiBFWFBPUlRfU1lNQk9MKHJlYWRfY29kZSk7CisjZW5kaWYK
IAogLyoKICAqIE1hcHMgdGhlIG1tX3N0cnVjdCBtbSBpbnRvIHRoZSBjdXJyZW50IHRhc2sgc3Ry
dWN0LgotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5v
cmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 11C3B1CD2EF
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9CDF720372;
	Mon, 11 May 2020 09:41:31 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 3C3BF20696
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:55:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cJrBcFesCCHH++zA2oY5v0CcV8x8Hy3MLhhCCmCGutI=; b=Cg8ydy2JfxDHx5WmYnD7+gYELd
 8yHBhwrMLD+8iu6qbARUIj6XxDlcwEvBbb7nXwQOrHKnxsroWOnlfuvlGUdDhV/0m1yHgAvs2wcX0
 0nTesUo6HDGCtNqlprctVmEu0OjdVaV3FrOqUb+WfUd0ujwRbQByelb9z40XX+8BlAzc6SQk4wMOS
 qx243a10+i11d788jTKiopU1cj87pLDj5CABp+NSUkX+73QGcY7uVvOAyFND1BQ33cdRDYJo3bl0r
 HjzhAWhnzcKcNLGIc7bhJZGHWJH0xu2Yeaz4OZVWbPkWTQzzgGanwZBO+suwdAD8iv4drunTvEGcH
 okQcV9+A==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgny-0007sD-0h; Sun, 10 May 2020 07:55:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:54:42 +0200
Message-Id: <20200510075510.987823-4-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 03/31] MIPS: unexport __flush_icache_user_range
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

X19mbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSBpcyBub3QgdXNlZCBpbiBtb2R1bGFyIGNvZGUsIHNv
IHVuZXhwb3J0IGl0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Ci0tLQogYXJjaC9taXBzL21tL2NhY2hlLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL21tL2NhY2hlLmMgYi9hcmNoL21pcHMv
bW0vY2FjaGUuYwppbmRleCAzM2I0MDkzOTFkZGI2Li5hZDZkZjFjZWE4NjZmIDEwMDY0NAotLS0g
YS9hcmNoL21pcHMvbW0vY2FjaGUuYworKysgYi9hcmNoL21pcHMvbW0vY2FjaGUuYwpAQCAtMzYs
NyArMzYsNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChmbHVzaF9pY2FjaGVfcmFuZ2UpOwogdm9pZCAo
KmxvY2FsX2ZsdXNoX2ljYWNoZV9yYW5nZSkodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQg
bG9uZyBlbmQpOwogRVhQT1JUX1NZTUJPTF9HUEwobG9jYWxfZmx1c2hfaWNhY2hlX3JhbmdlKTsK
IHZvaWQgKCpfX2ZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1
bnNpZ25lZCBsb25nIGVuZCk7Ci1FWFBPUlRfU1lNQk9MX0dQTChfX2ZsdXNoX2ljYWNoZV91c2Vy
X3JhbmdlKTsKIHZvaWQgKCpfX2xvY2FsX2ZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKSh1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CiBFWFBPUlRfU1lNQk9MX0dQTChfX2xv
Y2FsX2ZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKTsKIAotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QK
T3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9y
Zy9saXN0aW5mby9vcGVucmlzYwo=

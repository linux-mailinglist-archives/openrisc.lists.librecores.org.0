Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 83C214B8900
	for <lists+openrisc@lfdr.de>; Wed, 16 Feb 2022 14:17:27 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 63E9D2482C;
	Wed, 16 Feb 2022 14:17:27 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id EA65724820
 for <openrisc@lists.librecores.org>; Wed, 16 Feb 2022 14:17:24 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D795961655;
 Wed, 16 Feb 2022 13:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB5FC340F1;
 Wed, 16 Feb 2022 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645017443;
 bh=MxlH7OSdWg2oRBDys6vsaBDtcNFNrqae9GgCDj46MDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sjI1N/Ysf6UohThwc+VXydeUqwNugfP8doF9H67EicATD6oaAkDsrCNS3AC/ubFNd
 ziBIxKGEAeyq4Bw3XdZgjBuNcKHeB1enctrHaLGU2ykGVgZHDsnbC5Wzwde0sZPsGo
 WD7WBQJHRS/PhCcVbk/s6TQX9q0zFJnPZsK3bgY0sTLsXoxe2RYo46AhoXLG6T8vLY
 ptfvBD5j0ki8uiIVLlwxNojr8S73bqQ6CnNgAESnFCyQrATHgA3qg0Clpwhp7O6ene
 UNjiTeS5j4av8zOGlm3gJWoU7z2Cw6gaTV6tNodGA/Zj7EYErzSRxKmSguUvyWCtWL
 X2GGlpG3o7PVg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 16 Feb 2022 14:13:24 +0100
Message-Id: <20220216131332.1489939-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
MIME-Version: 1.0
Subject: [OpenRISC] [PATCH v2 10/18] m68k: fix access_ok for coldfire
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, bcain@codeaurora.org, mpe@ellerman.id.au,
 deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk,
 linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, richard@nod.at,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCldoaWxlIG1vc3QgbTY4ayBwbGF0
Zm9ybXMgdXNlIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2VzIGZvciB1c2VyCmFuZCBrZXJuZWwgc3Bh
Y2UsIGF0IGxlYXN0IGNvbGRmaXJlIGRvZXMgbm90LCBhbmQgdGhlIG90aGVyCm9uZXMgaGF2ZSBh
IFRBU0tfU0laRSB0aGF0IGlzIGxlc3MgdGhhbiB0aGUgZW50aXJlIDRHQiBhZGRyZXNzCnJhbmdl
LgoKVXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24gb2YgX19hY2Nlc3Nfb2soKSBzdG9w
cyBjb2xkZmlyZQp1c2VyIHNwYWNlIGZyb20gdHJpdmlhbGx5IGFjY2Vzc2luZyBrZXJuZWwgbWVt
b3J5LgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBh
cmNoL202OGsvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC9tNjhrL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS91YWNj
ZXNzLmgKaW5kZXggNzk2MTdjMGIyZjkxLi44ZWI2MjVlNzU0NTIgMTAwNjQ0Ci0tLSBhL2FyY2gv
bTY4ay9pbmNsdWRlL2FzbS91YWNjZXNzLmgKKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3Vh
Y2Nlc3MuaApAQCAtMTIsMTQgKzEyLDIxIEBACiAjaW5jbHVkZSA8YXNtL2V4dGFibGUuaD4KIAog
LyogV2UgbGV0IHRoZSBNTVUgZG8gYWxsIGNoZWNraW5nICovCi1zdGF0aWMgaW5saW5lIGludCBh
Y2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFkZHIsCitzdGF0aWMgaW5saW5lIGludCBhY2Nl
c3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKnB0ciwKIAkJCSAgICB1bnNpZ25lZCBsb25nIHNpemUp
CiB7CisJdW5zaWduZWQgbG9uZyBsaW1pdCA9IFRBU0tfU0laRTsKKwl1bnNpZ25lZCBsb25nIGFk
ZHIgPSAodW5zaWduZWQgbG9uZylwdHI7CisKIAkvKgogCSAqIFhYWDogZm9yICFDT05GSUdfQ1BV
X0hBU19BRERSRVNTX1NQQUNFUyB0aGlzIHJlYWxseSBuZWVkcyB0byBjaGVjawogCSAqIGZvciBU
QVNLX1NJWkUhCisJICogUmVtb3ZpbmcgdGhpcyBoZWxwZXIgaXMgcHJvYmFibHkgc3VmZmljaWVu
dC4KIAkgKi8KLQlyZXR1cm4gMTsKKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ1BVX0hBU19BRERS
RVNTX1NQQUNFUykpCisJCXJldHVybiAxOworCisJcmV0dXJuIChzaXplIDw9IGxpbWl0KSAmJiAo
YWRkciA8PSAobGltaXQgLSBzaXplKSk7CiB9CiAKIC8qCi0tIAoyLjI5LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

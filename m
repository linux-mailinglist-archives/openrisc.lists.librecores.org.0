Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 720FD1E504B
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4861220CCB;
	Wed, 27 May 2020 23:19:41 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 5AC3A20B30
 for <openrisc@lists.librecores.org>; Fri, 15 May 2020 16:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2Xdr7If4G7tlq1M/OLagjELexqLovtR85HrbwT8o5D0=; b=aKuM/IuZGNMxQJ+txtJ5ChLiO9
 jgRu5IvQBhmQvsyQ6/tX1AwBW4qI7pc/hLSkgNnaYqK3tZnN4jXJuYrKMFwXINCILvmITyTkWBGyq
 jFRKUUwH6dq7lYNFmx2GLqJw+EL+4rvVlaBjqiFFNolUMbA/eRnz/YCKnBetEYTEB1zu9d/ibFFsd
 s+6anIu4IhN8wAgtQxueZd0zvcXv9o4iooxCT6SP5C3NG9PKmnNCmKTBZkl79s/wInEl3upE2O1HU
 uNBV437kfWy7Ap5NeVKUwXWpl3ukGmCINI/nM4NHP1YXOI2mHuEgdsF7zSZNYCiKrqFVqaiJ93UnM
 YkoHC6JA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZbTV-0005Fj-SN; Fri, 15 May 2020 14:38:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Fri, 15 May 2020 16:36:44 +0200
Message-Id: <20200515143646.3857579-28-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515143646.3857579-1-hch@lst.de>
References: <20200515143646.3857579-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH 27/29] binfmt_flat: use flush_icache_user_range
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

bG9hZF9mbGF0X2ZpbGUgd29ya3Mgb24gdXNlciBhZGRyZXNzZXMuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQtYnk6IEdyZWcgVW5nZXJlciA8Z2Vy
Z0BsaW51eC1tNjhrLm9yZz4KLS0tCiBmcy9iaW5mbXRfZmxhdC5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvYmlu
Zm10X2ZsYXQuYyBiL2ZzL2JpbmZtdF9mbGF0LmMKaW5kZXggODMxYTJiMjViYTc5Zi4uNmYwYWNh
NTM3OWRhMiAxMDA2NDQKLS0tIGEvZnMvYmluZm10X2ZsYXQuYworKysgYi9mcy9iaW5mbXRfZmxh
dC5jCkBAIC04NTQsNyArODU0LDcgQEAgc3RhdGljIGludCBsb2FkX2ZsYXRfZmlsZShzdHJ1Y3Qg
bGludXhfYmlucHJtICpicHJtLAogI2VuZGlmIC8qIENPTkZJR19CSU5GTVRfRkxBVF9PTEQgKi8K
IAl9CiAKLQlmbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnRfY29kZSwgZW5kX2NvZGUpOworCWZsdXNo
X2ljYWNoZV91c2VyX3JhbmdlKHN0YXJ0X2NvZGUsIGVuZF9jb2RlKTsKIAogCS8qIHplcm8gdGhl
IEJTUywgIEJSSyBhbmQgc3RhY2sgYXJlYXMgKi8KIAlpZiAoY2xlYXJfdXNlcigodm9pZCBfX3Vz
ZXIgKikoZGF0YXBvcyArIGRhdGFfbGVuKSwgYnNzX2xlbiArCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

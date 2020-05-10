Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C6DC11CD309
	for <lists+openrisc@lfdr.de>; Mon, 11 May 2020 09:41:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A029B20B77;
	Mon, 11 May 2020 09:41:48 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 25B8620B19
 for <openrisc@lists.librecores.org>; Sun, 10 May 2020 09:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=HRyhkH18LFCbkgCXbt9/+HszHvh8kjMmfVRTGKbbIGQ=; b=tgn4T8jqYxuFS/VlRTlED2h30H
 OLRzqiBTZ7HascfUuszhx2OsXTQOvS+NpGco2CJjFdJLeP9V5jyBlX1aCF5nEErg+2CQucIbH5JyH
 BNjHHnQsT68AG805N8id3Yca4jtzH5/6JYU5eCQ6ifezmPiNhcdYdz8ysTYetT1ARCMBfFdIx3Fxs
 u6bw9rOX07UfOvdMyNW9+wKXyrIWTX2ih6TSKxCh9m4RMuDsERrz/olZmo1/00c4+7zLOQWazHC5Q
 gVjkkOY3VBzq0fdFx9uKPs6aglI8dSNNA0aqmQNEcfziY69zsLBeXjS82110t8mCYhLfEPkP/qth5
 2lXoJoUg==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXgpI-0001Js-Bj; Sun, 10 May 2020 07:56:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Roman Zippel <zippel@linux-m68k.org>
Date: Sun, 10 May 2020 09:55:08 +0200
Message-Id: <20200510075510.987823-30-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510075510.987823-1-hch@lst.de>
References: <20200510075510.987823-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 11 May 2020 09:41:23 +0200
Subject: [OpenRISC] [PATCH 29/31] binfmt_flat: use flush_icache_user_range
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

bG9hZF9mbGF0X2ZpbGUgd29ya3Mgb24gdXNlciBhZGRyZXNzZXMuCgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBmcy9iaW5mbXRfZmxhdC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZnMvYmluZm10X2ZsYXQuYyBiL2ZzL2JpbmZtdF9mbGF0LmMKaW5kZXggODMxYTJiMjVi
YTc5Zi4uNmYwYWNhNTM3OWRhMiAxMDA2NDQKLS0tIGEvZnMvYmluZm10X2ZsYXQuYworKysgYi9m
cy9iaW5mbXRfZmxhdC5jCkBAIC04NTQsNyArODU0LDcgQEAgc3RhdGljIGludCBsb2FkX2ZsYXRf
ZmlsZShzdHJ1Y3QgbGludXhfYmlucHJtICpicHJtLAogI2VuZGlmIC8qIENPTkZJR19CSU5GTVRf
RkxBVF9PTEQgKi8KIAl9CiAKLQlmbHVzaF9pY2FjaGVfcmFuZ2Uoc3RhcnRfY29kZSwgZW5kX2Nv
ZGUpOworCWZsdXNoX2ljYWNoZV91c2VyX3JhbmdlKHN0YXJ0X2NvZGUsIGVuZF9jb2RlKTsKIAog
CS8qIHplcm8gdGhlIEJTUywgIEJSSyBhbmQgc3RhY2sgYXJlYXMgKi8KIAlpZiAoY2xlYXJfdXNl
cigodm9pZCBfX3VzZXIgKikoZGF0YXBvcyArIGRhdGFfbGVuKSwgYnNzX2xlbiArCi0tIAoyLjI2
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5S
SVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xp
c3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

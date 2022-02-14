Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E01024B57C5
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 18:02:32 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C248E24776;
	Mon, 14 Feb 2022 18:02:32 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 5A191211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sdZnUMzq4+z5JAUxazcphNdGaICd1jOM0lzfsOlGGP4=; b=ilmpEja/277DxKyEOCWtwolukQ
 TPjFvPd+06Duh+vtGjhRV7kysY6QfnRhDUQM2LPMmQJPp0CcDS7ZITxDjyFmd5QuKSeULHTzQv/dY
 64hhQASYsNjqn2sxQ8pG09hu68ESlQPBP+ZUUGQuXU+5Zf2NM0DQ50AjfVah1yfzmf28PCovqXoHo
 BshQ9GNqU4Vd+l0inCSwLOM/Kv9mqXQWM0bcy2OkcRImPWSvuzdM6R2QSbW7WDXWrev49VJC5rIfa
 zjELqfCR0DFOQ+1CmCyyesRY7ojy5sRUvp347Q343uxXWWK10wDz2za7INHW8lBnzV6aVrB5MveY8
 5H/+OeNA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJejt-00GFoH-Dz; Mon, 14 Feb 2022 17:02:13 +0000
Date: Mon, 14 Feb 2022 09:02:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgqLFYqIqkIsNC92@infradead.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-5-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [OpenRISC] [PATCH 04/14] x86: use more conventional access_ok()
 definition
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
 linux-sh@vger.kernel.org, peterz@infradead.org, linux-mips@vger.kernel.org,
 jcmvbkbc@gmail.com, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, bcain@codeaurora.org,
 linux-hexagon@vger.kernel.org, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 arnd@arndb.de, hca@linux.ibm.com, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, richard@nod.at, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, ebiederm@xmission.com, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, Linus Torvalds <torvalds@linux-foundation.org>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiArI2RlZmluZSBfX3JhbmdlX25vdF9vayhhZGRyLCBzaXplLCBsaW1pdCkJKCFfX2Fj
Y2Vzc19vayhhZGRyLCBzaXplKSkKPiArI2RlZmluZSBfX2Noa19yYW5nZV9ub3Rfb2soYWRkciwg
c2l6ZSwgbGltaXQpCSghX19hY2Nlc3Nfb2soKHZvaWQgX191c2VyICopYWRkciwgc2l6ZSkpCgpD
YW4gd2UganVzdCBraWxsIHRoZXNlIG9mZiBpbnN0ZWQgb2YgbGV0dGluZyB0aGVtbSBvYnNmdWNh
dGUgdGhlIGNvZGU/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpo
dHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

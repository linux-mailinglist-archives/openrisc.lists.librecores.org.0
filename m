Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7792F4B579A
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 17:59:35 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2E093242D7;
	Mon, 14 Feb 2022 17:59:35 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 925C7240F6
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 17:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=wOZdjvQKGo2j1KEbHamRz5nvfE
 5N4PSkoVJRW6b85x2udVgbP4nj0LjR0mptXcdR6Dl2/kevucNHdZKP+eczdjmlP1z3MwZ8V8UTNH8
 ZVh+IRtQLoUWBL/sUwTDW6NPocaC06jLxhF5rLfZ9wV8lGf6LC8Pw3PHj2ciuIshvT8D1htdXN0gu
 WGtLp38e6Ay0OYk4bAZhKzSgMaUKRfxf48LEOo7xoUHfsgFT50qfLq5mewlYarA7LCYzBR/7t7hIi
 rVhzxkKIih3DvtQfcPsFmsozbhFuJyeS1XTuYKGWC6P5G+i4WQv8FF5LABK6Yz9enYOIurecqRgkO
 e0Fnj0ng==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJegk-00GDzZ-OZ; Mon, 14 Feb 2022 16:58:58 +0000
Date: Mon, 14 Feb 2022 08:58:58 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgqKUscD4Xx62bVt@infradead.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-2-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [OpenRISC] [PATCH 01/14] uaccess: fix integer overflow on
 access_ok()
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
 stable@vger.kernel.org, dinguyen@kernel.org,
 David Laight <David.Laight@aculab.com>, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TG9va3MgZ29vZCwKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

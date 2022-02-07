Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AF4934AB67A
	for <lists+openrisc@lfdr.de>; Mon,  7 Feb 2022 09:20:00 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5911520CC0;
	Mon,  7 Feb 2022 09:20:00 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 617C72426F
 for <openrisc@lists.librecores.org>; Mon,  7 Feb 2022 07:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hjWf60JMAVQJhgmfPlSAZ5+/ceseer8Z60uDPAGgkAM=; b=pXzzk49YMnKOxHpmbc1xBRgNAL
 Ujjdd1Q+r1Gjl7lGPov+1N+OOEbrvHtVbAfEyYQO77jxzH84Ia7qA1WQoF9TDMvc9LrfuFSjMzG6i
 6VbmkrhCNvBRqB2CwPGbKMZ3ctisrbKiSjrk3dEGRuBe2APNAlNgfzCxU3OIlk3eBAhCB5n9CbM5b
 Lj49nzeWXJ1EfaM10qescnIfoa8ioXZuDLSRk5Ezh84PAUtgDgGcDB3qotgIrnPIBlEQ6ukIf/VRX
 4G1lvmG8+Ujb3sn2am0knaGYQD+j5rHpvnwNCpFVlcftMRoVJJ09VwRuennleFVgZt60ASDVTbkHQ
 kAtwVylw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nGxlq-009B91-SM; Mon, 07 Feb 2022 06:45:06 +0000
Date: Sun, 6 Feb 2022 22:45:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YgC/8ng5WX6Nt104@infradead.org>
References: <20220206013648.3491865-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220206013648.3491865-1-shorne@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 07 Feb 2022 09:19:58 +0100
Subject: Re: [OpenRISC] [PATCH] openrisc: remove CONFIG_SET_FS
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
Cc: Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBGZWIgMDYsIDIwMjIgYXQgMTA6MzY6NDdBTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gUmVtb3ZlIHRoZSBhZGRyZXNzIHNwYWNlIG92ZXJyaWRlIEFQSSBzZXRfZnMoKSB1
c2VkIGZvciBVc2VyIE1vZGUgTGludXguCgpUaGlzIGFpbid0IFVNTCA6KQoKPiArCXJldHVybiBz
aXplIDw9IFRBU0tfU0laRSAmJiBhZGRyIDw9IChUQVNLX1NJWkUgLSBzaXplKTsKCk5vIG5lZWQg
Zm9yIHRoZSBpbm5lciBicmFjZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

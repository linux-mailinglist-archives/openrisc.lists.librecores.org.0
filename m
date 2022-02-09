Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9A61E4AEA94
	for <lists+openrisc@lfdr.de>; Wed,  9 Feb 2022 07:47:30 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4288323E0C;
	Wed,  9 Feb 2022 07:47:30 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id B89F024039
 for <openrisc@lists.librecores.org>; Wed,  9 Feb 2022 07:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=VtP4Em7zp5+JF56chSkEO/lr+b
 RTk48qOTiSiEmNuzIjI0FF3CF2pqR4Db3kEpw5/ksVizavJi6eXDWQXee4gP2BrV+Fk/0zu+bX2Fn
 8N1Rn8JpWRVPDriSp/Ux1CF8kJw23XqnmK3lDAXealBwMyXFvqbOdecdB8qyD3WYOERFxA/Q5MdXN
 Nz80b2A5zec5w+NSzjTGghxHOwhvxw6yF8bDEiH/k/8Jkta1tb8rT3NG/fYyqcHpnl5h8vQLKjdta
 o/stUap57D3gdzl0tCcikObTkJ0AjuGUxNT3pXJJYaDLVutYkO/gpKERYpB4Np1uDzfzaAhzAJQMe
 QNiqYPrQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nHgkz-00GOBx-G9; Wed, 09 Feb 2022 06:47:13 +0000
Date: Tue, 8 Feb 2022 22:47:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <YgNjcdFU8EIV5HeR@infradead.org>
References: <20220208064905.199632-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220208064905.199632-1-shorne@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [OpenRISC] [PATCH v3] openrisc: remove CONFIG_SET_FS
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
 Christoph Hellwig <hch@infradead.org>, David Laight <David.Laight@aculab.com>,
 openrisc@lists.librecores.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

TG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0Mg
bWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMu
bGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

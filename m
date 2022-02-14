Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C4BB94B57EF
	for <lists+openrisc@lfdr.de>; Mon, 14 Feb 2022 18:06:22 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A835824800;
	Mon, 14 Feb 2022 18:06:22 +0100 (CET)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id ED252211B2
 for <openrisc@lists.librecores.org>; Mon, 14 Feb 2022 18:06:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0CqmZAPRvnTQjgxBDbgMZYquENsTA/VPZyRN6//m2xw=; b=A3sA4gEo4nM3H7a0dm/JzGaUgV
 QIajZXmGp6ANWQ7bYVPcoCtAlCwsaPV2mcLSTAMkTtOvct+SPoXoviqH9efT8NLhfT4S3LRw6YQXd
 op4oq2yv8hzQnJjEyzM3+ydZNTbB02+bfC5eJ50MyESjem8R8c2VVjXeHHcWxOdarSNfzvCwtBQpI
 InHc/8TWyFNrwCcTQldIWT4TQ5FyAGciNKaQWRRlcxgPeWZKydhmkMkbIzvof2xUER3lSjyAJ9oA3
 03ZxL6nD2oE4+Za+YPHuF/EueN4CdELKexFzVobCRN7YS+wtQRgWFdzsDIrcKnFVoJEqcho3LJJfk
 H411B1+g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJenc-00GHV7-F2; Mon, 14 Feb 2022 17:06:04 +0000
Date: Mon, 14 Feb 2022 09:06:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YgqL/NJ3YHEAhj4i@infradead.org>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-11-arnd@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [OpenRISC] [PATCH 10/14] uaccess: remove most CONFIG_SET_FS
 users
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

T24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDU6MzQ6NDhQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+IE9uIGFsbW9z
dCBhbGwgYXJjaGl0ZWN0dXJlcywgdGhlcmUgYXJlIG5vIHJlbWFpbmluZyBjYWxsZXJzCj4gb2Yg
c2V0X2ZzKCksIHNvIENPTkZJR19TRVRfRlMgY2FuIGJlIGRpc2FibGVkLCBhbG9uZyB3aXRoCj4g
cmVtb3ZpbmcgdGhlIHRocmVhZF9pbmZvIGZpZWxkIGFuZCBhbnkgcmVmZXJlbmNlcyB0byBpdC4K
PiAKPiBUaGlzIHR1cm5zIGFjY2Vzc19vaygpIGludG8gYSBjaGVhcGVyIGNoZWNrIGFnYWluc3Qg
VEFTS19TSVpFX01BWC4KCldvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBqdXN0IG1lcmdl
IHRoaXMgaW50byB0aGUgbGFzdCBwYXRjaD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

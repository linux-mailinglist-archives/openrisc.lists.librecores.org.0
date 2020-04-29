Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (unknown [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A4D121C05DC
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:10:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 80EF2202FC;
	Thu, 30 Apr 2020 21:09:49 +0200 (CEST)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by mail.librecores.org (Postfix) with ESMTPS id 0B14720AC2
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 16:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ikRp1jMR1EzFxoc+o3VOCA2gMw8FZkS2U5Oi/2AUBbY=; b=D6j3FH7ivByLMWug4zMS8gt8vs
 G4Igy0iDFTNqxHdTrAQexq30jGCOX8jILBsiQbZpAYQtO1MgsihDdRBm5YtaBgQd/ujc9d9AzhQ7I
 sYevrP9lBud2gYOzdyWzpajhBEjytuRwoxl12BNh7HwiyA6KuTWD5P3e7awgfq8VPlDhCQJ+pN7W/
 nqhzrAnBl2S/kgwYqKWYUYBO54H/Y5g3nPWbmFrsKOjqsrQvlSOMrtyzcDKUZCJilITaZaEpE8GCr
 DvzhHKVgo+GJ0ybB4TvX7cmmNWALoPxda8PopiWIAILoXx03VF1elS0sEB1Rys1RcInokhc+M6ddW
 cZVwqHpw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jTnWM-0001Yh-RC; Wed, 29 Apr 2020 14:17:06 +0000
Date: Wed, 29 Apr 2020 07:17:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Message-ID: <20200429141706.GA25142@infradead.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-17-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429121126.17989-17-rppt@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: Re: [OpenRISC] [PATCH v2 16/20] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
 Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Nick Hu <nickhu@andestech.com>,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Qian Cai <cai@lca.pw>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 Brian Cain <bcain@codeaurora.org>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MjJQTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBGcm9tOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gCj4gVGhl
IGNvbW1pdCBmNDdhYzA4OGM0MDYgKCJtbTogbWVtbWFwX2luaXQ6IGl0ZXJhdGUgb3ZlciBtZW1i
bG9jayByZWdpb25zCj4gcmF0aGVyIHRoYXQgY2hlY2sgZWFjaCBQRk4iKSBtYWRlIGVhcmx5X3Bm
bl9pbl9uaWQoKSBvYnNvbGV0ZSBhbmQgc2luY2UKPiBDT05GSUdfTk9ERVNfU1BBTl9PVEhFUl9O
T0RFUyBpcyBvbmx5IHVzZWQgdG8gcGljayBhIHN0dWIgb3IgYSByZWFsCj4gaW1wbGVtZW50YXRp
b24gb2YgZWFybHlfcGZuX2luX25pZCgpIGl0IGlzIGFsc28gbm90IG5lZWRlZCBhbnltb3JlLgoK
SSBkb24ndCB0aGluayB5b3UgY2FuIHF1b3RlIGEgY29tbWl0IGlkIGZvciBzb21ldGhpbmcgdGhh
dCBoYXNuJ3QgYmVlbgpjb21taXRlZCB0byBtYWlubGluZSB5ZXQuICBUaGVuIGFnYWluIEkgd291
bGQgaGF2ZSBqdXN0IG1lcmdlZCB0aGlzCnBhdGNoIGludG8gdGhlIG9uZSB0aGF0IG9ic29sZXRl
ZCBlYXJseV9wZm5faW5fbmlkIGFueXdheS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

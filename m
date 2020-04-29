Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (unknown [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EFCDF1C05DD
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:10:09 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id C12ED20B16;
	Thu, 30 Apr 2020 21:09:49 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 1457B20AC5
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 16:34:14 +0200 (CEST)
Received: from kernel.org (unknown [87.70.161.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 796F52074A;
 Wed, 29 Apr 2020 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588170852;
 bh=WWPVYLJB8cF1eh/bgOa7kKMnwvq4kKVMrtpQ0105+PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r0MyUrcNByfv40BqZMDUz9VgJFeWUeRjo2JW4VKDF1h/7I/qQIsmP3r+XczFilNcB
 ++CDc2aMtj2e1Vvw7mqelm0S/yNPEGrXgzqXPqqXmHsIltvr+DFp/+T/wSjD9ztS+C
 LzUl9esAqrKIQvImRO0XfT4341bJ3x0mFvf4a1wc=
Date: Wed, 29 Apr 2020 17:33:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200429143346.GI14260@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
 <20200429121126.17989-17-rppt@kernel.org>
 <20200429141706.GA25142@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429141706.GA25142@infradead.org>
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

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDc6MTc6MDZBTSAtMDcwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MTE6MjJQTSArMDMwMCwgTWlr
ZSBSYXBvcG9ydCB3cm90ZToKPiA+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJt
LmNvbT4KPiA+IAo+ID4gVGhlIGNvbW1pdCBmNDdhYzA4OGM0MDYgKCJtbTogbWVtbWFwX2luaXQ6
IGl0ZXJhdGUgb3ZlciBtZW1ibG9jayByZWdpb25zCj4gPiByYXRoZXIgdGhhdCBjaGVjayBlYWNo
IFBGTiIpIG1hZGUgZWFybHlfcGZuX2luX25pZCgpIG9ic29sZXRlIGFuZCBzaW5jZQo+ID4gQ09O
RklHX05PREVTX1NQQU5fT1RIRVJfTk9ERVMgaXMgb25seSB1c2VkIHRvIHBpY2sgYSBzdHViIG9y
IGEgcmVhbAo+ID4gaW1wbGVtZW50YXRpb24gb2YgZWFybHlfcGZuX2luX25pZCgpIGl0IGlzIGFs
c28gbm90IG5lZWRlZCBhbnltb3JlLgo+IAo+IEkgZG9uJ3QgdGhpbmsgeW91IGNhbiBxdW90ZSBh
IGNvbW1pdCBpZCBmb3Igc29tZXRoaW5nIHRoYXQgaGFzbid0IGJlZW4KPiBjb21taXRlZCB0byBt
YWlubGluZSB5ZXQuaQoKT3VjaCwgdGhhdCB3YXMgb25lIG9mIHRoZSB0aGluZ3MgSSd2ZSBpbmRl
bnRlZCB0byBmaXggaW4gdjIuLi4KCj4gVGhlbiBhZ2FpbiBJIHdvdWxkIGhhdmUganVzdCBtZXJn
ZWQgdGhpcwo+IHBhdGNoIGludG8gdGhlIG9uZSB0aGF0IG9ic29sZXRlZCBlYXJseV9wZm5faW5f
bmlkIGFueXdheS4KCkkndmUga2VwdCB0aGVzZSBjb21taXRzIHNlcGFyYXRlIHRvIHByZXNlcnZl
IHRoZSBhdXRob3JzaGlwLgpJJ2xsIHVwZGF0ZSB0aGUgY2hhbmdlbG9nIHNvIHRoYXQgaXQgd29u
J3QgbWVudGlvbiBjb21taXQgaWQuCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

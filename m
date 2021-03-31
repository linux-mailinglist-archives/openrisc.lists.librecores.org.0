Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6453E34FD31
	for <lists+openrisc@lfdr.de>; Wed, 31 Mar 2021 11:42:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 75A2A21162;
	Wed, 31 Mar 2021 11:42:02 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 89F6920A41
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 11:29:14 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3578661606;
 Wed, 31 Mar 2021 09:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617182952;
 bh=aMxacYx0WSuYSq+RvcHg7XLnuWTcQHWfWM2hCy7hYJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZilpE/CgLvY3Nm3hLeCdPrSzQ0bka0Q/xAMzoDxoKT2sksg/+xdgw70lbIQlKRH9q
 HQM7q1tR3SOaufoC3EF8clnG+n8fTsUXBRqFIqRReR3kDRE9b5+HETaEN2azemUCyN
 +dywdbjbEuNLM1pOQ9fKcI8/BlabXbx6EDZQjXTlXZiHlwJBGfmHuNxznBzTG2bJFd
 nNykz3YpDvfjp1B8PgDSj0QLp5Bc0UJEz3WtQfw8cmvL2FnE443FSPWgxCOoGmWTX7
 urjc5s1XzZrXM3ARPcSSDIS4mEkSxEnbcwd3SAssAB5TkbJXQ91S3vF7J6sARmo8bJ
 QvnQEWfFitvHA==
Date: Wed, 31 Mar 2021 12:28:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <YGRA2SU28yciN9xU@kernel.org>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
X-Mailman-Approved-At: Wed, 31 Mar 2021 11:42:00 +0200
Subject: Re: [OpenRISC] [PATCH v2] mm: Move mem_init_print_info() into
 mm_init()
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
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBNYXIgMTcsIDIwMjEgYXQgMDk6NTI6MTBBTSArMDgwMCwgS2VmZW5nIFdhbmcgd3Jv
dGU6Cj4gbWVtX2luaXRfcHJpbnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVh
Y2ggYXJjaGl0ZWN0dXJlLAo+IGFuZCBwYXNzIE5VTEwgYXJndW1lbnQsIHNvIHVzaW5nIHZvaWQg
YXJndW1lbnQgYW5kIG1vdmUgaXQgaW50byBtbV9pbml0KCkuCj4gCj4gQWNrZWQtYnk6IERhdmUg
SGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2Vm
ZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKQWNrZWQtYnk6IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KCj4gLS0tCj4gdjI6Cj4gLSBDbGVhbnVwICdzdHIn
IGxpbmUgc3VnZ2VzdGVkIGJ5IENocmlzdG9waGUgYW5kIEFDSwo+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

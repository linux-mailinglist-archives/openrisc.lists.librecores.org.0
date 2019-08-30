Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 80CE6A5629
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:37 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id CFB382053A;
	Mon,  2 Sep 2019 14:35:36 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 646912035E
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 18:04:07 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 73D86227A8A; Fri, 30 Aug 2019 18:04:04 +0200 (CEST)
Date: Fri, 30 Aug 2019 18:04:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Cc@lst.de:Paul Walmsley <paul.walmsley@sifive.com>,
 Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-mtd@lists.infradead.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <20190830160404.GA26887@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
 <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 14/26] asm-generic: don't provide __ioremap
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

QXJuZCwgY2FuIHlvdSBjb25zaWRlciB0aGlzIHBhdGNoIGZvciBhc20tZ2VuZXJpYyBmb3IgNS40
PyAgSSBkb24ndAp0aGluayBJJ2xsIGJlIGFibGUgdG8gZmVlZCB0aGUgYWN0dWFsIGdlbmVyaWMg
aW9yZW1hcCBpbXBsZW1lbnRhdGlvbgp0byBMaW51cyB0aGlzIG1lcmdlIHdpbmRvdywgYnV0IGlm
IHdlIGNhbiBnZXQgYXMgbWFueSBwYXRjaGVzIGFzCnBvc3NpYmxlIGluIHRocm91Z2ggdGhlaXIg
bWFpbnRhaW5lciB0cmVlcyB0aGF0IHdvdWxkIG1ha2UgbXkgbGlmZQptdWNoIGVhc2llci4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFp
bGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGli
cmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

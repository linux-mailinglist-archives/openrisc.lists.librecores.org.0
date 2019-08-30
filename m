Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 3963DA562A
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:38 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F062C2053C;
	Mon,  2 Sep 2019 14:35:36 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 48E9920330
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 18:04:56 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 95CE5227A8A; Fri, 30 Aug 2019 18:04:54 +0200 (CEST)
Date: Fri, 30 Aug 2019 18:04:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ingo Molnar <mingo@kernel.org>
Message-ID: <20190830160454.GB26887@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-13-hch@lst.de> <20190817103402.GA7602@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817103402.GA7602@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 12/26] x86: clean up ioremap
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
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMTI6MzQ6MDJQTSArMDIwMCwgSW5nbyBNb2xuYXIgd3Jv
dGU6Cj4gCj4gKiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gCj4gPiBV
c2UgaW9yZW1hcCBhcyB0aGUgbWFpbiBpbXBsZW1lbnRlZCBmdW5jdGlvbiwgYW5kIGRlZmluZWQK
PiA+IGlvcmVtYXBfbm9jYWNoZSB0byBpdCBhcyBhIGRlcHJlY2F0ZWQgYWxpYXMuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gLS0tCj4g
PiAgYXJjaC94ODYvaW5jbHVkZS9hc20vaW8uaCB8IDggKystLS0tLS0KPiA+ICBhcmNoL3g4Ni9t
bS9pb3JlbWFwLmMgICAgIHwgOCArKysrLS0tLQo+ID4gIGFyY2gveDg2L21tL3BhZ2VhdHRyLmMg
ICAgfCA0ICsrLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gCj4gQWNrZWQtYnk6IEluZ28gTW9sbmFyIDxtaW5nb0BrZXJuZWwub3JnPgoK
Q2FuIHlvdSBwaWNrIGl0IHVwIHRocm91Z2ggdGlwIGZvciA1LjQ/ICBUaGF0IHdheSB3ZSBjYW4g
Z2V0IG1vc3QKYml0cyBpbiB0aHJvdWdoIHRoZWlyIG1haW50YWluZXIgdHJlZXMsIGFuZCB0aGVu
IEknbGwgcmVzdWJtaXQgdGhlCnJlc3QgZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGlu
ZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVj
b3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

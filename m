Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0DFA562E
	for <lists+openrisc@lfdr.de>; Mon,  2 Sep 2019 14:35:40 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 8125C20544;
	Mon,  2 Sep 2019 14:35:37 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 1C83C2048D
 for <openrisc@lists.librecores.org>; Fri, 30 Aug 2019 18:07:07 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D5BB227A8A; Fri, 30 Aug 2019 18:07:05 +0200 (CEST)
Date: Fri, 30 Aug 2019 18:07:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stafford Horne <shorne@gmail.com>
Message-ID: <20190830160705.GF26887@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-6-hch@lst.de>
 <20190823135539.GC24874@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823135539.GC24874@lianli.shorne-pla.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 02 Sep 2019 14:35:35 +0200
Subject: Re: [OpenRISC] [PATCH 05/26] openrisc: map as uncached in ioremap
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6NTU6MzlQTSArMDkwMCwgU3RhZmZvcmQgSG9ybmUg
d3JvdGU6Cj4gT24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDk6MzI6MzJBTSArMDIwMCwgQ2hyaXN0
b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBPcGVucmlzYyBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUg
bm90IG1hcHBpbmcgaW9yZW1hcCBhcyB1bmNhY2hlZCwKPiA+IHdoaWNoIGhhcyBiZWVuIHRoZSBk
ZWZhdWx0IHNpbmNlIHRoZSBMaW51eCAyLjYueCBkYXlzLiAgU3dpdGNoIGl0Cj4gPiBvdmVyIHRv
IGltcGxlbWVudCB1bmNhY2hlZCBzZW1hbnRpY3MgYnkgZGVmYXVsdC4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBhcmNo
L29wZW5yaXNjL2luY2x1ZGUvYXNtL2lvLmggICAgICB8IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAgMiArLQo+ID4gIGFy
Y2gvb3BlbnJpc2MvbW0vaW9yZW1hcC5jICAgICAgICAgIHwgIDggKysrKy0tLS0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4gCj4gQWNrZWQt
Ynk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgoKQ2FuIHlvdSBzZW5kIHRoaXMg
b25lIHRvIExpbnVzIGZvciA1LjQ/ICBUaGF0IHdvdWxkIGhlbHAgd2l0aCB0aGUKcG9zc2liaWxp
dHkgdG8gcmVtb3ZlIGlvcmVtYXBfbm9jYWNoZSBhZnRlciB0aGF0LgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3Bl
blJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9s
aXN0aW5mby9vcGVucmlzYwo=

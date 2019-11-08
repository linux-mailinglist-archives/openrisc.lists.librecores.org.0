Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF02F7413
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id F423F20710;
	Mon, 11 Nov 2019 13:37:42 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id A39BB20753
 for <openrisc@lists.librecores.org>; Fri,  8 Nov 2019 06:14:36 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6282368BE1; Fri,  8 Nov 2019 06:14:34 +0100 (CET)
Date: Fri, 8 Nov 2019 06:14:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <20191108051433.GA29611@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
 <20191107204743.GA22863@lst.de> <20191108132000.3e7bd5b8@canb.auug.org.au>
 <20191108155248.0a32a03a@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108155248.0a32a03a@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] generic-iomap tree for linux-next
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
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDM6NTI6NDhQTSArMTEwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBIaSBDaHJpc3RvcGgsCj4gCj4gT24gRnJpLCA4IE5vdiAyMDE5IDEzOjIwOjAw
ICsxMTAwIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPiA+
Cj4gPiBPbiBUaHUsIDcgTm92IDIwMTkgMjE6NDc6NDMgKzAxMDAgQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gPgo+ID4gPiBjYW4geW91IGFkZCB0aGUgZ2VuZXJpYy1p
b3JlbWFwIHRyZWU6Cj4gPiA+IAo+ID4gPiAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vy
cy9oY2gvaW9yZW1hcC5naXQKPiA+ID4gCj4gPiA+IHRvIGxpbnV4LW5leHQ/ICAgCj4gPiAKPiA+
IEkgYXNzdW1lIHlvdSBtZWFuIHRoZSBmb3ItbmV4dCBicmFuY2g/Cj4gCj4gV2l0aCB0aGF0IGFz
c3VtcHRpb24sIGFkZGVkIGZyb20gdG9kYXkuCgpZZXMsIGFuZCB0aGFua3MhCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlz
dApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMu
b3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

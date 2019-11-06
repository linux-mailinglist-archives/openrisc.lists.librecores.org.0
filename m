Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id D7995F7408
	for <lists+openrisc@lfdr.de>; Mon, 11 Nov 2019 13:37:37 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 92D1E20332;
	Mon, 11 Nov 2019 13:37:36 +0100 (CET)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id B1D5E206FE
 for <openrisc@lists.librecores.org>; Wed,  6 Nov 2019 19:28:59 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B095A68AFE; Wed,  6 Nov 2019 19:28:57 +0100 (CET)
Date: Wed, 6 Nov 2019 19:28:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20191106182857.GA21062@lst.de>
References: <20191029064834.23438-12-hch@lst.de>
 <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
 <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 11 Nov 2019 13:37:30 +0100
Subject: Re: [OpenRISC] [PATCH 11/21] asm-generic: don't provide ioremap for
 CONFIG_MMU
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, alpha <linux-alpha@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDc6MTY6MzhQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+ID4gc2hvdWxkbid0IHRoZXkgYWxsIGp1c3QgYmUgdGhhdCBmaXJzdCBvbmU/
ICBJbiBvdGhlciB3b3Jkcywgd291bGRuJ3QgaXQgYmUKPiA+IGJldHRlciB0byBhbHdheXMgcHJv
dmlkZSB0aGUgZ2VuZXJpYyBpb3JlbWFwIHByb3RvdHlwZSBhbmQgdW5pZnkgdGhlIHBvcnRzCj4g
PiBpbnN0ZWFkPwo+IAo+IEFncmVlZC4gQnV0IEknZCBnbyBmb3IgdGhlIHNlY29uZCBvbmUuCgpF
dmVudHVhbGx5IHdlIHNob3VsZCB1bmlmeSBpdCBhbmQgb25seSBoYXZlIGEgc2luZ2xlIHByb3Rv
dHlwZS4KQnV0IHdlIGhhdmUgbG90cyBvZiBpbXBsZW1lbnRhdGlvbnMgaW5jbHVkaW5nIGlubGlu
ZSBmdW5jdGlvbnMsIHNvCnRoaXMgd2lsbCB0YWtlIGEgZmV3IG1vcmUgc3RlcHMuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

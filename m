Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B52951D1FFC
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2C8C620B68;
	Wed, 13 May 2020 22:17:36 +0200 (CEST)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id 0FB2B20857
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 18:02:28 +0200 (CEST)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1jYAsk-0000qr-00; Mon, 11 May 2020 18:02:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 8CE72C0473; Mon, 11 May 2020 18:01:35 +0200 (CEST)
Date: Mon, 11 May 2020 18:01:35 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200511160135.GA17079@alpha.franken.de>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200510075510.987823-4-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 03/31] MIPS: unexport
 __flush_icache_user_range
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
 Roman Zippel <zippel@linux-m68k.org>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Jessica Yu <jeyu@kernel.org>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgMDk6NTQ6NDJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gX19mbHVzaF9pY2FjaGVfdXNlcl9yYW5nZSBpcyBub3QgdXNlZCBpbiBtb2R1
bGFyIGNvZGUsIHNvIHVuZXhwb3J0IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL21pcHMvbW0vY2FjaGUuYyB8IDEgLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKYXBwbGllZCB0byBtaXBzLW5leHQuCgpU
aG9tYXMuCgotLSAKQ3JhcCBjYW4gd29yay4gR2l2ZW4gZW5vdWdoIHRocnVzdCBwaWdzIHdpbGwg
Zmx5LCBidXQgaXQncyBub3QgbmVjZXNzYXJpbHkgYQpnb29kIGlkZWEuICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWyBSRkMxOTI1LCAyLjMgXQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

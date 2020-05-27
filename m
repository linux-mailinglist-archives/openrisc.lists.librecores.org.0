Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 146471E505D
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:51 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9716C20CED;
	Wed, 27 May 2020 23:19:50 +0200 (CEST)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by mail.librecores.org (Postfix) with ESMTPS id 0308920BB3
 for <openrisc@lists.librecores.org>; Wed, 27 May 2020 07:10:15 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 627CA68B02; Wed, 27 May 2020 07:10:12 +0200 (CEST)
Date: Wed, 27 May 2020 07:10:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20200527051011.GB16317@lst.de>
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527043426.3242439-1-natechancellor@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: Re: [OpenRISC] [PATCH] media: omap3isp: Shuffle cacheflush.h and
 include mm.h
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, hch@lst.de, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, linux-kernel@vger.kernel.org, jeyu@kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgMDk6MzQ6MjdQTSAtMDcwMCwgTmF0aGFuIENoYW5jZWxs
b3Igd3JvdGU6Cj4gQWZ0ZXIgbW0uaCB3YXMgcmVtb3ZlZCBmcm9tIHRoZSBhc20tZ2VuZXJpYyB2
ZXJzaW9uIG9mIGNhY2hlZmx1c2guaCwKPiBzMzkwIGFsbHllc2NvbmZpZyBzaG93cyBzZXZlcmFs
IHdhcm5pbmdzIG9mIHRoZSBmb2xsb3dpbmcgbmF0dXJlOgoKSG1tLCBJJ20gcHJldHR5IHN1cmUg
SSBzZW50IHRoZSBzYW1lIGZpeCBhIGZldyBkYXlzIGFnbyBpbiByZXNwb25zZSB0bwphIGJ1aWxk
IGJvdCByZXBvcnQuICBCdXQgaWYgdGhhdCBkaWRuJ3QgZ2V0IHBpY2tlZCB1cCBJJ20gZmluZSB3
aXRoCnlvdXIgdmVyc2lvbiBvZiBpdCBhcyB3ZWxsIG9mIGNvdXJzZToKCkFja2VkLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

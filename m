Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id ED1571E504F
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AF34720B0E;
	Wed, 27 May 2020 23:19:44 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 8127A20AD1
 for <openrisc@lists.librecores.org>; Mon, 18 May 2020 15:04:54 +0200 (CEST)
Received: from linux-8ccs.fritz.box (p57a239f2.dip0.t-ipconnect.de
 [87.162.57.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD592207D3;
 Mon, 18 May 2020 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589807091;
 bh=bQOel0Owh5Jsy7D7It/KRrP7k71oDOZIFpOrOzQ9AhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YqZBNW7MWDqiTSCxmly8oMsUsg4WN7C2JY9aDcakJBGzWq/UP00eyjCdLpfBridZ5
 yEWjvi7dzrZTtKaXjd/2d6IuYc59csAsUVZSfRs5jq7Rr7rdKAsQZJF1Mc/s+At7dk
 CA/eN9nd7O70bEOB0H0VqgRfIrUmH9kT0XamFLi8=
Date: Mon, 18 May 2020 15:04:44 +0200
From: Jessica Yu <jeyu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200518130444.GA21096@linux-8ccs.fritz.box>
References: <20200515143646.3857579-1-hch@lst.de>
 <20200515143646.3857579-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515143646.3857579-30-hch@lst.de>
X-OS: Linux linux-8ccs 4.12.14-lp150.12.61-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:59 +0200
Subject: Re: [OpenRISC] [PATCH 29/29] module: move the set_fs hack for
 flush_icache_range to m68k
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
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

KysrIENocmlzdG9waCBIZWxsd2lnIFsxNS8wNS8yMCAxNjozNiArMDIwMF06Cj5mbHVzaF9pY2Fj
aGVfcmFuZ2UgZ2VuZXJhbGx5IG9wZXJhdGVzIG9uIGtlcm5lbCBhZGRyZXNzZXMsIGJ1dCBmb3Ig
c29tZQo+cmVhc29uIG02OGsgbmVlZGVkIGEgc2V0X2ZzIG92ZXJyaWRlLiAgTW92ZSB0aGF0IGlu
dG8gdGhlIG02OGsgY29kZQo+aW5zdGVkIG9mIGtlZXBpbmcgaXQgaW4gdGhlIG1vZHVsZSBsb2Fk
ZXIuCj4KPlNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+UmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj5BY2tl
ZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPi0tLQo+IGFy
Y2gvbTY4ay9tbS9jYWNoZS5jIHwgNCArKysrCj4ga2VybmVsL21vZHVsZS5jICAgICAgfCA4IC0t
LS0tLS0tCj4gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpUaGFua3MgZm9yIGNsZWFuaW5nIHRoaXMgdXAuIEZvciBtb2R1bGUuYzoKCkFja2VkLWJ5OiBK
ZXNzaWNhIFl1IDxqZXl1QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMu
bGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVu
cmlzYwo=

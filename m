Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7819E1D1FF4
	for <lists+openrisc@lfdr.de>; Wed, 13 May 2020 22:17:35 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EE17820B44;
	Wed, 13 May 2020 22:17:33 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A3E7B2014C
 for <openrisc@lists.librecores.org>; Mon, 11 May 2020 09:51:25 +0200 (CEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15B2F20735;
 Mon, 11 May 2020 07:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589183483;
 bh=ujV3u+dsl5PKS0aIWtuPo2XlUIWTrnZfhH9932lJ3Ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0mQ7t5as8jZps7eSFkQLnwLtzVeQdo1iP3qe/Hftt/g3zJxfzwQVDrNcWnrxBfusE
 WGRRbC87hk6tU7Y02J552JkiWyPKHGmHG8/2xNIIubv0rRSCeTtP6ug62nSc345L3i
 YbZ4edSRI7cSRvmZAntksnLnC8c2Z4vBB1WMY+EY=
Date: Mon, 11 May 2020 08:51:15 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>, james.morse@arm.com,
 catalin.marinas@arm.com
Message-ID: <20200511075115.GA16134@willie-the-truck>
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200510075510.987823-3-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 13 May 2020 22:17:32 +0200
Subject: Re: [OpenRISC] [PATCH 02/31] arm64: fix the flush_icache_range
 arguments in machine_kexec
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

WytKYW1lcyBhbmQgQ2F0YWxpbl0KCk9uIFN1biwgTWF5IDEwLCAyMDIwIGF0IDA5OjU0OjQxQU0g
KzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IFRoZSBzZWNvbmQgYXJndW1lbnQgaXMg
dGhlIGVuZCAicG9pbnRlciIsIG5vdCB0aGUgbGVuZ3RoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9t
YWNoaW5lX2tleGVjLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMuYyBiL2FyY2gv
YXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+IGluZGV4IDhlOWM5MjQ0MjNiNGUuLmEwYjE0
NGNmYWVhNzEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlYy5j
Cj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvbWFjaGluZV9rZXhlYy5jCj4gQEAgLTE3Nyw2ICsx
NzcsNyBAQCB2b2lkIG1hY2hpbmVfa2V4ZWMoc3RydWN0IGtpbWFnZSAqa2ltYWdlKQo+ICAJICog
dGhlIG9mZmxpbmUgQ1BVcy4gVGhlcmVmb3JlLCB3ZSBtdXN0IHVzZSB0aGUgX18qIHZhcmlhbnQg
aGVyZS4KPiAgCSAqLwo+ICAJX19mbHVzaF9pY2FjaGVfcmFuZ2UoKHVpbnRwdHJfdClyZWJvb3Rf
Y29kZV9idWZmZXIsCj4gKwkJCSAgICAgKHVpbnRwdHJfdClyZWJvb3RfY29kZV9idWZmZXIgKwo+
ICAJCQkgICAgIGFybTY0X3JlbG9jYXRlX25ld19rZXJuZWxfc2l6ZSk7CgpVcmdoLCB3ZWxsIHNw
b3R0ZWQuIEl0J3MgYW5ub3lpbmdseSBkaWZmZXJlbnQgZnJvbSBfX2ZsdXNoX2RjYWNoZV9hcmVh
KCkuCgpCdXQgbm93IEknbSB3b25kZXJpbmcgd2hhdCB0aGlzIGNvZGUgYWN0dWFsbHkgZG9lcy4u
LiB0aGUgbG9vcCBjb25kaXRpb24KaW4gaW52YWxpZGF0ZV9pY2FjaGVfYnlfbGluZSB3b3JrcyB3
aXRoIDY0LWJpdCBhcml0aG1ldGljLCBzbyB3ZSBjb3VsZApzcGVuZCBhIC92ZXJ5LyBsb25nIHRp
bWUgaGVyZSBhZmFpY3QuIEl0J3MgYWxzbyBhIGJpdCBhbm5veWluZyB0aGF0IHdlCmRvIGEgYnVu
Y2ggb2YgcmVkdW5kYW50IEQtY2FjaGUgbWFpbnRlbmFuY2UgdG9vLgoKU2hvdWxkIHdlIHVzZSBp
bnZhbGlkYXRlX2ljYWNoZV9yYW5nZSgpIGhlcmUgaW5zdGVhZD8gKGFuZCB3aHkgZG9lcyB0aGF0
CnRoaW5nIG5lZWQgdG8gdG9nZ2xlIHVhY2Nlc3MpPyBBcmdoLCB0b28gbWFueSBxdWVzdGlvbnMh
CgpXaWxsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9w
ZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczov
L2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

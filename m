Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 30AB34C3D26
	for <lists+openrisc@lfdr.de>; Fri, 25 Feb 2022 05:30:42 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BEF9824824;
	Fri, 25 Feb 2022 05:30:41 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mail.librecores.org (Postfix) with ESMTPS id 9F5D22481C
 for <openrisc@lists.librecores.org>; Fri, 25 Feb 2022 05:30:40 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 364CE618C4;
 Fri, 25 Feb 2022 04:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCC6C340E7;
 Fri, 25 Feb 2022 04:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763438;
 bh=K1RaOpayOFOl9YrWjbFso6AxJRaB7d/hqz1cXZ69p68=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JQKxpsomaZBRaWmc5cvV6ib4A8rCg4TPitG6KtMN/3RrAcjKVTJT4yK2eDFUJ+cMs
 GGe2lQ0KwF+iTYeA1pEDWDB2RtmKuBiOhrq1UD43RSIKmGPeCxSvHgFkEuaxQ4Olvr
 2eAzhesO8mAMjdIVrsZ1nZFTt4sdpEeKUGFwUAwfuxPbqH/Wkgj8BdxrL7OB3VWTTd
 G6bo95wROzxmQJyLOX4tRd/qfCxU6mfLup3kLD3UTh5ardnvCDEhsvub+4i3ykdyNs
 K3IteETxgQ/sIy9c1oYc4VbyW0VV1YzXNoLx5Km6wu9MsETEo+EXnMVoPFvUjaAbVy
 MOmcxBoXdOugg==
Message-ID: <824a2d98-e992-0406-518f-adcde2a1372a@kernel.org>
Date: Thu, 24 Feb 2022 22:30:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-13-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-13-arnd@kernel.org>
Subject: Re: [OpenRISC] [PATCH v2 12/18] uaccess: fix type mismatch warnings
 from access_ok()
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
Cc: mark.rutland@arm.com, dalias@libc.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, peterz@infradead.org, jcmvbkbc@gmail.com,
 guoren@kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, will@kernel.org, ardb@kernel.org,
 linux-s390@vger.kernel.org, kernel test robot <lkp@intel.com>,
 bcain@codeaurora.org, mpe@ellerman.id.au, deller@gmx.de, x86@kernel.org,
 linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 hca@linux.ibm.com, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 green.hu@gmail.com, monstr@monstr.eu, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, nickhu@andestech.com, linux-mips@vger.kernel.org,
 ebiederm@xmission.com, richard@nod.at, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAyLzE2LzIyIDA3OjEzLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IEZyb206IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gT24gc29tZSBhcmNoaXRlY3R1cmVzLCBhY2Nlc3Nf
b2soKSBkb2VzIG5vdCBkbyBhbnkgYXJndW1lbnQgdHlwZQo+IGNoZWNraW5nLCBzbyByZXBsYWNp
bmcgdGhlIGRlZmluaXRpb24gd2l0aCBhIGdlbmVyaWMgb25lIGNhdXNlcwo+IGEgZmV3IHdhcm5p
bmdzIGZvciBoYXJtbGVzcyBpc3N1ZXMgdGhhdCB3ZXJlIG5ldmVyIGNhdWdodCBiZWZvcmUuCj4g
Cj4gRml4IHRoZSBvbmVzIHRoYXQgSSBmb3VuZCBlaXRoZXIgdGhyb3VnaCBteSBvd24gdGVzdCBi
dWlsZHMgb3IKPiB0aGF0IHdlcmUgcmVwb3J0ZWQgYnkgdGhlIDAtZGF5IGJvdC4KPiAKPiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgIGFyY2gvYXJjL2tlcm5l
bC9wcm9jZXNzLmMgICAgICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJtL2tlcm5lbC9zd3BfZW11
bGF0ZS5jICAgICAgIHwgIDIgKy0KPiAgIGFyY2gvYXJtL2tlcm5lbC90cmFwcy5jICAgICAgICAg
ICAgIHwgIDIgKy0KPiAgIGFyY2gvY3NreS9rZXJuZWwvc2lnbmFsLmMgICAgICAgICAgIHwgIDIg
Ky0KPiAgIGFyY2gvbWlwcy9zaWJ5dGUvY29tbW9uL3NiX3RicHJvZi5jIHwgIDYgKysrLS0tCj4g
ICBhcmNoL25pb3MyL2tlcm5lbC9zaWduYWwuYyAgICAgICAgICB8IDIwICsrKysrKysrKysrLS0t
LS0tLS0tCgpBY2tlZC1ieTogRGluaCBOZ3V5ZW4gPGRpbmd1eWVuQGtlcm5lbC5vcmc+Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxp
bmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJl
Y29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBE5426865
	for <lists+openrisc@lfdr.de>; Fri,  8 Oct 2021 13:01:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AC0922419E;
	Fri,  8 Oct 2021 13:01:34 +0200 (CEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by mail.librecores.org (Postfix) with ESMTPS id 229FE2412F
 for <openrisc@lists.librecores.org>; Fri,  8 Oct 2021 13:01:33 +0200 (CEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQlcH5cyHz4xbV;
 Fri,  8 Oct 2021 22:01:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633690887;
 bh=B4qzHAigKKJHhzM+dPDATq6BWHA36ShynfcFOX354Uw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ecgb6jGX08YbAx5B1reNn4h/kU3Gen7kievibOO69w+92xKGfimzG9blAbi2wPVuT
 bzRQvpw1Gsq6L5OISVmfgRGEMrtpfffTD3SxPCSAMjCA7BaSe9z1Uwt8UhxvwagCXt
 RG8jZ9yVbHmz/oZlWgdyytG8dpN+zilnWPdwvHzOrKK+z9cUFtnbh9EiaF6DvYThDq
 y+nA3s2Jr7OnqG1H9G2arDaiYJ9T+Ocn4v009hMVegWkEyhfV3tBa+fnPnVWJ1bKT9
 NTxKKbhG9DIb5b2JYg+QufFs7CUHZN2G28KnkHe3XTX54qxanjx0qe1ihehNmLNt3p
 OX9W1GxfbYAzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20211006164332.1981454-8-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-8-robh@kernel.org>
Date: Fri, 08 Oct 2021 22:01:15 +1100
Message-ID: <8735pbok5g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Subject: Re: [OpenRISC] [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, linux-sh@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, bcm-kernel-feedback-list@broadcom.com,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JpdGVzOgo+IFJlcGxhY2Ugb3BlbiBjb2Rl
ZCBwYXJzaW5nIG9mIENQVSBub2RlcycgJ3JlZycgcHJvcGVydHkgd2l0aAo+IG9mX2dldF9jcHVf
aHdpZCgpLgo+Cj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBD
YzogQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3JnPgo+IENj
OiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiBDYzogbGludXhwcGMtZGV2QGxp
c3RzLm96bGFicy5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgo+IC0tLQo+ICBhcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jIHwgNyArLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zbXAu
Ywo+IGluZGV4IDljYzdkM2RiZjQzOS4uZDk2YjBlMzYxYTczIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9rZXJuZWwvc21wLmMKPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NtcC5jCj4g
QEAgLTEzMTMsMTggKzEzMTMsMTMgQEAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUsIHN0
cnVjdCB0YXNrX3N0cnVjdCAqdGlkbGUpCj4gIGludCBjcHVfdG9fY29yZV9pZChpbnQgY3B1KQo+
ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOwo+IC0JY29uc3QgX19iZTMyICpyZWc7Cj4g
IAlpbnQgaWQgPSAtMTsKPiAgCj4gIAlucCA9IG9mX2dldF9jcHVfbm9kZShjcHUsIE5VTEwpOwo+
ICAJaWYgKCFucCkKPiAgCQlnb3RvIG91dDsKPiAgCj4gLQlyZWcgPSBvZl9nZXRfcHJvcGVydHko
bnAsICJyZWciLCBOVUxMKTsKPiAtCWlmICghcmVnKQo+IC0JCWdvdG8gb3V0Owo+IC0KPiAtCWlk
ID0gYmUzMl90b19jcHVwKHJlZyk7Cj4gKwlpZCA9IG9mX2dldF9jcHVfaHdpZChucCwgMCk7Cj4g
IG91dDoKPiAgCW9mX25vZGVfcHV0KG5wKTsKPiAgCXJldHVybiBpZDsKClRoaXMgbG9va3MgT0sg
dG8gbWUuCgpBbGwgdGhlIHN5c3RlbXMgSSBjYW4gZmluZCBoYXZlIGEgL2NwdXMvI2FkZHJlc3Mt
Y2VsbHMgb2YgMSwgc28gdGhlCmNoYW5nZSB0byB1c2Ugb2Zfbl9hZGRyX2NlbGxzKCkgaW4gb2Zf
Z2V0X2NwdV9od2lkKCkgc2hvdWxkIGJlIGZpbmUuCgpJIGJvb3RlZCBpdCBvbiBhIGJ1bmNoIG9m
IHN5c3RlbXMgd2l0aCBubyBpc3N1ZXMuCgpBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBl
QGVsbGVybWFuLmlkLmF1PgoKY2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJy
ZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNj
Cg==

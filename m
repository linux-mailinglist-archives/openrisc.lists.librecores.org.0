Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id DB3FA171757
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A77E120930;
	Thu, 27 Feb 2020 13:35:27 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id F23AB2056E
 for <openrisc@lists.librecores.org>; Wed, 19 Feb 2020 14:24:42 +0100 (CET)
Received: from hump (unknown [147.67.241.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02D8B24654;
 Wed, 19 Feb 2020 13:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582118681;
 bh=WeK8iDiz+u7KGQl8xdyYvIuPvj8pRW13k3gZGmGmUOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CrDKTg0KsoKO1U07yyagx89/mJ6hieOjLuM/lo6w3mB9Y9R+aQAidXZSv/ywuM3au
 r4bYkFE2ZGGFM/SSIBeOb3LJun+6yquvbVIUq2PH+U+U65CCtHToRoSUxXZ4LnlfNf
 XO/4CZv966+4qxBk+L+tbRqcMNDfbzR2x3+83oH0=
Date: Wed, 19 Feb 2020 14:24:20 +0100
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <20200219132420.GA5559@hump>
References: <20200216081843.28670-1-rppt@kernel.org>
 <20200216081843.28670-8-rppt@kernel.org>
 <5b7c3929-5833-8ceb-85c8-a8e92e6a138e@c-s.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b7c3929-5833-8ceb-85c8-a8e92e6a138e@c-s.fr>
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:35:25 +0100
Subject: Re: [OpenRISC] [PATCH v2 07/13] powerpc: add support for folded p4d
 page tables
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-arch@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Marc Zyngier <maz@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 kvm-ppc@vger.kernel.org, openrisc@lists.librecores.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDE6MDc6NTVQTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiBMZSAxNi8wMi8yMDIwIMOgIDA5OjE4LCBNaWtlIFJhcG9wb3J0IGEgw6lj
cml0wqA6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL3B0ZHVtcC9wdGR1bXAuYyBi
L2FyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRkdW1wLmMKPiA+IGluZGV4IDIwNjE1NjI1NTI0Ny4u
N2JkNGI4MWQ1YjVkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3B0ZHVtcC9wdGR1
bXAuYwo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3B0ZHVtcC9wdGR1bXAuYwo+ID4gQEAgLTI3
Nyw5ICsyNzcsOSBAQCBzdGF0aWMgdm9pZCB3YWxrX3BtZChzdHJ1Y3QgcGdfc3RhdGUgKnN0LCBw
dWRfdCAqcHVkLCB1bnNpZ25lZCBsb25nIHN0YXJ0KQo+ID4gICAJfQo+ID4gICB9Cj4gPiAtc3Rh
dGljIHZvaWQgd2Fsa19wdWQoc3RydWN0IHBnX3N0YXRlICpzdCwgcGdkX3QgKnBnZCwgdW5zaWdu
ZWQgbG9uZyBzdGFydCkKPiA+ICtzdGF0aWMgdm9pZCB3YWxrX3B1ZChzdHJ1Y3QgcGdfc3RhdGUg
KnN0LCBwNGRfdCAqcDRkLCB1bnNpZ25lZCBsb25nIHN0YXJ0KQo+ID4gICB7Cj4gPiAtCXB1ZF90
ICpwdWQgPSBwdWRfb2Zmc2V0KHBnZCwgMCk7Cj4gPiArCXB1ZF90ICpwdWQgPSBwdWRfb2Zmc2V0
KHA0ZCwgMCk7Cj4gPiAgIAl1bnNpZ25lZCBsb25nIGFkZHI7Cj4gPiAgIAl1bnNpZ25lZCBpbnQg
aTsKPiA+IEBAIC0yOTMsNiArMjkzLDIyIEBAIHN0YXRpYyB2b2lkIHdhbGtfcHVkKHN0cnVjdCBw
Z19zdGF0ZSAqc3QsIHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgc3RhcnQpCj4gPiAgIAl9Cj4g
PiAgIH0KPiA+ICtzdGF0aWMgdm9pZCB3YWxrX3A0ZChzdHJ1Y3QgcGdfc3RhdGUgKnN0LCBwZ2Rf
dCAqcGdkLCB1bnNpZ25lZCBsb25nIHN0YXJ0KQo+ID4gK3sKPiA+ICsJcDRkX3QgKnA0ZCA9IHA0
ZF9vZmZzZXQocGdkLCAwKTsKPiA+ICsJdW5zaWduZWQgbG9uZyBhZGRyOwo+ID4gKwl1bnNpZ25l
ZCBpbnQgaTsKPiA+ICsKPiA+ICsJZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1A0RDsgaSsrLCBw
NGQrKykgewo+ID4gKwkJYWRkciA9IHN0YXJ0ICsgaSAqIFA0RF9TSVpFOwo+ID4gKwkJaWYgKCFw
NGRfbm9uZSgqcDRkKSAmJiAhcDRkX2lzX2xlYWYoKnA0ZCkpCj4gPiArCQkJLyogcDRkIGV4aXN0
cyAqLwo+ID4gKwkJCXdhbGtfcHVkKHN0LCBwNGQsIGFkZHIpOwo+ID4gKwkJZWxzZQo+ID4gKwkJ
CW5vdGVfcGFnZShzdCwgYWRkciwgMiwgcDRkX3ZhbCgqcDRkKSk7Cj4gCj4gTGV2ZWwgMiBpcyBh
bHJlYWR5IHVzZWQgYnkgd2Fsa19wdWQoKS4KPiAKPiBJIHRoaW5rIHlvdSBoYXZlIHRvIGluY3Jl
bWVudCB0aGUgbGV2ZWwgdXNlZCBpbiB3YWxrX3B1ZCgpIGFuZCB3YWxrX3BtZCgpCj4gYW5kIHdh
bGtfcHRlKCkKClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyEKSSdsbCBmaXggdGhlIG51bWJlcnMg
aW4gdGhlIG5leHQgdmVyc2lvbi4KIAo+ID4gKwl9Cj4gPiArfQo+ID4gKwo+ID4gICBzdGF0aWMg
dm9pZCB3YWxrX3BhZ2V0YWJsZXMoc3RydWN0IHBnX3N0YXRlICpzdCkKPiA+ICAgewo+ID4gICAJ
dW5zaWduZWQgaW50IGk7Cj4gPiBAQCAtMzA2LDcgKzMyMiw3IEBAIHN0YXRpYyB2b2lkIHdhbGtf
cGFnZXRhYmxlcyhzdHJ1Y3QgcGdfc3RhdGUgKnN0KQo+ID4gICAJZm9yIChpID0gcGdkX2luZGV4
KGFkZHIpOyBpIDwgUFRSU19QRVJfUEdEOyBpKyssIHBnZCsrLCBhZGRyICs9IFBHRElSX1NJWkUp
IHsKPiA+ICAgCQlpZiAoIXBnZF9ub25lKCpwZ2QpICYmICFwZ2RfaXNfbGVhZigqcGdkKSkKPiA+
ICAgCQkJLyogcGdkIGV4aXN0cyAqLwo+ID4gLQkJCXdhbGtfcHVkKHN0LCBwZ2QsIGFkZHIpOwo+
ID4gKwkJCXdhbGtfcDRkKHN0LCBwZ2QsIGFkZHIpOwo+ID4gICAJCWVsc2UKPiA+ICAgCQkJbm90
ZV9wYWdlKHN0LCBhZGRyLCAxLCBwZ2RfdmFsKCpwZ2QpKTsKPiA+ICAgCX0KPiAKPiBDaHJpc3Rv
cGhlCgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

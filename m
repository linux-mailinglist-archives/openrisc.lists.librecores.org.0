Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 217E7171756
	for <lists+openrisc@lfdr.de>; Thu, 27 Feb 2020 13:35:28 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 38755208C6;
	Thu, 27 Feb 2020 13:35:27 +0100 (CET)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by mail.librecores.org (Postfix) with ESMTPS id CA9AD20192
 for <openrisc@lists.librecores.org>; Wed, 19 Feb 2020 13:07:57 +0100 (CET)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48MxLg3psQz9v9Dt;
 Wed, 19 Feb 2020 13:07:55 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XonlV0Z+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AFyfJZVf4xTO; Wed, 19 Feb 2020 13:07:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48MxLg2Kzcz9v9Ds;
 Wed, 19 Feb 2020 13:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582114075; bh=SUPm/xbOXqzg/7rTrLgpDJn6K3q1CABhJDtHqKqTUfA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XonlV0Z+kSYp9DXtpHiZkNHEHxFMw6PZijdFfIFeuIK/K+RCtqkXv0VtzGY+2wuZu
 xOicb9401xVMMs8rHDmTPmm6KlS2ffHsw+cSbAZdq3j0YAum02eQePHOFl9npiNl8S
 akY+ce7GONPJifLUkacYEEGeIusgoWWVvfKmbJes=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CDA98B83F;
 Wed, 19 Feb 2020 13:07:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ix2R2LHOLPeo; Wed, 19 Feb 2020 13:07:56 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B4B6E8B837;
 Wed, 19 Feb 2020 13:07:55 +0100 (CET)
To: Mike Rapoport <rppt@kernel.org>
References: <20200216081843.28670-1-rppt@kernel.org>
 <20200216081843.28670-8-rppt@kernel.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5b7c3929-5833-8ceb-85c8-a8e92e6a138e@c-s.fr>
Date: Wed, 19 Feb 2020 13:07:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200216081843.28670-8-rppt@kernel.org>
Content-Language: fr
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpMZSAxNi8wMi8yMDIwIMOgIDA5OjE4LCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IEltcGxlbWVudCBwcmlt
aXRpdmVzIG5lY2Vzc2FyeSBmb3IgdGhlIDR0aCBsZXZlbCBmb2xkaW5nLCBhZGQgd2Fsa3Mgb2Yg
cDRkCj4gbGV2ZWwgd2hlcmUgYXBwcm9wcmlhdGUgYW5kIHJlcGxhY2UgNWxldmVsLWZpeHVwLmgg
d2l0aCBwZ3RhYmxlLW5vcDRkLmguCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8
cnBwdEBsaW51eC5pYm0uY29tPgo+IFRlc3RlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjLXMuZnI+ICMgOHh4IGFuZCA4M3h4Cj4gLS0tCj4gICBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCAgfCAgMSAtCj4gICBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2guaCAgICAgfCAgNCArLQo+ICAgYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ2FsbG9jLmggIHwgIDQgKy0KPiAgIGFyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oICB8IDU4ICsrKysrKysrKystLS0tLS0t
LQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9yYWRpeC5oICAgIHwgIDYg
Ky0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oICB8ICAx
IC0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGdhbGxvYy5oICB8ICAy
ICstCj4gICAuLi4vaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUtNGsuaCAgICAgICAgfCAz
MiArKysrKy0tLS0tCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFi
bGUuaCAgfCAgNiArLQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAg
ICAgICAgIHwgIDggKysrCj4gICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc182NF9tbXVfcmFkaXgu
YyAgICAgICAgfCA1OSArKysrKysrKysrKysrKysrLS0tCj4gICBhcmNoL3Bvd2VycGMvbGliL2Nv
ZGUtcGF0Y2hpbmcuYyAgICAgICAgICAgICAgfCAgNyArKy0KPiAgIGFyY2gvcG93ZXJwYy9tbS9i
b29rM3MzMi9tbXUuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBhcmNoL3Bvd2VycGMvbW0v
Ym9vazNzMzIvdGxiLmMgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAgYXJjaC9wb3dlcnBjL21t
L2Jvb2szczY0L2hhc2hfcGd0YWJsZS5jICAgICAgIHwgIDQgKy0KPiAgIGFyY2gvcG93ZXJwYy9t
bS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxlLmMgICAgICB8IDE5ICsrKystLQo+ICAgYXJjaC9wb3dl
cnBjL21tL2Jvb2szczY0L3N1YnBhZ2VfcHJvdC5jICAgICAgIHwgIDYgKy0KPiAgIGFyY2gvcG93
ZXJwYy9tbS9odWdldGxicGFnZS5jICAgICAgICAgICAgICAgICB8IDI4ICsrKysrLS0tLQo+ICAg
YXJjaC9wb3dlcnBjL21tL2thc2FuL2thc2FuX2luaXRfMzIuYyAgICAgICAgIHwgIDggKy0tCj4g
ICBhcmNoL3Bvd2VycGMvbW0vbWVtLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+
ICAgYXJjaC9wb3dlcnBjL21tL25vaGFzaC80MHguYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0K
PiAgIGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gvYm9vazNlX3BndGFibGUuYyAgICAgICB8IDE1ICsr
Ky0tCj4gICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jICAgICAgICAgICAgICAgICAgICAgfCAy
NSArKysrKysrLQo+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFibGVfMzIuYyAgICAgICAgICAgICAg
ICAgIHwgMjggKysrKystLS0tCj4gICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV82NC5jICAgICAg
ICAgICAgICAgICAgfCAxMCArKy0tCj4gICBhcmNoL3Bvd2VycGMvbW0vcHRkdW1wL2hhc2hwYWdl
dGFibGUuYyAgICAgICAgfCAyMCArKysrKystCj4gICBhcmNoL3Bvd2VycGMvbW0vcHRkdW1wL3B0
ZHVtcC5jICAgICAgICAgICAgICAgfCAyMiArKysrKystCj4gICBhcmNoL3Bvd2VycGMveG1vbi94
bW9uLmMgICAgICAgICAgICAgICAgICAgICAgfCAxNyArKysrKy0KPiAgIDI4IGZpbGVzIGNoYW5n
ZWQsIDI4NCBpbnNlcnRpb25zKCspLCAxMjAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRkdW1wLmMgYi9hcmNoL3Bvd2VycGMvbW0vcHRkdW1w
L3B0ZHVtcC5jCj4gaW5kZXggMjA2MTU2MjU1MjQ3Li43YmQ0YjgxZDViNWQgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9wb3dlcnBjL21tL3B0ZHVtcC9wdGR1bXAuYwo+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9wdGR1bXAvcHRkdW1wLmMKPiBAQCAtMjc3LDkgKzI3Nyw5IEBAIHN0YXRpYyB2b2lkIHdhbGtf
cG1kKHN0cnVjdCBwZ19zdGF0ZSAqc3QsIHB1ZF90ICpwdWQsIHVuc2lnbmVkIGxvbmcgc3RhcnQp
Cj4gICAJfQo+ICAgfQo+ICAgCj4gLXN0YXRpYyB2b2lkIHdhbGtfcHVkKHN0cnVjdCBwZ19zdGF0
ZSAqc3QsIHBnZF90ICpwZ2QsIHVuc2lnbmVkIGxvbmcgc3RhcnQpCj4gK3N0YXRpYyB2b2lkIHdh
bGtfcHVkKHN0cnVjdCBwZ19zdGF0ZSAqc3QsIHA0ZF90ICpwNGQsIHVuc2lnbmVkIGxvbmcgc3Rh
cnQpCj4gICB7Cj4gLQlwdWRfdCAqcHVkID0gcHVkX29mZnNldChwZ2QsIDApOwo+ICsJcHVkX3Qg
KnB1ZCA9IHB1ZF9vZmZzZXQocDRkLCAwKTsKPiAgIAl1bnNpZ25lZCBsb25nIGFkZHI7Cj4gICAJ
dW5zaWduZWQgaW50IGk7Cj4gICAKPiBAQCAtMjkzLDYgKzI5MywyMiBAQCBzdGF0aWMgdm9pZCB3
YWxrX3B1ZChzdHJ1Y3QgcGdfc3RhdGUgKnN0LCBwZ2RfdCAqcGdkLCB1bnNpZ25lZCBsb25nIHN0
YXJ0KQo+ICAgCX0KPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB3YWxrX3A0ZChzdHJ1Y3QgcGdf
c3RhdGUgKnN0LCBwZ2RfdCAqcGdkLCB1bnNpZ25lZCBsb25nIHN0YXJ0KQo+ICt7Cj4gKwlwNGRf
dCAqcDRkID0gcDRkX29mZnNldChwZ2QsIDApOwo+ICsJdW5zaWduZWQgbG9uZyBhZGRyOwo+ICsJ
dW5zaWduZWQgaW50IGk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1A0RDsgaSsr
LCBwNGQrKykgewo+ICsJCWFkZHIgPSBzdGFydCArIGkgKiBQNERfU0laRTsKPiArCQlpZiAoIXA0
ZF9ub25lKCpwNGQpICYmICFwNGRfaXNfbGVhZigqcDRkKSkKPiArCQkJLyogcDRkIGV4aXN0cyAq
Lwo+ICsJCQl3YWxrX3B1ZChzdCwgcDRkLCBhZGRyKTsKPiArCQllbHNlCj4gKwkJCW5vdGVfcGFn
ZShzdCwgYWRkciwgMiwgcDRkX3ZhbCgqcDRkKSk7CgpMZXZlbCAyIGlzIGFscmVhZHkgdXNlZCBi
eSB3YWxrX3B1ZCgpLgoKSSB0aGluayB5b3UgaGF2ZSB0byBpbmNyZW1lbnQgdGhlIGxldmVsIHVz
ZWQgaW4gd2Fsa19wdWQoKSBhbmQgCndhbGtfcG1kKCkgYW5kIHdhbGtfcHRlKCkKCj4gKwl9Cj4g
K30KPiArCj4gICBzdGF0aWMgdm9pZCB3YWxrX3BhZ2V0YWJsZXMoc3RydWN0IHBnX3N0YXRlICpz
dCkKPiAgIHsKPiAgIAl1bnNpZ25lZCBpbnQgaTsKPiBAQCAtMzA2LDcgKzMyMiw3IEBAIHN0YXRp
YyB2b2lkIHdhbGtfcGFnZXRhYmxlcyhzdHJ1Y3QgcGdfc3RhdGUgKnN0KQo+ICAgCWZvciAoaSA9
IHBnZF9pbmRleChhZGRyKTsgaSA8IFBUUlNfUEVSX1BHRDsgaSsrLCBwZ2QrKywgYWRkciArPSBQ
R0RJUl9TSVpFKSB7Cj4gICAJCWlmICghcGdkX25vbmUoKnBnZCkgJiYgIXBnZF9pc19sZWFmKCpw
Z2QpKQo+ICAgCQkJLyogcGdkIGV4aXN0cyAqLwo+IC0JCQl3YWxrX3B1ZChzdCwgcGdkLCBhZGRy
KTsKPiArCQkJd2Fsa19wNGQoc3QsIHBnZCwgYWRkcik7Cj4gICAJCWVsc2UKPiAgIAkJCW5vdGVf
cGFnZShzdCwgYWRkciwgMSwgcGdkX3ZhbCgqcGdkKSk7Cj4gICAJfQoKQ2hyaXN0b3BoZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWls
aW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJy
ZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A71DD17D60F
	for <lists+openrisc@lfdr.de>; Sun,  8 Mar 2020 21:11:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 75D562075A;
	Sun,  8 Mar 2020 21:11:38 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 0DDD1207EA
 for <openrisc@lists.librecores.org>; Thu,  5 Mar 2020 08:34:35 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7F0E1FB;
 Wed,  4 Mar 2020 23:34:33 -0800 (PST)
Received: from [10.163.1.88] (unknown [10.163.1.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B93CE3F534;
 Wed,  4 Mar 2020 23:38:16 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paulburton@kernel.org>
References: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
Message-ID: <58aecdcf-ea16-c958-0deb-97541792e081@arm.com>
Date: Thu, 5 Mar 2020 13:04:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 08 Mar 2020 21:11:35 +0100
Subject: Re: [OpenRISC] [PATCH] mm/special: Create generic fallbacks for
 pte_special() and pte_mkspecial()
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
Cc: linux-ia64@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Brian Cain <bcain@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-arch@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
 Sam Creasey <sammy@sammy.net>, Fenghua Yu <fenghua.yu@intel.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDAzLzAyLzIwMjAgMDc6MjYgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9taXBzL2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+IGluZGV4IGFlZjUzNzhmOTA5Yy4uOGU0ZTRiZTFjYTAwIDEwMDY0
NAo+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL21p
cHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTI2OSw2ICsyNjksMzYgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHNldF9wdGVfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcg
YWRkciwKPiAgICovCj4gIGV4dGVybiBwZ2RfdCBzd2FwcGVyX3BnX2RpcltdOwo+ICAKPiArLyoK
PiArICogUGxhdGZvcm0gc3BlY2lmaWMgcHRlX3NwZWNpYWwoKSBhbmQgcHRlX21rc3BlY2lhbCgp
IGRlZmluaXRpb25zCj4gKyAqIGFyZSByZXF1aXJlZCBvbmx5IHdoZW4gQVJDSF9IQVNfUFRFX1NQ
RUNJQUwgaXMgZW5hYmxlZC4KPiArICovCj4gKyNpZiAhZGVmaW5lZChDT05GSUdfMzJCSVQpICYm
ICFkZWZpbmVkKENPTkZJR19DUFVfSEFTX1JJWEkpCj4gKyNpZiBkZWZpbmVkKENPTkZJR19QSFlT
X0FERFJfVF82NEJJVCkgJiYgZGVmaW5lZChDT05GSUdfQ1BVX01JUFMzMikKPiArc3RhdGljIGlu
bGluZSBpbnQgcHRlX3NwZWNpYWwocHRlX3QgcHRlKQo+ICt7Cj4gKwlyZXR1cm4gcHRlLnB0ZV9s
b3cgJiBfUEFHRV9TUEVDSUFMOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9t
a3NwZWNpYWwocHRlX3QgcHRlKQo+ICt7Cj4gKwlwdGUucHRlX2xvdyB8PSBfUEFHRV9TUEVDSUFM
Owo+ICsJcmV0dXJuIHB0ZTsKPiArfQo+ICsjZWxzZQo+ICtzdGF0aWMgaW5saW5lIGludCBwdGVf
c3BlY2lhbChwdGVfdCBwdGUpCj4gK3sKPiArCXJldHVybiBwdGVfdmFsKHB0ZSkgJiBfUEFHRV9T
UEVDSUFMOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9ta3NwZWNpYWwocHRl
X3QgcHRlKQo+ICt7Cj4gKwlwdGVfdmFsKHB0ZSkgfD0gX1BBR0VfU1BFQ0lBTDsKPiArCXJldHVy
biBwdGU7Cj4gK30KPiArI2VuZGlmCj4gKyNlbmRpZgo+ICsKCkhlbGxvIFJhbGYvUGF1bCwKClRo
aXMgY2hhbmdlIG5vdyByZXN0cmljdHMgbWlwcyBkZWZpbml0aW9ucyBmb3IgcHRlX3NwZWNpYWwo
KSBhbmQgcHRlX21rc3BlY2lhbCgpCmFuZCBtYWtlcyB0aGVtIHZpc2libGUgb25seSBmb3IgY29u
ZmlncyB3aGVyZSBBUkNIX0hBU19QVEVfU1BFQ0lBTCBpcyBlbmFibGVkLgpEb2VzIHRoaXMgbG9v
ayBva2F5ID8gSW4gYWxtb3N0IGFsbCBvdGhlciBwbGF0Zm9ybXMgd2UgZHJvcCB0aGUgc3R1YiBk
ZWZpbml0aW9ucwpmb3IgcHRlX3NwZWNpYWwoKSBhbmQgcHRlX21rc3BlY2lhbCgpLgoKLSBBbnNo
dW1hbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVu
UklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9s
aXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

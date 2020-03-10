Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 76EA01812D3
	for <lists+openrisc@lfdr.de>; Wed, 11 Mar 2020 09:22:44 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 4F83120A4E;
	Wed, 11 Mar 2020 09:22:42 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 002C7208FB
 for <openrisc@lists.librecores.org>; Tue, 10 Mar 2020 14:46:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8E4A30E;
 Tue, 10 Mar 2020 06:46:58 -0700 (PDT)
Received: from [10.163.1.203] (unknown [10.163.1.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26DEA3F6CF;
 Tue, 10 Mar 2020 06:46:44 -0700 (PDT)
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1583802551-15406-1-git-send-email-anshuman.khandual@arm.com>
 <20200310132747.GA12601@alpha.franken.de>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <a8341dde-aa59-b425-ac23-b6005e0a67ec@arm.com>
Date: Tue, 10 Mar 2020 19:16:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200310132747.GA12601@alpha.franken.de>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Mar 2020 09:22:41 +0100
Subject: Re: [OpenRISC] [PATCH V2] mm/special: Create generic fallbacks for
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
 linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Paul Burton <paulburton@kernel.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 linux-parisc@vger.kernel.org, linux-arch@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

CgpPbiAwMy8xMC8yMDIwIDA2OjU3IFBNLCBUaG9tYXMgQm9nZW5kb2VyZmVyIHdyb3RlOgo+IE9u
IFR1ZSwgTWFyIDEwLCAyMDIwIGF0IDA2OjM5OjExQU0gKzA1MzAsIEFuc2h1bWFuIEtoYW5kdWFs
IHdyb3RlOgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gaW5kZXggYWVmNTM3OGY5MDljLi44
ZTRlNGJlMWNhMDAgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgKPj4gKysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiBAQCAtMjY5LDYg
KzI2OSwzNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0
ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+PiAgICovCj4+ICBleHRlcm4gcGdkX3Qgc3dhcHBl
cl9wZ19kaXJbXTsKPj4gIAo+PiArLyoKPj4gKyAqIFBsYXRmb3JtIHNwZWNpZmljIHB0ZV9zcGVj
aWFsKCkgYW5kIHB0ZV9ta3NwZWNpYWwoKSBkZWZpbml0aW9ucwo+PiArICogYXJlIHJlcXVpcmVk
IG9ubHkgd2hlbiBBUkNIX0hBU19QVEVfU1BFQ0lBTCBpcyBlbmFibGVkLgo+PiArICovCj4+ICsj
aWYgIWRlZmluZWQoQ09ORklHXzMyQklUKSAmJiAhZGVmaW5lZChDT05GSUdfQ1BVX0hBU19SSVhJ
KQo+IAo+IHRoaXMgbG9va3Mgd3JvbmcuCj4gCj4gY3VycmVudCBLY29uZmlnIHN0YXRlbWVudCBp
cwo+IAo+IHNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTCBpZiAhKDMyQklUICYmIENQVV9IQVNf
UklYSSkKPiAKPiBzbyB3ZSBjYW4ndCB1c2UgUFRFX1NQRUNJQUwgb24gMzJiaXQgX2FuZF8gQ1BV
cyB3aXRoIFJJWEkgc3VwcG9ydC4KCkkgYWxyZWFkeSBoYWQgYXNrZWQgZm9yIGNsYXJpZmljYXRp
b24gb24gdGhpcy4KCj4gCj4gV2h5IGNhbid0IHdlIHVzZQo+IAo+ICNpZiBkZWZpbmVkKENPTkZJ
R19BUkNIX0hBU19QVEVfU1BFQ0lBTCkKPiAKPiBoZXJlIGFzIHRoZSBjb21tZW50IGFscmVhZHkg
c3VnZ2VzdHMgPwoKWWVzLCB0aGF0IHdpbGwgYmUgZWFzaWVyIGFuZCB3aWxsIGF1dG9tYXRpY2Fs
bHkgYWRqdXN0IGluIGNhc2UKQVJDSF9IQVNfUFRFX1NQRUNJQUwgc2NvcGUgY2hhbmdlcyBsYXRl
ci4gV2lsbCByZXNwaW4gdGhlIHBhdGNoLgoKPiAKPiBUaG9tYXMuCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApP
cGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3Jn
L2xpc3RpbmZvL29wZW5yaXNjCg==

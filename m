Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id AC3DF1812D2
	for <lists+openrisc@lfdr.de>; Wed, 11 Mar 2020 09:22:43 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 217D520A4C;
	Wed, 11 Mar 2020 09:22:42 +0100 (CET)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by mail.librecores.org (Postfix) with ESMTP id 3BF6320A28
 for <openrisc@lists.librecores.org>; Tue, 10 Mar 2020 14:28:37 +0100 (CET)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1jBevd-0006Jg-00; Tue, 10 Mar 2020 14:28:13 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id D9C6FC0FAF; Tue, 10 Mar 2020 14:27:47 +0100 (CET)
Date: Tue, 10 Mar 2020 14:27:47 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <20200310132747.GA12601@alpha.franken.de>
References: <1583802551-15406-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583802551-15406-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDY6Mzk6MTFBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
Yi9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggYWVmNTM3OGY5MDljLi44
ZTRlNGJlMWNhMDAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUu
aAo+ICsrKyBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiBAQCAtMjY5LDYgKzI2
OSwzNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAgKi8KPiAgZXh0ZXJuIHBnZF90IHN3YXBwZXJfcGdf
ZGlyW107Cj4gIAo+ICsvKgo+ICsgKiBQbGF0Zm9ybSBzcGVjaWZpYyBwdGVfc3BlY2lhbCgpIGFu
ZCBwdGVfbWtzcGVjaWFsKCkgZGVmaW5pdGlvbnMKPiArICogYXJlIHJlcXVpcmVkIG9ubHkgd2hl
biBBUkNIX0hBU19QVEVfU1BFQ0lBTCBpcyBlbmFibGVkLgo+ICsgKi8KPiArI2lmICFkZWZpbmVk
KENPTkZJR18zMkJJVCkgJiYgIWRlZmluZWQoQ09ORklHX0NQVV9IQVNfUklYSSkKCnRoaXMgbG9v
a3Mgd3JvbmcuCgpjdXJyZW50IEtjb25maWcgc3RhdGVtZW50IGlzCgpzZWxlY3QgQVJDSF9IQVNf
UFRFX1NQRUNJQUwgaWYgISgzMkJJVCAmJiBDUFVfSEFTX1JJWEkpCgpzbyB3ZSBjYW4ndCB1c2Ug
UFRFX1NQRUNJQUwgb24gMzJiaXQgX2FuZF8gQ1BVcyB3aXRoIFJJWEkgc3VwcG9ydC4KCldoeSBj
YW4ndCB3ZSB1c2UKCiNpZiBkZWZpbmVkKENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTCkKCmhl
cmUgYXMgdGhlIGNvbW1lbnQgYWxyZWFkeSBzdWdnZXN0cyA/CgpUaG9tYXMuCgotLSAKQ3JhcCBj
YW4gd29yay4gR2l2ZW4gZW5vdWdoIHRocnVzdCBwaWdzIHdpbGwgZmx5LCBidXQgaXQncyBub3Qg
bmVjZXNzYXJpbHkgYQpnb29kIGlkZWEuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgWyBSRkMxOTI1LCAyLjMgXQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlz
dHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9v
cGVucmlzYwo=

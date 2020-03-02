Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB00177204
	for <lists+openrisc@lfdr.de>; Tue,  3 Mar 2020 10:09:29 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id A3D05209DE;
	Tue,  3 Mar 2020 10:09:25 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mail.librecores.org (Postfix) with ESMTP id 0CA1520990
 for <openrisc@lists.librecores.org>; Mon,  2 Mar 2020 11:37:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD7531B;
 Mon,  2 Mar 2020 02:37:39 -0800 (PST)
Received: from [10.163.1.119] (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9969E3F6CF;
 Mon,  2 Mar 2020 02:37:25 -0800 (PST)
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1583114190-7678-1-git-send-email-anshuman.khandual@arm.com>
 <CAMuHMdXnUeYib2dMALyzrW8LKhTjsnGFsqALoTxVHzPGc+OUTg@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <02997860-9374-28b9-8703-dc9b62b3f8ff@arm.com>
Date: Mon, 2 Mar 2020 16:07:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXnUeYib2dMALyzrW8LKhTjsnGFsqALoTxVHzPGc+OUTg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Mar 2020 10:09:23 +0100
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Paul Burton <paulburton@kernel.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Sam Creasey <sammy@sammy.net>, Fenghua Yu <fenghua.yu@intel.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Brian Cain <bcain@codeaurora.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 alpha <linux-alpha@vger.kernel.org>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

Ck9uIDAzLzAyLzIwMjAgMDE6NDkgUE0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBIaSBB
bnNodW1hbiwKPiAKPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gTW9uLCBNYXIgMiwg
MjAyMCBhdCAyOjU2IEFNIEFuc2h1bWFuIEtoYW5kdWFsCj4gPGFuc2h1bWFuLmtoYW5kdWFsQGFy
bS5jb20+IHdyb3RlOgo+PiBDdXJyZW50bHkgdGhlcmUgYXJlIG1hbnkgcGxhdGZvcm1zIHRoYXQg
ZG9udCBlbmFibGUgSEFWRV9BUkNIX1BURV9TUEVDSUFMCj4gQVJDSF9IQVNfUFRFX1NQRUNJQUwK
PiAKPj4gYnV0IHJlcXVpcmVkIHRvIGRlZmluZSBxdWl0ZSBzaW1pbGFyIGZhbGxiYWNrIHN0dWJz
IGZvciBzcGVjaWFsIHBhZ2UgdGFibGUKPj4gZW50cnkgaGVscGVycyBzdWNoIGFzIHB0ZV9zcGVj
aWFsKCkgYW5kIHB0ZV9ta3NwZWNpYWwoKSwgYXMgdGhleSBnZXQgYnVpbGQKPj4gaW4gZ2VuZXJp
YyBNTSB3aXRob3V0IGEgY29uZmlnIGNoZWNrLiBUaGlzIGNyZWF0ZXMgdHdvIGdlbmVyaWMgZmFs
bGJhY2sKPj4gc3R1YiBkZWZpbml0aW9ucyBmb3IgdGhlc2UgaGVscGVycywgZWxpbWluYXRpbmcg
bXVjaCBjb2RlIGR1cGxpY2F0aW9uLgo+Pgo+PiBtaXBzIHBsYXRmb3JtIGhhcyBhIHNwZWNpYWwg
Y2FzZSB3aGVyZSBwdGVfc3BlY2lhbCgpIGFuZCBwdGVfbWtzcGVjaWFsKCkKPj4gdmlzaWJpbGl0
eSBpcyB3aWRlciB0aGFuIHdoYXQgSEFWRV9BUkNIX1BURV9TUEVDSUFMIGVuYWJsZW1lbnQgcmVx
dWlyZXMuCj4gQVJDSF9IQVNfUFRFX1NQRUNJQUwKPiAKCk9vcHMsIHdpbGwgZml4IGl0LiBJIGhh
dmUgYmVlbiBqdWdnbGluZyBiZXR3ZWVuIHRvbyBtYW55IEhBVkVfQVJDSF8qIGFuZApBUkNIX0hB
U18qIGxhdGVseSA6KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id F2BB417D610
	for <lists+openrisc@lfdr.de>; Sun,  8 Mar 2020 21:11:40 +0100 (CET)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 321D820927;
	Sun,  8 Mar 2020 21:11:39 +0100 (CET)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6D18820927
 for <openrisc@lists.librecores.org>; Sat,  7 Mar 2020 05:00:20 +0100 (CET)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B2EA206D5;
 Sat,  7 Mar 2020 04:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583553618;
 bh=oV9dzypff0UA0jPadqQOWi55OmuNhXb+CU9VyawDDys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SGgOZOJ38TBhL5PMq2t97iVlOYiTJrLFrJZwUFY+PkmX4j8DweXDMSJ8amOibPULY
 dukXRc++p/7grHQAkoJmRzC/WSXOXanM1qDKv14ejj7flbmiHB/27z6x/csQKB/k1O
 jFq+DE3IugyBsaFEvfl6ba2s2SLpEYfJdkqCDacY=
Date: Fri, 6 Mar 2020 20:00:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Message-Id: <20200306200016.6f3865ada0daa68b645fe5d7@linux-foundation.org>
In-Reply-To: <20200227084608.18223-8-rppt@kernel.org>
References: <20200227084608.18223-1-rppt@kernel.org>
 <20200227084608.18223-8-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Sun, 08 Mar 2020 21:11:35 +0100
Subject: Re: [OpenRISC] [PATCH v3 07/14] powerpc/32: drop get_pteptr()
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
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVGh1LCAyNyBGZWIgMjAyMCAxMDo0NjowMSArMDIwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBDb21taXQgOGQzMGMxNGNhYjMwICgicG93ZXJwYy9tbTogUmV3
b3JrIEkkL0QkIGNvaGVyZW5jeSAodjMpIikgYW5kCj4gY29tbWl0IDkwYWMxOWE4YjIxYiAoIltQ
T1dFUlBDXSBBYm9saXNoIGlvcGEoKSwgbW1fcHRvdigpLAo+IGlvX2Jsb2NrX21hcHBpbmcoKSBm
cm9tIGFyY2gvcG93ZXJwYyIpIHJlbW92ZWQgdGhlIHVzZSBvZiBnZXRfcHRlcHRyKCkKPiBvdXRz
aWRlIG9mIG1tL3BndGFibGVfMzIuYwo+IAo+IEluIG1tL3BndGFibGVfMzIuYywgdGhlIG9ubHkg
dXNlciBvZiBnZXRfcHRlcHRyKCkgaXMgX19jaGFuZ2VfcGFnZV9hdHRyKCkKPiB3aGljaCBvcGVy
YXRlcyBvbiBrZXJuZWwgY29udGV4dCBhbmQgb24gbG93bWVtIHBhZ2VzIG9ubHkuCj4gCj4gTW92
ZSBwYWdlIHRhYmxlIHRyYXZlcnNhbCB0byBfX2NoYW5nZV9wYWdlX2F0dHIoKSBhbmQgZHJvcCBn
ZXRfcHRlcHRyKCkuCgpQZW9wbGUgaGF2ZSBiZWVuIGNoYW5naW5nIHRoaW5ncyBpbiBsaW51eC1u
ZXh0IGFuZCB0aGUgcG93ZXJwYyBwYXRjaGVzCmFyZSBodXJ0aW5nLgoKSSdsbCBkaXNhYmxlIHRo
aXMgcGF0Y2ggc2VyaWVzIGZvciBub3cuICBDYW4geW91IHBsZWFzZSByZWRvCnBvd2VycGMtMzIt
ZHJvcC1nZXRfcHRlcHRyLnBhdGNoIGFuZApwb3dlcnBjLWFkZC1zdXBwb3J0LWZvci1mb2xkZWQt
cDRkLXBhZ2UtdGFibGVzLnBhdGNoIChhbmQKcG93ZXJwYy1hZGQtc3VwcG9ydC1mb3ItZm9sZGVk
LXA0ZC1wYWdlLXRhYmxlcy1maXgucGF0Y2gpPwoKVGhhbmtzLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

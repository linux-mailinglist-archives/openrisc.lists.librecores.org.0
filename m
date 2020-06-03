Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E199E1FECB6
	for <lists+openrisc@lfdr.de>; Thu, 18 Jun 2020 09:47:12 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2937220934;
	Thu, 18 Jun 2020 09:47:12 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A85AC20A46
 for <openrisc@lists.librecores.org>; Wed,  3 Jun 2020 21:05:26 +0200 (CEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2BA820663;
 Wed,  3 Jun 2020 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591211124;
 bh=Q/m5m0oN16XVkE9B8qyre3sjNLjlsvtMr3faOM5/GEY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r0JH+r6+eneNzPkKh10OQRnG/QlntwU5Ile5RdgUbb4S95xZcMJwqqczR44dEoW5/
 dXJbJhSARnLrJiGeqA21ANe/57CLpUdIlqiMBG6WT4nQbXPfCWGsOTxjBMHqOIWaG6
 YrNwC3X4+y9pXx6gFBNVV3K2D741HNKSuj4FGwes=
Date: Wed, 3 Jun 2020 12:05:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Message-Id: <20200603120522.7646d56a23088416a7d3fc1a@linux-foundation.org>
In-Reply-To: <20200414153455.21744-9-rppt@kernel.org>
References: <20200414153455.21744-1-rppt@kernel.org>
 <20200414153455.21744-9-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Jun 2020 09:47:10 +0200
Subject: Re: [OpenRISC] [PATCH v4 08/14] powerpc: add support for folded p4d
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
 Christophe Leroy <christophe.leroy@c-s.fr>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

T24gVHVlLCAxNCBBcHIgMjAyMCAxODozNDo0OSArMDMwMCBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBJbXBsZW1lbnQgcHJpbWl0aXZlcyBuZWNlc3NhcnkgZm9yIHRo
ZSA0dGggbGV2ZWwgZm9sZGluZywgYWRkIHdhbGtzIG9mIHA0ZAo+IGxldmVsIHdoZXJlIGFwcHJv
cHJpYXRlIGFuZCByZXBsYWNlIDVsZXZlbC1maXh1cC5oIHdpdGggcGd0YWJsZS1ub3A0ZC5oLgoK
QSBidW5jaCBvZiBuZXcgbWF0ZXJpYWwganVzdCBsYW5kZWQgaW4gbGludXgtbmV4dC9wb3dlcnBj
LgoKVGhlIHRpbWluZyBpcyBhd2t3YXJkISAgSSB0cnVzdCB0aGlzIHdpbGwgYmUgZ29pbmcgaW50
byBtYWlubGluZSBkdXJpbmcKdGhpcyBtZXJnZSB3aW5kb3c/ICBJZiBub3QsIHBsZWFzZSBkcm9w
IGl0IGFuZCByZXB1bGwgYWZ0ZXIgLXJjMS4KCmFyY2gvcG93ZXJwYy9tbS9wdGR1bXAvcHRkdW1w
LmM6d2Fsa19wYWdldGFibGVzKCkgd2FzIGEgcHJvYmxlbS4gCkhlcmUncyB3aGF0IEkgZW5kZWQg
dXAgd2l0aCAtIHBsZWFzZSBjaGVjay4KCnN0YXRpYyB2b2lkIHdhbGtfcGFnZXRhYmxlcyhzdHJ1
Y3QgcGdfc3RhdGUgKnN0KQp7Cgl1bnNpZ25lZCBpbnQgaTsKCXVuc2lnbmVkIGxvbmcgYWRkciA9
IHN0LT5zdGFydF9hZGRyZXNzICYgUEdESVJfTUFTSzsKCXBnZF90ICpwZ2QgPSBwZ2Rfb2Zmc2V0
X2soYWRkcik7CgoJLyoKCSAqIFRyYXZlcnNlIHRoZSBsaW51eCBwYWdldGFibGUgc3RydWN0dXJl
IGFuZCBkdW1wIHBhZ2VzIHRoYXQgYXJlIGluCgkgKiB0aGUgaGFzaCBwYWdldGFibGUuCgkgKi8K
CWZvciAoaSA9IHBnZF9pbmRleChhZGRyKTsgaSA8IFBUUlNfUEVSX1BHRDsgaSsrLCBwZ2QrKywg
YWRkciArPSBQR0RJUl9TSVpFKSB7CgkJcDRkX3QgKnA0ZCA9IHA0ZF9vZmZzZXQocGdkLCAwKTsK
CgkJaWYgKHBnZF9ub25lKCpwZ2QpIHx8IHBnZF9pc19sZWFmKCpwZ2QpKQoJCQlub3RlX3BhZ2Uo
c3QsIGFkZHIsIDEsIHA0ZF92YWwoKnA0ZCksIFBHRElSX1NJWkUpOwoJCWVsc2UgaWYgKGlzX2h1
Z2VwZChfX2h1Z2VwZChwNGRfdmFsKCpwNGQpKSkpCgkJCXdhbGtfaHVnZXBkKHN0LCAoaHVnZXBk
X3QgKilwZ2QsIGFkZHIsIFBHRElSX1NISUZULCAxKTsKCQllbHNlCgkJCS8qIHBnZCBleGlzdHMg
Ki8KCQkJd2Fsa19wdWQoc3QsIHA0ZCwgYWRkcik7Cgl9Cn0KCk1pa2UncyBzZXJpZXMgIm1tOiBj
b25zb2xpZGF0ZSBkZWZpbml0aW9ucyBvZiBwYWdlIHRhYmxlIGFjY2Vzc29ycyIKdG9vayBxdWl0
ZSBhIGxvdCBvZiBkYW1hZ2UgYXMgd2VsbC4gIFBhdGNoZXMgd2hpY2ggbmVlZGVkIHJld29yayBh
cyBhCnJlc3VsdCBvZiB0aGlzIHdlcmU6Cgpwb3dlcnBjLWFkZC1zdXBwb3J0LWZvci1mb2xkZWQt
cDRkLXBhZ2UtdGFibGVzLWZpeC5wYXRjaAptbS1pbnRyb2R1Y2UtaW5jbHVkZS1saW51eC1wZ3Rh
YmxlaC5wYXRjaAptbS1yZW9yZGVyLWluY2x1ZGVzLWFmdGVyLWludHJvZHVjdGlvbi1vZi1saW51
eC1wZ3RhYmxlaC5wYXRjaAptbS1wZ3RhYmxlLWFkZC1zaG9ydGN1dHMtZm9yLWFjY2Vzc2luZy1r
ZXJuZWwtcG1kLWFuZC1wdGUucGF0Y2gKbW0tcGd0YWJsZS1hZGQtc2hvcnRjdXRzLWZvci1hY2Nl
c3Npbmcta2VybmVsLXBtZC1hbmQtcHRlLWZpeC0yLnBhdGNoCm1tLWNvbnNvbGlkYXRlLXB0ZV9p
bmRleC1hbmQtcHRlX29mZnNldF8tZGVmaW5pdGlvbnMucGF0Y2gKbW0tY29uc29saWRhdGUtcG1k
X2luZGV4LWFuZC1wbWRfb2Zmc2V0LWRlZmluaXRpb25zLnBhdGNoCm1tLWNvbnNvbGlkYXRlLXB1
ZF9pbmRleC1hbmQtcHVkX29mZnNldC1kZWZpbml0aW9ucy5wYXRjaAptbS1jb25zb2xpZGF0ZS1w
Z2RfaW5kZXgtYW5kLXBnZF9vZmZzZXRfay1kZWZpbml0aW9ucy5wYXRjaAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0
Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5v
cmcvbGlzdGluZm8vb3BlbnJpc2MK

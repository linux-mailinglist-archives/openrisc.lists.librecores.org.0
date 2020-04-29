Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 56D9B1C05CC
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:39 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2B91A20B07;
	Thu, 30 Apr 2020 21:09:39 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 5AF1520AB7
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:14:54 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF8BD217D8;
 Wed, 29 Apr 2020 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162493;
 bh=PwNAuHT9V5jl2M06GaRQbE+89xoAz3U9lTg8JaLvxZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YUh6MeP5N0j5F003uwP7Tb9XTSPLg1HiJZXgQKYH3aNOV1FgykIkvJX3NbJ/Qjv6x
 h5l1i+Lb2NA/Dz0Sd9NWYHhDPGIF6bIB3xpSE8x8qN/eX6xSrR27VlY2tefXFAHwKj
 RCuvhTEN1u2sy0E32qtQojsNXbmNPrAEDWik6Qwg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:18 +0300
Message-Id: <20200429121126.17989-13-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 12/20] sparc32: simplify detection of memory
 zone boundaries
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
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGZyZWVfYXJlYV9p
bml0KCkgZnVuY3Rpb24gb25seSByZXF1aXJlcyB0aGUgZGVmaW5pdGlvbiBvZiBtYXhpbWFsIFBG
Tgpmb3IgZWFjaCBvZiB0aGUgc3VwcG9ydGVkIHpvbmUgcmF0ZXIgdGhhbiBjYWxjdWxhdGlvbiBv
ZiBhY3R1YWwgem9uZSBzaXplcwphbmQgdGhlIHNpemVzIG9mIHRoZSBob2xlcyBiZXR3ZWVuIHRo
ZSB6b25lcy4KCkFmdGVyIHJlbW92YWwgb2YgQ09ORklHX0hBVkVfTUVNQkxPQ0tfTk9ERV9NQVAg
dGhlIGZyZWVfYXJlYV9pbml0KCkgaXMKYXZhaWxhYmxlIHRvIGFsbCBhcmNoaXRlY3R1cmVzLgoK
VXNpbmcgdGhpcyBmdW5jdGlvbiBpbnN0ZWFkIG9mIGZyZWVfYXJlYV9pbml0X25vZGUoKSBzaW1w
bGlmaWVzIHRoZSB6b25lCmRldGVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3NwYXJjL21tL3NybW11LmMgfCAyMSArKysr
Ky0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvc3BhcmMvbW0vc3JtbXUuYyBiL2FyY2gvc3Bh
cmMvbW0vc3JtbXUuYwppbmRleCBiN2M5NGRlNzBjY2EuLmNjMDcxZGQ3ZDhkYSAxMDA2NDQKLS0t
IGEvYXJjaC9zcGFyYy9tbS9zcm1tdS5jCisrKyBiL2FyY2gvc3BhcmMvbW0vc3JtbXUuYwpAQCAt
MTAwOCwyNCArMTAwOCwxMyBAQCB2b2lkIF9faW5pdCBzcm1tdV9wYWdpbmdfaW5pdCh2b2lkKQog
CWttYXBfaW5pdCgpOwogCiAJewotCQl1bnNpZ25lZCBsb25nIHpvbmVzX3NpemVbTUFYX05SX1pP
TkVTXTsKLQkJdW5zaWduZWQgbG9uZyB6aG9sZXNfc2l6ZVtNQVhfTlJfWk9ORVNdOwotCQl1bnNp
Z25lZCBsb25nIG5wYWdlczsKLQkJaW50IHpudW07CisJCXVuc2lnbmVkIGxvbmcgbWF4X3pvbmVf
cGZuW01BWF9OUl9aT05FU10gPSB7IDAgfTsKIAotCQlmb3IgKHpudW0gPSAwOyB6bnVtIDwgTUFY
X05SX1pPTkVTOyB6bnVtKyspCi0JCQl6b25lc19zaXplW3pudW1dID0gemhvbGVzX3NpemVbem51
bV0gPSAwOworCQltYXhfem9uZV9wZm5bWk9ORV9ETUFdID0gbWF4X2xvd19wZm47CisJCW1heF96
b25lX3BmbltaT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbjsKKwkJbWF4X3pvbmVfcGZuW1pPTkVf
SElHSE1FTV0gPSBoaWdoZW5kX3BmbjsKIAotCQlucGFnZXMgPSBtYXhfbG93X3BmbiAtIHBmbl9i
YXNlOwotCi0JCXpvbmVzX3NpemVbWk9ORV9ETUFdID0gbnBhZ2VzOwotCQl6aG9sZXNfc2l6ZVta
T05FX0RNQV0gPSBucGFnZXMgLSBwYWdlc19hdmFpbDsKLQotCQlucGFnZXMgPSBoaWdoZW5kX3Bm
biAtIG1heF9sb3dfcGZuOwotCQl6b25lc19zaXplW1pPTkVfSElHSE1FTV0gPSBucGFnZXM7Ci0J
CXpob2xlc19zaXplW1pPTkVfSElHSE1FTV0gPSBucGFnZXMgLSBjYWxjX2hpZ2hwYWdlcygpOwot
Ci0JCWZyZWVfYXJlYV9pbml0X25vZGUoMCwgem9uZXNfc2l6ZSwgcGZuX2Jhc2UsIHpob2xlc19z
aXplKTsKKwkJZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZuKTsKIAl9CiB9CiAKLS0gCjIuMjYu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJ
U0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlz
dHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4CA1C05C4
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:33 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 46FBA20B46;
	Thu, 30 Apr 2020 21:09:33 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3100720AA1
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:13:31 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ED8B208FE;
 Wed, 29 Apr 2020 12:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162410;
 bh=m9mOtHD4hCvIZ2f6n0SASBG+BagmvWkgcChGi8PxIKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pOUDeNIsF7J8iJPlX7XUbF1zHTeX1v6tKU8MclZHQ6k3L6FpEh9abdTFVCIE5do6w
 lplwy/k+Rm376JNdSu/z+oA5McHyLU/kVKk+DoUOOHqDu9f3Z1VS4aEm2YRnWf67Z/
 u9RakxkdJA8CyU97M3tG92VY8tF2QQTUAancCN98=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:12 +0300
Message-Id: <20200429121126.17989-7-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 06/20] alpha: simplify detection of memory
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL2FscGhhL21tL251bWEuYyB8IDE4ICsrKyst
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hbHBoYS9tbS9udW1hLmMgYi9hcmNoL2FscGhhL21t
L251bWEuYwppbmRleCBhMjRjZDEzZTcxY2IuLjVhZDYwODdkZTFkNiAxMDA2NDQKLS0tIGEvYXJj
aC9hbHBoYS9tbS9udW1hLmMKKysrIGIvYXJjaC9hbHBoYS9tbS9udW1hLmMKQEAgLTIwMiw4ICsy
MDIsNyBAQCBzZXR1cF9tZW1vcnkodm9pZCAqa2VybmVsX2VuZCkKIAogdm9pZCBfX2luaXQgcGFn
aW5nX2luaXQodm9pZCkKIHsKLQl1bnNpZ25lZCBpbnQgICAgbmlkOwotCXVuc2lnbmVkIGxvbmcg
ICB6b25lc19zaXplW01BWF9OUl9aT05FU10gPSB7MCwgfTsKKwl1bnNpZ25lZCBsb25nICAgbWF4
X3pvbmVfcGZuW01BWF9OUl9aT05FU10gPSB7MCwgfTsKIAl1bnNpZ25lZCBsb25nCWRtYV9sb2Nh
bF9wZm47CiAKIAkvKgpAQCAtMjE1LDE5ICsyMTQsMTAgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2lu
aXQodm9pZCkKIAkgKi8KIAlkbWFfbG9jYWxfcGZuID0gdmlydF90b19waHlzKChjaGFyICopTUFY
X0RNQV9BRERSRVNTKSA+PiBQQUdFX1NISUZUOwogCi0JZm9yX2VhY2hfb25saW5lX25vZGUobmlk
KSB7Ci0JCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuID0gTk9ERV9EQVRBKG5pZCktPm5vZGVfc3Rh
cnRfcGZuOwotCQl1bnNpZ25lZCBsb25nIGVuZF9wZm4gPSBzdGFydF9wZm4gKyBOT0RFX0RBVEEo
bmlkKS0+bm9kZV9wcmVzZW50X3BhZ2VzOworCW1heF96b25lX3BmbltaT05FX0RNQV0gPSBkbWFf
bG9jYWxfcGZuOworCW1heF96b25lX3BmbltaT05FX05PUk1BTF0gPSBtYXhfcGZuOwogCi0JCWlm
IChkbWFfbG9jYWxfcGZuID49IGVuZF9wZm4gLSBzdGFydF9wZm4pCi0JCQl6b25lc19zaXplW1pP
TkVfRE1BXSA9IGVuZF9wZm4gLSBzdGFydF9wZm47Ci0JCWVsc2UgewotCQkJem9uZXNfc2l6ZVta
T05FX0RNQV0gPSBkbWFfbG9jYWxfcGZuOwotCQkJem9uZXNfc2l6ZVtaT05FX05PUk1BTF0gPSAo
ZW5kX3BmbiAtIHN0YXJ0X3BmbikgLSBkbWFfbG9jYWxfcGZuOwotCQl9Ci0JCW5vZGVfc2V0X3N0
YXRlKG5pZCwgTl9OT1JNQUxfTUVNT1JZKTsKLQkJZnJlZV9hcmVhX2luaXRfbm9kZShuaWQsIHpv
bmVzX3NpemUsIHN0YXJ0X3BmbiwgTlVMTCk7Ci0JfQorCWZyZWVfYXJlYV9pbml0KG1heF96b25l
X3Bmbik7CiAKIAkvKiBJbml0aWFsaXplIHRoZSBrZXJuZWwncyBaRVJPX1BHRS4gKi8KIAltZW1z
ZXQoKHZvaWQgKilaRVJPX1BHRSwgMCwgUEFHRV9TSVpFKTsKLS0gCjIuMjYuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBs
aXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jl
cy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

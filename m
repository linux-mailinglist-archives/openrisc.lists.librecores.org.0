Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 834BB1C05C7
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:36 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 33C6A20B49;
	Thu, 30 Apr 2020 21:09:36 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id BC52220AB3
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:14:12 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CBD82173E;
 Wed, 29 Apr 2020 12:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162451;
 bh=b/YG7nYMld8qqhXfwVvj4aAyq9ECF9kG36OPoge17nk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gete5mVfqPQzNVgaU0yDv63MEoXH9QTEuXfoT8T9XALYibDtnhNlr5vwRWl5WZhhE
 SHyUJw3hjEQKTV/pov/LM+Ar3n0IQB+On1WP1Nb+C190mk5i4q7MGiObjTCQ7YZNwi
 Jl/L/YwtBwGOKQakUeBhGOPCwTzZ4vnShoJFvTVM=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:15 +0300
Message-Id: <20200429121126.17989-10-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 09/20] csky: simplify detection of memory zone
 boundaries
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL2Nza3kva2VybmVsL3NldHVwLmMgfCAyNiAr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAu
YyBiL2FyY2gvY3NreS9rZXJuZWwvc2V0dXAuYwppbmRleCA4MTlhOWE3YmY3ODYuLjA0ODFmNGUz
NDUzOCAxMDA2NDQKLS0tIGEvYXJjaC9jc2t5L2tlcm5lbC9zZXR1cC5jCisrKyBiL2FyY2gvY3Nr
eS9rZXJuZWwvc2V0dXAuYwpAQCAtMjYsNyArMjYsOSBAQCBzdHJ1Y3Qgc2NyZWVuX2luZm8gc2Ny
ZWVuX2luZm8gPSB7CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBjc2t5X21lbWJsb2NrX2luaXQodm9p
ZCkKIHsKLQl1bnNpZ25lZCBsb25nIHpvbmVfc2l6ZVtNQVhfTlJfWk9ORVNdOworCXVuc2lnbmVk
IGxvbmcgbG93bWVtX3NpemUgPSBQRk5fRE9XTihMT1dNRU1fTElNSVQgLSBQSFlTX09GRlNFVF9P
RkZTRVQpOworCXVuc2lnbmVkIGxvbmcgc3NlZ19zaXplID0gUEZOX0RPV04oU1NFR19TSVpFIC0g
UEhZU19PRkZTRVRfT0ZGU0VUKTsKKwl1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJf
Wk9ORVNdID0geyAwIH07CiAJc2lnbmVkIGxvbmcgc2l6ZTsKIAogCW1lbWJsb2NrX3Jlc2VydmUo
X19wYShfc3RleHQpLCBfZW5kIC0gX3N0ZXh0KTsKQEAgLTM2LDI4ICszOCwyMiBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgY3NreV9tZW1ibG9ja19pbml0KHZvaWQpCiAKIAltZW1ibG9ja19kdW1wX2Fs
bCgpOwogCi0JbWVtc2V0KHpvbmVfc2l6ZSwgMCwgc2l6ZW9mKHpvbmVfc2l6ZSkpOwotCiAJbWlu
X2xvd19wZm4gPSBQRk5fVVAobWVtYmxvY2tfc3RhcnRfb2ZfRFJBTSgpKTsKIAltYXhfbG93X3Bm
biA9IG1heF9wZm4gPSBQRk5fRE9XTihtZW1ibG9ja19lbmRfb2ZfRFJBTSgpKTsKIAogCXNpemUg
PSBtYXhfcGZuIC0gbWluX2xvd19wZm47CiAKLQlpZiAoc2l6ZSA8PSBQRk5fRE9XTihTU0VHX1NJ
WkUgLSBQSFlTX09GRlNFVF9PRkZTRVQpKQotCQl6b25lX3NpemVbWk9ORV9OT1JNQUxdID0gc2l6
ZTsKLQllbHNlIGlmIChzaXplIDwgUEZOX0RPV04oTE9XTUVNX0xJTUlUIC0gUEhZU19PRkZTRVRf
T0ZGU0VUKSkgewotCQl6b25lX3NpemVbWk9ORV9OT1JNQUxdID0KLQkJCQlQRk5fRE9XTihTU0VH
X1NJWkUgLSBQSFlTX09GRlNFVF9PRkZTRVQpOwotCQltYXhfbG93X3BmbiA9IG1pbl9sb3dfcGZu
ICsgem9uZV9zaXplW1pPTkVfTk9STUFMXTsKLQl9IGVsc2UgewotCQl6b25lX3NpemVbWk9ORV9O
T1JNQUxdID0KLQkJCQlQRk5fRE9XTihMT1dNRU1fTElNSVQgLSBQSFlTX09GRlNFVF9PRkZTRVQp
OwotCQltYXhfbG93X3BmbiA9IG1pbl9sb3dfcGZuICsgem9uZV9zaXplW1pPTkVfTk9STUFMXTsK
KwlpZiAoc2l6ZSA+PSBsb3dtZW1fc2l6ZSkgeworCQltYXhfbG93X3BmbiA9IG1pbl9sb3dfcGZu
ICsgbG93bWVtX3NpemU7CiAJCXdyaXRlX21tdV9tc2ExKHJlYWRfbW11X21zYTAoKSArIFNTRUdf
U0laRSk7CisJfSBlbHNlIGlmIChzaXplID4gc3NlZ19zaXplKSB7CisJCW1heF9sb3dfcGZuID0g
bWluX2xvd19wZm4gKyBzc2VnX3NpemU7CiAJfQogCisJbWF4X3pvbmVfcGZuW1pPTkVfTk9STUFM
XSA9IG1heF9sb3dfcGZuOworCiAjaWZkZWYgQ09ORklHX0hJR0hNRU0KLQl6b25lX3NpemVbWk9O
RV9ISUdITUVNXSA9IG1heF9wZm4gLSBtYXhfbG93X3BmbjsKKwltYXhfem9uZV9wZm5bWk9ORV9I
SUdITUVNXSA9IG1heF9wZm47CiAKIAloaWdoc3RhcnRfcGZuID0gbWF4X2xvd19wZm47CiAJaGln
aGVuZF9wZm4gICA9IG1heF9wZm47CkBAIC02Niw3ICs2Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBjc2t5X21lbWJsb2NrX2luaXQodm9pZCkKIAogCWRtYV9jb250aWd1b3VzX3Jlc2VydmUoMCk7
CiAKLQlmcmVlX2FyZWFfaW5pdF9ub2RlKDAsIHpvbmVfc2l6ZSwgbWluX2xvd19wZm4sIE5VTEwp
OworCWZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7CiB9CiAKIHZvaWQgX19pbml0IHNldHVw
X2FyY2goY2hhciAqKmNtZGxpbmVfcCkKLS0gCjIuMjYuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVND
QGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGlu
Zm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id A5DAC1C05CF
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:41 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 5E54920B1A;
	Thu, 30 Apr 2020 21:09:41 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6CD8220AB9
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:15:22 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD7D621835;
 Wed, 29 Apr 2020 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162521;
 bh=QWsvJ6DvyHT7m27f3KCOEA22ptVe2a2uUAEzfYObvug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLMMyJgl66NS1Fmaq19lw3b89QqMmSF8m2U6Z06cK0zcrjZr82CAb0alxfZISVtiR
 SwqZn2jptbWUyPmjlXlat1XNJ66wzmZGzOVdKqoTD1Cr3MHknQtfp0zwsVv/YnIdOA
 M561eaKheyR84KzAYJIKo6VAoqeqzC0OkY/Hfs38=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:20 +0300
Message-Id: <20200429121126.17989-15-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 14/20] xtensa: simplify detection of memory
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3h0ZW5zYS9tbS9pbml0LmMgfCA4ICsrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2FyY2gveHRlbnNhL21tL2luaXQuYyBiL2FyY2gveHRlbnNhL21tL2luaXQuYwpp
bmRleCAxOWM2MjVlNmQ4MWYuLmEwNWIzMDZjZjM3MSAxMDA2NDQKLS0tIGEvYXJjaC94dGVuc2Ev
bW0vaW5pdC5jCisrKyBiL2FyY2gveHRlbnNhL21tL2luaXQuYwpAQCAtNzAsMTMgKzcwLDEzIEBA
IHZvaWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKQogdm9pZCBfX2luaXQgem9uZXNfaW5pdCh2
b2lkKQogewogCS8qIEFsbCBwYWdlcyBhcmUgRE1BLWFibGUsIHNvIHdlIHB1dCB0aGVtIGFsbCBp
biB0aGUgRE1BIHpvbmUuICovCi0JdW5zaWduZWQgbG9uZyB6b25lc19zaXplW01BWF9OUl9aT05F
U10gPSB7Ci0JCVtaT05FX05PUk1BTF0gPSBtYXhfbG93X3BmbiAtIEFSQ0hfUEZOX09GRlNFVCwK
Kwl1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbltNQVhfTlJfWk9ORVNdID0geworCQlbWk9ORV9O
T1JNQUxdID0gbWF4X2xvd19wZm4sCiAjaWZkZWYgQ09ORklHX0hJR0hNRU0KLQkJW1pPTkVfSElH
SE1FTV0gPSBtYXhfcGZuIC0gbWF4X2xvd19wZm4sCisJCVtaT05FX0hJR0hNRU1dID0gbWF4X3Bm
biwKICNlbmRpZgogCX07Ci0JZnJlZV9hcmVhX2luaXRfbm9kZSgwLCB6b25lc19zaXplLCBBUkNI
X1BGTl9PRkZTRVQsIE5VTEwpOworCWZyZWVfYXJlYV9pbml0KG1heF96b25lX3Bmbik7CiB9CiAK
ICNpZmRlZiBDT05GSUdfSElHSE1FTQotLSAKMi4yNi4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NA
bGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5m
by9vcGVucmlzYwo=

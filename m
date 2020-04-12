Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6041B20A6
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:46 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9944E209F6;
	Tue, 21 Apr 2020 10:01:43 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C3AAE20A31
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:52:03 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 965302076A;
 Sun, 12 Apr 2020 19:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721122;
 bh=PCbqsWYzAM+g6tcd6TH02Puf0P73UFXaFL1Rz1Zbjpg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HbTmqsqhEvgRfGTgrGcOFXT0l/9w+kXPwbSJ/Op2s6eLu2SPdTgKqvfMARPnf3gG8
 p5gRWbF2uwb7kNkXArMaMG2cQOulBtkvYbSGMF1uRSTbhe7T0hRsU9ZprOctGE473X
 dtAFNP/h0q1h/xF6ZUpPmrmLyj0mS7ywjEGbjztE=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:49 +0300
Message-Id: <20200412194859.12663-12-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 11/21] parisc: simplify detection of memory zone
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
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
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
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3BhcmlzYy9tbS9pbml0LmMgfCAyMiArKyst
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3BhcmlzYy9tbS9pbml0LmMgYi9hcmNoL3Bh
cmlzYy9tbS9pbml0LmMKaW5kZXggNTIyNGZiMzhkNzY2Li4wMmQyZmRiODVkY2MgMTAwNjQ0Ci0t
LSBhL2FyY2gvcGFyaXNjL21tL2luaXQuYworKysgYi9hcmNoL3BhcmlzYy9tbS9pbml0LmMKQEAg
LTY3NSwyNyArNjc1LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBnYXRld2F5X2luaXQodm9pZCkK
IAogc3RhdGljIHZvaWQgX19pbml0IHBhcmlzY19ib290bWVtX2ZyZWUodm9pZCkKIHsKLQl1bnNp
Z25lZCBsb25nIHpvbmVzX3NpemVbTUFYX05SX1pPTkVTXSA9IHsgMCwgfTsKLQl1bnNpZ25lZCBs
b25nIGhvbGVzX3NpemVbTUFYX05SX1pPTkVTXSA9IHsgMCwgfTsKLQl1bnNpZ25lZCBsb25nIG1l
bV9zdGFydF9wZm4gPSB+MFVMLCBtZW1fZW5kX3BmbiA9IDAsIG1lbV9zaXplX3BmbiA9IDA7Ci0J
aW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBpIDwgbnBtZW1fcmFuZ2VzOyBpKyspIHsKLQkJdW5zaWdu
ZWQgbG9uZyBzdGFydCA9IHBtZW1fcmFuZ2VzW2ldLnN0YXJ0X3BmbjsKLQkJdW5zaWduZWQgbG9u
ZyBzaXplID0gcG1lbV9yYW5nZXNbaV0ucGFnZXM7Ci0JCXVuc2lnbmVkIGxvbmcgZW5kID0gc3Rh
cnQgKyBzaXplOwotCi0JCWlmIChtZW1fc3RhcnRfcGZuID4gc3RhcnQpCi0JCQltZW1fc3RhcnRf
cGZuID0gc3RhcnQ7Ci0JCWlmIChtZW1fZW5kX3BmbiA8IGVuZCkKLQkJCW1lbV9lbmRfcGZuID0g
ZW5kOwotCQltZW1fc2l6ZV9wZm4gKz0gc2l6ZTsKLQl9CisJdW5zaWduZWQgbG9uZyBtYXhfem9u
ZV9wZm5bTUFYX05SX1pPTkVTXSA9IHsgMCwgfTsKIAotCXpvbmVzX3NpemVbMF0gPSBtZW1fZW5k
X3BmbiAtIG1lbV9zdGFydF9wZm47Ci0JaG9sZXNfc2l6ZVswXSA9IHpvbmVzX3NpemVbMF0gLSBt
ZW1fc2l6ZV9wZm47CisJbWF4X3pvbmVfcGZuWzBdID0gbWVtYmxvY2tfZW5kX29mX0RSQU0oKTsK
IAotCWZyZWVfYXJlYV9pbml0X25vZGUoMCwgem9uZXNfc2l6ZSwgbWVtX3N0YXJ0X3BmbiwgaG9s
ZXNfc2l6ZSk7CisJZnJlZV9hcmVhX2luaXQobWF4X3pvbmVfcGZuKTsKIH0KIAogdm9pZCBfX2lu
aXQgcGFnaW5nX2luaXQodm9pZCkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxp
c3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8v
b3BlbnJpc2MK

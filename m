Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 921091C05D1
	for <lists+openrisc@lfdr.de>; Thu, 30 Apr 2020 21:09:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 534AD20B19;
	Thu, 30 Apr 2020 21:09:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 7075420ABA
 for <openrisc@lists.librecores.org>; Wed, 29 Apr 2020 14:15:36 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C09542137B;
 Wed, 29 Apr 2020 12:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162535;
 bh=LAxAeuWhmBZs2K9yaH073vbAp8R2qgeI+W+wO+9G8t0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mRJwSXatxKQFkBy8CSkb9ErBmFMoezM1Cz7IOn9+HPsIp+U0M1DBw+r5J5mhB7KTs
 2NbzLoiEl9R/yPY1yZ17u5ssCWhUvwJnaJKzAz71lqjCATcSJZPv0gMhu58ikeyXHu
 L5BTx82i//4lIDwpLHNS9CTGD6W/rlnxTYnF+hMY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 Apr 2020 15:11:21 +0300
Message-Id: <20200429121126.17989-16-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 21:09:13 +0200
Subject: [OpenRISC] [PATCH v2 15/20] mm: memmap_init: iterate over memblock
 regions rather that check each PFN
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

RnJvbTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+CgpXaGVuIGNhbGxlZCBkdXJpbmcgYm9v
dCB0aGUgbWVtbWFwX2luaXRfem9uZSgpIGZ1bmN0aW9uIGNoZWNrcyBpZiBlYWNoIFBGTgppcyB2
YWxpZCBhbmQgYWN0dWFsbHkgYmVsb25ncyB0byB0aGUgbm9kZSBiZWluZyBpbml0aWFsaXplZCB1
c2luZwplYXJseV9wZm5fdmFsaWQoKSBhbmQgZWFybHlfcGZuX2luX25pZCgpLgoKRWFjaCBzdWNo
IGNoZWNrIG1heSBjb3N0IHVwIHRvIE8obG9nKG4pKSB3aGVyZSBuIGlzIHRoZSBudW1iZXIgb2Yg
bWVtb3J5CmJhbmtzLCBzbyBmb3IgbGFyZ2UgYW1vdW50IG9mIG1lbW9yeSBvdmVyYWxsIHRpbWUg
c3BlbnQgaW4gZWFybHlfcGZuKigpCmJlY29tZXMgc3Vic3RhbnRpYWwuCgpTaW5jZSB0aGUgaW5m
b3JtYXRpb24gaXMgYW55d2F5IHByZXNlbnQgaW4gbWVtYmxvY2ssIHdlIGNhbiBpdGVyYXRlIG92
ZXIKbWVtYmxvY2sgbWVtb3J5IHJlZ2lvbnMgaW4gbWVtbWFwX2luaXQoKSBhbmQgb25seSBjYWxs
IG1lbW1hcF9pbml0X3pvbmUoKQpmb3IgUEZOIHJhbmdlcyB0aGF0IGFyZSBrbm93IHRvIGJlIHZh
bGlkIGFuZCBpbiB0aGUgYXBwcm9wcmlhdGUgbm9kZS4KClNpZ25lZC1vZmYtYnk6IEJhb3F1YW4g
SGUgPGJoZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+Ci0tLQogbW0vcGFnZV9hbGxvYy5jIHwgNDcgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspLCAzMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9t
bS9wYWdlX2FsbG9jLmMKaW5kZXggN2Y2YTMwODFlZGI4Li44ZDExMmRlZmFlYWQgMTAwNjQ0Ci0t
LSBhL21tL3BhZ2VfYWxsb2MuYworKysgYi9tbS9wYWdlX2FsbG9jLmMKQEAgLTU5MzksMjMgKzU5
MzksNiBAQCBvdmVybGFwX21lbW1hcF9pbml0KHVuc2lnbmVkIGxvbmcgem9uZSwgdW5zaWduZWQg
bG9uZyAqcGZuKQogCXJldHVybiBmYWxzZTsKIH0KIAotI2lmZGVmIENPTkZJR19TUEFSU0VNRU0K
LS8qIFNraXAgUEZOcyB0aGF0IGJlbG9uZyB0byBub24tcHJlc2VudCBzZWN0aW9ucyAqLwotc3Rh
dGljIGlubGluZSBfX21lbWluaXQgdW5zaWduZWQgbG9uZyBuZXh0X3Bmbih1bnNpZ25lZCBsb25n
IHBmbikKLXsKLQljb25zdCB1bnNpZ25lZCBsb25nIHNlY3Rpb25fbnIgPSBwZm5fdG9fc2VjdGlv
bl9ucigrK3Bmbik7Ci0KLQlpZiAocHJlc2VudF9zZWN0aW9uX25yKHNlY3Rpb25fbnIpKQotCQly
ZXR1cm4gcGZuOwotCXJldHVybiBzZWN0aW9uX25yX3RvX3BmbihuZXh0X3ByZXNlbnRfc2VjdGlv
bl9ucihzZWN0aW9uX25yKSk7Ci19Ci0jZWxzZQotc3RhdGljIGlubGluZSBfX21lbWluaXQgdW5z
aWduZWQgbG9uZyBuZXh0X3Bmbih1bnNpZ25lZCBsb25nIHBmbikKLXsKLQlyZXR1cm4gcGZuKys7
Ci19Ci0jZW5kaWYKLQogLyoKICAqIEluaXRpYWxseSBhbGwgcGFnZXMgYXJlIHJlc2VydmVkIC0g
ZnJlZSBvbmVzIGFyZSBmcmVlZAogICogdXAgYnkgbWVtYmxvY2tfZnJlZV9hbGwoKSBvbmNlIHRo
ZSBlYXJseSBib290IHByb2Nlc3MgaXMKQEAgLTU5OTAsMTkgKzU5NzMsNyBAQCB2b2lkIF9fbWVt
aW5pdCBtZW1tYXBfaW5pdF96b25lKHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCwgdW5zaWdu
ZWQgbG9uZyB6b25lLAogI2VuZGlmCiAKIAlmb3IgKHBmbiA9IHN0YXJ0X3BmbjsgcGZuIDwgZW5k
X3BmbjsgKSB7Ci0JCS8qCi0JCSAqIFRoZXJlIGNhbiBiZSBob2xlcyBpbiBib290LXRpbWUgbWVt
X21hcFtdcyBoYW5kZWQgdG8gdGhpcwotCQkgKiBmdW5jdGlvbi4gIFRoZXkgZG8gbm90IGV4aXN0
IG9uIGhvdHBsdWdnZWQgbWVtb3J5LgotCQkgKi8KIAkJaWYgKGNvbnRleHQgPT0gTUVNTUFQX0VB
UkxZKSB7Ci0JCQlpZiAoIWVhcmx5X3Bmbl92YWxpZChwZm4pKSB7Ci0JCQkJcGZuID0gbmV4dF9w
Zm4ocGZuKTsKLQkJCQljb250aW51ZTsKLQkJCX0KLQkJCWlmICghZWFybHlfcGZuX2luX25pZChw
Zm4sIG5pZCkpIHsKLQkJCQlwZm4rKzsKLQkJCQljb250aW51ZTsKLQkJCX0KIAkJCWlmIChvdmVy
bGFwX21lbW1hcF9pbml0KHpvbmUsICZwZm4pKQogCQkJCWNvbnRpbnVlOwogCQkJaWYgKGRlZmVy
X2luaXQobmlkLCBwZm4sIGVuZF9wZm4pKQpAQCAtNjExOCw5ICs2MDg5LDIzIEBAIHN0YXRpYyB2
b2lkIF9fbWVtaW5pdCB6b25lX2luaXRfZnJlZV9saXN0cyhzdHJ1Y3Qgem9uZSAqem9uZSkKIH0K
IAogdm9pZCBfX21lbWluaXQgX193ZWFrIG1lbW1hcF9pbml0KHVuc2lnbmVkIGxvbmcgc2l6ZSwg
aW50IG5pZCwKLQkJCQkgIHVuc2lnbmVkIGxvbmcgem9uZSwgdW5zaWduZWQgbG9uZyBzdGFydF9w
Zm4pCisJCQkJICB1bnNpZ25lZCBsb25nIHpvbmUsCisJCQkJICB1bnNpZ25lZCBsb25nIHJhbmdl
X3N0YXJ0X3BmbikKIHsKLQltZW1tYXBfaW5pdF96b25lKHNpemUsIG5pZCwgem9uZSwgc3RhcnRf
cGZuLCBNRU1NQVBfRUFSTFksIE5VTEwpOworCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRf
cGZuOworCXVuc2lnbmVkIGxvbmcgcmFuZ2VfZW5kX3BmbiA9IHJhbmdlX3N0YXJ0X3BmbiArIHNp
emU7CisJaW50IGk7CisKKwlmb3JfZWFjaF9tZW1fcGZuX3JhbmdlKGksIG5pZCwgJnN0YXJ0X3Bm
biwgJmVuZF9wZm4sIE5VTEwpIHsKKwkJc3RhcnRfcGZuID0gY2xhbXAoc3RhcnRfcGZuLCByYW5n
ZV9zdGFydF9wZm4sIHJhbmdlX2VuZF9wZm4pOworCQllbmRfcGZuID0gY2xhbXAoZW5kX3Bmbiwg
cmFuZ2Vfc3RhcnRfcGZuLCByYW5nZV9lbmRfcGZuKTsKKworCQlpZiAoZW5kX3BmbiA+IHN0YXJ0
X3BmbikgeworCQkJc2l6ZSA9IGVuZF9wZm4gLSBzdGFydF9wZm47CisJCQltZW1tYXBfaW5pdF96
b25lKHNpemUsIG5pZCwgem9uZSwgc3RhcnRfcGZuLAorCQkJCQkgTUVNTUFQX0VBUkxZLCBOVUxM
KTsKKwkJfQorCX0KIH0KIAogc3RhdGljIGludCB6b25lX2JhdGNoc2l6ZShzdHJ1Y3Qgem9uZSAq
em9uZSkKLS0gCjIuMjYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMu
b3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E96231B20AA
	for <lists+openrisc@lfdr.de>; Tue, 21 Apr 2020 10:01:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9862820564;
	Tue, 21 Apr 2020 10:01:48 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id C696B20A40
 for <openrisc@lists.librecores.org>; Sun, 12 Apr 2020 21:53:01 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74DEF2082E;
 Sun, 12 Apr 2020 19:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721180;
 bh=JfG1Siyfl/JGxyNzE0ZLQzUhIkyLD5V0oBKSDMAbENY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h2BnsmPGm8Cfa+kc9o8EOpWn0BOw67teRHCCzEkMS26EarC59737FlnTapIdTxqRs
 Z9YlT+5wouIjTX+/tVSAr8/AiZFcWvYuR6+XoHgUrAI7qcRq7EA9dz2P0lWXUvqps7
 AwdXw0rVSj2ugoYT6SmhsdRc64B0sLh/VGd+jLmU=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 12 Apr 2020 22:48:53 +0300
Message-Id: <20200412194859.12663-16-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 10:01:35 +0200
Subject: [OpenRISC] [PATCH 15/21] mm: memmap_init: iterate over memblock
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
bnV4LmlibS5jb20+Ci0tLQogbW0vcGFnZV9hbGxvYy5jIHwgMjYgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKaW5kZXgg
N2Y2YTMwODFlZGI4Li5jNDNjZTg3MDk0NTcgMTAwNjQ0Ci0tLSBhL21tL3BhZ2VfYWxsb2MuYwor
KysgYi9tbS9wYWdlX2FsbG9jLmMKQEAgLTU5OTUsMTQgKzU5OTUsNiBAQCB2b2lkIF9fbWVtaW5p
dCBtZW1tYXBfaW5pdF96b25lKHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCwgdW5zaWduZWQg
bG9uZyB6b25lLAogCQkgKiBmdW5jdGlvbi4gIFRoZXkgZG8gbm90IGV4aXN0IG9uIGhvdHBsdWdn
ZWQgbWVtb3J5LgogCQkgKi8KIAkJaWYgKGNvbnRleHQgPT0gTUVNTUFQX0VBUkxZKSB7Ci0JCQlp
ZiAoIWVhcmx5X3Bmbl92YWxpZChwZm4pKSB7Ci0JCQkJcGZuID0gbmV4dF9wZm4ocGZuKTsKLQkJ
CQljb250aW51ZTsKLQkJCX0KLQkJCWlmICghZWFybHlfcGZuX2luX25pZChwZm4sIG5pZCkpIHsK
LQkJCQlwZm4rKzsKLQkJCQljb250aW51ZTsKLQkJCX0KIAkJCWlmIChvdmVybGFwX21lbW1hcF9p
bml0KHpvbmUsICZwZm4pKQogCQkJCWNvbnRpbnVlOwogCQkJaWYgKGRlZmVyX2luaXQobmlkLCBw
Zm4sIGVuZF9wZm4pKQpAQCAtNjExOCw5ICs2MTEwLDIzIEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5p
dCB6b25lX2luaXRfZnJlZV9saXN0cyhzdHJ1Y3Qgem9uZSAqem9uZSkKIH0KIAogdm9pZCBfX21l
bWluaXQgX193ZWFrIG1lbW1hcF9pbml0KHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCwKLQkJ
CQkgIHVuc2lnbmVkIGxvbmcgem9uZSwgdW5zaWduZWQgbG9uZyBzdGFydF9wZm4pCisJCQkJICB1
bnNpZ25lZCBsb25nIHpvbmUsCisJCQkJICB1bnNpZ25lZCBsb25nIHJhbmdlX3N0YXJ0X3BmbikK
IHsKLQltZW1tYXBfaW5pdF96b25lKHNpemUsIG5pZCwgem9uZSwgc3RhcnRfcGZuLCBNRU1NQVBf
RUFSTFksIE5VTEwpOworCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOworCXVuc2ln
bmVkIGxvbmcgcmFuZ2VfZW5kX3BmbiA9IHJhbmdlX3N0YXJ0X3BmbiArIHNpemU7CisJaW50IGk7
CisKKwlmb3JfZWFjaF9tZW1fcGZuX3JhbmdlKGksIG5pZCwgJnN0YXJ0X3BmbiwgJmVuZF9wZm4s
IE5VTEwpIHsKKwkJc3RhcnRfcGZuID0gY2xhbXAoc3RhcnRfcGZuLCByYW5nZV9zdGFydF9wZm4s
IHJhbmdlX2VuZF9wZm4pOworCQllbmRfcGZuID0gY2xhbXAoZW5kX3BmbiwgcmFuZ2Vfc3RhcnRf
cGZuLCByYW5nZV9lbmRfcGZuKTsKKworCQlpZiAoZW5kX3BmbiA+IHN0YXJ0X3BmbikgeworCQkJ
c2l6ZSA9IGVuZF9wZm4gLSBzdGFydF9wZm47CisJCQltZW1tYXBfaW5pdF96b25lKHNpemUsIG5p
ZCwgem9uZSwgc3RhcnRfcGZuLAorCQkJCQkgTUVNTUFQX0VBUkxZLCBOVUxMKTsKKwkJfQorCX0K
IH0KIAogc3RhdGljIGludCB6b25lX2JhdGNoc2l6ZShzdHJ1Y3Qgem9uZSAqem9uZSkKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

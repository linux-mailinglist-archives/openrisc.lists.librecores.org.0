Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 48B8E1E502C
	for <lists+openrisc@lfdr.de>; Wed, 27 May 2020 23:19:21 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0032A20CA5;
	Wed, 27 May 2020 23:19:20 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id EB90E20AA9
 for <openrisc@lists.librecores.org>; Thu, 14 May 2020 19:05:04 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D208206D8;
 Thu, 14 May 2020 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475903;
 bh=44XXBwqf7ZdJi139qXlwO51vvXhQ450CmPWvc64Elpk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cVcX2vcKsPsKDmMAS87dHuEJJ8eUvdSGajlPhYwFuiRJfueaw2+fisGXnor5syKhU
 9h3N5W4e4o2uV5ohsNoh5KyYV/kirPUl7kHdzkprgJKtt717KeE0Fo99VHdYAjovTc
 rK2nhnvnaVjaC2DT2klZJ/7NiWCQPaPFfNLpXbUg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 14 May 2020 20:03:20 +0300
Message-Id: <20200514170327.31389-6-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 23:18:58 +0200
Subject: [OpenRISC] [PATCH v2 05/12] m68k/mm/motorola: move comment about
 page table allocation funcitons
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
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-csky@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGNvbW1lbnQgYWJv
dXQgcGFnZSB0YWJsZSBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXNpZGVzIGluCmluY2x1ZGUvYXNt
L21vdG9yb2xhX3BndGFibGUuaCB3aGlsZSB0aGUgZnVuY3Rpb25zIGxpdmUgaW4KaW5jbHVkZS9h
c20vbW90b3JvbGFfcGdhbG9jLmguCgpNb3ZlIHRoZSBjb21tZW50IGNsb3NlIHRvIHRoZSBjb2Rl
LgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0K
IGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9tb3Rvcm9sYV9wZ2FsbG9jLmggfCA2ICsrKysrKwogYXJj
aC9tNjhrL2luY2x1ZGUvYXNtL21vdG9yb2xhX3BndGFibGUuaCB8IDYgLS0tLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL202OGsvaW5jbHVkZS9hc20vbW90b3JvbGFfcGdhbGxvYy5oIGIvYXJjaC9tNjhrL2luY2x1
ZGUvYXNtL21vdG9yb2xhX3BnYWxsb2MuaAppbmRleCBjNjZlNDI5MTc5MTIuLmYzY2I0NTNhMDdi
NyAxMDA2NDQKLS0tIGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21vdG9yb2xhX3BnYWxsb2MuaAor
KysgYi9hcmNoL202OGsvaW5jbHVkZS9hc20vbW90b3JvbGFfcGdhbGxvYy5oCkBAIC0xOCw2ICsx
OCwxMiBAQCBleHRlcm4gdm9pZCBpbml0X3BvaW50ZXJfdGFibGUodm9pZCAqdGFibGUsIGludCB0
eXBlKTsKIGV4dGVybiB2b2lkICpnZXRfcG9pbnRlcl90YWJsZShpbnQgdHlwZSk7CiBleHRlcm4g
aW50IGZyZWVfcG9pbnRlcl90YWJsZSh2b2lkICp0YWJsZSwgaW50IHR5cGUpOwogCisvKgorICog
QWxsb2NhdGUgYW5kIGZyZWUgcGFnZSB0YWJsZXMuIFRoZSB4eHhfa2VybmVsKCkgdmVyc2lvbnMg
YXJlCisgKiB1c2VkIHRvIGFsbG9jYXRlIGEga2VybmVsIHBhZ2UgdGFibGUgLSB0aGlzIHR1cm5z
IG9uIEFTTiBiaXRzCisgKiBpZiBhbnkuCisgKi8KKwogc3RhdGljIGlubGluZSBwdGVfdCAqcHRl
X2FsbG9jX29uZV9rZXJuZWwoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7CiAJcmV0dXJuIGdldF9w
b2ludGVyX3RhYmxlKFRBQkxFX1BURSk7CmRpZmYgLS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9h
c20vbW90b3JvbGFfcGd0YWJsZS5oIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL21vdG9yb2xhX3Bn
dGFibGUuaAppbmRleCA0OGYxOWYwYWIxZTcuLjllNWEzZGUyMWUxNSAxMDA2NDQKLS0tIGEvYXJj
aC9tNjhrL2luY2x1ZGUvYXNtL21vdG9yb2xhX3BndGFibGUuaAorKysgYi9hcmNoL202OGsvaW5j
bHVkZS9hc20vbW90b3JvbGFfcGd0YWJsZS5oCkBAIC0yMjcsMTIgKzIyNyw2IEBAIHN0YXRpYyBp
bmxpbmUgcHRlX3QgKnB0ZV9vZmZzZXRfa2VybmVsKHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25n
IGFkZHJlc3MpCiAjZGVmaW5lIHB0ZV9vZmZzZXRfbWFwKHBtZHAsYWRkcmVzcykgKChwdGVfdCAq
KV9fcG1kX3BhZ2UoKnBtZHApICsgKCgoYWRkcmVzcykgPj4gUEFHRV9TSElGVCkgJiAoUFRSU19Q
RVJfUFRFIC0gMSkpKQogI2RlZmluZSBwdGVfdW5tYXAocHRlKQkJKCh2b2lkKTApCiAKLS8qCi0g
KiBBbGxvY2F0ZSBhbmQgZnJlZSBwYWdlIHRhYmxlcy4gVGhlIHh4eF9rZXJuZWwoKSB2ZXJzaW9u
cyBhcmUKLSAqIHVzZWQgdG8gYWxsb2NhdGUgYSBrZXJuZWwgcGFnZSB0YWJsZSAtIHRoaXMgdHVy
bnMgb24gQVNOIGJpdHMKLSAqIGlmIGFueS4KLSAqLwotCiAvKiBQcmlvciB0byBjYWxsaW5nIHRo
ZXNlIHJvdXRpbmVzLCB0aGUgcGFnZSBzaG91bGQgaGF2ZSBiZWVuIGZsdXNoZWQKICAqIGZyb20g
Ym90aCB0aGUgY2FjaGUgYW5kIEFUQywgb3IgdGhlIENQVSBtaWdodCBub3Qgbm90aWNlIHRoYXQg
dGhlCiAgKiBjYWNoZSBzZXR0aW5nIGZvciB0aGUgcGFnZSBoYXMgYmVlbiBjaGFuZ2VkLiAtanNr
b3YKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3Jn
Cmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

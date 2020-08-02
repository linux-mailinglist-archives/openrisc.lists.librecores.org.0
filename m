Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id EA9142460D6
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:42 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id AE89920E9A;
	Mon, 17 Aug 2020 10:46:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id A958B20D78
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:38:39 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D797220759;
 Sun,  2 Aug 2020 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386318;
 bh=o8aZbB2pKDQsqUqKMBDH2F8svHn12mD34Nb+72y2BZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QgzlknYsb9NiWB8c/Yeh/cISQPrZRFom46AMdT7FrT79j0mzUH6ggsWMbDZWlX4P8
 UyQ3srMeb9iG6KtyQNKoy0bv4eQadT2brjYzvyX1yGh7qES1VdDGGb7RMSiDH9JBdG
 DZDhRIfp4FkpXhluwKfMBKUj7+OCDBbjLlDEZLbY=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:57 +0300
Message-Id: <20200802163601.8189-14-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: [OpenRISC] [PATCH v2 13/17] x86/setup: simplify initrd relocation
 and reservation
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKQ3VycmVudGx5LCBpbml0
cmQgaW1hZ2UgaXMgcmVzZXJ2ZWQgdmVyeSBlYXJseSBkdXJpbmcgc2V0dXAgYW5kIHRoZW4gaXQK
bWlnaHQgYmUgcmVsb2NhdGVkIGFuZCByZS1yZXNlcnZlZCBhZnRlciB0aGUgaW5pdGlhbCBwaHlz
aWNhbCBtZW1vcnkKbWFwcGluZyBpcyBjcmVhdGVkLiBUaGUgImxhdGUiIHJlc2VydmF0aW9uIG9m
IG1lbWJsb2NrIHZlcmlmaWVzIHRoYXQgbWFwcGVkCm1lbW9yeSBzaXplIGV4Y2VlZHMgdGhlIHNp
emUgb2YgaW5pdHJkLCB0aGUgY2hlY2tzIHdoZXRoZXIgdGhlIHJlbG9jYXRpb24KcmVxdWlyZWQg
YW5kLCBpZiB5ZXMsIHJlbG9jYXRlcyBpbmlydGQgdG8gYSBuZXcgbWVtb3J5IGFsbG9jYXRlZCBm
cm9tCm1lbWJsb2NrIGFuZCBmcmVlcyB0aGUgb2xkIGxvY2F0aW9uLgoKVGhlIGNoZWNrIGZvciBt
ZW1vcnkgc2l6ZSBpcyBleGNlc3NpdmUgYXMgbWVtYmxvY2sgYWxsb2NhdGlvbiB3aWxsIGFueXdh
eQpmYWlsIGlmIHRoZXJlIGlzIG5vdCBlbm91Z2ggbWVtb3J5LiBCZXNpZGVzLCB0aGVyZSBpcyBu
byBwb2ludCB0byBhbGxvY2F0ZQptZW1vcnkgZnJvbSBtZW1ibG9jayB1c2luZyBtZW1ibG9ja19m
aW5kX2luX3JhbmdlKCkgKyBtZW1ibG9ja19yZXNlcnZlKCkKd2hlbiB0aGVyZSBleGlzdHMgbWVt
YmxvY2tfcGh5c19hbGxvY19yYW5nZSgpIHdpdGggcmVxdWlyZWQgZnVuY3Rpb25hbGl0eS4KClJl
bW92ZSB0aGUgcmVkdW5kYW50IGNoZWNrIGFuZCBzaW1wbGlmeSBtZW1ibG9jayBhbGxvY2F0aW9u
LgoKU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0K
IGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jIHwgMTYgKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva2VybmVsL3NldHVwLmMgYi9hcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYwppbmRleCBhMzc2
N2U3NGM3NTguLmQ4ZGU0MDUzYzVlOCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL3NldHVw
LmMKKysrIGIvYXJjaC94ODYva2VybmVsL3NldHVwLmMKQEAgLTI2MiwxNiArMjYyLDEyIEBAIHN0
YXRpYyB2b2lkIF9faW5pdCByZWxvY2F0ZV9pbml0cmQodm9pZCkKIAl1NjQgYXJlYV9zaXplICAg
ICA9IFBBR0VfQUxJR04ocmFtZGlza19zaXplKTsKIAogCS8qIFdlIG5lZWQgdG8gbW92ZSB0aGUg
aW5pdHJkIGRvd24gaW50byBkaXJlY3RseSBtYXBwZWQgbWVtICovCi0JcmVsb2NhdGVkX3JhbWRp
c2sgPSBtZW1ibG9ja19maW5kX2luX3JhbmdlKDAsIFBGTl9QSFlTKG1heF9wZm5fbWFwcGVkKSwK
LQkJCQkJCSAgIGFyZWFfc2l6ZSwgUEFHRV9TSVpFKTsKLQorCXJlbG9jYXRlZF9yYW1kaXNrID0g
bWVtYmxvY2tfcGh5c19hbGxvY19yYW5nZShhcmVhX3NpemUsIFBBR0VfU0laRSwgMCwKKwkJCQkJ
CSAgICAgIFBGTl9QSFlTKG1heF9wZm5fbWFwcGVkKSk7CiAJaWYgKCFyZWxvY2F0ZWRfcmFtZGlz
aykKIAkJcGFuaWMoIkNhbm5vdCBmaW5kIHBsYWNlIGZvciBuZXcgUkFNRElTSyBvZiBzaXplICVs
bGRcbiIsCiAJCSAgICAgIHJhbWRpc2tfc2l6ZSk7CiAKLQkvKiBOb3RlOiB0aGlzIGluY2x1ZGVz
IGFsbCB0aGUgbWVtIGN1cnJlbnRseSBvY2N1cGllZCBieQotCSAgIHRoZSBpbml0cmQsIHdlIHJl
bHkgb24gdGhhdCBmYWN0IHRvIGtlZXAgdGhlIGRhdGEgaW50YWN0LiAqLwotCW1lbWJsb2NrX3Jl
c2VydmUocmVsb2NhdGVkX3JhbWRpc2ssIGFyZWFfc2l6ZSk7CiAJaW5pdHJkX3N0YXJ0ID0gcmVs
b2NhdGVkX3JhbWRpc2sgKyBQQUdFX09GRlNFVDsKIAlpbml0cmRfZW5kICAgPSBpbml0cmRfc3Rh
cnQgKyByYW1kaXNrX3NpemU7CiAJcHJpbnRrKEtFUk5fSU5GTyAiQWxsb2NhdGVkIG5ldyBSQU1E
SVNLOiBbbWVtICUjMDEwbGx4LSUjMDEwbGx4XVxuIiwKQEAgLTI5OCwxMyArMjk0LDEzIEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBlYXJseV9yZXNlcnZlX2luaXRyZCh2b2lkKQogCiAJbWVtYmxvY2tf
cmVzZXJ2ZShyYW1kaXNrX2ltYWdlLCByYW1kaXNrX2VuZCAtIHJhbWRpc2tfaW1hZ2UpOwogfQor
CiBzdGF0aWMgdm9pZCBfX2luaXQgcmVzZXJ2ZV9pbml0cmQodm9pZCkKIHsKIAkvKiBBc3N1bWUg
b25seSBlbmQgaXMgbm90IHBhZ2UgYWxpZ25lZCAqLwogCXU2NCByYW1kaXNrX2ltYWdlID0gZ2V0
X3JhbWRpc2tfaW1hZ2UoKTsKIAl1NjQgcmFtZGlza19zaXplICA9IGdldF9yYW1kaXNrX3NpemUo
KTsKIAl1NjQgcmFtZGlza19lbmQgICA9IFBBR0VfQUxJR04ocmFtZGlza19pbWFnZSArIHJhbWRp
c2tfc2l6ZSk7Ci0JdTY0IG1hcHBlZF9zaXplOwogCiAJaWYgKCFib290X3BhcmFtcy5oZHIudHlw
ZV9vZl9sb2FkZXIgfHwKIAkgICAgIXJhbWRpc2tfaW1hZ2UgfHwgIXJhbWRpc2tfc2l6ZSkKQEAg
LTMxMiwxMiArMzA4LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IHJlc2VydmVfaW5pdHJkKHZvaWQp
CiAKIAlpbml0cmRfc3RhcnQgPSAwOwogCi0JbWFwcGVkX3NpemUgPSBtZW1ibG9ja19tZW1fc2l6
ZShtYXhfcGZuX21hcHBlZCk7Ci0JaWYgKHJhbWRpc2tfc2l6ZSA+PSAobWFwcGVkX3NpemU+PjEp
KQotCQlwYW5pYygiaW5pdHJkIHRvbyBsYXJnZSB0byBoYW5kbGUsICIKLQkJICAgICAgICJkaXNh
YmxpbmcgaW5pdHJkICglbGxkIG5lZWRlZCwgJWxsZCBhdmFpbGFibGUpXG4iLAotCQkgICAgICAg
cmFtZGlza19zaXplLCBtYXBwZWRfc2l6ZT4+MSk7Ci0KIAlwcmludGsoS0VSTl9JTkZPICJSQU1E
SVNLOiBbbWVtICUjMDEwbGx4LSUjMDEwbGx4XVxuIiwgcmFtZGlza19pbWFnZSwKIAkJCXJhbWRp
c2tfZW5kIC0gMSk7CiAKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

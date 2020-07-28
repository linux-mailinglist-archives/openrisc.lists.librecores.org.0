Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C9F212460B4
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:13 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 59AE820DEA;
	Mon, 17 Aug 2020 10:46:13 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 3D03320CC9
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:14 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B649522B45;
 Tue, 28 Jul 2020 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913193;
 bh=w0NUYCkRPztxWdauIZ7iYp1zOp1jLcG8AD5t4PqIxsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YAjIiROU+83p25BDNEgIN9KISlKJXThut30Rs4cNno1O6shiBCHaHk29LQKLS7Ax5
 Ejyf6BAz+viwYwWWCNj69uR3Ffj9ovcm+78DaXms94OZuxA4yw2XiA7huGDx/Xn9eG
 FxVpJAd03+F3yNWhAm0fZShWCJUQp1/pDjBxfrnc=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:44 +0300
Message-Id: <20200728051153.1590-7-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Christoph Hellwig <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKZmFkdW1wX3Jlc2VydmVf
Y3Jhc2hfYXJlYSgpIHJlc2VydmVzIG1lbW9yeSBmcm9tIGEgc3BlY2lmaWVkIGJhc2UgYWRkcmVz
cwp0aWxsIHRoZSBlbmQgb2YgdGhlIFJBTS4KClJlcGxhY2UgaXRlcmF0aW9uIHRocm91Z2ggdGhl
IG1lbWJsb2NrLm1lbW9yeSB3aXRoIGEgc2luZ2xlIGNhbGwgdG8KbWVtYmxvY2tfcmVzZXJ2ZSgp
IHdpdGggYXBwcm9wcmlhdGUgIHRoYXQgd2lsbCB0YWtlIGNhcmUgb2YgcHJvcGVyIG1lbW9yeQpy
ZXNlcnZhdGlvbi4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJt
LmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jIHwgMjAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvZmFkdW1wLmMKaW5kZXggNzhhYjlhNmVlNmFjLi4yNDQ2YTYxZTNjMjUgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZmFkdW1wLmMKKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9mYWR1bXAuYwpAQCAtMTY1OCwyNSArMTY1OCw3IEBAIGludCBfX2luaXQgZmFkdW1wX3Jl
c2VydmVfbWVtKHZvaWQpCiAvKiBQcmVzZXJ2ZSBldmVyeXRoaW5nIGFib3ZlIHRoZSBiYXNlIGFk
ZHJlc3MgKi8KIHN0YXRpYyB2b2lkIF9faW5pdCBmYWR1bXBfcmVzZXJ2ZV9jcmFzaF9hcmVhKHU2
NCBiYXNlKQogewotCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsKLQl1NjQgbXN0YXJ0LCBt
c2l6ZTsKLQotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7Ci0JCW1zdGFydCA9IHJl
Zy0+YmFzZTsKLQkJbXNpemUgID0gcmVnLT5zaXplOwotCi0JCWlmICgobXN0YXJ0ICsgbXNpemUp
IDwgYmFzZSkKLQkJCWNvbnRpbnVlOwotCi0JCWlmIChtc3RhcnQgPCBiYXNlKSB7Ci0JCQltc2l6
ZSAtPSAoYmFzZSAtIG1zdGFydCk7Ci0JCQltc3RhcnQgPSBiYXNlOwotCQl9Ci0KLQkJcHJfaW5m
bygiUmVzZXJ2aW5nICVsbHVNQiBvZiBtZW1vcnkgYXQgJSMwMTZsbHggZm9yIHByZXNlcnZpbmcg
Y3Jhc2ggZGF0YSIsCi0JCQkobXNpemUgPj4gMjApLCBtc3RhcnQpOwotCQltZW1ibG9ja19yZXNl
cnZlKG1zdGFydCwgbXNpemUpOwotCX0KKwltZW1ibG9ja19yZXNlcnZlKGJhc2UsIG1lbWJsb2Nr
X2VuZF9vZl9EUkFNKCkgLSBiYXNlKTsKIH0KIAogdW5zaWduZWQgbG9uZyBfX2luaXQgYXJjaF9y
ZXNlcnZlZF9rZXJuZWxfcGFnZXModm9pZCkKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

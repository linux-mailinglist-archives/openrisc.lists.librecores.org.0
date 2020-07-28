Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8822460AF
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 9CEC220CF1;
	Mon, 17 Aug 2020 10:46:05 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id CE6D920CA0
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:12:24 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5790E22B3F;
 Tue, 28 Jul 2020 05:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913143;
 bh=4WuJOQlNfEjZEgWh7mIgx+GQ0z3C84AGorDeAuZhOK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D4u/UIbzLlEIUGvsu7oIEk1r9y1HdyXe4bGFS4uPFFZlE1SvR0Ic/VsazPLkmlfYo
 MGSySQinsMEKx0a460QO0p336yu3q4NZYJLjS2vVr0K3k0pnoZ2v/GrKkVnCKHf3ZV
 mwea1G2DA7ZiDVovETmAVBrYbEJIl1dz6OHL4Gts=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:39 +0300
Message-Id: <20200728051153.1590-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 01/15] KVM: PPC: Book3S HV: simplify
 kvm_cma_reserve()
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG1lbW9yeSBzaXpl
IGNhbGN1bGF0aW9uIGluIGt2bV9jbWFfcmVzZXJ2ZSgpIHRyYXZlcnNlcyBtZW1ibG9jay5tZW1v
cnkKcmF0aGVyIHRoYW4gc2ltcGx5IGNhbGwgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSgpLiBUaGUg
Y29tbWVudCBpbiB0aGF0CmZ1bmN0aW9uIHN1Z2dlc3RzIHRoYXQgYXQgc29tZSBwb2ludCB0aGVy
ZSBzaG91bGQgaGF2ZSBiZWVuIGNhbGwgdG8KbWVtYmxvY2tfYW5hbHl6ZSgpIGJlZm9yZSBtZW1i
bG9ja19waHlzX21lbV9zaXplKCkgY291bGQgYmUgdXNlZC4KQXMgb2Ygbm93LCB0aGVyZSBpcyBu
byBtZW1ibG9ja19hbmFseXplKCkgYXQgYWxsIGFuZAptZW1ibG9ja19waHlzX21lbV9zaXplKCkg
Y2FuIGJlIHVzZWQgYXMgc29vbiBhcyBjb2xkLXBsdWcgbWVtb3J5IGlzCnJlZ2lzdGVyZCB3aXRo
IG1lbWJsb2NrLgoKUmVwbGFjZSBsb29wIG92ZXIgbWVtYmxvY2subWVtb3J5IHdpdGggYSBjYWxs
IHRvIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKS4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3Bv
cnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9i
dWlsdGluLmMgfCAxMSArKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19o
dl9idWlsdGluLmMgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9idWlsdGluLmMKaW5kZXgg
N2NkM2NmM2QzNjZiLi41NmFiMGQyOGRlMmEgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0v
Ym9vazNzX2h2X2J1aWx0aW4uYworKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19odl9idWls
dGluLmMKQEAgLTk1LDIyICs5NSwxNSBAQCBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZnJlZV9ocHRf
Y21hKTsKIHZvaWQgX19pbml0IGt2bV9jbWFfcmVzZXJ2ZSh2b2lkKQogewogCXVuc2lnbmVkIGxv
bmcgYWxpZ25fc2l6ZTsKLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7Ci0JcGh5c19hZGRy
X3Qgc2VsZWN0ZWRfc2l6ZSA9IDA7CisJcGh5c19hZGRyX3Qgc2VsZWN0ZWRfc2l6ZTsKIAogCS8q
CiAJICogV2UgbmVlZCBDTUEgcmVzZXJ2YXRpb24gb25seSB3aGVuIHdlIGFyZSBpbiBIViBtb2Rl
CiAJICovCiAJaWYgKCFjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9IVk1PREUpKQogCQlyZXR1cm47
Ci0JLyoKLQkgKiBXZSBjYW5ub3QgdXNlIG1lbWJsb2NrX3BoeXNfbWVtX3NpemUoKSBoZXJlLCBi
ZWNhdXNlCi0JICogbWVtYmxvY2tfYW5hbHl6ZSgpIGhhcyBub3QgYmVlbiBjYWxsZWQgeWV0Lgot
CSAqLwotCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKQotCQlzZWxlY3RlZF9zaXplICs9
IG1lbWJsb2NrX3JlZ2lvbl9tZW1vcnlfZW5kX3BmbihyZWcpIC0KLQkJCQkgbWVtYmxvY2tfcmVn
aW9uX21lbW9yeV9iYXNlX3BmbihyZWcpOwogCisJc2VsZWN0ZWRfc2l6ZSA9IFBIWVNfUEZOKG1l
bWJsb2NrX3BoeXNfbWVtX3NpemUoKSk7CiAJc2VsZWN0ZWRfc2l6ZSA9IChzZWxlY3RlZF9zaXpl
ICoga3ZtX2NtYV9yZXN2X3JhdGlvIC8gMTAwKSA8PCBQQUdFX1NISUZUOwogCWlmIChzZWxlY3Rl
ZF9zaXplKSB7CiAJCXByX2RlYnVnKCIlczogcmVzZXJ2aW5nICVsZCBNaUIgZm9yIGdsb2JhbCBh
cmVhXG4iLCBfX2Z1bmNfXywKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

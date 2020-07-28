Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 70BCF2460B6
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:15 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 1EDA520D96;
	Mon, 17 Aug 2020 10:46:15 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id DB10E20CD1
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:33 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 626FD21D95;
 Tue, 28 Jul 2020 05:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913212;
 bh=HXplIo2+gHV+5Rh8qlUVMl6HMHdXi6PCG7vTxqabI+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BIqPSBvjTdf4uuqv4MKH2hwzpl2XAGh4bPniDdkdx6FTrspJLz2LKCyaDcKO9wB4N
 IIrpPqlGIFPqWgrRE4nVY4ePSA6qQhEOkMtLDDcy7nB1Uj1EGyg1Fn9e6n9om1ZFOc
 Zpsz0c0dsztYiTDKK1XWk2S+W/uNLAwFNqNHrQrw=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:46 +0300
Message-Id: <20200728051153.1590-9-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 08/15] mircoblaze: drop unneeded NUMA and
 sparsemem initializations
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKbWljcm9ibGF6ZSBkb2Vz
IG5vdCBzdXBwb3J0IG5laXRoZXIgTlVNQSBub3QgU1BBUlNNRU0sIHNvIHRoZXJlIGlzIG5vIHBv
aW50CnRvIGNhbGwgbWVtYmxvY2tfc2V0X25vZGUoKSBhbmQgc3BhcnNlX21lbW9yeV9wcmVzZW50
X3dpdGhfYWN0aXZlX3JlZ2lvbnMoKQpmdW5jdGlvbnMgZHVyaW5nIG1pY3JvYmxhemUgbWVtb3J5
IGluaXRpYWxpemF0aW9uLgoKUmVtb3ZlIHRoZXNlIGNhbGxzIGFuZCB0aGUgc3Vycm91bmRpbmcg
Y29kZS4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
LS0tCiBhcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC9taWNyb2JsYXplL21tL2luaXQuYyBiL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMK
aW5kZXggNTIxYjU5YmE3MTZjLi40OWUwYzI0MWY5YjEgMTAwNjQ0Ci0tLSBhL2FyY2gvbWljcm9i
bGF6ZS9tbS9pbml0LmMKKysrIGIvYXJjaC9taWNyb2JsYXplL21tL2luaXQuYwpAQCAtMTA1LDkg
KzEwNSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogCiB2b2lkIF9f
aW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIHsKLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7
Ci0KICNpZm5kZWYgQ09ORklHX01NVQorCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsKIAl1
MzIga2VybmVsX2FsaWduX3N0YXJ0LCBrZXJuZWxfYWxpZ25fc2l6ZTsKIAogCS8qIEZpbmQgbWFp
biBtZW1vcnkgd2hlcmUgaXMgdGhlIGtlcm5lbCAqLwpAQCAtMTYxLDIwICsxNjAsNiBAQCB2b2lk
IF9faW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAlwcl9pbmZvKCIlczogbWF4X2xvd19wZm46ICUj
bHhcbiIsIF9fZnVuY19fLCBtYXhfbG93X3Bmbik7CiAJcHJfaW5mbygiJXM6IG1heF9wZm46ICUj
bHhcbiIsIF9fZnVuY19fLCBtYXhfcGZuKTsKIAotCS8qIEFkZCBhY3RpdmUgcmVnaW9ucyB3aXRo
IHZhbGlkIFBGTnMgKi8KLQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewotCQl1bnNp
Z25lZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKLQotCQlzdGFydF9wZm4gPSBtZW1ibG9ja19y
ZWdpb25fbWVtb3J5X2Jhc2VfcGZuKHJlZyk7Ci0JCWVuZF9wZm4gPSBtZW1ibG9ja19yZWdpb25f
bWVtb3J5X2VuZF9wZm4ocmVnKTsKLQkJbWVtYmxvY2tfc2V0X25vZGUoc3RhcnRfcGZuIDw8IFBB
R0VfU0hJRlQsCi0JCQkJICAoZW5kX3BmbiAtIHN0YXJ0X3BmbikgPDwgUEFHRV9TSElGVCwKLQkJ
CQkgICZtZW1ibG9jay5tZW1vcnksIDApOwotCX0KLQotCS8qIFhYWCBuZWVkIHRvIGNsaXAgdGhp
cyBpZiB1c2luZyBoaWdobWVtPyAqLwotCXNwYXJzZV9tZW1vcnlfcHJlc2VudF93aXRoX2FjdGl2
ZV9yZWdpb25zKDApOwotCiAJcGFnaW5nX2luaXQoKTsKIH0KIAotLSAKMi4yNi4yCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5n
IGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNv
cmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

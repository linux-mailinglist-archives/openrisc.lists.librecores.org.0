Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2732499B9
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:49 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 0D9A120D78;
	Wed, 19 Aug 2020 11:55:46 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 130BE20CBE
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:18:07 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF0552080C;
 Tue, 18 Aug 2020 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763885;
 bh=PDSdSqs6s6DgqNLhBcuuvT25sUGk4T0hXtDSJGfBsrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZRkPL5UtoYHI6d9QOQmC27otNdwTpYVIzy2mBxFcsar+pfVbZMUNsByEvMFu5/lVq
 +/Teqoicmnsf77QsGmS6VSFHXMzDm2mnzA2PZaZ0ObJqLAuZt9daTQWOXKbk2AsBNG
 rNswnU4dZW5M9JzlkIhRuIWROvJSpn3VRcFUWPxU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:24 +0300
Message-Id: <20200818151634.14343-8-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 07/17] mircoblaze: drop unneeded NUMA and
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
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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
LS0tCiBhcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jIHwgMTQgKy0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9taWNyb2JsYXplL21tL2luaXQuYyBiL2FyY2gvbWljcm9ibGF6ZS9tbS9pbml0LmMKaW5k
ZXggMDg4MGEwMDM1NzNkLi40OWUwYzI0MWY5YjEgMTAwNjQ0Ci0tLSBhL2FyY2gvbWljcm9ibGF6
ZS9tbS9pbml0LmMKKysrIGIvYXJjaC9taWNyb2JsYXplL21tL2luaXQuYwpAQCAtMTA1LDkgKzEw
NSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwYWdpbmdfaW5pdCh2b2lkKQogCiB2b2lkIF9faW5p
dCBzZXR1cF9tZW1vcnkodm9pZCkKIHsKLQlzdHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7Ci0K
ICNpZm5kZWYgQ09ORklHX01NVQorCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsKIAl1MzIg
a2VybmVsX2FsaWduX3N0YXJ0LCBrZXJuZWxfYWxpZ25fc2l6ZTsKIAogCS8qIEZpbmQgbWFpbiBt
ZW1vcnkgd2hlcmUgaXMgdGhlIGtlcm5lbCAqLwpAQCAtMTYxLDE3ICsxNjAsNiBAQCB2b2lkIF9f
aW5pdCBzZXR1cF9tZW1vcnkodm9pZCkKIAlwcl9pbmZvKCIlczogbWF4X2xvd19wZm46ICUjbHhc
biIsIF9fZnVuY19fLCBtYXhfbG93X3Bmbik7CiAJcHJfaW5mbygiJXM6IG1heF9wZm46ICUjbHhc
biIsIF9fZnVuY19fLCBtYXhfcGZuKTsKIAotCS8qIEFkZCBhY3RpdmUgcmVnaW9ucyB3aXRoIHZh
bGlkIFBGTnMgKi8KLQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewotCQl1bnNpZ25l
ZCBsb25nIHN0YXJ0X3BmbiwgZW5kX3BmbjsKLQotCQlzdGFydF9wZm4gPSBtZW1ibG9ja19yZWdp
b25fbWVtb3J5X2Jhc2VfcGZuKHJlZyk7Ci0JCWVuZF9wZm4gPSBtZW1ibG9ja19yZWdpb25fbWVt
b3J5X2VuZF9wZm4ocmVnKTsKLQkJbWVtYmxvY2tfc2V0X25vZGUoc3RhcnRfcGZuIDw8IFBBR0Vf
U0hJRlQsCi0JCQkJICAoZW5kX3BmbiAtIHN0YXJ0X3BmbikgPDwgUEFHRV9TSElGVCwKLQkJCQkg
ICZtZW1ibG9jay5tZW1vcnksIDApOwotCX0KLQogCXBhZ2luZ19pbml0KCk7CiB9CiAKLS0gCjIu
MjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3Bl
blJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8v
bGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

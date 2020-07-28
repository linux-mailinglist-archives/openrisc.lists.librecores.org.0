Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id B82E42460B5
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:14 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 70F6320E32;
	Mon, 17 Aug 2020 10:46:14 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 11A6920CD0
 for <openrisc@lists.librecores.org>; Tue, 28 Jul 2020 07:13:24 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DAC422B4B;
 Tue, 28 Jul 2020 05:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595913202;
 bh=VFCNoINiV/6S6XOOU0JrFdtc5FxR22TwcA9ornig1+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lm11f6W8H5Kt1f4GF53UuB9StgNeXXYMOzCHMtSc6ip+HxivUfHkIzQp4H7kbBfiQ
 R4w5HP/auPjqJ3VOOs7h6yurNCYT5/NX/RKpovw7T59wzfCV3lZd8arOEtF2QHEPMO
 EVQjpZ2a9wkqFdb/sI6Zv2AmZmV/w/5C6sQ4Yc28=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 28 Jul 2020 08:11:45 +0300
Message-Id: <20200728051153.1590-8-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200728051153.1590-1-rppt@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:37 +0200
Subject: [OpenRISC] [PATCH 07/15] riscv: drop unneeded node initialization
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKUklTQy1WIGRvZXMgbm90
ICh5ZXQpIHN1cHBvcnQgTlVNQSAgYW5kIGZvciBVTUEgYXJjaGl0ZWN0dXJlcyBub2RlIDAgaXMK
dXNlZCBpbXBsaWNpdGx5IGR1cmluZyBlYXJseSBtZW1vcnkgaW5pdGlhbGl6YXRpb24uCgpUaGVy
ZSBpcyBubyBuZWVkIHRvIGNhbGwgbWVtYmxvY2tfc2V0X25vZGUoKSwgcmVtb3ZlIHRoaXMgY2Fs
bCBhbmQgdGhlCnN1cnJvdW5kaW5nIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0
IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgfCA5IC0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRleCA3OWU5ZDU1YmRmMWEu
Ljc0NDBiYTJjZGFhYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKQEAgLTE5MSwxNSArMTkxLDYgQEAgdm9pZCBfX2luaXQgc2V0dXBf
Ym9vdG1lbSh2b2lkKQogCWVhcmx5X2luaXRfZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCk7CiAJbWVt
YmxvY2tfYWxsb3dfcmVzaXplKCk7CiAJbWVtYmxvY2tfZHVtcF9hbGwoKTsKLQotCWZvcl9lYWNo
X21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7Ci0JCXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuID0gbWVt
YmxvY2tfcmVnaW9uX21lbW9yeV9iYXNlX3BmbihyZWcpOwotCQl1bnNpZ25lZCBsb25nIGVuZF9w
Zm4gPSBtZW1ibG9ja19yZWdpb25fbWVtb3J5X2VuZF9wZm4ocmVnKTsKLQotCQltZW1ibG9ja19z
ZXRfbm9kZShQRk5fUEhZUyhzdGFydF9wZm4pLAotCQkJCSAgUEZOX1BIWVMoZW5kX3BmbiAtIHN0
YXJ0X3BmbiksCi0JCQkJICAmbWVtYmxvY2subWVtb3J5LCAwKTsKLQl9CiB9CiAKICNpZmRlZiBD
T05GSUdfTU1VCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNv
cmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

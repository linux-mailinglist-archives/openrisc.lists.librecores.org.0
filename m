Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6D82499C1
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:56 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 7338320CC8;
	Wed, 19 Aug 2020 11:55:56 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 74CF420CD1
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:19:34 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF31B2054F;
 Tue, 18 Aug 2020 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763973;
 bh=nhrWEJg18dZtklhN7elITeRIszP29EpKC+P0m7RisCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jJdwwbdMEM6WFAxnKmzqjftNGL5aHnZ8HFdP0bLUoJbwkV7KT+64vmwzgPr/3gM4H
 L3TcgqCT4iWq+77Eas6CHdNnad16CnUdskrAErKRn7QQ+AYSaIk8S8xA3vFVYoMH1A
 qr6QBNG6c3Pm5z2O3XmrN6YvTl5W+Qn4hIl1KgsI=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:32 +0300
Message-Id: <20200818151634.14343-16-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 15/17] memblock: remove unused
 memblock_mem_size()
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG9ubHkgdXNlciBv
ZiBtZW1ibG9ja19tZW1fc2l6ZSgpIHdhcyB4ODYgc2V0dXAgY29kZSwgaXQgaXMgZ29uZSBub3cg
YW5kCm1lbWJsb2NrX21lbV9zaXplKCkgZnVuY2l0b24gY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+ClJldmlld2VkLWJ5OiBC
YW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgg
fCAgMSAtCiBtbS9tZW1ibG9jay5jICAgICAgICAgICAgfCAxNSAtLS0tLS0tLS0tLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tZW1ibG9jay5oIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCmluZGV4IDI3YzNiODRkMTYx
NS4uMTVlZDExOTcwMWMxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21lbWJsb2NrLmgKKysr
IGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCkBAIC00ODEsNyArNDgxLDYgQEAgc3RhdGljIGlu
bGluZSBib29sIG1lbWJsb2NrX2JvdHRvbV91cCh2b2lkKQogCiBwaHlzX2FkZHJfdCBtZW1ibG9j
a19waHlzX21lbV9zaXplKHZvaWQpOwogcGh5c19hZGRyX3QgbWVtYmxvY2tfcmVzZXJ2ZWRfc2l6
ZSh2b2lkKTsKLXBoeXNfYWRkcl90IG1lbWJsb2NrX21lbV9zaXplKHVuc2lnbmVkIGxvbmcgbGlt
aXRfcGZuKTsKIHBoeXNfYWRkcl90IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0odm9pZCk7CiBwaHlz
X2FkZHJfdCBtZW1ibG9ja19lbmRfb2ZfRFJBTSh2b2lkKTsKIHZvaWQgbWVtYmxvY2tfZW5mb3Jj
ZV9tZW1vcnlfbGltaXQocGh5c19hZGRyX3QgbWVtb3J5X2xpbWl0KTsKZGlmZiAtLWdpdCBhL21t
L21lbWJsb2NrLmMgYi9tbS9tZW1ibG9jay5jCmluZGV4IDU2N2U0NTRjZTBhMS4uZWI0Zjg2NmJl
YTM0IDEwMDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTE2
NTcsMjEgKzE2NTcsNiBAQCBwaHlzX2FkZHJfdCBfX2luaXRfbWVtYmxvY2sgbWVtYmxvY2tfcmVz
ZXJ2ZWRfc2l6ZSh2b2lkKQogCXJldHVybiBtZW1ibG9jay5yZXNlcnZlZC50b3RhbF9zaXplOwog
fQogCi1waHlzX2FkZHJfdCBfX2luaXQgbWVtYmxvY2tfbWVtX3NpemUodW5zaWduZWQgbG9uZyBs
aW1pdF9wZm4pCi17Ci0JdW5zaWduZWQgbG9uZyBwYWdlcyA9IDA7Ci0JdW5zaWduZWQgbG9uZyBz
dGFydF9wZm4sIGVuZF9wZm47Ci0JaW50IGk7Ci0KLQlmb3JfZWFjaF9tZW1fcGZuX3JhbmdlKGks
IE1BWF9OVU1OT0RFUywgJnN0YXJ0X3BmbiwgJmVuZF9wZm4sIE5VTEwpIHsKLQkJc3RhcnRfcGZu
ID0gbWluX3QodW5zaWduZWQgbG9uZywgc3RhcnRfcGZuLCBsaW1pdF9wZm4pOwotCQllbmRfcGZu
ID0gbWluX3QodW5zaWduZWQgbG9uZywgZW5kX3BmbiwgbGltaXRfcGZuKTsKLQkJcGFnZXMgKz0g
ZW5kX3BmbiAtIHN0YXJ0X3BmbjsKLQl9Ci0KLQlyZXR1cm4gUEZOX1BIWVMocGFnZXMpOwotfQot
CiAvKiBsb3dlc3QgYWRkcmVzcyAqLwogcGh5c19hZGRyX3QgX19pbml0X21lbWJsb2NrIG1lbWJs
b2NrX3N0YXJ0X29mX0RSQU0odm9pZCkKIHsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5S
SVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlz
dGluZm8vb3BlbnJpc2MK

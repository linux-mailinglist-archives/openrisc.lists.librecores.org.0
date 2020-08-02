Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9B22460D8
	for <lists+openrisc@lfdr.de>; Mon, 17 Aug 2020 10:46:44 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 443A120EA8;
	Mon, 17 Aug 2020 10:46:44 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 441DB20D7B
 for <openrisc@lists.librecores.org>; Sun,  2 Aug 2020 18:39:01 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF63120738;
 Sun,  2 Aug 2020 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386340;
 bh=/OapfRuI75SY/XdIQJESU3T6prS3l8+u9aaoW6/2fF4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U3pdMYelKFOYAPi4XqQuIPvi0oETEzFpuTA29Gb8dtkzX+ka0NaEUYH0C58LpdHB/
 wG3l284DStkVX5uTLvsOI+c/bAeW0eVhwoTZFrdlFwTetpqjSk7bfexzerRwzS3cCG
 Cub8e8SRt2PAoFugs0sntHlR7cv3T4VybvnORg3k=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  2 Aug 2020 19:35:59 +0300
Message-Id: <20200802163601.8189-16-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 10:45:38 +0200
Subject: [OpenRISC] [PATCH v2 15/17] memblock: remove unused
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
 Hari Bathini <hbathini@linux.ibm.com>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIG9ubHkgdXNlciBv
ZiBtZW1ibG9ja19tZW1fc2l6ZSgpIHdhcyB4ODYgc2V0dXAgY29kZSwgaXQgaXMgZ29uZSBub3cg
YW5kCm1lbWJsb2NrX21lbV9zaXplKCkgZnVuY2l0b24gY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogaW5jbHVkZS9s
aW51eC9tZW1ibG9jay5oIHwgIDEgLQogbW0vbWVtYmxvY2suYyAgICAgICAgICAgIHwgMTUgLS0t
LS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaCBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaApp
bmRleCBkNzBjMjgzNWU5MTMuLmVjMmZkOGYzMmExOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9tZW1ibG9jay5oCisrKyBiL2luY2x1ZGUvbGludXgvbWVtYmxvY2suaApAQCAtNDUwLDcgKzQ1
MCw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBtZW1ibG9ja19ib3R0b21fdXAodm9pZCkKIAogcGh5
c19hZGRyX3QgbWVtYmxvY2tfcGh5c19tZW1fc2l6ZSh2b2lkKTsKIHBoeXNfYWRkcl90IG1lbWJs
b2NrX3Jlc2VydmVkX3NpemUodm9pZCk7Ci1waHlzX2FkZHJfdCBtZW1ibG9ja19tZW1fc2l6ZSh1
bnNpZ25lZCBsb25nIGxpbWl0X3Bmbik7CiBwaHlzX2FkZHJfdCBtZW1ibG9ja19zdGFydF9vZl9E
UkFNKHZvaWQpOwogcGh5c19hZGRyX3QgbWVtYmxvY2tfZW5kX29mX0RSQU0odm9pZCk7CiB2b2lk
IG1lbWJsb2NrX2VuZm9yY2VfbWVtb3J5X2xpbWl0KHBoeXNfYWRkcl90IG1lbW9yeV9saW1pdCk7
CmRpZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCBjMWE0Yzg3
OTg5NzMuLjQ4ZDYxNDM1MmIyNSAxMDA2NDQKLS0tIGEvbW0vbWVtYmxvY2suYworKysgYi9tbS9t
ZW1ibG9jay5jCkBAIC0xNjU2LDIxICsxNjU2LDYgQEAgcGh5c19hZGRyX3QgX19pbml0X21lbWJs
b2NrIG1lbWJsb2NrX3Jlc2VydmVkX3NpemUodm9pZCkKIAlyZXR1cm4gbWVtYmxvY2sucmVzZXJ2
ZWQudG90YWxfc2l6ZTsKIH0KIAotcGh5c19hZGRyX3QgX19pbml0IG1lbWJsb2NrX21lbV9zaXpl
KHVuc2lnbmVkIGxvbmcgbGltaXRfcGZuKQotewotCXVuc2lnbmVkIGxvbmcgcGFnZXMgPSAwOwot
CXVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCBlbmRfcGZuOwotCWludCBpOwotCi0JZm9yX2VhY2hf
bWVtX3Bmbl9yYW5nZShpLCBNQVhfTlVNTk9ERVMsICZzdGFydF9wZm4sICZlbmRfcGZuLCBOVUxM
KSB7Ci0JCXN0YXJ0X3BmbiA9IG1pbl90KHVuc2lnbmVkIGxvbmcsIHN0YXJ0X3BmbiwgbGltaXRf
cGZuKTsKLQkJZW5kX3BmbiA9IG1pbl90KHVuc2lnbmVkIGxvbmcsIGVuZF9wZm4sIGxpbWl0X3Bm
bik7Ci0JCXBhZ2VzICs9IGVuZF9wZm4gLSBzdGFydF9wZm47Ci0JfQotCi0JcmV0dXJuIFBGTl9Q
SFlTKHBhZ2VzKTsKLX0KLQogLyogbG93ZXN0IGFkZHJlc3MgKi8KIHBoeXNfYWRkcl90IF9faW5p
dF9tZW1ibG9jayBtZW1ibG9ja19zdGFydF9vZl9EUkFNKHZvaWQpCiB7Ci0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

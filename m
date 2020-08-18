Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4619B2499B7
	for <lists+openrisc@lfdr.de>; Wed, 19 Aug 2020 11:55:48 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D474A20D85;
	Wed, 19 Aug 2020 11:55:44 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id BE11520CB9
 for <openrisc@lists.librecores.org>; Tue, 18 Aug 2020 17:17:44 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB9C120829;
 Tue, 18 Aug 2020 15:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763863;
 bh=ZYR3GBWOTbbLeEGoi1OsOkKb8CEKMyuyBWdLENWnJ1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m1XiJCmbrGx1o925QNv8c/Bp6H5XPTpfeJ1QGf/lnbyqfmruYKi1v8ifq7YUyQIAR
 mOZ35o8Tc86vDo4Lj7DwV982KPoM3khuhgabjNvcxndzkeQsxV3GQCIW74zG8fnva1
 XoxYm1fjkSfMwhRHIMQT4Ivgbg9mEYH8FxQPW2cc=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 18 Aug 2020 18:16:22 +0300
Message-Id: <20200818151634.14343-6-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:55:42 +0200
Subject: [OpenRISC] [PATCH v3 05/17] h8300, nds32,
 openrisc: simplify detection of memory extents
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKSW5zdGVhZCBvZiB0cmF2
ZXJzaW5nIG1lbWJsb2NrLm1lbW9yeSByZWdpb25zIHRvIGZpbmQgbWVtb3J5X3N0YXJ0IGFuZApt
ZW1vcnlfZW5kLCBzaW1wbHkgcXVlcnkgbWVtYmxvY2tfe3N0YXJ0LGVuZH1fb2ZfRFJBTSgpLgoK
U2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpBY2tlZC1i
eTogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Ci0tLQogYXJjaC9oODMwMC9rZXJu
ZWwvc2V0dXAuYyAgICB8IDggKysrLS0tLS0KIGFyY2gvbmRzMzIva2VybmVsL3NldHVwLmMgICAg
fCA4ICsrLS0tLS0tCiBhcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIHwgOSArKy0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9oODMwMC9rZXJuZWwvc2V0
dXAuYwppbmRleCAyOGFjODgzNThhODkuLjAyODFmOTJlZWEzZCAxMDA2NDQKLS0tIGEvYXJjaC9o
ODMwMC9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5jCkBAIC03
NCwxNyArNzQsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IGJvb3RtZW1faW5pdCh2b2lkKQogCW1l
bW9yeV9lbmQgPSBtZW1vcnlfc3RhcnQgPSAwOwogCiAJLyogRmluZCBtYWluIG1lbW9yeSB3aGVy
ZSBpcyB0aGUga2VybmVsICovCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsK
LQkJbWVtb3J5X3N0YXJ0ID0gcmVnaW9uLT5iYXNlOwotCQltZW1vcnlfZW5kID0gcmVnaW9uLT5i
YXNlICsgcmVnaW9uLT5zaXplOwotCX0KKwltZW1vcnlfc3RhcnQgPSBtZW1ibG9ja19zdGFydF9v
Zl9EUkFNKCk7CisJbWVtb3J5X2VuZCA9IG1lbWJsb2NrX2VuZF9vZl9EUkFNKCk7CiAKIAlpZiAo
IW1lbW9yeV9lbmQpCiAJCXBhbmljKCJObyBtZW1vcnkhIik7CiAKIAkvKiBzZXR1cCBib290bWVt
IGdsb2JhbHMgKHdlIHVzZSBub19ib290bWVtLCBidXQgbW0gc3RpbGwgZGVwZW5kcyBvbiB0aGlz
KSAqLwogCW1pbl9sb3dfcGZuID0gUEZOX1VQKG1lbW9yeV9zdGFydCk7Ci0JbWF4X2xvd19wZm4g
PSBQRk5fRE9XTihtZW1ibG9ja19lbmRfb2ZfRFJBTSgpKTsKKwltYXhfbG93X3BmbiA9IFBGTl9E
T1dOKG1lbW9yeV9lbmQpOwogCW1heF9wZm4gPSBtYXhfbG93X3BmbjsKIAogCW1lbWJsb2NrX3Jl
c2VydmUoX19wYShfc3RleHQpLCBfZW5kIC0gX3N0ZXh0KTsKZGlmZiAtLWdpdCBhL2FyY2gvbmRz
MzIva2VybmVsL3NldHVwLmMgYi9hcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jCmluZGV4IGEwNjZl
ZmJlNTNjMC4uYzM1NmU0ODRkY2FiIDEwMDY0NAotLS0gYS9hcmNoL25kczMyL2tlcm5lbC9zZXR1
cC5jCisrKyBiL2FyY2gvbmRzMzIva2VybmVsL3NldHVwLmMKQEAgLTI0OSwxMiArMjQ5LDggQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX21lbW9yeSh2b2lkKQogCW1lbW9yeV9lbmQgPSBtZW1v
cnlfc3RhcnQgPSAwOwogCiAJLyogRmluZCBtYWluIG1lbW9yeSB3aGVyZSBpcyB0aGUga2VybmVs
ICovCi0JZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWdpb24pIHsKLQkJbWVtb3J5X3N0YXJ0
ID0gcmVnaW9uLT5iYXNlOwotCQltZW1vcnlfZW5kID0gcmVnaW9uLT5iYXNlICsgcmVnaW9uLT5z
aXplOwotCQlwcl9pbmZvKCIlczogTWVtb3J5OiAweCV4LTB4JXhcbiIsIF9fZnVuY19fLAotCQkJ
bWVtb3J5X3N0YXJ0LCBtZW1vcnlfZW5kKTsKLQl9CisJbWVtb3J5X3N0YXJ0ID0gbWVtYmxvY2tf
c3RhcnRfb2ZfRFJBTSgpOworCW1lbW9yeV9lbmQgPSBtZW1ibG9ja19lbmRfb2ZfRFJBTSgpOwog
CiAJaWYgKCFtZW1vcnlfZW5kKSB7CiAJCXBhbmljKCJObyBtZW1vcnkhIik7CmRpZmYgLS1naXQg
YS9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0
dXAuYwppbmRleCBiMThlNzc1ZjhiZTMuLjVhNTk0MGY3ZWJiMSAxMDA2NDQKLS0tIGEvYXJjaC9v
cGVucmlzYy9rZXJuZWwvc2V0dXAuYworKysgYi9hcmNoL29wZW5yaXNjL2tlcm5lbC9zZXR1cC5j
CkBAIC00OCwxNyArNDgsMTIgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX21lbW9yeSh2b2lk
KQogCXVuc2lnbmVkIGxvbmcgcmFtX3N0YXJ0X3BmbjsKIAl1bnNpZ25lZCBsb25nIHJhbV9lbmRf
cGZuOwogCXBoeXNfYWRkcl90IG1lbW9yeV9zdGFydCwgbWVtb3J5X2VuZDsKLQlzdHJ1Y3QgbWVt
YmxvY2tfcmVnaW9uICpyZWdpb247CiAKIAltZW1vcnlfZW5kID0gbWVtb3J5X3N0YXJ0ID0gMDsK
IAogCS8qIEZpbmQgbWFpbiBtZW1vcnkgd2hlcmUgaXMgdGhlIGtlcm5lbCwgd2UgYXNzdW1lIGl0
cyB0aGUgb25seSBvbmUgKi8KLQlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZ2lvbikgewot
CQltZW1vcnlfc3RhcnQgPSByZWdpb24tPmJhc2U7Ci0JCW1lbW9yeV9lbmQgPSByZWdpb24tPmJh
c2UgKyByZWdpb24tPnNpemU7Ci0JCXByaW50ayhLRVJOX0lORk8gIiVzOiBNZW1vcnk6IDB4JXgt
MHgleFxuIiwgX19mdW5jX18sCi0JCSAgICAgICBtZW1vcnlfc3RhcnQsIG1lbW9yeV9lbmQpOwot
CX0KKwltZW1vcnlfc3RhcnQgPSBtZW1ibG9ja19zdGFydF9vZl9EUkFNKCk7CisJbWVtb3J5X2Vu
ZCA9IG1lbWJsb2NrX2VuZF9vZl9EUkFNKCk7CiAKIAlpZiAoIW1lbW9yeV9lbmQpIHsKIAkJcGFu
aWMoIk5vIG1lbW9yeSEiKTsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3Rz
LmxpYnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3Bl
bnJpc2MK

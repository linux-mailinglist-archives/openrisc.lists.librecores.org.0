Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 719B620DCDD
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:02 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 2151E20CAB;
	Mon, 29 Jun 2020 22:45:02 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 01F9120CAB
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 16:35:24 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D79F6218AC;
 Sat, 27 Jun 2020 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268522;
 bh=j94cy4Zc9VoAiVFldgIblMVG+C+RlEUAxelXYBM5V1E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ek8QEdXMUbv9KKSK2LO459tQ221aD0KjlKMk1ToADOdG/uJKMVv/jtHxcWdJhNcN8
 o2tkvKqcdxmxF97yGBYIjMzGcuUvsJiSUsavJlTRHEP3WjzNvHM9r2ZzK7wYmT6lf3
 hkjM8fAe/c2W6Sj9fa9FBRdCl4fvh7sbcdd3EiIg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 17:34:47 +0300
Message-Id: <20200627143453.31835-3-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: [OpenRISC] [PATCH 2/8] opeinrisc: switch to generic version of pte
 allocation
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKUmVwbGFjZSBwdGVfYWxs
b2Nfb25lKCksIHB0ZV9mcmVlKCkgYW5kIHB0ZV9mcmVlX2tlcm5lbCgpIHdpdGggdGhlIGdlbmVy
aWMKaW1wbGVtZW50YXRpb24uIFRoZSBvbmx5IGFjdHVhbCBmdW5jdGlvbmFsIGNoYW5nZSBpcyB0
aGUgYWRkaXRpb24gb2YKX19HRlBfQUNDT1VUIGZvciB0aGUgYWxsb2NhdGlvbiBvZiB0aGUgdXNl
ciBwYWdlIHRhYmxlcy4KClRoZSBwdGVfYWxsb2Nfb25lX2tlcm5lbCgpIGlzIGtlcHQgYmFjayBi
ZWNhdXNlIGl0cyBpbXBsZW1lbnRhdGlvbiBvbgpvcGVucmlzYyBpcyBkaWZmZXJlbnQgdGhhbiB0
aGUgZ2VuZXJpYyBvbmUuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+Ci0tLQogYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ2FsbG9jLmggfCAzMyAr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmggYi9hcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAppbmRl
eCBkYTEyYTRjMzhjNGIuLjg4ODIwMjk5ZWNjNCAxMDA2NDQKLS0tIGEvYXJjaC9vcGVucmlzYy9p
bmNsdWRlL2FzbS9wZ2FsbG9jLmgKKysrIGIvYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ2Fs
bG9jLmgKQEAgLTIwLDYgKzIwLDkgQEAKICNpbmNsdWRlIDxsaW51eC9tbS5oPgogI2luY2x1ZGUg
PGxpbnV4L21lbWJsb2NrLmg+CiAKKyNkZWZpbmUgX19IQVZFX0FSQ0hfUFRFX0FMTE9DX09ORV9L
RVJORUwKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZ2FsbG9jLmg+CisKIGV4dGVybiBpbnQgbWVt
X2luaXRfZG9uZTsKIAogI2RlZmluZSBwbWRfcG9wdWxhdGVfa2VybmVsKG1tLCBwbWQsIHB0ZSkg
XApAQCAtNjEsMzggKzY0LDggQEAgZXh0ZXJuIGlubGluZSBwZ2RfdCAqcGdkX2FsbG9jKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQogfQogI2VuZGlmCiAKLXN0YXRpYyBpbmxpbmUgdm9pZCBwZ2RfZnJl
ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcGdkX3QgKnBnZCkKLXsKLQlmcmVlX3BhZ2UoKHVuc2ln
bmVkIGxvbmcpcGdkKTsKLX0KLQogZXh0ZXJuIHB0ZV90ICpwdGVfYWxsb2Nfb25lX2tlcm5lbChz
dHJ1Y3QgbW1fc3RydWN0ICptbSk7CiAKLXN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKnB0ZV9h
bGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAqbW0pCi17Ci0Jc3RydWN0IHBhZ2UgKnB0ZTsKLQlw
dGUgPSBhbGxvY19wYWdlcyhHRlBfS0VSTkVMLCAwKTsKLQlpZiAoIXB0ZSkKLQkJcmV0dXJuIE5V
TEw7Ci0JY2xlYXJfcGFnZShwYWdlX2FkZHJlc3MocHRlKSk7Ci0JaWYgKCFwZ3RhYmxlX3B0ZV9w
YWdlX2N0b3IocHRlKSkgewotCQlfX2ZyZWVfcGFnZShwdGUpOwotCQlyZXR1cm4gTlVMTDsKLQl9
Ci0JcmV0dXJuIHB0ZTsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIHB0ZV9mcmVlX2tlcm5lbChz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgcHRlX3QgKnB0ZSkKLXsKLQlmcmVlX3BhZ2UoKHVuc2lnbmVk
IGxvbmcpcHRlKTsKLX0KLQotc3RhdGljIGlubGluZSB2b2lkIHB0ZV9mcmVlKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBzdHJ1Y3QgcGFnZSAqcHRlKQotewotCXBndGFibGVfcHRlX3BhZ2VfZHRvcihw
dGUpOwotCV9fZnJlZV9wYWdlKHB0ZSk7Ci19Ci0KICNkZWZpbmUgX19wdGVfZnJlZV90bGIodGxi
LCBwdGUsIGFkZHIpCVwKIGRvIHsJCQkJCVwKIAlwZ3RhYmxlX3B0ZV9wYWdlX2R0b3IocHRlKTsJ
XAotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVjb3Jlcy5vcmcK
aHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

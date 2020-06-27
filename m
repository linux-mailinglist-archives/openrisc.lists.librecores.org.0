Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3D020DCDE
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:03 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id EBEDA20D19;
	Mon, 29 Jun 2020 22:45:02 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 814AF20CB0
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 16:35:32 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5920C20885;
 Sat, 27 Jun 2020 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268531;
 bh=ug/zgldkEF9Y1EOWxCdQbFhq6W6AubLqDruRfdpZtCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kGeCaidImTPJgGt9S6wijt8HSPaAsXufRU8Bw3R+Jenx9IwSCz19tOS+s33DYy3Fd
 IcDlElpk6m8c8IYERIfYCh6px/euMBEW7PkfFZkG6NsKEPz+Lcoqc14NcBs88W/xGZ
 9cQUVwRq1YyhbGySMR8ZhKm3fhDosCXptMIYyEmY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 17:34:48 +0300
Message-Id: <20200627143453.31835-4-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: [OpenRISC] [PATCH 3/8] xtensa: switch to generic version of pte
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKeHRlbnNhIGNsZWFycyBQ
VEVzIGR1cmluZyBhbGxvY2F0aW9uIG9mIHRoZSBwYWdlIHRhYmxlcyBhbmQgcHRlX2NsZWFyKCkK
c2V0cyB0aGUgUFRFIHRvIGEgbm9uLXplcm8gdmFsdWUuIFNwbGl0dGluZyBwdGVzX2NsZWFyKCkg
aGVscGVyIG91dCBvZgpwdGVfYWxsb2Nfb25lKCkgYW5kIHB0ZV9hbGxvY19vbmVfa2VybmVsKCkg
YWxsb3dzIHJldXNlIG9mIGJhc2UgZ2VuZXJpYwphbGxvY2F0aW9uIG1ldGhvZHMgKF9fcHRlX2Fs
bG9jX29uZSgpIGFuZCBfX3B0ZV9hbGxvY19vbmVfa2VybmVsKCkpIGFuZCB0aGUKY29tbW9uIEdG
UCBtYXNrIGZvciBwYWdlIHRhYmxlIGFsbG9jYXRpb25zLgoKVGhlIHB0ZV9mcmVlKCkgYW5kIHB0
ZV9mcmVlX2tlcm5lbCgpIGltcGxlbWVudGF0aW9ucyBvbiB4dGVuc2EgYXJlCmlkZW50aWNhbCB0
byB0aGUgZ2VuZXJpYyBvbmVzIGFuZCBjYW4gYmUgZHJvcHBlZC4KClNpZ25lZC1vZmYtYnk6IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBhcmNoL3h0ZW5zYS9pbmNsdWRl
L2FzbS9wZ2FsbG9jLmggfCA0MSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC94dGVuc2EvaW5jbHVkZS9hc20vcGdhbGxvYy5oIGIvYXJjaC94dGVuc2EvaW5jbHVk
ZS9hc20vcGdhbGxvYy5oCmluZGV4IDFkMzhmMGU3NTViYS4uNjBlZTk0YjQyODUwIDEwMDY0NAot
LS0gYS9hcmNoL3h0ZW5zYS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKKysrIGIvYXJjaC94dGVuc2Ev
aW5jbHVkZS9hc20vcGdhbGxvYy5oCkBAIC04LDkgKzgsMTQgQEAKICNpZm5kZWYgX1hURU5TQV9Q
R0FMTE9DX0gKICNkZWZpbmUgX1hURU5TQV9QR0FMTE9DX0gKIAorI2lmZGVmIENPTkZJR19NTVUK
ICNpbmNsdWRlIDxsaW51eC9oaWdobWVtLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogCisj
ZGVmaW5lIF9fSEFWRV9BUkNIX1BURV9BTExPQ19PTkVfS0VSTkVMCisjZGVmaW5lIF9fSEFWRV9B
UkNIX1BURV9BTExPQ19PTkUKKyNpbmNsdWRlIDxhc20tZ2VuZXJpYy9wZ2FsbG9jLmg+CisKIC8q
CiAgKiBBbGxvY2F0aW5nIGFuZCBmcmVlaW5nIGEgcG1kIGlzIHRyaXZpYWw6IHRoZSAxLWVudHJ5
IHBtZCBpcwogICogaW5zaWRlIHRoZSBwZ2QsIHNvIGhhcyBubyBleHRyYSBtZW1vcnkgYXNzb2Np
YXRlZCB3aXRoIGl0LgpAQCAtMzMsNDUgKzM4LDM3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwZ2Rf
ZnJlZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcGdkX3QgKnBnZCkKIAlmcmVlX3BhZ2UoKHVuc2ln
bmVkIGxvbmcpcGdkKTsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIHB0ZXNfY2xlYXIocHRlX3Qg
KnB0ZXApCit7CisJaW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgUFRSU19QRVJfUFRFOyBpKysp
CisJCXB0ZV9jbGVhcihOVUxMLCAwLCBwdGVwICsgaSk7Cit9CisKIHN0YXRpYyBpbmxpbmUgcHRl
X3QgKnB0ZV9hbGxvY19vbmVfa2VybmVsKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogewogCXB0ZV90
ICpwdGVwOwotCWludCBpOwogCi0JcHRlcCA9IChwdGVfdCAqKV9fZ2V0X2ZyZWVfcGFnZShHRlBf
S0VSTkVMKTsKKwlwdGVwID0gKHB0ZV90ICopX19wdGVfYWxsb2Nfb25lX2tlcm5lbChtbSk7CiAJ
aWYgKCFwdGVwKQogCQlyZXR1cm4gTlVMTDsKLQlmb3IgKGkgPSAwOyBpIDwgMTAyNDsgaSsrKQot
CQlwdGVfY2xlYXIoTlVMTCwgMCwgcHRlcCArIGkpOworCXB0ZXNfY2xlYXIocHRlcCk7CiAJcmV0
dXJuIHB0ZXA7CiB9CiAKIHN0YXRpYyBpbmxpbmUgcGd0YWJsZV90IHB0ZV9hbGxvY19vbmUoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCiB7Ci0JcHRlX3QgKnB0ZTsKIAlzdHJ1Y3QgcGFnZSAqcGFnZTsK
IAotCXB0ZSA9IHB0ZV9hbGxvY19vbmVfa2VybmVsKG1tKTsKLQlpZiAoIXB0ZSkKLQkJcmV0dXJu
IE5VTEw7Ci0JcGFnZSA9IHZpcnRfdG9fcGFnZShwdGUpOwotCWlmICghcGd0YWJsZV9wdGVfcGFn
ZV9jdG9yKHBhZ2UpKSB7Ci0JCV9fZnJlZV9wYWdlKHBhZ2UpOworCXBhZ2UgPSBfX3B0ZV9hbGxv
Y19vbmUobW0sIEdGUF9QR1RBQkxFX1VTRVIpOworCWlmICghcGFnZSkKIAkJcmV0dXJuIE5VTEw7
Ci0JfQorCXB0ZXNfY2xlYXIocGFnZV9hZGRyZXNzKHBhZ2UpKTsKIAlyZXR1cm4gcGFnZTsKIH0K
IAotc3RhdGljIGlubGluZSB2b2lkIHB0ZV9mcmVlX2tlcm5lbChzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwgcHRlX3QgKnB0ZSkKLXsKLQlmcmVlX3BhZ2UoKHVuc2lnbmVkIGxvbmcpcHRlKTsKLX0KLQot
c3RhdGljIGlubGluZSB2b2lkIHB0ZV9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwZ3RhYmxl
X3QgcHRlKQotewotCXBndGFibGVfcHRlX3BhZ2VfZHRvcihwdGUpOwotCV9fZnJlZV9wYWdlKHB0
ZSk7Ci19CiAjZGVmaW5lIHBtZF9wZ3RhYmxlKHBtZCkgcG1kX3BhZ2UocG1kKQorI2VuZGlmIENP
TkZJR19NTVUKIAogI2VuZGlmIC8qIF9YVEVOU0FfUEdBTExPQ19IICovCi0tIAoyLjI2LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1h
aWxpbmcgbGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxp
YnJlY29yZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

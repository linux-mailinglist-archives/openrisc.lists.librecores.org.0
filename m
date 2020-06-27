Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4278F20DCE2
	for <lists+openrisc@lfdr.de>; Mon, 29 Jun 2020 22:45:06 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D8D1120D25;
	Mon, 29 Jun 2020 22:45:05 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 7DCD320CBC
 for <openrisc@lists.librecores.org>; Sat, 27 Jun 2020 16:36:06 +0200 (CEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A0EC207FC;
 Sat, 27 Jun 2020 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593268565;
 bh=c/eMZI3jQgAi5SoZSPf0xO2BFRL8cRrF8f5daihy1NY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tavnjC0OxMDJoIlyDxFikqduze2IUaa0AgGq0rxYqYJlFONRgjoXyQz2IHmDHLbJ9
 BzFf/ighE7YqPkBb3l3Iq1iklT/uak8w0WeCI9qhOuodXq20/x69FsxHo0DOq6l+eS
 UkDvWiqOG/pqcuds69Lm/5lx91K+fpPqfOXqoW7s=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Date: Sat, 27 Jun 2020 17:34:52 +0300
Message-Id: <20200627143453.31835-8-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200627143453.31835-1-rppt@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jun 2020 22:44:54 +0200
Subject: [OpenRISC] [PATCH 7/8] mm: move lib/ioremap.c to mm/
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKVGhlIGZ1bmN0aW9uYWxp
dHkgaW4gbGliL2lvcmVtYXAuYyBkZWFscyB3aXRoIHBhZ2V0YWJsZXMsIHZtYWxsb2MgYW5kCmNh
Y2hlcywgc28gaXQgbmF0dXJhbGx5IGJlbG9uZ3MgdG8gbW0vCk1vdmluZyBpdCB0aGVyZSB3aWxs
IGFsc28gYWxsb3cgZGVjbGFyaW5nIHA/ZF9hbGxvY190cmFjayBmdW5jdGlvbnMgaW4gYW4KaGVh
ZGVyIGZpbGUgaW5zaWRlIG1tLyByYXRoZXIgdGhhbiBoYXZpbmcgdGhvc2UgZGVjbGFyYXRpb25z
IGluCmluY2x1ZGUvbGludXgvbW0uaAoKU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+Ci0tLQogbGliL01ha2VmaWxlICAgICAgICAgIHwgMSAtCiBtbS9NYWtl
ZmlsZSAgICAgICAgICAgfCAyICstCiB7bGliID0+IG1tfS9pb3JlbWFwLmMgfCAwCiAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIHtsaWIgPT4g
bW19L2lvcmVtYXAuYyAoMTAwJSkKCmRpZmYgLS1naXQgYS9saWIvTWFrZWZpbGUgYi9saWIvTWFr
ZWZpbGUKaW5kZXggYjFjNDJjMTAwNzNiLi41ZjkzODRhZGRlOWMgMTAwNjQ0Ci0tLSBhL2xpYi9N
YWtlZmlsZQorKysgYi9saWIvTWFrZWZpbGUKQEAgLTM3LDcgKzM3LDYgQEAgbGliLXkgOj0gY3R5
cGUubyBzdHJpbmcubyB2c3ByaW50Zi5vIGNtZGxpbmUubyBcCiAJIG5taV9iYWNrdHJhY2UubyBu
b2RlbWFzay5vIHdpbl9taW5tYXgubyBtZW1jYXRfcC5vCiAKIGxpYi0kKENPTkZJR19QUklOVEsp
ICs9IGR1bXBfc3RhY2subwotbGliLSQoQ09ORklHX01NVSkgKz0gaW9yZW1hcC5vCiBsaWItJChD
T05GSUdfU01QKSArPSBjcHVtYXNrLm8KIAogbGliLXkJKz0ga29iamVjdC5vIGtsaXN0Lm8KZGlm
ZiAtLWdpdCBhL21tL01ha2VmaWxlIGIvbW0vTWFrZWZpbGUKaW5kZXggNmU5ZDQ2YjJlZmM5Li5k
NTY0OWYxYzEyYzAgMTAwNjQ0Ci0tLSBhL21tL01ha2VmaWxlCisrKyBiL21tL01ha2VmaWxlCkBA
IC0zOCw3ICszOCw3IEBAIG1tdS15CQkJOj0gbm9tbXUubwogbW11LSQoQ09ORklHX01NVSkJOj0g
aGlnaG1lbS5vIG1lbW9yeS5vIG1pbmNvcmUubyBcCiAJCQkgICBtbG9jay5vIG1tYXAubyBtbXVf
Z2F0aGVyLm8gbXByb3RlY3QubyBtcmVtYXAubyBcCiAJCQkgICBtc3luYy5vIHBhZ2Vfdm1hX21h
cHBlZC5vIHBhZ2V3YWxrLm8gXAotCQkJICAgcGd0YWJsZS1nZW5lcmljLm8gcm1hcC5vIHZtYWxs
b2MubworCQkJICAgcGd0YWJsZS1nZW5lcmljLm8gcm1hcC5vIHZtYWxsb2MubyBpb3JlbWFwLm8K
IAogCiBpZmRlZiBDT05GSUdfQ1JPU1NfTUVNT1JZX0FUVEFDSApkaWZmIC0tZ2l0IGEvbGliL2lv
cmVtYXAuYyBiL21tL2lvcmVtYXAuYwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20g
bGliL2lvcmVtYXAuYwpyZW5hbWUgdG8gbW0vaW9yZW1hcC5jCi0tIAoyLjI2LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk9wZW5SSVNDIG1haWxpbmcg
bGlzdApPcGVuUklTQ0BsaXN0cy5saWJyZWNvcmVzLm9yZwpodHRwczovL2xpc3RzLmxpYnJlY29y
ZXMub3JnL2xpc3RpbmZvL29wZW5yaXNjCg==

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD16369B4C
	for <lists+openrisc@lfdr.de>; Fri, 23 Apr 2021 22:30:07 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id BA39421016;
	Fri, 23 Apr 2021 22:30:06 +0200 (CEST)
Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr
 [80.12.242.126])
 by mail.librecores.org (Postfix) with ESMTPS id 836732134C
 for <openrisc@lists.librecores.org>; Fri, 23 Apr 2021 17:09:32 +0200 (CEST)
Received: from localhost.localdomain ([86.243.172.93]) by mwinf5d51 with ME
 id wF9W2400q21Fzsu03F9X4c; Fri, 23 Apr 2021 17:09:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 23 Apr 2021 17:09:32 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 rppt@kernel.org, akpm@linux-foundation.org, arnd@arndb.de
Date: Fri, 23 Apr 2021 17:09:28 +0200
Message-Id: <c078439e31fd60e1617be8c17cc1ec57639e0586.1619190470.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Apr 2021 22:30:04 +0200
Subject: [OpenRISC] [PATCH] openrisc: Fix a memory leak
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 openrisc@lists.librecores.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

J3NldHVwX2ZpbmRfY3B1X25vZGUoKScgdGFrZSBhIHJlZmVyZW5jZSBvbiB0aGUgbm9kZSBpdCBy
ZXR1cm5zLgpUaGlzIHJlZmVyZW5jZSBtdXN0IGJlIGRlY3JlbWVudGVkIHdoZW4gbm90IG5lZWRl
ZCBhbnltb3JlLCBvciB0aGVyZSB3aWxsCmJlIGEgbGVhay4KCkFkZCB0aGUgbWlzc2luZyAnb2Zf
bm9kZV9wdXQoY3B1KScuCgpOb3RlIHRoYXQgJ3NldHVwX2NwdWluZm8oKScgdGhhdCBhbHNvIGNh
bGxzIHRoaXMgZnVuY3Rpb24gYWxyZWFkeSBoYXMgYQpjb3JyZWN0ICdvZl9ub2RlX3B1dChjcHUp
JyBhdCBpdHMgZW5kLgoKRml4ZXM6IDlkMDJhNDI4M2U5YyAoIk9wZW5SSVNDOiBCb290IGNvZGUi
KQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3
YW5hZG9vLmZyPgotLS0KIGFyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9r
ZXJuZWwvc2V0dXAuYyBiL2FyY2gvb3BlbnJpc2Mva2VybmVsL3NldHVwLmMKaW5kZXggMjQxNmE5
ZjkxNTMzLi5jNmY5ZTdiOWY3Y2IgMTAwNjQ0Ci0tLSBhL2FyY2gvb3BlbnJpc2Mva2VybmVsL3Nl
dHVwLmMKKysrIGIvYXJjaC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYwpAQCAtMjc4LDYgKzI3OCw4
IEBAIHZvaWQgY2FsaWJyYXRlX2RlbGF5KHZvaWQpCiAJcHJfY29udCgiJWx1LiUwMmx1IEJvZ29N
SVBTIChscGo9JWx1KVxuIiwKIAkJbG9vcHNfcGVyX2ppZmZ5IC8gKDUwMDAwMCAvIEhaKSwKIAkJ
KGxvb3BzX3Blcl9qaWZmeSAvICg1MDAwIC8gSFopKSAlIDEwMCwgbG9vcHNfcGVyX2ppZmZ5KTsK
KworCW9mX25vZGVfcHV0KGNwdSk7CiB9CiAKIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAq
KmNtZGxpbmVfcCkKLS0gCjIuMjcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJl
Y29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

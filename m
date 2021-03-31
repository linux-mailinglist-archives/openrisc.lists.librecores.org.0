Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id E43AB351492
	for <lists+openrisc@lfdr.de>; Thu,  1 Apr 2021 13:44:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 01274212A9;
	Thu,  1 Apr 2021 13:44:33 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6F0C9212C2
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 16:32:49 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6931060FF3;
 Wed, 31 Mar 2021 14:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201168;
 bh=sUpQ42V7/BeYJXo8xKilrJhdJzUrsLncMVt8E/NbmTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GCVYBSdWsYiqvYH5oYGVId4/MzMe7NvqmPl9pDexAmFGD5cqNZXH9o4HF+vhiGkPO
 8FwMZKnRdTNt/mGm5FdZTRJq1SejRG6Dxn8BSX9Q9sF8/FJERgS/Joq1pLuXw/+SpX
 fYWvWFagOvEbTBlo/Pm13nwT+dH76caJG6x5oxHY56TU/7XMud7W4lSCBA+Ztvbs94
 c0JgeKblXHOXlNsS4FEsCYE4cla47L5ne5HZ+MMUdf+o+9w1vaKOmt595yXPl7W+Hh
 KH/sOLUZchvSdfTn72MXz6kpPr/LWwx757q1Byt0vVOGqX8v9929SUwkrE66Ui0awe
 zbLNNqBSjJGpA==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Wed, 31 Mar 2021 14:30:39 +0000
Message-Id: <1617201040-83905-9-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Thu, 01 Apr 2021 13:44:26 +0200
Subject: [OpenRISC] [PATCH v6 8/9] xtensa: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: openrisc-bounces@lists.librecores.org
Sender: "OpenRISC" <openrisc-bounces@lists.librecores.org>

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKV2UgZG9uJ3QgaGF2ZSBu
YXRpdmUgaHcgeGNoZzE2IGluc3RydWN0aW9uLCBzbyBsZXQgcXNwaW5sb2NrCmdlbmVyaWMgY29k
ZSB0byBkZWFsIHdpdGggaXQuCgpVc2luZyB0aGUgZnVsbC13b3JkIGF0b21pYyB4Y2hnIGluc3Ry
dWN0aW9ucyBpbXBsZW1lbnQgeGNoZzE2IGhhcwp0aGUgc2VtYW50aWMgcmlzayBmb3IgYXRvbWlj
IG9wZXJhdGlvbnMuCgpUaGlzIHBhdGNoIGNhbmNlbHMgdGhlIGRlcGVuZGVuY3kgb2Ygb24gcXNw
aW5sb2NrIGdlbmVyaWMgY29kZSBvbgphcmNoaXRlY3R1cmUncyB4Y2hnMTYuCgpTaWduZWQtb2Zm
LWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+CkNjOiBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPgpDYzogQ2hyaXMgWmFua2VsIDxjaHJpc0B6YW5rZWwubmV0PgpDYzog
TWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+Ci0tLQogYXJjaC94dGVuc2EvS2NvbmZp
ZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94dGVuc2EvS2NvbmZpZyBiL2FyY2gveHRlbnNhL0tjb25maWcKaW5kZXggOWFkNmI3YjgyNzA3
Li5mMTlkNzgwNjM4ZjcgMTAwNjQ0Ci0tLSBhL2FyY2gveHRlbnNhL0tjb25maWcKKysrIGIvYXJj
aC94dGVuc2EvS2NvbmZpZwpAQCAtOSw2ICs5LDcgQEAgY29uZmlnIFhURU5TQQogCXNlbGVjdCBB
UkNIX0hBU19ETUFfU0VUX1VOQ0FDSEVEIGlmIE1NVQogCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURf
UldMT0NLUwogCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCisJc2VsZWN0IEFSQ0hf
VVNFX1FVRVVFRF9TUElOTE9DS1NfWENIRzMyCiAJc2VsZWN0IEFSQ0hfV0FOVF9GUkFNRV9QT0lO
VEVSUwogCXNlbGVjdCBBUkNIX1dBTlRfSVBDX1BBUlNFX1ZFUlNJT04KIAlzZWxlY3QgQlVJTERU
SU1FX1RBQkxFX1NPUlQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KT3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxp
YnJlY29yZXMub3JnCmh0dHBzOi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJp
c2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 1C29734BF37
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:15:01 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 06CA12128C;
	Sun, 28 Mar 2021 23:14:58 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6558D212B1
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 08:31:43 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4715619A0;
 Sun, 28 Mar 2021 06:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913102;
 bh=sUpQ42V7/BeYJXo8xKilrJhdJzUrsLncMVt8E/NbmTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K1i+Vgp+d0Nt/rDzju12lI4q66EYLkSy5JZ076QiXlZZAxL4Zz1kplBNEVKnDnzeL
 XUtkjJuzzqCLW32Oy7ysq/RMmkHMZuPYez5Wyxk2SMMxQoDGAf6hQweBSn8yFBqUCW
 ilcp7x5OfSZ83pAAh9tjiC72g4z2cXm2BDzOz97kdkTOZQbGOFPWZ2VNnDrQitQwTS
 PSxomOd2/RHIlHwBLl4fVNVs7Ua1PUFN+gK1ipO1IHCQiFh6FVawbp4ISyuFZ29+sQ
 ZJw6ShzgANhvydDXfVdd/XWVF3Es2P54W9xEgMHObmbb/odl0xgFm9ORAQlNoAWC4v
 O2brtoUrLFkBQ==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Sun, 28 Mar 2021 06:30:28 +0000
Message-Id: <1616913028-83376-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Sun, 28 Mar 2021 23:14:51 +0200
Subject: [OpenRISC] [PATCH v5 7/7] xtensa: qspinlock: Add
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

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8DD351491
	for <lists+openrisc@lfdr.de>; Thu,  1 Apr 2021 13:44:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 276D521258;
	Thu,  1 Apr 2021 13:44:32 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 610B2212C1
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 16:32:41 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 717C960FF1;
 Wed, 31 Mar 2021 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201160;
 bh=O2KxmIPB+fHLZecH69jIXhtq++wb564lj/icyjeUAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MuD7utNvxc71QnlLEo6eyoz8UG0sDZiPBtJt3hag6/s4X/dkfRLDhQ5OqJXJFt+j6
 9qXx33FPUmx3G35TT6KpggWZk8CzgnRPRkmBuxb41XLDNB+DLsaZLfn7okWhGAP/fd
 XIcnJzsaYKQDC+07SeSrpysX9+39Fr229UOr1ud5VmRf3ZrA9MM7B1eQrw7Q9Xqnw1
 QLPvIZ3ogIZFd7LK13OYk2vgisiZmroVX6LOouaaODc0ya16hQUPWrUf3ielzPGQMu
 g+xqdXQe1Wujk2SS7zfx9ORiUOU/DX/5BKyLBaTlndIEiV02In4jpH7PAyTKRovgEx
 KBwMY3BPTvyjg==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Wed, 31 Mar 2021 14:30:38 +0000
Message-Id: <1617201040-83905-8-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Thu, 01 Apr 2021 13:44:25 +0200
Subject: [OpenRISC] [PATCH v6 7/9] sparc: qspinlock: Add
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
 Rob Gardner <rob.gardner@oracle.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
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
IDxhcm5kQGFybmRiLmRlPgpDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0
PgpDYzogUm9iIEdhcmRuZXIgPHJvYi5nYXJkbmVyQG9yYWNsZS5jb20+Ci0tLQogYXJjaC9zcGFy
Yy9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3NwYXJjL0tjb25maWcgYi9hcmNoL3NwYXJjL0tjb25maWcKaW5kZXggMTY0YTUy
NTRjOTFjLi4xMDc5ZmUzZjA1OGMgMTAwNjQ0Ci0tLSBhL2FyY2gvc3BhcmMvS2NvbmZpZworKysg
Yi9hcmNoL3NwYXJjL0tjb25maWcKQEAgLTkxLDYgKzkxLDcgQEAgY29uZmlnIFNQQVJDNjQKIAlz
ZWxlY3QgSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJCiAJc2VsZWN0IEFSQ0hfVVNFX1FV
RVVFRF9SV0xPQ0tTCiAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1MKKwlzZWxlY3Qg
QVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLU19YQ0hHMzIKIAlzZWxlY3QgR0VORVJJQ19USU1FX1ZT
WVNDQUxMCiAJc2VsZWN0IEFSQ0hfQ0xPQ0tTT1VSQ0VfREFUQQogCXNlbGVjdCBBUkNIX0hBU19Q
VEVfU1BFQ0lBTAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpPcGVuUklTQyBtYWlsaW5nIGxpc3QKT3BlblJJU0NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKaHR0cHM6Ly9saXN0cy5saWJyZWNvcmVzLm9yZy9saXN0aW5mby9vcGVucmlzYwo=

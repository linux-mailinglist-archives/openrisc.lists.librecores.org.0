Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF5D34BF34
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:15:00 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id 27D08212C3;
	Sun, 28 Mar 2021 23:14:57 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 6D3F7212B8
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 08:31:40 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFCCB61999;
 Sun, 28 Mar 2021 06:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913099;
 bh=O2KxmIPB+fHLZecH69jIXhtq++wb564lj/icyjeUAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RIkij08xlS8DB8+yEsaHfhkJ4frVk8aqcXZKUjc8aZRsRg14dDqPdSr8TSjbqYWar
 YZa7xXiDmepsbU0aY2OQB+g9ZqgA6O0epYM/s/Lq/CGXTTUZR/qeGjvktEkSawSenY
 6uspD6vEI92SJzbXoQjxXYH9frX6UTrSuMhM5XRheYpddQnE2p8LoyPEDQ5x0vhDc+
 aPIyENu/RTIQJgeveEE/LmORCiHcAjMknUD4XEEpdndhKUefcId80TspfCdlvafStJ
 6CIxmOlQadSXN+7398RrpGZOq23MCSKdY+hW6nlsOKJHvtdBV75Hz84ouhtYXGQH+u
 8EGq83B9rHGOg==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Sun, 28 Mar 2021 06:30:27 +0000
Message-Id: <1616913028-83376-7-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Sun, 28 Mar 2021 23:14:51 +0200
Subject: [OpenRISC] [PATCH v5 6/7] sparc: qspinlock: Add
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

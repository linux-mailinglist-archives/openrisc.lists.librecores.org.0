Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id C93B834BF33
	for <lists+openrisc@lfdr.de>; Sun, 28 Mar 2021 23:14:59 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id D286920E5D;
	Sun, 28 Mar 2021 23:14:55 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 77A8C212B7
 for <openrisc@lists.librecores.org>; Sun, 28 Mar 2021 08:31:37 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9D806197C;
 Sun, 28 Mar 2021 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913096;
 bh=Bg9d2w1WAX5KFLAnbnlQNHWx+c16ctVJTJF6+EgKbfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wf0uvxCQIWoezH2Q//Fy+0JLf/n/JQM1fgGTIy+LNlK2ke3/GfMHR3INbhImyBKub
 PYoWfqkNgd/16507YS2V+9oXcBGnlB31xMCYPq4i/42w/2S/VMWUBfiWhHpcJilL8F
 3Ug35ynRWtusIYmXztSQi1aR21Tlyp2sgtUPmJYRmC8gtc/K5PXnkUmkkt1jKh3C9F
 TyjzDm/lKbQBpjG+hHUIJbOwh7gFQOtovJe5DUrQIogSJfInGNEiZgiDba+jknWCpx
 2kwyOHYg5WsCDiNR70IA5XNcpFv4vfIXOBFYCliK9/b+BMC46SrVQb0cTyEhy0/v1K
 h7HNGGnm6y0Eg==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Sun, 28 Mar 2021 06:30:26 +0000
Message-Id: <1616913028-83376-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Sun, 28 Mar 2021 23:14:51 +0200
Subject: [OpenRISC] [PATCH v5 5/7] openrisc: qspinlock: Add
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
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Jonas Bonn <jonas@southpole.se>
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
IDxhcm5kQGFybmRiLmRlPgpDYzogSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgpDYzog
U3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgpD
YzogU3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+CkNjOiBvcGVucmlzY0BsaXN0cy5s
aWJyZWNvcmVzLm9yZwotLS0KIGFyY2gvb3BlbnJpc2MvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9vcGVucmlzYy9LY29uZmln
IGIvYXJjaC9vcGVucmlzYy9LY29uZmlnCmluZGV4IDU5MWFjYzU5OTBkYy4uYjI5OWU0MDk0Mjlm
IDEwMDY0NAotLS0gYS9hcmNoL29wZW5yaXNjL0tjb25maWcKKysrIGIvYXJjaC9vcGVucmlzYy9L
Y29uZmlnCkBAIC0zMyw2ICszMyw3IEBAIGNvbmZpZyBPUEVOUklTQwogCXNlbGVjdCBPUjFLX1BJ
QwogCXNlbGVjdCBDUFVfTk9fRUZGSUNJRU5UX0ZGUyBpZiAhT1BFTlJJU0NfSEFWRV9JTlNUX0ZG
MQogCXNlbGVjdCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTCisJc2VsZWN0IEFSQ0hfVVNFX1FV
RVVFRF9TUElOTE9DS1NfWENIRzMyCiAJc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9SV0xPQ0tTCiAJ
c2VsZWN0IE9NUElDIGlmIFNNUAogCXNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
T3BlblJJU0MgbWFpbGluZyBsaXN0Ck9wZW5SSVNDQGxpc3RzLmxpYnJlY29yZXMub3JnCmh0dHBz
Oi8vbGlzdHMubGlicmVjb3Jlcy5vcmcvbGlzdGluZm8vb3BlbnJpc2MK

Return-Path: <openrisc-bounces@lists.librecores.org>
X-Original-To: lists+openrisc@lfdr.de
Delivered-To: lists+openrisc@lfdr.de
Received: from mail.librecores.org (lists.librecores.org [88.198.125.70])
	by mail.lfdr.de (Postfix) with ESMTP id 192CA351490
	for <lists+openrisc@lfdr.de>; Thu,  1 Apr 2021 13:44:34 +0200 (CEST)
Received: from [172.31.1.100] (localhost.localdomain [127.0.0.1])
	by mail.librecores.org (Postfix) with ESMTP id DD868211BD;
	Thu,  1 Apr 2021 13:44:30 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mail.librecores.org (Postfix) with ESMTPS id 66779212C0
 for <openrisc@lists.librecores.org>; Wed, 31 Mar 2021 16:32:35 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F357360FF2;
 Wed, 31 Mar 2021 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201154;
 bh=Bg9d2w1WAX5KFLAnbnlQNHWx+c16ctVJTJF6+EgKbfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LrjZ3mx3DLcCEGgombkpOj7HEDG+16RbX7GCxzDylhP8guFWgsFJW1a+vbFusHAdY
 94Qc8qxXh1EaoulNdS9TWbco1PP6GmCZIt2L23pL/QOBIPRyX63GfvbDQ+9NaIDf0j
 cyaxT3exYFQgKDTOgB0wOKQGlgVON8y1piXQwNdT3csJ3MSJFjc5fe9PkswGDii/sd
 eJPqX6kMGOlpOMDJKTbaueqCpyqN6Hisbv6i7VqbZryJVEehQnqSDloumLXlFCearb
 3+InC8R0ziS9cAAyzyzC3f0cJufK7mNuBaiq4wARKob/aEo8zMPVAZ5gZ+eiaTG+y6
 vnrem6tzkauzg==
From: guoren@kernel.org
To: guoren@kernel.org
Date: Wed, 31 Mar 2021 14:30:37 +0000
Message-Id: <1617201040-83905-7-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailman-Approved-At: Thu, 01 Apr 2021 13:44:25 +0200
Subject: [OpenRISC] [PATCH v6 6/9] openrisc: qspinlock: Add
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
